Return-Path: <sebmennetrier@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 19ACD6CEEA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 13:16:59 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id en1so4734853wid.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2013 05:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=DMLeyiHsWV+RqkZBoK8wjsCMdmg9Z0CjHVrJDXtsqpg=;
	b=epBuZZCvpzi6IfLbLbXgTlUli5Ycsm2AsnzJL2Yt64ldjPk5wqEOvGyT3eAwmyG4NI
	hsp6LQ6hj0G17Ek/XFeUgn738LiPvwFEt5IIJhT8y4/L/O7vdRDOmb1ZwdgCoopkq4pr
	n0/DLEH9wlbf/+3Z4F7ClcRnZ402Rt4ED7iCMdV3/MuW+b4A6Kqy96NKEScBv+BtVyT1
	/Dip6y8J0c/Ykxss4XJW1+4Ti5bWABUGCUsAV95/aF1rm7PCBwoA7ODq/BAwYdJODhd3
	iSAqM1MkjAQyQcTMSZlzgpdUKJ1JyPrdyi+DMEz2A1A/eNa9/NJRFcsfTXJcO5R5jrjn
	EohQ==
X-Received: by 10.180.189.80 with SMTP id gg16mr18032688wic.32.1385990218940; 
	Mon, 02 Dec 2013 05:16:58 -0800 (PST)
Received: from smennetrier-desktop.mpl.mstarsemi.fr ([94.103.137.126])
	by mx.google.com with ESMTPSA id
	uc18sm83439310wib.11.2013.12.02.05.16.57 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 02 Dec 2013 05:16:58 -0800 (PST)
Sender: Sebastien MENNETRIER <sebmennetrier@gmail.com>
From: =?UTF-8?q?S=C3=A9bastien=20Mennetrier?= <s.mennetrier@innotis.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2013 14:16:22 +0100
Message-Id: <1385990182-8215-1-git-send-email-s.mennetrier@innotis.org>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [meta-webserver][PATCH] Add nginx http webserver
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Dec 2013 13:17:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sébastien <s.mennetrier@innotis.org>

---
 meta-webserver/recipes-httpd/nginx/files/init      |  59 ++++++
 .../nginx/files/nginx-cross_1.4.4.diff             | 212 +++++++++++++++++++++
 .../recipes-httpd/nginx/files/nginx-volatile.conf  |   2 +
 .../recipes-httpd/nginx/files/nginx.conf           | 120 ++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb  | 101 ++++++++++
 5 files changed, 494 insertions(+)
 create mode 100755 meta-webserver/recipes-httpd/nginx/files/init
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/nginx-cross_1.4.4.diff
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/nginx-volatile.conf
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/nginx.conf
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb

