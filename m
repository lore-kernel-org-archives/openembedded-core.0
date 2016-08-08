Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 34B1F771AC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:23:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Aug 2016 09:23:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="1037316013"
Received: from yocto-ab03.ostc.intel.com ([10.54.69.73])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2016 09:23:18 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 09:22:51 -0700
Message-Id: <2cd1c1e840d6a662829ef1f177c241e29209b83b.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
Subject: [PATCH 03/20] oeqa.selftest.bblayers: Split configuration from code
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
X-List-Received-Date: Mon, 08 Aug 2016 16:23:20 -0000

Improve oeqa-selftest capabilities and UX by placing
test configuration features and variables into a separate
configuration file.

[Yocto 9389]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/lib/oeqa/selftest/bblayers.py        | 125 ++++++++++++++++++++++--------
 meta/lib/oeqa/selftest/conf/bblayers.conf |  21 +++++
 2 files changed, 115 insertions(+), 31 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/conf/bblayers.conf

diff --git a/meta/lib/oeqa/selftest/bblayers.py b/meta/lib/oeqa/selftest/bblayers.py
index d23675e..49eb2e7 100644
--- a/meta/lib/oeqa/selftest/bblayers.py
+++ b/meta/lib/oeqa/selftest/bblayers.py
@@ -8,86 +8,149 @@ import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, get_bb_var
 from oeqa.utils.decorators import testcase
+from oeqa.utils.readconfig import conffile
 
 class BitbakeLayers(oeSelfTest):
 
+    @classmethod
+    def setUpClass(cls):
+        # Get test configurations from configuration file
+        cls.config = conffile(__file__)
+
     @testcase(756)
     def test_bitbakelayers_showcrossdepends(self):
         result = runCmd('bitbake-layers show-cross-depends')
-        self.assertTrue('aspell' in result.output, msg = "No dependencies were shown. bitbake-layers show-cross-depends output: %s" % result.output)
+        recipe = self.config.get('BitbakeLayers',
+                                 'bitbakelayers_showcrossdepends_recipe')
+        self.assertTrue(recipe in result.output, msg="No dependencies were \
+shown. bitbake-layers show-cross-depends output: %s" % result.output)
 
     @testcase(83)
     def test_bitbakelayers_showlayers(self):
         result = runCmd('bitbake-layers show-layers')
-        self.assertTrue('meta-selftest' in result.output, msg = "No layers were shown. bitbake-layers show-layers output: %s" % result.output)
+        layer = self.config.get('BitbakeLayers',
+                                'bitbakelayers_showlayers_layer')
+        self.assertTrue(layer in result.output, msg="No layers were shown. \
+bitbake-layers show-layers output: %s" % result.output)
 
     @testcase(93)
     def test_bitbakelayers_showappends(self):
-        recipe = "xcursor-transparent-theme"
+        recipe = self.config.get('BitbakeLayers',
+                                 'bitbakelayers_showappends_recipe')
         bb_file = self.get_recipe_basename(recipe)
         result = runCmd('bitbake-layers show-appends')
-        self.assertTrue(bb_file in result.output, msg="%s file was not recognised. bitbake-layers show-appends output: %s" % (bb_file, result.output))
+        self.assertTrue(bb_file in result.output, msg="%s file was not \
+recognised. bitbake-layers show-appends output: %s"
+                        % (bb_file, result.output))
 
     @testcase(90)
     def test_bitbakelayers_showoverlayed(self):
         result = runCmd('bitbake-layers show-overlayed')
-        self.assertTrue('aspell' in result.output, msg="aspell overlayed recipe was not recognised bitbake-layers show-overlayed %s" % result.output)
+        overlayed = self.config.get('BitbakeLayers',
+                                    'bitbakelayers_showoverlayed_recipe')
+        self.assertTrue(overlayed in result.output, msg="%s overlayed recipe \
+was not recognised bitbake-layers show-overlayed %s"
+                        % (overlayed, result.output))
 
     @testcase(95)
     def test_bitbakelayers_flatten(self):
-        recipe = "xcursor-transparent-theme"
-        recipe_path = "recipes-graphics/xcursor-transparent-theme"
+        recipe = self.config.get('BitbakeLayers',
+                                 'bitbakelayers_flatten_recipe')
+        recipe_path = os.path.join(self.config.get(
+                'BitbakeLayers', 'bitbakelayers_flatten_recipedir'), recipe)
         recipe_file = self.get_recipe_basename(recipe)
         testoutdir = os.path.join(self.builddir, 'test_bitbakelayers_flatten')
         self.assertFalse(os.path.isdir(testoutdir), msg = "test_bitbakelayers_flatten should not exist at this point in time")
         self.track_for_cleanup(testoutdir)
         result = runCmd('bitbake-layers flatten %s' % testoutdir)
         bb_file = os.path.join(testoutdir, recipe_path, recipe_file)
