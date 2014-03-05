Return-Path: <alexandrux.palalau@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id E0C326C716
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 08:24:34 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Mar 2014 00:24:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,591,1389772800"; d="scan'208";a="415807815"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 05 Mar 2014 00:24:34 -0800
Received: from localhost.localdomain (unknown [10.237.112.121])
	by linux.intel.com (Postfix) with ESMTP id F40EC6A4007;
	Wed,  5 Mar 2014 00:24:22 -0800 (PST)
From: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Mar 2014 10:28:47 +0200
Message-Id: <1394008127-27700-1-git-send-email-alexandrux.palalau@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] oe-selftest: add new test for image manifest file creation
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
X-List-Received-Date: Wed, 05 Mar 2014 08:24:37 -0000

Signed-off-by: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 01e0099..b78d2a7 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -74,6 +74,13 @@ class BitbakeTests(oeSelfTest):
         for f in ['pn-buildlist', 'pn-depends.dot', 'package-depends.dot', 'task-depends.dot']:
             os.remove(f)
 
+    def test_image_manifest(self):
+        bitbake('core-image-minimal')
+        deploydir = get_bb_var("DEPLOY_DIR_IMAGE", target="core-image-basic")
+        imagename = get_bb_var("IMAGE_LINK_NAME", target="core-image-basic")
+        manifest = os.path.join(deploydir, imagename + ".manifest")
+        self.assertTrue(os.path.islink(manifest), msg="No manifest file created for image")
+
     def test_invalid_recipe_src_uri(self):
         data = 'SRC_URI = "file://invalid"'
         self.write_recipeinc('man', data)
-- 
1.8.3.1


