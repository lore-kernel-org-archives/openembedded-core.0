Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qh592-00034N-2b
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 21:30:52 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Jul 2011 12:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,526,1304319600"; d="scan'208";a="25507384"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by orsmga002.jf.intel.com with ESMTP; 13 Jul 2011 12:26:52 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 05:59:31 -0700
Message-Id: <6220e9316f6033364724b5d7a86917848dadf6be.1310561877.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1310561877.git.nitin.a.kamble@intel.com>
References: <cover.1310561877.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/3] bitbake.conf, bbclasses: define *_LD_ARCH & *AS_ARCH vars
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
X-List-Received-Date: Wed, 13 Jul 2011 19:30:52 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Just like TARGET_CC_ARCH, HOST_CC_ARCH, BUILD_CC_ARCH, SDK_CC_ARCH
define similar variables for LD & AS.

This is needed because for x32 need special parameters to be passed
to the "gcc" as well as "ld" & "as".

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/allarch.bbclass           |    2 ++
 meta/classes/cross-canadian.bbclass    |    2 ++
 meta/classes/cross.bbclass             |    2 ++
 meta/classes/crosssdk.bbclass          |    2 ++
 meta/classes/kernel.bbclass            |    4 ++++
 meta/classes/native.bbclass            |   10 +++++++---
 meta/classes/nativesdk.bbclass         |    4 ++++
 meta/classes/toolchain-scripts.bbclass |    5 +++--
 meta/conf/bitbake.conf                 |   21 +++++++++++++++------
 meta/conf/documentation.conf           |    2 ++
 10 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index e3ac392..2d25850 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -13,4 +13,6 @@ INHIBIT_DEFAULT_DEPS = "1"
 TARGET_ARCH = "allarch"
 TARGET_OS = "linux"
 TARGET_CC_ARCH = "none"
+TARGET_LD_ARCH = "none"
+TARGET_AS_ARCH = "none"
 PACKAGE_EXTRA_ARCHS = ""
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index edd51da..5669fe0 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -42,6 +42,8 @@ HOST_VENDOR = "${SDK_VENDOR}"
 HOST_OS = "${SDK_OS}"
 HOST_PREFIX = "${SDK_PREFIX}"
 HOST_CC_ARCH = "${SDK_CC_ARCH}"
+HOST_LD_ARCH = "${SDK_LD_ARCH}"
+HOST_AS_ARCH = "${SDK_AS_ARCH}"
 
 #assign DPKG_ARCH
 DPKG_ARCH = "${SDK_ARCH}"
diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index f9fd07a..86049c8 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -19,6 +19,8 @@ HOST_VENDOR = "${BUILD_VENDOR}"
 HOST_OS = "${BUILD_OS}"
 HOST_PREFIX = "${BUILD_PREFIX}"
 HOST_CC_ARCH = "${BUILD_CC_ARCH}"
+HOST_LD_ARCH = "${BUILD_LD_ARCH}"
+HOST_AS_ARCH = "${BUILD_AS_ARCH}"
 
 STAGING_DIR_HOST = "${STAGING_DIR}/${BASEPKG_HOST_SYS}"
 
diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index 3952ebd..5016762 100644
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
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b71a650..5a4e097 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -37,6 +37,7 @@ KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 
 KERNEL_CCSUFFIX ?= ""
 KERNEL_LDSUFFIX ?= ""
+KERNEL_ASSUFFIX ?= ""
 
 # Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
 # specific options necessary for building the kernel and modules.
@@ -45,9 +46,12 @@ TARGET_CC_KERNEL_ARCH ?= ""
 HOST_CC_KERNEL_ARCH ?= "${TARGET_CC_KERNEL_ARCH}"
 TARGET_LD_KERNEL_ARCH ?= ""
 HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
+TARGET_AS_KERNEL_ARCH ?= ""
+HOST_AS_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
 
 KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX} ${HOST_CC_KERNEL_ARCH}${TOOLCHAIN_OPTIONS}"
 KERNEL_LD = "${LD}${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}${TOOLCHAIN_OPTIONS}"
+KERNEL_AS = "${AS}${KERNEL_ASSUFFIX} ${HOST_AS_KERNEL_ARCH}${TOOLCHAIN_OPTIONS}"
 
 # Where built kernel lies in the kernel tree
 KERNEL_OUTPUT ?= "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 1e8de95..1f3b4ef 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -28,6 +28,8 @@ TARGET_OS = "${BUILD_OS}"
 TARGET_VENDOR = "${BUILD_VENDOR}"
 TARGET_PREFIX = "${BUILD_PREFIX}"
 TARGET_CC_ARCH = "${BUILD_CC_ARCH}"
+TARGET_LD_ARCH = "${BUILD_LD_ARCH}"
+TARGET_AS_ARCH = "${BUILD_AS_ARCH}"
 TARGET_FPU = ""
 
 HOST_ARCH = "${BUILD_ARCH}"
