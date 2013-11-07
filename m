Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BE77E6D3E0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 11:30:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA7BUsnT006756
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Nov 2013 03:30:54 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 7 Nov 2013 03:30:54 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Nov 2013 19:30:51 +0800
Message-ID: <78be4278bc2425d48d16b907f9d2d2e1ae0fe2f2.1383823754.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1383823754.git.jackie.huang@windriver.com>
References: <cover.1383823754.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] grub-efi-native: fix build failure on 32bit host
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
X-List-Received-Date: Thu, 07 Nov 2013 11:30:52 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

grub-efi-native builds grub with efi platform, then run
"grub-mkimage" command with built in cfg and modules to
generate an EFI binary for the target, and deploys it.

It works fine when build on 64bit host, but when we build
x86-64 target on 32bit host, it fails to build 64bit grub,
even if it builds, the 64bit binary "grub-mkimage" would
fail to run to generate EFI.

So the solution is:
Add a target package grub-efi and grub-efi-native depends
on it, grub-efi-native will be back to real native, then
run "grub-mkimage" command with modules in sysroot populated
by grub-efi to generate the EFI binary for target.

Another problem is -mcmodel=large is not supported by gcc
with version lower than 4.4, but we don't need to use
memory over 4GiB, so add a patch to allow compilation
without large model support.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...allow-a-compilation-without-mcmodel-large.patch |   69 ++++++++++++++++++++
 meta/recipes-bsp/grub/grub-efi-native_2.00.bb      |   52 ++-------------
 meta/recipes-bsp/grub/grub-efi.inc                 |   44 +++++++++++++
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |    9 +++
 4 files changed, 130 insertions(+), 44 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
 create mode 100644 meta/recipes-bsp/grub/grub-efi.inc
 create mode 100644 meta/recipes-bsp/grub/grub-efi_2.00.bb

