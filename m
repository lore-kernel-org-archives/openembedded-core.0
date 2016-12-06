Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5FC5C71AB6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 21:51:30 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 06 Dec 2016 13:51:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,310,1477983600"; d="scan'208";a="39533282"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by orsmga005.jf.intel.com with ESMTP; 06 Dec 2016 13:51:29 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 15:43:53 -0600
Message-Id: <a8339e24d43392b7467829195e6482f06ae8a993.1481059445.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481059445.git.anibal.limon@linux.intel.com>
References: <cover.1481059445.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1481059445.git.anibal.limon@linux.intel.com>
References: <cover.1481059445.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 08/32] oeqa/core: Add tests for the OEQA framework
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
X-List-Received-Date: Tue, 06 Dec 2016 21:51:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This test suite covers the current functionality for the OEQA
framework.

For run certain test suite,

$ cd meta/lib/oeqa/core/tests
$ ./test_data.py

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/core/tests/__init__.py               |   0
 meta/lib/oeqa/core/tests/cases/data.py             |  20 +++
 meta/lib/oeqa/core/tests/cases/depends.py          |  38 ++++++
 .../oeqa/core/tests/cases/loader/invalid/oeid.py   |  15 +++
 .../oeqa/core/tests/cases/loader/valid/another.py  |   9 ++
 meta/lib/oeqa/core/tests/cases/oeid.py             |  18 +++
 meta/lib/oeqa/core/tests/cases/oetag.py            |  18 +++
 meta/lib/oeqa/core/tests/cases/timeout.py          |  18 +++
 meta/lib/oeqa/core/tests/common.py                 |  35 ++++++
 meta/lib/oeqa/core/tests/test_data.py              |  51 ++++++++
 meta/lib/oeqa/core/tests/test_decorators.py        | 135 +++++++++++++++++++++
 meta/lib/oeqa/core/tests/test_loader.py            |  86 +++++++++++++
 meta/lib/oeqa/core/tests/test_runner.py            |  38 ++++++
 13 files changed, 481 insertions(+)
 create mode 100644 meta/lib/oeqa/core/tests/__init__.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/data.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/depends.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/loader/invalid/oeid.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/loader/valid/another.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/oeid.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/oetag.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/timeout.py
 create mode 100644 meta/lib/oeqa/core/tests/common.py
 create mode 100755 meta/lib/oeqa/core/tests/test_data.py
 create mode 100755 meta/lib/oeqa/core/tests/test_decorators.py
 create mode 100755 meta/lib/oeqa/core/tests/test_loader.py
 create mode 100755 meta/lib/oeqa/core/tests/test_runner.py

