Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qnn7G-0006ZU-RB
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 09:40:47 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Aug 2011 00:36:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,299,1309762800"; d="scan'208";a="34147057"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga001.jf.intel.com with ESMTP; 01 Aug 2011 00:36:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2011 00:35:53 -0700
Message-Id: <b69a2be2f30dc633597399d42d6c87d9f0910c1a.1312182844.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
Subject: [PATCH 01/22] meta-environment: set correct *MULTIMACH_TARGET_SYS.
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
X-List-Received-Date: Mon, 01 Aug 2011 07:40:47 -0000

From: Lianhao Lu <lianhao.lu@intel.com>

Fixed [BUGID #1299]. OLD_MULTIMACH_TARGET_SYS is no longer available.
Use new recipe-scope variable REAL_MULTIMACH_TARGET_SYS instead.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/toolchain-scripts.bbclass     |    7 ++++---
 meta/recipes-core/meta/meta-environment.bb |    9 +++++----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 3301319..832cce4 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -66,13 +66,14 @@ toolchain_create_tree_env_script () {
 # This function creates an environment-setup-script for use by the ADT installer
 toolchain_create_sdk_env_script_for_installer () {
 	# Create environment setup script
-	script=${SDK_OUTPUT}/${SDKPATH}/environment-setup-${OLD_MULTIMACH_TARGET_SYS}
+	local multimach_target_sys=$1
+	script=${SDK_OUTPUT}/${SDKPATH}/environment-setup-${multimach_target_sys}
 	rm -f $script
 	touch $script
-	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${OLD_MULTIMACH_TARGET_SYS}:$PATH' >> $script
+	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/'"${multimach_target_sys}"':$PATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=##SDKTARGETSYSROOT##' >> $script
 	echo 'export PKG_CONFIG_PATH=##SDKTARGETSYSROOT##${target_libdir}/pkgconfig' >> $script
-	echo 'export CONFIG_SITE=${SDKPATH}/site-config-${OLD_MULTIMACH_TARGET_SYS}' >> $script
+	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
 	echo 'export CC=${TARGET_PREFIX}gcc' >> $script
 	echo 'export CXX=${TARGET_PREFIX}g++' >> $script
 	echo 'export GDB=${TARGET_PREFIX}gdb' >> $script
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index 351cbf0..6d547bb 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -2,13 +2,14 @@ DESCRIPTION = "Package of environment files for SDK"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 LICENSE = "MIT"
-PR = "r4"
+PR = "r5"
 
 EXCLUDE_FROM_WORLD = "1"
 
 inherit toolchain-scripts
 # get target config site before inheritting cross-canadian
 TARGET_CONFIG_SITE := "${@siteinfo_get_files(d)}"
+REAL_MULTIMACH_TARGET_SYS = "${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 SDK_DIR = "${WORKDIR}/sdk"
 SDK_OUTPUT = "${SDK_DIR}/image"
@@ -22,12 +23,12 @@ do_generate_content() {
     rm -rf ${SDK_OUTPUT}
     mkdir -p ${SDK_OUTPUT}/${SDKPATH}
 
-    toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${OLD_MULTIMACH_TARGET_SYS} ${TARGET_CONFIG_SITE}
+    toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS} ${TARGET_CONFIG_SITE}
 
-    toolchain_create_sdk_env_script_for_installer
+    toolchain_create_sdk_env_script_for_installer ${REAL_MULTIMACH_TARGET_SYS}
 
     # Add version information
-    toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${OLD_MULTIMACH_TARGET_SYS}
+    toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${REAL_MULTIMACH_TARGET_SYS}
 }
 addtask generate_content before do_install after do_compile
 
-- 
1.7.3.4



