Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A88DF6E569
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 10:38:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Dec 2013 02:38:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,501,1384329600"; d="scan'208";a="451292623"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2013 02:38:14 -0800
Received: from localhost.localdomain (unknown [10.237.112.161])
	by linux.intel.com (Postfix) with ESMTP id E6E186A4092;
	Tue, 17 Dec 2013 02:38:11 -0800 (PST)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Dec 2013 12:49:28 +0100
Message-Id: <1387280969-4066-2-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1387280969-4066-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1387280969-4066-1-git-send-email-corneliux.stoicescu@intel.com>
Subject: [PATCH V2 2/3] oe-selftest: New test module for OE scripts.
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
X-List-Received-Date: Tue, 17 Dec 2013 10:38:21 -0000

Added a new module meta/lib/oeqa/selftest/oescripts.py containing tests
for scripts from ${COREBASE}/scripts

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/selftest/oescripts.py |   60 +++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/oescripts.py

diff --git a/meta/lib/oeqa/selftest/oescripts.py b/meta/lib/oeqa/selftest/oescripts.py
new file mode 100644
index 0000000..4aab2ed
--- /dev/null
+++ b/meta/lib/oeqa/selftest/oescripts.py
@@ -0,0 +1,60 @@
+import datetime
+import unittest
+import os
+import re
+import shutil
+
+import oeqa.utils.ftools as ftools
+from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.buildhistory import BuildhistoryBase
+from oeqa.utils.commands import Command, runCmd, bitbake, get_bb_var, get_test_layer
+
+class TestScripts(oeSelfTest):
+
+    def test_cleanup_workdir(self):
+        path = os.path.dirname(get_bb_var('WORKDIR', 'gzip'))
+        old_version_recipe = os.path.join(get_bb_var('COREBASE'), 'meta/recipes-extended/gzip/gzip_1.3.12.bb')
+        old_version = '1.3.12'
+        bitbake("-ccleansstate gzip")
+        bitbake("-ccleansstate -b %s" % old_version_recipe)
+        if os.path.exists(get_bb_var('WORKDIR', "-b %s" % old_version_recipe)):
+            shutil.rmtree(get_bb_var('WORKDIR', "-b %s" % old_version_recipe))
+        if os.path.exists(get_bb_var('WORKDIR', 'gzip')):
+            shutil.rmtree(get_bb_var('WORKDIR', 'gzip'))
+
+        if os.path.exists(path):
+            initial_contents = os.listdir(path)
+        else:
+            initial_contents = []
+
+        bitbake('gzip')
+        intermediary_contents = os.listdir(path)
+        bitbake("-b %s" % old_version_recipe)
+        runCmd('cleanup-workdir')
+        remaining_contents = os.listdir(path)
+
+        expected_contents = [x for x in intermediary_contents if x not in initial_contents]
+        remaining_not_expected = [x for x in remaining_contents if x not in expected_contents]
+        self.assertFalse(remaining_not_expected, msg="Not all necessary content has been deleted from %s: %s" % (path, ', '.join(map(str, remaining_not_expected))))
+        expected_not_remaining = [x for x in expected_contents if x not in remaining_contents]
+        self.assertFalse(expected_not_remaining, msg="The script removed extra contents from %s: %s" % (path, ', '.join(map(str, expected_not_remaining))))
+
+class BuildhistoryDiffTests(BuildhistoryBase):
+
+    def test_buildhistory_diff(self):
+        self.add_command_to_tearDown('cleanup-workdir')
+        target = 'xcursor-transparent-theme'
+        self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
+        self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True)
+        result = runCmd("buildhistory-diff -p %s" % get_bb_var('BUILDHISTORY_DIR'))
+        expected_output = 'PR changed from "r1" to "r0"'
+        self.assertTrue(expected_output in result.output, msg="Did not find expected output: %s" % result.output)
+
+
+
+
+
+
+
+
+
-- 
1.7.9.5


