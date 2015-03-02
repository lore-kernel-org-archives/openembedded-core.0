Return-Path: <lpapp@archlinux.us>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id DB9987372E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 10:13:20 +0000 (UTC)
Received: by wevm14 with SMTP id m14so32243774wev.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Mar 2015 02:13:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=ib5wnrpxf/co/wemYFjHAFEEuj2nuq13zBkEPGfosMs=;
	b=dWqKl/Iqj1R7l77JGUtw/xDaYZ/JMoz3CrjKS1IwqKjelAumB9V6ldDBkU6gSrUz9q
	E1vjrra1MoQMzqr6gCwdzOEdJ5slJ+ti21N3O29q6y/pQQH4vTqUQ+Ast+YBWzj9/FOy
	YenOCWLEUcc9EwRV76hI9TMODbHDPgL1xInEBxYqwCLLyRhVkR4nOD0BS0JrMmc06Ccw
	hP0BLhlpziCT3HJHaT1GikKoIn/wJkBsxIpbS9D64VR0m3WznkMP8IpRjUmnK8B9kP8+
	4Ms1XL+mseXCEC+tiB4T7fSgKel/yuCowOxWaa/5axF0a8xhEwnTPNPjm1ygPWisOzul
	MN0g==
X-Gm-Message-State: ALoCoQmZHZWaEX9kzig144tAMFk3di6GVsK5UMfyEuIK8rSOp23sb2vf57iK1ak/9x6/2ONFwGwo
X-Received: by 10.180.108.13 with SMTP id hg13mr34032733wib.7.1425291201092;
	Mon, 02 Mar 2015 02:13:21 -0800 (PST)
Received: from lpapp@archlinux.us (mail.polatis.com. [212.44.19.228])
	by mx.google.com with ESMTPSA id ga8sm15398575wib.6.2015.03.02.02.13.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Mar 2015 02:13:20 -0800 (PST)
Sender: Laszlo Papp <lpapp@archlinux.us>
From: Laszlo Papp <lpapp@kde.org>
X-Google-Original-From: Laszlo Papp <laszlo.papp@polatis.com>
Received: by lpapp@archlinux.us (sSMTP sendmail emulation);
	Mon, 02 Mar 2015 10:13:16 +0000
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Mar 2015 10:12:06 +0000
Message-Id: <1425291126-1729-1-git-send-email-laszlo.papp@polatis.com>
X-Mailer: git-send-email 2.3.0
Cc: Laszlo Papp <laszlo.papp@polatis.com>
Subject: [PATCH] Add init script (sysv) support for busybox's ntpd
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
X-List-Received-Date: Mon, 02 Mar 2015 10:13:22 -0000

Signed-off-by: Laszlo Papp <laszlo.papp@polatis.com>
---
 meta/recipes-core/busybox/busybox.inc             | 12 +++--
 meta/recipes-core/busybox/busybox_1.23.1.bb       |  2 +
 meta/recipes-core/busybox/files/busybox-ntpd      | 54 +++++++++++++++++++++++
 meta/recipes-core/busybox/files/busybox-ntpd.conf |  2 +
 4 files changed, 67 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/busybox/files/busybox-ntpd
 create mode 100644 meta/recipes-core/busybox/files/busybox-ntpd.conf

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 0769d92..b33d624 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -19,7 +19,7 @@ export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
 export EXTRA_OEMAKE += "'LD=${CCLD}'"
 
-PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
+PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock ${PN}-ntpd"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
 FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
@@ -27,15 +27,17 @@ FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf ${sysconfd
 FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
 FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
+FILES_${PN}-ntpd = "${sysconfdir}/init.d/busybox-ntpd ${sysconfdir}/busybox-ntpd.conf"
 
-INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock"
+INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock ${PN}-ntpd"
 
 INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
 INITSCRIPT_NAME_${PN}-hwclock = "hwclock.sh"
 INITSCRIPT_NAME_${PN}-mdev = "mdev"
 INITSCRIPT_PARAMS_${PN}-mdev = "start 03 S ."
 INITSCRIPT_NAME_${PN}-syslog = "syslog"
-INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd" 
+INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd"
+INITSCRIPT_NAME_${PN}-ntpd = "busybox-ntpd"
 
 SYSTEMD_PACKAGES = "${PN}-syslog"
 SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
@@ -273,6 +275,10 @@ do_install () {
                        install -m 0755 ${WORKDIR}/mdev-mount.sh ${D}${sysconfdir}/mdev
                fi
 	fi
+    if grep "CONFIG_NTPD=y" ${B}/.config; then
+        install -m 0755 ${WORKDIR}/busybox-ntpd ${D}${sysconfdir}/init.d/
+        install -m 0644 ${WORKDIR}/busybox-ntpd.conf ${D}${sysconfdir}/
+    fi
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         if grep -q "CONFIG_SYSLOGD=y" ${B}/.config; then
diff --git a/meta/recipes-core/busybox/busybox_1.23.1.bb b/meta/recipes-core/busybox/busybox_1.23.1.bb
index 1742390..8e57381 100644
--- a/meta/recipes-core/busybox/busybox_1.23.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.1.bb
@@ -31,6 +31,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
            file://CVE-2014-9645_busybox_reject_module_names_with_slashes.patch \
+           file://busybox-ntpd \
+           file://busybox-ntpd.conf \
 "
 
 SRC_URI[tarball.md5sum] = "5c94d6301a964cd91619bd4d74605245"
diff --git a/meta/recipes-core/busybox/files/busybox-ntpd b/meta/recipes-core/busybox/files/busybox-ntpd
new file mode 100644
index 0000000..b318cda
--- /dev/null
+++ b/meta/recipes-core/busybox/files/busybox-ntpd
@@ -0,0 +1,54 @@
+#!/bin/sh
+
+### BEGIN INIT INFO
+# Provides:
+# Required-Start:    $local_fs $remote_fs $network $syslog
+# Required-Stop:     $local_fs $remote_fs $network $syslog
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Small busybox ntp server
+# Description:       busybox-ntpd is a small and fast busybox ntp applet
+### END INIT INFO
+
+DAEMON=/sbin/ntpd
+NAME=ntpd
+DESC="Busybox NTP Daemon"
+source /etc/busybox-ntpd.conf
+ARGS="-p $PEER"
+
+test -f $DAEMON || exit 0
+
+set -e
+
+case "$1" in
+    start)
+        if [ -z "$PEER" ]; then
+            echo "PEER needs to be specified"
+        else
+            start-stop-daemon -S -b -n $NAME -a $DAEMON -- $ARGS
+            echo "done."
+        fi
+        ;;
+    stop)
+        echo -n "stopping $DESC: $NAME... "
+        start-stop-daemon -K -n $NAME
+        echo "done."
+        ;;
+    restart)
+        echo "restarting $DESC: $NAME... "
+        $0 stop
+        $0 start
+        echo "done."
+        ;;
+    reload)
+        echo -n "reloading $DESC: $NAME... "
+        killall -HUP $(basename ${DAEMON})
+        echo "done."
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart|reload}"
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/meta/recipes-core/busybox/files/busybox-ntpd.conf b/meta/recipes-core/busybox/files/busybox-ntpd.conf
new file mode 100644
index 0000000..9d9255c
--- /dev/null
+++ b/meta/recipes-core/busybox/files/busybox-ntpd.conf
@@ -0,0 +1,2 @@
+# Specify your peer.
+# PEER=pool.ntp.org
-- 
2.3.0


