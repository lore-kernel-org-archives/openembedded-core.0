Return-Path: <chin.huat.ang@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7FDDF75553
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 01:13:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2018 18:13:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,339,1526367600"; d="scan'208";a="70655080"
Received: from chinhuat-mac01.png.intel.com (HELO ubuntu.localdomain)
	([10.221.21.43])
	by fmsmga004.fm.intel.com with ESMTP; 11 Jul 2018 18:13:19 -0700
From: Chin Huat Ang <chin.huat.ang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jul 2018 09:13:00 +0800
Message-Id: <1531357980-3431-1-git-send-email-chin.huat.ang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] nativesdk-cmake: fix cmake toolchain file path
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
X-List-Received-Date: Thu, 12 Jul 2018 01:13:22 -0000

The SDK cmake is currently broken as the cmake.sh (sourced via environment-
setup script) sets cmake alias which looks for cmake toolchain file
$OECORE_NATIVE_SYSROOT/usr/share/OEToolchainConfig.cmake which cannot be
found as the file is packaged into nativesdk-cmake-dev package that is not
installed as part of SDK by default.

The solution here is to move OEToolchainConfig.cmake to a different path which
doesn't get packaged up in -dev package, in this case the same directory as
cmake.sh which depends on it.

Both qemux86 and qemuarm64 core-image-sato SDK's cmake has been tested to work
with this fix to make sure that OEToolchainConfig.cmake does not have target
architecture specific cmake toolchain settings.

[YOCTO #12827]

Signed-off-by: Chin Huat Ang <chin.huat.ang@intel.com>
---
 meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh | 2 +-
 meta/recipes-devtools/cmake/cmake_3.11.4.bb              | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh b/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
index 0eb56b6..be7f2b6 100644
--- a/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
+++ b/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
@@ -1 +1 @@
-alias cmake="cmake -DCMAKE_TOOLCHAIN_FILE=$OECORE_NATIVE_SYSROOT/usr/share/cmake/OEToolchainConfig.cmake"
+alias cmake="cmake -DCMAKE_TOOLCHAIN_FILE=$OECORE_NATIVE_SYSROOT/environment-setup.d/OEToolchainConfig.cmake"
diff --git a/meta/recipes-devtools/cmake/cmake_3.11.4.bb b/meta/recipes-devtools/cmake/cmake_3.11.4.bb
index 3f8fd7a..7ef5740 100644
--- a/meta/recipes-devtools/cmake/cmake_3.11.4.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.11.4.bb
@@ -35,10 +35,8 @@ EXTRA_OECMAKE=" \
 "
 
 do_install_append_class-nativesdk() {
-    mkdir -p ${D}${datadir}/cmake
-    install -m 644 ${WORKDIR}/OEToolchainConfig.cmake ${D}${datadir}/cmake/
-
     mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+    install -m 644 ${WORKDIR}/OEToolchainConfig.cmake ${D}${SDKPATHNATIVE}/environment-setup.d/OEToolchainConfig.cmake
     install -m 644 ${WORKDIR}/environment.d-cmake.sh ${D}${SDKPATHNATIVE}/environment-setup.d/cmake.sh
 }
 
-- 
2.7.4


