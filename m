Return-Path: <jing.j.wang@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 68CBA77206
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 01:20:57 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 12 Sep 2016 18:20:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,326,1470726000"; d="scan'208";a="760043751"
Received: from iot.sh.intel.com ([10.239.52.75])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Sep 2016 18:20:58 -0700
From: jwang <jing.j.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2016 09:17:32 +0800
Message-Id: <1473729455-32649-1-git-send-email-jing.j.wang@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/4] meta: introduce a small baserunner framework
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
X-List-Received-Date: Tue, 13 Sep 2016 01:21:00 -0000

From: zjh <junhuix.zhang@intel.com>

Signed-off-by: zjh <junhuix.zhang@intel.com>
---
 meta/lib/base/baserunner.py | 60 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100755 meta/lib/base/baserunner.py

diff --git a/meta/lib/base/baserunner.py b/meta/lib/base/baserunner.py
new file mode 100755
index 0000000..56b838e
--- /dev/null
+++ b/meta/lib/base/baserunner.py
@@ -0,0 +1,60 @@
+#!/usr/bin/env python
+# Copyright (C) 2013 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+
+# Base unittest module used by testrunner
+# This provides the common test runner functionalities including manifest input,
+# xunit output, timeout, tag filtering.
+
+"""Base testrunner"""
+
+from __future__ import absolute_import
+import os
+import sys
+import time
+import unittest
+import shutil
+
+class TestContext(object):
+    '''test context which inject into testcase'''
+    def __init__(self):
+        self.target = None
+
+class FakeOptions(object):
+    '''This class just use for configure's defualt arg.
+       Usually, we use this object in a non comandline environment.'''
+    timeout = 0
+    def __getattr__(self, name):
+        return None
+
+class TestRunnerBase(object):
+    '''test runner base '''
+    def __init__(self, context=None):
+        self.tclist = []
+        self.runner = None
+        self.context = context if context else TestContext()
+        self.test_result = None
+        self.run_time = None
+
+
+    def configure(self, options=FakeOptions()):
+        '''configure before testing'''
+        pass
+
+    def result(self):
+        '''output test result '''
+        pass
+
+    def loadtest(self, names=None):
+        '''load test suite'''
+        pass
+
+    def runtest(self, testsuite):
+        '''run test suite'''
+        pass
+
+    def start(self, testsuite):
+        '''start testing'''
+        pass
+
-- 
2.1.4


