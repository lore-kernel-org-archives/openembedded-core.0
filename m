Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DEB997728F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 00:28:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Feb 2016 16:28:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,387,1449561600"; d="scan'208";a="904289059"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.31])
	by orsmga002.jf.intel.com with ESMTP; 02 Feb 2016 16:28:43 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 18:30:13 -0600
Message-Id: <ac8075cc2059d792a2a48c09df585f1d6087bb17.1454459362.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454459362.git.anibal.limon@linux.intel.com>
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1454459362.git.anibal.limon@linux.intel.com>
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, benjamin.esquivel@intel.com
Subject: [PATCH v2 01/28] testimage: Modularize helper functions for get test lists.
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
X-List-Received-Date: Wed, 03 Feb 2016 00:28:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Test lists functions can be used in other parts so modularize it and
move to oeqa/oetest.py library.

Testimage class was updated to meet the new sign of the functions.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/testimage.bbclass | 78 +++---------------------------------------
 meta/lib/oeqa/oetest.py        | 74 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+), 74 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 37af46f..a4026d3 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -106,74 +106,6 @@ do_testsdk[nostamp] = "1"
 do_testsdk[depends] += "${TESTIMAGEDEPENDS}"
 do_testsdk[lockfiles] += "${TESTIMAGELOCK}"
 
-# get testcase list from specified file
-# if path is a relative path, then relative to build/conf/
-def read_testlist(d, fpath):
-    if not os.path.isabs(fpath):
-        builddir = d.getVar("TOPDIR", True)
-        fpath = os.path.join(builddir, "conf", fpath)
-    if not os.path.exists(fpath):
-        bb.fatal("No such manifest file: ", fpath)
-    tcs = []
-    for line in open(fpath).readlines():
-        line = line.strip()
-        if line and not line.startswith("#"):
-            tcs.append(line)
-    return " ".join(tcs)
-
-def get_tests_list(d, type="runtime"):
-    testsuites = []
-    testslist = []
-    manifests = d.getVar("TEST_SUITES_MANIFEST", True)
-    if manifests is not None:
-        manifests = manifests.split()
-        for manifest in manifests:
-            testsuites.extend(read_testlist(d, manifest).split())
-    else:
-        testsuites = d.getVar("TEST_SUITES", True).split()
-    if type == "sdk":
-        testsuites = (d.getVar("TEST_SUITES_SDK", True) or "auto").split()
-    bbpath = d.getVar("BBPATH", True).split(':')
-
-    # This relies on lib/ under each directory in BBPATH being added to sys.path
-    # (as done by default in base.bbclass)
-    for testname in testsuites:
-        if testname != "auto":
-            if testname.startswith("oeqa."):
-                testslist.append(testname)
-                continue
-            found = False
-            for p in bbpath:
-                if os.path.exists(os.path.join(p, 'lib', 'oeqa', type, testname + '.py')):
-                    testslist.append("oeqa." + type + "." + testname)
-                    found = True
-                    break
-                elif os.path.exists(os.path.join(p, 'lib', 'oeqa', type, testname.split(".")[0] + '.py')):
-                    testslist.append("oeqa." + type + "." + testname)
-                    found = True
-                    break
-            if not found:
-                bb.fatal('Test %s specified in TEST_SUITES could not be found in lib/oeqa/runtime under BBPATH' % testname)
-
-    if "auto" in testsuites:
-        def add_auto_list(path):
-            if not os.path.exists(os.path.join(path, '__init__.py')):
-                bb.fatal('Tests directory %s exists but is missing __init__.py' % path)
-            files = sorted([f for f in os.listdir(path) if f.endswith('.py') and not f.startswith('_')])
-            for f in files:
-                module = 'oeqa.' + type + '.' + f[:-3]
-                if module not in testslist:
-                    testslist.append(module)
-
-        for p in bbpath:
-            testpath = os.path.join(p, 'lib', 'oeqa', type)
-            bb.debug(2, 'Searching for tests in %s' % testpath)
-            if os.path.exists(testpath):
-                add_auto_list(testpath)
-
-    return testslist
-
-
 def exportTests(d,tc):
     import json
     import shutil
@@ -272,7 +204,7 @@ def testimage_main(d):
     import oeqa.runtime
     import time
     import signal
-    from oeqa.oetest import loadTests, runTests
+    from oeqa.oetest import loadTests, runTests, get_test_suites, get_tests_list
     from oeqa.targetcontrol import get_target_controller
     from oeqa.utils.dump import get_host_dumper
 
@@ -286,7 +218,7 @@ def testimage_main(d):
     # tests in TEST_SUITES become required tests
     # they won't be skipped even if they aren't suitable for a image (like xorg for minimal)
     # testslist is what we'll actually pass to the unittest loader
