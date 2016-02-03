Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C469177335
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 00:28:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Feb 2016 16:28:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,387,1449561600"; d="scan'208";a="904289152"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.31])
	by orsmga002.jf.intel.com with ESMTP; 02 Feb 2016 16:28:55 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 18:30:24 -0600
Message-Id: <03af3029f477233e45c1a5594c35278c44c1bd67.1454459362.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454459362.git.anibal.limon@linux.intel.com>
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1454459362.git.anibal.limon@linux.intel.com>
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, benjamin.esquivel@intel.com,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
Subject: [PATCH v2 12/28] oetest.py/TestContext: Move loadTests and runTests inside it.
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
X-List-Received-Date: Wed, 03 Feb 2016 00:28:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <limon.anibal@gmail.com>

Method's for loadTests and runTests make sense to define
inside TestContext because it can be different around
Image, SDK, SDKExt.

Signed-off-by: Aníbal Limón <limon.anibal@gmail.com>
---
 meta/classes/testimage.bbclass |   6 +-
 meta/classes/testsdk.bbclass   |   6 +-
 meta/lib/oeqa/oetest.py        | 197 ++++++++++++++++++++---------------------
 3 files changed, 103 insertions(+), 106 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 5ffa8a5..5fafda1 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -195,7 +195,7 @@ def testimage_main(d):
     import oeqa.runtime
     import time
     import signal
-    from oeqa.oetest import loadTests, runTests, ImageTestContext
+    from oeqa.oetest import ImageTestContext
     from oeqa.targetcontrol import get_target_controller
     from oeqa.utils.dump import get_host_dumper
 
@@ -219,7 +219,7 @@ def testimage_main(d):
     # we are doing that to find compile errors in the tests themselves
     # before booting the image
     try:
-        loadTests(tc)
+        tc.loadTests()
     except Exception as e:
         import traceback
         bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
@@ -233,7 +233,7 @@ def testimage_main(d):
         try:
             target.start()
             starttime = time.time()
-            result = runTests(tc)
+            result = tc.runTests()
             stoptime = time.time()
             if result.wasSuccessful():
                 bb.plain("%s - Ran %d test%s in %.3fs" % (pn, result.testsRun, result.testsRun != 1 and "s" or "", stoptime - starttime))
diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 30238f8..92d348b 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -13,7 +13,7 @@ def testsdk_main(d):
     import oeqa.sdk
     import time
     import subprocess
-    from oeqa.oetest import loadTests, runTests, SDKTestContext
+    from oeqa.oetest import SDKTestContext
 
     pn = d.getVar("PN", True)
     bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR", True))
@@ -40,13 +40,13 @@ def testsdk_main(d):
             # we are doing that to find compile errors in the tests themselves
             # before booting the image
             try:
-                loadTests(tc, "sdk")
+                tc.loadTests()
             except Exception as e:
                 import traceback
                 bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
 
             starttime = time.time()
-            result = runTests(tc, "sdk")
+            result = tc.runTests()
             stoptime = time.time()
             if result.wasSuccessful():
                 bb.plain("%s SDK(%s):%s - Ran %d test%s in %.3fs" % (pn, os.path.basename(tcname), os.path.basename(sdkenv),result.testsRun, result.testsRun != 1 and "s" or "", stoptime - starttime))
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index f9e2b4b..28577ef 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -45,106 +45,6 @@ def filterByTagExp(testsuite, tagexp):
             caseList.append(filterByTagExp(each, tagexp))
     return testsuite.__class__(caseList)
 
