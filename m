Return-Path: <nitin.a.kamble@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 170A06AFFE
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 19:22:14 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Aug 2013 12:22:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,914,1367996400"; d="scan'208";a="348522562"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by azsmga001.ch.intel.com with ESMTP; 19 Aug 2013 12:22:09 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Mon, 19 Aug 2013 19:22:19 +0000
Message-Id: <b8e848c82d5c361278328b0569509f6cc4f58d36.1376939912.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1376939912.git.nitin.a.kamble@intel.com>
References: <cover.1376939912.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] sanity.bbclass: a new check for required distro features
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
X-List-Received-Date: Mon, 19 Aug 2013 19:22:14 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Some BSPs need to have some specific distro_features enabled. These
BSPs fail to build when these required DISTRO features are not
enabled. And the issue is, there is no clue in the build error, about
why the build is failing.

  This commit addresses the issue by adding a generic mechanism to
check for enablement of the required distro features.

Now these BSPs can specify in their BSP config, what distro features
are required, and if these are not enabled then appropriate build
error is thrown to help fix the issue.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/sanity.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 4df3ca8..6f9ad5f 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -603,6 +603,13 @@ def check_sanity_everybuild(status, d):
         if not ( check_conf_exists("conf/distro/${DISTRO}.conf", d) or check_conf_exists("conf/distro/include/${DISTRO}.inc", d) ):
             status.addresult("DISTRO '%s' not found. Please set a valid DISTRO in your local.conf\n" % d.getVar("DISTRO", True))
 
+    # check all the required DISTRO_FEATURES are enabled
+    distro_features_split = (d.getVar('DISTRO_FEATURES', True) or "").split()
+    required_distro_features_split = (d.getVar('REQUIRED_DISTRO_FEATURES', True) or "").split()
+    for rdf in required_distro_features_split:
+        if rdf not in distro_features_split:
+            status.addresult("%s is required in DISTRO_FEATURES" % rdf)
+
     # Check that DL_DIR is set, exists and is writable. In theory, we should never even hit the check if DL_DIR isn't 
     # set, since so much relies on it being set.
     dldir = d.getVar('DL_DIR', True)
-- 
1.8.1.4


