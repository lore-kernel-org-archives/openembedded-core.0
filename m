Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EF3C7780B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 11:11:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 03:11:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,501,1511856000"; d="scan'208";a="17464978"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 12 Feb 2018 03:11:47 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Feb 2018 13:05:21 +0200
Message-Id: <20180212110521.16974-10-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180212110521.16974-1-alexander.kanavin@linux.intel.com>
References: <20180212110521.16974-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/10] oe-selftest: add a test for recipes without maintainers
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
X-List-Received-Date: Mon, 12 Feb 2018 11:11:47 -0000

'bitbake -c checkpkg world' is moved to class initializer to avoid
it being run twice in a row.

The no-maintainers test checks only oe-core recipes, as other layers
may be be configured, and assigning maintainership to specific people via
maintainers.inc is known to be used only in oe-core.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/distrodata.py | 67 +++++++++++++++++++++++++++---
 1 file changed, 62 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index 12540adc7d8..7b2800464cb 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -9,6 +9,11 @@ class Distrodata(OESelftestTestCase):
     @classmethod
     def setUpClass(cls):
         super(Distrodata, cls).setUpClass()
+        feature = 'INHERIT += "distrodata"\n'
+        feature += 'LICENSE_FLAGS_WHITELIST += " commercial"\n'
+
+        cls.write_config(cls, feature)
+        bitbake('-c checkpkg world')
 
     @OETestID(1902)
     def test_checkpkg(self):
@@ -18,11 +23,6 @@ class Distrodata(OESelftestTestCase):
         Product:     oe-core
         Author:      Alexander Kanavin <alexander.kanavin@intel.com>
         """
-        feature = 'INHERIT += "distrodata"\n'
-        feature += 'LICENSE_FLAGS_WHITELIST += " commercial"\n'
-
-        self.write_config(feature)
-        bitbake('-c checkpkg world')
         checkpkg_result = open(os.path.join(get_bb_var("LOG_DIR"), "checkpkg.csv")).readlines()[1:]
         regressed_failures = [pkg_data[0] for pkg_data in [pkg_line.split('\t') for pkg_line in checkpkg_result] if pkg_data[11] == 'UNKNOWN_BROKEN']
         regressed_successes = [pkg_data[0] for pkg_data in [pkg_line.split('\t') for pkg_line in checkpkg_result] if pkg_data[11] == 'KNOWN_BROKEN']
@@ -40,3 +40,60 @@ The following packages have been checked successfully for upstream versions,
 but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please remove that line from the recipes.
 """ + "\n".join(regressed_successes)
         self.assertTrue(len(regressed_failures) == 0 and len(regressed_successes) == 0, msg)
+
+    def test_maintainers(self):
+        """
+        Summary:     Test that oe-core recipes have a maintainer
+        Expected:    All oe-core recipes (except a few special static/testing ones) should have a maintainer listed in maintainers.inc file.
+        Product:     oe-core
+        Author:      Alexander Kanavin <alexander.kanavin@intel.com>
+        """
+        def is_exception(pkg):
+            exceptions = ["packagegroup-", "initramfs-", "systemd-machine-units", "target-sdk-provides-dummy"]
+            for i in exceptions:
+                 if i in pkg:
+                     return True
+            return False
+
+        def is_in_oe_core(recipe, recipes):
+            self.assertTrue(recipe in recipes.keys(), "Recipe %s was not in 'bitbake-layers show-recipes' output" %(recipe))
+            self.assertTrue(len(recipes[recipe]) > 0, "'bitbake-layers show-recipes' could not determine what layer(s) a recipe %s is in" %(recipe))
+            try:
+                recipes[recipe].index('meta')
+                return True
+            except ValueError:
+                return False
+
+        def get_recipe_layers():
+            import re
+
+            recipes = {}
+            recipe_regex = re.compile('^(?P<name>.*):$')
+            layer_regex = re.compile('^  (?P<name>\S*) +')
+            output = runCmd('bitbake-layers show-recipes').output
+            for line in output.split('\n'):
+                recipe_name_obj = recipe_regex.search(line)
+                if recipe_name_obj:
+                    recipe_name = recipe_name_obj.group('name')
+                    recipes[recipe_name] = []
+                recipe_layer_obj = layer_regex.search(line)
+                if recipe_layer_obj:
+                    layer_name = recipe_layer_obj.group('name')
+                    recipes[recipe_name].append(layer_name)
+            return recipes
+
+        checkpkg_result = open(os.path.join(get_bb_var("LOG_DIR"), "checkpkg.csv")).readlines()[1:]
+        recipes_layers = get_recipe_layers()
+        no_maintainer_list = [pkg_data[0] for pkg_data in [pkg_line.split('\t') for pkg_line in checkpkg_result] \
+            if pkg_data[14] == '' and is_in_oe_core(pkg_data[0], recipes_layers) and not is_exception(pkg_data[0])]
+        msg = """
+The following packages do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
+""" + "\n".join(no_maintainer_list)
+        self.assertTrue(len(no_maintainer_list) == 0, msg)
+
+        with_maintainer_list = [pkg_data[0] for pkg_data in [pkg_line.split('\t') for pkg_line in checkpkg_result] \
+            if pkg_data[14] != '' and is_in_oe_core(pkg_data[0], recipes_layers) and not is_exception(pkg_data[0])]
+        msg = """
+The list of oe-core packages with maintainers is empty. This may indicate that the test has regressed and needs fixing.
+"""
+        self.assertTrue(len(with_maintainer_list) > 0, msg)
-- 
2.15.1


