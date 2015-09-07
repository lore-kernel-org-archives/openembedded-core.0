Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0D16560132
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 12:42:45 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 07 Sep 2015 05:42:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,485,1437462000"; d="scan'208";a="556940036"
Received: from wmurray-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.6])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Sep 2015 05:42:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Sep 2015 13:42:20 +0100
Message-Id: <7db8751d2795a4e08866cd7996c4f94b4a1996f9.1441629547.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1441629547.git.paul.eggleton@linux.intel.com>
References: <cover.1441629547.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1441629547.git.paul.eggleton@linux.intel.com>
References: <cover.1441629547.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/11] classes/populate_sdk_ext: avoid poky-specific buildtools naming
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
X-List-Received-Date: Mon, 07 Sep 2015 12:42:45 -0000

Only poky sets SDK_NAME to include ${IMAGE_BASENAME} (i.e. ${PN}), so we
can't assume the buildtools filename will include it here. Change it to
look for a file with "buildtools-nativesdk-standalone" in the name
(the buildtools-tarball recipe itself sets TOOLCHAIN_OUTPUTNAME to
include this.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index a36bf16..8509f0c 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -189,7 +189,7 @@ SDK_PRE_INSTALL_COMMAND_task-populate-sdk-ext = "${sdk_ext_preinst}"
 sdk_ext_postinst() {
 	printf "\nExtracting buildtools...\n"
 	cd $target_sdk_dir
-	printf "buildtools\ny" | ./*buildtools-tarball* > /dev/null
+	printf "buildtools\ny" | ./*buildtools-nativesdk-standalone* > /dev/null
 
 	# Make sure when the user sets up the environment, they also get
 	# the buildtools-tarball tools in their path.
-- 
2.1.0


