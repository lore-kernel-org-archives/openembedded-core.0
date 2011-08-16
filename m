Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QtATL-0005qT-Fh
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 05:37:47 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Aug 2011 20:33:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,378,1309762800"; 
   d="scan'208";a="7606366"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Aug 2011 20:33:09 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 11:34:15 +0800
Message-Id: <48beb150532e969254a1aba34bbb258a255e65cf.1313465312.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <844deaa2a05b429c261a49b7ebf85b35812b79eb.1313465312.git.lianhao.lu@intel.com>
References: <844deaa2a05b429c261a49b7ebf85b35812b79eb.1313465312.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1313465312.git.lianhao.lu@intel.com>
References: <cover.1313465312.git.lianhao.lu@intel.com>
Subject: [PATCH v3 Bug #892 2/2] meta-toolchain/environment: Collected site config files in runtime.
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
X-List-Received-Date: Tue, 16 Aug 2011 03:37:47 -0000

[YOCTO #892]
Use the new cached site config files generation mechanism in
toolchain-script.bbclass.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/populate_sdk.bbclass             |    2 +-
 meta/recipes-core/meta/meta-environment.bb    |    7 +++----
 meta/recipes-core/meta/meta-toolchain-gmae.bb |    2 ++
 meta/recipes-core/meta/meta-toolchain.bb      |    4 +---
 4 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/classes/populate_sdk.bbclass b/meta/classes/populate_sdk.bbclass
index 0f3591b..69780e5 100644
--- a/meta/classes/populate_sdk.bbclass
+++ b/meta/classes/populate_sdk.bbclass
@@ -47,7 +47,7 @@ fakeroot do_populate_sdk() {
 	ln -s /etc/ld.so.cache ${SDK_OUTPUT}/${SDKPATHNATIVE}/etc/ld.so.cache
 
 	# Setup site file for external use
-	toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${MULTIMACH_TARGET_SYS} ${CONFIG_SITE}
+	toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${MULTIMACH_TARGET_SYS}
 
 	toolchain_create_sdk_env_script
 
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index 114727c..39ba96c 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -2,13 +2,12 @@ DESCRIPTION = "Package of environment files for SDK"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 LICENSE = "MIT"
-PR = "r6"
+PR = "r7"
 
 EXCLUDE_FROM_WORLD = "1"
 
 inherit toolchain-scripts
-# get target config site before inheritting cross-canadian
-TARGET_CONFIG_SITE := "${@siteinfo_get_files(d)}"
+TOOLCHAIN_NEED_CONFIGSITE_CACHE += "zlib"
 REAL_MULTIMACH_TARGET_SYS = "${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 SDK_DIR = "${WORKDIR}/sdk"
@@ -23,7 +22,7 @@ do_generate_content() {
     rm -rf ${SDK_OUTPUT}
     mkdir -p ${SDK_OUTPUT}/${SDKPATH}
 
-    toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS} ${TARGET_CONFIG_SITE}
+    toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS}
 
     toolchain_create_sdk_env_script_for_installer ${REAL_MULTIMACH_TARGET_SYS}
 
diff --git a/meta/recipes-core/meta/meta-toolchain-gmae.bb b/meta/recipes-core/meta/meta-toolchain-gmae.bb
index 4f5501e..512810b 100644
--- a/meta/recipes-core/meta/meta-toolchain-gmae.bb
+++ b/meta/recipes-core/meta/meta-toolchain-gmae.bb
@@ -3,3 +3,5 @@ TOOLCHAIN_TARGET_TASK = "${TOOLCHAIN_TARGET_GMAETASK}"
 TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-toolchain-gmae-${DISTRO_VERSION}"
 PROVIDES = "meta-toolchain-sdk"
 require meta-toolchain.bb
+
+TOOLCHAIN_NEED_CONFIGSITE_CACHE += "zlib"
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



