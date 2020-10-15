Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.6231.1602740913965920255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2020 22:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tgN2VC+I;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id f10so1868834otb.6
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2020 22:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=5N8zc0b9KEAnrk+Fso9tkc/ZQSdXQI8PkCB5jkFG8rk=;
        b=tgN2VC+I+JcSt+Q/69ldH8TEI/Z86lyWFZaREdfMtC066iyDWrlx4ASdhOUZI6M/FW
         hqPOZVM4ULlqprrRBc9y/oX8md3f7aTGYviKxjmMByG0Z8VDs5+hw43CcdIsyIsyTAsF
         qkZb6tKTClJrI87+OgDJ2ZvsB4UFYMnIngXlFH37G0B6Hm+m//FE/O81qIBV92mcslRd
         +yLIph0AqmiXz/uU+xZRle8CYZVLYF8TucWvm1AUb27Ge9Ae4TTVhx2OXDHsZL/aHjpe
         fFlCbMChDPcdGmQx+QyGaVinh4HGVrDJNjigoJg3SBko4aSsd0FW6kw5Z/D48u85g4SZ
         0v8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5N8zc0b9KEAnrk+Fso9tkc/ZQSdXQI8PkCB5jkFG8rk=;
        b=H8S6dmNwE8UO6tsTOIcTEp/oroipig13EHuAqfzJXnIZgynsXUTi/HxpA7StAsnWUj
         U/NO35C2qxZMPGSoYpx0huNWoFjfKwVYeiqjaL/jEhKYQ4tlYvcl25fH5ySZ9iZMilHi
         4n8ok9mLyKUu9pCVXGW++vABLeg7tygSSDyNIKWuRVSn4AXNMqnRDCvwE5KpiNK9WKfn
         QornSb2zdoPAbEpPaHPuvniyFLX7iA9BoQds2h2YRLUoYhuZRrjHr23TP9oNTQX+0yHu
         6/AAFYoYjHn4Q+oNaSHP081P9jWtld1C97ETgfWG/VDQVkBWSnHSFWZvQszrUdiPyx2v
         NwEg==
X-Gm-Message-State: AOAM531XMfDLBAup660y0/7n4iW4tsNCgkMDKL1HZXPEHEIFnVyzL87d
	7GB0g+o8WF/Uae2NNz139d//D1qGneE=
X-Google-Smtp-Source: ABdhPJwZoY0c4fhsMabSE62OYCotEn1S/x6kFxdhZeY37EqJ3RKHy1M/mUsybAY6fmk8XruLG8mW4Q==
X-Received: by 2002:a9d:8d4:: with SMTP id 78mr1616878otf.65.1602740912899;
        Wed, 14 Oct 2020 22:48:32 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:20b4:de17:4e9:6126])
        by smtp.gmail.com with ESMTPSA id d11sm705547oti.69.2020.10.14.22.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 22:48:32 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin kuster <akuster808@gmail.com>
Subject: [V2][PATCH] kea: add init scripts
Date: Wed, 14 Oct 2020 22:48:31 -0700
Message-Id: <20201015054831.24685-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

[ Yocto # 14074 ]

Add init scripts for dhcp4,6 and ddns

Signed-off-by: Armin kuster <akuster808@gmail.com>

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

