Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9437D770F4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:17:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 06 Nov 2015 05:17:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="844167524"
Received: from bdiacone-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.207])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2015 05:17:12 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 13:17:00 +0000
Message-Id: <034009fed4e0ca40048f069841961690202c233f.1446815768.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1446815768.git.paul.eggleton@linux.intel.com>
References: <cover.1446815768.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1446815768.git.paul.eggleton@linux.intel.com>
References: <cover.1446815768.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] oe-selftest: add test for bitbake-layers show-recipes
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
X-List-Received-Date: Fri, 06 Nov 2015 13:17:13 -0000

Add a test for bitbake-layers show-recipes including the recently
added -i option.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/bblayers.py | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/lib/oeqa/selftest/bblayers.py b/meta/lib/oeqa/selftest/bblayers.py
index 20c17e4..5452925 100644
--- a/meta/lib/oeqa/selftest/bblayers.py
+++ b/meta/lib/oeqa/selftest/bblayers.py
@@ -60,3 +60,28 @@ class BitbakeLayers(oeSelfTest):
         result = runCmd('bitbake-layers remove-layer */meta-skeleton')
         result = runCmd('bitbake-layers show-layers')
         self.assertNotIn('meta-skeleton', result.output, msg = "meta-skeleton should have been removed at this step.  bitbake-layers show-layers output: %s" % result.output)
+
+    def test_bitbakelayers_showrecipes(self):
+        result = runCmd('bitbake-layers show-recipes')
+        self.assertIn('aspell:', result.output)
+        self.assertIn('mtd-utils:', result.output)
+        self.assertIn('linux-yocto:', result.output)
+        self.assertIn('core-image-minimal:', result.output)
+        result = runCmd('bitbake-layers show-recipes mtd-utils')
+        self.assertIn('mtd-utils:', result.output)
+        self.assertNotIn('aspell:', result.output)
+        result = runCmd('bitbake-layers show-recipes -i kernel')
+        self.assertIn('linux-yocto:', result.output)
+        self.assertNotIn('mtd-utils:', result.output)
+        result = runCmd('bitbake-layers show-recipes -i image')
+        self.assertIn('core-image-minimal', result.output)
+        self.assertNotIn('linux-yocto:', result.output)
+        self.assertNotIn('mtd-utils:', result.output)
+        result = runCmd('bitbake-layers show-recipes -i cmake,pkgconfig')
+        self.assertIn('libproxy:', result.output)
+        self.assertNotIn('mtd-utils:', result.output) # doesn't inherit either
+        self.assertNotIn('wget:', result.output) # doesn't inherit cmake
+        self.assertNotIn('waffle:', result.output) # doesn't inherit pkgconfig
+        result = runCmd('bitbake-layers show-recipes -i nonexistentclass', ignore_status=True)
+        self.assertNotEqual(result.status, 0, 'bitbake-layers show-recipes -i nonexistentclass should have failed')
+        self.assertIn('ERROR:', result.output)
-- 
2.1.0


