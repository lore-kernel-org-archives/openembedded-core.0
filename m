Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id CB6FF77155
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567323"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:34 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:09:34 -0600
Message-Id: <ddd287cb4cbbe09ee34253c18c4ec036ce4b1171.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 03/55] oeqa/core: Add loader, context and decorator modules
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

loader: Implements OETestLoader handling OETestDecorator
and filtering support when load tests. The OETestLoader is
responsible to set custom methods, attrs of the OEQA
frameowork.

[YOCTO #10231]
[YOCTO #10317]
[YOCTO #10353]

decorator: Add base class OETestDecorator to provide a common
way to define decorators to be used over OETestCase's, every
decorator has a method to be called when loading tests and
before test execution starts. Special decorators could be
implemented for filter tests on loading phase.

context: Provides HIGH level API for loadTests and runTests
of certain test component (i.e. runtime, sdk, selftest).

[YOCTO #10230]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/core/context.py            | 148 +++++++++++++++++++
 meta/lib/oeqa/core/decorator/__init__.py |  71 ++++++++++
 meta/lib/oeqa/core/loader.py             | 235 +++++++++++++++++++++++++++++++
 3 files changed, 454 insertions(+)
 create mode 100644 meta/lib/oeqa/core/context.py
 create mode 100644 meta/lib/oeqa/core/decorator/__init__.py
 create mode 100644 meta/lib/oeqa/core/loader.py

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
new file mode 100644
index 0000000..cbab2f8
--- /dev/null
+++ b/meta/lib/oeqa/core/context.py
@@ -0,0 +1,148 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import os
+import sys
+import json
+import time
+import logging
+import collections
+import re
+
+from oeqa.core.loader import OETestLoader
+from oeqa.core.runner import OETestRunner, OEStreamLogger, xmlEnabled
+
+class OETestContext(object):
+    loaderClass = OETestLoader
+    runnerClass = OETestRunner
+    streamLoggerClass = OEStreamLogger
+
+    files_dir = os.path.abspath(os.path.join(os.path.dirname(
+        os.path.abspath(__file__)), "../files"))
+
+    def __init__(self, td=None, logger=None):
+        if not type(td) is dict:
+            raise TypeError("td isn't dictionary type")
+
+        self.td = td
+        self.logger = logger
+        self._registry = {}
+        self._registry['cases'] = collections.OrderedDict()
+        self._results = {}
+
+    def _read_modules_from_manifest(self, manifest):
+        if not os.path.exists(manifest):
+            raise
+
+        modules = []
+        for line in open(manifest).readlines():
+            line = line.strip()
+            if line and not line.startswith("#"):
+                modules.append(line)
+
+        return modules
+
+    def loadTests(self, module_paths, modules=[], tests=[],
+            modules_manifest="", modules_required=[], filters={}):
+        if modules_manifest:
+            modules = self._read_modules_from_manifest(modules_manifest)
+
+        self.loader = self.loaderClass(self, module_paths, modules, tests,
+                modules_required, filters)
+        self.suites = self.loader.discover()
+
+    def runTests(self):
+        streamLogger = self.streamLoggerClass(self.logger)
+        self.runner = self.runnerClass(self, stream=streamLogger, verbosity=2)
+
+        self._run_start_time = time.time()
+        result = self.runner.run(self.suites)
+        self._run_end_time = time.time()
+
+        return result
+
+    def logSummary(self, result, component, context_msg=''):
+        self.logger.info("SUMMARY:")
+        self.logger.info("%s (%s) - Ran %d test%s in %.3fs" % (component,
+            context_msg, result.testsRun, result.testsRun != 1 and "s" or "",
+            (self._run_end_time - self._run_start_time)))
+
+        if result.wasSuccessful():
+            msg = "%s - OK - All required tests passed" % component
+        else:
+            msg = "%s - FAIL - Required tests failed" % component
+        skipped = len(self._results['skipped'])
+        if skipped: 
+            msg += " (skipped=%d)" % skipped
+        self.logger.info(msg)
+
+    def _getDetailsNotPassed(self, case, type, desc):
+        found = False
+
+        for (scase, msg) in self._results[type]:
+            # XXX: When XML reporting is enabled scase is
+            # xmlrunner.result._TestInfo instance instead of
+            # string.
+            if xmlEnabled:
+                if case.id() == scase.test_id:
+                    found = True
+                    break
+                scase_str = scase.test_id
+            else:
+                if case == scase:
+                    found = True
+                    break
+                scase_str = str(scase)
+
+            # When fails at module or class level the class name is passed as string
+            # so figure out to see if match
+            m = re.search("^setUpModule \((?P<module_name>.*)\)$", scase_str)
+            if m:
+                if case.__class__.__module__ == m.group('module_name'):
+                    found = True
+                    break
+
+            m = re.search("^setUpClass \((?P<class_name>.*)\)$", scase_str)
+            if m:
+                class_name = "%s.%s" % (case.__class__.__module__,
+                        case.__class__.__name__)
+
+                if class_name == m.group('class_name'):
+                    found = True
+                    break
+
+        if found:
+            return (found, msg)
+
+        return (found, None)
+
+    def logDetails(self):
+        self.logger.info("RESULTS:")
+        for case_name in self._registry['cases']:
+            case = self._registry['cases'][case_name]
+
+            result_types = ['failures', 'errors', 'skipped', 'expectedFailures']
+            result_desc = ['FAILED', 'ERROR', 'SKIPPED', 'EXPECTEDFAIL']
+
+            fail = False
+            desc = None
+            for idx, name in enumerate(result_types):
+                (fail, msg) = self._getDetailsNotPassed(case, result_types[idx],
+                        result_desc[idx])
+                if fail:
+                    desc = result_desc[idx]
+                    break
+
+            oeid = -1
+            for d in case.decorators:
+                if hasattr(d, 'oeid'):
+                    oeid = d.oeid
+            
+            if fail:
+                self.logger.info("RESULTS - %s - Testcase %s: %s" % (case.id(),
+                    oeid, desc))
+                if msg:
+                    self.logger.info(msg)
+            else:
+                self.logger.info("RESULTS - %s - Testcase %s: %s" % (case.id(),
+                    oeid, 'PASSED'))
diff --git a/meta/lib/oeqa/core/decorator/__init__.py b/meta/lib/oeqa/core/decorator/__init__.py
new file mode 100644
index 0000000..855b6b9
--- /dev/null
+++ b/meta/lib/oeqa/core/decorator/__init__.py
@@ -0,0 +1,71 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+from functools import wraps
+from abc import abstractmethod
+
+decoratorClasses = set()
+
+def registerDecorator(obj):
+    decoratorClasses.add(obj)
+    return obj
+
+class OETestDecorator(object):
+    case = None # Reference of OETestCase decorated
+    attrs = None # Attributes to be loaded by decorator implementation
+
+    def __init__(self, *args, **kwargs):
+        if not self.attrs:
+            return
+
+        for idx, attr in enumerate(self.attrs):
+            if attr in kwargs:
+                value = kwargs[attr]
+            else:
+                value = args[idx]
+            setattr(self, attr, value)
+
+    def __call__(self, func):
+        @wraps(func)
+        def wrapped_f(*args, **kwargs):
+            self.attrs = self.attrs # XXX: Enables OETestLoader discover
+            return func(*args, **kwargs)
+        return wrapped_f
+
+    # OETestLoader call it when is loading test cases.
+    # XXX: Most methods would change the registry for later
+    # processing; be aware that filtrate method needs to
+    # run later than bind, so there could be data (in the
+    # registry) of a cases that were filtered.
+    def bind(self, registry, case):
+        self.case = case
+        self.logger = case.tc.logger
+        self.case.decorators.append(self)
+
+    # OETestRunner call this method when tries to run
+    # the test case.
+    def setUpDecorator(self):
+        pass
+
+    # OETestRunner call it after a test method has been
+    # called even if the method raised an exception.
+    def tearDownDecorator(self):
+        pass
+
+class OETestDiscover(OETestDecorator):
+
+    # OETestLoader call it after discover test cases
+    # needs to return the cases to be run.
+    @staticmethod
+    def discover(registry):
+        return registry['cases']
+
+class OETestFilter(OETestDecorator):
+
+    # OETestLoader call it while loading the tests
+    # in loadTestsFromTestCase method, it needs to
+    # return a bool, True if needs to be filtered.
+    # This method must consume the filter used.
+    @abstractmethod
+    def filtrate(self, filters):
+        return False
diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
new file mode 100644
index 0000000..c73ef9a
--- /dev/null
+++ b/meta/lib/oeqa/core/loader.py
@@ -0,0 +1,235 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import os
+import sys
+import unittest
+
+from oeqa.core.utils.path import findFile
+from oeqa.core.utils.test import getSuiteModules, getCaseID
+
+from oeqa.core.case import OETestCase
+from oeqa.core.decorator import decoratorClasses, OETestDecorator, \
+        OETestFilter, OETestDiscover
+
+def _make_failed_test(classname, methodname, exception, suiteClass):
+    """
+        When loading tests unittest framework stores the exception in a new
+        class created for be displayed into run().
+
+        For our purposes will be better to raise the exception in loading 
+        step instead of wait to run the test suite.
+    """
+    raise exception
+unittest.loader._make_failed_test = _make_failed_test
+
+def _find_duplicated_modules(suite, directory):
+    for module in getSuiteModules(suite):
+        path = findFile('%s.py' % module, directory)
+        if path:
+            raise ImportError("Duplicated %s module found in %s" % (module, path))
+
+class OETestLoader(unittest.TestLoader):
+    caseClass = OETestCase
+
+    kwargs_names = ['testMethodPrefix', 'sortTestMethodUsing', 'suiteClass',
+            '_top_level_dir']
+
+    def __init__(self, tc, module_paths, modules, tests, modules_required,
+            filters, *args, **kwargs):
+        self.tc = tc
+
+        self.modules = modules
+        self.tests = tests
+        self.modules_required = modules_required
+
+        self.filters = filters
+        self.decorator_filters = [d for d in decoratorClasses if \
+                issubclass(d, OETestFilter)]
+        self._validateFilters(self.filters, self.decorator_filters)
+        self.used_filters = [d for d in self.decorator_filters
+                             for f in self.filters
+                             if f in d.attrs]
+
+        if isinstance(module_paths, str):
+            module_paths = [module_paths]
+        elif not isinstance(module_paths, list):
+            raise TypeError('module_paths must be a str or a list of str')
+        self.module_paths = module_paths
+
+        for kwname in self.kwargs_names:
+            if kwname in kwargs:
+                setattr(self, kwname, kwargs[kwname])
+
+        self._patchCaseClass(self.caseClass)
+
+    def _patchCaseClass(self, testCaseClass):
+        # Adds custom attributes to the OETestCase class
+        setattr(testCaseClass, 'tc', self.tc)
+        setattr(testCaseClass, 'td', self.tc.td)
+        setattr(testCaseClass, 'logger', self.tc.logger)
+
+    def _validateFilters(self, filters, decorator_filters):
+        # Validate if filter isn't empty
+        for key,value in filters.items():
+            if not value:
+                raise TypeError("Filter %s specified is empty" % key)
+
+        # Validate unique attributes
+        attr_filters = [attr for clss in decorator_filters \
+                                for attr in clss.attrs]
+        dup_attr = [attr for attr in attr_filters
+                    if attr_filters.count(attr) > 1]
+        if dup_attr:
+            raise TypeError('Detected duplicated attribute(s) %s in filter'
+                            ' decorators' % ' ,'.join(dup_attr))
+
+        # Validate if filter is supported
+        for f in filters:
+            if f not in attr_filters:
+                classes = ', '.join([d.__name__ for d in decorator_filters])
+                raise TypeError('Found "%s" filter but not declared in any of '
+                                '%s decorators' % (f, classes))
+
+    def _registerTestCase(self, case):
+        case_id = case.id()
+        self.tc._registry['cases'][case_id] = case
+
+    def _handleTestCaseDecorators(self, case):
+        def _handle(obj):
+            if isinstance(obj, OETestDecorator):
+                if not obj.__class__ in decoratorClasses:
+                    raise Exception("Decorator %s isn't registered" \
+                            " in decoratorClasses." % obj.__name__)
+                obj.bind(self.tc._registry, case)
+
+        def _walk_closure(obj):
+            if hasattr(obj, '__closure__') and obj.__closure__:
+                for f in obj.__closure__:
+                    obj = f.cell_contents
+                    _handle(obj)
+                    _walk_closure(obj)
+        method = getattr(case, case._testMethodName, None)
+        _walk_closure(method)
+
+    def _filterTest(self, case):
+        """
+            Returns True if test case must be filtered, False otherwise.
+        """
+        if self.filters:
+            filters = self.filters.copy()
+            case_decorators = [cd for cd in case.decorators
+                               if cd.__class__ in self.used_filters]
+
+            # Iterate over case decorators to check if needs to be filtered.
+            for cd in case_decorators:
+                if cd.filtrate(filters):
+                    return True
+
+            # Case is missing one or more decorators for all the filters
+            # being used, so filter test case.
+            if filters:
+                return True
+
+        return False
+
+    def _getTestCase(self, testCaseClass, tcName):
+        if not hasattr(testCaseClass, '__oeqa_loader'):
+            # In order to support data_vars validation
+            # monkey patch the default setUp/tearDown{Class} to use
+            # the ones provided by OETestCase
+            setattr(testCaseClass, 'setUpClassMethod',
+                    getattr(testCaseClass, 'setUpClass'))
+            setattr(testCaseClass, 'tearDownClassMethod',
+                    getattr(testCaseClass, 'tearDownClass'))
+            setattr(testCaseClass, 'setUpClass',
+                    testCaseClass._oeSetUpClass)
+            setattr(testCaseClass, 'tearDownClass',
+                    testCaseClass._oeTearDownClass)
+
+            # In order to support decorators initialization
+            # monkey patch the default setUp/tearDown to use
+            # a setUpDecorators/tearDownDecorators that methods
+            # will call setUp/tearDown original methods.
+            setattr(testCaseClass, 'setUpMethod',
+                    getattr(testCaseClass, 'setUp')) 
+            setattr(testCaseClass, 'tearDownMethod',
+                    getattr(testCaseClass, 'tearDown'))
+            setattr(testCaseClass, 'setUp', testCaseClass._oeSetUp)
+            setattr(testCaseClass, 'tearDown', testCaseClass._oeTearDown)
+
+            setattr(testCaseClass, '__oeqa_loader', True)
+
+        case = testCaseClass(tcName)
+        setattr(case, 'decorators', [])
+
+        return case
+
+    def loadTestsFromTestCase(self, testCaseClass):
+        """
+            Returns a suite of all tests cases contained in testCaseClass.
+        """
+        if issubclass(testCaseClass, unittest.suite.TestSuite):
+            raise TypeError("Test cases should not be derived from TestSuite." \
+                                " Maybe you meant to derive from TestCase?")
+        if not issubclass(testCaseClass, self.caseClass):
+            raise TypeError("Test cases need to be derived from %s" % \
+                    caseClass.__name__)
+
+
+        testCaseNames = self.getTestCaseNames(testCaseClass)
+        if not testCaseNames and hasattr(testCaseClass, 'runTest'):
+            testCaseNames = ['runTest']
+
+        suite = []
+        for tcName in testCaseNames:
+            case = self._getTestCase(testCaseClass, tcName)
+            # Filer by case id
+            if not (self.tests and not 'all' in self.tests
+                    and not getCaseID(case) in self.tests):
+                self._handleTestCaseDecorators(case)
+
+                # Filter by decorators
+                if not self._filterTest(case):
+                    self._registerTestCase(case)
+                    suite.append(case)
+
+        return self.suiteClass(suite)
+
+    def discover(self):
+        big_suite = self.suiteClass()
+        for path in self.module_paths:
+            _find_duplicated_modules(big_suite, path)
+            suite = super(OETestLoader, self).discover(path,
+                    pattern='*.py', top_level_dir=path)
+            big_suite.addTests(suite)
+
+        cases = None
+        discover_classes = [clss for clss in decoratorClasses
+                            if issubclass(clss, OETestDiscover)]
+        for clss in discover_classes:
+            cases = clss.discover(self.tc._registry)
+
+        return self.suiteClass(cases) if cases else big_suite
+
+    # XXX After Python 3.5, remove backward compatibility hacks for
+    # use_load_tests deprecation via *args and **kws.  See issue 16662.
+    if sys.version_info >= (3,5):
+        def loadTestsFromModule(self, module, *args, pattern=None, **kws):
+            if not self.modules or "all" in self.modules or \
+                    module.__name__ in self.modules:
+                return super(OETestLoader, self).loadTestsFromModule(
+                        module, *args, pattern=pattern, **kws)
+            else:
+                return self.suiteClass()
+    else:
+        def loadTestsFromModule(self, module, use_load_tests=True):
+            """
+                Returns a suite of all tests cases contained in module.
+            """
+            if not self.modules or "all" in self.modules or \
+                    module.__name__ in self.modules:
+                return super(OETestLoader, self).loadTestsFromModule(
+                        module, use_load_tests)
+            else:
+                return self.suiteClass()
-- 
2.1.4


