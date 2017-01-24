Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8F7DE771EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 11:41:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 24 Jan 2017 03:41:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,278,1477983600"; d="scan'208";a="1086671389"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.2.20])
	by orsmga001.jf.intel.com with ESMTP; 24 Jan 2017 03:41:43 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 11:41:39 +0000
Message-Id: <20170124114139.21140-1-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] toolchain-scripts: remove CCACHE_PATH from environment script
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
X-List-Received-Date: Tue, 24 Jan 2017 11:41:44 -0000

CCACHE_PATH was added to the toolchain-scripts in commit
1d31ddb856a80ba9da1a64ed5d701dc0f7351ef7 without a detailed
explanation as to why. This commit removes that environment
variable as it's causing failures since the introduction of
host_gcc_version() to oe.utils in
d36f41e5658bbbb6080ee833027879c119edf3e0, as used by
uninative to determine NATIVELSBSTRING.

This causes errors when the host has ccache available in in PATH
- host_gcc_version() fails because ccache has been told to only
look for the compiler in CCACHE_PATH and can't find gcc in order
to check its version. Toolchain compilers aren't detected due to
the binaries being prefixed with the triplet of the target.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/classes/toolchain-scripts.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 7b68d20..260ece9 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -31,7 +31,6 @@ toolchain_create_sdk_env_script () {
 		EXTRAPATH="$EXTRAPATH:$sdkpathnative$bindir/${TARGET_ARCH}${TARGET_VENDOR}-$i"
 	done
 	echo "export PATH=$sdkpathnative$bindir:$sdkpathnative$sbindir:$sdkpathnative$base_bindir:$sdkpathnative$base_sbindir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':$PATH' >> $script
-	echo "export CCACHE_PATH=$sdkpathnative$bindir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':$CCACHE_PATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
 	echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig:$SDKTARGETSYSROOT'"$prefix"'/share/pkgconfig' >> $script
 	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
@@ -50,7 +49,6 @@ toolchain_create_tree_env_script () {
 	rm -f $script
 	touch $script
 	echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${PATH}' >> $script
-	echo 'export CCACHE_PATH=${STAGING_DIR_NATIVE}/usr/bin:${CCACHE_PATH}' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR}' >> $script
 	echo 'export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}' >> $script
 	echo 'export CONFIG_SITE="${@siteinfo_get_files(d)}"' >> $script
-- 
2.9.3


