Return-Path: <chin.huat.ang@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3536460110
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2018 23:23:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Apr 2018 16:23:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,320,1520924400"; d="scan'208";a="34726966"
Received: from unknown (HELO ubuntu.localdomain) ([10.249.70.44])
	by fmsmga008.fm.intel.com with ESMTP; 23 Apr 2018 16:23:47 -0700
From: Chin Huat Ang <chin.huat.ang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Apr 2018 07:23:37 +0800
Message-Id: <1524525817-1724-1-git-send-email-chin.huat.ang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] toolchain-scripts: preserve host path in environment setup script
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
X-List-Received-Date: Mon, 23 Apr 2018 23:23:47 -0000

The environment setup script generated in the build directory sets the PATH
variable by expanding ${PATH} which would have host paths filtered. Sourcing
this script to run runqemu will not work as it complains host stty (/bin/stty)
cannot be found.

To resolve this, the script no longer expands ${PATH} during generation time,
instead it will now source oe-init-build-env to initialize the build
environment, followed by extending the PATH variable and including additional
environment variables for the build directory toolchain.

[YOCTO #12695]

Signed-off-by: Chin Huat Ang <chin.huat.ang@intel.com>
---
 meta/classes/toolchain-scripts.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index eeb320d..1f6d1aa 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -62,7 +62,8 @@ toolchain_create_tree_env_script () {
 	script=${TMPDIR}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
 	rm -f $script
 	touch $script
-	echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${PATH}' >> $script
+	echo ". ${COREBASE}/oe-init-build-env ${TOPDIR}" >> $script
+	echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:$PATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR}' >> $script
 	echo 'export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}' >> $script
 	echo 'export CONFIG_SITE="${@siteinfo_get_files(d)}"' >> $script
-- 
2.7.4


