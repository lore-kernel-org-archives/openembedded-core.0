Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 740C76D86B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 10:38:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Dec 2013 02:38:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,501,1384329600"; d="scan'208";a="453534020"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 17 Dec 2013 02:38:12 -0800
Received: from localhost.localdomain (unknown [10.237.112.161])
	by linux.intel.com (Postfix) with ESMTP id E853F6A4092;
	Tue, 17 Dec 2013 02:38:09 -0800 (PST)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Dec 2013 12:49:27 +0100
Message-Id: <1387280969-4066-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V2 1/3] oe-selftest: New BuildhistoryBase object for buildhistory testing.
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
X-List-Received-Date: Tue, 17 Dec 2013 10:38:15 -0000

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/selftest/buildhistory.py |   45 ++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/buildhistory.py

diff --git a/meta/lib/oeqa/selftest/buildhistory.py b/meta/lib/oeqa/selftest/buildhistory.py
new file mode 100644
index 0000000..d8cae46
--- /dev/null
+++ b/meta/lib/oeqa/selftest/buildhistory.py
@@ -0,0 +1,45 @@
+import unittest
+import os
+import re
+import shutil
+import datetime
+
+import oeqa.utils.ftools as ftools
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import Command, runCmd, bitbake, get_bb_var, get_test_layer
+
+
+class BuildhistoryBase(oeSelfTest):
+
+    def config_buildhistory(self, tmp_bh_location=False):
+        if (not 'buildhistory' in get_bb_var('USER_CLASSES')) and (not 'buildhistory' in get_bb_var('INHERIT')):
+            add_buildhistory_config = 'INHERIT += "buildhistory"\nBUILDHISTORY_COMMIT = "1"'
+            self.append_config(add_buildhistory_config)
+
+        if tmp_bh_location:
+            # Using a temporary buildhistory location for testing
+            tmp_bh_dir = os.path.join(self.builddir, "tmp_buildhistory_%s" % datetime.datetime.now().strftime('%Y%m%d%H%M%S'))
+            buildhistory_dir_config = "BUILDHISTORY_DIR = \"%s\"" % tmp_bh_dir
+            self.append_config(buildhistory_dir_config)
+            self.track_for_cleanup(tmp_bh_dir)
+
+    def run_buildhistory_operation(self, target, global_config='', target_config='', change_bh_location=False, expect_error=False, error_regex=''):
+        if change_bh_location:
+            tmp_bh_location = True
+        else:
+            tmp_bh_location = False
+        self.config_buildhistory(tmp_bh_location)
+
+        self.append_config(global_config)
+        self.append_recipeinc(target, target_config)
+        bitbake("-cclean %s" % target)
+        result = bitbake(target, ignore_status=True)
+        self.remove_config(global_config)
+        self.remove_recipeinc(target, target_config)
+
+        if expect_error:
+            self.assertEqual(result.status, 1, msg="Error expected for global config '%s' and target config '%s'" % (global_config, target_config))
+            search_for_error = re.search(error_regex, result.output)
+            self.assertTrue(search_for_error, msg="Could not find desired error in output: %s" % error_regex)
+        else:
+            self.assertEqual(result.status, 0, msg="Command 'bitbake %s' has failed unexpectedly: %s" % (target, result.output))
-- 
1.7.9.5


