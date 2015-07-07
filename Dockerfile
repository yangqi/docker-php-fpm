#
# PHP-FPM Dockerfile
#
# https://github.com/yangqi/docker-php-fpm
#

# Pull base image.
FROM yangqi/docker-debian
MAINTAINER Qi Yang <i@yangqi.me>

ENV DEBIAN_FRONTEND noninteractive

# Install PHP and PHP-FPM.
RUN \
  apt-get update && \
  apt-get install -y php5 php5-fpm && \
  apt-get clean && \
  mkdir /var/log/php-fpm

ADD php-fpm.conf /etc/php5/fpm/php-fpm.conf
ADD www.conf /etc/php5/fpm/pool.d/www.conf

# Define default command.
CMD ["php5-fpm"]

EXPOSE 9000
