Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E06D171D79
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 19:48:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 10 May 2017 12:48:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,320,1491289200"; d="scan'208";a="1128735204"
Received: from rnpawar-mobl3.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.254.59.138])
	by orsmga001.jf.intel.com with ESMTP; 10 May 2017 12:48:04 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 14:47:15 -0500
Message-Id: <98bd03f8c6a00c44b4aa49cf64dd92887037d841.1494445222.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1494445222.git.anibal.limon@linux.intel.com>
References: <cover.1494445222.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1494445222.git.anibal.limon@linux.intel.com>
References: <cover.1494445222.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, juan.m.cruz.alcaraz@intel.com
Subject: [PATCH 15/17] oeqa/core/tests: Add tests of OEQA Threaded mode
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
X-List-Received-Date: Wed, 10 May 2017 19:48:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add needed tests to validate the OEQA Threaded mode, the remaining
parts are tested by the OEQA without Threaded mode.

- test_loader.py: Add a test to validate rules when creating the
list of test suites.
- test_decorators.py: Add oetimeout test because the threaded mode
uses Timer instead of signal.

[YOCTO #11450]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../core/tests/cases/loader/threaded/threaded.py   | 12 +++++++++
 .../tests/cases/loader/threaded/threaded_alone.py  |  8 ++++++
 .../cases/loader/threaded/threaded_depends.py      | 10 ++++++++
 .../tests/cases/loader/threaded/threaded_module.py | 12 +++++++++
 meta/lib/oeqa/core/tests/common.py                 | 10 ++++++++
 meta/lib/oeqa/core/tests/test_decorators.py        | 12 +++++++++
 meta/lib/oeqa/core/tests/test_loader.py            | 30 +++++++++++++++++++++-
 7 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/core/tests/cases/loader/threaded/threaded.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_alone.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_depends.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_module.py

diff --git a/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded.py b/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded.py
new file mode 100644
index 0000000..0fe4cb3
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded.py
@@ -0,0 +1,12 @@
+# Copyright (C) 2017 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+from oeqa.core.case import OETestCase
+
+class ThreadedTest(OETestCase):
+    def test_threaded_no_depends(self):
+        self.assertTrue(True, msg='How is this possible?')
+
+class ThreadedTest2(OETestCase):
+    def test_threaded_same_module(self):
+        self.assertTrue(True, msg='How is this possible?')
diff --git a/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_alone.py b/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_alone.py
new file mode 100644
index 0000000..905f397
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_alone.py
@@ -0,0 +1,8 @@
+# Copyright (C) 2017 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+from oeqa.core.case import OETestCase
+
+class ThreadedTestAlone(OETestCase):
+    def test_threaded_alone(self):
+        self.assertTrue(True, msg='How is this possible?')
diff --git a/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_depends.py b/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_depends.py
new file mode 100644
index 0000000..0c158d3
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_depends.py
@@ -0,0 +1,10 @@
+# Copyright (C) 2017 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+from oeqa.core.case import OETestCase
+from oeqa.core.decorator.depends import OETestDepends
+
+class ThreadedTest3(OETestCase):
+    @OETestDepends(['threaded.ThreadedTest.test_threaded_no_depends'])
+    def test_threaded_depends(self):
+        self.assertTrue(True, msg='How is this possible?')
diff --git a/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_module.py b/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_module.py
new file mode 100644
index 0000000..63d17e0
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_module.py
@@ -0,0 +1,12 @@
+# Copyright (C) 2017 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+from oeqa.core.case import OETestCase
+
+class ThreadedTestModule(OETestCase):
+    def test_threaded_module(self):
+        self.assertTrue(True, msg='How is this possible?')
+
+class ThreadedTestModule2(OETestCase):
+    def test_threaded_module2(self):
+        self.assertTrue(True, msg='How is this possible?')
diff --git a/meta/lib/oeqa/core/tests/common.py b/meta/lib/oeqa/core/tests/common.py
index 52b18a1..1932323 100644
--- a/meta/lib/oeqa/core/tests/common.py
+++ b/meta/lib/oeqa/core/tests/common.py
@@ -33,3 +33,13 @@ class TestBase(unittest.TestCase):
         tc.loadTests(self.cases_path, modules=modules, tests=tests,
                      filters=filters)
         return tc
+
+    def _testLoaderThreaded(self, d={}, modules=[],
+            tests=[], filters={}):
+        from oeqa.core.threaded import OETestContextThreaded
+
+        tc = OETestContextThreaded(d, self.logger)
+        tc.loadTests(self.cases_path, modules=modules, tests=tests,
+                     filters=filters)
+
+        return tc
diff --git a/meta/lib/oeqa/core/tests/test_decorators.py b/meta/lib/oeqa/core/tests/test_decorators.py
index f7d11e8..cf99e0d 100755
--- a/meta/lib/oeqa/core/tests/test_decorators.py
+++ b/meta/lib/oeqa/core/tests/test_decorators.py
@@ -131,5 +131,17 @@ class TestTimeoutDecorator(TestBase):
         msg = "OETestTimeout didn't restore SIGALRM"
         self.assertIs(alarm_signal, signal.getsignal(signal.SIGALRM), msg=msg)
 
+    def test_timeout_thread(self):
+        tests = ['timeout.TimeoutTest.testTimeoutPass']
+        msg = 'Failed to run test using OETestTimeout'
+        tc = self._testLoaderThreaded(modules=self.modules, tests=tests)
+        self.assertTrue(tc.runTests().wasSuccessful(), msg=msg)
+
+    def test_timeout_threaded_fail(self):
+        tests = ['timeout.TimeoutTest.testTimeoutFail']
+        msg = "OETestTimeout test didn't timeout as expected"
+        tc = self._testLoaderThreaded(modules=self.modules, tests=tests)
+        self.assertFalse(tc.runTests().wasSuccessful(), msg=msg)
+
 if __name__ == '__main__':
     unittest.main()
diff --git a/meta/lib/oeqa/core/tests/test_loader.py b/meta/lib/oeqa/core/tests/test_loader.py
index b79b8ba..e0d917d 100755
--- a/meta/lib/oeqa/core/tests/test_loader.py
+++ b/meta/lib/oeqa/core/tests/test_loader.py
@@ -1,6 +1,6 @@
 #!/usr/bin/env python3
 
-# Copyright (C) 2016 Intel Corporation
+# Copyright (C) 2016-2017 Intel Corporation
 # Released under the MIT license (see COPYING.MIT)
 
 import os
@@ -82,5 +82,33 @@ class TestLoader(TestBase):
         msg = 'Expected modules from two different paths'
         self.assertEqual(modules, expected_modules, msg=msg)
 
+    def test_loader_threaded(self):
+        cases_path = self.cases_path
+
+        self.cases_path = [os.path.join(self.cases_path, 'loader', 'threaded')]
+
+        tc = self._testLoaderThreaded()
+        self.assertEqual(len(tc.suites), 3, "Expected to be 3 suites")
+
+        case_ids = ['threaded.ThreadedTest.test_threaded_no_depends',
+                'threaded.ThreadedTest2.test_threaded_same_module',
+                'threaded_depends.ThreadedTest3.test_threaded_depends']
+        for case in tc.suites[0]._tests:
+            self.assertEqual(case.id(),
+                    case_ids[tc.suites[0]._tests.index(case)])
+
+        case_ids = ['threaded_alone.ThreadedTestAlone.test_threaded_alone']
+        for case in tc.suites[1]._tests:
+            self.assertEqual(case.id(),
+                    case_ids[tc.suites[1]._tests.index(case)])
+
+        case_ids = ['threaded_module.ThreadedTestModule.test_threaded_module',
+                'threaded_module.ThreadedTestModule2.test_threaded_module2']
+        for case in tc.suites[2]._tests:
+            self.assertEqual(case.id(),
+                    case_ids[tc.suites[2]._tests.index(case)])
+
+        self.cases_path = cases_path
+
 if __name__ == '__main__':
     unittest.main()
-- 
2.1.4