@@ -35,6 +37,8 @@ HOST_OS = "${BUILD_OS}"
 HOST_VENDOR = "${BUILD_VENDOR}"
 HOST_PREFIX = "${BUILD_PREFIX}"
 HOST_CC_ARCH = "${BUILD_CC_ARCH}"
+HOST_LD_ARCH = "${BUILD_LD_ARCH}"
+HOST_AS_ARCH = "${BUILD_AS_ARCH}"
 
 CPPFLAGS = "${BUILD_CPPFLAGS}"
 CFLAGS = "${BUILD_CFLAGS}"
@@ -54,11 +58,11 @@ export CONFIG_SITE = ""
 export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}"
 export CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}"
 export F77 = "${CCACHE}${HOST_PREFIX}g77 ${HOST_CC_ARCH}"
-export CPP = "${HOST_PREFIX}gcc -E"
-export LD = "${HOST_PREFIX}ld"
+export CPP = "${HOST_PREFIX}gcc -E ${HOST_CC_ARCH}"
+export LD = "${HOST_PREFIX}ld ${HOST_LD_ARCH}"
 export CCLD = "${CC}"
 export AR = "${HOST_PREFIX}ar"
-export AS = "${HOST_PREFIX}as"
+export AS = "${HOST_PREFIX}as ${HOST_AS_ARCH}"
 export RANLIB = "${HOST_PREFIX}ranlib"
 export STRIP = "${HOST_PREFIX}strip"
 
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 3fe4bf9..39e6f76 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -27,6 +27,8 @@ HOST_VENDOR = "${SDK_VENDOR}"
 HOST_OS = "${SDK_OS}"
 HOST_PREFIX = "${SDK_PREFIX}"
 HOST_CC_ARCH = "${SDK_CC_ARCH}"
+HOST_LD_ARCH = "${SDK_LD_ARCH}"
+HOST_AS_ARCH = "${SDK_AS_ARCH}"
 #HOST_SYS = "${HOST_ARCH}${TARGET_VENDOR}-${HOST_OS}"
 
 TARGET_ARCH = "${SDK_ARCH}"
@@ -34,6 +36,8 @@ TARGET_VENDOR = "${SDK_VENDOR}"
 TARGET_OS = "${SDK_OS}"
 TARGET_PREFIX = "${SDK_PREFIX}"
 TARGET_CC_ARCH = "${SDK_CC_ARCH}"
+TARGET_LD_ARCH = "${SDK_LD_ARCH}"
+TARGET_AS_ARCH = "${SDK_AS_ARCH}"
 TARGET_FPU = ""
 
 CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 3301319..0f6c653 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -24,7 +24,7 @@ toolchain_create_sdk_env_script () {
 	fi
 	echo 'export CFLAGS="${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
 	echo 'export CXXFLAGS="${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
-	echo 'export LDFLAGS="--sysroot=${SDKTARGETSYSROOT}"' >> $script
+	echo 'export LDFLAGS="${TARGET_LD_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
 	echo 'export CPPFLAGS="--sysroot=${SDKTARGETSYSROOT}"' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
 	echo 'export OECORE_TARGET_SYSROOT="${SDKTARGETSYSROOT}"' >> $script
@@ -58,6 +58,7 @@ toolchain_create_tree_env_script () {
 	fi
 	echo 'export CFLAGS="${TARGET_CC_ARCH}"' >> $script
 	echo 'export CXXFLAGS="${TARGET_CC_ARCH}"' >> $script
+	echo 'export LDFLAGS="${TARGET_LD_ARCH}"' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${STAGING_DIR_NATIVE}"' >> $script
 	echo 'export OECORE_TARGET_SYSROOT="${STAGING_DIR_TARGET}"' >> $script
 	echo 'export OECORE_ACLOCAL_OPTS="-I ${STAGING_DIR_NATIVE}/usr/share/aclocal"' >> $script
@@ -87,7 +88,7 @@ toolchain_create_sdk_env_script_for_installer () {
 	fi
 	echo 'export CFLAGS="${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
 	echo 'export CXXFLAGS="${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
-	echo 'export LDFLAGS="--sysroot=##SDKTARGETSYSROOT##"' >> $script
+	echo 'export LDFLAGS="${TARGET_LD_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
 	echo 'export CPPFLAGS="--sysroot=##SDKTARGETSYSROOT##"' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
 	echo 'export OECORE_TARGET_SYSROOT="##SDKTARGETSYSROOT##"' >> $script
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 463991d..a74f629 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -66,6 +66,8 @@ BUILD_VENDOR = ""
 BUILD_SYS = "${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
 BUILD_PREFIX = ""
 BUILD_CC_ARCH = ""
+BUILD_LD_ARCH = ""
+BUILD_AS_ARCH = ""
 BUILD_EXEEXT = ""
 
 HOST_ARCH = "${TARGET_ARCH}"
@@ -74,6 +76,8 @@ HOST_VENDOR = "${TARGET_VENDOR}"
 HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
 HOST_PREFIX = "${TARGET_PREFIX}"
 HOST_CC_ARCH = "${TARGET_CC_ARCH}"
+HOST_LD_ARCH = "${TARGET_LD_ARCH}"
+HOST_AS_ARCH = "${TARGET_AS_ARCH}"
 HOST_EXEEXT = ""
 
 TARGET_ARCH = "INVALID"
@@ -82,6 +86,8 @@ TARGET_VENDOR = "-oe"
 TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}"
 TARGET_PREFIX = "${TARGET_SYS}-"
 TARGET_CC_ARCH = ""
+TARGET_LD_ARCH = ""
+TARGET_AS_ARCH = ""
 
 SDK_ARCH = "${BUILD_ARCH}"
 SDK_OS = "${BUILD_OS}"
@@ -89,6 +95,8 @@ SDK_VENDOR = "-oesdk"
 SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + bb.data.getVar('SDK_OS', d, 1), ''][bb.data.getVar('SDK_OS', d, 1) == ('' or 'custom')]}"
 SDK_PREFIX = "${SDK_SYS}-"
 SDK_CC_ARCH = "${BUILD_CC_ARCH}"
