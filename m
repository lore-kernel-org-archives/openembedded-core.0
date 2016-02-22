Return-Path: <costin.c.constantin@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 967417715E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 12:19:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 22 Feb 2016 04:19:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,484,1449561600"; d="scan'208";a="918393769"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2016 04:19:29 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id CDEFA6A4002;
	Mon, 22 Feb 2016 05:07:16 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:32:55 +0200
Message-Id: <1456144375-1167-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH v2] oe-selftest: Add support for lib/oeqa/selftest subdirectories
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
X-List-Received-Date: Mon, 22 Feb 2016 12:19:29 -0000

This patch adds functionality to allow creating subdirectories inside
lib/oeqa/selftest for all layers present in BBLAYERS. Like this, test
cases can be grouped into organized directories.

Addresses [YOCTO #7865]

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 scripts/oe-selftest | 53 ++++++++++++++++++++++++++++-------------------------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 4eb404b..8b35a2b 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -159,19 +159,33 @@ def remove_inc_files():
         except:
             pass
 
+
+def get_tests_modules(include_hidden=False):
+    modules_list = list()
+    for modules_path in oeqa.selftest.__path__:
+        for (p, d, f) in os.walk(modules_path):
+            files = sorted([f for f in os.listdir(p) if f.endswith('.py') and not (f.startswith('_') and not include_hidden) and not f.startswith('__') and f != 'base.py'])
+            for f in files:
+                submodules = p.split("selftest")[-1]
+                module = ""
+                if submodules:
+                    module = 'oeqa.selftest' + submodules.replace("/",".") + "." + f.split('.py')[0]
+                else:
+                    module = 'oeqa.selftest.' + f.split('.py')[0]
+                if module not in modules_list:
+                    modules_list.append(module)
+    return modules_list
+
+
 def get_tests(exclusive_modules=[], include_hidden=False):
-    testslist = []
+    test_modules = list()
     for x in exclusive_modules:
-        testslist.append('oeqa.selftest.' + x)
-    if not testslist:
-        for testpath in oeqa.selftest.__path__:
-            files = sorted([f for f in os.listdir(testpath) if f.endswith('.py') and not (f.startswith('_') and not include_hidden) and not f.startswith('__') and f != 'base.py'])
-            for f in files:
-                module = 'oeqa.selftest.' + f[:-3]
-                if module not in testslist:
-                    testslist.append(module)
+        test_modules.append('oeqa.selftest.' + x)
+    if not test_modules:
+        inc_hidden = include_hidden
+        test_modules = get_tests_modules(inc_hidden)
 
-    return testslist
+    return test_modules
 
 
 class Tc:
@@ -218,23 +232,12 @@ def get_tests_from_module(tmod):
 
 
 def get_all_tests():
-    tmodules = set()
-    testlist = []
-    prefix = 'oeqa.selftest.'
-
     # Get all the test modules (except the hidden ones)
-    for tpath in oeqa.selftest.__path__:
-        files = sorted([f for f in os.listdir(tpath) if f.endswith('.py') and not
-                        f.startswith(('_', '__')) and f != 'base.py'])
-        for f in files:
-            tmodules.add(prefix + f.rstrip('.py'))
-
+    testlist = []
+    tests_modules = get_tests_modules()
     # Get all the tests from modules
-    tmodules = sorted(list(tmodules))
-
-    for tmod in tmodules:
+    for tmod in sorted(tests_modules):
         testlist += get_tests_from_module(tmod)
-
     return testlist
 
 
@@ -463,7 +466,7 @@ def main():
         log.info('Listing all available test modules:')
         testslist = get_tests(include_hidden=True)
         for test in testslist:
-            module = test.split('.')[-1]
+            module = test.split('oeqa.selftest.')[-1]
             info = ''
             if module.startswith('_'):
                 info = ' (hidden)'
-- 
2.5.0


