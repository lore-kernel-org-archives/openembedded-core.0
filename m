Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 61B39782F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:38:44 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 13:38:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,399,1491289200"; d="scan'208";a="266887810"
Received: from tsriniv-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.amr.corp.intel.com) ([10.254.103.51])
	by fmsmga004.fm.intel.com with ESMTP; 26 May 2017 13:38:44 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 15:37:45 -0500
Message-Id: <5e0fb276ab4e63e73726ff975b1f950c6e99ec3c.1495830706.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 19/36] oeqa/core: Add support for run tests by module, class and name
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
X-List-Received-Date: Fri, 26 May 2017 20:38:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This will enable only run certain module tests and filter by
class and test name.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/context.py |  6 ++--
 meta/lib/oeqa/core/loader.py  | 66 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 68 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index bc958d0..28ae017 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -85,9 +85,9 @@ class OETestContextExecutor(object):
                 help="results output log, default: %s" % self.default_output_log)
 
         group = self.parser.add_mutually_exclusive_group()
-        group.add_argument('--run-tests', action='store',
+        group.add_argument('--run-tests', action='store', nargs='+',
                 default=self.default_tests,
-                help="tests to run in <module>[.<class>[.<name>]] format. Just works for modules now")
+                help="tests to run in <module>[.<class>[.<name>]]")
         group.add_argument('--list-tests', action='store',
                 choices=('module', 'class', 'name'),
                 help="lists available tests")
@@ -136,7 +136,7 @@ class OETestContextExecutor(object):
             self.tc_kwargs['init']['td'] = {}
 
         if args.run_tests:
-            self.tc_kwargs['load']['modules'] = args.run_tests.split()
+            self.tc_kwargs['load']['modules'] = args.run_tests
         else:
             self.tc_kwargs['load']['modules'] = None
 
diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 63a1703..bffb2da 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -29,6 +29,51 @@ def _find_duplicated_modules(suite, directory):
         if path:
             raise ImportError("Duplicated %s module found in %s" % (module, path))
 
+def _built_modules_dict(modules):
+    modules_dict = {}
+
+    if modules == None:
+        return modules_dict
+
+    for m in modules:
+        ms = m.split('.')
+
+        if len(ms) == 1:
+            module_name = ms[0]
+            if not module_name in modules_dict:
+                modules_dict[module_name] = {}
+        elif len(ms) == 2:
+            module_name = ms[0]
+            class_name = ms[1]
+            if not module_name in modules_dict:
+                modules_dict[module_name] = {}
+            if not class_name in modules_dict[module_name]:
+                modules_dict[module_name][class_name] = []
+        elif len(ms) == 3:
+            module_name = ms[0]
+            class_name = ms[1]
+            test_name = ms[2]
+
+            if not module_name in modules_dict:
+                modules_dict[module_name] = {}
+            if not class_name in modules_dict[module_name]:
+                modules_dict[module_name][class_name] = []
+            if not test_name in modules_dict[module_name][class_name]:
+                modules_dict[module_name][class_name].append(test_name)
+        elif len(ms) >= 4:
+            module_name = '.'.join(ms[0:-2])
+            class_name = ms[-2]
+            test_name = ms[-1]
+
+            if not module_name in modules_dict:
+                modules_dict[module_name] = {}
+            if not class_name in modules_dict[module_name]:
+                modules_dict[module_name][class_name] = []
+            if not test_name in modules_dict[module_name][class_name]:
+                modules_dict[module_name][class_name].append(test_name)
+
+    return modules_dict
+
 class OETestLoader(unittest.TestLoader):
     caseClass = OETestCase
 
@@ -39,7 +84,8 @@ class OETestLoader(unittest.TestLoader):
             filters, *args, **kwargs):
         self.tc = tc
 
-        self.modules = modules
+        self.modules = _built_modules_dict(modules)
+
         self.tests = tests
         self.modules_required = modules_required
 
@@ -116,6 +162,24 @@ class OETestLoader(unittest.TestLoader):
         """
             Returns True if test case must be filtered, False otherwise.
         """
+        # Filters by module.class.name
+        module_name = case.__module__
+        class_name = case.__class__.__name__
+        test_name = case._testMethodName
+
+        if self.modules:
+            if not module_name in self.modules:
+                return True
+
+            if self.modules[module_name]:
+                if not class_name in self.modules[module_name]:
+                    return True
+
+                if self.modules[module_name][class_name]:
+                    if test_name not in self.modules[module_name][class_name]:
+                        return True
+
+        # Decorator filters
         if self.filters:
             filters = self.filters.copy()
             case_decorators = [cd for cd in case.decorators
-- 
2.1.4


