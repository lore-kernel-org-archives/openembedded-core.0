Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 17BCB6D782
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 10:01:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAMA13xT026125
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Nov 2013 02:01:03 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Fri, 22 Nov 2013 02:01:02 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Nov 2013 18:00:58 +0800
Message-ID: <68e0be011d01c422c2cfade524de222a340343ba.1385113330.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1385113330.git.jackie.huang@windriver.com>
References: <cover.1385113330.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: phcoder@gmail.com, dvhart@linux.intel.com
Subject: [PATCH 1/2] grub-efi: change to generate EFI image in target package
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
X-List-Received-Date: Fri, 22 Nov 2013 10:01:05 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

To generate the target EFI image in a native package, it requires
the host gcc have the ability to do -m32/-m64 compiling, but gcc
doesn't have that support on the 32bit version of some distributions
(e.g. rehl, suse), it would fail when build a 64bit target on these
32bit hosts.

In fact, all we need from grub-efi-native is the grub-mkimage binary,
so change the solution to:
 * grub-efi-native only install grub-mkimage
 * grub-efi compiles target modules, generates EFI image
   with grub-mkimage and deploy, but install nothing.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/classes/grub-efi.bbclass                      |  4 +-
 .../{grub-efi-native_2.00.bb => grub-efi_2.00.bb}  | 43 ++++++++++++----------
 2 files changed, 26 insertions(+), 21 deletions(-)
 rename meta/recipes-bsp/grub/{grub-efi-native_2.00.bb => grub-efi_2.00.bb} (77%)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 2f00901..71bd00f 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -15,8 +15,8 @@
 # ${GRUB_OPTS} - additional options to add to the config, ';' delimited # (optional)
 # ${GRUB_TIMEOUT} - timeout before executing the deault label (optional)
 
-do_bootimg[depends] += "grub-efi-${TRANSLATED_TARGET_ARCH}-native:do_deploy"
-do_bootdirectdisk[depends] += "grub-efi-${TRANSLATED_TARGET_ARCH}-native:do_deploy"
+do_bootimg[depends] += "grub-efi:do_deploy"
+do_bootdirectdisk[depends] += "grub-efi:do_deploy"
 
 GRUB_SERIAL ?= "console=ttyS0,115200"
 GRUBCFG = "${S}/grub.cfg"
diff --git a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
similarity index 77%
rename from meta/recipes-bsp/grub/grub-efi-native_2.00.bb
rename to meta/recipes-bsp/grub/grub-efi_2.00.bb
index 04973b5..2fe688c 100644
--- a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -14,14 +14,10 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 # FIXME: We should be able to optionally drop freetype as a dependency
-DEPENDS = "autogen-native"
-RDEPENDS_${PN} = "diffutils freetype"
+DEPENDS = "autogen-native flex-native bison-native"
+DEPENDS_class-target = "grub-efi-native"
 PR = "r2"
 
-# Native packages do not normally rebuild when the target changes.
-# Ensure this is built once per HOST-TARGET pair.
-PN := "grub-efi-${TRANSLATED_TARGET_ARCH}-native"
-
 SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://cfg \
            file://grub-2.00-fpmath-sse-387-fix.patch \
@@ -39,12 +35,10 @@ COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
 
 S = "${WORKDIR}/grub-${PV}"
 
-# Determine the target arch for the grub modules before the native class
-# clobbers TARGET_ARCH.
-ORIG_TARGET_ARCH := "${TARGET_ARCH}"
+# Determine the target arch for the grub modules
 python __anonymous () {
     import re
-    target = d.getVar('ORIG_TARGET_ARCH', True)
+    target = d.getVar('TARGET_ARCH', True)
     if target == "x86_64":
         grubtarget = 'x86_64'
         grubimage = "bootx64.efi"
@@ -59,26 +53,37 @@ python __anonymous () {
 
 inherit autotools
 inherit gettext
-inherit native
 inherit deploy
 
 EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
-                --target=${GRUB_TARGET} --enable-efiemu=no --program-prefix='' \
+                --enable-efiemu=no --program-prefix='' \
                 --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
 
-do_mkimage() {
+do_install_class-target() {
+	:
+}
+
+do_install_class-native() {
+	install -d ${D}${bindir}
+	install -m 755 grub-mkimage ${D}${bindir}
+}
+
+do_deploy() {
 	# Search for the grub.cfg on the local boot media by using the
 	# built in cfg file provided via this recipe
-	./grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
+	grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
 	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
 	               boot linux ext2 fat serial part_msdos part_gpt normal efi_gop iso9660 search
+	install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
 }
-addtask mkimage after do_compile before do_install
 
-do_deploy() {
-	install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
+do_deploy_class-native() {
+	:
 }
+
 addtask deploy after do_install before do_build
 
-do_install[noexec] = "1"
-do_populate_sysroot[noexec] = "1"
+FILES_${PN}-dbg += "${libdir}/${BPN}/${GRUB_TARGET}-efi/.debug"
+
+BBCLASSEXTEND = "native"
+ALLOW_EMPTY_${PN} = "1"
-- 
1.8.3


