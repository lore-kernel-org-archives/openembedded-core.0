Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 98274770EE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 16:50:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Feb 2016 08:50:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,521,1449561600"; d="scan'208";a="923546065"
Received: from bitbang.jf.intel.com ([10.7.199.90])
	by orsmga002.jf.intel.com with ESMTP; 29 Feb 2016 08:50:30 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 08:50:28 -0800
Message-Id: <1456764628-34513-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] populate_sdk_ext: Delete the buildtools tar file after installation
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
X-List-Received-Date: Mon, 29 Feb 2016 16:50:29 -0000

When installing the ext sdk, buildtools is extracted and installed as
well. The tar file containing buildtools isn't used after installation
so was wasted space and clutter.

[YOCTO #9172]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 9e2fc61..f927cb9 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -313,6 +313,9 @@ sdk_ext_postinst() {
 	cd $target_sdk_dir
 	printf "buildtools\ny" | ./*buildtools-nativesdk-standalone* > /dev/null || ( printf 'ERROR: buildtools installation failed\n' ; exit 1 )
 
+	# Delete the buildtools tar file since it won't be used again
+	rm ./*buildtools-nativesdk-standalone*.sh -f
+
 	# Make sure when the user sets up the environment, they also get
 	# the buildtools-tarball tools in their path.
 	env_setup_script="$target_sdk_dir/environment-setup-${REAL_MULTIMACH_TARGET_SYS}"
-- 
2.5.0


