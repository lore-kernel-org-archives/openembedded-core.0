Return-Path: <costin.c.constantin@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 333EF607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 11:05:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 10 Jul 2015 04:05:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,446,1432623600"; d="scan'208";a="744386969"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 10 Jul 2015 04:05:27 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 10F0E6A4005;
	Fri, 10 Jul 2015 04:04:46 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jul 2015 14:15:46 +0300
Message-Id: <1436526946-30395-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/bblayers.py: Show useful failure msg. for all test cases
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
X-List-Received-Date: Fri, 10 Jul 2015 11:05:28 -0000

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/selftest/bblayers.py | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/bblayers.py b/meta/lib/oeqa/selftest/bblayers.py
index bf3dd1b..6a9c097 100644
--- a/meta/lib/oeqa/selftest/bblayers.py
+++ b/meta/lib/oeqa/selftest/bblayers.py
@@ -14,12 +14,12 @@ class BitbakeLayers(oeSelfTest):
     @testcase(756)
     def test_bitbakelayers_showcrossdepends(self):
         result = runCmd('bitbake-layers show-cross-depends')
-        self.assertTrue('aspell' in result.output)
+        self.assertTrue('aspell' in result.output, msg = "No dependencies were shown. To debug, please manually run \"bitbake-layers show-cross-depends\"")
 
     @testcase(83)
     def test_bitbakelayers_showlayers(self):
         result = runCmd('bitbake-layers show-layers')
-        self.assertTrue('meta-selftest' in result.output)
+        self.assertTrue('meta-selftest' in result.output, msg = "No layers were shown. Please check your conf/bblayers.conf and run \"bitbake-layers show-layers\"")
 
     @testcase(93)
     def test_bitbakelayers_showappends(self):
@@ -34,14 +34,14 @@ class BitbakeLayers(oeSelfTest):
     @testcase(95)
     def test_bitbakelayers_flatten(self):
         testoutdir = os.path.join(self.builddir, 'test_bitbakelayers_flatten')
-        self.assertFalse(os.path.isdir(testoutdir))
+        self.assertFalse(os.path.isdir(testoutdir), msg = "test_bitbakelayers_flatten should not exist at this point in time")
         self.track_for_cleanup(testoutdir)
         result = runCmd('bitbake-layers flatten %s' % testoutdir)
         bb_file = os.path.join(testoutdir, 'recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb')
-        self.assertTrue(os.path.isfile(bb_file))
+        self.assertTrue(os.path.isfile(bb_file), msg = "Cannot find xcursor-transparent-theme_0.1.1.bb in the test_bitbakelayers_flatten local dir.")
         contents = ftools.read_file(bb_file)
         find_in_contents = re.search("##### bbappended from meta-selftest #####\n(.*\n)*include test_recipe.inc", contents)
-        self.assertTrue(find_in_contents)
+        self.assertTrue(find_in_contents, msg = "Flattening layers did not work.")
 
     @testcase(1195)
     def test_bitbakelayers_add_remove(self):
@@ -50,13 +50,13 @@ class BitbakeLayers(oeSelfTest):
         self.assertNotIn('meta-skeleton', result.output, 'This test cannot run with meta-skeleton in bblayers.conf')
         result = runCmd('bitbake-layers add-layer %s' % test_layer)
         result = runCmd('bitbake-layers show-layers')
-        self.assertIn('meta-skeleton', result.output)
+        self.assertIn('meta-skeleton', result.output, msg = "Something wrong happened. meta-skeleton layer was not added to conf/bblayers.conf")
         result = runCmd('bitbake-layers remove-layer %s' % test_layer)
         result = runCmd('bitbake-layers show-layers')
-        self.assertNotIn('meta-skeleton', result.output)
+        self.assertNotIn('meta-skeleton', result.output, msg = "meta-skeleton should have been removed at this step.")
         result = runCmd('bitbake-layers add-layer %s' % test_layer)
         result = runCmd('bitbake-layers show-layers')
-        self.assertIn('meta-skeleton', result.output)
+        self.assertIn('meta-skeleton', result.output, msg = "Something wrong happened. meta-skeleton layer was not added to conf/bblayers.conf")
         result = runCmd('bitbake-layers remove-layer */meta-skeleton')
         result = runCmd('bitbake-layers show-layers')
-        self.assertNotIn('meta-skeleton', result.output)
+        self.assertNotIn('meta-skeleton', result.output, msg = "meta-skeleton should have been removed at this step.")
-- 
2.1.4


