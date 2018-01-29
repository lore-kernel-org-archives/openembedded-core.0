Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id E8E6B78430
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 17:11:20 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id v123so35140837wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 09:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=iXKsfz2DR52rzIjD8mLadluZIAJ3/MoJDCgOzpwJSfY=;
	b=1U3QlDYR02B6i7wb25kR5xDx9SGQtjw+0ygHHFJor6vFpcag61I4ddK8dwRy0mdecV
	Cfwuf60KYJcjzMqdkGRKtD2vYhGvBlUPuPIPL6D2PKg8SwCeHFqLMVYNYGJV6Sg6o9rP
	19bMcARLVzKBoTCH0K6Hb9hXA4l1uPyR6hbkojH5s6itt2nW3Wy0UYjx2CrFhPmauosZ
	31Sb6JJFm2tbgo+L/vPKiud/o90QvO+WnJ+oI2+lYTE71vNtTdNBtQkF+5zBHK9jCPHG
	sj38YvkkXvaeW9gcYIWBVQFUDKSU9NqV3ejEFLGh5G/RXYEP43lN43OFXG+QTLYsupqB
	U/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=iXKsfz2DR52rzIjD8mLadluZIAJ3/MoJDCgOzpwJSfY=;
	b=tuf00oif5HXp78CMZ4gDK/DtjX06MHQgRAO2oe3cR4MtiwQq9EWfodE4E3X/uwzYkH
	jMwaoweDYnZmYxtAFvE6v4/SGuSnfXYFxCFpmAGTZY5PlmOJPehCCtE9DL2Y8xGUUZ39
	elIHBwn+yD4U2M3pt8d3egtMLgu6oInTp2bBWux799IYGKpOVakgZAPOoZt6djfnthBW
	yhwJgnEpeWNORyZ7r3uZ+0KL2TppoVtb0gZmI9n1i5C7XdKqhzoimyEVFImovfbZiycW
	YQ8T1yMCO4/yciXICzYyopg402IRMH0LWjcCmCkjJLQS8Nyy9hRNlVxmTjkfR85VTaNM
	g5Aw==
X-Gm-Message-State: AKwxyteB0kejZAr40XXy1wJV1FTTHP+muJXWJKJQWDtChFlUekFNe0v9
	0p8ZAJYxETKpB/7ck+igdZLPzh66
X-Google-Smtp-Source: AH8x225ISXy1E8NOyA0mUnQINZ3xo9R58hvfwdQG7LRi/Nk9+zvxuBBCiTEYAJoHIpEPuHfvLTXsjQ==
X-Received: by 10.28.197.201 with SMTP id v192mr18014579wmf.53.1517245881090; 
	Mon, 29 Jan 2018 09:11:21 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	e16sm11515244wre.5.2018.01.29.09.11.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jan 2018 09:11:20 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 17:11:09 +0000
Message-Id: <20180129171111.14502-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180129171111.14502-1-ross.burton@intel.com>
References: <20180129171111.14502-1-ross.burton@intel.com>
Subject: [PATCH 3/5] meta: don't use deprecated functions from utils.bbclass
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
X-List-Received-Date: Mon, 29 Jan 2018 17:11:21 -0000

These functions were moved to meta/lib/oe in 2010 and the base_* functions in
utils.bbclass were intended to be a short-term compatibility layer.  They're
still used in a few places, so update the callers to use the new functions.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/image.bbclass                           |  2 +-
 meta/classes/image_types.bbclass                     |  2 +-
 meta/classes/kernel.bbclass                          |  2 +-
 meta/classes/libc-package.bbclass                    | 20 ++++++++++----------
 meta/classes/module-base.bbclass                     |  2 +-
 meta/conf/bitbake.conf                               |  2 +-
 meta/conf/distro/include/security_flags.inc          |  2 +-
 meta/conf/machine/qemuarm.conf                       |  2 +-
 meta/recipes-connectivity/openssl/openssl10.inc      |  2 +-
 meta/recipes-core/glibc/glibc-package.inc            |  4 ++--
 meta/recipes-devtools/gcc/libgcc.inc                 |  2 +-
 meta/recipes-graphics/mesa/mesa.inc                  |  2 +-
 .../x11-common/xserver-nodm-init_3.0.bb              |  2 +-
 .../xorg-driver/xf86-video-intel_git.bb              |  2 +-
 meta/recipes-support/icu/icu.inc                     |  4 ++--
 15 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 4531aa2a57a..7abb9182120 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -17,7 +17,7 @@ RRECOMMENDS += "${PACKAGE_INSTALL_ATTEMPTONLY}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-TESTIMAGECLASS = "${@base_conditional('TEST_IMAGE', '1', 'testimage-auto', '', d)}"