-        self.assertTrue(os.path.isfile(bb_file), msg = "Cannot find xcursor-transparent-theme_0.1.1.bb in the test_bitbakelayers_flatten local dir.")
+        self.assertTrue(os.path.isfile(bb_file), msg="Cannot find %s_0.1.1.bb \
+in the test_bitbakelayers_flatten local dir." % recipe)
         contents = ftools.read_file(bb_file)
         find_in_contents = re.search("##### bbappended from meta-selftest #####\n(.*\n)*include test_recipe.inc", contents)
         self.assertTrue(find_in_contents, msg = "Flattening layers did not work. bitbake-layers flatten output: %s" % result.output)
 
     @testcase(1195)
     def test_bitbakelayers_add_remove(self):
-        test_layer = os.path.join(get_bb_var('COREBASE'), 'meta-skeleton')
+        layer = self.config.get('BitbakeLayers',
+                                'bitbakelayers_add_remove_layer')
+        test_layer = os.path.join(get_bb_var('COREBASE'), layer)
         result = runCmd('bitbake-layers show-layers')
-        self.assertNotIn('meta-skeleton', result.output, "This test cannot run with meta-skeleton in bblayers.conf. bitbake-layers show-layers output: %s" % result.output)
+        self.assertNotIn(layer, result.output, "This test cannot run with %s \
+in bblayers.conf. bitbake-layers show-layers output: %s"
+                         % (layer, result.output))
         result = runCmd('bitbake-layers add-layer %s' % test_layer)
         result = runCmd('bitbake-layers show-layers')
-        self.assertIn('meta-skeleton', result.output, msg = "Something wrong happened. meta-skeleton layer was not added to conf/bblayers.conf.  bitbake-layers show-layers output: %s" % result.output)
+        self.assertIn(layer, result.output, msg="Something wrong happened. \
+%s layer was not added to conf/bblayers.conf.  bitbake-layers show-layers \
+output: %s" % (layer, result.output))
         result = runCmd('bitbake-layers remove-layer %s' % test_layer)
         result = runCmd('bitbake-layers show-layers')
-        self.assertNotIn('meta-skeleton', result.output, msg = "meta-skeleton should have been removed at this step.  bitbake-layers show-layers output: %s" % result.output)
+        self.assertNotIn(layer, result.output, msg="%s should have been \
+removed at this step. bitbake-layers show-layers output: %s"
+                         % (layer, result.output))
         result = runCmd('bitbake-layers add-layer %s' % test_layer)
         result = runCmd('bitbake-layers show-layers')
-        self.assertIn('meta-skeleton', result.output, msg = "Something wrong happened. meta-skeleton layer was not added to conf/bblayers.conf.  bitbake-layers show-layers output: %s" % result.output)
-        result = runCmd('bitbake-layers remove-layer */meta-skeleton')
+        self.assertIn(layer, result.output, msg="Something wrong happened. %s \
+layer was not added to conf/bblayers.conf. bitbake-layers show-layers output: \
+%s" % (layer, result.output))
+        result = runCmd('bitbake-layers remove-layer */%s' % layer)
         result = runCmd('bitbake-layers show-layers')
-        self.assertNotIn('meta-skeleton', result.output, msg = "meta-skeleton should have been removed at this step.  bitbake-layers show-layers output: %s" % result.output)
+        self.assertNotIn(layer, result.output, msg="%s should have been \
+removed at this step. bitbake-layers show-layers output: %s"
+                         % (layer, result.output))
 
     @testcase(1384)
     def test_bitbakelayers_showrecipes(self):
+        recipe1 = self.config.get(
+                'BitbakeLayers', 'bitbakelayers_showrecipes_recipe1')
+        recipe2 = self.config.get(
+                'BitbakeLayers', 'bitbakelayers_showrecipes_recipe2')
+        recipe3 = self.config.get(
+                'BitbakeLayers', 'bitbakelayers_showrecipes_recipe3')
+        recipe4 = self.config.get(
+                'BitbakeLayers', 'bitbakelayers_showrecipes_recipe4')
+        inkernel = self.config.get(
+                 'BitbakeLayers', 'bitbakelayers_showrecipes_inkernel')
+        nokernel = self.config.get(
+                 'BitbakeLayers', 'bitbakelayers_showrecipes_nokernel')
+        inimage = self.config.get(
+                'BitbakeLayers', 'bitbakelayers_showrecipes_inimage')
+        noimage1 = self.config.get(
+                 'BitbakeLayers', 'bitbakelayers_showrecipes_noimage1')
+        noimage2 = self.config.get(
+                 'BitbakeLayers', 'bitbakelayers_showrecipes_noimage2')
+        incmakepkgconfig = self.config.get(
+                'BitbakeLayers', 'bitbakelayers_showrecipes_incmakepkgconfig')
+        nocmakepkgconfig1 = self.config.get(
+                'BitbakeLayers', 'bitbakelayers_showrecipes_nocmakepkgconfig1')
+        nocmakepkgconfig2 = self.config.get(
+                'BitbakeLayers', 'bitbakelayers_showrecipes_nocmakepkgconfig2')
+        nocmakepkgconfig3 = self.config.get(
+                'BitbakeLayers', 'bitbakelayers_showrecipes_nocmakepkgconfig3')
         result = runCmd('bitbake-layers show-recipes')
