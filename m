Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D623A72849
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 02:26:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t062Q1QJ019080
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Jan 2015 18:26:02 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 5 Jan 2015 18:26:01 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Jan 2015 18:26:00 -0800
Message-ID: <edf45adfac727ee852009798284ad6678568f2e7.1420511130.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1420511130.git.liezhi.yang@windriver.com>
References: <cover.1420511130.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] grub 2.0: several fixes
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
X-List-Received-Date: Tue, 06 Jan 2015 02:26:10 -0000
Content-Type: text/plain

* Make grub, grub-efi grub_git use a grub2.inc to reduce the duplicated code.

* Make grub and grub-efi use the same patches since they use the same
  source. (grub_git is different).

* grub-efi:
  - Use autotools to replace autotools-brokensep
  - Remove the DEPENDS of freetype, it should be a RDEPENDS.
  - Remove grub-2.00-ignore-gnulib-gets-stupidity.patch since it is a
    duplication of remove-gets.patch.
  - Make grub-efi.rpm contain files rather than make an empty package.

* grub_git:
  - Fix a SSE build failure.

[YOCTO #6310]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../fix-endianness-problem.patch                   |    0
 .../grub-2.00-ignore-gnulib-gets-stupidity.patch   |   28 ------------
 .../{grub-2.00 => files}/grub-install.in.patch     |    0
 ...rub2-remove-sparc64-setup-from-x86-builds.patch |    0
 .../grub/{grub-2.00 => files}/remove-gets.patch    |    0
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |   48 +++++---------------
 meta/recipes-bsp/grub/grub2.inc                    |   44 ++++++++++++++++++
 meta/recipes-bsp/grub/grub_2.00.bb                 |   32 +------------
 meta/recipes-bsp/grub/grub_git.bb                  |   16 +------
 9 files changed, 58 insertions(+), 110 deletions(-)
 rename meta/recipes-bsp/grub/{grub-2.00 => files}/fix-endianness-problem.patch (100%)
 delete mode 100644 meta/recipes-bsp/grub/files/grub-2.00-ignore-gnulib-gets-stupidity.patch
 rename meta/recipes-bsp/grub/{grub-2.00 => files}/grub-install.in.patch (100%)
 rename meta/recipes-bsp/grub/{grub-2.00 => files}/grub2-remove-sparc64-setup-from-x86-builds.patch (100%)
 rename meta/recipes-bsp/grub/{grub-2.00 => files}/remove-gets.patch (100%)
 create mode 100644 meta/recipes-bsp/grub/grub2.inc

diff --git a/meta/recipes-bsp/grub/grub-2.00/fix-endianness-problem.patch b/meta/recipes-bsp/grub/files/fix-endianness-problem.patch
similarity index 100%
rename from meta/recipes-bsp/grub/grub-2.00/fix-endianness-problem.patch
rename to meta/recipes-bsp/grub/files/fix-endianness-problem.patch
diff --git a/meta/recipes-bsp/grub/files/grub-2.00-ignore-gnulib-gets-stupidity.patch b/meta/recipes-bsp/grub/files/grub-2.00-ignore-gnulib-gets-stupidity.patch
deleted file mode 100644
index 70f6001..0000000
--- a/meta/recipes-bsp/grub/files/grub-2.00-ignore-gnulib-gets-stupidity.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f66d54b934710f54999debb72e8b7c620edece1d Mon Sep 17 00:00:00 2001
-From: Peter Jones <pjones@redhat.com>
-Date: Fri, 25 May 2012 15:28:19 -0400
-Subject: [PATCH] gnulib accused in build breaking shocker.
-
-Upstream-Status: pending [Fedora will push this]
-
----
- grub-core/gnulib/stdio.in.h |    2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/grub-core/gnulib/stdio.in.h b/grub-core/gnulib/stdio.in.h
-index 80b9dbf..69932d9 100644
---- a/grub-core/gnulib/stdio.in.h
-+++ b/grub-core/gnulib/stdio.in.h
-@@ -141,7 +141,9 @@ _GL_WARN_ON_USE (fflush, "fflush is not always POSIX compliant - "
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
- #undef gets
-+#if 0
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
-+#endif
- 
- #if @GNULIB_FOPEN@
- # if @REPLACE_FOPEN@
--- 
-1.7.10.1
-
diff --git a/meta/recipes-bsp/grub/grub-2.00/grub-install.in.patch b/meta/recipes-bsp/grub/files/grub-install.in.patch
similarity index 100%
rename from meta/recipes-bsp/grub/grub-2.00/grub-install.in.patch
rename to meta/recipes-bsp/grub/files/grub-install.in.patch
diff --git a/meta/recipes-bsp/grub/grub-2.00/grub2-remove-sparc64-setup-from-x86-builds.patch b/meta/recipes-bsp/grub/files/grub2-remove-sparc64-setup-from-x86-builds.patch
similarity index 100%
rename from meta/recipes-bsp/grub/grub-2.00/grub2-remove-sparc64-setup-from-x86-builds.patch
rename to meta/recipes-bsp/grub/files/grub2-remove-sparc64-setup-from-x86-builds.patch
diff --git a/meta/recipes-bsp/grub/grub-2.00/remove-gets.patch b/meta/recipes-bsp/grub/files/remove-gets.patch
similarity index 100%
rename from meta/recipes-bsp/grub/grub-2.00/remove-gets.patch
rename to meta/recipes-bsp/grub/files/remove-gets.patch
diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index d213f31..a337d3d 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -1,39 +1,12 @@
-SUMMARY = "GRUB2 is the next-generation GRand Unified Bootloader"
+require grub2.inc
 
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
-DEPENDS = "autogen-native flex-native bison-native"
 DEPENDS_class-target = "grub-efi-native"
+RDEPENDS_${PN}_class-target = "diffutils freetype"
 PR = "r2"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
+SRC_URI += " \
            file://cfg \
-           file://grub-2.00-fpmath-sse-387-fix.patch \
-           file://grub-2.00-fix-enable_execute_stack-check.patch \
-           file://check-if-liblzma-is-disabled.patch \
-           file://grub-no-unused-result.patch \
-           file://grub-2.00-ignore-gnulib-gets-stupidity.patch \
-           file://fix-issue-with-flex-2.5.37.patch \
-           file://grub-efi-allow-a-compilation-without-mcmodel-large.patch \
-           file://grub-2.00-add-oe-kernel.patch \
-           file://grub-efi-fix-with-glibc-2.20.patch \
           "
-SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
-SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
-
-COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
 
 S = "${WORKDIR}/grub-${PV}"
 
@@ -53,17 +26,13 @@ python __anonymous () {
     d.setVar("GRUB_IMAGE", grubimage)
 }
 
-inherit autotools-brokensep gettext texinfo deploy
+inherit deploy
 
 CACHED_CONFIGUREVARS += "ac_cv_path_HELP2MAN="
 EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
                 --enable-efiemu=no --program-prefix='' \
                 --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
 
-do_install_class-target() {
-	:
-}
-
 do_install_class-native() {
 	install -d ${D}${bindir}
 	install -m 755 grub-mkimage ${D}${bindir}
@@ -86,7 +55,12 @@ do_deploy_class-native() {
 
 addtask deploy after do_install before do_build
 
-FILES_${PN}-dbg += "${libdir}/${BPN}/${GRUB_TARGET}-efi/.debug"
+FILES_${PN}-dbg += "${libdir}/grub/${GRUB_TARGET}-efi/.debug \
+                   /boot/efi/EFI/BOOT/${GRUB_TARGET}-efi/.debug \
+                    "
+FILES_${PN} += "${libdir}/grub/${GRUB_TARGET}-efi \
+                ${datadir}/grub \
+                "
 
 BBCLASSEXTEND = "native"
-ALLOW_EMPTY_${PN} = "1"
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
new file mode 100644
index 0000000..59e5b6e
--- /dev/null
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -0,0 +1,44 @@
+SUMMARY = "GRUB2 is the next-generation GRand Unified Bootloader"
+
+DESCRIPTION = "GRUB2 is the next generaion of a GPLed bootloader \
+intended to unify bootloading across x86 operating systems. In \
+addition to loading the Linux kernel, it implements the Multiboot \
+standard, which allows for flexible loading of multiple boot images."
+
+HOMEPAGE = "http://www.gnu.org/software/grub/"
+SECTION = "bootloaders"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
+           file://grub-2.00-fpmath-sse-387-fix.patch \
+           file://check-if-liblzma-is-disabled.patch \
+           file://fix-issue-with-flex-2.5.37.patch \
+           file://grub-2.00-add-oe-kernel.patch \
+           file://grub-install.in.patch \
+           file://remove-gets.patch \
+           file://fix-endianness-problem.patch \
+           file://grub2-remove-sparc64-setup-from-x86-builds.patch \
+           file://grub-2.00-fix-enable_execute_stack-check.patch \
+           file://grub-no-unused-result.patch \
+           file://grub-efi-allow-a-compilation-without-mcmodel-large.patch \
+           file://grub-efi-fix-with-glibc-2.20.patch \
+            "
+
+DEPENDS = "autogen-native flex-native bison-native xz"
+
+SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
+SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
+
+COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
+
+inherit autotools gettext texinfo
+
+# grub and grub-efi's sysroot/${datadir}/grub/grub-mkconfig_lib are
+# conflicted, remove it since no one uses it.
+SYSROOT_PREPROCESS_FUNCS_class-target += "remove_sysroot_mkconfig_lib"
+remove_sysroot_mkconfig_lib() {
+    rm -r "${SYSROOT_DESTDIR}${datadir}/grub/grub-mkconfig_lib"
+}
+
diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
index e2fcbb9..a11e960 100644
--- a/meta/recipes-bsp/grub/grub_2.00.bb
+++ b/meta/recipes-bsp/grub/grub_2.00.bb
@@ -1,41 +1,11 @@
-SUMMARY = "GRUB2 is the next-generation GRand Unified Bootloader"
+require grub2.inc
 
-DESCRIPTION = "GRUB2 is the next generaion of a GPLed bootloader \
-intended to unify bootloading across x86 operating systems. In \
-addition to loading the Linux kernel, it implements the Multiboot \
-standard, which allows for flexible loading of multiple boot images."
-
-HOMEPAGE = "http://www.gnu.org/software/grub/"
-SECTION = "bootloaders"
-
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-DEPENDS = "autogen-native flex-native bison-native xz"
 RDEPENDS_${PN} = "diffutils freetype"
 PR = "r1"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
-          file://grub-install.in.patch \
-          file://grub-2.00-fpmath-sse-387-fix.patch \
-          file://remove-gets.patch \
-          file://check-if-liblzma-is-disabled.patch \
-          file://fix-issue-with-flex-2.5.37.patch \
-          file://grub-2.00-add-oe-kernel.patch \
-          file://fix-endianness-problem.patch \
-          file://grub2-remove-sparc64-setup-from-x86-builds.patch \
-          "
-
-SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
-SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
-
-COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
-
 FILES_${PN}-dbg += "${libdir}/${BPN}/i386-pc/.debug"
 
 
-inherit autotools gettext texinfo
-
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
 PACKAGECONFIG[device-mapper] = "--enable-device-mapper,--disable-device-mapper,lvm2"
diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index 2a6392b..e8179ba 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -1,17 +1,4 @@
-SUMMARY = "GRUB2 is the next-generation GRand Unified Bootloader"
-
-DESCRIPTION = "GRUB2 is the next generaion of a GPLed bootloader \
-intended to unify bootloading across x86 operating systems. In \
-addition to loading the Linux kernel, it implements the Multiboot \
-standard, which allows for flexible loading of multiple boot images."
-
-HOMEPAGE = "http://www.gnu.org/software/grub/"
-SECTION = "bootloaders"
-
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-DEPENDS = "autogen-native flex-native bison-native xz freetype"
+require grub2.inc
 
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_arm = "1"
@@ -19,6 +6,7 @@ DEFAULT_PREFERENCE_arm = "1"
 PV = "2.00+${SRCPV}"
 SRCREV = "87de66d9d83446ecddb29cfbdf7369102c8e209e"
 SRC_URI = "git://git.savannah.gnu.org/grub.git \
+           file://grub-2.00-fpmath-sse-387-fix.patch \
            file://autogen.sh-exclude-pc.patch \
            file://grub-2.00-add-oe-kernel.patch \
            file://0001-Fix-build-with-glibc-2.20.patch \
-- 
1.7.9.5


