Return-Path: <sharron.liu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC576E630
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 07:27:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 05 Aug 2015 00:27:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,614,1432623600"; d="scan'208";a="742493343"
Received: from u1304-liuxr.sh.intel.com ([10.239.159.84])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2015 00:27:13 -0700
From: "LIU, Sharron" <sharron.liu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Aug 2015 15:17:56 +0800
Message-Id: <1438759076-9075-1-git-send-email-sharron.liu@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] oe-selftest: support selftests from other layers
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
X-List-Received-Date: Wed, 05 Aug 2015 07:27:17 -0000

[YOCTO #7865] https://bugzilla.yoctoproject.org/show_bug.cgi?id=7865

This script is extended to detect and run tests from all BBLAYERS added to
BBPATH. Tests can be put in any sub-dir, except for "files" which is treated
as test dependent files.

To detect tests, this patch goes through "lib/oeqa/selftest/" of every layer
added to BBPATH.
To support sub-dir, this patch list test module with its sub-dirs prefix.
To run tests, this patch adds tests package path into "sys.path" then reload
"oeqa.selftest".

Signed-off-by: LIU, Sharron <sharron.liu@intel.com>
---
 scripts/oe-selftest | 42 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 91e2dd2..b441a08 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -23,7 +23,15 @@
 # Call the script as: "oe-selftest" to run all the tests in in meta/lib/selftest/
 # Call the script as: "oe-selftest <module>.<Class>.<method>" to run just a single test
 # E.g: "oe-selftest bboutput.BitbakeLayers" will run just the BitbakeLayers class from meta/lib/selftest/bboutput.py
-
+#
+# The script is extended to support detecting tests from "lib/oeqa/selftest/*/"
+# from any BBLAYERS added to BBPATH. Tests can be put in any subdir,
+# except for "files" which is treated as test dependent files.
+# Eg.: meta-mylayer/lib/oeqa/selftest/subdirs/mytest.py
+# Call the script as: "oe-selftest --list-modules", you'll have
+#         subdirs.mytest
+# Call the script as: "oe-selftest --runtests subdirs.mytest", you'll have
+# the test run.
 
 import os
 import sys
@@ -41,6 +49,13 @@ import oeqa.utils.ftools as ftools
 from oeqa.utils.commands import runCmd, get_bb_var, get_test_layer
 from oeqa.selftest.base import oeSelfTest
 
+# add test cases location into the python searching path
+for l in get_bb_var('BBPATH').split(':'):
+    if os.path.exists(os.path.abspath(os.path.join(l, 'lib/oeqa/selftest'))):
+        sys.path.insert(0, os.path.abspath(os.path.join(l, 'lib')))
+# reloading this package is necessary due to "sys.path" updated
+reload(oeqa.selftest)
+
 def logger_create():
     log = logging.getLogger("selftest")
     log.setLevel(logging.DEBUG)
@@ -145,12 +160,20 @@ def get_tests(exclusive_modules=[], include_hidden=False):
     for x in exclusive_modules:
         testslist.append('oeqa.selftest.' + x)
     if not testslist:
-        for testpath in oeqa.selftest.__path__:
-            files = sorted([f for f in os.listdir(testpath) if f.endswith('.py') and not (f.startswith('_') and not include_hidden) and not f.startswith('__') and f != 'base.py'])
-            for f in files:
-                module = 'oeqa.selftest.' + f[:-3]
-                if module not in testslist:
-                    testslist.append(module)
+        # add test cases to "testslist" for every subfolder of "oeqa/selftest/"
+        def _addtest(args, dname, fnames):
+            if (os.path.basename(dname) != 'files'): # 'files' folder is skipped
+                # d is sub-dirs name. eg.: "oeqa/selftest/cfg/mytest.py", d=cfg
+                d=dname[args[0]:].replace('/','.')
+                for f in fnames:
+                    if (f.endswith('.py') and not (f.startswith('_') and not include_hidden) and not f.startswith('__') and f != 'base.py'):
+                        # test is added as "oeqa.selftest.cfg.mytest"
+                        testslist.append('oeqa.selftest'+d+'.'+f[:-3])
+        # detect test cases from all layers that added to "BBPATH"
+        for l in get_bb_var('BBPATH').split(':'):
+            testpath = os.path.join(l, 'lib', 'oeqa', 'selftest')
+            if os.path.exists(testpath):
+                os.path.walk(testpath, _addtest, [len(testpath)])
 
     return testslist
 
@@ -172,7 +195,10 @@ def main():
         log.info('Listing all available test modules:')
         testslist = get_tests(include_hidden=True)
         for test in testslist:
-            module = test.split('.')[-1]
+            # list test with its sub-dirs name relative to oeqa.selftest
+            # eg.: "oeqa.selftest.cfg.mytest" is listed as "cfg.mytest" for
+            # passing to "--run-tests <module>"
+            module = test.split('.',2)[-1]
             info = ''
             if module.startswith('_'):
                 info = ' (hidden)'
-- 
1.9.1


