Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9CE2271A85
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 21:51:29 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 06 Dec 2016 13:51:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,310,1477983600"; d="scan'208";a="39533257"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by orsmga005.jf.intel.com with ESMTP; 06 Dec 2016 13:51:26 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 15:43:46 -0600
Message-Id: <9aa2e7e43459137587713a5978f1b6ef45c0739b.1481059445.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481059445.git.anibal.limon@linux.intel.com>
References: <cover.1481059445.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1481059445.git.anibal.limon@linux.intel.com>
References: <cover.1481059445.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 01/32] oeqa/core: Add base OEQA framework
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
X-List-Received-Date: Tue, 06 Dec 2016 21:51:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

case: Defines OETestCase base class that provides custom
    methods/attrs defined by the framework.
    Every OETestCase instance contains a reference to the test
    data (d), the test context (tc) and the logger.
    Also implements _oe{SetUp,TearDown}Class for make special
    handling of OEQA decorators and validations.

runner: Defines OETestRunner/OETestResult with support for RAW
    and XML result logs.

exception: Custom exceptions related to the OEQA framework based
    on class OEQAException.

[YOCTO #10230]
[YOCTO #10233]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/core/__init__.py  |  0
 meta/lib/oeqa/core/case.py      | 46 +++++++++++++++++++++++++
 meta/lib/oeqa/core/exception.py | 14 ++++++++
 meta/lib/oeqa/core/runner.py    | 76 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 136 insertions(+)
 create mode 100644 meta/lib/oeqa/core/__init__.py
 create mode 100644 meta/lib/oeqa/core/case.py
 create mode 100644 meta/lib/oeqa/core/exception.py
 create mode 100644 meta/lib/oeqa/core/runner.py

diff --git a/meta/lib/oeqa/core/__init__.py b/meta/lib/oeqa/core/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/meta/lib/oeqa/core/case.py b/meta/lib/oeqa/core/case.py
new file mode 100644
index 0000000..a47cb19
--- /dev/null
+++ b/meta/lib/oeqa/core/case.py
@@ -0,0 +1,46 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import unittest
+
+from oeqa.core.exception import OEQAMissingVariable
+
+def _validate_data_vars(d, data_vars, type_msg):
+    if data_vars:
+        for v in data_vars:
+            if not v in d:
+                raise OEQAMissingVariable("Test %s need %s variable but"\
+                        " isn't into d" % (type_msg, v))
+
+class OETestCase(unittest.TestCase):
+    # TestContext and Logger instance set by OETestLoader.
+    tc = None
+    logger = None
+
+    # d has all the variables needed by the test cases
+    # is the same across all the test cases.
+    d = None
+
+    # data_vars has the variables needed by a test class
+    # or test case instance, if some var isn't into d a
+    # OEMissingVariable exception is raised
+    data_vars = None
+
+    @classmethod
+    def _oeSetUpClass(clss):
+        _validate_data_vars(clss.d, clss.data_vars, "class")
+        clss.setUpClassMethod()
+
+    @classmethod
+    def _oeTearDownClass(clss):
+        clss.tearDownClassMethod()
+
+    def _oeSetUp(self):
+        for d in self.decorators:
+            d.setUpDecorator()
+        self.setUpMethod()
+
+    def _oeTearDown(self):
+        for d in self.decorators:
+            d.tearDownDecorator()
+        self.tearDownMethod()
diff --git a/meta/lib/oeqa/core/exception.py b/meta/lib/oeqa/core/exception.py
new file mode 100644
index 0000000..2dfd840
--- /dev/null
+++ b/meta/lib/oeqa/core/exception.py
@@ -0,0 +1,14 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+class OEQAException(Exception):
+    pass
+
+class OEQATimeoutError(OEQAException):
+    pass
+
+class OEQAMissingVariable(OEQAException):
+    pass
+
+class OEQADependency(OEQAException):
+    pass
diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
new file mode 100644
index 0000000..8f5af57
--- /dev/null
+++ b/meta/lib/oeqa/core/runner.py
@@ -0,0 +1,76 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import os
+import time
+import unittest
+import logging
+
+xmlEnabled = False
+try:
+    import xmlrunner
+    from xmlrunner.result import _XMLTestResult as _TestResult
+    from xmlrunner.runner import XMLTestRunner as _TestRunner
+    xmlEnabled = True
+except ImportError:
+    # use the base runner instead
+    from unittest import TextTestResult as _TestResult
+    from unittest import TextTestRunner as _TestRunner
+
+class OEStreamLogger(object):
+    def __init__(self, logger):
+        self.logger = logger
+        self.buffer = ""
+
+    def write(self, msg):
+        if msg[-1] != '\n':
+            self.buffer += msg
+        else:
+            self.logger.log(logging.INFO, self.buffer.rstrip("\n"))
+            self.buffer = ""
+
+    def flush(self):
+        for handler in self.logger.handlers:
+            handler.flush()
+
+class OETestResult(_TestResult):
+    def __init__(self, tc, *args, **kwargs):
+        super(OETestResult, self).__init__(*args, **kwargs)
+
+        self.tc = tc
+
+        self.tc._results['failures'] = self.failures
+        self.tc._results['errors'] = self.errors
+        self.tc._results['skipped'] = self.skipped
+        self.tc._results['expectedFailures'] = self.expectedFailures
+
+    def startTest(self, test):
+        super(OETestResult, self).startTest(test)
+
+class OETestRunner(_TestRunner):
+    def __init__(self, tc, *args, **kwargs):
+        if xmlEnabled:
+            if not kwargs.get('output'):
+                kwargs['output'] = os.path.join(os.getcwd(),
+                        'TestResults_%s' % time.strftime("%Y%m%d%H%M%S"))
+
+        super(OETestRunner, self).__init__(*args, **kwargs)
+        self.tc = tc
+        self.resultclass = OETestResult
+
+    # XXX: The unittest-xml-reporting package defines _make_result method instead
+    # of _makeResult standard on unittest.
+    if xmlEnabled:
+        def _make_result(self):
+            """
+            Creates a TestResult object which will be used to store
+            information about the executed tests.
+            """
+            # override in subclasses if necessary.
+            return self.resultclass(self.tc,
+                self.stream, self.descriptions, self.verbosity, self.elapsed_times
+            )
+    else:
+        def _makeResult(self):
+            return self.resultclass(self.tc, self.stream, self.descriptions,
+                    self.verbosity)
-- 
2.1.4