-    testslist = get_tests_list(d)
+    testslist = get_tests_list(get_test_suites(d), d.getVar("BBPATH", True).split(':'))
     testsrequired = [t for t in d.getVar("TEST_SUITES", True).split() if t != "auto"]
 
     tagexp = d.getVar("TEST_SUITES_TAGS", True)
@@ -368,7 +300,6 @@ def testimage_main(d):
 
 testimage_main[vardepsexclude] =+ "BB_ORIGENV"
 
-
 def testsdk_main(d):
     import unittest
     import os
@@ -377,7 +308,7 @@ def testsdk_main(d):
     import oeqa.sdk
     import time
     import subprocess
-    from oeqa.oetest import loadTests, runTests
+    from oeqa.oetest import loadTests, runTests, get_test_suites, get_tests_list
 
     pn = d.getVar("PN", True)
     bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR", True))
@@ -385,7 +316,7 @@ def testsdk_main(d):
     # tests in TEST_SUITES become required tests
     # they won't be skipped even if they aren't suitable.
     # testslist is what we'll actually pass to the unittest loader
-    testslist = get_tests_list(d, "sdk")
+    testslist = get_tests_list(get_test_suites(d, "sdk"), d.getVar("BBPATH", True).split(':'), "sdk")
     testsrequired = [t for t in (d.getVar("TEST_SUITES_SDK", True) or "auto").split() if t != "auto"]
 
     tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh")
@@ -457,4 +388,3 @@ def testsdk_main(d):
         bb.utils.remove(sdktestdir, True)
 
 testsdk_main[vardepsexclude] =+ "BB_ORIGENV"
-
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 6f9edec..18b2209 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -250,3 +250,77 @@ def skipModuleUnless(cond, reason):
 
     if not cond:
         skipModule(reason, 3)
+
+# get testcase list from specified file
+# if path is a relative path, then relative to build/conf/
+def read_testlist(fpath, builddir):
+    if not os.path.isabs(fpath):
+        fpath = os.path.join(builddir, "conf", fpath)
+    if not os.path.exists(fpath):
+        bb.fatal("No such manifest file: ", fpath)
+    tcs = []
+    for line in open(fpath).readlines():
+        line = line.strip()
+        if line and not line.startswith("#"):
+            tcs.append(line)
+    return " ".join(tcs)
+
+# get test suites, returns test suites based on d variables
+def get_test_suites(d, type='runtime'):
+    testsuites = []
+
+    if type == "sdk":
+        testsuites = (d.getVar("TEST_SUITES_SDK", True) or "auto").split()
+    else:
+        manifests = (d.getVar("TEST_SUITES_MANIFEST", True) or '').split()
+        if manifests:
+            for manifest in manifests:
+                testsuites.extend(read_testlist(manifest,
+                                    d.getVar("TOPDIR", True)).split())
+
+        else:
+            testsuites = d.getVar("TEST_SUITES", True).split()
+
+    return testsuites
+
+# return test list by type also filter if TEST_SUITES is specified
+def get_tests_list(testsuites, bbpath, type="runtime"):
+    testslist = []
+
+    # This relies on lib/ under each directory in BBPATH being added to sys.path
+    # (as done by default in base.bbclass)
+    for testname in testsuites:
+        if testname != "auto":
+            if testname.startswith("oeqa."):
+                testslist.append(testname)
+                continue
+            found = False
+            for p in bbpath:
+                if os.path.exists(os.path.join(p, 'lib', 'oeqa', type, testname + '.py')):
+                    testslist.append("oeqa." + type + "." + testname)
+                    found = True
+                    break
+                elif os.path.exists(os.path.join(p, 'lib', 'oeqa', type, testname.split(".")[0] + '.py')):
+                    testslist.append("oeqa." + type + "." + testname)
+                    found = True
+                    break
+            if not found:
+                bb.fatal('Test %s specified in TEST_SUITES could not be found in lib/oeqa/runtime under BBPATH' % testname)
+
+    if "auto" in testsuites:
+        def add_auto_list(path):
+            if not os.path.exists(os.path.join(path, '__init__.py')):
+                bb.fatal('Tests directory %s exists but is missing __init__.py' % path)
+            files = sorted([f for f in os.listdir(path) if f.endswith('.py') and not f.startswith('_')])
+            for f in files:
+                module = 'oeqa.' + type + '.' + f[:-3]
+                if module not in testslist:
+                    testslist.append(module)
+
+        for p in bbpath:
+            testpath = os.path.join(p, 'lib', 'oeqa', type)
+            bb.debug(2, 'Searching for tests in %s' % testpath)
+            if os.path.exists(testpath):
+                add_auto_list(testpath)
+
+    return testslist
-- 
2.1.4


