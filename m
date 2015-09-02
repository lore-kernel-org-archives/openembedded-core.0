Return-Path: <junhuix.zhang@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E6CE67700A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 07:35:00 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 02 Sep 2015 00:35:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,451,1437462000"; d="scan'208";a="636913149"
Received: from dddd.sh.intel.com ([10.239.52.71])
	by orsmga003.jf.intel.com with ESMTP; 02 Sep 2015 00:35:00 -0700
From: zjh <junhuix.zhang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 15:39:54 +0800
Message-Id: <1441179594-30262-1-git-send-email-junhuix.zhang@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] testimage: filter proper test cases by tags
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
X-List-Received-Date: Wed, 02 Sep 2015 07:35:01 -0000

If a test case is decorate by oeqa.utils.decorators.tag, this case will
by add a tag, testrunner will filter these tags by TEST_SUITES_TAGS
[YOCTO #7849]

Signed-off-by: zjh <junhuix.zhang@intel.com>
---
 meta/classes/testimage.bbclass    |  3 ++-
 meta/lib/oeqa/oetest.py           | 29 ++++++++++++++++++++++++++++-
 meta/lib/oeqa/utils/decorators.py | 34 +++++++++++++++++++++++++++++++++-
 3 files changed, 63 insertions(+), 3 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 140babe..90ecb2a 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -220,7 +220,7 @@ def testimage_main(d):
     # testslist is what we'll actually pass to the unittest loader
     testslist = get_tests_list(d)
     testsrequired = [t for t in d.getVar("TEST_SUITES", True).split() if t != "auto"]
-
+    tagexp = d.getVar("TEST_SUITES_TAGS", True)
     # the robot dance
     target = get_target_controller(d)
 
@@ -228,6 +228,7 @@ def testimage_main(d):
         def __init__(self):
             self.d = d
             self.testslist = testslist
+            self.tagexp = tagexp
             self.testsrequired = testsrequired
             self.filesdir = os.path.join(os.path.dirname(os.path.abspath(oeqa.runtime.__file__)),"files")
             self.target = target
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index dfed3de..b026cde 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -13,7 +13,31 @@ import inspect
 import subprocess
 import datetime
 import bb
-from oeqa.utils.decorators import LogResults
+from oeqa.utils.decorators import LogResults, gettag
+
+def getVar(obj):
+    #extend form dict, if a variable didn't exists, need find it in testcase
+    class VarDict(dict):
+        def __getitem__(self, key):
+            return gettag(obj, key)
+    return VarDict()
+
+def checkTags(tc, tagexp):
+    return eval(tagexp, None, getVar(tc))
+
+
+def filterByTagExp(testsuite, tagexp):
+    if not tagexp:
+        return testsuite
+    caseList = []
+    for each in testsuite:
+        if not isinstance(each, unittest.BaseTestSuite):
+            if checkTags(each, tagexp):
+                caseList.append(each)
+        else:
+            caseList.append(filterByTagExp(each, tagexp))
+    return testsuite.__class__(caseList)
+
 
 def loadTests(tc, type="runtime"):
     if type == "runtime":
@@ -29,6 +53,7 @@ def loadTests(tc, type="runtime"):
     testloader = unittest.TestLoader()
     testloader.sortTestMethodsUsing = None
     suites = [testloader.loadTestsFromName(name) for name in tc.testslist]
+    suites = filterByTagExp(suites, getattr(tc, "tagexp", None))
 
     def getTests(test):
         '''Return all individual tests executed when running the suite.'''
@@ -86,6 +111,8 @@ def runTests(tc, type="runtime"):
 
     suite = loadTests(tc, type)
     bb.note("Test modules  %s" % tc.testslist)
+    if hasattr(tc, "tagexp") and tc.tagexp:
+        bb.note("Filter test cases by tags: %s" % tc.tagexp)
     bb.note("Found %s tests" % suite.countTestCases())
     runner = unittest.TextTestRunner(verbosity=2)
     result = runner.run(suite)
diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index b9fc76c..769b4ff 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -185,4 +185,36 @@ def timeout(seconds):
             return wrapped_f
         else:
             return fn
-    return decorator
\ No newline at end of file
+    return decorator
+
+__tag_prefix = "tag__"
+def tag(*args, **kwargs):
+    """Decorator that adds attributes to classes or functions
+    for use with the Attribute (-a) plugin.
+    """
+    def wrap_ob(ob):
+        for name in args:
+            setattr(ob, __tag_prefix + name, True)
+        for name, value in kwargs.iteritems():
+            setattr(ob, __tag_prefix + name, value)
+        return ob
+    return wrap_ob
+
+def gettag(obj, key, default=None):
+    key = __tag_prefix + key
+    if not isinstance(obj, unittest.TestCase):
+        return getattr(obj, key, default)
+    tc_method = getattr(obj, obj._testMethodName)
+    ret = getattr(tc_method, key, getattr(obj, key, default))
+    return ret
+
+def getAllTags(obj):
+    def __gettags(o):
+        r = {k[len(__tag_prefix):]:getattr(o,k) for k in dir(o) if k.startswith(__tag_prefix)}
+        return r
+    if not isinstance(obj, unittest.TestCase):
+        return __gettags(obj)
+    tc_method = getattr(obj, obj._testMethodName)
+    ret = __gettags(obj)
+    ret.update(__gettags(tc_method))
+    return ret
-- 
1.9.1


