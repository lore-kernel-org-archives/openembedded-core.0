Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A235970897
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 08:53:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Aug 2014 01:54:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,831,1400050800"; d="scan'208";a="582373389"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 09 Aug 2014 01:53:56 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id 2BBF96A4007;
	Sat,  9 Aug 2014 01:53:17 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Aug 2014 13:59:07 +0300
Message-Id: <1407581949-12085-3-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1407581949-12085-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1407581949-12085-1-git-send-email-corneliux.stoicescu@intel.com>
Subject: [PATCH 2/4] oeqa/oetest.py: enable sdk testing
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
X-List-Received-Date: Sat, 09 Aug 2014 08:53:59 -0000

- add support for sdk tests in the loadTests and runTests methods
- add new oeSDKTest test object

NOTE: Original patch made by: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/oetest.py | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index dcbd498..5552c43 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -10,25 +10,29 @@
 import os, re, mmap
 import unittest
 import inspect
+import subprocess
 from oeqa.utils.decorators import LogResults
 
-def loadTests(tc):
-
-    # set the context object passed from the test class
-    setattr(oeTest, "tc", tc)
-    # set ps command to use
-    setattr(oeRuntimeTest, "pscmd", "ps -ef" if oeTest.hasPackage("procps") else "ps")
-    # prepare test suite, loader and runner
-    suite = unittest.TestSuite()
+def loadTests(tc, type="runtime"):
+    if type == "runtime":
+        # set the context object passed from the test class
+        setattr(oeTest, "tc", tc)
+        # set ps command to use
+        setattr(oeRuntimeTest, "pscmd", "ps -ef" if oeTest.hasPackage("procps") else "ps")
+        # prepare test suite, loader and runner
+        suite = unittest.TestSuite()
+    elif type == "sdk":
+        # set the context object passed from the test class
+        setattr(oeSDKTest, "tc", tc)
     testloader = unittest.TestLoader()
     testloader.sortTestMethodsUsing = None
     suite = testloader.loadTestsFromNames(tc.testslist)
 
     return suite
 
-def runTests(tc):
+def runTests(tc, type="runtime"):
 
-    suite = loadTests(tc)
+    suite = loadTests(tc, type)
     print("Test modules  %s" % tc.testslist)
     print("Found %s tests" % suite.countTestCases())
     runner = unittest.TextTestRunner(verbosity=2)
@@ -58,11 +62,14 @@ class oeTest(unittest.TestCase):
             return False
 
 class oeRuntimeTest(oeTest):
-
     def __init__(self, methodName='runTest'):
         self.target = oeRuntimeTest.tc.target
         super(oeRuntimeTest, self).__init__(methodName)
 
+class oeSDKTest(unittest.TestCase):
+    def __init__(self, methodName='runTest'):
+        self.sdktestdir = oeSDKTest.tc.sdktestdir
+        super(oeSDKTest, self).__init__(methodName)
 
 def getmodule(pos=2):
     # stack returns a list of tuples containg frame information
-- 
1.8.3.2


