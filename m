Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qp5X3-0005NC-Nr
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 23:32:46 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 04 Aug 2011 14:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,319,1309762800"; 
   d="scan'208";a="4260470"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Aug 2011 14:28:17 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Aug 2011 08:01:51 -0700
Message-Id: <95e88a0886564c48642a8c32fbe8ee78b19e3c55.1312469790.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1312469789.git.nitin.a.kamble@intel.com>
References: <cover.1312469789.git.nitin.a.kamble@intel.com>
Subject: [PATCH 05/10] toolchain-scripts & other classes: add TARGET_LD_ARCH & TARGET_AS_ARCH vars
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Aug 2011 21:32:47 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This is comming from x32 need to pass special parameters to ld & as.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/allarch.bbclass           |    2 ++
 meta/classes/cross-canadian.bbclass    |    2 ++
 meta/classes/cross.bbclass             |    2 ++
 meta/classes/crosssdk.bbclass          |    2 ++
 meta/classes/native.bbclass            |   10 +++++++---
 meta/classes/nativesdk.bbclass         |    4 ++++
 meta/classes/toolchain-scripts.bbclass |    9 +++++----
 meta/conf/bitbake.conf                 |   23 +++++++++++++++++------
 8 files changed, 41 insertions(+), 13 deletions(-)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 26fca70..a2f8179 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -12,4 +12,6 @@ INHIBIT_DEFAULT_DEPS = "1"
 TARGET_ARCH = "allarch"
 TARGET_OS = "linux"
 TARGET_CC_ARCH = "none"
+TARGET_LD_ARCH = "none"
+TARGET_AS_ARCH = "none"
 PACKAGE_EXTRA_ARCHS = ""
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index c878d7f..601175d 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -39,6 +39,8 @@ HOST_VENDOR = "${SDK_VENDOR}"
 HOST_OS = "${SDK_OS}"
 HOST_PREFIX = "${SDK_PREFIX}"
 HOST_CC_ARCH = "${SDK_CC_ARCH}"
+HOST_LD_ARCH = "${SDK_LD_ARCH}"
+HOST_AS_ARCH = "${SDK_AS_ARCH}"
 
 #assign DPKG_ARCH
 DPKG_ARCH = "${SDK_ARCH}"
diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index e19614f..519aa0d 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -11,6 +11,8 @@ HOST_VENDOR = "${BUILD_VENDOR}"
 HOST_OS = "${BUILD_OS}"
 HOST_PREFIX = "${BUILD_PREFIX}"
 HOST_CC_ARCH = "${BUILD_CC_ARCH}"
+HOST_LD_ARCH = "${BUILD_LD_ARCH}"
+HOST_AS_ARCH = "${BUILD_AS_ARCH}"
 
 STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
 
diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index a2e5a22..5cfa43b 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -9,6 +9,8 @@ TARGET_VENDOR = "${SDK_VENDOR}"
 TARGET_OS = "${SDK_OS}"
 TARGET_PREFIX = "${SDK_PREFIX}"
 TARGET_CC_ARCH = "${SDK_CC_ARCH}"
+TARGET_LD_ARCH = "${SDK_LD_ARCH}"
+TARGET_AS_ARCH = "${SDK_AS_ARCH}"
 TARGET_FPU = ""
 
 target_libdir = "${SDKPATHNATIVE}${libdir_nativesdk}"
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 00f7b9f..9a41f19 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -24,6 +24,8 @@ TARGET_OS = "${BUILD_OS}"
 TARGET_VENDOR = "${BUILD_VENDOR}"
 TARGET_PREFIX = "${BUILD_PREFIX}"
 TARGET_CC_ARCH = "${BUILD_CC_ARCH}"
+TARGET_LD_ARCH = "${BUILD_LD_ARCH}"
+TARGET_AS_ARCH = "${BUILD_AS_ARCH}"
 TARGET_FPU = ""
 
 HOST_ARCH = "${BUILD_ARCH}"
@@ -31,6 +33,8 @@ HOST_OS = "${BUILD_OS}"
 HOST_VENDOR = "${BUILD_VENDOR}"
 HOST_PREFIX = "${BUILD_PREFIX}"
 HOST_CC_ARCH = "${BUILD_CC_ARCH}"
