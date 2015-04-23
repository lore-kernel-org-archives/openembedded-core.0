Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 80B48605D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 20:26:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 23 Apr 2015 13:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,634,1422950400"; d="scan'208";a="484842430"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Apr 2015 13:26:00 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 5D4346A408F;
	Thu, 23 Apr 2015 13:25:34 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 23:25:40 +0300
Message-Id: <1429820740-5133-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic tests: Add functional tests for directdisk
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
X-List-Received-Date: Thu, 23 Apr 2015 20:26:13 -0000

Added 2 simple functional test cases to check if
wic is able to produce images using directdisk.wks

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/setup.cfg                       |  2 +-
 scripts/tests/02_wic_test_directdisk.py | 61 +++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 scripts/tests/02_wic_test_directdisk.py

diff --git a/scripts/setup.cfg b/scripts/setup.cfg
index 48a0bb2..f378efa 100644
--- a/scripts/setup.cfg
+++ b/scripts/setup.cfg
@@ -3,4 +3,4 @@ verbosity=2
 exe=1
 with-coverage=1
 cover-erase=1
-cover-package=wic,image
+cover-package=wic,image,wic.imager
diff --git a/scripts/tests/02_wic_test_directdisk.py b/scripts/tests/02_wic_test_directdisk.py
new file mode 100644
index 0000000..9108621
--- /dev/null
+++ b/scripts/tests/02_wic_test_directdisk.py
@@ -0,0 +1,61 @@
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
+"""Test directdisk builds."""
+
+import imp
+import unittest
+import os
+import shutil
+import glob
+
+class TestWicDirectdisk(unittest.TestCase):
+    """Test build of directdisk image"""
+    def __init__(self, methodName='runTest'):
+        unittest.TestCase.__init__(self, methodName)
+        self.main = imp.load_source("wic", "wic").main
+        self.resultdir = "/var/tmp/wic/build/"
+
+    def setUp(self):
+        """This code executes before each test method."""
+        shutil.rmtree(self.resultdir)
+        os.chdir(os.getenv("BUILDDIR"))
+
+    def _build(self, cmdline):
+        """Call self.main with provided commandline."""
+        self.assertIsNone(self.main(cmdline))
+        self.assertEqual(1, len(glob.glob(self.resultdir + \
+                                "directdisk-*.direct")))
+
+    def testbuild_image_name(self):
+        self._build(["create", "directdisk",
+                     "--image-name", "core-image-minimal"])
+
+    def testbuild_artifacts(self):
+        self._build(["create", "directdisk",
+                     "-b", "tmp/sysroots/qemux86/usr/share",
+                     "-k", "tmp/deploy/images/qemux86",
+                     "-n", "tmp/sysroots/x86_64-linux",
+                     "-r", "tmp/work/qemux86-poky-linux/"
+                           "core-image-minimal/1.0-r0/rootfs"])
+
-- 
2.1.4


