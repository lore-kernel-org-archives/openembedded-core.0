Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id B7D576D12B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 10:37:53 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Nov 2013 03:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="383268768"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 01 Nov 2013 03:37:45 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 0B4C06A4007;
	Fri,  1 Nov 2013 03:37:43 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Nov 2013 12:37:56 +0200
Message-Id: <1383302276-32563-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] lib/oeqa: add oeTest superclass
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
X-List-Received-Date: Fri, 01 Nov 2013 10:37:56 -0000

Add oeTest superclass, make oeRuntimeTest inherit that and
make the necesarry adjustments. Tests in lib/oeqa/runtime don't
change, they still inherit oeRuntimeTest.
We should do this because oetest.py in the future can be a base module
for more stuff than oeRuntimeTest.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/oetest.py           | 40 ++++++++++++++++++++-------------------
 meta/lib/oeqa/utils/decorators.py | 10 +++++-----
 2 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 529abdc..3bb3589 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -17,9 +17,9 @@ from oeqa.utils.sshcontrol import SSHControl
 def runTests(tc):
 
     # set the context object passed from the test class
-    setattr(oeRuntimeTest, "tc", tc)
+    setattr(oeTest, "tc", tc)
     # set ps command to use
-    setattr(oeRuntimeTest, "pscmd", "ps -ef" if oeRuntimeTest.hasPackage("procps") else "ps")
+    setattr(oeRuntimeTest, "pscmd", "ps -ef" if oeTest.hasPackage("procps") else "ps")
     # prepare test suite, loader and runner
     suite = unittest.TestSuite()
     testloader = unittest.TestLoader()
@@ -36,33 +36,28 @@ def runTests(tc):
 
 
 
-class oeRuntimeTest(unittest.TestCase):
+class oeTest(unittest.TestCase):
 
     longMessage = True
     testFailures = []
     testSkipped = []
     testErrors = []
 
-    def __init__(self, methodName='runTest'):
-        self.target = oeRuntimeTest.tc.target
-        super(oeRuntimeTest, self).__init__(methodName)
-
-
     def run(self, result=None):
-        super(oeRuntimeTest, self).run(result)
+        super(oeTest, self).run(result)
 
         # we add to our own lists the results, we use those for decorators
-        if len(result.failures) > len(oeRuntimeTest.testFailures):
-            oeRuntimeTest.testFailures.append(str(result.failures[-1][0]).split()[0])
-        if len(result.skipped) > len(oeRuntimeTest.testSkipped):
-            oeRuntimeTest.testSkipped.append(str(result.skipped[-1][0]).split()[0])
-        if len(result.errors) > len(oeRuntimeTest.testErrors):
-            oeRuntimeTest.testErrors.append(str(result.errors[-1][0]).split()[0])
+        if len(result.failures) > len(oeTest.testFailures):
+            oeTest.testFailures.append(str(result.failures[-1][0]).split()[0])
+        if len(result.skipped) > len(oeTest.testSkipped):
+            oeTest.testSkipped.append(str(result.skipped[-1][0]).split()[0])
+        if len(result.errors) > len(oeTest.testErrors):
+            oeTest.testErrors.append(str(result.errors[-1][0]).split()[0])
 
     @classmethod
     def hasPackage(self, pkg):
 
-        pkgfile = os.path.join(oeRuntimeTest.tc.d.getVar("WORKDIR", True), "installed_pkgs.txt")
+        pkgfile = os.path.join(oeTest.tc.d.getVar("WORKDIR", True), "installed_pkgs.txt")
 
         with open(pkgfile) as f:
             data = mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ)
@@ -77,12 +72,19 @@ class oeRuntimeTest(unittest.TestCase):
     @classmethod
     def hasFeature(self,feature):
 
-        if feature in oeRuntimeTest.tc.d.getVar("IMAGE_FEATURES", True).split() or \
-                feature in oeRuntimeTest.tc.d.getVar("DISTRO_FEATURES", True).split():
+        if feature in oeTest.tc.d.getVar("IMAGE_FEATURES", True).split() or \
+                feature in oeTest.tc.d.getVar("DISTRO_FEATURES", True).split():
             return True
         else:
             return False
 
+
+class oeRuntimeTest(oeTest):
+
+    def __init__(self, methodName='runTest'):
+        self.target = oeRuntimeTest.tc.target
+        super(oeRuntimeTest, self).__init__(methodName)
+
     @classmethod
     def restartTarget(self,params=None):
 
@@ -102,7 +104,7 @@ def getmodule(pos=2):
 
 def skipModule(reason, pos=2):
     modname = getmodule(pos)
-    if modname not in oeRuntimeTest.tc.testsrequired:
+    if modname not in oeTest.tc.testsrequired:
         raise unittest.SkipTest("%s: %s" % (modname, reason))
     else:
         raise Exception("\nTest %s wants to be skipped.\nReason is: %s" \
diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index 33fed5a..b99da8d 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -15,7 +15,7 @@ class skipIfFailure(object):
 
     def __call__(self,f):
         def wrapped_f(*args):
-            if self.testcase in (oeRuntimeTest.testFailures or oeRuntimeTest.testErrors):
+            if self.testcase in (oeTest.testFailures or oeTest.testErrors):
                 raise unittest.SkipTest("Testcase dependency not met: %s" % self.testcase)
             return f(*args)
         wrapped_f.__name__ = f.__name__
@@ -28,7 +28,7 @@ class skipIfSkipped(object):
 
     def __call__(self,f):
         def wrapped_f(*args):
-            if self.testcase in oeRuntimeTest.testSkipped:
+            if self.testcase in oeTest.testSkipped:
                 raise unittest.SkipTest("Testcase dependency not met: %s" % self.testcase)
             return f(*args)
         wrapped_f.__name__ = f.__name__
@@ -41,9 +41,9 @@ class skipUnlessPassed(object):
 
     def __call__(self,f):
         def wrapped_f(*args):
-            if self.testcase in oeRuntimeTest.testSkipped or \
-                    self.testcase in  oeRuntimeTest.testFailures or \
-                    self.testcase in oeRuntimeTest.testErrors:
+            if self.testcase in oeTest.testSkipped or \
+                    self.testcase in  oeTest.testFailures or \
+                    self.testcase in oeTest.testErrors:
                 raise unittest.SkipTest("Testcase dependency not met: %s" % self.testcase)
             return f(*args)
         wrapped_f.__name__ = f.__name__
-- 
1.8.3.1


