Return-Path: <costin.c.constantin@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8154475954
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jun 2015 20:48:36 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 13 Jun 2015 13:48:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,608,1427785200"; d="scan'208";a="587304275"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 13 Jun 2015 13:48:37 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id D25D66A4083;
	Sat, 13 Jun 2015 13:48:01 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Jun 2015 23:58:38 +0300
Message-Id: <1434229118-31859-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] scripts/oe-selftest: enhancement 7865
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
X-List-Received-Date: Sat, 13 Jun 2015 20:48:39 -0000

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 scripts/oe-selftest | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index a04e9fc..1a89c31 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -16,7 +16,10 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 # DESCRIPTION
-# This script runs tests defined in meta/lib/selftest/
+# This script runs tests defined in meta/lib/selftest/ for all $BUILDDIR/../meta* layers
+# In order to work, each meta* layer needs to have a relative lib/oeqa/selftest path to it.
+# Subdirectories to this relative path are accepted.
+# Test module names need to be unique between all layers.
 # It's purpose is to automate the testing of different bitbake tools.
 # To use it you just need to source your build environment setup script and
 # add the meta-selftest layer to your BBLAYERS.
@@ -24,15 +27,26 @@
 # Call the script as: "oe-selftest <module>.<Class>.<method>" to run just a single test
 # E.g: "oe-selftest bboutput.BitbakeLayers" will run just the BitbakeLayers class from meta/lib/selftest/bboutput.py
 
-
 import os
 import sys
 import unittest
 import logging
 import argparse
+import glob as g
 
 sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'meta/lib')))
 
+tests_path = g.glob(os.path.abspath(os.path.join(os.getenv("BUILDDIR"), "..", "meta*/lib/oeqa/selftest")))
+# adding tests paths to the sys.path enabling dynamic import further on
+# support for subdirectories is also added
+test_subdirs = []
+for pth in tests_path:
+    sys.path.insert(0, pth)
+    for sbd in g.glob(pth + "/*"):
+        if os.path.isdir(sbd):
+            sys.path.append(sbd)
+            test_subdirs.append(sbd)
+
 import oeqa.selftest
 import oeqa.utils.ftools as ftools
 from oeqa.utils.commands import runCmd, get_bb_var, get_test_layer
@@ -125,14 +139,13 @@ def remove_inc_files():
 def get_tests(exclusive_modules=[], include_hidden=False):
     testslist = []
     for x in exclusive_modules:
-        testslist.append('oeqa.selftest.' + x)
+        testslist.append(x)
     if not testslist:
-        testpath = os.path.abspath(os.path.dirname(oeqa.selftest.__file__))
-        files = sorted([f for f in os.listdir(testpath) if f.endswith('.py') and not (f.startswith('_') and not include_hidden) and not f.startswith('__') and f != 'base.py'])
-        for f in files:
-            module = 'oeqa.selftest.' + f[:-3]
-            testslist.append(module)
-
+        for pth in (tests_path + test_subdirs) :
+            files = sorted([f for f in os.listdir(pth) if f.endswith('.py') and not (f.startswith('_') and not include_hidden) and not f.startswith('__') and f != 'base.py'])
+            for f in files:
+                module = f[:-3]
+                testslist.append(module)
     return testslist
 
 def main():
@@ -145,8 +158,7 @@ def main():
     if args.list_modules:
         log.info('Listing all available test modules:')
         testslist = get_tests(include_hidden=True)
-        for test in testslist:
-            module = test.split('.')[-1]
+        for module in testslist:
             info = ''
             if module.startswith('_'):
                 info = ' (hidden)'
@@ -154,7 +166,7 @@ def main():
             if args.list_allclasses:
                 try:
                     import importlib
-                    modlib = importlib.import_module(test)
+                    modlib = importlib.import_module(module)
                     for v in vars(modlib):
                         t = vars(modlib)[v]
                         if isinstance(t, type(oeSelfTest)) and issubclass(t, oeSelfTest) and t!=oeSelfTest:
-- 
2.1.4


