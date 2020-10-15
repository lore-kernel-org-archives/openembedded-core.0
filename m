Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.6187.1602740867071865933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2020 22:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Urxpry6E;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id f2so442238ooj.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2020 22:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=16MtLeL8LJwX6lFLIvpp1VuP7SM2fr0SqVgl640YwR8=;
        b=Urxpry6EqiGSgGx0zaMARNmg0H9FWoe96J57NZcfpPD3oJBa3A575uNy2Y99M66BcR
         1KVK5PCdzE04ips4X2aZ5Es+h2gASlfs/WvryuxZhooVWOpZ3VxW/AgvMIw9y33/MAo/
         D/mTxI4fbnraH7F5CX+jmMZKk5W+kzDGSIrmaNhReXjoYtkgJMIYlpliyIIBX7AOBbMg
         7b8xaAJBfM5ws2YhL7EYkIXmjErq3Hh7FK81RgCZn1x0uYL5T8fdjnjk+H5DZ7DRdgKY
         /mGJRC5wHa0BXvr5GbzfpJpu54jOAVEhh5JilwQi6jcaKb+gesZexdf1INNBpNfe2JjT
         NCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=16MtLeL8LJwX6lFLIvpp1VuP7SM2fr0SqVgl640YwR8=;
        b=fe9dTbp7vqyw7mq24wuHRAhNK2rAgnO/3sc02uRdvhci81ze8Z7ZOK4bpovzvuKTRw
         0yCAP1NH6NuxID1q309LRtUuheG/MfJu7E92po22dOeUUKqCCL3wrmDnYltKL9rFS2Ec
         ergIfCrG6brDvKDuKvF5Cd5yoxLyHvLeaN4PD3aLNIbnI2u6MMFssCF9UCP1UFbmxVWQ
         8Nn3WGvIn3ZKwo9I6d2TdnEKKW8e+elVFgpBVIuYhO9NpBuQrq1HJkBDeit1HT8oM1mR
         8uCK8WHU+8oCB5vGgiLCtM6w8XJjVwAvcXEPzoFt107sKTUrKnwwsMrBWiUGy8+SaZDT
         6cew==
X-Gm-Message-State: AOAM531eAsNrKcbXmHzXg05OYCd7/x4/Cwpr7IZSgE75quMU1EmWDvJT
	zNZDnjb+uPONoqt9ny5yQ+tKcjWPYJc=
X-Google-Smtp-Source: ABdhPJzsBzTjiHpRQZyEvTfEs8z6t4HoPEOOqe/HJ1F6nsyu8JiMfS+uAy/KOMEBsYyntfsPegTJwQ==
X-Received: by 2002:a4a:b40a:: with SMTP id y10mr1167937oon.71.1602740866036;
        Wed, 14 Oct 2020 22:47:46 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:20b4:de17:4e9:6126])
        by smtp.gmail.com with ESMTPSA id s66sm846566oib.16.2020.10.14.22.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 22:47:45 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: akuster <akuster@kona.kama-aina.net>
Subject: [V2][PATCH] kea: add init scripts
Date: Wed, 14 Oct 2020 22:47:44 -0700
Message-Id: <20201015054744.24608-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

[ Yocto # 14074 ]

Add init scripts for dhcp4,6 and ddns

Signed-off-by: akuster <akuster@kona.kama-aina.net>

--
V2]

remove 'status' from usage
add patch to fix ps -p in keactrl.in
---
 .../kea/files/fix_pid_keactrl.patch           | 22 +++++++++
 .../kea/files/kea-dhcp-ddns-server            | 46 ++++++++++++++++++
 .../kea/files/kea-dhcp4-server                | 46 ++++++++++++++++++
 .../kea/files/kea-dhcp6-server                | 47 +++++++++++++++++++
 meta/recipes-connectivity/kea/kea_1.7.10.bb   | 14 +++++-
 5 files changed, 174 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
 create mode 100644 meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
 create mode 100644 meta/recipes-connectivity/kea/files/kea-dhcp4-server
 create mode 100644 meta/recipes-connectivity/kea/files/kea-dhcp6-server

