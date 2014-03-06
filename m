Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EA5B96F593
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 18:16:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Mar 2014 10:11:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,602,1389772800"; d="scan'208";a="495327241"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 06 Mar 2014 10:16:04 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id 974666A4007;
	Thu,  6 Mar 2014 10:15:52 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 20:15:55 +0200
Message-Id: <689eae32fd2c27e92e5ed77dee0fcbf6586c8d4f.1394128875.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1394128875.git.stefanx.stanacar@intel.com>
References: <cover.1394128875.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1394128875.git.stefanx.stanacar@intel.com>
References: <cover.1394128875.git.stefanx.stanacar@intel.com>
Cc: dvhart@linux.intel.com
Subject: [PATCH 2/3] bootimg/grub-efi.bbclass: allow using a different class for EFI images
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
X-List-Received-Date: Thu, 06 Mar 2014 18:16:18 -0000

Abstract away some names so one can select using EFI_PROVIDER a different
class than grub-efi for populating live images, basically allowing the use
of a different bootloader than grub-efi.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/classes/boot-directdisk.bbclass | 7 ++++---
 meta/classes/bootimg.bbclass         | 9 +++++----
 meta/classes/grub-efi.bbclass        | 6 ++++++
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 42b3415..c35b4bb 100644
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
+		${EFICLASS_FUNC_PREFIX}_hddimg_populate $HDDDIR
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
index c370bd6..f8cfd37 100644
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
+		${EFICLASS_FUNC_PREFIX}_iso_populate ${ISODIR}
 		build_fat_img ${EFIIMGDIR} ${ISODIR}/efi.img
 	fi
 
@@ -206,7 +207,7 @@ build_hddimg() {
 			syslinux_hddimg_populate ${HDDDIR}
 		fi
 		if [ "${EFI}" = "1" ]; then
-			grubefi_hddimg_populate ${HDDDIR}
+			${EFICLASS_FUNC_PREFIX}_hddimg_populate ${HDDDIR}
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
index 71bd00f..f7fe8d8 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -15,6 +15,8 @@
 # ${GRUB_OPTS} - additional options to add to the config, ';' delimited # (optional)
 # ${GRUB_TIMEOUT} - timeout before executing the deault label (optional)
 
+EFICLASS_FUNC_PREFIX = "grubefi"
+
 do_bootimg[depends] += "grub-efi:do_deploy"
 do_bootdirectdisk[depends] += "grub-efi:do_deploy"
 
@@ -139,3 +141,7 @@ python build_grub_cfg() {
 
     cfgfile.close()
 }
+
+python build_efi_cfg() {
+    bb.build.exec_func("build_grub_cfg", d)
+}
-- 
1.8.5.3


