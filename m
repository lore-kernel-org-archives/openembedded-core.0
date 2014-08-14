Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-05.prod.phx3.secureserver.net
	(p3plsmtpa08-05.prod.phx3.secureserver.net [173.201.193.106])
	by mail.openembedded.org (Postfix) with ESMTP id C86B070CE7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 19:06:05 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa08-05.prod.phx3.secureserver.net with 
	id ej621o0091mTNtu01j67Jg; Thu, 14 Aug 2014 12:06:07 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Aug 2014 14:05:56 -0500
Message-Id: <1408043159-8108-7-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1408043159-8108-1-git-send-email-pab@pabigot.com>
References: <1408043159-8108-1-git-send-email-pab@pabigot.com>
Subject: [PATCH v2 6/9] sdk: change EXTRA_OECONF_FPU to EXTRA_OECONF_GCC_FLOAT
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
X-List-Received-Date: Thu, 14 Aug 2014 19:06:06 -0000

This variable is used to ensure the proper version of --with-float=FOO
is passed to gcc's configure script.  gcc also has a --with-fpu=FOO
option that means something different.  To avoid confusion, change the
names to be consistent.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/classes/crosssdk.bbclass                      | 2 +-
 meta/classes/nativesdk.bbclass                     | 2 +-
 meta/recipes-devtools/gcc/gcc-common.inc           | 4 ++--
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 4 ++--
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc   | 2 +-
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    | 2 +-
 meta/recipes-devtools/gcc/gcc-target.inc           | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index 261a374..7a10c59 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -30,6 +30,6 @@ do_populate_sysroot[stamp-extra-info] = ""
 do_packagedata[stamp-extra-info] = ""
 
 # Need to force this to ensure consitency accross architectures
-EXTRA_OECONF_FPU = ""
+EXTRA_OECONF_GCC_FLOAT = ""
 
 USE_NLS = "no"
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 7f94258..37c9f79 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -42,7 +42,7 @@ TARGET_CC_ARCH = "${SDK_CC_ARCH}"
 TARGET_LD_ARCH = "${SDK_LD_ARCH}"
 TARGET_AS_ARCH = "${SDK_AS_ARCH}"
 TARGET_FPU = ""
-EXTRA_OECONF_FPU = ""
+EXTRA_OECONF_GCC_FLOAT = ""
 
 CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
 CFLAGS = "${BUILDSDK_CFLAGS}"
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 66a18d9..4c55542 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -9,7 +9,7 @@ inherit autotools gettext texinfo
 
 BPN = "gcc"
 
-def get_gcc_fpu_setting(bb, d):
+def get_gcc_float_setting(bb, d):
     if d.getVar('ARMPKGSFX_EABI', True) == "hf" and d.getVar('TRANSLATED_TARGET_ARCH', True) == "arm":
         return "--with-float=hard"
     if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
@@ -18,7 +18,7 @@ def get_gcc_fpu_setting(bb, d):
         return "--enable-e500_double"
     return ""
 
-get_gcc_fpu_setting[vardepvalue] = "${@get_gcc_fpu_setting(bb, d)}"
+get_gcc_float_setting[vardepvalue] = "${@get_gcc_float_setting(bb, d)}"
 
 def get_gcc_mips_plt_setting(bb, d):
     if d.getVar('TRANSLATED_TARGET_ARCH', True) in [ 'mips', 'mipsel' ] and bb.utils.contains('DISTRO_FEATURES', 'mplt', True, False, d):
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 9c4e986..3f9d03f 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -44,7 +44,7 @@ EXTRA_OECONF = "\
     --without-local-prefix \
     ${OPTSPACE} \
     ${EXTRA_OECONF_BASE} \
-    ${EXTRA_OECONF_FPU} \
+    ${EXTRA_OECONF_GCC_FLOAT} \
     ${EXTRA_OECONF_PATHS} \
     ${@get_gcc_mips_plt_setting(bb, d)} \
     ${@get_gcc_multiarch_setting(bb, d)} \
@@ -63,7 +63,7 @@ EXTRA_OECONF_append_libc-uclibc = " --enable-__cxa_atexit"
 EXTRA_OECONF_append_mips64 = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
 EXTRA_OECONF_append_mips64el = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
 
-EXTRA_OECONF_FPU ??= ""
+EXTRA_OECONF_GCC_FLOAT ??= ""
 CPPFLAGS = ""
 
 # powerpc needs this to comply with the ABI
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index d8868bb..0b1f37b 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -19,7 +19,7 @@ EXTRA_OECONF_PATHS = "\
 # e.g. we switch between different machines with different tunes.
 EXTRA_OECONF_PATHS[vardepsexclude] = "TUNE_PKGARCH"
 TARGET_ARCH[vardepsexclude] = "TUNE_ARCH"
-get_gcc_fpu_setting[vardepvalue] = ""
+get_gcc_float_setting[vardepvalue] = ""
 
 #
 # gcc-cross looks and finds these in ${exec_prefix} but we're not so lucky
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index b8e3a86..c655934 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -25,7 +25,7 @@ EXTRA_OECONF = "\
     --with-build-sysroot=${GCCCROSS_BUILDSYSROOT} \
     ${EXTRA_OECONF_INITIAL} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)} \
-    ${EXTRA_OECONF_FPU} \
+    ${EXTRA_OECONF_GCC_FLOAT} \
 "
 
 EXTRA_OECONF += "--with-native-system-header-dir=${SYSTEMHEADERS}"
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 0f9a5f8..a266f16 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -10,7 +10,7 @@ EXTRA_OECONF_PATHS = "\
 
 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 
-EXTRA_OECONF_FPU = "${@get_gcc_fpu_setting(bb, d)}"
+EXTRA_OECONF_GCC_FLOAT = "${@get_gcc_float_setting(bb, d)}"
 
 PACKAGES = "\
     ${PN} ${PN}-plugins ${PN}-symlinks \
-- 
1.8.5.5


