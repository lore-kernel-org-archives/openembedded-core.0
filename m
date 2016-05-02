Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0E9E873211
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 00:13:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 01 May 2016 17:13:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,564,1455004800"; d="scan'208";a="944102390"
Received: from bitbang.jf.intel.com ([10.7.199.65])
	by orsmga001.jf.intel.com with ESMTP; 01 May 2016 17:13:06 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 May 2016 17:13:02 -0700
Message-Id: <da91071644c68352a20d84c83e831ce006640108.1462147930.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1462147930.git.randy.e.witt@linux.intel.com>
References: <cover.1462147930.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1462147930.git.randy.e.witt@linux.intel.com>
References: <cover.1462147930.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 1/2] populate_sdk_ext: Change lockedsigs task mismatch to a warning
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
X-List-Received-Date: Mon, 02 May 2016 00:13:11 -0000

It has been determined that it is highly likely that users might get
signatures that don't match in an extensible sdk. This doesn't
necessarily happen with oe-core, so we can set the mismatch to an error
during testing if we like.

However, for the case where users are creating their own sdks, we don't
need an error halting their progress. locked-sigs will still function as
it should.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 87518d1..935d4e5 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -221,7 +221,7 @@ python copy_buildsystem () {
 
             # Error if the sigs in the locked-signature file don't match
             # the sig computed from the metadata.
-            f.write('SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "error"\n\n')
+            f.write('SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "warn"\n\n')
 
             # Hide the config information from bitbake output (since it's fixed within the SDK)
             f.write('BUILDCFG_HEADER = ""\n')
-- 
2.5.5


