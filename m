Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D6FC66ABF7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 10:22:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Apr 2015 03:22:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,556,1422950400"; d="scan'208";a="706783994"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 10 Apr 2015 03:22:53 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 73DAB6A408D;
	Fri, 10 Apr 2015 03:22:29 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 13:22:35 +0300
Message-Id: <1428661355-25192-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: setup infrastructure for nosetests
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
X-List-Received-Date: Fri, 10 Apr 2015 10:22:55 -0000

cd scripts && nosetests runs 3 simple tests and
produces nice test coverage report for wic codebase.

This infra can be used to test other scripts and modules.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/setup.cfg                 |  6 ++++++
 scripts/tests/01_wic_test_help.py | 40 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 scripts/setup.cfg
 create mode 100644 scripts/tests/01_wic_test_help.py

diff --git a/scripts/setup.cfg b/scripts/setup.cfg
new file mode 100644
index 0000000..48a0bb2
--- /dev/null
+++ b/scripts/setup.cfg
@@ -0,0 +1,6 @@
+[nosetests]
+verbosity=2
+exe=1
+with-coverage=1
+cover-erase=1
+cover-package=wic,image
diff --git a/scripts/tests/01_wic_test_help.py b/scripts/tests/01_wic_test_help.py
new file mode 100644
index 0000000..a64cf2f
--- /dev/null
+++ b/scripts/tests/01_wic_test_help.py
@@ -0,0 +1,40 @@
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
+import imp
+import unittest
+
+class TestWicHelp(unittest.TestCase):
+    """Test help output of wic (sub)commands"""
+
+    def setUp(self):
+        self.main = imp.load_source("wic", "wic").main
+
+    def testhelp(self):
+        self.assertRaises(SystemExit, self.main, ['--help'])
+
+    def testcreatehelp(self):
+        self.assertRaises(SystemExit, self.main, ['create', '--help'])
+
+    def testlisthelp(self):
+        self.assertRaises(SystemExit, self.main, ['list', '--help'])
-- 
2.1.4