+HOST_LD_ARCH = "${BUILD_LD_ARCH}"
+HOST_AS_ARCH = "${BUILD_AS_ARCH}"
 
 CPPFLAGS = "${BUILD_CPPFLAGS}"
 CFLAGS = "${BUILD_CFLAGS}"
@@ -50,11 +54,11 @@ export CONFIG_SITE = ""
 export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}"
 export CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}"
 export F77 = "${CCACHE}${HOST_PREFIX}g77 ${HOST_CC_ARCH}"
-export CPP = "${HOST_PREFIX}gcc -E"
-export LD = "${HOST_PREFIX}ld"
+export CPP = "${HOST_PREFIX}gcc ${HOST_CC_ARCH} -E"
+export LD = "${HOST_PREFIX}ld ${HOST_LD_ARCH} "
 export CCLD = "${CC}"
 export AR = "${HOST_PREFIX}ar"
-export AS = "${HOST_PREFIX}as"
+export AS = "${HOST_PREFIX}as ${HOST_AS_ARCH}"
 export RANLIB = "${HOST_PREFIX}ranlib"
 export STRIP = "${HOST_PREFIX}strip"
 
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index de7a883..152d053 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -24,6 +24,8 @@ HOST_VENDOR = "${SDK_VENDOR}"
 HOST_OS = "${SDK_OS}"
 HOST_PREFIX = "${SDK_PREFIX}"
 HOST_CC_ARCH = "${SDK_CC_ARCH}"
+HOST_LD_ARCH = "${SDK_LD_ARCH}"
+HOST_AS_ARCH = "${SDK_AS_ARCH}"
 #HOST_SYS = "${HOST_ARCH}${TARGET_VENDOR}-${HOST_OS}"
 
 TARGET_ARCH = "${SDK_ARCH}"
@@ -31,6 +33,8 @@ TARGET_VENDOR = "${SDK_VENDOR}"
 TARGET_OS = "${SDK_OS}"
 TARGET_PREFIX = "${SDK_PREFIX}"
 TARGET_CC_ARCH = "${SDK_CC_ARCH}"
