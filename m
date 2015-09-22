Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 521A373243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 11:30:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 04:30:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,572,1437462000"; d="scan'208";a="810354450"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 22 Sep 2015 04:30:29 -0700
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 89CAB6A4005;
	Tue, 22 Sep 2015 04:29:34 -0700 (PDT)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 14:31:50 +0300
Message-Id: <1442921510-7148-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] oeqa/selftest/archiver: Test that archiver filters on recipe name
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
X-List-Received-Date: Tue, 22 Sep 2015 11:30:30 -0000

[YOCTO #6929] this test validates the feature introduced in bug 6929

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/archiver.py | 50 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/archiver.py

diff --git a/meta/lib/oeqa/selftest/archiver.py b/meta/lib/oeqa/selftest/archiver.py
new file mode 100644
index 0000000..f2030c4
--- /dev/null
+++ b/meta/lib/oeqa/selftest/archiver.py
@@ -0,0 +1,50 @@
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import bitbake, get_bb_var
+from oeqa.utils.decorators import testcase
+import glob
+import os
+import shutil
+
+
+class Archiver(oeSelfTest):
+
+    @testcase(1345)
+    def test_archiver_allows_to_filter_on_recipe_name(self):
+        """
+        Summary:     The archiver should offer the possibility to filter on the recipe. (#6929)
+        Expected:    1. Included recipe (busybox) should be included
+                     2. Excluded recipe (zlib) should be excluded
+        Product:     oe-core
+        Author:      Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        """
+
+        include_recipe = 'busybox'
+        exclude_recipe = 'zlib'
+
+        features = 'INHERIT += "archiver"\n'
+        features += 'ARCHIVER_MODE[src] = "original"\n'
+        features += 'COPYLEFT_PN_INCLUDE = "%s"\n' % include_recipe
+        features += 'COPYLEFT_PN_EXCLUDE = "%s"\n' % exclude_recipe
+
+        # Update local.conf
+        self.write_config(features)
+
+        tmp_dir = get_bb_var('TMPDIR')
+        deploy_dir_src = get_bb_var('DEPLOY_DIR_SRC')
+        target_sys = get_bb_var('TARGET_SYS')
+        src_path = os.path.join(deploy_dir_src, target_sys)
+
+        # Delete tmp directory
+        shutil.rmtree(tmp_dir)
+
+        # Build core-image-minimal
+        bitbake('core-image-minimal')
+
+        # Check that include_recipe was included
+        is_included = len(glob.glob(src_path + '/%s*' % include_recipe))
+        self.assertEqual(1, is_included, 'Recipe %s was not included.' % include_recipe)
+
+        # Check that exclude_recipe was excluded
+        is_excluded = len(glob.glob(src_path + '/%s*' % exclude_recipe))
+        self.assertEqual(0, is_excluded, 'Recipe %s was not excluded.' % exclude_recipe)
-- 
2.1.0


