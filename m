Return-Path: <juro.bystricky@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3A15F6069D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 16:31:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 26 Sep 2016 09:31:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,400,1470726000"; d="scan'208";a="1056814897"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga002.jf.intel.com with ESMTP; 26 Sep 2016 09:31:25 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2016 09:30:52 -0700
Message-Id: <1474907452-37153-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1474907452-37153-1-git-send-email-juro.bystricky@intel.com>
References: <1474907452-37153-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 1/1] SDK: Allow changing SDKMACHINE without wiping TMP folder
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
X-List-Received-Date: Mon, 26 Sep 2016 16:31:24 -0000

When changing SDKMACHINE, we may encounter an error forcing us to wipe the TMP folder.
Since only SDK_ARCH is captured in the PN of the crosssdk recipes, changes to SDK_OS
result in conflicts. Eventually we hit the error:

ERROR: ...: The recipe <...>  is trying to install files into a shared area when those files already exist.
The build has stopped as continuing in this scenario WILL break things

This patchset addresses the problem by SDK_SYS as the recipe name suffix instead
of SDK_ARCH.

[YOCTO #9281]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/base.bbclass                                |  2 +-
 meta/conf/distro/include/tcmode-default.inc              | 12 ++++++------
 meta/recipes-core/glibc/glibc-initial.inc                |  2 +-
 meta/recipes-core/glibc/glibc.inc                        |  2 +-
 meta/recipes-core/musl/musl.inc                          |  2 +-
 meta/recipes-devtools/binutils/binutils-crosssdk_2.27.bb |  2 +-
 meta/recipes-devtools/gcc/gcc-cross-initial.inc          |  2 +-
 meta/recipes-devtools/gcc/gcc-cross.inc                  |  2 +-
 meta/recipes-devtools/gcc/gcc-crosssdk-initial.inc       |  2 +-
 meta/recipes-devtools/gcc/gcc-crosssdk.inc               |  2 +-
 meta/recipes-devtools/gcc/libgcc-initial.inc             |  2 +-
 11 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 5a1bd3a..c3b02af 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -485,7 +485,7 @@ python () {
 
         check_license = False if pn.startswith("nativesdk-") else True
         for t in ["-native", "-cross-${TARGET_ARCH}", "-cross-initial-${TARGET_ARCH}",
-              "-crosssdk-${SDK_ARCH}", "-crosssdk-initial-${SDK_ARCH}",
+              "-crosssdk-${SDK_SYS}", "-crosssdk-initial-${SDK_SYS}",
               "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
             if pn.endswith(d.expand(t)):
                 check_license = False
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 7985596..ca3c5ec 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -9,10 +9,10 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross-${TARGET_ARCH}"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "gcc-runtime"
 PREFERRED_PROVIDER_gdb = "gdb"
 
-PREFERRED_PROVIDER_virtual/${SDK_PREFIX}binutils-crosssdk ?= "binutils-crosssdk-${SDK_ARCH}"
-PREFERRED_PROVIDER_virtual/${SDK_PREFIX}gcc-initial = "gcc-crosssdk-initial-${SDK_ARCH}"
-PREFERRED_PROVIDER_virtual/${SDK_PREFIX}gcc = "gcc-crosssdk-${SDK_ARCH}"
-PREFERRED_PROVIDER_virtual/${SDK_PREFIX}g++ = "gcc-crosssdk-${SDK_ARCH}"
+PREFERRED_PROVIDER_virtual/${SDK_PREFIX}binutils-crosssdk ?= "binutils-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/${SDK_PREFIX}gcc-initial = "gcc-crosssdk-initial-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/${SDK_PREFIX}gcc = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/${SDK_PREFIX}g++ = "gcc-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs = "nativesdk-gcc-runtime"
 
 # Default libc config
@@ -33,8 +33,8 @@ LINUXLIBCVERSION ?= "4.8%"
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-initial-${TARGET_ARCH} ?= "${GCCVERSION}"
-PREFERRED_VERSION_gcc-crosssdk-${SDK_ARCH} ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_ARCH} ?= "${SDKGCCVERSION}"
+PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
+PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-runtime ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-sanitizers ?= "${GCCVERSION}"
diff --git a/meta/recipes-core/glibc/glibc-initial.inc b/meta/recipes-core/glibc/glibc-initial.inc
index 0c8bd64..fe52223 100644
--- a/meta/recipes-core/glibc/glibc-initial.inc
+++ b/meta/recipes-core/glibc/glibc-initial.inc
@@ -5,7 +5,7 @@ PACKAGES = ""
 PACKAGES_DYNAMIC = ""
 
 STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
-STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${TARGET_ARCH}"
+STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${SDK_SYS}"
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
 
 do_configure () {
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index bf1dccd..e85c704 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -3,7 +3,7 @@ require glibc-ld.inc
 require glibc-testing.inc
 
 STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
-STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${TARGET_ARCH}"
+STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${SDK_SYS}"
 PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
 
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index 276b00f..7ed931c 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -17,7 +17,7 @@ TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
 INHIBIT_DEFAULT_DEPS = "1"
 
 STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
-STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${TARGET_ARCH}"
+STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${SDK_SYS}"
 
 
 FILES_SOLIBSDEV = ""
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.27.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.27.bb
index 788106f..62c03d7 100644
--- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.27.bb
+++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.27.bb
@@ -2,7 +2,7 @@ require binutils-cross_${PV}.bb
 
 inherit crosssdk
 
-PN = "binutils-crosssdk-${TARGET_ARCH}"
+PN = "binutils-crosssdk-${SDK_SYS}"
 
 PROVIDES = "virtual/${TARGET_PREFIX}binutils-crosssdk"
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index 048b530..dcf2271 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -77,7 +77,7 @@ do_install () {
 
 	# gcc-runtime installs libgcc into a special location in staging since it breaks doing a standalone build
 	case ${PN} in
-		*gcc-cross-initial-${TARGET_ARCH}|*gcc-crosssdk-initial-${TARGET_ARCH})
+		*gcc-cross-initial-${TARGET_ARCH}|*gcc-crosssdk-initial-${SDK_SYS})
 			dest=${D}/${includedir}/gcc-build-internal-initial-${TARGET_SYS}
 			hardlinkdir . $dest
 		;;
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index c0b8751..87a8de9 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -188,7 +188,7 @@ do_install () {
 
 	# gcc-runtime installs libgcc into a special location in staging since it breaks doing a standalone build
 	case ${PN} in
-		*gcc-cross-${TARGET_ARCH}|*gcc-crosssdk-${TARGET_ARCH})
+		*gcc-cross-${TARGET_ARCH}|*gcc-crosssdk-${SDK_SYS})
 			dest=${D}/${includedir}/gcc-build-internal-${TARGET_SYS}
 			hardlinkdir . $dest
 		;;
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial.inc b/meta/recipes-devtools/gcc/gcc-crosssdk-initial.inc
index 7d2599c..08eda5d 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk-initial.inc
@@ -1,6 +1,6 @@
 inherit crosssdk
 
-PN = "gcc-crosssdk-initial-${TARGET_ARCH}"
+PN = "gcc-crosssdk-initial-${SDK_SYS}"
 
 SYSTEMHEADERS = "${SDKPATHNATIVE}${prefix_nativesdk}/include"
 SYSTEMLIBS = "${SDKPATHNATIVE}${base_libdir_nativesdk}/"
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk.inc b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
index 53f880f..cda2927 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
@@ -1,6 +1,6 @@
 inherit crosssdk
 
-PN = "gcc-crosssdk-${TARGET_ARCH}"
+PN = "gcc-crosssdk-${SDK_SYS}"
 
 SYSTEMHEADERS = "${SDKPATHNATIVE}${prefix_nativesdk}/include"
 SYSTEMLIBS = "${SDKPATHNATIVE}${base_libdir_nativesdk}/"
diff --git a/meta/recipes-devtools/gcc/libgcc-initial.inc b/meta/recipes-devtools/gcc/libgcc-initial.inc
index 59e8a62..687a8a0 100644
--- a/meta/recipes-devtools/gcc/libgcc-initial.inc
+++ b/meta/recipes-devtools/gcc/libgcc-initial.inc
@@ -5,7 +5,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial"
 LICENSE = "GPL-3.0-with-GCC-exception"
 
 STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
-STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${TARGET_ARCH}"
+STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${SDK_SYS}"
 PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
 
 PACKAGES = ""
-- 
2.7.4


