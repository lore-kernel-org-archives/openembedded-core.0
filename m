Return-Path: <costin.c.constantin@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DBF4375948
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 11:20:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Jul 2015 04:20:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,471,1432623600"; d="scan'208";a="764100096"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 14 Jul 2015 04:20:46 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 7245E6A4005;
	Tue, 14 Jul 2015 04:20:03 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 14:31:10 +0300
Message-Id: <1436873471-17794-2-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1436873471-17794-1-git-send-email-costin.c.constantin@intel.com>
References: <1436873471-17794-1-git-send-email-costin.c.constantin@intel.com>
Subject: [PATCH 2/3] oeqa/bblayers.py: add useful failure messages to all test cases
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
X-List-Received-Date: Tue, 14 Jul 2015 11:20:45 -0000

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/selftest/bblayers.py | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/bblayers.py b/meta/lib/oeqa/selftest/bblayers.py
index bf3dd1b..20c17e4 100644
--- a/meta/lib/oeqa/selftest/bblayers.py
+++ b/meta/lib/oeqa/selftest/bblayers.py
@@ -14,49 +14,49 @@ class BitbakeLayers(oeSelfTest):
     @testcase(756)
     def test_bitbakelayers_showcrossdepends(self):
         result = runCmd('bitbake-layers show-cross-depends')
-        self.assertTrue('aspell' in result.output)
+        self.assertTrue('aspell' in result.output, msg = "No dependencies were shown. bitbake-layers show-cross-depends output: %s" % result.output)
 
     @testcase(83)
     def test_bitbakelayers_showlayers(self):
         result = runCmd('bitbake-layers show-layers')
-        self.assertTrue('meta-selftest' in result.output)
+        self.assertTrue('meta-selftest' in result.output, msg = "No layers were shown. bitbake-layers show-layers output: %s" % result.output)
 
     @testcase(93)
     def test_bitbakelayers_showappends(self):
         result = runCmd('bitbake-layers show-appends')
-        self.assertTrue('xcursor-transparent-theme_0.1.1.bbappend' in result.output, msg='xcursor-transparent-theme_0.1.1.bbappend file was not recognised')
+        self.assertTrue('xcursor-transparent-theme_0.1.1.bbappend' in result.output, msg="xcursor-transparent-theme_0.1.1.bbappend file was not recognised.  bitbake-layers show-appends output: %s" % result.output)
 
     @testcase(90)
     def test_bitbakelayers_showoverlayed(self):
         result = runCmd('bitbake-layers show-overlayed')
-        self.assertTrue('aspell' in result.output, msg='aspell overlayed recipe was not recognised')
+        self.assertTrue('aspell' in result.output, msg="aspell overlayed recipe was not recognised bitbake-layers show-overlayed %s" % result.output)
 
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
+        self.assertTrue(find_in_contents, msg = "Flattening layers did not work. bitbake-layers flatten output: %s" % result.output)
 
     @testcase(1195)
     def test_bitbakelayers_add_remove(self):
         test_layer = os.path.join(get_bb_var('COREBASE'), 'meta-skeleton')
         result = runCmd('bitbake-layers show-layers')
-        self.assertNotIn('meta-skeleton', result.output, 'This test cannot run with meta-skeleton in bblayers.conf')
+        self.assertNotIn('meta-skeleton', result.output, "This test cannot run with meta-skeleton in bblayers.conf. bitbake-layers show-layers output: %s" % result.output)
         result = runCmd('bitbake-layers add-layer %s' % test_layer)
         result = runCmd('bitbake-layers show-layers')
-        self.assertIn('meta-skeleton', result.output)
+        self.assertIn('meta-skeleton', result.output, msg = "Something wrong happened. meta-skeleton layer was not added to conf/bblayers.conf.  bitbake-layers show-layers output: %s" % result.output)
         result = runCmd('bitbake-layers remove-layer %s' % test_layer)
         result = runCmd('bitbake-layers show-layers')
-        self.assertNotIn('meta-skeleton', result.output)
+        self.assertNotIn('meta-skeleton', result.output, msg = "meta-skeleton should have been removed at this step.  bitbake-layers show-layers output: %s" % result.output)
         result = runCmd('bitbake-layers add-layer %s' % test_layer)
         result = runCmd('bitbake-layers show-layers')
-        self.assertIn('meta-skeleton', result.output)
+        self.assertIn('meta-skeleton', result.output, msg = "Something wrong happened. meta-skeleton layer was not added to conf/bblayers.conf.  bitbake-layers show-layers output: %s" % result.output)
         result = runCmd('bitbake-layers remove-layer */meta-skeleton')
         result = runCmd('bitbake-layers show-layers')
-        self.assertNotIn('meta-skeleton', result.output)
+        self.assertNotIn('meta-skeleton', result.output, msg = "meta-skeleton should have been removed at this step.  bitbake-layers show-layers output: %s" % result.output)
-- 
2.1.4


