Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5FF5860123
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 14:47:22 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 18 Apr 2016 07:47:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,502,1455004800"; d="scan'208";a="87306507"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 18 Apr 2016 07:47:21 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 8284D6A4002;
	Mon, 18 Apr 2016 08:34:59 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Apr 2016 15:27:24 +0300
Message-Id: <1460982444-26569-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oetest: make console output more verbose
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
X-List-Received-Date: Mon, 18 Apr 2016 14:47:27 -0000

Added output of test runner to bitbake console output.
bitbake <image> -c testimage now reports test progress
to the console:
NOTE: Executing RunQueue Tasks
...
NOTE: recipe core-image-lsb-1.0-r0: task do_testimage: Started
core-image-lsb-1.0-r0 do_testimage: test_ping (oeqa.runtime.ping.PingTest) ... ok
core-image-lsb-1.0-r0 do_testimage: test_ssh (oeqa.runtime.ssh.SshTest) ... ok
...
----------------------------------------------------------------------
core-image-lsb-1.0-r0 do_testimage: Ran 38 tests in 785.100s
core-image-lsb-1.0-r0 do_testimage:
core-image-lsb-1.0-r0 do_testimage: OK (skipped=1)

Adding more output to the console should also prevent autobuilder to kill
long running tests as ab assumes that test is stuck if no console output
produced by it for a long time.

[YOCTO #8238]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/oetest.py | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 8eb84ed..3ed5bb8 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -7,7 +7,7 @@
 
 # It also has some helper functions and it's responsible for actually starting the tests
 
-import os, re, mmap
+import os, re, mmap, sys
 import unittest
 import inspect
 import subprocess
@@ -326,12 +326,8 @@ class TestContext(object):
             logger.info("Filter test cases by tags: %s" % self.tagexp)
         logger.info("Found %s tests" % self.suite.countTestCases())
         runner = unittest.TextTestRunner(verbosity=2)
-        try:
-            if bb.msg.loggerDefaultVerbose:
-                runner.stream.write = custom_verbose
-        except NameError:
-            # Not in bb environment?
-            pass
+        if 'bb' in sys.modules:
+            runner.stream.write = custom_verbose
 
         return runner.run(self.suite)
 
-- 
2.1.4


