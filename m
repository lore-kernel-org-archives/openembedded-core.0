Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Qrrcd-0004Jx-4h
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 15:17:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Aug 2011 06:13:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="37172513"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by orsmga002.jf.intel.com with ESMTP; 12 Aug 2011 06:13:24 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2011 21:14:51 +0800
Message-Id: <68c074923929465507f14ad6f019feac06b4c408.1313154666.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <c5610872f10f4617418f5f338fdecba4deb47310.1313154666.git.lianhao.lu@intel.com>
References: <c5610872f10f4617418f5f338fdecba4deb47310.1313154666.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1313154666.git.lianhao.lu@intel.com>
References: <cover.1313154666.git.lianhao.lu@intel.com>
Subject: [PATCH Bug #892 v2 2/2] meta-toolchain/environment: Use site config in rootfs.
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
X-List-Received-Date: Fri, 12 Aug 2011 13:17:59 -0000

[YOCTO #892] Use the site config file in rootfs to set up the build
environment.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/populate_sdk.bbclass          |    2 +-
 meta/recipes-core/meta/meta-environment.bb |    6 +-----
 meta/recipes-core/meta/meta-toolchain.bb   |    4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta/classes/populate_sdk.bbclass b/meta/classes/populate_sdk.bbclass
index 0f3591b..acb9892 100644
--- a/meta/classes/populate_sdk.bbclass
+++ b/meta/classes/populate_sdk.bbclass
@@ -47,7 +47,7 @@ fakeroot do_populate_sdk() {
 	ln -s /etc/ld.so.cache ${SDK_OUTPUT}/${SDKPATHNATIVE}/etc/ld.so.cache
 
 	# Setup site file for external use
-	toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${MULTIMACH_TARGET_SYS} ${CONFIG_SITE}
+	toolchain_create_rootfs_siteconfig ${SDK_OUTPUT}/${SDKTARGETSYSROOT} 'false'
 
 	toolchain_create_sdk_env_script
 
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index 114727c..b62ec0e 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -2,13 +2,11 @@ DESCRIPTION = "Package of environment files for SDK"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 LICENSE = "MIT"
-PR = "r6"
+PR = "r7"
 
 EXCLUDE_FROM_WORLD = "1"
 
 inherit toolchain-scripts
-# get target config site before inheritting cross-canadian
-TARGET_CONFIG_SITE := "${@siteinfo_get_files(d)}"
 REAL_MULTIMACH_TARGET_SYS = "${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 SDK_DIR = "${WORKDIR}/sdk"
@@ -23,8 +21,6 @@ do_generate_content() {
     rm -rf ${SDK_OUTPUT}
     mkdir -p ${SDK_OUTPUT}/${SDKPATH}
 
-    toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS} ${TARGET_CONFIG_SITE}
-
     toolchain_create_sdk_env_script_for_installer ${REAL_MULTIMACH_TARGET_SYS}
 
     # Add version information
diff --git a/meta/recipes-core/meta/meta-toolchain.bb b/meta/recipes-core/meta/meta-toolchain.bb
index 164d717..1058c68 100644
--- a/meta/recipes-core/meta/meta-toolchain.bb
+++ b/meta/recipes-core/meta/meta-toolchain.bb
@@ -1,12 +1,10 @@
 DESCRIPTION = "Meta package for building a installable toolchain"
 LICENSE = "MIT"
 
-PR = "r5"
+PR = "r6"
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 IMAGETEST ?= "dummy"
 inherit populate_sdk imagetest-${IMAGETEST}
-
-CONFIG_SITE := "${@siteinfo_get_files(d)}"
-- 
1.7.0.4



