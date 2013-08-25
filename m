Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 8E6C2614A3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 00:47:05 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Aug 2013 17:47:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,949,1367996400"; d="scan'208";a="351202360"
Received: from timevans-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.221])
	by azsmga001.ch.intel.com with ESMTP; 24 Aug 2013 17:47:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Aug 2013 01:46:55 +0100
Message-Id: <d2a3e546ee74c266c6d8fd0ab949373346906279.1377390888.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377390888.git.paul.eggleton@linux.intel.com>
References: <cover.1377390888.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1377390888.git.paul.eggleton@linux.intel.com>
References: <cover.1377390888.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/testimage: add support for finding tests in other layers
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
X-List-Received-Date: Sun, 25 Aug 2013 00:47:07 -0000

From: Stefan Stanacar <stefanx.stanacar@intel.com>

A layer can add tests in lib/oeqa/runtime (provided it extends BBPATH as
normal) and enable them with TEST_SUITES_append = " testname". Test
module names shouldn't collide though.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/testimage.bbclass    | 55 ++++++++++++++++++++++++++++++---------
 meta/lib/oeqa/runtime/__init__.py |  3 +++
 2 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 86121e4..f914e57 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -17,6 +17,7 @@
 # Each name in TEST_SUITES represents a required test for the image. (no skipping allowed)
 # Appending "auto" means that it will try to run all tests that are suitable for the image (each test decides that on it's own).
 # Note that order in TEST_SUITES is important (it's the order tests run) and it influences tests dependencies.
+# A layer can add its own tests in lib/oeqa/runtime, provided it extends BBPATH as normal in its layer.conf.
 
 # TEST_LOG_DIR contains a ssh log (what command is running, output and return codes) and a qemu boot log till login
 # Booting is handled by this class, and it's not a test in itself.
@@ -41,6 +42,43 @@ do_testimage[nostamp] = "1"
 do_testimage[depends] += "qemu-native:do_populate_sysroot"
 do_testimage[depends] += "qemu-helper-native:do_populate_sysroot"
 
+
+def get_tests_list(d):
+    testsuites = d.getVar("TEST_SUITES", True).split()
+    bbpath = d.getVar("BBPATH", True).split(':')
+
+    # This relies on lib/ under each directory in BBPATH being added to sys.path
+    # (as done by default in base.bbclass)
+    testslist = []
+    for testname in testsuites:
+        if testname != "auto":
+            found = False
+            for p in bbpath:
+                if os.path.exists(os.path.join(p, 'lib', 'oeqa', 'runtime', testname + '.py')):
+                    testslist.append("oeqa.runtime." + testname)
+                    found = True
+                    break
+            if not found:
+                bb.error('Test %s specified in TEST_SUITES could not be found in lib/oeqa/runtime under BBPATH' % testname)
+
+    if "auto" in testsuites:
+        def add_auto_list(path):
+            if not os.path.exists(os.path.join(path, '__init__.py')):
+                bb.fatal('Tests directory %s exists but is missing __init__.py' % path)
+            files = sorted([f for f in os.listdir(path) if f.endswith('.py') and not f.startswith('_')])
+            for f in files:
+                module = 'oeqa.runtime.' + f[:-3]
+                if module not in testslist:
+                    testslist.append(module)
+
+        for p in bbpath:
+            testpath = os.path.join(p, 'lib', 'oeqa', 'runtime')
+            bb.debug(2, 'Searching for tests in %s' % testpath)
+            if os.path.exists(testpath):
+                add_auto_list(testpath)
+
+    return testslist
+
 def testimage_main(d):
     import unittest
     import os
@@ -55,23 +93,16 @@ def testimage_main(d):
     bb.utils.mkdirhier(testdir)
 
     # tests in TEST_SUITES become required tests
-    # they won't be skipped even if they aren't suitable for a default image (like xorg for minimal)
-    testsuites = d.getVar("TEST_SUITES", True)
-    # testslist is what we'll run and order matters
-    testslist = [ x for x in testsuites.split() if x != "auto" ]
-    # if we have auto search for other modules
-    if "auto" in testsuites:
-        for f in os.listdir(os.path.dirname(os.path.abspath(oeqa.runtime.__file__))):
-            if f.endswith('.py') and not f.startswith('_')  and f[:-3] not in testslist:
-                testslist.append(f[:-3])
-
-    testslist = [ "oeqa.runtime." + x for x in testslist ]
+    # they won't be skipped even if they aren't suitable for a image (like xorg for minimal)
+    # testslist is what we'll actually pass to the unittest loader
+    testslist = get_tests_list(d)
+    testsrequired = [t for t in d.getVar("TEST_SUITES", True).split() if t != "auto"]
 
     class TestContext:
         def __init__(self):
             self.d = d
             self.testslist = testslist
-            self.testsrequired = testsuites.split()
+            self.testsrequired = testsrequired
             self.filesdir = os.path.join(os.path.dirname(os.path.abspath(oeqa.runtime.__file__)),"files")
 
     # test context
diff --git a/meta/lib/oeqa/runtime/__init__.py b/meta/lib/oeqa/runtime/__init__.py
index e69de29..4cf3fa7 100644
--- a/meta/lib/oeqa/runtime/__init__.py
+++ b/meta/lib/oeqa/runtime/__init__.py
@@ -0,0 +1,3 @@
+# Enable other layers to have tests in the same named directory
+from pkgutil import extend_path
+__path__ = extend_path(__path__, __name__)
-- 
1.8.1.2


