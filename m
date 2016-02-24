Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 63AD377296
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 09:24:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1O9O1xW023541
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 01:24:01 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 24 Feb 2016 01:24:00 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Feb 2016 01:23:58 -0800
Message-ID: <f70aac246a19614f16124a0293578ee46919399b.1456304688.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1456304688.git.liezhi.yang@windriver.com>
References: <cover.1456304688.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] syslinux.bbclass: make vm and live can be built together
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
X-List-Received-Date: Wed, 24 Feb 2016 09:24:00 -0000
Content-Type: text/plain

* The vm image(hdddirect, vmdk, qcow2, vdi) and live image (hddimg, iso)
  couldn't be built together because the following vars settings are
  conflicted:
  - SYSLINUX_ROOT (/dev/sda2 vs /dev/ram0)
  - LABELS (boot vs boot install)
  - INITRD (None vs live install)
  - SYSLINUX_CFG (see above)
  Introduce new vars (SYSLINUX_ROOT_VM/_LIVE, the samilar to others) to
  make them can work together, now we can build all of them together:

  IMAGE_FSTYPES += "live iso hddimg hdddirect vmdk qcow2 vdi"

* Use SYSLINUX_CFG rather than SYSLINUXCFG to keep align with others
  SYSLINUX vars.

* The SYSLINUX_TIMEOUT had been set, but it didn't work since
  AUTO_SYSLINUXMENU wasn't set, this would cause confusions, so also set
  AUTO_SYSLINUXMENU.

* Move SYSLINUX_PROMPT and SYSLINUX_TIMEOUT to syslinux.bbclass rather
  than in separate classes since they are the same.

* Set SYSLINUX_TIMEOUT to 50 to have a unique timeout for syslinux.

