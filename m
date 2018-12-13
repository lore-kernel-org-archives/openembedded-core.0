Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id D35CE6093F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 03:47:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Dec 2018 19:47:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,347,1539673200"; d="scan'208";a="109138415"
Received: from weijianl-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.147.249])
	by fmsmga008.fm.intel.com with ESMTP; 12 Dec 2018 19:47:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Dec 2018 16:46:56 +1300
Message-Id: <6ad0d7e66f57564ec59475aeac55466b9e14d9b0.1544672785.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <cover.1544672785.git.paul.eggleton@linux.intel.com>
References: <cover.1544672785.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] oe-selftest: distrodata: change test_maintainers() to use tinfoil
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
X-List-Received-Date: Thu, 13 Dec 2018 03:47:11 -0000

Use tinfoil to enumerate recipes and get the value of RECIPE_MAINTAINER
to make it a bit more reliable in the face of do_checkpkg issues we are
currently seeing on the Yocto Project autobuilder. This also makes it a
little less painful to re-execute test_maintainers() since you don't
have to wait for bitbake -c checkpkg to complete every time.

Note that the new test has been written in such a way that it will still
function if RECIPE_MAINTAINER values are ever moved to the recipes.
Also, the test still currently fails as there are recipes that don't
have an assigned maintainer.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/distrodata.py | 81 +++++++++-------------
 1 file changed, 34 insertions(+), 47 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index e7b5e349564..a862d30b10e 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -6,15 +6,6 @@ from oeqa.core.decorator.oeid import OETestID
 
 class Distrodata(OESelftestTestCase):
 
-    @classmethod
-    def setUpClass(cls):
-        super(Distrodata, cls).setUpClass()
-        feature = 'INHERIT += "distrodata"\n'
-        feature += 'LICENSE_FLAGS_WHITELIST += " commercial"\n'
-
-        cls.write_config(cls, feature)
-        bitbake('-c checkpkg world')
-
     @OETestID(1902)
     def test_checkpkg(self):
         """
@@ -23,6 +14,11 @@ class Distrodata(OESelftestTestCase):
         Product:     oe-core
         Author:      Alexander Kanavin <alex.kanavin@gmail.com>
         """
+        feature = 'INHERIT += "distrodata"\n'
+        feature += 'LICENSE_FLAGS_WHITELIST += " commercial"\n'
+        self.write_config(feature)
+        bitbake('-c checkpkg world')
+
         checkpkg_result = open(os.path.join(get_bb_var("LOG_DIR"), "checkpkg.csv")).readlines()[1:]
         regressed_failures = [pkg_data[0] for pkg_data in [pkg_line.split('\t') for pkg_line in checkpkg_result] if pkg_data[11] == 'UNKNOWN_BROKEN']
         regressed_successes = [pkg_data[0] for pkg_data in [pkg_line.split('\t') for pkg_line in checkpkg_result] if pkg_data[11] == 'KNOWN_BROKEN']
@@ -55,45 +51,36 @@ but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please re
                      return True
             return False
 
-        def is_in_oe_core(recipe, recipes):
-            self.assertTrue(recipe in recipes.keys(), "Recipe %s was not in 'bitbake-layers show-recipes' output" %(recipe))
-            self.assertTrue(len(recipes[recipe]) > 0, "'bitbake-layers show-recipes' could not determine what layer(s) a recipe %s is in" %(recipe))
-            try:
-                recipes[recipe].index('meta')
-                return True
-            except ValueError:
-                return False
+        feature = 'require conf/distro/include/maintainers.inc\n'
+        self.write_config(feature)
 
-        def get_recipe_layers():
-            import re
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=False)
 
-            recipes = {}
-            recipe_regex = re.compile('^(?P<name>.*):$')
-            layer_regex = re.compile('^  (?P<name>\S*) +')
-            output = runCmd('bitbake-layers show-recipes').output
-            for line in output.split('\n'):
-                recipe_name_obj = recipe_regex.search(line)
-                if recipe_name_obj:
-                    recipe_name = recipe_name_obj.group('name')
-                    recipes[recipe_name] = []
-                recipe_layer_obj = layer_regex.search(line)
-                if recipe_layer_obj:
-                    layer_name = recipe_layer_obj.group('name')
-                    recipes[recipe_name].append(layer_name)
-            return recipes
+            with_maintainer_list = []
+            no_maintainer_list = []
+            # We could have used all_recipes() here, but this method will find
+            # every recipe if we ever move to setting RECIPE_MAINTAINER in recipe files
+            # instead of maintainers.inc
+            for fn in tinfoil.all_recipe_files(variants=False):
+                if not '/meta/recipes-' in fn:
+                    # We are only interested in OE-Core
+                    continue
+                rd = tinfoil.parse_recipe_file(fn, appends=False)
+                pn = rd.getVar('PN')
+                if is_exception(pn):
+                    continue
+                if rd.getVar('RECIPE_MAINTAINER'):
+                    with_maintainer_list.append((pn, fn))
+                else:
+                    no_maintainer_list.append((pn, fn))
 
-        checkpkg_result = open(os.path.join(get_bb_var("LOG_DIR"), "checkpkg.csv")).readlines()[1:]
-        recipes_layers = get_recipe_layers()
-        no_maintainer_list = [pkg_data[0] for pkg_data in [pkg_line.split('\t') for pkg_line in checkpkg_result] \
-            if pkg_data[14] == '' and is_in_oe_core(pkg_data[0], recipes_layers) and not is_exception(pkg_data[0])]
-        msg = """
-The following packages do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
-""" + "\n".join(no_maintainer_list)
-        self.assertTrue(len(no_maintainer_list) == 0, msg)
+        if no_maintainer_list:
+            self.fail("""
+The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
+""" + "\n".join(['%s (%s)' % i for i in no_maintainer_list]))
 
-        with_maintainer_list = [pkg_data[0] for pkg_data in [pkg_line.split('\t') for pkg_line in checkpkg_result] \
-            if pkg_data[14] != '' and is_in_oe_core(pkg_data[0], recipes_layers) and not is_exception(pkg_data[0])]
-        msg = """
-The list of oe-core packages with maintainers is empty. This may indicate that the test has regressed and needs fixing.
-"""
-        self.assertTrue(len(with_maintainer_list) > 0, msg)
+        if not with_maintainer_list:
+            self.fail("""
+The list of oe-core recipes with maintainers is empty. This may indicate that the test has regressed and needs fixing.
+""")
-- 
2.17.2


