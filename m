Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B06907319A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 03:19:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 21 Dec 2015 19:19:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="866907950"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2015 19:19:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 16:19:17 +1300
Message-Id: <8625ed5bc5e368e2409998d9fdf7565ab3cd3461.1450754300.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450754300.git.paul.eggleton@linux.intel.com>
References: <cover.1450754300.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450754300.git.paul.eggleton@linux.intel.com>
References: <cover.1450754300.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/5] classes/populate_sdk_ext: error out of install if buildtools install fails
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
X-List-Received-Date: Tue, 22 Dec 2015 03:19:50 -0000

If the installation of buildtools fails then we should fail the entire
installation instead of blindly continuing on.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index a824ca4..85bbaa5 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -219,7 +219,7 @@ SDK_PRE_INSTALL_COMMAND_task-populate-sdk-ext = "${sdk_ext_preinst}"
 sdk_ext_postinst() {
 	printf "\nExtracting buildtools...\n"
 	cd $target_sdk_dir
-	printf "buildtools\ny" | ./*buildtools-nativesdk-standalone* > /dev/null
+	printf "buildtools\ny" | ./*buildtools-nativesdk-standalone* > /dev/null || ( printf 'ERROR: buildtools installation failed\n' ; exit 1 )
 
 	# Make sure when the user sets up the environment, they also get
 	# the buildtools-tarball tools in their path.
-- 
2.5.0


