Return-Path: <chin.huat.ang@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C8E4371974
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 08:01:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Apr 2018 01:01:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,325,1520924400"; d="scan'208";a="50637108"
Received: from chinhuat-mac01.png.intel.com (HELO ubuntu.localdomain)
	([172.30.199.29])
	by orsmga001.jf.intel.com with ESMTP; 25 Apr 2018 01:01:05 -0700
From: Chin Huat Ang <chin.huat.ang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2018 16:00:13 +0800
Message-Id: <1524643213-5505-1-git-send-email-chin.huat.ang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v3] toolchain-scripts: preserve host path in environment setup script
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
X-List-Received-Date: Wed, 25 Apr 2018 08:01:06 -0000

The environment setup script generated in the build directory sets the PATH
variable by expanding ${PATH} which would have host paths filtered. Sourcing
this script to run runqemu will not work as it complains host stty (/bin/stty)
cannot be found.

To resolve this, the script no longer expands ${PATH} during generation time,
instead it will now source oe-init-build-env to initialize the build
environment so that all host paths will be preserved. Also be sure to prepend
STAGING_BINDIR_TOOLCHAIN to the PATH variable so that the toolchain from the
build directory can be found.

[YOCTO #12695]

Signed-off-by: Chin Huat Ang <chin.huat.ang@intel.com>
---
 meta/classes/toolchain-scripts.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index eeb320d..ee411dd 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -62,7 +62,8 @@ toolchain_create_tree_env_script () {
 	script=${TMPDIR}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
 	rm -f $script
 	touch $script
-	echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${PATH}' >> $script
+	echo ". ${COREBASE}/oe-init-build-env ${TOPDIR}" >> $script
+	echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${STAGING_BINDIR_TOOLCHAIN}:$PATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR}' >> $script
 	echo 'export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}' >> $script
 	echo 'export CONFIG_SITE="${@siteinfo_get_files(d)}"' >> $script
-- 
2.7.4


