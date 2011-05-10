Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVO-0001Z9-Kj
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:11 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 May 2011 22:26:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; d="scan'208";a="690502025"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by fmsmga002.fm.intel.com with ESMTP; 09 May 2011 22:26:24 -0700
Message-Id: <7747195d0ae8d1d8af666b43010f75cc35e76102.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Mon, 2 May 2011 19:09:16 +0000
Date: Mon, 09 May 2011 22:26:24 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 22/30] busybox: add support to mdev
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
X-List-Received-Date: Tue, 10 May 2011 05:29:12 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

This changes the packaging only if the configuration used has mdev
support enabled.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/busybox/busybox.inc       |   14 +++++++++-
 meta/recipes-core/busybox/busybox_1.18.4.bb |    2 +
 meta/recipes-core/busybox/files/mdev        |    7 +++++
 meta/recipes-core/busybox/files/mdev.conf   |   35 +++++++++++++++++++++++++++
 4 files changed, 56 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-core/busybox/files/mdev
 create mode 100644 meta/recipes-core/busybox/files/mdev.conf

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index be13c8a..341c5c4 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -12,20 +12,24 @@ SECTION = "base"
 PRIORITY = "required"
 
 export EXTRA_CFLAGS = "${CFLAGS}"
-PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog"
+PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
 FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog.conf*"
+FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf"
 FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc ${sysconfdir}/init.d/busybox-udhcpc"
 
-INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-udhcpc"
+INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-udhcpc ${PN}-mdev"
 
 INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
 INITSCRIPT_NAME_${PN}-syslog = "syslog"
+INITSCRIPT_NAME_${PN}-mdev = "mdev"
+INITSCRIPT_PARAMS_${PN}-mdev = "start 06 S ."
 INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd" 
 INITSCRIPT_NAME_${PN}-udhcpc = "busybox-udhcpc" 
 CONFFILES_${PN}-syslog = "${sysconfdir}/syslog.conf.${PN}"
+CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
 
 RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
 
@@ -100,6 +104,12 @@ do_install () {
 		install -m 0755 ${WORKDIR}/default.script ${D}${datadir}/udhcpc/default.script
 		install -m 0755 ${WORKDIR}/busybox-udhcpc ${D}${sysconfdir}/init.d/
 	fi
+	if grep "CONFIG_MDEV=y" ${WORKDIR}/defconfig; then
+		install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/mdev
+		if grep "CONFIG_FEATURE_MDEV_CONF=y" ${WORKDIR}/defconfig; then
+			install -m 644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf
+		fi
+	fi
 
 	install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
 
diff --git a/meta/recipes-core/busybox/busybox_1.18.4.bb b/meta/recipes-core/busybox/busybox_1.18.4.bb
index 5f5c2ae..cf37650 100644
--- a/meta/recipes-core/busybox/busybox_1.18.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.18.4.bb
@@ -20,6 +20,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://mount.busybox \
            file://syslog \
            file://syslog.conf \
+           file://mdev \
+           file://mdev.conf \
            file://umount.busybox \
            file://defconfig"
 
diff --git a/meta/recipes-core/busybox/files/mdev b/meta/recipes-core/busybox/files/mdev
new file mode 100755
index 0000000..4eba619
--- /dev/null
+++ b/meta/recipes-core/busybox/files/mdev
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+mount -t tmpfs tmpfs /dev  -o size=64k,mode=0755
+mkdir /dev/pts /dev/shm
+mount -t devpts devpts /dev/pts
+echo "/sbin/mdev" > /proc/sys/kernel/hotplug
+mdev -s
diff --git a/meta/recipes-core/busybox/files/mdev.conf b/meta/recipes-core/busybox/files/mdev.conf
new file mode 100644
index 0000000..0e1d6bc
--- /dev/null
+++ b/meta/recipes-core/busybox/files/mdev.conf
@@ -0,0 +1,35 @@
+console 0:0 0600 
+cpu_dma_latency 0:0 0660 
+fb0:0 44 0660 
+full 0:0 0666 
+initctl 0:0 0600 
+ircomm[0-9].* 0:20 0660 
+kmem 0:15 0640 
+kmsg 0:0 0660 
+log 0:0 0666 
+loop[0-9].* 0:6 0640 
+mem 0:15 0640 
+network_latency 0:0 0660 
+network_throughput 0:0 0660 
+null 0:0 0666 
+port 0:15 0640 
+ptmx 0:5 0666 
+ram[0-9].* 0:6 0640 
+random 0:0 0666 
+sda 0:6 0640 
+tty 0:5 0666 
+tty.* 0:0 0620 
+urandom 0:0 0666 
+usbdev.* 0:0 0660 */etc/mdev/usb.sh
+vcs.* 0:5 0660 
+zero 0:0 0666 
+ 
+pcm.* 0:0 0660 =snd/ 
+control.* 0:0 0660 =snd/ 
+timer 0:0 0660 =snd/ 
+
+event.* 0:0 0660 =input/ @/etc/mdev/find-touchscreen.sh
+mice 0:0 0660 =input/ 
+mouse.* 0:0 0660 =input/
+
+tun[0-9]* 0:0 0660 =net/
-- 
1.7.1.1