+TARGET_LD_ARCH = "${SDK_LD_ARCH}"
+TARGET_AS_ARCH = "${SDK_AS_ARCH}"
 TARGET_FPU = ""
 
 CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index fe11e72..f7b52be 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -24,8 +24,8 @@ toolchain_create_sdk_env_script () {
 	fi
 	echo 'export CFLAGS="${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
 	echo 'export CXXFLAGS="${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
-	echo 'export LDFLAGS="--sysroot=${SDKTARGETSYSROOT}"' >> $script
-	echo 'export CPPFLAGS="--sysroot=${SDKTARGETSYSROOT}"' >> $script
+	echo 'export LDFLAGS="${TARGET_LD_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
+	echo 'export CPPFLAGS="${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
 	echo 'export OECORE_TARGET_SYSROOT="${SDKTARGETSYSROOT}"' >> $script
 	echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/aclocal"' >> $script
@@ -59,6 +59,7 @@ toolchain_create_tree_env_script () {
 	fi
 	echo 'export CFLAGS="${TARGET_CC_ARCH}"' >> $script
 	echo 'export CXXFLAGS="${TARGET_CC_ARCH}"' >> $script
+	echo 'export LDFLAGS="${TARGET_LD_ARCH}"' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${STAGING_DIR_NATIVE}"' >> $script
 	echo 'export OECORE_TARGET_SYSROOT="${STAGING_DIR_TARGET}"' >> $script
 	echo 'export OECORE_ACLOCAL_OPTS="-I ${STAGING_DIR_NATIVE}/usr/share/aclocal"' >> $script
@@ -91,8 +92,8 @@ toolchain_create_sdk_env_script_for_installer () {
 	fi
 	echo 'export CFLAGS="${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
 	echo 'export CXXFLAGS="${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
-	echo 'export LDFLAGS="--sysroot=##SDKTARGETSYSROOT##"' >> $script
-	echo 'export CPPFLAGS="--sysroot=##SDKTARGETSYSROOT##"' >> $script
+	echo 'export LDFLAGS="${TARGET_LD_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
+	echo 'export CPPFLAGS="${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
 	echo 'export OECORE_TARGET_SYSROOT="##SDKTARGETSYSROOT##"' >> $script
         echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/acloal"' >> $script
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6f0b42c..a8321ed 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -71,6 +71,8 @@ BUILD_VENDOR = ""
 BUILD_SYS = "${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
 BUILD_PREFIX = ""
 BUILD_CC_ARCH = ""
+BUILD_LD_ARCH = ""
+BUILD_AS_ARCH = ""
 BUILD_EXEEXT = ""
 
 HOST_ARCH = "${TARGET_ARCH}"
@@ -79,10 +81,14 @@ HOST_VENDOR = "${TARGET_VENDOR}"
 HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
 HOST_PREFIX = "${TARGET_PREFIX}"
 HOST_CC_ARCH = "${TARGET_CC_ARCH}"
+HOST_LD_ARCH = "${TARGET_LD_ARCH}"
+HOST_AS_ARCH = "${TARGET_AS_ARCH}"
 HOST_EXEEXT = ""
 
 TUNE_ARCH ??= "INVALID"
 TUNE_CCARGS ??= ""
+TUNE_LDARGS ??= ""
+TUNE_ASARGS ??= ""
 TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
 LIBCEXTENSION ??= ""
 ABIEXTENSION ??= ""
@@ -93,6 +99,8 @@ TARGET_VENDOR = "-oe"
 TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}"
 TARGET_PREFIX = "${TARGET_SYS}-"
 TARGET_CC_ARCH = "${TUNE_CCARGS}"
+TARGET_LD_ARCH = "${TUNE_LDARGS}"
+TARGET_AS_ARCH = "${TUNE_ASARGS}"
 
 SDK_ARCH = "${BUILD_ARCH}"
 SDK_OS = "${BUILD_OS}"
@@ -101,6 +109,8 @@ SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + bb.data.getVar('SDK_OS', d, 1), '']
 SDK_PREFIX = "${SDK_SYS}-"
 SDK_CC_ARCH = "${BUILD_CC_ARCH}"
 SDK_PACKAGE_ARCHS = "all any noarch ${SDK_ARCH}-nativesdk"
+SDK_LD_ARCH = "${BUILD_LD_ARCH}"
+SDK_AS_ARCH = "${BUILD_AS_ARCH}"
 
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
 MACHINE_ARCH = "${@[bb.data.getVar('TUNE_PKGARCH', d, 1), bb.data.getVar('MACHINE', d, 1)][bool(bb.data.getVar('MACHINE', d, 1))].replace('-', '_')}"
@@ -398,11 +408,11 @@ export CCACHE_DIR = "${TMPDIR}/ccache/${HOST_SYS}/${PN}"
 export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export F77 = "${CCACHE}${HOST_PREFIX}g77 ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-export CPP = "${HOST_PREFIX}gcc -E${TOOLCHAIN_OPTIONS}"
-export LD = "${HOST_PREFIX}ld${TOOLCHAIN_OPTIONS}"
+export CPP = "${HOST_PREFIX}gcc -E${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
+export LD = "${HOST_PREFIX}ld${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"
 export CCLD = "${CC}"
 export AR = "${HOST_PREFIX}ar"
-export AS = "${HOST_PREFIX}as"
+export AS = "${HOST_PREFIX}as ${HOST_AS_ARCH}"
 export RANLIB = "${HOST_PREFIX}ranlib"
 export STRIP = "${HOST_PREFIX}strip"
 export OBJCOPY = "${HOST_PREFIX}objcopy"
@@ -413,10 +423,11 @@ PYTHON = "${@sys.executable}"
 export BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
 export BUILD_CXX = "${CCACHE}${BUILD_PREFIX}g++ ${BUILD_CC_ARCH}"
 export BUILD_F77 = "${CCACHE}${BUILD_PREFIX}g77 ${BUILD_CC_ARCH}"
-export BUILD_CPP = "${BUILD_PREFIX}cpp"
-export BUILD_LD = "${BUILD_PREFIX}ld"
-export BUILD_CCLD = "${BUILD_PREFIX}gcc"
+export BUILD_CPP = "${BUILD_PREFIX}cpp ${BUILD_CC_ARCH}"
+export BUILD_LD = "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
+export BUILD_CCLD = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
 export BUILD_AR = "${BUILD_PREFIX}ar"
+export BUILD_AS = "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"
 export BUILD_RANLIB = "${BUILD_PREFIX}ranlib"
 export BUILD_STRIP = "${BUILD_PREFIX}strip"
 export BUILD_NM = "${BUILD_PREFIX}nm"
-- 
1.7.6



