Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 59B26607F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 14:37:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Feb 2016 06:37:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="921762350"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 26 Feb 2016 06:37:10 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 13B396A4002;
	Fri, 26 Feb 2016 07:24:56 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 16:40:49 +0200
Message-Id: <1456497651-23161-7-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1456497651-23161-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1456497651-23161-1-git-send-email-daniel.alexandrux.istrate@intel.com>
Subject: [PATCH 7/9] recipetests: buildrecipe: Test suite for recipe tests
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
X-List-Received-Date: Fri, 26 Feb 2016 14:37:41 -0000

Includes tests for:
1. test build recipe for all major architectures
2. test rebuild recipe from sstate 1 (with sstate)
3. test_rebuild_recipe_from_sstate_2 (without sstate)
4. test cleaning operations on recipe
5. test force major tasks on recipe

fix for [YOCTO #6370]

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/recipetests/buildrecipe.py | 62 ++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 meta/lib/oeqa/recipetests/buildrecipe.py

diff --git a/meta/lib/oeqa/recipetests/buildrecipe.py b/meta/lib/oeqa/recipetests/buildrecipe.py
new file mode 100644
index 0000000..c303b29
--- /dev/null
+++ b/meta/lib/oeqa/recipetests/buildrecipe.py
@@ -0,0 +1,62 @@
+from oeqa.recipetests.base import RecipeTests
+from oeqa.selftest.base import get_available_machines
+from oeqa.utils.commands import bitbake, get_tasks_for_recipe
+import logging
+
+
+class BuildRecipeTests(RecipeTests):
+
+    log = logging.getLogger('test-recipe.build-recipe')
+
+    def test_build_recipe_for_all_major_architectures(self):
+        """ Build the recipe with all major architectures(qemux86, qemux86-64, qemuarm, qemuppc, qemumips) """
+
+        machines = get_available_machines()
+        qemu_machines = [m for m in machines if 'qemu' in m]
+
+        # Build the recipe for all major architectures
+        for m in qemu_machines:
+            self.log.info('Building recipe "%s" for architecture "%s"' % (self.testrecipe, m))
+            self.write_config('MACHINE = "%s"' % m)
+            bitbake(self.testrecipe)
+
+    def test_rebuild_recipe_from_sstate_1(self):
+        """ Rebuild the recipe from sstate with sstate file for the recipe """
+        bitbake(self.testrecipe)
+        bitbake('-c clean %s' % self.testrecipe)
+        bitbake(self.testrecipe)
+
+    def test_rebuild_recipe_from_sstate_2(self):
+        """ Rebuild the recipe from sstate without sstate file for the recipe """
+        bitbake(self.testrecipe)
+        bitbake('-c cleansstate %s' % self.testrecipe)
+        bitbake(self.testrecipe)
+
+    def test_cleaning_operations_on_recipe(self):
+        """ Perform cleaning operations on the recipe(cleansstate, clean, cleanall) """
+
+        clean_tasks = ['cleansstate', 'clean', 'cleanall']
+
+        for task in clean_tasks:
+            bitbake(self.testrecipe)
+            self.log.info('Performing %s for recipe %s' % (task, self.testrecipe))
+            bitbake('-c %s %s' % (task, self.testrecipe))
+
+    def test_force_major_tasks_on_recipe(self):
+        """ Force all major tasks on the recipe (bitbake -C <task> <recipe>) """
+        major_tasks = ['unpack', 'patch', 'configure', 'compile', 'install', 'populate_sysroot', 'package',
+                       'package_write_rpm', 'package_write_deb', 'package_write_ipk']
+
+        feature = 'PACKAGE_CLASSES = "package_rpm package_deb package_ipk"\n'
+        self.write_config(feature)
+
+        available_tasks = get_tasks_for_recipe(self.testrecipe)
+
+        for task in major_tasks:
+            # Check if task is available for recipe
+            if task not in available_tasks:
+                self.log.warning('Task %s not available for recipe %s' % (task, self.testrecipe))
+                continue
+            # Force task on recipe
+            self.log.info('Forcing task %s' % task)
+            bitbake('-C %s %s' % (task, self.testrecipe))
-- 
2.1.0


