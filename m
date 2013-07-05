Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 76B7A6B02E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 09:27:24 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Jul 2013 02:27:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1000,1363158000"; d="scan'208";a="264398835"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Jul 2013 02:27:25 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 02E396A4091
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 02:27:23 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 12:27:43 +0300
Message-Id: <c875d98d41bcaa78b58c9931eeef721973b36f0d.1373013888.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1373013888.git.stefanx.stanacar@intel.com>
References: <cover.1373013888.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1373013888.git.stefanx.stanacar@intel.com>
References: <cover.1373013888.git.stefanx.stanacar@intel.com>
Subject: [RFC PATCH v2 2/8] lib/oeqa/oetest.py: base module for all runtime unittests
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
X-List-Received-Date: Fri, 05 Jul 2013 09:27:24 -0000

This module contains the base class for all runtime tests
and some helper methods.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/lib/oeqa/__init__.py |   0
 meta/lib/oeqa/oetest.py   | 101 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 meta/lib/oeqa/__init__.py
 create mode 100644 meta/lib/oeqa/oetest.py

diff --git a/meta/lib/oeqa/__init__.py b/meta/lib/oeqa/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
new file mode 100644
index 0000000..24548e9
--- /dev/null
+++ b/meta/lib/oeqa/oetest.py
@@ -0,0 +1,101 @@
+import os, re, mmap
+import unittest
+import inspect
+import bb
+from oeqa.utils.sshcontrol import SSHControl
+
+
+def runTests(tc):
+
+    # set the context object passed from the test class
+    setattr(oeRuntimeTest, "tc", tc)
+
+    # prepare test suite, loader and runner
+    suite = unittest.TestSuite()
+    testloader = unittest.TestLoader()
+    testloader.sortTestMethodsUsing = None
+    runner = unittest.TextTestRunner(verbosity=2)
+
+    bb.note("Test modules  %s" % tc.testslist)
+    suite = testloader.loadTestsFromNames(tc.testslist)
+    bb.note("Found %s tests" % suite.countTestCases())
+
+    result = runner.run(suite)
+
+    return result
+
+
+
+class oeRuntimeTest(unittest.TestCase):
+    testFailures = []
+    testSkipped = []
+    testErrors = []
+    pscmd = "ps"
+
+    def __init__(self, methodName='runTest'):
+        self.target = oeRuntimeTest.tc.target
+        super(oeRuntimeTest, self).__init__(methodName)
+
+
+    def run(self, result=None):
+        super(oeRuntimeTest, self).run(result)
+
+        # we add to our own lists the results, we use those for decorators
+        if len(result.failures) > len(oeRuntimeTest.testFailures):
+            oeRuntimeTest.testFailures.append(str(result.failures[-1][0]).split()[0])
+        if len(result.skipped) > len(oeRuntimeTest.testSkipped):
+            oeRuntimeTest.testSkipped.append(str(result.skipped[-1][0]).split()[0])
+        if len(result.errors) > len(oeRuntimeTest.testErrors):
+            oeRuntimeTest.testErrors.append(str(result.errors[-1][0]).split()[0])
+
+    @classmethod
+    def hasPackage(self, pkg):
+
+        pkgfile = os.path.join(oeRuntimeTest.tc.d.getVar("WORKDIR", True), "installed_pkgs.txt")
+
+        with open(pkgfile) as f:
+            data = mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ)
+            match = re.search(pkg, data)
+            data.close()
+
+        if match:
+            return True
+
+        return False
+
+    @classmethod
+    def hasFeature(self,feature):
+
+        if feature in oeRuntimeTest.tc.d.getVar("IMAGE_FEATURES", True).split() or \
+                feature in oeRuntimeTest.tc.d.getVar("DISTRO_FEATURES", True).split():
+            return True
+        else:
+            return False
+
+
+
+
+def getmodule(pos=2):
+    # stack returns a list of tuples containg frame information
+    # First element of the list the is current frame, caller is 1
+    frameinfo = inspect.stack()[pos]
+    modname = inspect.getmodulename(frameinfo[1])
+    #modname = inspect.getmodule(frameinfo[0]).__name__
+    return modname
+
+def skipModule(reason, pos=2):
+    modname = getmodule(pos)
+    if modname not in oeRuntimeTest.tc.testsrequired:
+        raise unittest.SkipTest("%s: %s" % (modname, reason))
+    else:
+        bb.warn("Test %s is required, not skipping" % modname)
+
+def skipModuleIf(cond, reason):
+
+    if cond:
+        skipModule(reason, 3)
+
+def skipModuleUnless(cond, reason):
+
+    if not cond:
+        skipModule(reason, 3)
-- 
1.8.1.4


