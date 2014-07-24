Return-Path: <georgex.l.musat@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1E193707A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 12:45:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Jul 2014 05:45:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,724,1400050800"; d="scan'208";a="548379383"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 24 Jul 2014 05:44:53 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 3AC2E6A4007;
	Thu, 24 Jul 2014 05:44:18 -0700 (PDT)
From: Lucian Musat <georgex.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jul 2014 15:41:24 +0300
Message-Id: <1406205685-7685-1-git-send-email-georgex.l.musat@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] oeqa: Refactor test skipping decorators to use the unittest result object
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
X-List-Received-Date: Thu, 24 Jul 2014 12:45:22 -0000

In order to make the test skipping decorators independent of the oeTest object we rely on the unittest result object to construct skip, fail and error lists used by these decorators.
Created a new object getResults that analyses upper frames and retrieves the unittest result object instance, then return a list of failed, skipped and error tests.
Also removed the oetest import from decorators.py because it was no longer required.

Signed-off-by: Lucian Musat <georgex.l.musat@intel.com>
---
 meta/lib/oeqa/oetest.py           | 17 -----------------
 meta/lib/oeqa/utils/decorators.py | 40 +++++++++++++++++++++++++++++++++------
 2 files changed, 34 insertions(+), 23 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 0db6cb8..ecb8e53 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -11,7 +11,6 @@ import os, re, mmap
 import unittest
 import inspect
 
-
 def loadTests(tc):
 
     # set the context object passed from the test class
@@ -36,24 +35,9 @@ def runTests(tc):
 
     return result
 
-
 class oeTest(unittest.TestCase):
 
     longMessage = True
-    testFailures = []
-    testSkipped = []
-    testErrors = []
-
-    def run(self, result=None):
-        super(oeTest, self).run(result)
-
-        # we add to our own lists the results, we use those for decorators
-        if len(result.failures) > len(oeTest.testFailures):
-            oeTest.testFailures.append(str(result.failures[-1][0]).split()[0])
-        if len(result.skipped) > len(oeTest.testSkipped):
-            oeTest.testSkipped.append(str(result.skipped[-1][0]).split()[0])
-        if len(result.errors) > len(oeTest.testErrors):
-            oeTest.testErrors.append(str(result.errors[-1][0]).split()[0])
 
     @classmethod
     def hasPackage(self, pkg):
@@ -71,7 +55,6 @@ class oeTest(unittest.TestCase):
         else:
             return False
 
-
 class oeRuntimeTest(oeTest):
 
     def __init__(self, methodName='runTest'):
diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index a0d94e6..439e80a 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -6,9 +6,34 @@
 # Most useful is skipUnlessPassed which can be used for
 # creating dependecies between two test methods.
 
-from oeqa.oetest import *
 import logging
 import sys
+import unittest
+
+#get the "result" object from one of the upper frames provided that one of these upper frames is a unittest.case frame
+class getResults(object):
+    def __init__(self):
+        #dynamically determine the unittest.case frame and use it to get the name of the test method
+        upperf = sys._current_frames().values()[0]
+        while (upperf.f_globals['__name__'] != 'unittest.case'):
+            upperf = upperf.f_back
+        self.faillist = [ seq[0]._testMethodName for seq in upperf.f_locals['result'].failures ]
+        self.errorlist = [ seq[0]._testMethodName for seq in upperf.f_locals['result'].errors ]
+        #ignore the _ErrorHolder objects from the skipped tests list
+        self.skiplist = []
+        for seq in upperf.f_locals['result'].skipped:
+            try:
+                self.skiplist.append(seq[0]._testMethodName)
+            except: pass
+
+    def getFailList(self):
+        return self.faillist
+
+    def getErrorList(self):
+        return self.errorlist
+
+    def getSkipList(self):
+        return self.skiplist
 
 class skipIfFailure(object):
 
@@ -17,7 +42,8 @@ class skipIfFailure(object):
 
     def __call__(self,f):
         def wrapped_f(*args):
-            if self.testcase in (oeTest.testFailures or oeTest.testErrors):
+            res = getResults()
+            if self.testcase in (res.getFailList() or res.getErrorList()):
                 raise unittest.SkipTest("Testcase dependency not met: %s" % self.testcase)
             return f(*args)
         wrapped_f.__name__ = f.__name__
@@ -30,7 +56,8 @@ class skipIfSkipped(object):
 
     def __call__(self,f):
         def wrapped_f(*args):
-            if self.testcase in oeTest.testSkipped:
+            res = getResults()
+            if self.testcase in res.getSkipList():
                 raise unittest.SkipTest("Testcase dependency not met: %s" % self.testcase)
             return f(*args)
         wrapped_f.__name__ = f.__name__
@@ -43,9 +70,10 @@ class skipUnlessPassed(object):
 
     def __call__(self,f):
         def wrapped_f(*args):
-            if self.testcase in oeTest.testSkipped or \
-                    self.testcase in  oeTest.testFailures or \
-                    self.testcase in oeTest.testErrors:
+            res = getResults()
+            if self.testcase in res.getSkipList() or \
+                    self.testcase in res.getFailList() or \
+                    self.testcase in res.getErrorList():
                 raise unittest.SkipTest("Testcase dependency not met: %s" % self.testcase)
             return f(*args)
         wrapped_f.__name__ = f.__name__
-- 
1.9.1


