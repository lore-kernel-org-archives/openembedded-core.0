Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 73826706B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 17:00:51 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2015 09:00:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,631,1418112000"; d="scan'208";a="531537406"
Received: from afedko-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.4.45])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2015 08:51:52 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Feb 2015 17:00:39 +0000
Message-Id: <3bf3f70856070e3fb436521fdb625bd12185c8fb.1424709353.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424709353.git.paul.eggleton@linux.intel.com>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424709353.git.paul.eggleton@linux.intel.com>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/9] toolchain-scripts: Add parameters to toolchain_create_sdk_env_script.
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
X-List-Received-Date: Mon, 23 Feb 2015 17:00:51 -0000

From: Randy Witt <randy.e.witt@linux.intel.com>

To add some flexibility to setting up the paths for the toolchain,
add some parameters. This initial use will be in order to point at
the buildsystem toolchain copied in by copy_buildsystem.py.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/toolchain-scripts.bbclass | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 9836db4..ea6aff0 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -7,6 +7,9 @@ REAL_MULTIMACH_TARGET_SYS ?= "${MULTIMACH_TARGET_SYS}"
 # This function creates an environment-setup-script for use in a deployable SDK
 toolchain_create_sdk_env_script () {
 	# Create environment setup script
+	sdkpathnative=${7:-${SDKPATHNATIVE}}
+	prefix=${6:-${prefix_nativesdk}}
+	bindir=${5:-${bindir_nativesdk}}
 	libdir=${4:-${libdir}}
 	sysroot=${3:-${SDKTARGETSYSROOT}}
 	multimach_target_sys=${2:-${REAL_MULTIMACH_TARGET_SYS}}
@@ -16,17 +19,17 @@ toolchain_create_sdk_env_script () {
 	echo 'export SDKTARGETSYSROOT='"$sysroot" >> $script
 	EXTRAPATH=""
 	for i in ${CANADIANEXTRAOS}; do
-		EXTRAPATH="$EXTRAPATH:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_ARCH}${TARGET_VENDOR}-$i"
+		EXTRAPATH="$EXTRAPATH:$sdkpathnative$bindir/${TARGET_ARCH}${TARGET_VENDOR}-$i"
 	done
-	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_SYS}'$EXTRAPATH':$PATH' >> $script
-	echo 'export CCACHE_PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_SYS}'$EXTRAPATH':$CCACHE_PATH' >> $script
+	echo "export PATH=$sdkpathnative$bindir:$sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':$PATH' >> $script
+	echo 'export CCACHE_PATH=$sdkpathnative$bindir:$sdkpathnative$bindir/${TARGET_SYS}'$EXTRAPATH':$CCACHE_PATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
 	echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig' >> $script
 	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
-	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
+	echo "export OECORE_NATIVE_SYSROOT=\"$sdkpathnative\"" >> $script
 	echo 'export OECORE_TARGET_SYSROOT="$SDKTARGETSYSROOT"' >> $script
-	echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/aclocal"' >> $script
-	echo 'export PYTHONHOME=${SDKPATHNATIVE}${prefix_nativesdk}' >> $script
+	echo "export OECORE_ACLOCAL_OPTS=\"-I $sdkpathnative/usr/share/aclocal\"" >> $script
+	echo "export PYTHONHOME=$sdkpathnative$prefix" >> $script
 
 	toolchain_shared_env_script
 }
-- 
1.9.3


