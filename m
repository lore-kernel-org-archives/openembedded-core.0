Return-Path: <stefanx.stanacar@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 364C16ADA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 10:11:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jun 2013 03:05:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="361944172"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jun 2013 03:04:44 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id D07426A4091
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 03:04:43 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 13:04:43 +0300
Message-Id: <e6e567982f4b28822afdc8ea55401513df7c9466.1372413711.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1372413711.git.stefanx.stanacar@intel.com>
References: <cover.1372413711.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1372413711.git.stefanx.stanacar@intel.com>
References: <cover.1372413711.git.stefanx.stanacar@intel.com>
Subject: [RFC PATCH 8/8] lib/oeqa/runtime: add gcc test
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
X-List-Received-Date: Fri, 28 Jun 2013 10:11:20 -0000

gcc compile test and support files.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/files/test.c       | 26 +++++++++++++++++++++++
 meta/lib/oeqa/runtime/files/testmakefile |  5 +++++
 meta/lib/oeqa/runtime/gcc.py             | 36 ++++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/files/test.c
 create mode 100644 meta/lib/oeqa/runtime/files/testmakefile
 create mode 100644 meta/lib/oeqa/runtime/gcc.py

diff --git a/meta/lib/oeqa/runtime/files/test.c b/meta/lib/oeqa/runtime/files/test.c
new file mode 100644
index 0000000..2d8389c
--- /dev/null
+++ b/meta/lib/oeqa/runtime/files/test.c
@@ -0,0 +1,26 @@
+#include <stdio.h>
+#include <math.h>
+#include <stdlib.h>
+
+double convert(long long l)
+{
+  return (double)l;
+}
+
+int main(int argc, char * argv[]) {
+
+  long long l = 10;
+  double f;
+  double check = 10.0;
+
+  f = convert(l);
+  printf("convert: %lld => %f\n", l, f);
+  if ( f != check ) exit(1);
+
+  f = 1234.67;
+  check = 1234.0;
+  printf("floorf(%f) = %f\n", f, floorf(f));
+  if ( floorf(f) != check) exit(1);
+
+  return 0;
+}
diff --git a/meta/lib/oeqa/runtime/files/testmakefile b/meta/lib/oeqa/runtime/files/testmakefile
new file mode 100644
index 0000000..ca1844e
--- /dev/null
+++ b/meta/lib/oeqa/runtime/files/testmakefile
@@ -0,0 +1,5 @@
+test: test.o
+	gcc -o test test.o -lm
+test.o: test.c
+	gcc -c test.c
+
diff --git a/meta/lib/oeqa/runtime/gcc.py b/meta/lib/oeqa/runtime/gcc.py
new file mode 100644
index 0000000..b63badd
--- /dev/null
+++ b/meta/lib/oeqa/runtime/gcc.py
@@ -0,0 +1,36 @@
+import unittest
+import os
+from oeqa.oetest import oeRuntimeTest, skipModule
+from oeqa.utils.decorators import *
+
+def setUpModule():
+    if not oeRuntimeTest.hasFeature("tools-sdk"):
+        skipModule("Image doesn't have tools-sdk in IMAGE_FEATURES")
+
+
+class GccCompileTest(oeRuntimeTest):
+
+    @classmethod
+    def setUpClass(self):
+        oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "test.c"), "/tmp/test.c")
+        oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "testmakefile"), "/tmp/testmakefile")
+
+    def test_gcc_compile(self):
+        (status, output) = self.target.run('gcc /tmp/test.c -o /tmp/test -lm')
+        self.assertEqual(status, 0, msg="gcc compile failed, output: %s" % output)
+        (status, output) = self.target.run('/tmp/test')
+        self.assertEqual(status, 0, msg="running compiled file failed, output %s" % output)
+
+    def test_gpp_compile(self):
+        (status, output) = self.target.run('g++ /tmp/test.c -o /tmp/test -lm')
+        self.assertEqual(status, 0, msg="g++ compile failed, output: %s" % output)
+        (status, output) = self.target.run('/tmp/test')
+        self.assertEqual(status, 0, msg="running compiled file failed, output %s" % output)
+
+    def test_make(self):
+        (status, output) = self.target.run('cd /tmp; make -f testmakefile')
+        self.assertEqual(status, 0, msg="running make failed, output %s" % output)
+
+    @classmethod
+    def tearDownClass(self):
+        oeRuntimeTest.tc.target.run("rm /tmp/test.c /tmp/test.o /tmp/test /tmp/testmakefile")
-- 
1.8.1.4