-def loadTests(tc, type="runtime"):
-    if type == "runtime":
-        # set the context object passed from the test class
-        setattr(oeTest, "tc", tc)
-        # set ps command to use
-        setattr(oeRuntimeTest, "pscmd", "ps -ef" if oeTest.hasPackage("procps") else "ps")
-        # prepare test suite, loader and runner
-        suite = unittest.TestSuite()
-    elif type == "sdk":
-        # set the context object passed from the test class
-        setattr(oeTest, "tc", tc)
-    testloader = unittest.TestLoader()
-    testloader.sortTestMethodsUsing = None
-    suites = [testloader.loadTestsFromName(name) for name in tc.testslist]
-    suites = filterByTagExp(suites, getattr(tc, "tagexp", None))
-
-    def getTests(test):
-        '''Return all individual tests executed when running the suite.'''
-        # Unfortunately unittest does not have an API for this, so we have
-        # to rely on implementation details. This only needs to work
-        # for TestSuite containing TestCase.
-        method = getattr(test, '_testMethodName', None)
-        if method:
-            # leaf case: a TestCase
-            yield test
-        else:
-            # Look into TestSuite.
-            tests = getattr(test, '_tests', [])
-            for t1 in tests:
-                for t2 in getTests(t1):
-                    yield t2
-
-    # Determine dependencies between suites by looking for @skipUnlessPassed
-    # method annotations. Suite A depends on suite B if any method in A
-    # depends on a method on B.
-    for suite in suites:
-        suite.dependencies = []
-        suite.depth = 0
-        for test in getTests(suite):
-            methodname = getattr(test, '_testMethodName', None)
-            if methodname:
-                method = getattr(test, methodname)
-                depends_on = getattr(method, '_depends_on', None)
-                if depends_on:
-                    for dep_suite in suites:
-                        if depends_on in [getattr(t, '_testMethodName', None) for t in getTests(dep_suite)]:
-                            if dep_suite not in suite.dependencies and \
-                               dep_suite is not suite:
-                                suite.dependencies.append(dep_suite)
-                            break
-                    else:
-                        logger.warning("Test %s was declared as @skipUnlessPassed('%s') but that test is either not defined or not active. Will run the test anyway." %
-                                (test, depends_on))
-    # Use brute-force topological sort to determine ordering. Sort by
-    # depth (higher depth = must run later), with original ordering to
-    # break ties.
-    def set_suite_depth(suite):
-        for dep in suite.dependencies:
-            new_depth = set_suite_depth(dep) + 1
-            if new_depth > suite.depth:
-                suite.depth = new_depth
-        return suite.depth
-    for index, suite in enumerate(suites):
-        set_suite_depth(suite)
-        suite.index = index
-    suites.sort(cmp=lambda a,b: cmp((a.depth, a.index), (b.depth, b.index)))
-    return testloader.suiteClass(suites)
-
-_buffer = ""
-
-def custom_verbose(msg, *args, **kwargs):
-    global _buffer
-    if msg[-1] != "\n":
-        _buffer += msg
-    else:
-        _buffer += msg
-        try:
-            bb.plain(_buffer.rstrip("\n"), *args, **kwargs)
-        except NameError:
-            logger.info(_buffer.rstrip("\n"), *args, **kwargs)
-        _buffer = ""
-
-def runTests(tc, type="runtime"):
-
-    suite = loadTests(tc, type)
-    logger.info("Test modules  %s" % tc.testslist)
-    if hasattr(tc, "tagexp") and tc.tagexp:
-        logger.info("Filter test cases by tags: %s" % tc.tagexp)
-    logger.info("Found %s tests" % suite.countTestCases())
-    runner = unittest.TextTestRunner(verbosity=2)
-    try:
-        if bb.msg.loggerDefaultVerbose:
-            runner.stream.write = custom_verbose
-    except NameError:
-        # Not in bb environment?
-        pass
-    result = runner.run(suite)
-
-    return result
-
 @LogResults
 class oeTest(unittest.TestCase):
 
@@ -253,6 +153,19 @@ def skipModuleUnless(cond, reason):
     if not cond:
         skipModule(reason, 3)
 
+_buffer_logger = ""
+def custom_verbose(msg, *args, **kwargs):
+    global _buffer_logger
+    if msg[-1] != "\n":
+        _buffer_logger += msg
+    else:
+        _buffer_logger += msg
+        try:
+            bb.plain(_buffer_logger.rstrip("\n"), *args, **kwargs)
+        except NameError:
+            logger.info(_buffer_logger.rstrip("\n"), *args, **kwargs)
+        _buffer_logger = ""
+
 class TestContext(object):
     def __init__(self, d):
         self.d = d