diff --git a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
new file mode 100644
index 00000000000..eeeb89942bd
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
@@ -0,0 +1,22 @@
+Busybox does not support ps -p so use pgrep
+
+Upstream-Status: Inappropriate [embedded specific]
+Based on changes from Diego Sueiro <Diego.Sueiro@arm.com>
+
+Signed-off-by: Armin kuster <akuster808@gmail.com>
+
+Index: kea-1.7.10/src/bin/keactrl/keactrl.in
+===================================================================
+--- kea-1.7.10.orig/src/bin/keactrl/keactrl.in
++++ kea-1.7.10/src/bin/keactrl/keactrl.in
+@@ -137,8 +137,8 @@ check_running() {
+     # Get the PID from the PID file (if it exists)
+     get_pid_from_file "${proc_name}"
+     if [ ${_pid} -gt 0 ]; then
+-        # Use ps to check if PID is alive
+-        ps -p ${_pid} 1>/dev/null
++        # Use pgrep and grep to check if PID is alive
++        pgrep -v 1 | grep ${_pid} 1>/dev/null
+         retcode=$?
+         if [ $retcode -eq 0 ]; then
+             # No error, so PID IS ALIVE
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
new file mode 100644
index 00000000000..50fe40d4391
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
@@ -0,0 +1,46 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides:          kea-dhcp-ddns-server
+# Required-Start:    $local_fs $network $remote_fs $syslog
+# Required-Stop:     $local_fs $network $remote_fs $syslog
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: ISC KEA DHCP IPv6 Server
+### END INIT INFO
+
+PATH=/sbin:/usr/sbin:/bin:/usr/bin
+DESC="kea-dhcp-ddns-server"
+NAME=kea-dhcp-ddns
+DAEMON=/usr/sbin/keactrl
+DAEMON_ARGS=" -s dhcp_ddns"
+
+set -e
+
+# Exit if the package is not installed
+[ -x "$DAEMON" ] || exit 0
+
+# Source function library.
+. /etc/init.d/functions
+
+case "$1" in
+  start)
+        echo -n "Starting $DESC: "
+        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_ARGS
+        echo "done."
+        ;;
+  stop)
+        echo -n "Stopping $DESC: "
+        kpid=`pidof $NAME`
+        kill $kpid
+        echo "done."
+        ;;
+  restart|force-reload)
+        #
+        $0 stop
+        $0 start
+        ;;
+  *)
+        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
+        exit 1
+        ;;
+esac
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4-server b/meta/recipes-connectivity/kea/files/kea-dhcp4-server
new file mode 100644
index 00000000000..e83e51025d5
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp4-server
@@ -0,0 +1,46 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides:          kea-dhcp4-server
+# Required-Start:    $local_fs $network $remote_fs $syslog
+# Required-Stop:     $local_fs $network $remote_fs $syslog
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: ISC KEA DHCP IPv6 Server
+### END INIT INFO
+
+PATH=/sbin:/usr/sbin:/bin:/usr/bin
+DESC="kea-dhcp4-server"
+NAME=kea-dhcp4
+DAEMON=/usr/sbin/keactrl
+DAEMON_ARGS=" -s dhcp4"
+
+set -e
+
+# Exit if the package is not installed
+[ -x "$DAEMON" ] || exit 0
+
+# Source function library.
+. /etc/init.d/functions
+
+case "$1" in
+  start)
+        echo -n "Starting $DESC: "
+        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_ARGS
+        echo "done."
+        ;;
+  stop)
+        echo -n "Stopping $DESC: "
+        kpid=`pidof $NAME`
+        kill $kpid
+        echo "done."
+        ;;
+  restart|force-reload)
+        #
+        $0 stop
+        $0 start
+        ;;
+  *)
+        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
+        exit 1
+        ;;
+esac
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6-server b/meta/recipes-connectivity/kea/files/kea-dhcp6-server
new file mode 100644
index 00000000000..10f2d226412
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp6-server
@@ -0,0 +1,47 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides:          kea-dhcp6-server
+# Required-Start:    $local_fs $network $remote_fs $syslog
+# Required-Stop:     $local_fs $network $remote_fs $syslog
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: ISC KEA DHCP IPv6 Server
+### END INIT INFO
+
+# PATH should only include /usr/* if it runs after the mountnfs.sh script
+PATH=/sbin:/usr/sbin:/bin:/usr/bin
+DESC="kea-dhcp6-server"
+NAME=kea-dhcp6
+DAEMON=/usr/sbin/keactrl
+DAEMON_ARGS=" -s dhcp6"
+
+set -e
+
+# Exit if the package is not installed
+[ -x "$DAEMON" ] || exit 0
+
+# Source function library.
+. /etc/init.d/functions
+
+case "$1" in
+  start)
+        echo -n "Starting $DESC: "
+        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_ARGS
+        echo "done."
+        ;;
+  stop)
+        echo -n "Stopping $DESC: "
+        kpid=`pidof $NAME`
+        kill $kpid
+        echo "done."
+        ;;
+  restart|force-reload)
+        #
+        $0 stop
+        $0 start
+        ;;
+  *)
+        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
+        exit 1
+        ;;
+esac
diff --git a/meta/recipes-connectivity/kea/kea_1.7.10.bb b/meta/recipes-connectivity/kea/kea_1.7.10.bb
index 2ea4b12758e..c9a5819e475 100644
--- a/meta/recipes-connectivity/kea/kea_1.7.10.bb
+++ b/meta/recipes-connectivity/kea/kea_1.7.10.bb
@@ -13,11 +13,18 @@ SRC_URI = "\
     file://kea-dhcp4.service \
     file://kea-dhcp6.service \
     file://kea-dhcp-ddns.service \
+    file://kea-dhcp4-server \
+    file://kea-dhcp6-server \
+    file://kea-dhcp-ddns-server \
     file://fix-multilib-conflict.patch \
+    file://fix_pid_keactrl.patch \
 "
 SRC_URI[sha256sum] = "4e121f0e58b175a827581c69cb1d60778647049fa47f142940dddc9ce58f3c82"
 