-        self.assertIn('aspell:', result.output)
-        self.assertIn('mtd-utils:', result.output)
-        self.assertIn('linux-yocto:', result.output)
-        self.assertIn('core-image-minimal:', result.output)
-        result = runCmd('bitbake-layers show-recipes mtd-utils')
-        self.assertIn('mtd-utils:', result.output)
-        self.assertNotIn('aspell:', result.output)
+        self.assertIn("%s:" % recipe1, result.output)
+        self.assertIn("%s:" % recipe2, result.output)
+        self.assertIn("%s:" % recipe3, result.output)
+        self.assertIn("%s:" % recipe4, result.output)
+        result = runCmd('bitbake-layers show-recipes %s' % recipe2)
+        self.assertIn('%s:' % recipe2, result.output)
+        self.assertNotIn('%s:' % recipe1, result.output)
         result = runCmd('bitbake-layers show-recipes -i kernel')
-        self.assertIn('linux-yocto:', result.output)
-        self.assertNotIn('mtd-utils:', result.output)
+        self.assertIn('%s:' % inkernel, result.output)
+        self.assertNotIn('%s:' % nokernel, result.output)
         result = runCmd('bitbake-layers show-recipes -i image')
-        self.assertIn('core-image-minimal', result.output)
-        self.assertNotIn('linux-yocto:', result.output)
-        self.assertNotIn('mtd-utils:', result.output)
+        self.assertIn(inimage, result.output)
+        self.assertNotIn('%s:' % noimage2, result.output)
+        self.assertNotIn('%s:' % noimage1, result.output)
         result = runCmd('bitbake-layers show-recipes -i cmake,pkgconfig')
-        self.assertIn('libproxy:', result.output)
-        self.assertNotIn('mtd-utils:', result.output) # doesn't inherit either
-        self.assertNotIn('wget:', result.output) # doesn't inherit cmake
-        self.assertNotIn('waffle:', result.output) # doesn't inherit pkgconfig
+        self.assertIn('%s:' % incmakepkgconfig, result.output)
+        # doesn't inherit either:
+        self.assertNotIn('%s:' % nocmakepkgconfig1, result.output)
+        # doesn't inherit cmake:
+        self.assertNotIn('%s:' % nocmakepkgconfig2, result.output)
+        # doesn't inherit pkgconfig
+        self.assertNotIn('%s:' % nocmakepkgconfig3, result.output)
         result = runCmd('bitbake-layers show-recipes -i nonexistentclass', ignore_status=True)
         self.assertNotEqual(result.status, 0, 'bitbake-layers show-recipes -i nonexistentclass should have failed')
         self.assertIn('ERROR:', result.output)
diff --git a/meta/lib/oeqa/selftest/conf/bblayers.conf b/meta/lib/oeqa/selftest/conf/bblayers.conf
new file mode 100644
index 0000000..db6160b
--- /dev/null
+++ b/meta/lib/oeqa/selftest/conf/bblayers.conf
@@ -0,0 +1,21 @@
+[BitbakeLayers]
+bitbakelayers_showcrossdepends_recipe = aspell 
+bitbakelayers_showlayers_layer = meta-selftest
+bitbakelayers_showappends_recipe = xcursor-transparent-theme
+bitbakelayers_showoverlayed_recipe = aspell
+bitbakelayers_flatten_recipe = xcursor-transparent-theme
+bitbakelayers_flatten_recipedir = recipes-graphics
+bitbakelayers_add_remove_layer = meta-skeleton
+bitbakelayers_showrecipes_recipe1 = aspell
+bitbakelayers_showrecipes_recipe2 = mtd-utils
+bitbakelayers_showrecipes_recipe3 = linux-yocto
+bitbakelayers_showrecipes_recipe4 = core-image-minimal
+bitbakelayers_showrecipes_inkernel = linux-yocto
+bitbakelayers_showrecipes_nokernel = mtd-utils
+bitbakelayers_showrecipes_inimage = core-image-minimal
+bitbakelayers_showrecipes_noimage1 = mtd-utils
+bitbakelayers_showrecipes_noimage2 = linux-yocto
+bitbakelayers_showrecipes_incmakepkgconfig = libproxy
+bitbakelayers_showrecipes_nocmakepkgconfig1 = mtd-utils
+bitbakelayers_showrecipes_nocmakepkgconfig2 = wget
+bitbakelayers_showrecipes_nocmakepkgconfig3 = waffle
-- 
1.8.3.1


