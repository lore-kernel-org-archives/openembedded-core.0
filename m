Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0D7546FF0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 18:40:03 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 10 Mar 2016 10:34:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,316,1455004800"; d="scan'208";a="63722052"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by fmsmga004.fm.intel.com with ESMTP; 10 Mar 2016 10:34:15 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2016 10:29:22 +0000
Message-Id: <1ad0075a191fdec19d07e4add011ea3da5320186.1457604105.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1457604105.git.mariano.lopez@linux.intel.com>
References: <cover.1457604105.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1457604105.git.mariano.lopez@linux.intel.com>
References: <cover.1457604105.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 2/2] selftest/bblayers.py: Remove harcoded recipe files
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
X-List-Received-Date: Thu, 10 Mar 2016 18:40:03 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Currently the recipe files are hardcoded and if the recipe
change the version, the test will fail.

This will change from using a harcoded file to look for the
file using bitbake-layers. Now, just the recipe name must
be specified.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/selftest/bblayers.py | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/bblayers.py b/meta/lib/oeqa/selftest/bblayers.py
index b88c25e..d23675e 100644
--- a/meta/lib/oeqa/selftest/bblayers.py
+++ b/meta/lib/oeqa/selftest/bblayers.py
@@ -23,8 +23,10 @@ class BitbakeLayers(oeSelfTest):
 
     @testcase(93)
     def test_bitbakelayers_showappends(self):
+        recipe = "xcursor-transparent-theme"
+        bb_file = self.get_recipe_basename(recipe)
         result = runCmd('bitbake-layers show-appends')
-        self.assertTrue('xcursor-transparent-theme_0.1.1.bbappend' in result.output, msg="xcursor-transparent-theme_0.1.1.bbappend file was not recognised.  bitbake-layers show-appends output: %s" % result.output)
+        self.assertTrue(bb_file in result.output, msg="%s file was not recognised. bitbake-layers show-appends output: %s" % (bb_file, result.output))
 
     @testcase(90)
     def test_bitbakelayers_showoverlayed(self):
@@ -33,11 +35,14 @@ class BitbakeLayers(oeSelfTest):
 
     @testcase(95)
     def test_bitbakelayers_flatten(self):
+        recipe = "xcursor-transparent-theme"
+        recipe_path = "recipes-graphics/xcursor-transparent-theme"
+        recipe_file = self.get_recipe_basename(recipe)
         testoutdir = os.path.join(self.builddir, 'test_bitbakelayers_flatten')
         self.assertFalse(os.path.isdir(testoutdir), msg = "test_bitbakelayers_flatten should not exist at this point in time")
         self.track_for_cleanup(testoutdir)
         result = runCmd('bitbake-layers flatten %s' % testoutdir)
-        bb_file = os.path.join(testoutdir, 'recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb')
+        bb_file = os.path.join(testoutdir, recipe_path, recipe_file)
         self.assertTrue(os.path.isfile(bb_file), msg = "Cannot find xcursor-transparent-theme_0.1.1.bb in the test_bitbakelayers_flatten local dir.")
         contents = ftools.read_file(bb_file)
         find_in_contents = re.search("##### bbappended from meta-selftest #####\n(.*\n)*include test_recipe.inc", contents)
@@ -86,3 +91,14 @@ class BitbakeLayers(oeSelfTest):
         result = runCmd('bitbake-layers show-recipes -i nonexistentclass', ignore_status=True)
         self.assertNotEqual(result.status, 0, 'bitbake-layers show-recipes -i nonexistentclass should have failed')
         self.assertIn('ERROR:', result.output)
+
+    def get_recipe_basename(self, recipe):
+        recipe_file = ""
+        result = runCmd("bitbake-layers show-recipes -f %s" % recipe)
+        for line in result.output.splitlines():
+            if recipe in line:
+                recipe_file = line
+                break
+
+        self.assertTrue(os.path.isfile(recipe_file), msg = "Can't find recipe file for %s" % recipe)
+        return os.path.basename(recipe_file)
-- 
2.6.2


