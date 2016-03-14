Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 23C5560232
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 23:10:04 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 14 Mar 2016 16:10:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,337,1455004800"; d="scan'208";a="66318833"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga004.fm.intel.com with ESMTP; 14 Mar 2016 16:10:05 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Mar 2016 23:09:37 +0000
Message-Id: <1457996977-24572-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH] eudev: split eudev-hwdb from eudev
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
X-List-Received-Date: Mon, 14 Mar 2016 23:10:06 -0000

The eudev recipe included the hwdb.d directory by default,
which ended up making the eudev package a lot heavier than
the old udev, this patch splits the eudev-hwdb package to
avoid using unecessary space when required

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-core/udev/eudev_3.1.5.bb | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/eudev_3.1.5.bb b/meta/recipes-core/udev/eudev_3.1.5.bb
index e94e0dc..b77744d 100644
--- a/meta/recipes-core/udev/eudev_3.1.5.bb
+++ b/meta/recipes-core/udev/eudev_3.1.5.bb
@@ -23,7 +23,7 @@ UPSTREAM_CHECK_URI = "https://github.com/gentoo/eudev/releases"
 SRC_URI[md5sum] = "e130f892d8744e292cb855db79935f68"
 SRC_URI[sha256sum] = "ce9d5fa91e3a42c7eb95512ca0fa2a631e89833053066bb6cdf42046b2a88553"
 
-inherit autotools update-rc.d
+inherit autotools update-rc.d qemu
 
 EXTRA_OECONF = " \
     --sbindir=${base_sbindir} \
@@ -69,6 +69,8 @@ INITSCRIPT_PARAMS_udev-cache = "start 36 S ."
 
 PACKAGES =+ "libudev"
 PACKAGES =+ "udev-cache"
+PACKAGES =+ "eudev-hwdb"
+
 
 FILES_${PN} += "${libexecdir} ${nonarch_base_libdir}/udev ${bindir}/udevadm"
 FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc \
@@ -77,12 +79,30 @@ FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc \
                    ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc"
 FILES_libudev = "${base_libdir}/libudev.so.*"
 FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-cache"
+FILES_eudev-hwdb = "${sysconfdir}/udev/hwdb.d"
+
+RDEPENDS_eudev-hwdb += "eudev"
+
+RRECOMMENDS_${PN} += "udev-cache eudev-hwdb"
+
+RPROVIDES_${PN} = "hotplug udev"
 
 python () {
     if bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
         raise bb.parse.SkipPackage("'systemd' in DISTRO_FEATURES")
 }
 
-RRECOMMENDS_${PN} += "udev-cache"
+pkg_postinst_eudev-hwdb () {
+    if test -n "$D"; then
+        ${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
+            --root $D
+        chown root:root $D${sysconfdir}/udev/hwdb.bin
+    else
+        udevadm hwdb --update
+    fi
+}
+
+pkg_prerm_eudev-hwdb () {
+        rm -f $D${sysconfdir}/udev/hwdb.bin
+}
 
-RPROVIDES_${PN} = "hotplug udev"
-- 
2.6.2


