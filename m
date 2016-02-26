Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0A3D3607F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 14:37:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 26 Feb 2016 06:37:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="924525681"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 26 Feb 2016 06:37:11 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 9114C2C8002;
	Fri, 26 Feb 2016 07:24:59 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 16:40:51 +0200
Message-Id: <1456497651-23161-9-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1456497651-23161-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1456497651-23161-1-git-send-email-daniel.alexandrux.istrate@intel.com>
Subject: [PATCH 9/9] recipetests: buildrecipe: Test combinations of bbappend
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
X-List-Received-Date: Fri, 26 Feb 2016 14:37:46 -0000

Selectively use each combination of .bbappend files with the recipe;
All the combinations should not break the recipe build

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/recipetests/buildrecipe.py | 59 +++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/recipetests/buildrecipe.py b/meta/lib/oeqa/recipetests/buildrecipe.py
index c303b29..900d042 100644
--- a/meta/lib/oeqa/recipetests/buildrecipe.py
+++ b/meta/lib/oeqa/recipetests/buildrecipe.py
@@ -1,7 +1,9 @@
 from oeqa.recipetests.base import RecipeTests
 from oeqa.selftest.base import get_available_machines
-from oeqa.utils.commands import bitbake, get_tasks_for_recipe
+from oeqa.utils.commands import bitbake, get_tasks_for_recipe, get_bb_var, ftools, get_all_bbappends
 import logging
+import os
+import random
 
 
 class BuildRecipeTests(RecipeTests):
@@ -60,3 +62,58 @@ class BuildRecipeTests(RecipeTests):
             # Force task on recipe
             self.log.info('Forcing task %s' % task)
             bitbake('-C %s %s' % (task, self.testrecipe))
+
+    def test_combinations_of_bbappend(self):
+        """ Selectively use each combination of .bbappend files with the recipe """
+
+        test_recipe_pv = get_bb_var('PV', self.testrecipe)
+        recipe_append_file = self.testrecipe + '_' + test_recipe_pv + '.bbappend'
+
+        bbappend_msgs = {1: 'msg 1', 2: 'msg 2', 3: 'msg 3', 4: 'msg 4'}
+        bbappend_files = {}
+
+        # Install all bbappends for recipe
+        for i in bbappend_msgs:
+            recipe_append_dir = self.testrecipe + '_test_' + str(i)
+            recipe_append_path = os.path.join(self.testlayer_path, 'recipes-test', recipe_append_dir, recipe_append_file)
+            os.mkdir(os.path.join(self.testlayer_path, 'recipes-test', recipe_append_dir))
+            feature = 'SUMMARY += "%s"\n' % bbappend_msgs[i]
+            ftools.write_file(recipe_append_path, feature)
+            bbappend_files[i] = recipe_append_path
+
+        self.add_command_to_tearDown('rm -rf %s' % os.path.join(self.testlayer_path, 'recipes-test',
+                                                                self.testrecipe + '_test_*'))
+
+        test_recipe_bb = '%s_%s.bb' % (self.testrecipe, test_recipe_pv)
+        all_bbappends = get_all_bbappends()
+        self.log.info('All bbappends for recipe %s: %s' % (self.testrecipe, all_bbappends.get(test_recipe_bb)))
+
+        # Build recipe with all bbappends
+        bitbake(self.testrecipe)
+
+        # Mask two random bbappends (some times it might be the same one, which is ok)
+        for i in range(len(bbappend_files)):
+            choice1 = random.choice(bbappend_msgs.keys())
+            choice2 = random.choice(bbappend_msgs.keys())
+            mask1 = bbappend_files.get(choice1)
+            mask2 = bbappend_files.get(choice2)
+
+            feature = 'BBMASK = "%s"\n' % mask1
+            feature += 'BBMASK += "%s"\n' % mask2
+            self.write_config(feature)
+            self.log.info('Applied MASKs [%s, %s]' % (mask1, mask2))
+
+            # Make sure the masked bbappends don't show up
+            current_bbappends = get_all_bbappends()
+            self.log.info('Current bbappends for recipe %s: %s' % (self.testrecipe, current_bbappends.get(test_recipe_bb)))
+            self.assertNotIn(mask1, current_bbappends.get(test_recipe_bb))
+            self.assertNotIn(mask2, current_bbappends.get(test_recipe_bb))
+
+            # Make sure the summary was updated
+            current_summary = get_bb_var('SUMMARY', self.testrecipe)
+            self.log.info('Current summary: "%s"' % current_summary)
+            self.assertNotIn(bbappend_msgs.get(choice1), current_summary)
+            self.assertNotIn(bbappend_msgs.get(choice2), current_summary)
+
+            # Build recipe with custom bbappends
+            bitbake(self.testrecipe)
-- 
2.1.0