diff --git a/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch b/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
new file mode 100644
index 0000000..b2be74a
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
@@ -0,0 +1,69 @@
+From 0cea0e4266214da1f11e812834f5d5c47a6e04e6 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Tue, 5 Nov 2013 07:23:32 -0500
+Subject: [PATCH] Allow a compilation without -mcmodel=large
+
+* kern/efi/mm.c (grub_efi_allocate_pages): don't allocate >4GiB
+  when compiled without -mcmodel=large
+  (filter_memory_map): remove memory post 4 GiB when compiled
+  without -mcmodel=large
+* configure.ac: add -DMCMODEL_SMALL=1 to TARGET_CFLAGS when
+  -mcmodel=large isn't supported
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ configure.ac            |    4 +++-
+ grub-core/kern/efi/mm.c |    6 +++---
+ 2 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 319d063..ee72fee 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -567,7 +567,9 @@ if test "$target_cpu"-"$platform" = x86_64-efi; then
+ 		      [grub_cv_cc_mcmodel=no])
+   ])
+   if test "x$grub_cv_cc_mcmodel" = xno; then
+-    AC_MSG_ERROR([-mcmodel=large not supported. Upgrade your gcc.])
++    CFLAGS="$SAVED_CFLAGS -m64 -DMCMODEL_SMALL=1"
++    TARGET_CFLAGS="$TARGET_CFLAGS -DMCMODEL_SMALL=1"
++    AC_MSG_WARN([-mcmodel=large not supported. You won't be able to use the memory over 4GiB. Upgrade your gcc.])
+   else
+     TARGET_CFLAGS="$TARGET_CFLAGS -mcmodel=large"
+   fi
+diff --git a/grub-core/kern/efi/mm.c b/grub-core/kern/efi/mm.c
+index a2edc84..c67dd13 100644
+--- a/grub-core/kern/efi/mm.c
++++ b/grub-core/kern/efi/mm.c
+@@ -62,7 +62,7 @@ grub_efi_allocate_pages (grub_efi_physical_address_t address,
+     return 0;
+ #endif
+
+-#if 1
++#if defined (MCMODEL_SMALL)
+   if (address == 0)
+     {
+       type = GRUB_EFI_ALLOCATE_MAX_ADDRESS;
+@@ -305,7 +305,7 @@ filter_memory_map (grub_efi_memory_descriptor_t *memory_map,
+        desc = NEXT_MEMORY_DESCRIPTOR (desc, desc_size))
+     {
+       if (desc->type == GRUB_EFI_CONVENTIONAL_MEMORY
+-#if 1
++#if defined (MCMODEL_SMALL)
+ 	  && desc->physical_start <= 0xffffffff
+ #endif
+ 	  && desc->physical_start + PAGES_TO_BYTES (desc->num_pages) > 0x100000
+@@ -321,7 +321,7 @@ filter_memory_map (grub_efi_memory_descriptor_t *memory_map,
+ 	      desc->physical_start = 0x100000;
+ 	    }
+
+-#if 1
++#if defined (MCMODEL_SMALL)
+ 	  if (BYTES_TO_PAGES (filtered_desc->physical_start)
+ 	      + filtered_desc->num_pages
+ 	      > BYTES_TO_PAGES (0x100000000LL))
+--
+1.7.1
+
diff --git a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
index 04973b5..5ad194d 100644
--- a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
@@ -1,47 +1,16 @@
-SUMMARY = "GRUB2 is the next-generation GRand Unified Bootloader"
+require grub-efi.inc
 
-DESCRIPTION = "GRUB2 is the next generaion of a GPLed bootloader \
-intended to unify bootloading across x86 operating systems. In \
-addition to loading the Linux kernel, it implements the Multiboot \
-standard, which allows for flexible loading of multiple boot images. \
-This recipe builds an EFI binary for the target. It does not install \
-or package anything, it only deploys a target-arch GRUB EFI image."
-
-HOMEPAGE = "http://www.gnu.org/software/grub/"
-SECTION = "bootloaders"
-
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-# FIXME: We should be able to optionally drop freetype as a dependency
-DEPENDS = "autogen-native"
-RDEPENDS_${PN} = "diffutils freetype"
-PR = "r2"
+DEPENDS += "grub-efi"
+PR = "${INC_PR}.0"
 
 # Native packages do not normally rebuild when the target changes.
 # Ensure this is built once per HOST-TARGET pair.
 PN := "grub-efi-${TRANSLATED_TARGET_ARCH}-native"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
-           file://cfg \
-           file://grub-2.00-fpmath-sse-387-fix.patch \
-           file://grub-2.00-fix-enable_execute_stack-check.patch \
-           file://grub-2.00-disable-help2man.patch \
-           file://check-if-liblzma-is-disabled.patch \
-           file://grub-no-unused-result.patch \
-           file://grub-2.00-ignore-gnulib-gets-stupidity.patch \
-           file://fix-issue-with-flex-2.5.37.patch \
-          "
-SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
-SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
-
-COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
-
-S = "${WORKDIR}/grub-${PV}"
-
 # Determine the target arch for the grub modules before the native class
-# clobbers TARGET_ARCH.
+# clobbers TARGET_ARCH and STAGING_LIBDIR.
 ORIG_TARGET_ARCH := "${TARGET_ARCH}"
+ORIG_STAGING_LIBDIR := "${STAGING_LIBDIR}"
 python __anonymous () {
     import re
     target = d.getVar('ORIG_TARGET_ARCH', True)
@@ -57,19 +26,14 @@ python __anonymous () {
     d.setVar("GRUB_IMAGE", grubimage)
 }
 
-inherit autotools
-inherit gettext
 inherit native
 inherit deploy
 
-EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
-                --target=${GRUB_TARGET} --enable-efiemu=no --program-prefix='' \
-                --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
-
 do_mkimage() {
 	# Search for the grub.cfg on the local boot media by using the
-	# built in cfg file provided via this recipe
-	./grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
+	# built in cfg file provided via this recipe and modules dir
+	# populated by grub-efi
+	./grub-mkimage -c ../cfg -p /EFI/BOOT -d ${ORIG_STAGING_LIBDIR}/grub-efi/${GRUB_TARGET}-efi \
 	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
 	               boot linux ext2 fat serial part_msdos part_gpt normal efi_gop iso9660 search
 }
diff --git a/meta/recipes-bsp/grub/grub-efi.inc b/meta/recipes-bsp/grub/grub-efi.inc
new file mode 100644
index 0000000..fd93fe8
--- /dev/null
+++ b/meta/recipes-bsp/grub/grub-efi.inc
@@ -0,0 +1,44 @@
+SUMMARY = "GRUB2 is the next-generation GRand Unified Bootloader"
+
+DESCRIPTION = "GRUB2 is the next generaion of a GPLed bootloader \
+intended to unify bootloading across x86 operating systems. In \
+addition to loading the Linux kernel, it implements the Multiboot \
+standard, which allows for flexible loading of multiple boot images. \
+This recipe builds an EFI binary for the target. It does not install \
+or package anything, it only deploys a target-arch GRUB EFI image."
+
+HOMEPAGE = "http://www.gnu.org/software/grub/"
+SECTION = "bootloaders"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+# FIXME: We should be able to optionally drop freetype as a dependency
+DEPENDS = "autogen-native flex-native"
+RDEPENDS_${PN} = "diffutils freetype"
+INC_PR = "r2"
+
+SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
+           file://cfg \
+           file://grub-2.00-fpmath-sse-387-fix.patch \
+           file://grub-2.00-fix-enable_execute_stack-check.patch \
+           file://grub-2.00-disable-help2man.patch \
+           file://check-if-liblzma-is-disabled.patch \
+           file://grub-no-unused-result.patch \
+           file://grub-2.00-ignore-gnulib-gets-stupidity.patch \
+           file://fix-issue-with-flex-2.5.37.patch \
+           file://grub-efi-allow-a-compilation-without-mcmodel-large.patch \
+          "
+SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
+SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
+
+COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
+
+S = "${WORKDIR}/grub-${PV}"
+
+inherit autotools
+inherit gettext
+
+EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
+                --enable-efiemu=no --program-prefix='' \
+                --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
new file mode 100644
index 0000000..35277d7
--- /dev/null
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -0,0 +1,9 @@
+require grub-efi.inc
+
+PR = "${INC_PR}.0"
+FILES_${PN}-dbg += "${libdir}/${BPN}/${TARGET_ARCH}-efi/.debug"
+
+do_install_append () {
+	mv ${D}${libdir}/grub ${D}${libdir}/${BPN}
+	mv ${D}${datadir}/grub ${D}${datadir}/${BPN}
+}
-- 
1.7.4.1