-inherit autotools systemd
+inherit autotools systemd update-rc.d
+
+INITSCRIPT_NAME = "kea-dhcp4-server"
+INITSCRIPT_PARAMS = "defaults 30"
 
 SYSTEMD_SERVICE_${PN} = "kea-dhcp4.service kea-dhcp6.service kea-dhcp-ddns.service"
 SYSTEMD_AUTO_ENABLE = "disable"
@@ -44,8 +51,11 @@ do_configure_prepend() {
 }
 
 do_install_append() {
+    install -d ${D}${sysconfdir}/init.d
     install -d ${D}${systemd_system_unitdir}
+
     install -m 0644 ${WORKDIR}/kea-dhcp*service ${D}${systemd_system_unitdir}
+    install -m 0755 ${WORKDIR}/kea-*-server ${D}${sysconfdir}/init.d
     sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
            -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' \
            ${D}${systemd_system_unitdir}/kea-dhcp*service ${D}${sbindir}/keactrl
@@ -55,6 +65,8 @@ do_install_append() {
     rm -rf "${D}${localstatedir}"
 }
 
+CONFFILES_${PN} = "${sysconfdir}/kea/keactrl.conf"
+
 FILES_${PN}-staticdev += "${libdir}/kea/hooks/*.a ${libdir}/hooks/*.a"
 FILES_${PN} += "${libdir}/hooks/*.so"
 
-- 
2.17.1

