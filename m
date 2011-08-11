Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QrWL1-0000Tj-0a
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 16:34:23 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 Aug 2011 07:29:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,356,1309762800"; 
   d="scan'208";a="6170699"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Aug 2011 07:29:51 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 22:31:23 +0800
Message-Id: <1d326646dd4794bc8931755d233eee378432da2a.1313072334.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <a536443a01f8059b9a11418ea7b812e3286b7576.1313072334.git.lianhao.lu@intel.com>
References: <a536443a01f8059b9a11418ea7b812e3286b7576.1313072334.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1313072334.git.lianhao.lu@intel.com>
References: <cover.1313072334.git.lianhao.lu@intel.com>
Subject: [PATCH 2/2] meta-toolchain/environment: Use site config in rootfs.
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
X-List-Received-Date: Thu, 11 Aug 2011 14:34:23 -0000

[YOCTO #892] Use the site config file in rootfs to set up the build
environment.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/populate_sdk.bbclass          |    2 +-
 meta/recipes-core/meta/meta-environment.bb |    6 +-----
 meta/recipes-core/meta/meta-toolchain.bb   |    4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta/classes/populate_sdk.bbclass b/meta/classes/populate_sdk.bbclass
index 0f3591b..f755b81 100644
--- a/meta/classes/populate_sdk.bbclass
+++ b/meta/classes/populate_sdk.bbclass
@@ -47,7 +47,7 @@ fakeroot do_populate_sdk() {
 	ln -s /etc/ld.so.cache ${SDK_OUTPUT}/${SDKPATHNATIVE}/etc/ld.so.cache
 
 	# Setup site file for external use
-	toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${MULTIMACH_TARGET_SYS} ${CONFIG_SITE}
+	toolchain_create_rootfs_siteconfig ${SDK_OUTPUT}/${SDKTARGETSYSROOT}
 
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



