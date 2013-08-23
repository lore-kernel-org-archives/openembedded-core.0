Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1F6B76B212
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 11:21:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Aug 2013 04:18:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="367329043"
Received: from timevans-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.235])
	by orsmga001.jf.intel.com with ESMTP; 23 Aug 2013 04:20:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 12:20:30 +0100
Message-Id: <1377256830-10748-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] busybox: enable shared memory logging for systemd
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
X-List-Received-Date: Fri, 23 Aug 2013 11:21:04 -0000

The default command-line options for launching busybox's syslogd are
"-C" if using sysvinit; but because we use /etc/default/busybox-syslog
when using systemd which the sysvinit initscript doesn't use, and no
/etc/default/busybox-syslog is installed by default in OE-Core, the
default arguments with systemd were no arguments at all with OE-Core
alone. Effectively merge in the bbappend from meta-oe that adds a
default file in order to set the default options to "-C" for systemd as
well.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/busybox/busybox.inc                  | 7 ++++++-
 meta/recipes-core/busybox/busybox_1.21.1.bb            | 1 +
 meta/recipes-core/busybox/files/busybox-syslog.default | 1 +
 3 files changed, 8 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/files/busybox-syslog.default

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 454d7e3..b4cf20a 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -21,7 +21,7 @@ export EXTRA_LDFLAGS = "${LDFLAGS}"
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
-FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${systemd_unitdir}/system/syslog.service"
+FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
 FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf"
 FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
@@ -272,6 +272,11 @@ do_install () {
         sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.service.in \
             > ${D}${systemd_unitdir}/system/busybox-klogd.service
 
+        if [ -f ${WORKDIR}/busybox-syslog.default ] ; then
+            install -d ${D}${sysconfdir}/default
+            install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/default/busybox-syslog
+        fi
+
         ln -sf /dev/null ${D}${systemd_unitdir}/system/syslog.service
     fi
 
diff --git a/meta/recipes-core/busybox/busybox_1.21.1.bb b/meta/recipes-core/busybox/busybox_1.21.1.bb
index fdb1974..784c924 100644
--- a/meta/recipes-core/busybox/busybox_1.21.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.21.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://mount.busybox \
            file://syslog \
            file://syslog-startup.conf \
+           file://busybox-syslog.default \
            file://mdev \
            file://mdev.conf \
            file://umount.busybox \
diff --git a/meta/recipes-core/busybox/files/busybox-syslog.default b/meta/recipes-core/busybox/files/busybox-syslog.default
new file mode 100644
index 0000000..a3d51ca
--- /dev/null
+++ b/meta/recipes-core/busybox/files/busybox-syslog.default
@@ -0,0 +1 @@
+OPTIONS="-C"
-- 
1.8.1.2


