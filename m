Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 259BF71AC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 16:33:28 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id c13-v6so32519597wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 09:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dx/l+vgFpQj5SkiqQR/AvSoEPeQFxxyiDcdQ0+3Ks6g=;
	b=di54NxGzESjAM6fhyoZusnscirHxh6nH44QxhDU3Y9gzGC55cVQHWilTe1iFReLaVj
	3TMz4DtlYPUSgV4bu3aqRCyYCxA5sLMBrnFiv3CtzwJr0/3Bp9IjnYgtU2oFJNr+6RVV
	lL638LojPyEVEpT6Mn5u103ujJ+7DhM6XsCJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dx/l+vgFpQj5SkiqQR/AvSoEPeQFxxyiDcdQ0+3Ks6g=;
	b=SllMvWk7JzvWF5XmmzQ+72ftqL+zWdhq3fh4L1ucyum5I09+sNvfkNSw73iffOkP0/
	5nUNwL8SA8LhnI7gOOFrl8N5P634DyP9sGy8MBVBsVZCC08Vp/uNuQs594evIaujUsLu
	OwPCVLZS7Hlr1OGHd62/BJ0gyBsXDKYB48+sHpe+jkfdjBnrCVYSgfdJNKRr+RmzBPWz
	bS8wxtTLiXzbKWbcrMFxnQ+WPX/qJ8s95R2wVa1dXlpyKKju1rWInO4Cj6pmNDeraYYK
	kCzf56nZHJaKLgiodrcENGp2y/mZkHEebkbmxBzjzJyf3WwH9cAM577uKy2dXl538cRb
	YInQ==
X-Gm-Message-State: AOUpUlEegHg+Eg5LkURuGOjYQzRmbz/baTLjwry209onGPqqptTkgb2x
	NQ/3i6C1qim9+HG45vcOwD0ZQukKiZY=
X-Google-Smtp-Source: AAOMgpc0kR15WUmxjHryiPj1CjsKCHgHJzeIRy+59tAcJxoECrPE3cvNpvx/LVaPBNP7PXZeeq3uEg==
X-Received: by 2002:adf:ecc6:: with SMTP id
	s6-v6mr13284452wro.160.1531758809171; 
	Mon, 16 Jul 2018 09:33:29 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j65-v6sm13571188wmd.39.2018.07.16.09.33.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 09:33:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 17:33:21 +0100
Message-Id: <20180716163325.13847-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180716163325.13847-1-richard.purdie@linuxfoundation.org>
References: <20180716163325.13847-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/6] oeqa/core/threaded: Remove in favour of using concurrenttests
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
X-List-Received-Date: Mon, 16 Jul 2018 16:33:29 -0000

We have several options for parallel processing in oeqa, parallel
execution of modules, threading and mulitple processes for the runners.

After much experimentation is appears the most scalable and least
invasive approach is multiple processes using concurrenttestsuite
from testtools. This means we can drop the current threading code
which is only used by the sdk test execution.

oeqa/decorator/depends: Remove threading code

Revert "oeqa/sdk: Enable usage of OEQA thread mode"
This reverts commit adc434c0636b7dea2ef70c8d2c8e61cdb5c703b1.

Revert "oeqa/core/tests: Add tests of OEQA Threaded mode"
This reverts commit a4eef558c9933eb32413b61ff80a11b999951b40.

Revert "oeqa/core/decorator/oetimeout: Add support for OEQA threaded mode"
This reverts commit d3d4ba902dee8b19fa1054330cffdf73f9b81fe7.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testsdk.bbclass                  |   4 -
 meta/lib/oeqa/core/decorator/depends.py       |   7 +-
 meta/lib/oeqa/core/decorator/oetimeout.py     |  40 +--
 .../tests/cases/loader/threaded/threaded.py   |  12 -
 .../cases/loader/threaded/threaded_alone.py   |   8 -
 .../cases/loader/threaded/threaded_depends.py |  10 -
 .../cases/loader/threaded/threaded_module.py  |  12 -
 meta/lib/oeqa/core/tests/common.py            |  10 -
 meta/lib/oeqa/core/tests/test_decorators.py   |  12 -
 meta/lib/oeqa/core/tests/test_loader.py       |  30 +-
 meta/lib/oeqa/core/threaded.py                | 275 ------------------
 meta/lib/oeqa/sdk/context.py                  |   5 +-
 12 files changed, 14 insertions(+), 411 deletions(-)
 delete mode 100644 meta/lib/oeqa/core/tests/cases/loader/threaded/threaded.py
 delete mode 100644 meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_alone.py
 delete mode 100644 meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_depends.py
 delete mode 100644 meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_module.py
 delete mode 100644 meta/lib/oeqa/core/threaded.py

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index e6e3c74bdb6..2b5d66b1931 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -24,8 +24,6 @@ def testsdk_main(d):
     from oeqa.sdk.context import OESDKTestContext, OESDKTestContextExecutor
     from oeqa.utils import make_logger_bitbake_compatible
 