[YOCTO #9161]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/boot-directdisk.bbclass |    8 ++++----
 meta/classes/bootimg.bbclass         |    1 +
 meta/classes/image-live.bbclass      |   16 ++++++++--------
 meta/classes/image-vm.bbclass        |   15 +++++++--------
 meta/classes/syslinux.bbclass        |   23 ++++++++++++++++++-----
 5 files changed, 38 insertions(+), 25 deletions(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 89007e3..fcdef26 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -53,14 +53,13 @@ def pcbios_class(d):
 PCBIOS = "${@pcbios(d)}"
 PCBIOS_CLASS = "${@pcbios_class(d)}"
 
+# Get the build_syslinux_cfg() function from the syslinux class
 inherit ${PCBIOS_CLASS}
 inherit ${EFI_CLASS}
 
-# Get the build_syslinux_cfg() function from the syslinux class
-
 DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
-SYSLINUX_ROOT ?= "root=/dev/sda2"
-SYSLINUX_TIMEOUT ?= "10"
+SYSLINUX_ROOT_VM ?= "root=/dev/sda2"
+SYSLINUX_CFG_VM  ?= "${S}/syslinux_hdd.cfg"
 
 boot_direct_populate() {
 	dest=$1
@@ -162,6 +161,7 @@ build_boot_dd() {
 python do_bootdirectdisk() {
     validate_disk_signature(d)
     if d.getVar("PCBIOS", True) == "1":
+        syslinux_set_vars(d, 'VM')
         bb.build.exec_func('build_syslinux_cfg', d)
     if d.getVar("EFI", True) == "1":
         bb.build.exec_func('build_efi_cfg', d)
diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index b174266..7946839 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -281,6 +281,7 @@ build_hddimg() {
 
 python do_bootimg() {
     if d.getVar("PCBIOS", True) == "1":
+        syslinux_set_vars(d, 'LIVE')
         bb.build.exec_func('build_syslinux_cfg', d)
     if d.getVar("EFI", True) == "1":
         bb.build.exec_func('build_efi_cfg', d)
diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index badf40d..b8f21cb 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -1,10 +1,10 @@
 
-INITRD_IMAGE ?= "core-image-minimal-initramfs"
-INITRD ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE}-${MACHINE}.cpio.gz"
-SYSLINUX_ROOT ?= "root=/dev/ram0"
-SYSLINUX_TIMEOUT ?= "50"
-SYSLINUX_LABELS ?= "boot install"
-LABELS_append = " ${SYSLINUX_LABELS} "
+INITRD_IMAGE_LIVE ?= "core-image-minimal-initramfs"
+INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-${MACHINE}.cpio.gz"
+SYSLINUX_ROOT_LIVE ?= "root=/dev/ram0"
+SYSLINUX_LABELS_LIVE ?= "boot install"
+LABELS_LIVE ?= "${SYSLINUX_LABELS_LIVE}"
+SYSLINUX_CFG_LIVE ?= "${S}/syslinux_live.cfg"
 
 ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext4"
 
@@ -19,9 +19,9 @@ IMAGE_TYPES_MASKED += "live hddimg iso"
 
 python() {
     image_b = d.getVar('IMAGE_BASENAME', True)
-    initrd_i = d.getVar('INITRD_IMAGE', True)
+    initrd_i = d.getVar('INITRD_IMAGE_LIVE', True)
     if image_b == initrd_i:
-        bb.error('INITRD_IMAGE %s cannot use image live, hddimg or iso.' % initrd_i)
+        bb.error('INITRD_IMAGE_LIVE %s cannot use image live, hddimg or iso.' % initrd_i)
         bb.fatal('Check IMAGE_FSTYPES and INITRAMFS_FSTYPES settings.')
     else:
         d.appendVarFlag('do_bootimg', 'depends', ' %s:do_image_complete' % initrd_i)
diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index 6f3a55b..17e87a5 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -1,18 +1,17 @@
 
-SYSLINUX_PROMPT ?= "0"
-SYSLINUX_LABELS = "boot"
-LABELS_append = " ${SYSLINUX_LABELS} "
+SYSLINUX_LABELS_VM ?= "boot"
+LABELS_VM ?= "${SYSLINUX_LABELS_VM}"
 
-# Using an initramfs is optional. Enable it by setting INITRD_IMAGE.
-INITRD_IMAGE ?= ""
-INITRD ?= "${@'${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE}-${MACHINE}.cpio.gz' if '${INITRD_IMAGE}' else ''}"
-do_bootdirectdisk[depends] += "${@'${INITRD_IMAGE}:do_image_complete' if '${INITRD_IMAGE}' else ''}"
+# Using an initramfs is optional. Enable it by setting INITRD_IMAGE_VM.
+INITRD_IMAGE_VM ?= ""
+INITRD_VM ?= "${@'${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_VM}-${MACHINE}.cpio.gz' if '${INITRD_IMAGE_VM}' else ''}"
+do_bootdirectdisk[depends] += "${@'${INITRD_IMAGE_VM}:do_image_complete' if '${INITRD_IMAGE_VM}' else ''}"
 
 # need to define the dependency and the ROOTFS for directdisk
 do_bootdirectdisk[depends] += "${PN}:do_image_ext4"
 ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext4"
 
-# creating VM images relies on having a hddimg so ensure we inherit it here.
+# creating VM images relies on having a hdddirect so ensure we inherit it here.
 inherit boot-directdisk
 
 IMAGE_TYPEDEP_vmdk = "ext4"
diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 44ef9a9..1b644b2 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -20,8 +20,6 @@
 do_bootimg[depends] += "${MLPREFIX}syslinux:do_populate_sysroot \
                         syslinux-native:do_populate_sysroot"
 
-SYSLINUXCFG  = "${S}/syslinux.cfg"
-
 ISOLINUXDIR = "/isolinux"
 SYSLINUXDIR = "/"
 # The kernel has an internal default console, which you can override with
@@ -29,6 +27,9 @@ SYSLINUXDIR = "/"
 SYSLINUX_DEFAULT_CONSOLE ?= ""
 SYSLINUX_SERIAL ?= "0 115200"
 SYSLINUX_SERIAL_TTY ?= "console=ttyS0,115200"
+SYSLINUX_PROMPT ?= "0"
+SYSLINUX_TIMEOUT ?= "50"
+AUTO_SYSLINUXMENU ?= "1"
 ISO_BOOTIMG = "isolinux/isolinux.bin"
 ISO_BOOTCAT = "isolinux/boot.cat"
 MKISOFS_OPTIONS = "-no-emul-boot -boot-load-size 4 -boot-info-table"
@@ -37,6 +38,18 @@ APPEND_prepend = " ${SYSLINUX_ROOT} "
 # Need UUID utility code.
 inherit fs-uuid
 
+# Some of the vars for vm and live image are conflicted, this function
+# is used for fixing the problem.
+def syslinux_set_vars(d, suffix):
+    vars = ['SYSLINUX_ROOT', 'SYSLINUX_CFG', 'LABELS', 'INITRD']
+    for var in vars:
+        var_with_suffix = var + '_' + suffix
+        if d.getVar(var, True):
+            bb.warn('Found potential conflicted var %s, please use %s rather than %s' % \
+                (var, var_with_suffix, var))
+        elif d.getVar(var_with_suffix, True):
+            d.setVar(var, d.getVar(var_with_suffix, True))
+
 syslinux_populate() {
 	DEST=$1
 	BOOTDIR=$2
@@ -45,7 +58,7 @@ syslinux_populate() {
 	install -d ${DEST}${BOOTDIR}
 
 	# Install the config files
-	install -m 0644 ${SYSLINUXCFG} ${DEST}${BOOTDIR}/${CFGNAME}
+	install -m 0644 ${SYSLINUX_CFG} ${DEST}${BOOTDIR}/${CFGNAME}
 	if [ "${AUTO_SYSLINUXMENU}" = 1 ] ; then
 		install -m 0644 ${STAGING_DATADIR}/syslinux/vesamenu.c32 ${DEST}${BOOTDIR}/vesamenu.c32
 		install -m 0444 ${STAGING_DATADIR}/syslinux/libcom32.c32 ${DEST}${BOOTDIR}/libcom32.c32
@@ -96,9 +109,9 @@ python build_syslinux_cfg () {
         bb.debug(1, "No labels, nothing to do")
         return
 
-    cfile = d.getVar('SYSLINUXCFG', True)
+    cfile = d.getVar('SYSLINUX_CFG', True)
     if not cfile:
-        raise bb.build.FuncFailed('Unable to read SYSLINUXCFG')
+        raise bb.build.FuncFailed('Unable to read SYSLINUX_CFG')
 
     try:
         cfgfile = file(cfile, 'w')
-- 
1.7.9.5


