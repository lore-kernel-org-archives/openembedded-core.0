Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0BD0D71AEE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 21:51:31 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 06 Dec 2016 13:51:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,310,1477983600"; d="scan'208";a="39533305"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by orsmga005.jf.intel.com with ESMTP; 06 Dec 2016 13:51:32 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 15:44:01 -0600
Message-Id: <2b7e685f6ff33f4c12d0f4d025db3689df43ad83.1481059445.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481059445.git.anibal.limon@linux.intel.com>
References: <cover.1481059445.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1481059445.git.anibal.limon@linux.intel.com>
References: <cover.1481059445.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 16/32] oeqa/core: Change name of d to td
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
X-List-Received-Date: Tue, 06 Dec 2016 21:51:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The d variable references the test data into a test context, so
makes a more sense to call it: td (test data).

[YOCTO #10231]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/case.py                     | 22 ++++++++++----------
 meta/lib/oeqa/core/cases/example/test_basic.py |  8 ++++----
 meta/lib/oeqa/core/context.py                  | 28 +++++++++++++-------------
 meta/lib/oeqa/core/decorator/data.py           | 10 ++++-----
 meta/lib/oeqa/core/loader.py                   |  2 +-
 meta/lib/oeqa/core/tests/cases/data.py         |  6 +++---
 6 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/meta/lib/oeqa/core/case.py b/meta/lib/oeqa/core/case.py
index a47cb19..d2dbf20 100644
--- a/meta/lib/oeqa/core/case.py
+++ b/meta/lib/oeqa/core/case.py
@@ -5,30 +5,30 @@ import unittest
 
 from oeqa.core.exception import OEQAMissingVariable
 
-def _validate_data_vars(d, data_vars, type_msg):
-    if data_vars:
-        for v in data_vars:
-            if not v in d:
+def _validate_td_vars(td, td_vars, type_msg):
+    if td_vars:
+        for v in td_vars:
+            if not v in td:
                 raise OEQAMissingVariable("Test %s need %s variable but"\
-                        " isn't into d" % (type_msg, v))
+                        " isn't into td" % (type_msg, v))
 
 class OETestCase(unittest.TestCase):
     # TestContext and Logger instance set by OETestLoader.
     tc = None
     logger = None
 
-    # d has all the variables needed by the test cases
+    # td has all the variables needed by the test cases
     # is the same across all the test cases.
-    d = None
+    td = None
 
-    # data_vars has the variables needed by a test class
-    # or test case instance, if some var isn't into d a
+    # td_vars has the variables needed by a test class
+    # or test case instance, if some var isn't into td a
     # OEMissingVariable exception is raised
-    data_vars = None
+    td_vars = None
 
     @classmethod
     def _oeSetUpClass(clss):
-        _validate_data_vars(clss.d, clss.data_vars, "class")
+        _validate_td_vars(clss.td, clss.td_vars, "class")
         clss.setUpClassMethod()
 
     @classmethod
diff --git a/meta/lib/oeqa/core/cases/example/test_basic.py b/meta/lib/oeqa/core/cases/example/test_basic.py
index 8b404fe..11cf380 100644
--- a/meta/lib/oeqa/core/cases/example/test_basic.py
+++ b/meta/lib/oeqa/core/cases/example/test_basic.py
@@ -6,10 +6,10 @@ from oeqa.core.decorator.depends import OETestDepends
 
 class OETestExample(OETestCase):
     def test_example(self):
-        self.logger.info('IMAGE: %s' % self.d.get('IMAGE'))
-        self.assertEqual('core-image-minimal', self.d.get('IMAGE'))
-        self.logger.info('ARCH: %s' % self.d.get('ARCH'))
-        self.assertEqual('x86', self.d.get('ARCH'))
+        self.logger.info('IMAGE: %s' % self.td.get('IMAGE'))
+        self.assertEqual('core-image-minimal', self.td.get('IMAGE'))
+        self.logger.info('ARCH: %s' % self.td.get('ARCH'))
+        self.assertEqual('x86', self.td.get('ARCH'))
 
 class OETestExampleDepend(OETestCase):
     @OETestDepends(['OETestExample.test_example'])
diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index c7d6db3..316f90f 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -20,11 +20,11 @@ class OETestContext(object):
     files_dir = os.path.abspath(os.path.join(os.path.dirname(
         os.path.abspath(__file__)), "../files"))
 
-    def __init__(self, d=None, logger=None):
-        if not type(d) is dict:
-            raise TypeError("d isn't dictionary type")
+    def __init__(self, td=None, logger=None):
+        if not type(td) is dict:
+            raise TypeError("td isn't dictionary type")
 