diff --git a/meta/lib/oeqa/core/tests/__init__.py b/meta/lib/oeqa/core/tests/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/meta/lib/oeqa/core/tests/cases/data.py b/meta/lib/oeqa/core/tests/cases/data.py
new file mode 100644
index 0000000..4d8fad0
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/cases/data.py
@@ -0,0 +1,20 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+from oeqa.core.case import OETestCase
+from oeqa.core.decorator.oetag import OETestTag
+from oeqa.core.decorator.data import OETestDataDepends
+
+class DataTest(OETestCase):
+    data_vars = ['IMAGE', 'ARCH']
+
+    @OETestDataDepends(['MACHINE',])
+    @OETestTag('dataTestOk')
+    def testDataOk(self):
+        self.assertEqual(self.d.get('IMAGE'), 'core-image-minimal')
+        self.assertEqual(self.d.get('ARCH'), 'x86')
+        self.assertEqual(self.d.get('MACHINE'), 'qemuarm')
+
+    @OETestTag('dataTestFail')
+    def testDataFail(self):
+        pass
diff --git a/meta/lib/oeqa/core/tests/cases/depends.py b/meta/lib/oeqa/core/tests/cases/depends.py
new file mode 100644
index 0000000..17cdd90
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/cases/depends.py
@@ -0,0 +1,38 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+from oeqa.core.case import OETestCase
+from oeqa.core.decorator.depends import OETestDepends
+
+class DependsTest(OETestCase):
+
+    def testDependsFirst(self):
+        self.assertTrue(True, msg='How is this possible?')
+
+    @OETestDepends(['testDependsFirst'])
+    def testDependsSecond(self):
+        self.assertTrue(True, msg='How is this possible?')
+
+    @OETestDepends(['testDependsSecond'])
+    def testDependsThird(self):
+        self.assertTrue(True, msg='How is this possible?')
+
+    @OETestDepends(['testDependsSecond'])
+    def testDependsFourth(self):
+        self.assertTrue(True, msg='How is this possible?')
+
+    @OETestDepends(['testDependsThird', 'testDependsFourth'])
+    def testDependsFifth(self):
+        self.assertTrue(True, msg='How is this possible?')
+
+    @OETestDepends(['testDependsCircular3'])
+    def testDependsCircular1(self):
+        self.assertTrue(True, msg='How is this possible?')
+
+    @OETestDepends(['testDependsCircular1'])
+    def testDependsCircular2(self):
+        self.assertTrue(True, msg='How is this possible?')
+
+    @OETestDepends(['testDependsCircular2'])
+    def testDependsCircular3(self):
+        self.assertTrue(True, msg='How is this possible?')
diff --git a/meta/lib/oeqa/core/tests/cases/loader/invalid/oeid.py b/meta/lib/oeqa/core/tests/cases/loader/invalid/oeid.py
new file mode 100644
index 0000000..038d445
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/cases/loader/invalid/oeid.py
@@ -0,0 +1,15 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+from oeqa.core.case import OETestCase
+
+class AnotherIDTest(OETestCase):
+
+    def testAnotherIdGood(self):
+        self.assertTrue(True, msg='How is this possible?')
+
+    def testAnotherIdOther(self):
+        self.assertTrue(True, msg='How is this possible?')
+
+    def testAnotherIdNone(self):
+        self.assertTrue(True, msg='How is this possible?')
diff --git a/meta/lib/oeqa/core/tests/cases/loader/valid/another.py b/meta/lib/oeqa/core/tests/cases/loader/valid/another.py
new file mode 100644
index 0000000..c9ffd17
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/cases/loader/valid/another.py
@@ -0,0 +1,9 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+from oeqa.core.case import OETestCase
+
+class AnotherTest(OETestCase):
+
+    def testAnother(self):
+        self.assertTrue(True, msg='How is this possible?')
diff --git a/meta/lib/oeqa/core/tests/cases/oeid.py b/meta/lib/oeqa/core/tests/cases/oeid.py
new file mode 100644
index 0000000..c2d3d32
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/cases/oeid.py
@@ -0,0 +1,18 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+from oeqa.core.case import OETestCase
+from oeqa.core.decorator.oeid import OETestID
+
+class IDTest(OETestCase):
+
+    @OETestID(101)
+    def testIdGood(self):
+        self.assertTrue(True, msg='How is this possible?')
+
+    @OETestID(102)
+    def testIdOther(self):
+        self.assertTrue(True, msg='How is this possible?')
+
+    def testIdNone(self):
+        self.assertTrue(True, msg='How is this possible?')
diff --git a/meta/lib/oeqa/core/tests/cases/oetag.py b/meta/lib/oeqa/core/tests/cases/oetag.py
new file mode 100644
index 0000000..0cae02e
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/cases/oetag.py
@@ -0,0 +1,18 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+from oeqa.core.case import OETestCase
+from oeqa.core.decorator.oetag import OETestTag
+
+class TagTest(OETestCase):
+
+    @OETestTag('goodTag')
+    def testTagGood(self):
+        self.assertTrue(True, msg='How is this possible?')
+
+    @OETestTag('otherTag')
+    def testTagOther(self):
+        self.assertTrue(True, msg='How is this possible?')
+
+    def testTagNone(self):
+        self.assertTrue(True, msg='How is this possible?')
diff --git a/meta/lib/oeqa/core/tests/cases/timeout.py b/meta/lib/oeqa/core/tests/cases/timeout.py
new file mode 100644
index 0000000..870c3157
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/cases/timeout.py
@@ -0,0 +1,18 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+from time import sleep
+
+from oeqa.core.case import OETestCase
+from oeqa.core.decorator.oetimeout import OETimeout
+
+class TimeoutTest(OETestCase):
+
+    @OETimeout(1)
+    def testTimeoutPass(self):
+        self.assertTrue(True, msg='How is this possible?')
+
+    @OETimeout(1)
+    def testTimeoutFail(self):
+        sleep(2)
+        self.assertTrue(True, msg='How is this possible?')
diff --git a/meta/lib/oeqa/core/tests/common.py b/meta/lib/oeqa/core/tests/common.py
new file mode 100644
index 0000000..52b18a1
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/common.py
@@ -0,0 +1,35 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import sys
+import os
+
+import unittest
+import logging
+import os
+
+logger = logging.getLogger("oeqa")
+logger.setLevel(logging.INFO)
+consoleHandler = logging.StreamHandler()
+formatter = logging.Formatter('OEQATest: %(message)s')
+consoleHandler.setFormatter(formatter)
+logger.addHandler(consoleHandler)
+
+def setup_sys_path():
+    directory = os.path.dirname(os.path.abspath(__file__))
+    oeqa_lib = os.path.realpath(os.path.join(directory, '../../../'))
+    if not oeqa_lib in sys.path:
+        sys.path.insert(0, oeqa_lib)
+
+class TestBase(unittest.TestCase):
+    def setUp(self):
+        self.logger = logger
+        directory = os.path.dirname(os.path.abspath(__file__))
+        self.cases_path = os.path.join(directory, 'cases')
+
+    def _testLoader(self, d={}, modules=[], tests=[], filters={}):
+        from oeqa.core.context import OETestContext
+        tc = OETestContext(d, self.logger)
+        tc.loadTests(self.cases_path, modules=modules, tests=tests,
+                     filters=filters)
+        return tc
diff --git a/meta/lib/oeqa/core/tests/test_data.py b/meta/lib/oeqa/core/tests/test_data.py
new file mode 100755
index 0000000..320468c
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/test_data.py
@@ -0,0 +1,51 @@
+#!/usr/bin/env python3
+
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import unittest
+import logging
+import os
+
+from common import setup_sys_path, TestBase
+setup_sys_path()
+
+from oeqa.core.exception import OEQAMissingVariable
+from oeqa.core.utils.test import getCaseMethod, getSuiteCasesNames
+
+class TestData(TestBase):
+    modules = ['data']
+
+    def test_data_fail_missing_variable(self):
+        expectedException = "oeqa.core.exception.OEQAMissingVariable"
+
+        tc = self._testLoader(modules=self.modules)
+        self.assertEqual(False, tc.runTests().wasSuccessful())
+        for test, data in tc._results['errors']:
+            expect = False
+            if expectedException in data:
+                expect = True
+
+            self.assertTrue(expect)
+
+    def test_data_fail_wrong_variable(self):
+        expectedError = 'AssertionError'
+        d = {'IMAGE' : 'core-image-sato', 'ARCH' : 'arm'}
+
+        tc = self._testLoader(d=d, modules=self.modules)
+        self.assertEqual(False, tc.runTests().wasSuccessful())
+        for test, data in tc._results['failures']:
+            expect = False
+            if expectedError in data:
+                expect = True
+
+            self.assertTrue(expect)
+
+    def test_data_ok(self):
+        d = {'IMAGE' : 'core-image-minimal', 'ARCH' : 'x86', 'MACHINE' : 'qemuarm'}
+
+        tc = self._testLoader(d=d, modules=self.modules)
+        self.assertEqual(True, tc.runTests().wasSuccessful())
+
+if __name__ == '__main__':
+    unittest.main()
diff --git a/meta/lib/oeqa/core/tests/test_decorators.py b/meta/lib/oeqa/core/tests/test_decorators.py
new file mode 100755
index 0000000..f7d11e8
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/test_decorators.py
@@ -0,0 +1,135 @@
+#!/usr/bin/env python3
+
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import signal
+import unittest
+
+from common import setup_sys_path, TestBase
+setup_sys_path()
+
+from oeqa.core.exception import OEQADependency
+from oeqa.core.utils.test import getCaseMethod, getSuiteCasesNames, getSuiteCasesIDs
+
+class TestFilterDecorator(TestBase):
+
+    def _runFilterTest(self, modules, filters, expect, msg):
+        tc = self._testLoader(modules=modules, filters=filters)
+        test_loaded = set(getSuiteCasesNames(tc.suites))
+        self.assertEqual(expect, test_loaded, msg=msg)
+
+    def test_oetag(self):
+        # Get all cases without filtering.
+        filter_all = {}
+        test_all = {'testTagGood', 'testTagOther', 'testTagNone'}
+        msg_all = 'Failed to get all oetag cases without filtering.'
+
+        # Get cases with 'goodTag'.
+        filter_good = {'oetag':'goodTag'}
+        test_good = {'testTagGood'}
+        msg_good = 'Failed to get just one test filtering with "goodTag" oetag.'
+
+        # Get cases with an invalid tag.
+        filter_invalid = {'oetag':'invalidTag'}
+        test_invalid = set()
+        msg_invalid = 'Failed to filter all test using an invalid oetag.'
+
+        tests = ((filter_all, test_all, msg_all),
+                 (filter_good, test_good, msg_good),
+                 (filter_invalid, test_invalid, msg_invalid))
+
+        for test in tests:
+            self._runFilterTest(['oetag'], test[0], test[1], test[2])
+
+    def test_oeid(self):
+        # Get all cases without filtering.
+        filter_all = {}
+        test_all = {'testIdGood', 'testIdOther', 'testIdNone'}
+        msg_all = 'Failed to get all oeid cases without filtering.'
+
+        # Get cases with '101' oeid.
+        filter_good = {'oeid': 101}
+        test_good = {'testIdGood'}
+        msg_good = 'Failed to get just one tes filtering with "101" oeid.'
+
+        # Get cases with an invalid id.
+        filter_invalid = {'oeid':999}
+        test_invalid = set()
+        msg_invalid = 'Failed to filter all test using an invalid oeid.'
+
+        tests = ((filter_all, test_all, msg_all),
+                 (filter_good, test_good, msg_good),
+                 (filter_invalid, test_invalid, msg_invalid))
+
+        for test in tests:
+            self._runFilterTest(['oeid'], test[0], test[1], test[2])
+
+class TestDependsDecorator(TestBase):
+    modules = ['depends']
+
+    def test_depends_order(self):
+        tests =  ['depends.DependsTest.testDependsFirst',
+                  'depends.DependsTest.testDependsSecond',
+                  'depends.DependsTest.testDependsThird',
+                  'depends.DependsTest.testDependsFourth',
+                  'depends.DependsTest.testDependsFifth']
+        tests2 = list(tests)
+        tests2[2], tests2[3] = tests[3], tests[2]
+        tc = self._testLoader(modules=self.modules, tests=tests)
+        test_loaded = getSuiteCasesIDs(tc.suites)
+        result = True if test_loaded == tests or test_loaded == tests2 else False
+        msg = 'Failed to order tests using OETestDepends decorator.\nTest order:'\
+              ' %s.\nExpected:   %s\nOr:         %s' % (test_loaded, tests, tests2)
+        self.assertTrue(result, msg=msg)
+
+    def test_depends_fail_missing_dependency(self):
+        expect = "TestCase depends.DependsTest.testDependsSecond depends on "\
+                 "depends.DependsTest.testDependsFirst and isn't available"
+        tests =  ['depends.DependsTest.testDependsSecond']
+        try:
+            # Must throw OEQADependency because missing 'testDependsFirst'
+            tc = self._testLoader(modules=self.modules, tests=tests)
+            self.fail('Expected OEQADependency exception')
+        except OEQADependency as e:
+            result = True if expect in str(e) else False
+            msg = 'Expected OEQADependency exception missing testDependsFirst test'
+            self.assertTrue(result, msg=msg)
+
+    def test_depends_fail_circular_dependency(self):
+        expect = 'have a circular dependency'
+        tests =  ['depends.DependsTest.testDependsCircular1',
+                  'depends.DependsTest.testDependsCircular2',
+                  'depends.DependsTest.testDependsCircular3']
+        try:
+            # Must throw OEQADependency because circular dependency
+            tc = self._testLoader(modules=self.modules, tests=tests)
+            self.fail('Expected OEQADependency exception')
+        except OEQADependency as e:
+            result = True if expect in str(e) else False
+            msg = 'Expected OEQADependency exception having a circular dependency'
+            self.assertTrue(result, msg=msg)
+
+class TestTimeoutDecorator(TestBase):
+    modules = ['timeout']
+
+    def test_timeout(self):
+        tests = ['timeout.TimeoutTest.testTimeoutPass']
+        msg = 'Failed to run test using OETestTimeout'
+        alarm_signal = signal.getsignal(signal.SIGALRM)
+        tc = self._testLoader(modules=self.modules, tests=tests)
+        self.assertTrue(tc.runTests().wasSuccessful(), msg=msg)
+        msg = "OETestTimeout didn't restore SIGALRM"
+        self.assertIs(alarm_signal, signal.getsignal(signal.SIGALRM), msg=msg)
+
+    def test_timeout_fail(self):
+        tests = ['timeout.TimeoutTest.testTimeoutFail']
+        msg = "OETestTimeout test didn't timeout as expected"
+        alarm_signal = signal.getsignal(signal.SIGALRM)
+        tc = self._testLoader(modules=self.modules, tests=tests)
+        self.assertFalse(tc.runTests().wasSuccessful(), msg=msg)
+        msg = "OETestTimeout didn't restore SIGALRM"
+        self.assertIs(alarm_signal, signal.getsignal(signal.SIGALRM), msg=msg)
+
+if __name__ == '__main__':
+    unittest.main()
diff --git a/meta/lib/oeqa/core/tests/test_loader.py b/meta/lib/oeqa/core/tests/test_loader.py
new file mode 100755
index 0000000..b79b8ba
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/test_loader.py
@@ -0,0 +1,86 @@
+#!/usr/bin/env python3
+
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import os
+import unittest
+
+from common import setup_sys_path, TestBase
+setup_sys_path()
+
+from oeqa.core.exception import OEQADependency
+from oeqa.core.utils.test import getSuiteModules, getSuiteCasesIDs
+
+class TestLoader(TestBase):
+
+    def test_fail_empty_filter(self):
+        filters = {'oetag' : ''}
+        expect = 'Filter oetag specified is empty'
+        msg = 'Expected TypeError exception for having invalid filter'
+        try:
+            # Must throw TypeError because empty filter
+            tc = self._testLoader(filters=filters)
+            self.fail(msg)
+        except TypeError as e:
+            result = True if expect in str(e) else False
+            self.assertTrue(result, msg=msg)
+
+    def test_fail_invalid_filter(self):
+        filters = {'invalid' : 'good'}
+        expect = 'filter but not declared in any of'
+        msg = 'Expected TypeError exception for having invalid filter'
+        try:
+            # Must throw TypeError because invalid filter
+            tc = self._testLoader(filters=filters)
+            self.fail(msg)
+        except TypeError as e:
+            result = True if expect in str(e) else False
+            self.assertTrue(result, msg=msg)
+
+    def test_fail_duplicated_module(self):
+        cases_path = self.cases_path
+        invalid_path = os.path.join(cases_path, 'loader', 'invalid')
+        self.cases_path = [self.cases_path, invalid_path]
+        expect = 'Duplicated oeid module found in'
+        msg = 'Expected ImportError exception for having duplicated module'
+        try:
+            # Must throw ImportEror because duplicated module
+            tc = self._testLoader()
+            self.fail(msg)
+        except ImportError as e:
+            result = True if expect in str(e) else False
+            self.assertTrue(result, msg=msg)
+        finally:
+            self.cases_path = cases_path
+
+    def test_filter_modules(self):
+        expected_modules = {'oeid', 'oetag'}
+        tc = self._testLoader(modules=expected_modules)
+        modules = getSuiteModules(tc.suites)
+        msg = 'Expected just %s modules' % ', '.join(expected_modules)
+        self.assertEqual(modules, expected_modules, msg=msg)
+
+    def test_filter_cases(self):
+        modules = ['oeid', 'oetag', 'data']
+        expected_cases = {'data.DataTest.testDataOk',
+                          'oetag.TagTest.testTagGood',
+                          'oeid.IDTest.testIdGood'}
+        tc = self._testLoader(modules=modules, tests=expected_cases)
+        cases = set(getSuiteCasesIDs(tc.suites))
+        msg = 'Expected just %s cases' % ', '.join(expected_cases)
+        self.assertEqual(cases, expected_cases, msg=msg)
+
+    def test_import_from_paths(self):
+        cases_path = self.cases_path
+        cases2_path = os.path.join(cases_path, 'loader', 'valid')
+        expected_modules = {'oeid', 'another'}
+        self.cases_path = [self.cases_path, cases2_path]
+        tc = self._testLoader(modules=expected_modules)
+        modules = getSuiteModules(tc.suites)
+        self.cases_path = cases_path
+        msg = 'Expected modules from two different paths'
+        self.assertEqual(modules, expected_modules, msg=msg)
+
+if __name__ == '__main__':
+    unittest.main()
diff --git a/meta/lib/oeqa/core/tests/test_runner.py b/meta/lib/oeqa/core/tests/test_runner.py
new file mode 100755
index 0000000..a3f3861
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/test_runner.py
@@ -0,0 +1,38 @@
+#!/usr/bin/env python3
+
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import unittest
+import logging
+import tempfile
+
+from common import setup_sys_path, TestBase
+setup_sys_path()
+
+from oeqa.core.runner import OEStreamLogger
+
+class TestRunner(TestBase):
+    def test_stream_logger(self):
+        fp = tempfile.TemporaryFile(mode='w+')
+
+        logging.basicConfig(format='%(message)s', stream=fp)
+        logger = logging.getLogger()
+        logger.setLevel(logging.INFO)
+
+        oeSL = OEStreamLogger(logger)
+
+        lines = ['init', 'bigline_' * 65535, 'morebigline_' * 65535 * 4, 'end']
+        for line in lines:
+            oeSL.write(line)
+
+        fp.seek(0)
+        fp_lines = fp.readlines()
+        for i, fp_line in enumerate(fp_lines):
+            fp_line = fp_line.strip()
+            self.assertEqual(lines[i], fp_line)
+
+        fp.close()
+
+if __name__ == '__main__':
+    unittest.main()
-- 
2.1.4