+SDK_LD_ARCH = "${BUILD_LD_ARCH}"
+SDK_AS_ARCH = "${BUILD_AS_ARCH}"
 
 BASE_PACKAGE_ARCH = "${HOST_ARCH}"
 PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
@@ -390,11 +398,11 @@ export CCACHE_DIR = "${TMPDIR}/ccache/${HOST_SYS}/${PN}"
 export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export F77 = "${CCACHE}${HOST_PREFIX}g77 ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-export CPP = "${HOST_PREFIX}gcc -E${TOOLCHAIN_OPTIONS}"
-export LD = "${HOST_PREFIX}ld${TOOLCHAIN_OPTIONS}"
+export CPP = "${HOST_PREFIX}gcc ${HOST_CC_ARCH} -E${TOOLCHAIN_OPTIONS}"
+export LD = "${HOST_PREFIX}ld ${HOST_LD_ARCH}${TOOLCHAIN_OPTIONS}"
 export CCLD = "${CC}"
 export AR = "${HOST_PREFIX}ar"
-export AS = "${HOST_PREFIX}as"
+export AS = "${HOST_PREFIX}as ${HOST_AS_ARCH}"
 export RANLIB = "${HOST_PREFIX}ranlib"
 export STRIP = "${HOST_PREFIX}strip"
 export OBJCOPY = "${HOST_PREFIX}objcopy"
@@ -405,10 +413,11 @@ PYTHON = "${@sys.executable}"
 export BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
 export BUILD_CXX = "${CCACHE}${BUILD_PREFIX}g++ ${BUILD_CC_ARCH}"
 export BUILD_F77 = "${CCACHE}${BUILD_PREFIX}g77 ${BUILD_CC_ARCH}"
-export BUILD_CPP = "${BUILD_PREFIX}cpp"
-export BUILD_LD = "${BUILD_PREFIX}ld"
-export BUILD_CCLD = "${BUILD_PREFIX}gcc"
+export BUILD_CPP = "${BUILD_PREFIX}cpp ${BUILD_CC_ARCH}"
+export BUILD_LD = "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
+export BUILD_CCLD = "${BUILD_CC}"
 export BUILD_AR = "${BUILD_PREFIX}ar"
+export BUILD_AS = "${BUILD_PREFIX}as ${HOST_AS_ARCH}"
 export BUILD_RANLIB = "${BUILD_PREFIX}ranlib"
 export BUILD_STRIP = "${BUILD_PREFIX}strip"
 export BUILD_NM = "${BUILD_PREFIX}nm"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index d984d0d..3aeba8d 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -13,6 +13,7 @@ BUILD_VENDOR[doc] = "FIXME"
 BUILD_SYS[doc] = "FIXME"
 BUILD_PREFIX[doc] = "FIXME"
 BUILD_CC_ARCH[doc] = "FIXME"
+BUILD_LD_ARCH[doc] = "FIXME"
 
 HOST_ARCH[doc] = "The name of the target architecture. Normally same as the TARGET_ARCH. @see TARGET_ARCH @group base"
 HOST_OS[doc] = "The name of the target operating system. Normally the same as the TARGET_OS. \
@@ -21,6 +22,7 @@ HOST_VENDOR[doc] = "The name of the vendor. Normally same as the TARGET_VENDOR.
 HOST_SYS[doc] = "FIXME"
 HOST_PREFIX[doc] = "Normally same as the TARGET_PREFIX. @see TARGET_PREFIX @group base"
 HOST_CC_ARCH[doc] = "Normally same as the TARGET_CC_ARCH. @see TARGET_CC_ARCH @group base"
+HOST_LD_ARCH[doc] = "Normally same as the TARGET_LD_ARCH. @see TARGET_LD_ARCH @group base"
 HOST_NONSYSV[doc] = 'This flag can be set to "1" if the host system is not SysV compatible. E.g.\
 fakeroot-native will be build with tcp as IPC implementation.'
 
-- 
1.7.5.4



