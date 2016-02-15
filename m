Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 080E2731F1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 13:44:22 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 15 Feb 2016 05:44:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,450,1449561600"; d="scan'208";a="652404927"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Feb 2016 05:44:23 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id B59E86A4004;
	Mon, 15 Feb 2016 06:32:12 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Feb 2016 15:48:01 +0200
Message-Id: <1455544081-1761-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] oeqa/selftest/signing: Added test for locked signatures
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
X-List-Received-Date: Mon, 15 Feb 2016 13:44:26 -0000

fix for [YOCTO #8706]

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/signing.py | 48 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
index c402e37..1e710e3 100644
--- a/meta/lib/oeqa/selftest/signing.py
+++ b/meta/lib/oeqa/selftest/signing.py
@@ -6,6 +6,7 @@ import re
 import shutil
 import tempfile
 from oeqa.utils.decorators import testcase
+from oeqa.utils.ftools import write_file
 
 
 class Signing(oeSelfTest):
@@ -130,3 +131,50 @@ class Signing(oeSelfTest):
         # gpg: Good signature from "testuser (nocomment) <testuser@email.com>"
         self.assertIn('gpg: Good signature from', ret.output, 'Package signed incorrectly.')
 
+
+class LockedSignatures(oeSelfTest):
+
+    @testcase(1420)
+    def test_locked_signatures(self):
+        """
+        Summary:     Test locked signature mechanism
+        Expected:    Locked signatures will prevent task to run
+        Product:     oe-core
+        Author:      Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        """
+
+        test_recipe = 'ed'
+        locked_sigs_file = 'locked-sigs.inc'
+
+        self.add_command_to_tearDown('rm -f %s' % os.path.join(self.builddir, locked_sigs_file))
+
+        bitbake(test_recipe)
+        # Generate locked sigs include file
+        bitbake('-S none %s' % test_recipe)
+
+        feature = 'require %s\n' % locked_sigs_file
+        feature += 'SIGGEN_LOCKEDSIGS_CHECK_LEVEL = "warn"\n'
+        self.write_config(feature)
+
+        # Build a locked recipe
+        bitbake(test_recipe)
+
+        # Make a change that should cause the locked task signature to change
+        recipe_append_file = test_recipe + '_' + get_bb_var('PV', test_recipe) + '.bbappend'
+        recipe_append_path = os.path.join(self.testlayer_path, 'recipes-test', test_recipe, recipe_append_file)
+        feature = 'SUMMARY += "test locked signature"\n'
+
+        os.mkdir(os.path.join(self.testlayer_path, 'recipes-test', test_recipe))
+        write_file(recipe_append_path, feature)
+
+        self.add_command_to_tearDown('rm -rf %s' % os.path.join(self.testlayer_path, 'recipes-test', test_recipe))
+
+        # Build the recipe again
+        ret = bitbake(test_recipe)
+
+        # Verify you get the warning and that the real task *isn't* run (i.e. the locked signature has worked)
+        patt = r'WARNING: The %s:do_package sig \S+ changed, use locked sig \S+ to instead' % test_recipe
+        found_warn = re.search(patt, ret.output)
+
+        self.assertIsNotNone(found_warn, "Didn't find the expected warning message. Output: %s" % ret.output)
-- 
2.1.0


