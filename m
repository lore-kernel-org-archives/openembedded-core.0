Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 2EFED77182
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 91DF8600F52
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:58 +0100
Message-Id: <86a7e68803aca58feca9b6cf479552d14b00996c.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 37/52] oeqa/selftest/bbtests: Updated bitbake TCs
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:27 -0000

From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>

- Added new TC test_force_task_1 (1354);
check that do_package_write_rpm() re-executes
upon changes in package image.

- Updated TC test_force_task_2 (163);
changed test recipe to zlib and added
do_package() to the task execution list.

- Removed unnecessary imports.

Fix for bug [YOCTO #5875].

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 45 ++++++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index af0773d..1c0e588 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -1,8 +1,5 @@
-import unittest
 import os
-import logging
 import re
-import shutil
 
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
@@ -68,15 +65,43 @@ class BitbakeTests(oeSelfTest):
         bitbake('-cclean man')
         self.assertTrue("ERROR: Function failed: patch_do_patch" in result.output, msg = "Though no man-1.5h1-make.patch file exists, bitbake didn't output any err. message. bitbake output: %s" % result.output)
 
+    @testcase(1354)
+    def test_force_task_1(self):
+        # test 1 from bug 5875
+        test_recipe = 'zlib'
+        test_data = "Microsoft Made No Profit From Anyone's Zunes Yo"
+        image_dir = get_bb_var('D', test_recipe)
+        pkgsplit_dir = get_bb_var('PKGDEST', test_recipe)
+        man_dir = get_bb_var('mandir', test_recipe)
+
+        bitbake('-c cleansstate %s' % test_recipe)
+        bitbake(test_recipe)
+        self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
+
+        man_file = os.path.join(image_dir + man_dir, 'man3/zlib.3')
+        ftools.append_file(man_file, test_data)
+        bitbake('-c package -f %s' % test_recipe)
+
+        man_split_file = os.path.join(pkgsplit_dir, 'zlib-doc' + man_dir, 'man3/zlib.3')
+        man_split_content = ftools.read_file(man_split_file)
+        self.assertIn(test_data, man_split_content, 'The man file has not changed in packages-split.')
+
+        ret = bitbake(test_recipe)
+        self.assertIn('task do_package_write_rpm:', ret.output, 'Task do_package_write_rpm did not re-executed.')
+
     @testcase(163)
-    def test_force_task(self):
-        bitbake('m4-native')
-        self.add_command_to_tearDown('bitbake -c clean m4-native')
-        result = bitbake('-C compile m4-native')
-        look_for_tasks = ['do_compile', 'do_install', 'do_populate_sysroot']
+    def test_force_task_2(self):
+        # test 2 from bug 5875
+        test_recipe = 'zlib'
+
+        bitbake('-c cleansstate %s' % test_recipe)
+        bitbake(test_recipe)
+        self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
+
+        result = bitbake('-C compile %s' % test_recipe)
+        look_for_tasks = ['do_compile:', 'do_install:', 'do_populate_sysroot:', 'do_package:']
         for task in look_for_tasks:
-            find_task = re.search("m4-native.*%s" % task, result.output)
-            self.assertTrue(find_task, msg = "Couldn't find %s task. bitbake output %s" % (task, result.output))
+            self.assertIn(task, result.output, msg="Couldn't find %s task.")
 
     @testcase(167)
     def test_bitbake_g(self):
-- 
2.1.4