-    bb.event.enable_threadlock()
-
     pn = d.getVar("PN")
     logger = make_logger_bitbake_compatible(logging.getLogger("BitBake"))
 
@@ -99,8 +97,6 @@ def testsdkext_main(d):
     from oeqa.utils import avoid_paths_in_environ, make_logger_bitbake_compatible, subprocesstweak
     from oeqa.sdkext.context import OESDKExtTestContext, OESDKExtTestContextExecutor
 
-    bb.event.enable_threadlock()
-
     pn = d.getVar("PN")
     logger = make_logger_bitbake_compatible(logging.getLogger("BitBake"))
 
diff --git a/meta/lib/oeqa/core/decorator/depends.py b/meta/lib/oeqa/core/decorator/depends.py
index baa04341c71..99eccc12685 100644
--- a/meta/lib/oeqa/core/decorator/depends.py
+++ b/meta/lib/oeqa/core/decorator/depends.py
@@ -3,7 +3,6 @@
 
 from unittest import SkipTest
 
-from oeqa.core.threaded import OETestRunnerThreaded
 from oeqa.core.exception import OEQADependency
 
 from . import OETestDiscover, registerDecorator
@@ -64,11 +63,7 @@ def _order_test_case_by_depends(cases, depends):
     return [cases[case_id] for case_id in cases_ordered]
 
 def _skipTestDependency(case, depends):
-    if isinstance(case.tc.runner, OETestRunnerThreaded):
-        import threading
-        results = case.tc._results[threading.get_ident()]
-    else:
-        results = case.tc._results
+    results = case.tc._results
 
     skipReasons = ['errors', 'failures', 'skipped']
 
diff --git a/meta/lib/oeqa/core/decorator/oetimeout.py b/meta/lib/oeqa/core/decorator/oetimeout.py
index f85e7d97923..a247583f7f1 100644
--- a/meta/lib/oeqa/core/decorator/oetimeout.py
+++ b/meta/lib/oeqa/core/decorator/oetimeout.py
@@ -1,12 +1,8 @@
 # Copyright (C) 2016 Intel Corporation
 # Released under the MIT license (see COPYING.MIT)
 
-from . import OETestDecorator, registerDecorator
-
 import signal
-from threading import Timer
-
-from oeqa.core.threaded import OETestRunnerThreaded
+from . import OETestDecorator, registerDecorator
 from oeqa.core.exception import OEQATimeoutError
 
 @registerDecorator
@@ -14,32 +10,16 @@ class OETimeout(OETestDecorator):
     attrs = ('oetimeout',)
 
     def setUpDecorator(self):
