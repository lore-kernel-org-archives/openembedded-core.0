Return-Path: <california.l.sullivan@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9261078684
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 22:58:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Dec 2017 14:58:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,428,1508828400"; d="scan'208";a="17433563"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 19 Dec 2017 14:58:36 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2017 14:58:18 -0800
Message-Id: <20171219225831.22587-6-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171219225831.22587-1-california.l.sullivan@intel.com>
References: <20171219225831.22587-1-california.l.sullivan@intel.com>
Subject: [PATCH RFC 05/18] grub-efi: install to /boot/
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
X-List-Received-Date: Tue, 19 Dec 2017 22:58:38 -0000

Since /boot/ will be recipe/package controlled now we can't just deploy.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/recipes-bsp/grub/grub-efi_2.02.bb | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index a38d05a2a0d..1c882650524 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
@@ -3,8 +3,7 @@ require grub2.inc
 GRUBPLATFORM = "efi"
 
 DEPENDS_class-target = "grub-efi-native"
-RDEPENDS_${PN}_class-target = "diffutils freetype"
-
+RDEPENDS_${PN}_class-target = "diffutils freetype virtual/grub-bootconf"
 SRC_URI += " \
            file://cfg \
           "
@@ -36,6 +35,28 @@ EXTRA_OECONF += "--enable-efiemu=no"
 # and many other places in the grub code when compiled with some native gcc compilers (specifically, gentoo)
 CFLAGS_append_class-native = " -Wno-error=trampolines"
 
+do_mkimage() {
+	cd ${B}
+	# Search for the grub.cfg on the local boot media by using the
+	# built in cfg file provided via this recipe
+	grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
+	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
+	               ${GRUB_BUILDIN}
+}
+
+addtask mkimage before do_install after do_compile
+
+do_mkimage_class-native() {
+	:
+}
+
+do_install_append_class-target() {
+	install -d ${D}/boot
+	install -d ${D}/boot/EFI
+	install -d ${D}/boot/EFI/BOOT
+	install -m 644 ${B}/${GRUB_IMAGE} ${D}/boot/EFI/BOOT/
+}
+
 do_install_class-native() {
 	install -d ${D}${bindir}
 	install -m 755 grub-mkimage ${D}${bindir}
@@ -55,11 +76,6 @@ GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal \
                  efi_gop iso9660 search loadenv test"
 
 do_deploy() {
-	# Search for the grub.cfg on the local boot media by using the
-	# built in cfg file provided via this recipe
-	grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
-	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
-	               ${GRUB_BUILDIN}
 	install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
 }
 
@@ -71,8 +87,10 @@ addtask deploy after do_install before do_build
 
 FILES_${PN} += "${libdir}/grub/${GRUB_TARGET}-efi \
                 ${datadir}/grub \
+                /boot/EFI/BOOT/${GRUB_IMAGE} \
                 "
 
+
 # 64-bit binaries are expected for the bootloader with an x32 userland
 INSANE_SKIP_${PN}_append_linux-gnux32 = " arch"
 INSANE_SKIP_${PN}-dbg_append_linux-gnux32 = " arch"
-- 
2.14.3


