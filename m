Return-Path: <jing.j.wang@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 690A177214
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 01:20:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 12 Sep 2016 18:21:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,326,1470726000"; d="scan'208";a="760043754"
Received: from iot.sh.intel.com ([10.239.52.75])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Sep 2016 18:20:59 -0700
From: jwang <jing.j.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2016 09:17:33 +0800
Message-Id: <1473729455-32649-2-git-send-email-jing.j.wang@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1473729455-32649-1-git-send-email-jing.j.wang@intel.com>
References: <1473729455-32649-1-git-send-email-jing.j.wang@intel.com>
Subject: [PATCH 2/4] meta: implement key baserunner features
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

Baserunner contains three features:
1. load cases from a manifest file
2. load cases from a package such as "oeqa.runtime"
3. create runner engine based on pyunit textrunner

Signed-off-by: zjh <junhuix.zhang@intel.com>
---
 meta/lib/base/baserunner.py | 44 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/meta/lib/base/baserunner.py b/meta/lib/base/baserunner.py
index 56b838e..d59872f 100755
--- a/meta/lib/base/baserunner.py
+++ b/meta/lib/base/baserunner.py
@@ -31,30 +31,62 @@ class FakeOptions(object):
 class TestRunnerBase(object):
     '''test runner base '''
     def __init__(self, context=None):
-        self.tclist = []
+        self.testslist = []
         self.runner = None
         self.context = context if context else TestContext()
+        self.test_options = None
         self.test_result = None
         self.run_time = None
 
+    def __del__(self):
+        """
+        Because unittest.TestCase is a class object, it will exist as long as the python virtual machine process.
+        So tc can't be released if we don't release them explicitly.
+        """
+        if hasattr(unittest.TestCase, "tc"):
+            delattr(unittest.TestCase, "tc")
+
+    @staticmethod
+    def get_tc_from_manifest(fname):
+        '''get tc list from manifest format '''
+        with open(fname, "r") as f:
+            tclist = [n.strip() for n in f.readlines() \
+                                if n.strip() and not n.strip().startswith('#')]
+        return tclist
 
     def configure(self, options=FakeOptions()):
         '''configure before testing'''
-        pass
+        self.test_options = options
+        self.runner = unittest.TextTestRunner(stream=sys.stderr, \
+                                                  verbosity=2)
 
     def result(self):
         '''output test result '''
-        pass
+        return self.test_result
 
     def loadtest(self, names=None):
         '''load test suite'''
-        pass
+        if names is None:
+            names = self.testslist
+        testloader = unittest.TestLoader()
+        tclist = []
+        for name in names:
+            tset = testloader.loadTestsFromName(name)
+            if tset.countTestCases() > 0:
+                tclist.append(tset)
+            elif tset._tests == []:
+                tclist.append(testloader.discover(name, "[!_]*.py", os.path.curdir))
+        return testloader.suiteClass(tclist)
 
     def runtest(self, testsuite):
         '''run test suite'''
-        pass
+        starttime = time.time()
+        self.test_result = self.runner.run(testsuite)
+        self.run_time = time.time() - starttime
 
     def start(self, testsuite):
         '''start testing'''
-        pass
+        setattr(unittest.TestCase, "tc", self.context)
+        self.runtest(testsuite)
+        self.result()
 
-- 
2.1.4