-        self.logger.debug("Setting up a %d second(s) timeout" % self.oetimeout)
-
-        if isinstance(self.case.tc.runner, OETestRunnerThreaded):
-            self.timeouted = False
-            def _timeoutHandler():
-                self.timeouted = True
-
-            self.timer = Timer(self.oetimeout, _timeoutHandler)
-            self.timer.start()
-        else:
-            timeout = self.oetimeout
-            def _timeoutHandler(signum, frame):
-                raise OEQATimeoutError("Timed out after %s "
+        timeout = self.oetimeout
+        def _timeoutHandler(signum, frame):
+            raise OEQATimeoutError("Timed out after %s "
                     "seconds of execution" % timeout)
 
-            self.alarmSignal = signal.signal(signal.SIGALRM, _timeoutHandler)
-            signal.alarm(self.oetimeout)
+        self.logger.debug("Setting up a %d second(s) timeout" % self.oetimeout)
+        self.alarmSignal = signal.signal(signal.SIGALRM, _timeoutHandler)
+        signal.alarm(self.oetimeout)
 
     def tearDownDecorator(self):
-        if isinstance(self.case.tc.runner, OETestRunnerThreaded):
-            self.timer.cancel()
-            self.logger.debug("Removed Timer handler")
-            if self.timeouted:
-                raise OEQATimeoutError("Timed out after %s "
-                    "seconds of execution" % self.oetimeout)
-        else:
-            signal.alarm(0)
-            signal.signal(signal.SIGALRM, self.alarmSignal)
-            self.logger.debug("Removed SIGALRM handler")
+        signal.alarm(0)
+        signal.signal(signal.SIGALRM, self.alarmSignal)
+        self.logger.debug("Removed SIGALRM handler")
diff --git a/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded.py b/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded.py
deleted file mode 100644
index 0fe4cb3f116..00000000000
--- a/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded.py
+++ /dev/null
@@ -1,12 +0,0 @@
-# Copyright (C) 2017 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
-
-from oeqa.core.case import OETestCase
-
-class ThreadedTest(OETestCase):
-    def test_threaded_no_depends(self):
-        self.assertTrue(True, msg='How is this possible?')
-
-class ThreadedTest2(OETestCase):
-    def test_threaded_same_module(self):
-        self.assertTrue(True, msg='How is this possible?')
diff --git a/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_alone.py b/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_alone.py
deleted file mode 100644
index 905f397846b..00000000000
--- a/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_alone.py
+++ /dev/null
@@ -1,8 +0,0 @@
-# Copyright (C) 2017 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
-
-from oeqa.core.case import OETestCase
-
-class ThreadedTestAlone(OETestCase):
-    def test_threaded_alone(self):
-        self.assertTrue(True, msg='How is this possible?')
diff --git a/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_depends.py b/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_depends.py
deleted file mode 100644
index 0c158d3bacf..00000000000
--- a/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_depends.py
+++ /dev/null
@@ -1,10 +0,0 @@
-# Copyright (C) 2017 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
-
-from oeqa.core.case import OETestCase
-from oeqa.core.decorator.depends import OETestDepends
-
-class ThreadedTest3(OETestCase):
-    @OETestDepends(['threaded.ThreadedTest.test_threaded_no_depends'])
-    def test_threaded_depends(self):
-        self.assertTrue(True, msg='How is this possible?')
diff --git a/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_module.py b/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_module.py
deleted file mode 100644
index 63d17e04018..00000000000
--- a/meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_module.py
+++ /dev/null
@@ -1,12 +0,0 @@
-# Copyright (C) 2017 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
-
-from oeqa.core.case import OETestCase
-
-class ThreadedTestModule(OETestCase):
-    def test_threaded_module(self):
-        self.assertTrue(True, msg='How is this possible?')
-
-class ThreadedTestModule2(OETestCase):
-    def test_threaded_module2(self):
-        self.assertTrue(True, msg='How is this possible?')
diff --git a/meta/lib/oeqa/core/tests/common.py b/meta/lib/oeqa/core/tests/common.py
index 19323234094..52b18a1c3ea 100644
--- a/meta/lib/oeqa/core/tests/common.py
+++ b/meta/lib/oeqa/core/tests/common.py
@@ -33,13 +33,3 @@ class TestBase(unittest.TestCase):
         tc.loadTests(self.cases_path, modules=modules, tests=tests,
                      filters=filters)
         return tc
-
-    def _testLoaderThreaded(self, d={}, modules=[],
-            tests=[], filters={}):
-        from oeqa.core.threaded import OETestContextThreaded
-
-        tc = OETestContextThreaded(d, self.logger)
-        tc.loadTests(self.cases_path, modules=modules, tests=tests,
-                     filters=filters)
-
-        return tc
diff --git a/meta/lib/oeqa/core/tests/test_decorators.py b/meta/lib/oeqa/core/tests/test_decorators.py
index cf99e0d72da..f7d11e885a4 100755
--- a/meta/lib/oeqa/core/tests/test_decorators.py
+++ b/meta/lib/oeqa/core/tests/test_decorators.py
@@ -131,17 +131,5 @@ class TestTimeoutDecorator(TestBase):
         msg = "OETestTimeout didn't restore SIGALRM"
         self.assertIs(alarm_signal, signal.getsignal(signal.SIGALRM), msg=msg)
 
-    def test_timeout_thread(self):
-        tests = ['timeout.TimeoutTest.testTimeoutPass']
-        msg = 'Failed to run test using OETestTimeout'
-        tc = self._testLoaderThreaded(modules=self.modules, tests=tests)
-        self.assertTrue(tc.runTests().wasSuccessful(), msg=msg)
-
-    def test_timeout_threaded_fail(self):
-        tests = ['timeout.TimeoutTest.testTimeoutFail']
-        msg = "OETestTimeout test didn't timeout as expected"
-        tc = self._testLoaderThreaded(modules=self.modules, tests=tests)
-        self.assertFalse(tc.runTests().wasSuccessful(), msg=msg)
-
 if __name__ == '__main__':
     unittest.main()
diff --git a/meta/lib/oeqa/core/tests/test_loader.py b/meta/lib/oeqa/core/tests/test_loader.py
index e0d917d317d..b79b8bad4da 100755
--- a/meta/lib/oeqa/core/tests/test_loader.py
+++ b/meta/lib/oeqa/core/tests/test_loader.py
@@ -1,6 +1,6 @@
 #!/usr/bin/env python3
 
-# Copyright (C) 2016-2017 Intel Corporation
+# Copyright (C) 2016 Intel Corporation
 # Released under the MIT license (see COPYING.MIT)
 
 import os
@@ -82,33 +82,5 @@ class TestLoader(TestBase):
         msg = 'Expected modules from two different paths'
         self.assertEqual(modules, expected_modules, msg=msg)
 
-    def test_loader_threaded(self):
-        cases_path = self.cases_path
-
-        self.cases_path = [os.path.join(self.cases_path, 'loader', 'threaded')]
-
-        tc = self._testLoaderThreaded()
-        self.assertEqual(len(tc.suites), 3, "Expected to be 3 suites")
-
-        case_ids = ['threaded.ThreadedTest.test_threaded_no_depends',
-                'threaded.ThreadedTest2.test_threaded_same_module',
-                'threaded_depends.ThreadedTest3.test_threaded_depends']
-        for case in tc.suites[0]._tests:
-            self.assertEqual(case.id(),
-                    case_ids[tc.suites[0]._tests.index(case)])
-
-        case_ids = ['threaded_alone.ThreadedTestAlone.test_threaded_alone']
-        for case in tc.suites[1]._tests:
-            self.assertEqual(case.id(),
-                    case_ids[tc.suites[1]._tests.index(case)])
-
-        case_ids = ['threaded_module.ThreadedTestModule.test_threaded_module',
-                'threaded_module.ThreadedTestModule2.test_threaded_module2']
-        for case in tc.suites[2]._tests:
-            self.assertEqual(case.id(),
-                    case_ids[tc.suites[2]._tests.index(case)])
-
-        self.cases_path = cases_path
-
 if __name__ == '__main__':
     unittest.main()
diff --git a/meta/lib/oeqa/core/threaded.py b/meta/lib/oeqa/core/threaded.py
deleted file mode 100644
index 2cafe03a212..00000000000
--- a/meta/lib/oeqa/core/threaded.py
+++ /dev/null
@@ -1,275 +0,0 @@
-# Copyright (C) 2017 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
-
-import threading
-import multiprocessing
-import queue
-import time
-
-from unittest.suite import TestSuite
-
-from oeqa.core.loader import OETestLoader
-from oeqa.core.runner import OEStreamLogger, OETestResult, OETestRunner
-from oeqa.core.context import OETestContext
-
-class OETestLoaderThreaded(OETestLoader):
-    def __init__(self, tc, module_paths, modules, tests, modules_required,
-            filters, process_num=0, *args, **kwargs):
-        super(OETestLoaderThreaded, self).__init__(tc, module_paths, modules,
-                tests, modules_required, filters, *args, **kwargs)
-
-        self.process_num = process_num
-
-    def discover(self):
-        suite = super(OETestLoaderThreaded, self).discover()
-
-        if self.process_num <= 0:
-            self.process_num = min(multiprocessing.cpu_count(),
-                    len(suite._tests))
-
-        suites = []
-        for _ in range(self.process_num):
-            suites.append(self.suiteClass())
-
-        def _search_for_module_idx(suites, case):
-            """
-                Cases in the same module needs to be run
-                in the same thread because PyUnit keeps track
-                of setUp{Module, Class,} and tearDown{Module, Class,}.
-            """
-
-            for idx in range(self.process_num):
-                suite = suites[idx]
-                for c in suite._tests:
-                    if case.__module__ == c.__module__:
-                        return idx
-
-            return -1
-
-        def _search_for_depend_idx(suites, depends):
-            """
-                Dependency cases needs to be run in the same
-                thread, because OEQA framework look at the state
-                of dependant test to figure out if skip or not.
-            """
-
-            for idx in range(self.process_num):
-                suite = suites[idx]
-
-                for case in suite._tests:
-                    if case.id() in depends:
-                        return idx
-            return -1
-
-        def _get_best_idx(suites):
-            sizes = [len(suite._tests) for suite in suites]
-            return sizes.index(min(sizes))
-
-        def _fill_suites(suite):
-            idx = -1
-            for case in suite:
-                if isinstance(case, TestSuite):
-                    _fill_suites(case)
-                else:
-                    idx = _search_for_module_idx(suites, case)
-
-                    depends = {}
-                    if 'depends' in self.tc._registry:
-                        depends = self.tc._registry['depends']
-
-                    if idx == -1 and case.id() in depends:
-                        case_depends = depends[case.id()] 
-                        idx = _search_for_depend_idx(suites, case_depends)
-
-                    if idx == -1:
-                        idx = _get_best_idx(suites)
-
-                    suites[idx].addTest(case)
-        _fill_suites(suite)
-
-        suites_tmp = suites
-        suites = []
-        for suite in suites_tmp:
-            if len(suite._tests) > 0:
-                suites.append(suite)
-
-        return suites
-
-class OEStreamLoggerThreaded(OEStreamLogger):
-    _lock = threading.Lock()
-    buffers = {}
-
-    def write(self, msg):
-        tid = threading.get_ident()
-
-        if not tid in self.buffers:
-            self.buffers[tid] = ""
-
-        if msg:
-            self.buffers[tid] += msg
-
-    def finish(self):
-        tid = threading.get_ident()
-        
-        self._lock.acquire()
-        self.logger.info('THREAD: %d' % tid)
-        self.logger.info('-' * 70)
-        for line in self.buffers[tid].split('\n'):
-            self.logger.info(line)
-        self._lock.release()
-
-class OETestResultThreadedInternal(OETestResult):
-    def _tc_map_results(self):
-        tid = threading.get_ident()
-        
-        # PyUnit generates a result for every test module run, test
-        # if the thread already has an entry to avoid lose the previous
-        # test module results.
-        if not tid in self.tc._results:
-            self.tc._results[tid] = {}
-            self.tc._results[tid]['failures'] = self.failures
-            self.tc._results[tid]['errors'] = self.errors
-            self.tc._results[tid]['skipped'] = self.skipped
-            self.tc._results[tid]['expectedFailures'] = self.expectedFailures
-
-class OETestResultThreaded(object):
-    _results = {}
-    _lock = threading.Lock()
-
-    def __init__(self, tc):
-        self.tc = tc
-
-    def _fill_tc_results(self):
-        tids = list(self.tc._results.keys())
-        fields = ['failures', 'errors', 'skipped', 'expectedFailures']
-
-        for tid in tids:
-            result = self.tc._results[tid]
-            for field in fields:
-                if not field in self.tc._results:
-                    self.tc._results[field] = []
-                self.tc._results[field].extend(result[field])
-
-    def addResult(self, result, run_start_time, run_end_time):
-        tid = threading.get_ident()
-
-        self._lock.acquire()
-        self._results[tid] = {}
-        self._results[tid]['result'] = result
-        self._results[tid]['run_start_time'] = run_start_time 
-        self._results[tid]['run_end_time'] = run_end_time 
-        self._results[tid]['result'] = result
-        self._lock.release()
-
-    def wasSuccessful(self):
-        wasSuccessful = True
-        for tid in self._results.keys():
-            wasSuccessful = wasSuccessful and \
-                    self._results[tid]['result'].wasSuccessful()
-        return wasSuccessful
-
-    def stop(self):
-        for tid in self._results.keys():
-            self._results[tid]['result'].stop()
-
-    def logSummary(self, component, context_msg=''):
-        elapsed_time = (self.tc._run_end_time - self.tc._run_start_time)
-
-        self.tc.logger.info("SUMMARY:")
-        self.tc.logger.info("%s (%s) - Ran %d tests in %.3fs" % (component,
-            context_msg, len(self.tc._registry['cases']), elapsed_time))
-        if self.wasSuccessful():
-            msg = "%s - OK - All required tests passed" % component
-        else:
-            msg = "%s - FAIL - Required tests failed" % component
-        self.tc.logger.info(msg)
-
-    def logDetails(self):
-        if list(self._results):
-            tid = list(self._results)[0]
-            result = self._results[tid]['result']
-            result.logDetails()
-
-class _Worker(threading.Thread):
-    """Thread executing tasks from a given tasks queue"""
-    def __init__(self, tasks, result, stream):
-        threading.Thread.__init__(self)
-        self.tasks = tasks
-
-        self.result = result
-        self.stream = stream
-
-    def run(self):
-        while True:
-            try:
-                func, args, kargs = self.tasks.get(block=False)
-            except queue.Empty:
-                break
-
-            try:
-                run_start_time = time.time()
-                rc = func(*args, **kargs)
-                run_end_time = time.time()
-                self.result.addResult(rc, run_start_time, run_end_time)
-                self.stream.finish()
-            except Exception as e:
-                print(e)
-            finally:
-                self.tasks.task_done()
-
-class _ThreadedPool:
-    """Pool of threads consuming tasks from a queue"""
-    def __init__(self, num_workers, num_tasks, stream=None, result=None):
-        self.tasks = queue.Queue(num_tasks)
-        self.workers = []
-
-        for _ in range(num_workers):
-            worker = _Worker(self.tasks, result, stream)
-            self.workers.append(worker)
-
-    def start(self):
-        for worker in self.workers:
-            worker.start()
-
-    def add_task(self, func, *args, **kargs):
-        """Add a task to the queue"""
-        self.tasks.put((func, args, kargs))
-
-    def wait_completion(self):
-        """Wait for completion of all the tasks in the queue"""
-        self.tasks.join()
-        for worker in self.workers:
-            worker.join()
-
-class OETestRunnerThreaded(OETestRunner):
-    streamLoggerClass = OEStreamLoggerThreaded
-
-    def __init__(self, tc, *args, **kwargs):
-        super(OETestRunnerThreaded, self).__init__(tc, *args, **kwargs)
-        self.resultclass = OETestResultThreadedInternal # XXX: XML reporting overrides at __init__
-
-    def run(self, suites):
-        result = OETestResultThreaded(self.tc)
-
-        pool = _ThreadedPool(len(suites), len(suites), stream=self.stream,
-                result=result)
-        for s in suites:
-            pool.add_task(super(OETestRunnerThreaded, self).run, s)
-        pool.start()
-        pool.wait_completion()
-        result._fill_tc_results()
-
-        return result
-
-class OETestContextThreaded(OETestContext):
-    loaderClass = OETestLoaderThreaded
-    runnerClass = OETestRunnerThreaded
-
-    def loadTests(self, module_paths, modules=[], tests=[],
-            modules_manifest="", modules_required=[], filters={}, process_num=0):
-        if modules_manifest:
-            modules = self._read_modules_from_manifest(modules_manifest)
-
-        self.loader = self.loaderClass(self, module_paths, modules, tests,
-                modules_required, filters, process_num)
-        self.suites = self.loader.discover()
diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index b3d7c751837..82e4c19bfc1 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -6,10 +6,9 @@ import sys
 import glob
 import re
 
-from oeqa.core.context import OETestContextExecutor
-from oeqa.core.threaded import OETestContextThreaded
+from oeqa.core.context import OETestContext, OETestContextExecutor
 
-class OESDKTestContext(OETestContextThreaded):
+class OESDKTestContext(OETestContext):
     sdk_files_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "files")
 
     def __init__(self, td=None, logger=None, sdk_dir=None, sdk_env=None,
-- 
2.17.1


