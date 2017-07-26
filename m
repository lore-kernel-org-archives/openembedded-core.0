Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BDCD160720
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 15:03:29 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jul 2017 08:03:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,415,1496127600"; d="scan'208";a="129729216"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.142])
	by orsmga005.jf.intel.com with ESMTP; 26 Jul 2017 08:03:29 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jul 2017 10:04:09 -0500
Message-Id: <20170726150410.5492-1-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: patrick.ohly@gmx.de, paul.eggleton@linux.intel.com
Subject: [PATCH 1/2] oeqa/{core, selftest}: Add support to validate if a specified test case isn't found
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
X-List-Received-Date: Wed, 26 Jul 2017 15:03:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If some test module/case is specified to run and isn't found the OEQA
framework didn't notice it, so complete the implementation using
modules_required and validate for the test case prescense.

Raise an exception when the test module/case required isn't found.

[YOCTO #11645]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/context.py     |  9 +++++++--
 meta/lib/oeqa/core/exception.py   |  3 +++
 meta/lib/oeqa/core/loader.py      | 26 ++++++++++++++++++++++++++
 meta/lib/oeqa/selftest/context.py |  8 ++++++--
 4 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 2d543ffa31a..422e2899921 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -10,7 +10,7 @@ import collections
 
 from oeqa.core.loader import OETestLoader
 from oeqa.core.runner import OETestRunner
-from oeqa.core.exception import OEQAMissingManifest
+from oeqa.core.exception import OEQAMissingManifest, OEQATestNotFound
 
 class OETestContext(object):
     loaderClass = OETestLoader
@@ -139,6 +139,7 @@ class OETestContextExecutor(object):
 
         if args.run_tests:
             self.tc_kwargs['load']['modules'] = args.run_tests
+            self.tc_kwargs['load']['modules_required'] = args.run_tests
         else:
             self.tc_kwargs['load']['modules'] = []
 
@@ -151,7 +152,11 @@ class OETestContextExecutor(object):
         self._process_args(logger, args)
 
         self.tc = self._context_class(**self.tc_kwargs['init'])
-        self.tc.loadTests(self.module_paths, **self.tc_kwargs['load'])
+        try:
+            self.tc.loadTests(self.module_paths, **self.tc_kwargs['load'])
+        except OEQATestNotFound as ex:
+            logger.error(ex)
+            sys.exit(1)
 
         if args.list_tests:
             rc = self.tc.listTests(args.list_tests, **self.tc_kwargs['run'])
diff --git a/meta/lib/oeqa/core/exception.py b/meta/lib/oeqa/core/exception.py
index a07961adc31..732f2efdeb6 100644
--- a/meta/lib/oeqa/core/exception.py
+++ b/meta/lib/oeqa/core/exception.py
@@ -18,3 +18,6 @@ class OEQAMissingManifest(OEQAException):
 
 class OEQAPreRun(OEQAException):
     pass
+
+class OEQATestNotFound(OEQAException):
+    pass
diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index e4c218b57f0..332086a13d7 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -9,6 +9,7 @@ import inspect
 from oeqa.core.utils.path import findFile
 from oeqa.core.utils.test import getSuiteModules, getCaseID
 
+from oeqa.core.exception import OEQATestNotFound
 from oeqa.core.case import OETestCase
 from oeqa.core.decorator import decoratorClasses, OETestDecorator, \
         OETestFilter, OETestDiscover
@@ -277,6 +278,28 @@ class OETestLoader(unittest.TestLoader):
 
         return self.suiteClass(suite)
 
+    def _required_modules_validation(self):
+        """
+            Search in Test context registry if a required
+            test is found, raise an exception when not found.
+        """
+
+        for module in self.modules_required:
+            found = False
+
+            # The module name is splitted to only compare the
+            # first part of a test case id.
+            comp_len = len(module.split('.'))
+            for case in self.tc._registry['cases']:
+                case_comp = '.'.join(case.split('.')[0:comp_len])
+                if module == case_comp:
+                    found = True
+                    break
+
+            if not found:
+                raise OEQATestNotFound("Not found %s in loaded test cases" % \
+                        module)
+
     def discover(self):
         big_suite = self.suiteClass()
         for path in self.module_paths:
@@ -291,6 +314,9 @@ class OETestLoader(unittest.TestLoader):
         for clss in discover_classes:
             cases = clss.discover(self.tc._registry)
 
+        if self.modules_required:
+            self._required_modules_validation()
+
         return self.suiteClass(cases) if cases else big_suite
 
     def _filterModule(self, module):
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 4575a0537fb..990c761f298 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -13,7 +13,7 @@ from random import choice
 import oeqa
 
 from oeqa.core.context import OETestContext, OETestContextExecutor
-from oeqa.core.exception import OEQAPreRun
+from oeqa.core.exception import OEQAPreRun, OEQATestNotFound
 
 from oeqa.utils.commands import runCmd, get_bb_vars, get_test_layer
 
@@ -196,7 +196,11 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
                 self.tc_kwargs['init']['td']['BBPATH'].split(':'))
 
         self.tc = self._context_class(**self.tc_kwargs['init'])
-        self.tc.loadTests(self.module_paths, **self.tc_kwargs['load'])
+        try:
+            self.tc.loadTests(self.module_paths, **self.tc_kwargs['load'])
+        except OEQATestNotFound as ex:
+            logger.error(ex)
+            sys.exit(1)
 
         if args.list_tests:
             rc = self.tc.listTests(args.list_tests, **self.tc_kwargs['run'])
-- 
2.11.0


