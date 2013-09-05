Return-Path: <mihaix.lindner@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EB7EB6C6D6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 15:53:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Sep 2013 08:52:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,847,1371106800"; d="scan'208";a="373974745"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 05 Sep 2013 08:52:49 -0700
Received: from mlindnex-mobl1.ger.corp.intel.com (unknown [10.237.105.34])
	by linux.intel.com (Postfix) with ESMTP id A98C12C8001
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 08:52:47 -0700 (PDT)
From: Mihai Lindner <mihaix.lindner@linux.intel.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu,  5 Sep 2013 18:52:42 +0300
Message-Id: <7418a5c57c6c7e7eef7edebfd7e8779597e2f6b2.1378396260.git.mihaix.lindner@linux.intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1378396260.git.mihaix.lindner@linux.intel.com>
References: <cover.1378396260.git.mihaix.lindner@linux.intel.com>
In-Reply-To: <cover.1378396260.git.mihaix.lindner@linux.intel.com>
References: <cover.1378396260.git.mihaix.lindner@linux.intel.com>
Subject: [PATCH 3/3] oeqa/runtime/scp: replace dd call
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
X-List-Received-Date: Thu, 05 Sep 2013 15:53:09 -0000

Use a file object to generate a our test file instead of calling `dd`;
removes dd's output from testimage.log, keeps unittest output clean.
Also remove unused imports.

Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>
---
 meta/lib/oeqa/runtime/scp.py | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/runtime/scp.py b/meta/lib/oeqa/runtime/scp.py
index b914802..03095bf 100644
--- a/meta/lib/oeqa/runtime/scp.py
+++ b/meta/lib/oeqa/runtime/scp.py
@@ -1,22 +1,21 @@
-import subprocess
-import unittest
 import os
-from oeqa.oetest import oeRuntimeTest
-from oeqa.utils.decorators import *
+from oeqa.oetest import oeRuntimeTest, skipModule
+from oeqa.utils.decorators import skipUnlessPassed
 
 def setUpModule():
     if not (oeRuntimeTest.hasPackage("dropbear") or oeRuntimeTest.hasPackage("openssh-sshd")):
         skipModule("No ssh package in image")
 
-
 class ScpTest(oeRuntimeTest):
 
-    def setUp(self):
-         subprocess.check_call("dd if=/dev/zero of=%s bs=512k count=10" % os.path.join(oeRuntimeTest.tc.d.getVar("TEST_LOG_DIR", True), 'test_scp_file'), shell=True)
-
     @skipUnlessPassed('test_ssh')
-    def test_scp(self):
-        (status, output) = self.target.copy_to(os.path.join(oeRuntimeTest.tc.d.getVar("TEST_LOG_DIR", True), 'test_scp_file'), '/tmp/test_scp_file')
+    def test_scp_file(self):
+        test_log_dir = oeRuntimeTest.tc.d.getVar("TEST_LOG_DIR", True)
+        test_file_path = os.path.join(test_log_dir, 'test_scp_file')
+        with open(test_file_path, 'w') as test_scp_file:
+            test_scp_file.seek(2 ** 22 - 1)
+            test_scp_file.write(os.linesep)
+        (status, output) = self.target.copy_to(test_file_path, '/tmp/test_scp_file')
         self.assertEqual(status, 0, msg = "File could not be copied. Output: %s" % output)
         (status, output) = self.target.run("ls -la /tmp/test_scp_file")
         self.assertEqual(status, 0, msg = "SCP test failed")
-- 
1.8.3.2


