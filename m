Return-Path: <william.c.randle@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6502373185
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 17:17:52 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 13 Apr 2016 10:17:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,480,1455004800"; d="scan'208";a="784204093"
Received: from wcrandle-mobl1.jf.intel.com ([10.24.4.174])
	by orsmga003.jf.intel.com with ESMTP; 13 Apr 2016 10:17:54 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Apr 2016 10:17:42 -0700
Message-Id: <1460567862-26398-1-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] ext-sdk-prepare.py: exclude do_rm_work from unexpected output; create unit test
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
X-List-Received-Date: Wed, 13 Apr 2016 17:17:54 -0000

When installing the esdk with INHERIT += "rm_work", the script complains
about do_rm_work as unexpected output from the bitbake run. This patch
ignores any output lines with do_rm_work and further refactors the
output comparison into its own function creates a new unit test to
verify the fix. The unit test can be run direct from the command line or
via oe-selftest.

[YOCTO #9019]

Signed-off-by: Bill Randle <william.c.randle@intel.com>
---
 meta/files/ext-sdk-prepare.py          | 27 +++++++-----
 meta/lib/oeqa/selftest/esdk_prepare.py | 75 ++++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+), 11 deletions(-)
 create mode 100755 meta/lib/oeqa/selftest/esdk_prepare.py

diff --git a/meta/files/ext-sdk-prepare.py b/meta/files/ext-sdk-prepare.py
index 80db8bb..605e2eb 100644
--- a/meta/files/ext-sdk-prepare.py
+++ b/meta/files/ext-sdk-prepare.py
@@ -27,6 +27,21 @@ def exec_watch(cmd, **options):
 
     return process.returncode, buf
 
+def check_unexpected(lines, recipes):
+    """Check for unexpected output lines from dry run"""
+    unexpected = []
+    for line in lines.splitlines():
+        if 'Running task' in line:
+            for recipe in recipes:
+                if recipe in line:
+                    break
+            else:
+                line = line.split('Running', 1)[-1]
+                if 'do_rm_work' not in line:
+                    unexpected.append(line.rstrip())
+        elif 'Running setscene' in line:
+            unexpected.append(line.rstrip())
+    return unexpected
 
 def main():
     if len(sys.argv) < 2:
@@ -67,17 +82,7 @@ def main():
 
     try:
         out = subprocess.check_output('bitbake %s -n' % ' '.join(sdk_targets), stderr=subprocess.STDOUT, shell=True)
-        unexpected = []
-        for line in out.splitlines():
-            if 'Running task' in line:
-                for recipe in recipes:
-                    if recipe in line:
-                        break
-                else:
-                    line = line.split('Running', 1)[-1]
-                    unexpected.append(line.rstrip())
-            elif 'Running setscene' in line:
-                unexpected.append(line.rstrip())
+        unexpected = check_unexpected(out, recipes)
     except subprocess.CalledProcessError as e:
         print('ERROR: Failed to execute dry-run:\n%s' % e.output)
         return 1
diff --git a/meta/lib/oeqa/selftest/esdk_prepare.py b/meta/lib/oeqa/selftest/esdk_prepare.py
new file mode 100755
index 0000000..1b36a0d
--- /dev/null
+++ b/meta/lib/oeqa/selftest/esdk_prepare.py
@@ -0,0 +1,75 @@
+#!/usr/bin/env python
+
+import shutil, tempfile
+import sys
+import os
+import imp
+import unittest
+try:
+    from oeqa.utils.commands import get_bb_var
+except ImportError:
+    pass
+
+# module under test
+module_file_name = "ext-sdk-prepare.py"
+module_path = ""
+
+class ExtSdkPrepareTest(unittest.TestCase):
+
+    """ unit test for fix for Yocto #9019 """
+
+    @classmethod
+    def setUpClass(self):
+        # copy module under test to temp dir
+        self.test_dir = tempfile.mkdtemp()
+        module_dest_path = os.path.join(self.test_dir, module_file_name)
+        try:
+            shutil.copy(module_path, self.test_dir)
+            # load module under test
+            self.test_mod = imp.load_source("", module_dest_path)
+        except:
+            print "error: unable to copy or load %s [src: %s, dst: %s]" % \
+                    (module_file_name, module_path, module_dest_path)
+            sys.exit(1)
+
+    def test_prepare_unexpected(self):
+        # test data
+        # note: pathnames have been truncated from the actual bitbake
+        # output as they are not important for the test.
+        test_data = ( 
+            'NOTE: Running noexec task 9 of 6539 (ID: 28, quilt/quilt-native_0.64.bb, do_build)\n'
+            'NOTE: Running task 10 of 6539 (ID: 29, quilt/quilt-native_0.64.bb, do_package)\n'
+            'NOTE: Running task 11 of 6539 (ID: 30, quilt/quilt-native_0.64.bb, do_rm_work)\n'
+            'NOTE: Running noexec task 6402 of 6539 (ID: 1, images/core-image-sato.bb, do_patch)\n'
+            'NOTE: Running task 6538 of 6539 (ID: 14, images/core-image-sato.bb, do_rm_work)\n'
+        )
+        # expected warning output
+        expected = [ (' task 10 of 6539 (ID: 29, quilt/quilt-native_0.64.bb, do_package)') ]
+        # recipe to test, matching test input data
+        recipes = [ "core-image-sato.bb" ]
+
+        # run the test
+        output = self.test_mod.check_unexpected(test_data, recipes)
+        self.assertEqual(output, expected)
+
+    @classmethod
+    def tearDownClass(self):
+        # remove temp dir
+        shutil.rmtree(self.test_dir)
+
+if __name__ == '__main__':
+    # running from command line - i.e., not under oe-selftest
+    # directory containing module under test comes from command line
+    if len(sys.argv) == 2 and os.path.isdir(sys.argv[1]):
+        module_path = os.path.join(sys.argv[1], module_file_name)
+        suite = unittest.TestLoader().loadTestsFromTestCase(ExtSdkPrepareTest)
+        unittest.TextTestRunner().run(suite)
+    else:
+        progname = os.path.basename(sys.argv[0])
+        print "%s: missing directory path" % progname
+        print "usage: %s /path/to/directory-of(ext-sdk-prepare.py)" % progname
+        sys.exit(1)
+else:
+    # running under oe-selftest
+    # determine module source dir from COREBASE and expected path
+    module_path = os.path.join(get_bb_var("COREBASE"), "meta", "files", module_file_name)
-- 
2.5.0