-        self.d = d
+        self.td = td
         self.logger = logger
         self._registry = {}
         self._registry['cases'] = collections.OrderedDict()
@@ -148,7 +148,7 @@ class OETestContextExecutor(object):
 
     default_cases = [os.path.join(os.path.abspath(os.path.dirname(__file__)),
             'cases/example')]
-    default_data = os.path.join(default_cases[0], 'data.json')
+    default_test_data = os.path.join(default_cases[0], 'data.json')
 
     def register_commands(self, logger, subparsers):
         self.parser = subparsers.add_parser(self.name, help=self.help,
@@ -160,12 +160,12 @@ class OETestContextExecutor(object):
                 default=self.default_output_log,
                 help="results output log, default: %s" % self.default_output_log)
 
-        if self.default_data:
-            self.parser.add_argument('--data-file', action='store',
-                    default=self.default_data,
-                    help="data file to load, default: %s" % self.default_data)
+        if self.default_test_data:
+            self.parser.add_argument('--test-data-file', action='store',
+                    default=self.default_test_data,
+                    help="data file to load, default: %s" % self.default_test_data)
         else:
-            self.parser.add_argument('--data-file', action='store',
+            self.parser.add_argument('--test-data-file', action='store',
                     help="data file to load")
 
         if self.default_cases:
@@ -197,11 +197,11 @@ class OETestContextExecutor(object):
         self.tc_kwargs['run'] = {}
 
         self.tc_kwargs['init']['logger'] = self._setup_logger(logger, args)
-        if args.data_file:
-            self.tc_kwargs['init']['d'] = json.load(
-                    open(args.data_file, "r"))
+        if args.test_data_file:
+            self.tc_kwargs['init']['td'] = json.load(
+                    open(args.test_data_file, "r"))
         else:
-            self.tc_kwargs['init']['d'] = {}
+            self.tc_kwargs['init']['td'] = {}
 
         self.module_paths = args.CASES_PATHS
 
diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/decorator/data.py
index 51ef6fe..73cca88 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -20,17 +20,17 @@ class skipIfDataVar(OETestDecorator):
     def setUpDecorator(self):
         msg = 'Checking if %r value is %r to skip test' % (self.var, self.value)
         self.logger.debug(msg)
-        if self.case.tc.d.get(self.var) == self.value:
+        if self.case.td.get(self.var) == self.value:
             self.case.skipTest(self.msg)
 
 @registerDecorator
 class OETestDataDepends(OETestDecorator):
-    attrs = ('data_depends',)
+    attrs = ('td_depends',)
 
     def setUpDecorator(self):
-        for v in self.data_depends:
+        for v in self.td_depends:
             try:
-                value = self.case.d[v]
+                value = self.case.td[v]
             except KeyError:
                 raise OEQAMissingVariable("Test case need %s variable but"\
-                        " isn't into d" % v)
+                        " isn't into td" % v)
diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 94f71ba..c73ef9a 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -66,7 +66,7 @@ class OETestLoader(unittest.TestLoader):
     def _patchCaseClass(self, testCaseClass):
         # Adds custom attributes to the OETestCase class
         setattr(testCaseClass, 'tc', self.tc)
-        setattr(testCaseClass, 'd', self.tc.d)
+        setattr(testCaseClass, 'td', self.tc.td)
         setattr(testCaseClass, 'logger', self.tc.logger)
 
     def _validateFilters(self, filters, decorator_filters):
diff --git a/meta/lib/oeqa/core/tests/cases/data.py b/meta/lib/oeqa/core/tests/cases/data.py
index 4d8fad0..88003a6 100644
--- a/meta/lib/oeqa/core/tests/cases/data.py
+++ b/meta/lib/oeqa/core/tests/cases/data.py
@@ -11,9 +11,9 @@ class DataTest(OETestCase):
     @OETestDataDepends(['MACHINE',])
     @OETestTag('dataTestOk')
     def testDataOk(self):
-        self.assertEqual(self.d.get('IMAGE'), 'core-image-minimal')
-        self.assertEqual(self.d.get('ARCH'), 'x86')
-        self.assertEqual(self.d.get('MACHINE'), 'qemuarm')
+        self.assertEqual(self.td.get('IMAGE'), 'core-image-minimal')
+        self.assertEqual(self.td.get('ARCH'), 'x86')
+        self.assertEqual(self.td.get('MACHINE'), 'qemuarm')
 
     @OETestTag('dataTestFail')
     def testDataFail(self):
-- 
2.1.4


