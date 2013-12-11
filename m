Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 9E7B46C745
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 14:58:54 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Dec 2013 06:58:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,872,1378882800"; d="scan'208";a="395831897"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 11 Dec 2013 06:58:47 -0800
Received: from localhost.localdomain (unknown [10.237.112.161])
	by linux.intel.com (Postfix) with ESMTP id 90B046A4092;
	Wed, 11 Dec 2013 06:58:44 -0800 (PST)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2013 17:09:40 +0100
Message-Id: <1386778181-22008-2-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1386778181-22008-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1386778181-22008-1-git-send-email-corneliux.stoicescu@intel.com>
Subject: [PATCH 2/2] oe-selftest: Add track_for_cleanup method to be used in cleanup tasks
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
X-List-Received-Date: Wed, 11 Dec 2013 14:58:54 -0000

Added a track_for_cleanup(path) method that removes the given path in the
tearDown method. This mechanism can be used to make sure a file or directory
we created will be removed at the end of a test, regardless of what happens.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/selftest/base.py |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/lib/oeqa/selftest/base.py b/meta/lib/oeqa/selftest/base.py
index 25ca84b..fc880e9 100644
--- a/meta/lib/oeqa/selftest/base.py
+++ b/meta/lib/oeqa/selftest/base.py
@@ -9,6 +9,7 @@
 import unittest
 import os
 import sys
+import shutil
 import logging
 import errno
 
@@ -26,6 +27,7 @@ class oeSelfTest(unittest.TestCase):
         self.testinc_path = os.path.join(self.builddir, "conf/selftest.inc")
         self.testlayer_path = oeSelfTest.testlayer_path
         self._extra_tear_down_commands = []
+        self._track_for_cleanup = []
         super(oeSelfTest, self).__init__(methodName)
 
     def setUp(self):
@@ -60,6 +62,15 @@ class oeSelfTest(unittest.TestCase):
                 self.log.warning("tearDown commands have failed: %s" % ', '.join(map(str, failed_extra_commands)))
                 self.log.debug("Trying to move on.")
             self._extra_tear_down_commands = []
+
+        if self._track_for_cleanup:
+            for path in self._track_for_cleanup:
+                if os.path.isdir(path):
+                    shutil.rmtree(path)
+                if os.path.isfile(path):
+                    os.remove(path)
+            self._track_for_cleanup = []
+
         self.tearDownLocal()
 
     def tearDownLocal(self):
@@ -69,6 +80,10 @@ class oeSelfTest(unittest.TestCase):
     def add_command_to_tearDown(self, command):
         self.log.debug("Adding command '%s' to tearDown for this test." % command)
         self._extra_tear_down_commands.append(command)
+    # add test specific files or directories to be removed in the tearDown method
+    def track_for_cleanup(self, path):
+        self.log.debug("Adding path '%s' to be cleaned up when test is over" % path)
+        self._track_for_cleanup.append(path)
 
     # write to <builddir>/conf/selftest.inc
     def write_config(self, data):
-- 
1.7.9.5


