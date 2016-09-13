Return-Path: <jing.j.wang@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 82F3877218
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 01:21:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 12 Sep 2016 18:21:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,326,1470726000"; d="scan'208";a="760043760"
Received: from iot.sh.intel.com ([10.239.52.75])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Sep 2016 18:21:00 -0700
From: jwang <jing.j.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2016 09:17:34 +0800
Message-Id: <1473729455-32649-3-git-send-email-jing.j.wang@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1473729455-32649-1-git-send-email-jing.j.wang@intel.com>
References: <1473729455-32649-1-git-send-email-jing.j.wang@intel.com>
Subject: [PATCH 3/4] meta: use baserunner in oetest
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
X-List-Received-Date: Tue, 13 Sep 2016 01:21:00 -0000

From: zjh <junhuix.zhang@intel.com>

enable two features from baserunner:
1. loadtest
2. read test cases from manifest file

Signed-off-by: zjh <junhuix.zhang@intel.com>
---
 meta/lib/oeqa/oetest.py | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 4a740fb..9211cec 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -28,6 +28,8 @@ except ImportError:
     pass
 from oeqa.utils.decorators import LogResults, gettag, getResults
 from oeqa.utils import avoid_paths_in_environ
+from base.baserunner import TestRunnerBase
+
 
 logger = logging.getLogger("BitBake")
 
@@ -203,8 +205,10 @@ def custom_verbose(msg, *args, **kwargs):
             logger.info(_buffer_logger.rstrip("\n"), *args, **kwargs)
         _buffer_logger = ""
 
-class TestContext(object):
+class TestContext(TestRunnerBase):
+    _configure_in_init = True
     def __init__(self, d, exported=False):
+        super(TestContext, self).__init__(self)
         self.d = d
 
         self.testsuites = self._get_test_suites()
@@ -223,6 +227,9 @@ class TestContext(object):
         self.imagefeatures = d.getVar("IMAGE_FEATURES", True).split()
         self.distrofeatures = d.getVar("DISTRO_FEATURES", True).split()
 
+        if self._configure_in_init:
+            self.configure()
+
     # get testcase list from specified file
     # if path is a relative path, then relative to build/conf/
     def _read_testlist(self, fpath, builddir):
@@ -329,9 +336,7 @@ class TestContext(object):
     def loadTests(self):
         setattr(oeTest, "tc", self)
 
-        testloader = unittest.TestLoader()
-        testloader.sortTestMethodsUsing = None
-        suites = [testloader.loadTestsFromName(name) for name in self.testslist]
+        suites = self.loadtest(self.testslist)
         suites = filterByTagExp(suites, getattr(self, "tagexp", None))
 
         # Determine dependencies between suites by looking for @skipUnlessPassed
@@ -376,9 +381,9 @@ class TestContext(object):
         def cmpfunc(a, b):
             return cmp((a.depth, a.index), (b.depth, b.index))
 
-        suites.sort(key=functools.cmp_to_key(cmpfunc))
+        suites._tests.sort(key=functools.cmp_to_key(cmpfunc))
 
-        self.suite = testloader.suiteClass(suites)
+        self.suite = suites
 
         return self.suite
 
@@ -387,11 +392,10 @@ class TestContext(object):
         if hasattr(self, "tagexp") and self.tagexp:
             logger.info("Filter test cases by tags: %s" % self.tagexp)
         logger.info("Found %s tests" % self.suite.countTestCases())
-        runner = unittest.TextTestRunner(verbosity=2)
         if 'bb' in sys.modules:
-            runner.stream.write = custom_verbose
-
-        return runner.run(self.suite)
+            self.runner.stream.write = custom_verbose
+        self.start(self.suite)
+        return self.result()
 
 class RuntimeTestContext(TestContext):
     def __init__(self, d, target, exported=False):
-- 
2.1.4


