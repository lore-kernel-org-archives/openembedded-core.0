Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AD7666013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 21:18:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jul 2016 14:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,325,1464678000"; d="scan'208";a="731111608"
Received: from jtsai-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.253])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Jul 2016 14:17:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2016 09:17:32 +1200
Message-Id: <97d1e25707b4d9e927e431204a7169cdfda87edc.1467926203.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1467926203.git.paul.eggleton@linux.intel.com>
References: <cover.1467926203.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1467926203.git.paul.eggleton@linux.intel.com>
References: <cover.1467926203.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] oe-selftest: drop test_prepare_unexpected
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
X-List-Received-Date: Thu, 07 Jul 2016 21:18:08 -0000

This test refers to a function that no longer exists after the eSDK
install double execution of bitbake has been removed, and since
test_prepare_unexpected is the only test in this module, drop the
entire module. We can easily resurrect it if we have unit tests to add
in the future.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/esdk_prepare.py | 75 ----------------------------------
 1 file changed, 75 deletions(-)
 delete mode 100755 meta/lib/oeqa/selftest/esdk_prepare.py

diff --git a/meta/lib/oeqa/selftest/esdk_prepare.py b/meta/lib/oeqa/selftest/esdk_prepare.py
deleted file mode 100755
index 4060897..0000000
--- a/meta/lib/oeqa/selftest/esdk_prepare.py
+++ /dev/null
@@ -1,75 +0,0 @@
-#!/usr/bin/env python
-
-import shutil, tempfile
-import sys
-import os
-import imp
-import unittest
-try:
-    from oeqa.utils.commands import get_bb_var
-except ImportError:
-    pass
-
-# module under test
-module_file_name = "ext-sdk-prepare.py"
-module_path = ""
-
-class ExtSdkPrepareTest(unittest.TestCase):
-
-    """ unit test for fix for Yocto #9019 """
-
-    @classmethod
-    def setUpClass(self):
-        # copy module under test to temp dir
-        self.test_dir = tempfile.mkdtemp()
-        module_dest_path = os.path.join(self.test_dir, module_file_name)
-        try:
-            shutil.copy(module_path, self.test_dir)
-            # load module under test
-            self.test_mod = imp.load_source("", module_dest_path)
-        except:
-            print("error: unable to copy or load %s [src: %s, dst: %s]" % \
-                    (module_file_name, module_path, module_dest_path))
-            sys.exit(1)
-
-    def test_prepare_unexpected(self):
-        # test data
-        # note: pathnames have been truncated from the actual bitbake
-        # output as they are not important for the test.
-        test_data = ( 
-            'NOTE: Running noexec task 9 of 6539 (ID: 28, quilt/quilt-native_0.64.bb, do_build)\n'
-            'NOTE: Running task 10 of 6539 (ID: 29, quilt/quilt-native_0.64.bb, do_package)\n'
-            'NOTE: Running task 11 of 6539 (ID: 30, quilt/quilt-native_0.64.bb, do_rm_work)\n'
-            'NOTE: Running noexec task 6402 of 6539 (ID: 1, images/core-image-sato.bb, do_patch)\n'
-            'NOTE: Running task 6538 of 6539 (ID: 14, images/core-image-sato.bb, do_rm_work)\n'
-        )
-        # expected warning output
-        expected = [ (' task 10 of 6539 (ID: 29, quilt/quilt-native_0.64.bb, do_package)') ]
-        # recipe to test, matching test input data
-        recipes = [ "core-image-sato.bb" ]
-
-        # run the test
-        output = self.test_mod.check_unexpected(test_data, recipes)
-        self.assertEqual(output, expected)
-
-    @classmethod
-    def tearDownClass(self):
-        # remove temp dir
-        shutil.rmtree(self.test_dir)
-
-if __name__ == '__main__':
-    # running from command line - i.e., not under oe-selftest
-    # directory containing module under test comes from command line
-    if len(sys.argv) == 2 and os.path.isdir(sys.argv[1]):
-        module_path = os.path.join(sys.argv[1], module_file_name)
-        suite = unittest.TestLoader().loadTestsFromTestCase(ExtSdkPrepareTest)
-        unittest.TextTestRunner().run(suite)
-    else:
-        progname = os.path.basename(sys.argv[0])
-        print("%s: missing directory path" % progname)
-        print("usage: %s /path/to/directory-of(ext-sdk-prepare.py)" % progname)
-        sys.exit(1)
-else:
-    # running under oe-selftest
-    # determine module source dir from COREBASE and expected path
-    module_path = os.path.join(get_bb_var("COREBASE"), "meta", "files", module_file_name)
-- 
2.5.5


