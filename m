Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 2B5C06AD42
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 10:13:07 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2013 03:09:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="323846679"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2013 03:04:38 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 0A9F76A4091
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 03:04:36 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 13:04:41 +0300
Message-Id: <2af5b7f5afa40beef40cc9ec9468cf7387729adb.1372413711.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1372413711.git.stefanx.stanacar@intel.com>
References: <cover.1372413711.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1372413711.git.stefanx.stanacar@intel.com>
References: <cover.1372413711.git.stefanx.stanacar@intel.com>
Subject: [RFC PATCH 6/8] lib/oeqa/utils/decorators.py: decorators for test methods
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
X-List-Received-Date: Fri, 28 Jun 2013 10:13:07 -0000

From: Radu Moisan <radu.moisan@intel.com>

Some skip decorators meant only for test methods, providing
some kind of test methods dependency.
They are used together with a test method name not a condition.
These are complementary to python's unittest skip decorators.

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/decorators.py | 40 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta/lib/oeqa/utils/decorators.py

diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
new file mode 100644
index 0000000..4b7a53d
--- /dev/null
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -0,0 +1,40 @@
+from oeqa.oetest import *
+
+class skipIfFailure(object):
+
+    def __init__(self,testcase):
+        self.testcase = testcase
+
+    def __call__(self,f):
+        def wrapped_f(*args):
+            if self.testcase in oeRuntimeTest.testFailures:
+                raise unittest.SkipTest("Testcase dependency not met: %s" % self.testcase)
+            f(*args)
+        wrapped_f.__name__ = f.__name__
+        return wrapped_f
+
+class skipIfSkipped(object):
+
+    def __init__(self,testcase):
+        self.testcase = testcase
+
+    def __call__(self,f):
+        def wrapped_f(*args):
+            if self.testcase in oeRuntimeTest.testSkipped:
+                raise unittest.SkipTest("Testcase dependency not met: %s" % self.testcase)
+            f(*args)
+        wrapped_f.__name__ = f.__name__
+        return wrapped_f
+
+class skipUnlessPassed(object):
+
+    def __init__(self,testcase):
+        self.testcase = testcase
+
+    def __call__(self,f):
+        def wrapped_f(*args):
+            if self.testcase in (oeRuntimeTest.testSkipped, oeRuntimeTest.testFailures, oeRuntimeTest.testErrors):
+                raise unittest.SkipTest("Testcase dependency not met: %s" % self.testcase)
+            f(*args)
+        wrapped_f.__name__ = f.__name__
+        return wrapped_f
-- 
1.8.1.4


