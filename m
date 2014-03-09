Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 8D4F16F62F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Mar 2014 16:05:01 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Mar 2014 09:05:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,618,1389772800"; d="scan'208";a="416711251"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 09 Mar 2014 09:04:36 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id D42BE6A4007;
	Sun,  9 Mar 2014 09:04:24 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Mar 2014 18:04:29 +0200
Message-Id: <3fd54b6e1e285c1a86829f6f37ab2395079d24a2.1394379902.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1394379900.git.stefanx.stanacar@intel.com>
References: <cover.1394379900.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1394379900.git.stefanx.stanacar@intel.com>
References: <cover.1394379900.git.stefanx.stanacar@intel.com>
Cc: dvhart@linux.intel.com
Subject: [PATCH 3/4] bootimg/grub-efi.bbclass: allow using a different class for EFI images
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
X-List-Received-Date: Sun, 09 Mar 2014 16:05:04 -0000

Abstract away some names so one can select using EFI_PROVIDER a different
class than grub-efi for populating live images, basically allowing the use
of a different bootloader than grub-efi.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/classes/boot-directdisk.bbclass |  7 ++++---
 meta/classes/bootimg.bbclass         |  9 +++++----
 meta/classes/grub-efi.bbclass        | 12 ++++++------
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 42b3415..88e5c52 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -32,7 +32,8 @@ BOOTDD_VOLUME_ID   ?= "boot"
 BOOTDD_EXTRA_SPACE ?= "16384"
 
 EFI = "${@base_contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
-EFI_CLASS = "${@base_contains("MACHINE_FEATURES", "efi", "grub-efi", "", d)}"
+EFI_PROVIDER ?= "grub-efi"
+EFI_CLASS = "${@base_contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}", "", d)}"
 
 # Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
 # contain "efi". This way legacy is supported by default if neither is
@@ -87,7 +88,7 @@ build_boot_dd() {
 		syslinux_hddimg_populate $HDDDIR
 	fi
 	if [ "${EFI}" = "1" ]; then
-		grubefi_hddimg_populate $HDDDIR
+		efi_hddimg_populate $HDDDIR
 	fi
 
 	if [ "${IS_VMDK}" = "true" ]; then
@@ -154,7 +155,7 @@ python do_bootdirectdisk() {
     if d.getVar("PCBIOS", True) == "1":
         bb.build.exec_func('build_syslinux_cfg', d)
     if d.getVar("EFI", True) == "1":
-        bb.build.exec_func('build_grub_cfg', d)
+        bb.build.exec_func('build_efi_cfg', d)
     bb.build.exec_func('build_boot_dd', d)
 }
 
diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index c370bd6..b13eef9 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -42,7 +42,8 @@ BOOTIMG_VOLUME_ID   ?= "boot"
 BOOTIMG_EXTRA_SPACE ?= "512"
 
 EFI = "${@base_contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
-EFI_CLASS = "${@base_contains("MACHINE_FEATURES", "efi", "grub-efi", "", d)}"
+EFI_PROVIDER ?= "grub-efi"
+EFI_CLASS = "${@base_contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}", "", d)}"
 
 # Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
 # contain "efi". This way legacy is supported by default if neither is
@@ -89,7 +90,7 @@ build_iso() {
 		syslinux_iso_populate ${ISODIR}
 	fi
 	if [ "${EFI}" = "1" ]; then
-		grubefi_iso_populate ${ISODIR}
+		efi_iso_populate ${ISODIR}
 		build_fat_img ${EFIIMGDIR} ${ISODIR}/efi.img
 	fi
 
@@ -206,7 +207,7 @@ build_hddimg() {
 			syslinux_hddimg_populate ${HDDDIR}
 		fi
 		if [ "${EFI}" = "1" ]; then
-			grubefi_hddimg_populate ${HDDDIR}
+			efi_hddimg_populate ${HDDDIR}
 		fi
 
 		build_fat_img ${HDDDIR} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
@@ -227,7 +228,7 @@ python do_bootimg() {
     if d.getVar("PCBIOS", True) == "1":
         bb.build.exec_func('build_syslinux_cfg', d)
     if d.getVar("EFI", True) == "1":
-        bb.build.exec_func('build_grub_cfg', d)
+        bb.build.exec_func('build_efi_cfg', d)
     bb.build.exec_func('build_hddimg', d)
     bb.build.exec_func('build_iso', d)
 }
diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 71bd00f..5c80c17 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -26,7 +26,7 @@ GRUB_OPTS ?= "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1"
 
 EFIDIR = "/EFI/BOOT"
 
-grubefi_populate() {
+efi_populate() {
 	# DEST must be the root of the image so that EFIDIR is not
 	# nested under a top level directory.
 	DEST=$1
@@ -42,9 +42,9 @@ grubefi_populate() {
 	install -m 0644 ${GRUBCFG} ${DEST}${EFIDIR}
 }
 
-grubefi_iso_populate() {
+efi_iso_populate() {
 	iso_dir=$1
-	grubefi_populate $iso_dir
+	efi_populate $iso_dir
 	# Build a EFI directory to create efi.img
 	mkdir -p ${EFIIMGDIR}/${EFIDIR}
 	cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
@@ -55,11 +55,11 @@ grubefi_iso_populate() {
 	fi
 }
 
-grubefi_hddimg_populate() {
-	grubefi_populate $1
+efi_hddimg_populate() {
+	efi_populate $1
 }
 
-python build_grub_cfg() {
+python build_efi_cfg() {
     import sys
 
     workdir = d.getVar('WORKDIR', True)
-- 
1.8.5.3


