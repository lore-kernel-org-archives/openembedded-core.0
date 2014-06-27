Return-Path: <georgex.l.musat@intel.com>
X-Greylist: delayed 581 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 27 Jun 2014 14:44:16 UTC
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DC85160144
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jun 2014 14:44:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 27 Jun 2014 07:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,560,1400050800"; d="scan'208";a="554199569"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jun 2014 07:34:36 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id DB6A56A4087;
	Fri, 27 Jun 2014 07:34:04 -0700 (PDT)
From: Lucian Musat <georgex.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jun 2014 17:32:13 +0300
Message-Id: <1403879533-20717-1-git-send-email-georgex.l.musat@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] Added testcase decorator to use in logging. Added class decorator LogResults that outputs test results in separate log file.
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
X-List-Received-Date: Fri, 27 Jun 2014 14:44:25 -0000

Signed-off-by: Lucian Musat <georgex.l.musat@intel.com>
---
 meta/lib/oeqa/selftest/base.py     |  2 ++
 meta/lib/oeqa/selftest/bblayers.py |  6 ++++
 meta/lib/oeqa/utils/decorators.py  | 66 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+)

diff --git a/meta/lib/oeqa/selftest/base.py b/meta/lib/oeqa/selftest/base.py
index fc880e9..80b9b4b 100644
--- a/meta/lib/oeqa/selftest/base.py
+++ b/meta/lib/oeqa/selftest/base.py
@@ -15,7 +15,9 @@ import errno
 
 import oeqa.utils.ftools as ftools
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
+from oeqa.utils.decorators import LogResults
 
+@LogResults
 class oeSelfTest(unittest.TestCase):
 
     log = logging.getLogger("selftest.base")
diff --git a/meta/lib/oeqa/selftest/bblayers.py b/meta/lib/oeqa/selftest/bblayers.py
index 52aa4f8..1ead8e8 100644
--- a/meta/lib/oeqa/selftest/bblayers.py
+++ b/meta/lib/oeqa/selftest/bblayers.py
@@ -7,25 +7,31 @@ import shutil
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd
+from oeqa.utils.decorators import testcase
 
 class BitbakeLayers(oeSelfTest):
 
+    @testcase(756)
     def test_bitbakelayers_showcrossdepends(self):
         result = runCmd('bitbake-layers show-cross-depends')
         self.assertTrue('aspell' in result.output)
 
+    @testcase(83)
     def test_bitbakelayers_showlayers(self):
         result = runCmd('bitbake-layers show_layers')
         self.assertTrue('meta-selftest' in result.output)
 
+    @testcase(93)
     def test_bitbakelayers_showappends(self):
         result = runCmd('bitbake-layers show_appends')
         self.assertTrue('xcursor-transparent-theme_0.1.1.bbappend' in result.output, msg='xcursor-transparent-theme_0.1.1.bbappend file was not recognised')
 
+    @testcase(90)
     def test_bitbakelayers_showoverlayed(self):
         result = runCmd('bitbake-layers show_overlayed')
         self.assertTrue('aspell' in result.output, msg='xcursor-transparent-theme_0.1.1.bbappend file was not recognised')
 
+    @testcase(95)
     def test_bitbakelayers_flatten(self):
         self.assertFalse(os.path.isdir(os.path.join(self.builddir, 'test')))
         result = runCmd('bitbake-layers flatten test')
diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index b99da8d..a0d94e6 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -7,6 +7,8 @@
 # creating dependecies between two test methods.
 
 from oeqa.oetest import *
+import logging
+import sys
 
 class skipIfFailure(object):
 
@@ -48,3 +50,67 @@ class skipUnlessPassed(object):
             return f(*args)
         wrapped_f.__name__ = f.__name__
         return wrapped_f
+
+class testcase(object):
+
+    def __init__(self, test_case):
+        self.test_case = test_case
+
+    def __call__(self, func):
+	def wrapped_f(*args):
+		return func(*args)
+	wrapped_f.test_case = self.test_case
+	return wrapped_f
+
+def LogResults(original_class):
+    orig_method = original_class.run
+
+    #rewrite the run method of unittest.TestCase to add testcase logging
+    def run(self, result, *args, **kws):
+        orig_method(self, result, *args, **kws)
+	passed = True
+	testMethod = getattr(self, self._testMethodName)
+
+	#if test case is decorated then use it's number, else use it's name
+	try:
+		test_case = testMethod.test_case
+	except AttributeError:
+		test_case = self._testMethodName
+
+	#create custom logging level for filtering.
+	custom_log_level = 100
+	logging.addLevelName(custom_log_level, 'RESULTS')
+	caller = os.path.basename(sys.argv[0])
+
+	def results(self, message, *args, **kws):
+	    if self.isEnabledFor(custom_log_level):
+		self.log(custom_log_level, message, *args, **kws)
+	logging.Logger.results = results
+
+	logging.basicConfig(filename=os.path.join(os.getcwd(),'results-'+caller+'.log'),
+                            filemode='w',
+                            format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
+                            datefmt='%H:%M:%S',
+                            level=custom_log_level)
+	local_log = logging.getLogger(caller)
+
+	#check status of tests and record it
+        for (name, msg) in result.errors:
+                if self._testMethodName == str(name).split(' ')[0]:
+			local_log.results("Testcase "+str(test_case)+": ERROR")
+			local_log.results("Testcase "+str(test_case)+":\n"+msg)
+			passed = False
+        for (name, msg) in result.failures:
+                if self._testMethodName == str(name).split(' ')[0]:
+			local_log.results("Testcase "+str(test_case)+": FAILED")
+			local_log.results("Testcase "+str(test_case)+":\n"+msg)
+			passed = False
+        for (name, msg) in result.skipped:
+                if self._testMethodName == str(name).split(' ')[0]:
+			local_log.results("Testcase "+str(test_case)+": SKIPPED")
+			passed = False
+	if passed:
+			local_log.results("Testcase "+str(test_case)+": PASSED")
+
+    original_class.run = run
+    return original_class
-- 
1.9.1


