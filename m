Return-Path: <lpapp@archlinux.us>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id E3CE56CA54
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 03:26:54 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id hn9so263257wib.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 20:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=0Gk4GB/0OHUa/5rdT2qQFI5fL+mInuWapVF+OhSPO90=;
	b=blxDjQjKhlXj8+8M+xlBhMxT9pMN07k35CFXDTo3lR/PccaA1jCGQdX33nHsEyvla2
	qjXpw4XjfMyTeQOwUiv0+u7pgCC5CSAnzQyr/GeFv4ragLnL3sXpBRNjUBxbeRFBK/9g
	kBVY2HsK/SMxV2XB/FPgdIJgQuhlyZT4xl/VrZchmlb5zlXOxQLdBaq3P00smyVl5kQT
	5CyOH8GWnDiuy1Eu6s1T9cHW8TlKlI95vg+EUNFVYpcdz7Fxt2IvwL9Kj3U3waQANwRS
	8MWR/StufAvm8Sn89Fhk+mUeLrQFLrO6UB8gnp2DpjEC9tmecb6RuD+8R2xffYy5lJGa
	RuIw==
X-Gm-Message-State: ALoCoQnlmeIpLoPOSFlR0K94Ua6dD7ZT0AMZY6jsSfVsWMj5wvAIlaQRqmhbC+23wld9WeXn4od4
X-Received: by 10.194.85.75 with SMTP id f11mr5981637wjz.47.1395286015514;
	Wed, 19 Mar 2014 20:26:55 -0700 (PDT)
Received: from archlinux.us (cpc11-cmbg15-2-0-cust30.5-4.cable.virginm.net.
	[86.30.245.31])
	by mx.google.com with ESMTPSA id fb6sm48998340wib.2.2014.03.19.20.26.52
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Mar 2014 20:26:54 -0700 (PDT)
Sender: Laszlo Papp <lpapp@archlinux.us>
Received: by archlinux.us (sSMTP sendmail emulation);
	Thu, 20 Mar 2014 03:26:30 +0000
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Mar 2014 03:26:25 +0000
Message-Id: <1395285985-13867-1-git-send-email-lpapp@kde.org>
X-Mailer: git-send-email 1.9.0
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
X-List-Received-Date: Thu, 20 Mar 2014 03:27:00 -0000

---
 meta/recipes-core/busybox/busybox.inc             | 10 ++++--
 meta/recipes-core/busybox/busybox_1.22.1.bb       |  2 ++
 meta/recipes-core/busybox/files/busybox-ntpd      | 39 +++++++++++++++++++++++
 meta/recipes-core/busybox/files/busybox-ntpd.conf |  1 +
 4 files changed, 50 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/busybox/files/busybox-ntpd
 create mode 100644 meta/recipes-core/busybox/files/busybox-ntpd.conf

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 69b9b0c..653ab16 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -18,7 +18,7 @@ BUSYBOX_SPLIT_SUID ?= "1"
 export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
 
-PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
+PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock ${PN}-ntpd"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
 FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
@@ -26,8 +26,9 @@ FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf"
 FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
 FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
+FILES_${PN}-ntpd = "${sysconfdir}/init.d/busybox-ntpd ${sysconfdir}/busybox-ntpd.conf"
 
-INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock"
+INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock ${PN}-ntpd"
 
 INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
 INITSCRIPT_NAME_${PN}-hwclock = "hwclock.sh"
@@ -35,6 +36,7 @@ INITSCRIPT_NAME_${PN}-mdev = "mdev"
 INITSCRIPT_PARAMS_${PN}-mdev = "start 03 S ."
 INITSCRIPT_NAME_${PN}-syslog = "syslog"
 INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd" 
+INITSCRIPT_NAME_${PN}-ntpd = "busybox-ntpd"
 
 SYSTEMD_PACKAGES = "${PN}-syslog"
 SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
@@ -264,6 +266,10 @@ do_install () {
                        install -m 644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf
                fi
 	fi
+    if grep "CONFIG_NTPD=y" ${B}/.config; then
+		install -m 0755 ${WORKDIR}/busybox-ntpd ${D}${sysconfdir}/init.d/
+		install -m 0644 ${WORKDIR}/busybox-ntpd.conf ${D}${sysconfdir}/
+	fi
 
     if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_unitdir}/system
diff --git a/meta/recipes-core/busybox/busybox_1.22.1.bb b/meta/recipes-core/busybox/busybox_1.22.1.bb
index ffc9435..c513aa2 100644
--- a/meta/recipes-core/busybox/busybox_1.22.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.22.1.bb
@@ -27,6 +27,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://inetd.conf \
            file://inetd \
            file://login-utilities.cfg \
+           file://busybox-ntpd \
+           file://busybox-ntpd.conf \
 "
 
 SRC_URI[tarball.md5sum] = "337d1a15ab1cb1d4ed423168b1eb7d7e"
diff --git a/meta/recipes-core/busybox/files/busybox-ntpd b/meta/recipes-core/busybox/files/busybox-ntpd
new file mode 100644
index 0000000..e558973
--- /dev/null
+++ b/meta/recipes-core/busybox/files/busybox-ntpd
@@ -0,0 +1,39 @@
+#!/bin/sh
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
+        start-stop-daemon -S -b -n $NAME -a $DAEMON -- $ARGS
+        echo "done."
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
index 0000000..65665d8
--- /dev/null
+++ b/meta/recipes-core/busybox/files/busybox-ntpd.conf
@@ -0,0 +1 @@
+PEER=127.0.0.1
-- 
1.9.0


