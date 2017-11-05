# docker image for pinpoint agent
# VERSION 0.0.1
# Author: bolingcavalry

#基础镜像
FROM tomcat:7.0.77-jre8

#作者
MAINTAINER BolingCavalry <zq2599@gmail.com>

#定义工作目录
ENV WORK_PATH /usr/local/tomcat/conf

#定义catalina.sh文件目录
ENV CATALINA_PATH /usr/local/tomcat/bin

#定义agent工作目录
ENV AGENT_WORK_PATH /usr/local/work

#定义agent文件夹名称
ENV AGENT_PACKAGE_NAME pinpoint-agent-1.6.3

#定义要替换的文件名
ENV USER_CONF_FILE_NAME tomcat-users.xml

#定义要替换的server.xml文件名
ENV SERVER_CONF_FILE_NAME server.xml

#定义要替换的catalina.sh文件名
ENV CATALINA_FILE_NAME catalina.sh

#删除原文件tomcat-users.xml
RUN rm $WORK_PATH/$USER_CONF_FILE_NAME

#复制文件tomcat-users.xml
COPY  ./$USER_CONF_FILE_NAME $WORK_PATH/

#删除原文件server.xml
RUN rm $WORK_PATH/$SERVER_CONF_FILE_NAME

#复制文件server.xml
COPY  ./$SERVER_CONF_FILE_NAME $WORK_PATH/

#删除原文件catalina.sh
RUN rm $CATALINA_PATH/$CATALINA_FILE_NAME

#复制文件catalina.sh
COPY  ./$CATALINA_FILE_NAME $CATALINA_PATH/

#创建agent文件所在目录
RUN mkdir $AGENT_WORK_PATH

#把collector文件夹复制到工作目录
COPY ./$AGENT_PACKAGE_NAME $AGENT_WORK_PATH/$AGENT_PACKAGE_NAME



