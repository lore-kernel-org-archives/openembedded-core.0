Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0867E771D1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 10:14:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 19 Feb 2016 02:14:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,470,1449561600"; d="scan'208";a="906715706"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2016 02:14:13 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 7017D6A4002;
	Fri, 19 Feb 2016 03:02:02 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 12:17:54 +0200
Message-Id: <1455877074-27544-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] oeqa/selftest/bbtests: Test bbappend order
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
X-List-Received-Date: Fri, 19 Feb 2016 10:14:13 -0000

BitBake should append to recipe in a predictable order.

fix for [YOCTO #9145]
test for [YOCTO #9138]

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 70e5b29..26728a4 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -247,3 +247,26 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         for task in tasks:
             self.assertIn('_setscene', task, 'A task different from _setscene ran: %s.\n'
                                              'Executed tasks were: %s' % (task, str(tasks)))
+
+    @testcase(1425)
+    def test_bbappend_order(self):
+        """ Bitbake should bbappend to recipe in a predictable order """
+        test_recipe = 'ed'
+        test_recipe_summary_before = get_bb_var('SUMMARY', test_recipe)
+        test_recipe_pv = get_bb_var('PV', test_recipe)
+        recipe_append_file = test_recipe + '_' + test_recipe_pv + '.bbappend'
+        expected_recipe_summary = test_recipe_summary_before
+
+        for i in range(5):
+            recipe_append_dir = test_recipe + '_test_' + str(i)
+            recipe_append_path = os.path.join(self.testlayer_path, 'recipes-test', recipe_append_dir, recipe_append_file)
+            os.mkdir(os.path.join(self.testlayer_path, 'recipes-test', recipe_append_dir))
+            feature = 'SUMMARY += "%s"\n' % i
+            ftools.write_file(recipe_append_path, feature)
+            expected_recipe_summary += ' %s' % i
+
+        self.add_command_to_tearDown('rm -rf %s' % os.path.join(self.testlayer_path, 'recipes-test',
+                                                               test_recipe + '_test_*'))
+
+        test_recipe_summary_after = get_bb_var('SUMMARY', test_recipe)
+        self.assertEqual(expected_recipe_summary, test_recipe_summary_after)
-- 
2.1.0


