Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web12.4777.1602652104570662897
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 22:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KYTnfCl0;
 spf=pass (domain: gmail.com, ip: 209.85.210.65, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f65.google.com with SMTP id e20so2280176otj.11
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 22:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=xjDyT0xeQe5LviTOKmJKjrngXgcm0VlrkSllUho7jXU=;
        b=KYTnfCl0gzb8uutLvRqnMP1Ra1FckcL8+jcGXw+M+3UxeW167HeNzepoDxkZZtvF7s
         /nXrQ4Q6E6SfVT1UijMaJbWFZs5Nwv1zaKNx60TLHyjhLVT/km9VB4ajrOFtng7jCJ9+
         bNgkzLXf8SxsV20AUyGCnRogEJU42cnNMimQD1tOoa+iGfLKeFKA1+9K6iEFgIdbYX88
         7q+U8zSD4KkrwWOTdh4twd45wrZh8pls5/+rJRmXFZ907z74BfM7RrrPuQn24hBsd4o8
         9KYKlcOj8rIns/u+MxU0aI2Wj9X8ijirNTt/DMRgJIA8dyqiB5WCzZLKRNaliMUypZpe
         REBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=xjDyT0xeQe5LviTOKmJKjrngXgcm0VlrkSllUho7jXU=;
        b=LuCCzfz7zl1ufl8Lx8MLN8GJXLcBvRP9zonFfG25DI+ePkdy1gxPUog8jIT5B2aIau
         wBfpwWML1WnUnqewi5SqI93np+bOaDWMFpVddtdDx2AmENRO2vrF/D3RsAKFRCZeHTM7
         zmBDdibv5zYLlARi+ueIis2BV2nMMyw+7k39NtwiinGj9SY7822mIHov6j1Pbw1fGwWa
         +JPggK9n3Yn237s8LP5+IGv7G5BIKuyxPc1ATdRydVzH1ESRogNnUUk8pJtKYEb+//ZG
         gT0cviCQdE+gUgPSf4BAJP83zDVPXhv1LGYmE/yjjbKQQdULZocRABoWB3u893RLhmLd
         Jgjg==
X-Gm-Message-State: AOAM532g7iJ8x75znVtz7aerAJ3oEM758BPsr+rttgUa3Mby4geUnGGR
	Xk0JT+9Dk+CJMsSVZ9jx2TpIdEvjWJg=
X-Google-Smtp-Source: ABdhPJwdjuocfdQ0XyBW2wBsBkcUumaS9lVGD5hecOjxu58K2OviH1ajcOfPhU9FhmLMXgrw1ejKvA==
X-Received: by 2002:a05:6830:1f22:: with SMTP id e2mr2278342oth.339.1602652103474;
        Tue, 13 Oct 2020 22:08:23 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:283a:e7e0:f7dd:41c0])
        by smtp.gmail.com with ESMTPSA id d21sm862149ood.2.2020.10.13.22.08.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 22:08:23 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kea: add init scripts
Date: Tue, 13 Oct 2020 22:08:21 -0700
Message-Id: <20201014050821.25233-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

[ Yocto # 14074 ]

Add init scripts for dhcp4,6 and ddns

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../kea/files/kea-dhcp-ddns-server            | 46 ++++++++++++++++++
 .../kea/files/kea-dhcp4-server                | 46 ++++++++++++++++++
 .../kea/files/kea-dhcp6-server                | 47 +++++++++++++++++++
 meta/recipes-connectivity/kea/kea_1.7.10.bb   | 13 ++++-
 4 files changed, 151 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
 create mode 100644 meta/recipes-connectivity/kea/files/kea-dhcp4-server
 create mode 100644 meta/recipes-connectivity/kea/files/kea-dhcp6-server

diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
new file mode 100644
index 00000000000..fe19179f290
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
+        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
+        exit 1
+        ;;
+esac
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4-server b/meta/recipes-connectivity/kea/files/kea-dhcp4-server
new file mode 100644
index 00000000000..59128e530d6
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
+        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
+        exit 1
+        ;;
+esac
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6-server b/meta/recipes-connectivity/kea/files/kea-dhcp6-server
new file mode 100644
index 00000000000..e0119d6eb2e
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
+        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
+        exit 1
+        ;;
+esac
diff --git a/meta/recipes-connectivity/kea/kea_1.7.10.bb b/meta/recipes-connectivity/kea/kea_1.7.10.bb
index 2ea4b12758e..15193aeda38 100644
--- a/meta/recipes-connectivity/kea/kea_1.7.10.bb
+++ b/meta/recipes-connectivity/kea/kea_1.7.10.bb
@@ -13,11 +13,17 @@ SRC_URI = "\
     file://kea-dhcp4.service \
     file://kea-dhcp6.service \
     file://kea-dhcp-ddns.service \
+    file://kea-dhcp4-server \
+    file://kea-dhcp6-server \
+    file://kea-dhcp-ddns-server \
     file://fix-multilib-conflict.patch \
 "
 SRC_URI[sha256sum] = "4e121f0e58b175a827581c69cb1d60778647049fa47f142940dddc9ce58f3c82"
 
-inherit autotools systemd
+inherit autotools systemd update-rc.d
+
+INITSCRIPT_NAME = "kea-dhcp4-server"
+INITSCRIPT_PARAMS = "defaults 30"
 
 SYSTEMD_SERVICE_${PN} = "kea-dhcp4.service kea-dhcp6.service kea-dhcp-ddns.service"
 SYSTEMD_AUTO_ENABLE = "disable"
@@ -44,8 +50,11 @@ do_configure_prepend() {
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
@@ -55,6 +64,8 @@ do_install_append() {
     rm -rf "${D}${localstatedir}"
 }
 
+CONFFILES_${PN} = "${sysconfdir}/kea/keactrl.conf"
+
 FILES_${PN}-staticdev += "${libdir}/kea/hooks/*.a ${libdir}/hooks/*.a"
 FILES_${PN} += "${libdir}/hooks/*.so"
 
-- 
2.17.1

