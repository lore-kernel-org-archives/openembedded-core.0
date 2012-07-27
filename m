Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1Sugf7-00005b-EQ
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 11:16:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6R95DZm007153
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 02:05:13 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 27 Jul 2012 02:05:12 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 17:03:52 +0800
Message-ID: <1343379832-13421-2-git-send-email-sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <1343379832-13421-1-git-send-email-sen.zhang@windriver.com>
References: <5010AE26.5010908@windriver.com>
	<1343379832-13421-1-git-send-email-sen.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] busybox: udhcpc shouldn't be a service
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2012 09:16:45 -0000
Content-Type: text/plain

udhcpc is invoked from the networking service, so it shouldn't exist
standalone. If /etc/init.d/busybox-udhcpc is present, it will cause
udhcpc to be started two times.

And since the script doesn't support the stop action, it will cause
udhcpc to be started even when system is being shutdown.

Remove /etc/init.d/busybox-udhcpc to resolve the issues.

[YOCTO #2840]

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc          |    6 +---
 meta/recipes-core/busybox/busybox_1.19.4.bb    |    3 +-
 meta/recipes-core/busybox/files/busybox-udhcpc |   25 ------------------------
 3 files changed, 3 insertions(+), 31 deletions(-)
 delete mode 100755 meta/recipes-core/busybox/files/busybox-udhcpc

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index b2fbd52..0a4c067 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -20,16 +20,15 @@ FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
 FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf*"
 FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf"
 FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
-FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc ${sysconfdir}/init.d/busybox-udhcpc"
+FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
 
-INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-udhcpc ${PN}-mdev"
+INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev"
 
 INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
 INITSCRIPT_NAME_${PN}-syslog = "syslog"
 INITSCRIPT_NAME_${PN}-mdev = "mdev"
 INITSCRIPT_PARAMS_${PN}-mdev = "start 06 S ."
 INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd" 
-INITSCRIPT_NAME_${PN}-udhcpc = "busybox-udhcpc" 
 CONFFILES_${PN}-syslog = "${sysconfdir}/syslog-startup.conf.${BPN}"
 CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
 
@@ -186,7 +185,6 @@ do_install () {
 		install -d ${D}${datadir}/udhcpc
                 install -m 0755 ${WORKDIR}/simple.script ${D}${sysconfdir}/udhcpc.d/50default
 		install -m 0755 ${WORKDIR}/default.script ${D}${datadir}/udhcpc/default.script
-		install -m 0755 ${WORKDIR}/busybox-udhcpc ${D}${sysconfdir}/init.d/
 	fi
 	if grep "CONFIG_INETD=y" ${WORKDIR}/defconfig; then
 		install -m 0755 ${WORKDIR}/inetd ${D}${sysconfdir}/init.d/inetd.${BPN}
diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
index 6e69d22..4614cb6 100644
--- a/meta/recipes-core/busybox/busybox_1.19.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r10"
+PR = "r11"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
@@ -14,7 +14,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-cron \
            file://busybox-httpd \
            file://busybox-udhcpd \
-           file://busybox-udhcpc \
            file://default.script \
            file://simple.script \
            file://hwclock.sh \
diff --git a/meta/recipes-core/busybox/files/busybox-udhcpc b/meta/recipes-core/busybox/files/busybox-udhcpc
deleted file mode 100755
index 2c43f8d..0000000
--- a/meta/recipes-core/busybox/files/busybox-udhcpc
+++ /dev/null
@@ -1,25 +0,0 @@
-#!/bin/sh
-#
-# (c) 2010-2011 Wind River Systems, Inc.
-#
-# Busybox udhcpc init script
-#
-# script to start the udpchc DHCP client on boots where
-# the parameter 'ip=dhcp' was included in the kernel parameters
-
-# ensure the required binaries are present
-[ -x /sbin/udhcpc ] || exit 1
-[ -x /bin/grep ] || exit 1
-[ -x /bin/mount ] || exit 1
-
-# ensure /proc is mounted
-if ! mount | grep -q "/proc "; then
-	exit 2
-fi
-
-rc=0
-if grep -q -E "\bip=dhcp\b" /proc/cmdline; then
-	/sbin/udhcpc -D -s /usr/share/udhcpc/default.script
-	rc=$?
-fi
-exit $rc
-- 
1.7.7



