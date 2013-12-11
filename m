Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 903F26AE9E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 14:58:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 11 Dec 2013 06:54:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,872,1378882800"; d="scan'208";a="442443325"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 11 Dec 2013 06:58:44 -0800
Received: from localhost.localdomain (unknown [10.237.112.161])
	by linux.intel.com (Postfix) with ESMTP id 67C946A4092;
	Wed, 11 Dec 2013 06:58:41 -0800 (PST)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2013 17:09:39 +0100
Message-Id: <1386778181-22008-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] oe-selftest: implement add_command_to_tearDown method
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
X-List-Received-Date: Wed, 11 Dec 2013 14:58:45 -0000

Add a new method that can be used by the tester to add a command to the
executed in the tearDown stage of the test. This mechanism can be used to
make sure certain test-specific cleanup tasks are done in the case of a
test failure.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/selftest/base.py |   18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/base.py b/meta/lib/oeqa/selftest/base.py
index c3474a3..25ca84b 100644
--- a/meta/lib/oeqa/selftest/base.py
+++ b/meta/lib/oeqa/selftest/base.py
@@ -13,7 +13,7 @@ import logging
 import errno
 
 import oeqa.utils.ftools as ftools
-
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
 
 class oeSelfTest(unittest.TestCase):
 
@@ -25,6 +25,7 @@ class oeSelfTest(unittest.TestCase):
         self.localconf_path = os.path.join(self.builddir, "conf/local.conf")
         self.testinc_path = os.path.join(self.builddir, "conf/selftest.inc")
         self.testlayer_path = oeSelfTest.testlayer_path
+        self._extra_tear_down_commands = []
         super(oeSelfTest, self).__init__(methodName)
 
     def setUp(self):
@@ -49,11 +50,26 @@ class oeSelfTest(unittest.TestCase):
         pass
 
     def tearDown(self):
+        if self._extra_tear_down_commands:
+            failed_extra_commands = []
+            for command in self._extra_tear_down_commands:
+                result = runCmd(command, ignore_status=True)
+                if not result.status ==  0:
+                    failed_extra_commands.append(command)
+            if failed_extra_commands:
+                self.log.warning("tearDown commands have failed: %s" % ', '.join(map(str, failed_extra_commands)))
+                self.log.debug("Trying to move on.")
+            self._extra_tear_down_commands = []
         self.tearDownLocal()
 
     def tearDownLocal(self):
         pass
 
+    # add test specific commands to the tearDown method.
+    def add_command_to_tearDown(self, command):
+        self.log.debug("Adding command '%s' to tearDown for this test." % command)
+        self._extra_tear_down_commands.append(command)
+
     # write to <builddir>/conf/selftest.inc
     def write_config(self, data):
         self.log.debug("Writing to: %s\n%s\n" % (self.testinc_path, data))
-- 
1.7.9.5


