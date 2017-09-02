Return-Path: <california.l.sullivan@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 322FB719E7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Sep 2017 00:04:59 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 01 Sep 2017 17:05:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,459,1498546800"; d="scan'208";a="1010184375"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga003.jf.intel.com with ESMTP; 01 Sep 2017 17:05:00 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Sep 2017 17:04:58 -0700
Message-Id: <20170902000458.28655-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.9.5
Cc: otavio@ossystems.com.br
Subject: [PATCH] initramfs-framework: split setup-live and install-efi into separate recipes
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
X-List-Received-Date: Sat, 02 Sep 2017 00:05:00 -0000

Having these the initramfs-framework recipe forced initramfs-framework
users to build several tools they didn't need, and made it more
difficult to declare the recipe as allarch.

Fixes [YOCTO #12024].

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 .../initrdscripts/initramfs-framework_1.0.bb         | 20 ++------------------
 .../initramfs-module-install-efi_1.0.bb              | 18 ++++++++++++++++++
 .../initrdscripts/initramfs-module-setup-live_1.0.bb | 18 ++++++++++++++++++
 3 files changed, 38 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 77b2ff8..c07a5fc 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -14,8 +14,7 @@ SRC_URI = "file://init \
            file://udev \
            file://e2fs \
            file://debug \
-           file://setup-live \
-           file://install-efi.sh"
+          "
 
 S = "${WORKDIR}"
 
@@ -27,9 +26,6 @@ do_install() {
     install -m 0755 ${WORKDIR}/rootfs ${D}/init.d/90-rootfs
     install -m 0755 ${WORKDIR}/finish ${D}/init.d/99-finish
 
-    # setup-live
-    install -m 0755 ${WORKDIR}/setup-live ${D}/init.d/80-setup-live
-
     # mdev
     install -m 0755 ${WORKDIR}/mdev ${D}/init.d/01-mdev
 
@@ -42,9 +38,6 @@ do_install() {
     # debug
     install -m 0755 ${WORKDIR}/debug ${D}/init.d/00-debug
 
-    # install-efi
-    install -m 0755 ${WORKDIR}/install-efi.sh ${D}/init.d/install-efi.sh
-
     # Create device nodes expected by some kernels in initramfs
     # before even executing /init.
     install -d ${D}/dev
@@ -57,8 +50,7 @@ PACKAGES = "${PN}-base \
             initramfs-module-e2fs \
             initramfs-module-rootfs \
             initramfs-module-debug \
-            initramfs-module-setup-live \
-            initramfs-module-install-efi"
+           "
 
 FILES_${PN}-base = "/init /init.d/99-finish /dev"
 
@@ -78,10 +70,6 @@ SUMMARY_initramfs-module-udev = "initramfs support for udev"
 RDEPENDS_initramfs-module-udev = "${PN}-base udev"
 FILES_initramfs-module-udev = "/init.d/01-udev"
 
-SUMMARY_initramfs-module-setup-live = "initramfs support for setup live"
-RDEPENDS_initramfs-module-setup-live = "${PN}-base udev-extraconf"
-FILES_initramfs-module-setup-live = "/init.d/80-setup-live"
-
 SUMMARY_initramfs-module-e2fs = "initramfs support for ext4/ext3/ext2 filesystems"
 RDEPENDS_initramfs-module-e2fs = "${PN}-base"
 FILES_initramfs-module-e2fs = "/init.d/10-e2fs"
@@ -93,7 +81,3 @@ FILES_initramfs-module-rootfs = "/init.d/90-rootfs"
 SUMMARY_initramfs-module-debug = "initramfs dynamic debug support"
 RDEPENDS_initramfs-module-debug = "${PN}-base"
 FILES_initramfs-module-debug = "/init.d/00-debug"
-
-SUMMARY_initramfs-module-install-efi = "initramfs support for installation option"
-RDEPENDS_initramfs-module-install-efi = "${PN}-base parted e2fsprogs-mke2fs dosfstools util-linux-blkid"
-FILES_initramfs-module-install-efi = "/init.d/install-efi.sh"
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
new file mode 100644
index 0000000..8143f31
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "initramfs-framework module for installation option"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+RDEPENDS_${PN} = "initramfs-framework-base parted e2fsprogs-mke2fs dosfstools util-linux-blkid"
+
+PR = "r1"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/initramfs-framework:"
+SRC_URI = "file://install-efi.sh"
+
+S = "${WORKDIR}"
+
+do_install() {
+    install -d ${D}/init.d
+    install -m 0755 ${WORKDIR}/install-efi.sh ${D}/init.d/install-efi.sh
+}
+
+FILES_${PN} = "/init.d/install-efi.sh"
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
new file mode 100644
index 0000000..7627cdc
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "initramfs-framework module for live booting"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+RDEPENDS_${PN} = "initramfs-framework-base udev-extraconf"
+
+PR = "r1"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/initramfs-framework:"
+SRC_URI = "file://setup-live"
+
+S = "${WORKDIR}"
+
+do_install() {
+    install -d ${D}/init.d
+    install -m 0755 ${WORKDIR}/setup-live ${D}/init.d/80-setup-live
+}
+
+FILES_${PN} = "/init.d/80-setup-live"
-- 
2.9.5


