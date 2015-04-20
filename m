Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 91BF473D87
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 16:48:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Apr 2015 09:47:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,610,1422950400"; d="scan'208";a="716384591"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.5.75])
	by orsmga002.jf.intel.com with ESMTP; 20 Apr 2015 09:47:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Apr 2015 17:47:08 +0100
Message-Id: <8e87613750870eebd71173683bcb3668966743ea.1429548323.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429548323.git.paul.eggleton@linux.intel.com>
References: <cover.1429548323.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1429548323.git.paul.eggleton@linux.intel.com>
References: <cover.1429548323.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/5] classes/populate_sdk_base: Show title in SDK installer
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
X-List-Received-Date: Mon, 20 Apr 2015 16:48:02 -0000

Show a friendly title when running the SDK installer, so the user knows
what SDK they are installing. The title is controlled by the
SDK_INSTALLER_TITLE variable and includes the distro name and SDK
version by default.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_base.bbclass       | 4 ++++
 meta/classes/populate_sdk_ext.bbclass        | 2 ++
 meta/files/toolchain-shar-extract.sh         | 3 +++
 meta/recipes-core/meta/buildtools-tarball.bb | 2 ++
 4 files changed, 11 insertions(+)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 5c07693..13a0b1f 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -54,6 +54,8 @@ SDK_PACKAGING_FUNC ?= "create_shar"
 SDK_POST_INSTALL_COMMAND ?= ""
 SDK_RELOCATE_AFTER_INSTALL ?= "1"
 
+SDK_TITLE ?= "${@d.getVar('DISTRO_NAME', True) or d.getVar('DISTRO', True)} SDK"
+
 SDK_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.manifest"
 python write_target_sdk_manifest () {
     from oe.sdk import sdk_list_installed_packages
@@ -134,6 +136,8 @@ EOF
 		-e 's#@SDKPATH@#${SDKPATH}#g' \
 		-e 's#@OLDEST_KERNEL@#${OLDEST_KERNEL}#g' \
 		-e 's#@REAL_MULTIMACH_TARGET_SYS@#${REAL_MULTIMACH_TARGET_SYS}#g' \
+		-e 's#@SDK_TITLE@#${SDK_TITLE}#g' \
+		-e 's#@SDK_VERSION@#${SDK_VERSION}#g' \
 		-e '/@SDK_POST_INSTALL_COMMAND@/d' \
 		${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
 
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 44b926e..dc2c58e 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -35,6 +35,8 @@ SDK_DIR_task-populate-sdk-ext = "${WORKDIR}/sdk-ext"
 B_task-populate-sdk-ext = "${SDK_DIR}"
 TOOLCHAIN_OUTPUTNAME_task-populate-sdk-ext = "${SDK_NAME}-toolchain-ext-${SDK_VERSION}"
 
+SDK_TITLE_task-populate-sdk-ext = "${@d.getVar('DISTRO_NAME', True) or d.getVar('DISTRO', True)} Extensible SDK"
+
 python copy_buildsystem () {
     import re
     import oe.copy_buildsystem
diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 516aa3a..13b5951 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -64,6 +64,9 @@ while getopts ":yd:DRS" OPT; do
 	esac
 done
 
+echo "@SDK_TITLE@ installer version @SDK_VERSION@"
+echo "==========================================================="
+
 if [ $verbose = 1 ] ; then
 	set -x
 fi
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 6d4c8c8..3d2169b 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -29,6 +29,8 @@ SDK_PACKAGE_ARCHS =+ "buildtools-dummy-${SDKPKGSUFFIX}"
 
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-buildtools-nativesdk-standalone-${DISTRO_VERSION}"
 
+SDK_TITLE = "Build tools"
+
 RDEPENDS = "${TOOLCHAIN_HOST_TASK}"
 
 EXCLUDE_FROM_WORLD = "1"
-- 
2.1.0


