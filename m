Return-Path: <california.l.sullivan@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id BBB2778915
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 02:16:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2018 18:16:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,407,1515484800"; d="scan'208";a="178932793"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga004.jf.intel.com with ESMTP; 28 Feb 2018 18:16:13 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Feb 2018 18:15:00 -0800
Message-Id: <20180301021518.29564-4-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180301021518.29564-1-california.l.sullivan@intel.com>
References: <20180301021518.29564-1-california.l.sullivan@intel.com>
Subject: [PATCH v3 03/21] grub-efi: install to /boot/
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
X-List-Received-Date: Thu, 01 Mar 2018 02:16:12 -0000

Since /boot/ will be recipe/package controlled now we can't just deploy.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/recipes-bsp/grub/grub-bootconf_1.00.bb |  2 +-
 meta/recipes-bsp/grub/grub-efi_2.02.bb      | 34 +++++++++++++++++++++++------
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
index d376fde68b1..750f8c808a8 100644
--- a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
+++ b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
@@ -23,7 +23,7 @@ do_install() {
 	install -d ${D}/boot
 	install -d ${D}/boot/EFI
 	install -d ${D}/boot/EFI/BOOT
-	install -m 0744 grub-bootconf ${D}/boot/EFI/BOOT/grub.cfg
+	install grub-bootconf ${D}/boot/EFI/BOOT/grub.cfg
 }
 
 FILES_${PN} = "/boot/EFI/BOOT/grub.cfg"
diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index d5aa64c75f7..c5a68f01cef 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
@@ -3,7 +3,7 @@ require grub2.inc
 GRUBPLATFORM = "efi"
 
 DEPENDS_append_class-target = " grub-efi-native"
-RDEPENDS_${PN}_class-target = "diffutils freetype grub-common"
+RDEPENDS_${PN}_class-target = "diffutils freetype grub-common virtual/grub-bootconf"
 
 SRC_URI += " \
            file://cfg \
@@ -36,6 +36,28 @@ EXTRA_OECONF += "--enable-efiemu=no"
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
@@ -57,11 +79,6 @@ GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal \
                  efi_gop iso9660 configfile search loadenv test"
 
 do_deploy() {
-	# Search for the grub.cfg on the local boot media by using the
-	# built in cfg file provided via this recipe
-	grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
-	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
-	               ${GRUB_BUILDIN}
 	install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
 }
 
@@ -72,7 +89,10 @@ do_deploy_class-native() {
 addtask deploy after do_install before do_build
 
 FILES_${PN} = "${libdir}/grub/${GRUB_TARGET}-efi \
-                "
+               ${datadir}/grub \
+               /boot/EFI/BOOT/${GRUB_IMAGE} \
+               "
+
 
 # 64-bit binaries are expected for the bootloader with an x32 userland
 INSANE_SKIP_${PN}_append_linux-gnux32 = " arch"
-- 
2.14.3