diff --git a/meta-webserver/recipes-httpd/nginx/files/init b/meta-webserver/recipes-httpd/nginx/files/init
new file mode 100755
index 0000000..3278842
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/init
@@ -0,0 +1,59 @@
+#! /bin/sh
+### BEGIN INIT INFO
+# Provides: httpd
+# Required-Start: $local_fs $remote_fs $network $named
+# Required-Stop: $local_fs $remote_fs $network
+# Short-Description: start and stop nginx HTTP Server
+# Description: The nginx (spelled ``engine x'') is an HTTP
+#  and reverse proxy server, as well as a mail proxy server.
+### END INIT INFO
+
+DAEMON=/usr/sbin/nginx
+NAME=nginx
+PID=/run/nginx/nginx.pid
+
+test -x $DAEMON || exit 0
+
+# Include nginx defaults if available
+if [ -f /etc/default/nginx ] ; then
+        . /etc/default/nginx
+fi
+
+set -e
+
+case "$1" in
+  start)
+        echo -n "Starting $NAME: "
+        start-stop-daemon --start --quiet --pidfile $PID \
+                --name $NAME --exec $DAEMON -- $DAEMON_OPTS
+        echo "$NAME."
+        ;;
+  stop)
+        echo -n "Stopping $NAME: "
+        start-stop-daemon -K --quiet --pidfile $PID \
+                --name $NAME
+        echo "$NAME."
+        ;;
+  restart|force-reload)
+        echo -n "Restarting $NAME: "
+        start-stop-daemon -K --quiet --pidfile $PID \
+                --name $NAME
+        sleep 1
+        start-stop-daemon --start --quiet --pidfile $PID \
+                --name $NAME --exec $DAEMON -- $DAEMON_OPTS
+        echo "$NAME."
+        ;;
+  reload)
+      echo -n "Reloading $NAME configuration: "
+      start-stop-daemon --stop --signal HUP --quiet --pidfile $PID \
+          --exec $DAEMON
+      echo "$NAME."
+      ;;
+  *)
+        N=/etc/init.d/$NAME
+        echo "Usage: $N {start|stop|restart|force-reload}" >&2
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx-cross_1.4.4.diff b/meta-webserver/recipes-httpd/nginx/files/nginx-cross_1.4.4.diff
new file mode 100644
index 0000000..2b2bab9
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx-cross_1.4.4.diff
@@ -0,0 +1,212 @@
+diff -uraN nginx-1.0.11.orig/auto/feature nginx-1.0.11/auto/feature
+--- nginx-1.0.11.orig/auto/feature	2011-05-11 06:50:19.000000000 -0500
++++ nginx-1.0.11/auto/feature	2011-12-27 13:56:42.323370040 -0600
+@@ -48,12 +48,20 @@
+ 
+ if [ -x $NGX_AUTOTEST ]; then
+ 
++    if [ ".$NGX_CROSS_COMPILE" = ".yes" ]; then
++        NGX_AUTOTEST_EXEC="true"
++	NGX_FOUND_MSG=" (not tested, cross compiling)"
++    else
++        NGX_AUTOTEST_EXEC="$NGX_AUTOTEST"
++	NGX_FOUND_MSG=""
++    fi
++
+     case "$ngx_feature_run" in
+ 
+         yes)
+             # /bin/sh is used to intercept "Killed" or "Abort trap" messages
+-            if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
+-                echo " found"
++            if /bin/sh -c $NGX_AUTOTEST_EXEC >> $NGX_AUTOCONF_ERR 2>&1; then
++                echo " found$NGX_FOUND_MSG"
+                 ngx_found=yes
+ 
+                 if test -n "$ngx_feature_name"; then
+@@ -67,17 +75,27 @@
+ 
+         value)
+             # /bin/sh is used to intercept "Killed" or "Abort trap" messages
+-            if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
+-                echo " found"
++            if /bin/sh -c $NGX_AUTOTEST_EXEC >> $NGX_AUTOCONF_ERR 2>&1; then
++                echo " found$NGX_FOUND_MSG"
+                 ngx_found=yes
+ 
+-                cat << END >> $NGX_AUTO_CONFIG_H
++                if [ ".$NGX_CROSS_COMPILE" = ".yes" ]; then
++                    cat << END >> $NGX_AUTO_CONFIG_H
+ 
+ #ifndef $ngx_feature_name
+-#define $ngx_feature_name  `$NGX_AUTOTEST`
++#define $ngx_feature_name  $(eval "echo \$NGX_WITH_${ngx_feature_name}")
+ #endif
+ 
+ END
++		else
++                    cat << END >> $NGX_AUTO_CONFIG_H
++
++#ifndef $ngx_feature_name
++#define $ngx_feature_name  `$NGX_AUTOTEST_EXEC`
++#endif
++
++END
++                fi
+             else
+                 echo " found but is not working"
+             fi
+@@ -85,7 +103,7 @@
+ 
+         bug)
+             # /bin/sh is used to intercept "Killed" or "Abort trap" messages
+-            if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
++            if /bin/sh -c $NGX_AUTOTEST_EXEC >> $NGX_AUTOCONF_ERR 2>&1; then
+                 echo " not found"
+ 
+             else
+diff -uraN nginx-1.0.11.orig/auto/options nginx-1.0.11/auto/options
+--- nginx-1.0.11.orig/auto/options	2011-12-14 07:34:16.000000000 -0600
++++ nginx-1.0.11/auto/options	2011-12-27 13:56:42.323370040 -0600
+@@ -289,6 +289,18 @@
+         --test-build-rtsig)              NGX_TEST_BUILD_RTSIG=YES   ;;
+         --test-build-solaris-sendfilev)  NGX_TEST_BUILD_SOLARIS_SENDFILEV=YES ;;
+ 
++        # cross compile support
++        --with-int=*)                    NGX_WITH_INT="$value"          ;;
++        --with-long=*)                   NGX_WITH_LONG="$value"         ;;
++        --with-long-long=*)              NGX_WITH_LONG_LONG="$value"    ;;
++        --with-ptr-size=*)               NGX_WITH_PTR_SIZE="$value"     ;;
++        --with-sig-atomic-t=*)           NGX_WITH_SIG_ATOMIC_T="$value" ;;
++        --with-size-t=*)                 NGX_WITH_SIZE_T="$value"       ;;
++        --with-off-t=*)                  NGX_WITH_OFF_T="$value"        ;;
++        --with-time-t=*)                 NGX_WITH_TIME_T="$value"       ;;
++        --with-sys-nerr=*)               NGX_WITH_NGX_SYS_NERR="$value" ;;
++        --with-endian=*)                 NGX_WITH_ENDIAN="$value"       ;;
++
+         *)
+             echo "$0: error: invalid option \"$option\""
+             exit 1
+@@ -434,6 +446,17 @@
+ 
+   --with-debug                       enable debug logging
+ 
++  --with-int=VALUE                   force int size
++  --with-long=VALUE                  force long size
++  --with-long-long=VALUE             force long long size
++  --with-ptr-size=VALUE              force pointer size
++  --with-sig-atomic-t=VALUE          force sig_atomic_t size
++  --with-size-t=VALUE                force size_t size
++  --with-off-t=VALUE                 force off_t size
++  --with-time-t=VALUE                force time_t size
++  --with-sys-nerr=VALUE              force sys_nerr value
++  --with-endian=VALUE                force system endianess
++
+ END
+ 
+     exit 1
+@@ -455,6 +478,8 @@
+ 
+ if [ ".$NGX_PLATFORM" = ".win32" ]; then
+     NGX_WINE=$WINE
++elif [ ! -z "$NGX_PLATFORM" ]; then
++    NGX_CROSS_COMPILE="yes"
+ fi
+ 
+ 
+diff -uraN nginx-1.0.11.orig/auto/types/sizeof nginx-1.0.11/auto/types/sizeof
+--- nginx-1.0.11.orig/auto/types/sizeof	2006-06-28 11:00:26.000000000 -0500
++++ nginx-1.0.11/auto/types/sizeof	2011-12-27 13:56:42.323370040 -0600
+@@ -11,9 +11,12 @@
+ 
+ END
+ 
+-ngx_size=
++ngx_size=$(eval "echo \$NGX_WITH_${ngx_param}")
+ 
+-cat << END > $NGX_AUTOTEST.c
++if [ ".$ngx_size" != "." ]; then
++    echo " $ngx_size bytes"
++else
++    cat << END > $NGX_AUTOTEST.c
+ 
+ #include <sys/types.h>
+ #include <sys/time.h>
+@@ -31,19 +34,20 @@
+ END
+ 
+ 
+-ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
+-          -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs"
++    ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
++              -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs"
+ 
+-eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
++    eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
+ 
+ 
+-if [ -x $NGX_AUTOTEST ]; then
+-    ngx_size=`$NGX_AUTOTEST`
+-    echo " $ngx_size bytes"
+-fi
++    if [ -x $NGX_AUTOTEST ]; then
++        ngx_size=`$NGX_AUTOTEST`
++        echo " $ngx_size bytes"
++    fi
+ 
+ 
+-rm -f $NGX_AUTOTEST
++    rm -f $NGX_AUTOTEST
++fi
+ 
+ 
+ case $ngx_size in
+diff -uraN nginx-1.0.11.orig/auto/unix nginx-1.0.11/auto/unix
+--- nginx-1.0.11.orig/auto/unix	2011-12-14 07:34:16.000000000 -0600
++++ nginx-1.0.11/auto/unix	2011-12-27 13:56:42.327370060 -0600
+@@ -393,13 +393,13 @@
+ 
+ # C types
+ 
+-ngx_type="int"; . auto/types/sizeof
++ngx_type="int"; ngx_param="INT"; . auto/types/sizeof
+ 
+-ngx_type="long"; . auto/types/sizeof
++ngx_type="long"; ngx_param="LONG"; . auto/types/sizeof
+ 
+-ngx_type="long long"; . auto/types/sizeof
++ngx_type="long long"; ngx_param="LONG_LONG"; . auto/types/sizeof
+ 
+-ngx_type="void *"; . auto/types/sizeof; ngx_ptr_size=$ngx_size
++ngx_type="void *"; ngx_param="PTR_SIZE"; . auto/types/sizeof; ngx_ptr_size=$ngx_size
+ ngx_param=NGX_PTR_SIZE; ngx_value=$ngx_size; . auto/types/value
+ 
+ 
+@@ -416,7 +416,7 @@
+ 
+ ngx_type="uint64_t"; ngx_types="u_int64_t"; . auto/types/typedef
+ 
+-ngx_type="sig_atomic_t"; ngx_types="int"; . auto/types/typedef
++ngx_type="sig_atomic_t"; ngx_param="SIG_ATOMIC_T"; ngx_types="int"; . auto/types/typedef
+ . auto/types/sizeof
+ ngx_param=NGX_SIG_ATOMIC_T_SIZE; ngx_value=$ngx_size; . auto/types/value
+ 
+@@ -432,15 +432,15 @@
+ 
+ . auto/endianess
+ 
+-ngx_type="size_t"; . auto/types/sizeof
++ngx_type="size_t"; ngx_param="SIZE_T"; . auto/types/sizeof
+ ngx_param=NGX_MAX_SIZE_T_VALUE; ngx_value=$ngx_max_value; . auto/types/value
+ ngx_param=NGX_SIZE_T_LEN; ngx_value=$ngx_max_len; . auto/types/value
+ 
+-ngx_type="off_t"; . auto/types/sizeof
++ngx_type="off_t"; ngx_param="OFF_T"; . auto/types/sizeof
+ ngx_param=NGX_MAX_OFF_T_VALUE; ngx_value=$ngx_max_value; . auto/types/value
+ ngx_param=NGX_OFF_T_LEN; ngx_value=$ngx_max_len; . auto/types/value
+ 
+-ngx_type="time_t"; . auto/types/sizeof
++ngx_type="time_t"; ngx_param="TIME_T"; . auto/types/sizeof
+ ngx_param=NGX_TIME_T_SIZE; ngx_value=$ngx_size; . auto/types/value
+ ngx_param=NGX_TIME_T_LEN; ngx_value=$ngx_max_len; . auto/types/value
+ 
diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx-volatile.conf b/meta-webserver/recipes-httpd/nginx/files/nginx-volatile.conf
new file mode 100644
index 0000000..93f3c66
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx-volatile.conf
@@ -0,0 +1,2 @@
+d www www-data 0755 /run/nginx none
+d root root 0755 /var/log/nginx none
diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.conf b/meta-webserver/recipes-httpd/nginx/files/nginx.conf
new file mode 100644
index 0000000..cbca58a
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx.conf
@@ -0,0 +1,120 @@
+
+user  www-data;
+worker_processes  1;
+
+error_log  /var/log/nginx/error.log;
+#error_log  logs/error.log  notice;
+#error_log  logs/error.log  info;
+
+pid        /run/nginx/nginx.pid;
+
+
+events {
+    worker_connections  1024;
+}
+
+
+http {
+    include       mime.types;
+    default_type  application/octet-stream;
+
+    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
+                      '$status $body_bytes_sent "$http_referer" '
+                      '"$http_user_agent" "$http_x_forwarded_for"';
+
+    access_log  /var/log/nginx/access.log  main;
+
+    sendfile        on;
+    #tcp_nopush     on;
+
+    #keepalive_timeout  0;
+    keepalive_timeout  65;
+
+    #gzip  on;
+
+    server {
+        listen       80;
+        server_name  localhost;
+
+        #charset koi8-r;
+
+        #access_log  logs/host.access.log  main;
+
+        location / {
+            root   /var/www/localhost/html;
+            index  index.html index.htm;
+        }
+
+        #error_page  404              /404.html;
+
+        # redirect server error pages to the static page /50x.html
+        #
+        error_page   500 502 503 504  /50x.html;
+        location = /50x.html {
+            root   /var/www/localhost/html;
+        }
+
+        # proxy the PHP scripts to Apache listening on 127.0.0.1:80
+        #
+        #location ~ \.php$ {
+        #    proxy_pass   http://127.0.0.1;
+        #}
+
+        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
+        #
+        #location ~ \.php$ {
+        #    root           html;
+        #    fastcgi_pass   127.0.0.1:9000;
+        #    fastcgi_index  index.php;
+        #    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
+        #    include        fastcgi_params;
+        #}
+
+        # deny access to .htaccess files, if Apache's document root
+        # concurs with nginx's one
+        #
+        #location ~ /\.ht {
+        #    deny  all;
+        #}
+    }
+
+
+    # another virtual host using mix of IP-, name-, and port-based configuration
+    #
+    #server {
+    #    listen       8000;
+    #    listen       somename:8080;
+    #    server_name  somename  alias  another.alias;
+
+    #    location / {
+    #        root   html;
+    #        index  index.html index.htm;
+    #    }
+    #}
+
+
+    # HTTPS server
+    #
+    #server {
+    #    listen       443;
+    #    server_name  localhost;
+
+    #    ssl                  on;
+    #    ssl_certificate      cert.pem;
+    #    ssl_certificate_key  cert.key;
+
+    #    ssl_session_timeout  5m;
+
+    #    ssl_protocols  SSLv2 SSLv3 TLSv1;
+    #    ssl_ciphers  HIGH:!aNULL:!MD5;
+    #    ssl_prefer_server_ciphers   on;
+
+    #    location / {
+    #        root   html;
+    #        index  index.html index.htm;
+    #    }
+    #}
+
+    include ./sites-enabled/*;
+
+}
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb
new file mode 100644
index 0000000..beef907
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb
@@ -0,0 +1,101 @@
+SUMMARY = "HTTP and reverse proxy server for embedded environments"
+HOMEPAGE = "http://nginx.org/"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=917bfdf005ffb6fd025550414ff05a9f"
+SECTION = "net"
+
+DEPENDS = "libpcre gzip openssl"
+
+SRC_URI = " \
+    http://nginx.org/download/nginx-${PV}.tar.gz \
+    file://nginx-cross_${PV}.diff;name=crosspatch \
+    file://nginx-volatile.conf \
+    file://nginx.conf \
+    file://init \
+"
+
+inherit update-rc.d useradd siteinfo
+
+SRC_URI[md5sum] = "5dfaba1cbeae9087f3949860a02caa9f"
+SRC_URI[sha256sum] = "7c989a58e5408c9593da0bebcd0e4ffc3d892d1316ba5042ddb0be5b0b4102b9"
+
+do_configure() {
+    PTRSIZE=$(expr ${SITEINFO_BITS} / 8)
+
+    echo $PTRSIZE
+    echo $CFLAGS
+    echo $LDFLAGS
+
+    ./configure \
+        --crossbuild=Linux:${TUNE_ARCH} \
+        --with-endian=${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
+        --with-int=4 \
+        --with-long=${PTRSIZE} \
+        --with-long-long=8 \
+        --with-ptr-size=${PTRSIZE} \
+        --with-sig-atomic-t=${PTRSIZE} \
+        --with-size-t=${PTRSIZE} \
+        --with-off-t=${PTRSIZE} \
+        --with-time-t=${PTRSIZE} \
+        --with-sys-nerr=132 \
+        --conf-path=${sysconfdir}/nginx/nginx.conf \
+        --http-log-path=${localstatedir}/log/nginx/access.log \
+        --error-log-path=${localstatedir}/log/nginx/error.log \
+        --pid-path=/run/nginx/nginx.pid \
+        --prefix=${prefix} \
+        --with-http_ssl_module \
+        --with-http_gzip_static_module
+}
+
+do_install() {
+    oe_runmake DESTDIR="${D}" install
+
+    install -d ${D}${localstatedir}/www/localhost
+    mv ${D}/usr/html ${D}${localstatedir}/www/localhost/
+    chown www:www-data -R ${D}${localstatedir}
+
+    install -d ${D}${sysconfdir}/init.d
+    cat ${WORKDIR}/init | \
+        sed -e 's,/usr/sbin/,${sbindir}/,g' \
+            -e 's,/etc/,${sysconfdir}/,g' > ${D}/${sysconfdir}/init.d/nginx
+    chmod 755 ${D}/${sysconfdir}/init.d/nginx
+
+    install -d ${D}${sysconfdir}/nginx
+    cat ${WORKDIR}/nginx.conf | \
+        sed -e 's,/var/,${localstatedir}/,g' > ${D}/${sysconfdir}/nginx/nginx.conf
+    chmod 644 ${D}/${sysconfdir}/nginx/nginx.conf
+    install -d ${D}${sysconfdir}/nginx/sites-enabled
+
+    install -d ${D}${sysconfdir}/default/volatiles
+    cat ${WORKDIR}/nginx-volatile.conf | \
+        sed -e 's,/var/,${localstatedir}/,g' > ${D}${sysconfdir}/default/volatiles/99_nginx
+    chmod 644 ${D}${sysconfdir}/default/volatiles/99_nginx
+
+    rm -fr "${D}${localstatedir}/run"
+}
+
+CONFFILES_${PN} = "${sysconfdir}/nginx/nginx.conf \
+        ${sysconfdir}/nginx/fastcgi.conf\
+        ${sysconfdir}/nginx/fastcgi_params \
+        ${sysconfdir}/nginx/koi-utf \
+        ${sysconfdir}/nginx/koi-win \
+        ${sysconfdir}/nginx/mime.types \
+        ${sysconfdir}/nginx/scgi_params \
+        ${sysconfdir}/nginx/uwsgi_params \
+        ${sysconfdir}/nginx/win-utf \
+        ${sysconfdir}/init.d/nginx \
+"
+
+INITSCRIPT_NAME = "nginx"
+INITSCRIPT_PARAMS = "defaults 92 20"
+
+FILES_${PN} += "${localstatedir} \
+                /run \
+               "
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = " \
+    --system --no-create-home \
+    --home ${localstatedir}/www/localhost \
+    --groups www-data \
+    --user-group www"
-- 
1.8.1.2


