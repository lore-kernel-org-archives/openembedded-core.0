Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A75F60796
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 09:48:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2M9mMSP027253
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 02:48:22 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 22 Mar 2016 02:48:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Mar 2016 02:48:19 -0700
Message-ID: <985fac51a40f7e5eb3ea94e1dcb9bc77c33d0624.1458640034.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1458640034.git.liezhi.yang@windriver.com>
References: <cover.1458640034.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] bootimg.bbclass: fix settings for grub-efi.bbclass
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
X-List-Received-Date: Tue, 22 Mar 2016 09:48:22 -0000
Content-Type: text/plain

Fixed:
- Found potential conflicted var LABELS ...
  Set LABELS to "boot install" would build out broken images when build
  vm + live together, use set_live_vm_vars() to fix the problem.

- Use ROOT and LABEL in boot-directdisk.bbclass and image-foo.bbclass,
  they are not only used by syslinux.bbclass, but also grub-efi.bbclass,
  add "SYSLINUX_" prefix would mislead users.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/boot-directdisk.bbclass |    6 +++---
 meta/classes/bootimg.bbclass         |    4 +---
 meta/classes/grub-efi.bbclass        |    1 +
 meta/classes/image-live.bbclass      |    5 ++---
 meta/classes/image-vm.bbclass        |    3 +--
 meta/classes/image.bbclass           |   13 +++++++++++++
 meta/classes/syslinux.bbclass        |   13 +------------
 7 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index fcdef26..c6ada47 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -58,8 +58,8 @@ inherit ${PCBIOS_CLASS}
 inherit ${EFI_CLASS}
 
 DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
-SYSLINUX_ROOT_VM ?= "root=/dev/sda2"
-SYSLINUX_CFG_VM  ?= "${S}/syslinux_hdd.cfg"
+ROOT_VM ?= "root=/dev/sda2"
+SYSLINUX_CFG_VM  ?= "${S}/syslinux_vm.cfg"
 
 boot_direct_populate() {
 	dest=$1
@@ -160,8 +160,8 @@ build_boot_dd() {
 
 python do_bootdirectdisk() {
     validate_disk_signature(d)
+    set_live_vm_vars(d, 'VM')
     if d.getVar("PCBIOS", True) == "1":
-        syslinux_set_vars(d, 'VM')
         bb.build.exec_func('build_syslinux_cfg', d)
     if d.getVar("EFI", True) == "1":
         bb.build.exec_func('build_efi_cfg', d)
diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 0249a9d..70ce070 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -49,8 +49,6 @@ EFI_CLASS = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}",
 
 KERNEL_IMAGETYPE ??= "bzImage"
 
-LABELS ?= "boot install"
-
 # Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
 # contain "efi". This way legacy is supported by default if neither is
 # specified, maintaining the original behavior.
@@ -282,8 +280,8 @@ build_hddimg() {
 }
 
 python do_bootimg() {
+    set_live_vm_vars(d, 'LIVE')
     if d.getVar("PCBIOS", True) == "1":
-        syslinux_set_vars(d, 'LIVE')
         bb.build.exec_func('build_syslinux_cfg', d)
     if d.getVar("EFI", True) == "1":
         bb.build.exec_func('build_efi_cfg', d)
diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 9a4220a..331581d 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -25,6 +25,7 @@ GRUB_TIMEOUT ?= "10"
 GRUB_OPTS ?= "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1"
 
 EFIDIR = "/EFI/BOOT"
+APPEND_prepend = " ${ROOT} "
 
 # Need UUID utility code.
 inherit fs-uuid
diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index b8f21cb..504725d 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -1,9 +1,8 @@
 
 INITRD_IMAGE_LIVE ?= "core-image-minimal-initramfs"
 INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-${MACHINE}.cpio.gz"
-SYSLINUX_ROOT_LIVE ?= "root=/dev/ram0"
-SYSLINUX_LABELS_LIVE ?= "boot install"
-LABELS_LIVE ?= "${SYSLINUX_LABELS_LIVE}"
+ROOT_LIVE ?= "root=/dev/ram0"
+LABELS_LIVE ?= "boot install"
 SYSLINUX_CFG_LIVE ?= "${S}/syslinux_live.cfg"
 
 ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext4"
diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index 17e87a5..8608ec0 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -1,6 +1,5 @@
 
-SYSLINUX_LABELS_VM ?= "boot"
-LABELS_VM ?= "${SYSLINUX_LABELS_VM}"
+LABELS_VM ?= "boot"
 
 # Using an initramfs is optional. Enable it by setting INITRD_IMAGE_VM.
 INITRD_IMAGE_VM ?= ""
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 3ab432e..560cc6d 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -539,3 +539,16 @@ do_bundle_initramfs () {
 	:
 }
 addtask bundle_initramfs after do_image_complete
+
+# Some of the vars for vm and live image are conflicted, this function
+# is used for fixing the problem.
+def set_live_vm_vars(d, suffix):
+    vars = ['SYSLINUX_CFG', 'ROOT', 'LABELS', 'INITRD']
+    for var in vars:
+        var_with_suffix = var + '_' + suffix
+        if d.getVar(var, True):
+            bb.warn('Found potential conflicted var %s, please use %s rather than %s' % \
+                (var, var_with_suffix, var))
+        elif d.getVar(var_with_suffix, True):
+            d.setVar(var, d.getVar(var_with_suffix, True))
+
diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 1b644b2..6de656b 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -33,23 +33,12 @@ AUTO_SYSLINUXMENU ?= "1"
 ISO_BOOTIMG = "isolinux/isolinux.bin"
 ISO_BOOTCAT = "isolinux/boot.cat"
 MKISOFS_OPTIONS = "-no-emul-boot -boot-load-size 4 -boot-info-table"
+SYSLINUX_ROOT ?= "${ROOT}"
 APPEND_prepend = " ${SYSLINUX_ROOT} "
 
 # Need UUID utility code.
 inherit fs-uuid
 
-# Some of the vars for vm and live image are conflicted, this function
-# is used for fixing the problem.
-def syslinux_set_vars(d, suffix):
-    vars = ['SYSLINUX_ROOT', 'SYSLINUX_CFG', 'LABELS', 'INITRD']
-    for var in vars:
-        var_with_suffix = var + '_' + suffix
-        if d.getVar(var, True):
-            bb.warn('Found potential conflicted var %s, please use %s rather than %s' % \
-                (var, var_with_suffix, var))
-        elif d.getVar(var_with_suffix, True):
-            d.setVar(var, d.getVar(var_with_suffix, True))
-
 syslinux_populate() {
 	DEST=$1
 	BOOTDIR=$2
-- 
1.7.9.5


