Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0710A78284
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 16:32:08 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2017 09:32:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="271875691"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.117])
	by fmsmga004.fm.intel.com with ESMTP; 08 Jun 2017 09:32:07 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 11:32:05 -0500
Message-Id: <95d0e1ec17fc218d14f29efaf9c37ae5cb4c41af.1496939387.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496939387.git.anibal.limon@linux.intel.com>
References: <cover.1496939387.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1496939387.git.anibal.limon@linux.intel.com>
References: <cover.1496939387.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] oeqa/core/loader: Allow unittest.TestCase's to be executed
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
X-List-Received-Date: Thu, 08 Jun 2017 16:32:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently there was a restriction to only execute tests that's
inherits from OETestCase but in some circunstancies the features
from the OEQA framework isn't needed so we need to support
basic unittests.

[YOCTO #10828]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/loader.py | 12 +++++++-----
 meta/lib/oeqa/core/runner.py | 25 ++++++++++++++-----------
 2 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 7cc4d4c..b9385ea 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -182,7 +182,7 @@ class OETestLoader(unittest.TestLoader):
                         return True
 
         # Decorator filters
-        if self.filters:
+        if self.filters and isinstance(case, OETestCase):
             filters = self.filters.copy()
             case_decorators = [cd for cd in case.decorators
                                if cd.__class__ in self.used_filters]
@@ -200,7 +200,8 @@ class OETestLoader(unittest.TestLoader):
         return False
 
     def _getTestCase(self, testCaseClass, tcName):
-        if not hasattr(testCaseClass, '__oeqa_loader'):
+        if not hasattr(testCaseClass, '__oeqa_loader') and \
+                issubclass(testCaseClass, OETestCase):
             # In order to support data_vars validation
             # monkey patch the default setUp/tearDown{Class} to use
             # the ones provided by OETestCase
@@ -227,7 +228,8 @@ class OETestLoader(unittest.TestLoader):
             setattr(testCaseClass, '__oeqa_loader', True)
 
         case = testCaseClass(tcName)
-        setattr(case, 'decorators', [])
+        if isinstance(case, OETestCase):
+            setattr(case, 'decorators', [])
 
         return case
 
@@ -239,9 +241,9 @@ class OETestLoader(unittest.TestLoader):
             raise TypeError("Test cases should not be derived from TestSuite." \
                                 " Maybe you meant to derive %s from TestCase?" \
                                 % testCaseClass.__name__)
-        if not issubclass(testCaseClass, self.caseClass):
+        if not issubclass(testCaseClass, unittest.case.TestCase):
             raise TypeError("Test %s is not derived from %s" % \
-                    (testCaseClass.__name__, self.caseClass.__name__))
+                    (testCaseClass.__name__, unittest.case.TestCase.__name__))
 
         testCaseNames = self.getTestCaseNames(testCaseClass)
         if not testCaseNames and hasattr(testCaseClass, 'runTest'):
diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 7ce718e..532b25b 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -121,9 +121,10 @@ class OETestResult(_TestResult):
                     break
 
             oeid = -1
-            for d in case.decorators:
-                if hasattr(d, 'oeid'):
-                    oeid = d.oeid
+            if hasattr(case, 'decorators'):
+                for d in case.decorators:
+                    if hasattr(d, 'oeid'):
+                        oeid = d.oeid
 
             if fail:
                 self.tc.logger.info("RESULTS - %s - Testcase %s: %s" % (case.id(),
@@ -188,9 +189,10 @@ class OETestRunner(_TestRunner):
         def _list_cases_without_id(logger, case):
 
             found_id = False
-            for d in case.decorators:
-                if isinstance(d, OETestID):
-                    found_id = True
+            if hasattr(case, 'decorators'):
+                for d in case.decorators:
+                    if isinstance(d, OETestID):
+                        found_id = True
 
             if not found_id:
                 logger.info('oeid missing for %s' % case.id())
@@ -199,11 +201,12 @@ class OETestRunner(_TestRunner):
             oeid = None
             oetag = None
 
-            for d in case.decorators:
-                if isinstance(d, OETestID):
-                    oeid = d.oeid
-                elif isinstance(d, OETestTag):
-                    oetag = d.oetag
+            if hasattr(case, 'decorators'):
+                for d in case.decorators:
+                    if isinstance(d, OETestID):
+                        oeid = d.oeid
+                    elif isinstance(d, OETestTag):
+                        oetag = d.oetag
 
             logger.info("%s\t%s\t\t%s" % (oeid, oetag, case.id()))
 
-- 
2.1.4