+TESTIMAGECLASS = "${@oe.utils.conditional('TEST_IMAGE', '1', 'testimage-auto', '', d)}"
 inherit ${TESTIMAGECLASS}
 
 # IMAGE_FEATURES may contain any available package group
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index b17c435274e..ae3e6edef33 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -228,7 +228,7 @@ IMAGE_CMD_f2fs () {
 EXTRA_IMAGECMD = ""
 
 inherit siteinfo kernel-arch
-JFFS2_ENDIANNESS ?= "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-l', '-b', d)}"
+JFFS2_ENDIANNESS ?= "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-l', '-b', d)}"
 JFFS2_ERASEBLOCK ?= "0x40000"
 EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
 
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 1ecb840caf4..d181e2b6e0a 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -547,7 +547,7 @@ RDEPENDS_${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base"
 # not wanted in images as standard
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image"
 PKG_${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-image += "${@base_conditional('KERNEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux', '', d)}"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-image += "${@oe.utils.conditional('KERNEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux', '', d)}"
 PKG_${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@legitimize_package_name('${KERNEL_VERSION}')}"
 RPROVIDES_${KERNEL_PACKAGE_NAME}-base += "${KERNEL_PACKAGE_NAME}-${KERNEL_VERSION}"
 ALLOW_EMPTY_${KERNEL_PACKAGE_NAME} = "1"
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 739adce6943..2e7cd25297e 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -113,9 +113,9 @@ python package_do_split_gconvs () {
         bb.error("datadir not defined")
         return
 
-    gconv_libdir = base_path_join(libdir, "gconv")
-    charmap_dir = base_path_join(datadir, "i18n", "charmaps")
-    locales_dir = base_path_join(datadir, "i18n", "locales")
+    gconv_libdir = oe.path.join(libdir, "gconv")
+    charmap_dir = oe.path.join(datadir, "i18n", "charmaps")
+    locales_dir = oe.path.join(datadir, "i18n", "locales")
     binary_locales_dir = d.getVar('localedir')
 
     def calc_gconv_deps(fn, pkg, file_regex, output_pattern, group):
@@ -189,7 +189,7 @@ python package_do_split_gconvs () {
 
     # Read in supported locales and associated encodings
     supported = {}
-    with open(base_path_join(d.getVar('WORKDIR'), "SUPPORTED")) as f:
+    with open(oe.path.join(d.getVar('WORKDIR'), "SUPPORTED")) as f:
         for line in f.readlines():
             try:
                 locale, charset = line.rstrip().split()
@@ -231,12 +231,12 @@ python package_do_split_gconvs () {
     commands = {}
 
     def output_locale_binary(name, pkgname, locale, encoding):
-        treedir = base_path_join(d.getVar("WORKDIR"), "locale-tree")
-        ldlibdir = base_path_join(treedir, d.getVar("base_libdir"))
+        treedir = oe.path.join(d.getVar("WORKDIR"), "locale-tree")
+        ldlibdir = oe.path.join(treedir, d.getVar("base_libdir"))
         path = d.getVar("PATH")
-        i18npath = base_path_join(treedir, datadir, "i18n")
-        gconvpath = base_path_join(treedir, "iconvdata")
-        outputpath = base_path_join(treedir, binary_locales_dir)
+        i18npath = oe.path.join(treedir, datadir, "i18n")
+        gconvpath = oe.path.join(treedir, "iconvdata")
+        outputpath = oe.path.join(treedir, binary_locales_dir)
 
         use_cross_localedef = d.getVar("LOCALE_GENERATION_WITH_CROSS-LOCALEDEF") or "0"
         if use_cross_localedef == "1":
@@ -344,7 +344,7 @@ python package_do_split_gconvs () {
         d.appendVar('RDEPENDS_%s' % metapkg, ' ' + pkg)
 
     if use_bin == "compile":
-        makefile = base_path_join(d.getVar("WORKDIR"), "locale-tree", "Makefile")
+        makefile = oe.path.join(d.getVar("WORKDIR"), "locale-tree", "Makefile")
         m = open(makefile, "w")
         m.write("all: %s\n\n" % " ".join(commands.keys()))
         for cmd in commands:
diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index 6fe77c01b7e..f851b851639 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -12,7 +12,7 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"
 # we didn't pick the name.
 export KBUILD_OUTPUT = "${STAGING_KERNEL_BUILDDIR}"
 
-export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_BUILDDIR}/kernel-abiversion')}"
+export KERNEL_VERSION = "${@oe.utils.read_file('${STAGING_KERNEL_BUILDDIR}/kernel-abiversion')}"
 KERNEL_OBJECT_SUFFIX = ".ko"
 
 # kernel modules are generally machine specific
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 01416ba7411..1473bfb0824 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -220,7 +220,7 @@ EXTENDPKGV ?= "${EXTENDPKGEVER}${PKGV}-${PKGR}"
 # Automatically derives "foo" from "foo-native", "foo-cross" or "foo-initial"
 # otherwise it is the same as PN and P
 SPECIAL_PKGSUFFIX = "-native -cross -initial -intermediate -crosssdk -cross-canadian"
-BPN = "${@base_prune_suffix(d.getVar('PN'), d.getVar('SPECIAL_PKGSUFFIX').split(), d)}"
+BPN = "${@oe.utils.prune_suffix(d.getVar('PN'), d.getVar('SPECIAL_PKGSUFFIX').split(), d)}"
 BP = "${BPN}-${PV}"
 
 # Package info.
diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index ab2062b78f5..7ea1049edff 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -9,7 +9,7 @@ GCCPIE ?= "--enable-default-pie"
 
 # _FORTIFY_SOURCE requires -O1 or higher, so disable in debug builds as they use
 # -O0 which then results in a compiler warning.
-lcl_maybe_fortify = "${@base_conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=2',d)}"
+lcl_maybe_fortify = "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=2',d)}"
 
 # Error on use of format strings that represent possible security problems
 SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security -Werror=format-security"
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index c8932ddc592..aa112f51401 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -17,4 +17,4 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet -device virtio-rng-pci"
 PREFERRED_VERSION_linux-yocto ??= "4.12%"
-QB_DTB = "${@base_version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
+QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
diff --git a/meta/recipes-connectivity/openssl/openssl10.inc b/meta/recipes-connectivity/openssl/openssl10.inc
index bd96551c625..02a0e16e972 100644
--- a/meta/recipes-connectivity/openssl/openssl10.inc
+++ b/meta/recipes-connectivity/openssl/openssl10.inc
@@ -25,7 +25,7 @@ TERMIO_libc-musl = "-DTERMIOS"
 TERMIO ?= "-DTERMIO"
 # Avoid binaries being marked as requiring an executable stack since it 
 # doesn't(which causes and this causes issues with SELinux
-CFLAG = "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
+CFLAG = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
 	 ${TERMIO} ${CFLAGS} -Wall -Wa,--noexecstack"
 
 export DIRS = "crypto ssl apps"
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 4d3dc679b40..824b185b3ac 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -118,10 +118,10 @@ do_install_append_aarch64 () {
 		# The aarch64 ABI says the dynamic linker -must- be /lib/ld-linux-aarch64[_be].so.1
 		install -d ${D}${nonarch_base_libdir}
 		if [ -e ${D}${base_libdir}/ld-linux-aarch64.so.1 ]; then
-			ln -s ${@base_path_relative('${nonarch_base_libdir}', '${base_libdir}')}/ld-linux-aarch64.so.1 \
+			ln -s ${@oe.path.relative('${nonarch_base_libdir}', '${base_libdir}')}/ld-linux-aarch64.so.1 \
 				${D}${nonarch_base_libdir}/ld-linux-aarch64.so.1
 		elif [ -e ${D}${base_libdir}/ld-linux-aarch64_be.so.1 ]; then
-			ln -s ${@base_path_relative('${nonarch_base_libdir}', '${base_libdir}')}/ld-linux-aarch64_be.so.1 \
+			ln -s ${@oe.path.relative('${nonarch_base_libdir}', '${base_libdir}')}/ld-linux-aarch64_be.so.1 \
 				${D}${nonarch_base_libdir}/ld-linux-aarch64_be.so.1
 		fi
 	fi
diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index 1500fb5acea..5f1dff609c0 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -28,7 +28,7 @@ LICENSE_${PN}-dbg = "GPL-3.0-with-GCC-exception"
 
 FILES_${PN}-dev = "\
     ${base_libdir}/libgcc*.so \
-    ${@base_conditional('BASETARGET_SYS', '${TARGET_SYS}', '', '${libdir}/${BASETARGET_SYS}', d)} \
+    ${@oe.utils.conditional('BASETARGET_SYS', '${TARGET_SYS}', '', '${libdir}/${BASETARGET_SYS}', d)} \
     ${libdir}/${TARGET_SYS}/${BINV}* \
     ${libdir}/${TARGET_ARCH}${TARGET_VENDOR}* \
 "
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 15967959a41..88ba0050d5e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -77,7 +77,7 @@ GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnav
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'imx', ',imx', '', d)}"
 GALLIUMDRIVERS_LLVM33 = "${@bb.utils.contains('PACKAGECONFIG', 'r600', 'radeonsi,r600', '', d)}"
 PACKAGECONFIG[r600] = ""
-GALLIUMDRIVERS_LLVM33_ENABLED = "${@base_version_less_or_equal('MESA_LLVM_RELEASE', '3.2', False, len('${GALLIUMDRIVERS_LLVM33}') > 0, d)}"
+GALLIUMDRIVERS_LLVM33_ENABLED = "${@oe.utils.version_less_or_equal('MESA_LLVM_RELEASE', '3.2', False, len('${GALLIUMDRIVERS_LLVM33}') > 0, d)}"
 GALLIUMDRIVERS_LLVM = "r300,svga,nouveau${@',${GALLIUMDRIVERS_LLVM33}' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
 GALLIUMDRIVERS_append_x86 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
 GALLIUMDRIVERS_append_x86-64 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
index 345b5896969..a77c56445c8 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
@@ -60,7 +60,7 @@ do_install() {
     fi
 }
 
-RDEPENDS_${PN} = "xinit ${@base_conditional('ROOTLESS_X', '1', 'xuser-account', '', d)}"
+RDEPENDS_${PN} = "xinit ${@oe.utils.conditional('ROOTLESS_X', '1', 'xuser-account', '', d)}"
 
 INITSCRIPT_NAME = "xserver-nodm"
 INITSCRIPT_PARAMS = "start 9 5 . stop 20 0 1 2 3 6 ."
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 9aff9d8c229..2623cb2f317 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -38,7 +38,7 @@ PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc xcb-util"
 PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,libxinerama libxrandr libxdamage libxfixes libxcursor libxtst libxext libxrender"
 
 # --enable-kms-only option is required by ROOTLESS_X
-EXTRA_OECONF += '${@base_conditional( "ROOTLESS_X", "1", " --enable-kms-only", "", d )}'
+EXTRA_OECONF += '${@oe.utils.conditional( "ROOTLESS_X", "1", " --enable-kms-only", "", d )}'
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index b9ac59a1add..983118cd619 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -28,8 +28,8 @@ EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
 EXTRA_OECONF_class-native = ""
 EXTRA_OECONF_class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
 
-EXTRA_OECONF_append_class-target = "${@base_conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
-TARGET_CXXFLAGS_append = "${@base_conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
+EXTRA_OECONF_append_class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
+TARGET_CXXFLAGS_append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
 
 # strtod_l() is not supported by musl; also xlocale.h is missing
 # It is not possible to disable its use via configure switches or env vars
-- 
2.11.0


