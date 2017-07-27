Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E223E78313
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 20:14:54 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jul 2017 13:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,421,1496127600"; d="scan'208";a="130301922"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 27 Jul 2017 13:14:48 -0700
Received: from localhost.zpn.intel.com (unknown [10.219.4.140])
	by linux.intel.com (Postfix) with ESMTP id 4CB3F5809DF;
	Thu, 27 Jul 2017 13:14:48 -0700 (PDT)
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jul 2017 15:18:08 -0500
Message-Id: <b042029a217b541e652776a7117a35c70c81f4e3.1501186507.git.humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.7.5
In-Reply-To: <cover.1501186507.git.humberto.ibarra.lopez@intel.com>
References: <cover.1501186507.git.humberto.ibarra.lopez@intel.com>
Subject: [PATCH 1/1] multiconfig.py: added testsuite for multiconfig
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
X-List-Received-Date: Thu, 27 Jul 2017 20:14:55 -0000

Multiconfig was not being tested at all. This adds a few basic
tests for multiconfig, including globbing.

[Yocto #11612]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 meta/lib/oeqa/selftest/cases/multiconfig.py | 100 ++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/multiconfig.py

diff --git a/meta/lib/oeqa/selftest/cases/multiconfig.py b/meta/lib/oeqa/selftest/cases/multiconfig.py
new file mode 100644
index 0000000..67051b7
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/multiconfig.py
@@ -0,0 +1,100 @@
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_vars
+import os
+import shutil
+import glob
+
+
+class MulticonfigTests(OESelftestTestCase):
+
+    def setUpLocal(self):
+        self.bbvars = get_bb_vars(['TOPDIR', 'DEPLOY_DIR', 'MACHINE'])
+
+        self.machines = ['qemux86', 'qemuarm', 'qemumips']
+        self.recipes = ['core-image-minimal', 'core-image-sato', \
+                'core-image-minimal-dev']
+        self.test_recipe = 'core-image-sato'
+
+        self.conf_cmds = ["multiconfig:config%s:%s" % (x, self.recipes[x]) \
+                for x in range(3)]
+
+        self.mconf = os.path.join(self.bbvars['TOPDIR'], 'conf', 'multiconfig')
+        os.mkdir(self.mconf)
+        for n in range(3):
+            conf_file = os.path.join(self.mconf, 'config%s.conf' % n)
+            with open(conf_file, 'w') as f:
+                f.write('MACHINE = "%s"\n' % self.machines[n])
+        features = 'BBMULTICONFIG = "%s"' % " ".join(["config%s" % x \
+                for x in range(3)])
+        self.write_config(features)
+
+    def tearDownLocal(self):
+        shutil.rmtree(self.mconf)
+
+    def check_recipe(self, machine, recipe, unique=True):
+        built_tar = "%s-%s.tar.bz2" % (recipe, machine)
+        recipe_paths = glob.iglob(os.path.join(self.bbvars['DEPLOY_DIR'], \
+                    'images', '**', "%s-*.tar.bz2" % recipe))
+        recipe_tars = [os.path.basename(x) for x in recipe_paths]
+        hyphen_c = recipe.count('-') + machine.count('-') + 1
+        recipe_tars = [ x for x in recipe_tars if x.count('.') == 2 \
+                    and x.count('-') == hyphen_c]
+
+        self.assertLess(0,len(recipe_tars),"Recipe %s was not built for %s"\
+                    % (recipe, machine))
+        self.assertEqual(True, built_tar in recipe_tars, "Wrong machine was " \
+                    " built, expected %s." % machine)
+        if unique:
+            self.assertLess(len(recipe_tars), 2, "Recipe %s was built " \
+                "for machines other than %s" % (recipe, machine))
+
+    def clean_builds(self):
+        bitbake('-c clean %s' % " ".join(self.conf_cmds))
+        bitbake('-c clean %s' % " ".join(self.recipes))
+        bitbake('-c clean multiconfig:*:%s' % self.test_recipe)
+
+    def test_different_configs(self):
+        """
+        Summary: Check multiconfig using 2 diferent machines
+        Expected: 1. All recipes can be build using the right conf
+                  2. Recipes aren't build for more confs than intended
+        Product: oe-core
+        Author: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
+        """
+        self.clean_builds()
+        bitbake(" ".join(self.conf_cmds))
+
+        # Check that proper builds were done and only for the required recipes
+        for x in range(3):
+            self.check_recipe(self.machines[x], self.recipes[x])
+
+    def test_general_recipe(self):
+        """
+        Summary: Check multiconfig and a general recipe at the same time
+        Expected: 1. The multiconfig recipe can be build
+                  2. The other recipe can be build for the machine in local.conf
+        Product: oe-core
+        Author: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
+        """
+        self.clean_builds()
+        bitbake('%s %s' % (self.conf_cmds[0], self.test_recipe))
+
+        # Check that recipe[0] was only built for config0
+        self.check_recipe(self.machines[0], self.recipes[0])
+
+        # Check that core-image-sato was built for general config
+        self.check_recipe(self.bbvars['MACHINE'], self.test_recipe)
+
+    def test_multiconfig_globbing(self):
+        """
+        Summary: Check multiconfig globbing
+        Expected: 1. The globbing feature works for multiconfig
+        Product: oe-core
+        Author: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
+        """
+        self.clean_builds()
+        bitbake('multiconfig:*:%s' % self.test_recipe)
+
+        # Check that recipe was built for all configs
+        for machine in self.machines:
+            self.check_recipe(machine, self.test_recipe, False)
-- 
2.7.5


