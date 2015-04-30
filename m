Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4EA9072491
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 10:33:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 30 Apr 2015 03:33:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,676,1422950400"; d="scan'208";a="718354655"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 30 Apr 2015 03:33:50 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 92C836A408F;
	Thu, 30 Apr 2015 03:33:21 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Apr 2015 13:33:40 +0300
Message-Id: <1430390020-5607-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic tests: Move wic tests to oe-selftest infra
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
X-List-Received-Date: Thu, 30 Apr 2015 10:33:50 -0000

Modified existing wic test modules to work with oe-selftest
infrastructure.

$ oe-selftest --run-tests wic
...
test01_help (oeqa.selftest.wic.Wic)
Test wic --help ... ok
test02_createhelp (oeqa.selftest.wic.Wic)
Test wic create --help ... ok
test03_listhelp (oeqa.selftest.wic.Wic)
Test wic list --help ... ok
test04_build_image_name (oeqa.selftest.wic.Wic)
Test wic create directdisk --image-name core-image-minimal ... ok
test05_build_artifacts (oeqa.selftest.wic.Wic)
Test wic create directdisk providing all artifacts. ... ok

----------------------------------------------------------------------
Ran 5 tests in 6.434s

OK

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py           | 69 +++++++++++++++++++++++++++++++++
 scripts/setup.cfg                       |  6 ---
 scripts/tests/01_wic_test_help.py       | 44 ---------------------
 scripts/tests/02_wic_test_directdisk.py | 63 ------------------------------
 4 files changed, 69 insertions(+), 113 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/wic.py
 delete mode 100644 scripts/setup.cfg
 delete mode 100644 scripts/tests/01_wic_test_help.py
 delete mode 100644 scripts/tests/02_wic_test_directdisk.py

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
new file mode 100644
index 0000000..c628b59
--- /dev/null
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -0,0 +1,69 @@
+#!/usr/bin/env python
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2015, Intel Corporation.
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# AUTHORS
+# Ed Bartosh <ed.bartosh@linux.intel.com>
+
+"""Test cases for wic."""
+
+import sys
+
+from glob import glob
+from shutil import rmtree
+
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import runCmd
+
+class Wic(oeSelfTest):
+    """Wic test class."""
+
+    resultdir = "/var/tmp/wic/build/"
+
+    def setUp(self):
+        """This code is executed before each test method."""
+        rmtree(self.resultdir, ignore_errors=True)
+
+    def test01_help(self):
+        """Test wic --help"""
+        self.assertEqual(0, runCmd('wic --help').status)
+
+    def test02_createhelp(self):
+        """Test wic create --help"""
+        self.assertEqual(0, runCmd('wic creat --help').status)
+
+    def test03_listhelp(self):
+        """Test wic list --help"""
+        self.assertEqual(0, runCmd('wic list --help').status)
+
+    def test04_build_image_name(self):
+        """Test wic create directdisk --image-name core-image-minimal"""
+        self.assertEqual(0, runCmd("wic create directdisk "
+                                   "--image-name core-image-minimal").status)
+        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+
+    def test05_build_artifacts(self):
+        """Test wic create directdisk providing all artifacts."""
+        self.assertEqual(0, runCmd("wic create directdisk "
+                                   "-b tmp/sysroots/qemux86/usr/share "
+                                   "-k tmp/deploy/images/qemux86 "
+                                   "-n tmp/sysroots/x86_64-linux "
+                                   "-r tmp/work/qemux86-poky-linux/"
+                                   "core-image-minimal/1.0-r0/rootfs").status)
+        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
diff --git a/scripts/setup.cfg b/scripts/setup.cfg
deleted file mode 100644
index f378efa..0000000
--- a/scripts/setup.cfg
+++ /dev/null
@@ -1,6 +0,0 @@
-[nosetests]
-verbosity=2
-exe=1
-with-coverage=1
-cover-erase=1
-cover-package=wic,image,wic.imager
diff --git a/scripts/tests/01_wic_test_help.py b/scripts/tests/01_wic_test_help.py
deleted file mode 100644
index 4aaa66f..0000000
--- a/scripts/tests/01_wic_test_help.py
+++ /dev/null
@@ -1,44 +0,0 @@
-#!/usr/bin/env python
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-#
-# Copyright (c) 2015, Intel Corporation.
-# All rights reserved.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# AUTHORS
-# Ed Bartosh <ed.bartosh@linux.intel.com>
-
-import imp
-import unittest
-
-class TestWicHelp(unittest.TestCase):
-    """Test help output of wic (sub)commands"""
-
-    def setUp(self):
-        """This code is executed before each test method."""
-        self.main = imp.load_source("wic", "wic").main
-
-    def testhelp(self):
-        """Test wic --help"""
-        self.assertRaises(SystemExit, self.main, ['--help'])
-
-    def testcreatehelp(self):
-        """Test wic create --help"""
-        self.assertRaises(SystemExit, self.main, ['create', '--help'])
-
-    def testlisthelp(self):
-        """Test wic list --help"""
-        self.assertRaises(SystemExit, self.main, ['list', '--help'])
diff --git a/scripts/tests/02_wic_test_directdisk.py b/scripts/tests/02_wic_test_directdisk.py
deleted file mode 100644
index 6beff71..0000000
--- a/scripts/tests/02_wic_test_directdisk.py
+++ /dev/null
@@ -1,63 +0,0 @@
-#!/usr/bin/env python
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-#
-# Copyright (c) 2015, Intel Corporation.
-# All rights reserved.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# AUTHORS
-# Ed Bartosh <ed.bartosh@linux.intel.com>
-
-"""Test directdisk builds."""
-
-import imp
-import unittest
-import os
-import shutil
-import glob
-
-class TestWicDirectdisk(unittest.TestCase):
-    """Test build of directdisk image"""
-    def __init__(self, methodName='runTest'):
-        unittest.TestCase.__init__(self, methodName)
-        self.main = imp.load_source("wic", "wic").main
-        self.resultdir = "/var/tmp/wic/build/"
-
-    def setUp(self):
-        """This code executes before each test method."""
-        shutil.rmtree(self.resultdir)
-        os.chdir(os.getenv("BUILDDIR"))
-
-    def _build(self, cmdline):
-        """Call self.main with provided commandline."""
-        self.assertIsNone(self.main(cmdline))
-        self.assertEqual(1, len(glob.glob(self.resultdir + \
-                                "directdisk-*.direct")))
-
-    def testbuild_image_name(self):
-        """Test wic create directdisk --image-name core-image-minimal"""
-        self._build(["create", "directdisk",
-                     "--image-name", "core-image-minimal"])
-
-    def testbuild_artifacts(self):
-        """Test wic create directdisk providing all artifacts."""
-        self._build(["create", "directdisk",
-                     "-b", "tmp/sysroots/qemux86/usr/share",
-                     "-k", "tmp/deploy/images/qemux86",
-                     "-n", "tmp/sysroots/x86_64-linux",
-                     "-r", "tmp/work/qemux86-poky-linux/"
-                           "core-image-minimal/1.0-r0/rootfs"])
-
-- 
2.1.4


