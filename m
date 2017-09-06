Return-Path: <california.l.sullivan@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5C76D60079
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 22:31:24 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 06 Sep 2017 15:31:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,355,1500966000"; d="scan'208";a="126258250"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga004.jf.intel.com with ESMTP; 06 Sep 2017 15:31:26 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Sep 2017 15:31:25 -0700
Message-Id: <20170906223125.21628-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.9.5
Cc: otavio@ossystems.com.br
Subject: [PATCH v2] initramfs-framework: split setup-live and install-efi into separate recipes
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
X-List-Received-Date: Wed, 06 Sep 2017 22:31:25 -0000

Having these the initramfs-framework recipe forced initramfs-framework
users to build several tools they didn't need, and made it more
difficult to declare the recipe as allarch.

Fixes [YOCTO #12024].

v2 changes:
  * fix SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS in layer.conf
  * bump PR of initramfs-framework
  * add allarch to setup-live and install-efi modules, as they're just
    shell scripts

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
I think I agree with Otavio on the allarch discussion. Setup-live at the
very least is applicable to everything, and while install-efi is
unlikely to be used for anything that's not x86-based, it EFI on arm
does technically exist.

We can discuss it more if necessary.

 meta/conf/layer.conf                               |  8 ++++----
 .../initrdscripts/initramfs-framework_1.0.bb       | 22 +++-------------------
 .../initramfs-module-install-efi_1.0.bb            | 20 ++++++++++++++++++++
 .../initramfs-module-setup-live_1.0.bb             | 20 ++++++++++++++++++++
 4 files changed, 47 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 04aa730..df457c2 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -50,12 +50,12 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   docbook-xsl-stylesheets->perl \
   ca-certificates->openssl \
   initramfs-framework->${VIRTUAL-RUNTIME_base-utils} \
-  initramfs-framework->dosfstools \
-  initramfs-framework->e2fsprogs \
   initramfs-framework->eudev \
-  initramfs-framework->parted \
   initramfs-framework->systemd \
-  initramfs-framework->util-linux \
+  initramfs-module-install-efi->dosfstools \
+  initramfs-module-install-efi->e2fsprogs \
+  initramfs-module-install-efi->parted \
+  initramfs-module-install-efi->util-linux \
   liberation-fonts->fontconfig \
   cantarell-fonts->fontconfig \
   gnome-icon-theme->librsvg \
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 77b2ff8..2afc37e 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_base-utils}"
 
-PR = "r3"
+PR = "r4"
 
 inherit allarch
 
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
index 0000000..541381b
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "initramfs-framework module for installation option"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+RDEPENDS_${PN} = "initramfs-framework-base parted e2fsprogs-mke2fs dosfstools util-linux-blkid"
+
+PR = "r1"
+
+inherit allarch
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
index 0000000..6e9c452
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "initramfs-framework module for live booting"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+RDEPENDS_${PN} = "initramfs-framework-base udev-extraconf"
+
+PR = "r1"
+
+inherit allarch
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


