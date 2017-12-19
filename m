Return-Path: <california.l.sullivan@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 2AF32786B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 22:58:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Dec 2017 14:58:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,428,1508828400"; d="scan'208";a="17433566"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 19 Dec 2017 14:58:36 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2017 14:58:19 -0800
Message-Id: <20171219225831.22587-7-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171219225831.22587-1-california.l.sullivan@intel.com>
References: <20171219225831.22587-1-california.l.sullivan@intel.com>
Subject: [PATCH RFC 06/18] grub-efi: if installed and EFI_PROVIDER, install as bootx64 or bootia32
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
X-List-Received-Date: Tue, 19 Dec 2017 22:58:40 -0000

This way we could theoretically support multiple bootloaders, and we
keep the convention of boot(x64|ia32).

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/recipes-bsp/grub/grub-efi_2.02.bb | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index 1c882650524..6d0cd4f4ea1 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
@@ -14,16 +14,19 @@ S = "${WORKDIR}/grub-${PV}"
 python __anonymous () {
     import re
     target = d.getVar('TARGET_ARCH')
+    prefix = "" if d.getVar('EFI_PROVIDER') == "grub-efi" else "grub-efi-"
     if target == "x86_64":
         grubtarget = 'x86_64'
-        grubimage = "grub-efi-bootx64.efi"
+        grubimage = prefix + "bootx64.efi"
     elif re.match('i.86', target):
         grubtarget = 'i386'
-        grubimage = "grub-efi-bootia32.efi"
+        grubimage = prefix + "bootia32.efi"
     else:
         raise bb.parse.SkipPackage("grub-efi is incompatible with target %s" % target)
     d.setVar("GRUB_TARGET", grubtarget)
     d.setVar("GRUB_IMAGE", grubimage)
+    prefix = "grub-efi-" if prefix == "" else ""
+    d.setVar("GRUB_IMAGE_PREFIX", prefix)
 }
 
 inherit deploy
@@ -40,7 +43,7 @@ do_mkimage() {
 	# Search for the grub.cfg on the local boot media by using the
 	# built in cfg file provided via this recipe
 	grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
-	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
+	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} \
 	               ${GRUB_BUILDIN}
 }
 
@@ -54,7 +57,7 @@ do_install_append_class-target() {
 	install -d ${D}/boot
 	install -d ${D}/boot/EFI
 	install -d ${D}/boot/EFI/BOOT
-	install -m 644 ${B}/${GRUB_IMAGE} ${D}/boot/EFI/BOOT/
+	install -m 644 ${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} ${D}/boot/EFI/BOOT/${GRUB_IMAGE}
 }
 
 do_install_class-native() {
@@ -76,7 +79,7 @@ GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal \
                  efi_gop iso9660 search loadenv test"
 
 do_deploy() {
-	install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
+	install -m 644 ${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} ${DEPLOYDIR}
 }
 
 do_deploy_class-native() {
-- 
2.14.3