@@ -324,6 +237,86 @@ class TestContext(object):
 
         return testslist
 
+    def loadTests(self):
+        setattr(oeTest, "tc", self)
+
+        testloader = unittest.TestLoader()
+        testloader.sortTestMethodsUsing = None
+        suites = [testloader.loadTestsFromName(name) for name in self.testslist]
+        suites = filterByTagExp(suites, getattr(self, "tagexp", None))
+
+        def getTests(test):
+            '''Return all individual tests executed when running the suite.'''
+            # Unfortunately unittest does not have an API for this, so we have
+            # to rely on implementation details. This only needs to work
+            # for TestSuite containing TestCase.
+            method = getattr(test, '_testMethodName', None)
+            if method:
+                # leaf case: a TestCase
+                yield test
+            else:
+                # Look into TestSuite.
+                tests = getattr(test, '_tests', [])
+                for t1 in tests:
+                    for t2 in getTests(t1):
+                        yield t2
+
+        # Determine dependencies between suites by looking for @skipUnlessPassed
+        # method annotations. Suite A depends on suite B if any method in A
+        # depends on a method on B.
+        for suite in suites:
+            suite.dependencies = []
+            suite.depth = 0
+            for test in getTests(suite):
+                methodname = getattr(test, '_testMethodName', None)
+                if methodname:
+                    method = getattr(test, methodname)
+                    depends_on = getattr(method, '_depends_on', None)
+                    if depends_on:
+                        for dep_suite in suites:
+                            if depends_on in [getattr(t, '_testMethodName', None) for t in getTests(dep_suite)]:
+                                if dep_suite not in suite.dependencies and \
+                                   dep_suite is not suite:
+                                    suite.dependencies.append(dep_suite)
+                                break
+                        else:
+                            logger.warning("Test %s was declared as @skipUnlessPassed('%s') but that test is either not defined or not active. Will run the test anyway." %
+                                    (test, depends_on))
+
+        # Use brute-force topological sort to determine ordering. Sort by
+        # depth (higher depth = must run later), with original ordering to
+        # break ties.
+        def set_suite_depth(suite):
+            for dep in suite.dependencies:
+                new_depth = set_suite_depth(dep) + 1
+                if new_depth > suite.depth:
+                    suite.depth = new_depth
+            return suite.depth
+
+        for index, suite in enumerate(suites):
+            set_suite_depth(suite)
+            suite.index = index
+        suites.sort(cmp=lambda a,b: cmp((a.depth, a.index), (b.depth, b.index)))
+
+        self.suite = testloader.suiteClass(suites)
+
+        return self.suite
+
+    def runTests(self):
+        logger.info("Test modules  %s" % self.testslist)
+        if hasattr(self, "tagexp") and self.tagexp:
+            logger.info("Filter test cases by tags: %s" % self.tagexp)
+        logger.info("Found %s tests" % self.suite.countTestCases())
+        runner = unittest.TextTestRunner(verbosity=2)
+        try:
+            if bb.msg.loggerDefaultVerbose:
+                runner.stream.write = custom_verbose
+        except NameError:
+            # Not in bb environment?
+            pass
+
+        return runner.run(self.suite)
+
 class ImageTestContext(TestContext):
     def __init__(self, d, target, host_dumper):
         super(ImageTestContext, self).__init__(d)
@@ -374,6 +367,10 @@ class ImageTestContext(TestContext):
     def _get_test_suites_required(self):
         return [t for t in self.d.getVar("TEST_SUITES", True).split() if t != "auto"]
 
+    def loadTests(self):
+        super(ImageTestContext, self).loadTests()
+        setattr(oeRuntimeTest, "pscmd", "ps -ef" if oeTest.hasPackage("procps") else "ps")
+
 class SDKTestContext(TestContext):
     def __init__(self, d, sdktestdir, sdkenv):
         super(SDKTestContext, self).__init__(d)
-- 
2.1.4


