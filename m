Return-Path: <chin.huat.ang@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B9CA172ECD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 05:47:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Apr 2018 22:47:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,467,1517904000"; d="scan'208";a="192670256"
Received: from chinhuat-mac01.png.intel.com (HELO ubuntu.localdomain)
	([172.30.199.28])
	by orsmga004.jf.intel.com with ESMTP; 18 Apr 2018 22:47:05 -0700
From: Chin Huat Ang <chin.huat.ang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Apr 2018 13:46:40 +0800
Message-Id: <1524116800-25332-1-git-send-email-chin.huat.ang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] toolchain-scripts: preserve host path in environment setup script
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
X-List-Received-Date: Thu, 19 Apr 2018 05:47:05 -0000

The environment setup script generated in the build directory has host paths
filtered, sourcing this script will break runqemu as it requires host
/bin/stty. To resolve this, the script generation now sets the PATH variable
to include the original values obtain from BB_ORIGENV.

[YOCTO #12695]

Signed-off-by: Chin Huat Ang <chin.huat.ang@intel.com>
---
 meta/classes/toolchain-scripts.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index eeb320d..75f76d9 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -62,7 +62,7 @@ toolchain_create_tree_env_script () {
 	script=${TMPDIR}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
 	rm -f $script
 	touch $script
-	echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${PATH}' >> $script
+	echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${@d.getVar("BB_ORIGENV", False).getVar("PATH", False)}' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR}' >> $script
 	echo 'export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}' >> $script
 	echo 'export CONFIG_SITE="${@siteinfo_get_files(d)}"' >> $script
-- 
2.7.4


