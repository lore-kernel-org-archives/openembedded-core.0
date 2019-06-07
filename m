Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 77A6A7E53E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 23:48:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jun 2019 16:48:26 -0700
X-ExtLoop1: 1
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga005.jf.intel.com with ESMTP; 07 Jun 2019 16:48:26 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2019 16:47:54 -0700
Message-Id: <cee0ae0a34fcbf378e08f3af2e0b033e17137ca1.1559950879.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
References: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] oeqa/runtime: add simple test for scons
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
X-List-Received-Date: Fri, 07 Jun 2019 23:48:25 -0000
Content-Transfer-Encoding: 8bit

This test simply compiles a hello world program using scons.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/lib/oeqa/runtime/cases/scons.py   | 37 ++++++++++++++++++++++++++
 meta/lib/oeqa/runtime/files/SConstruct |  1 +
 meta/lib/oeqa/runtime/files/hello.c    |  5 ++++
 3 files changed, 43 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/scons.py
 create mode 100644 meta/lib/oeqa/runtime/files/SConstruct
 create mode 100644 meta/lib/oeqa/runtime/files/hello.c

diff --git a/meta/lib/oeqa/runtime/cases/scons.py b/meta/lib/oeqa/runtime/cases/scons.py
new file mode 100644
index 0000000000..3c7c7f7270
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/scons.py
@@ -0,0 +1,37 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class SconsCompileTest(OERuntimeTestCase):
+
+    @classmethod
+    def setUp(cls):
+        dst = '/tmp/'
+        src = os.path.join(cls.tc.runtime_files_dir, 'hello.c')
+        cls.tc.target.copyTo(src, dst)
+
+        src = os.path.join(cls.tc.runtime_files_dir, 'SConstruct')
+        cls.tc.target.copyTo(src, dst)
+
+    @classmethod
+    def tearDown(cls):
+        files = '/tmp/hello.c /tmp/hello.o /tmp/hello /tmp/SConstruct'
+        cls.tc.target.run('rm %s' % files)
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['gcc'])
+    @OEHasPackage(['python3-scons'])
+    def test_scons_compile(self):
+        status, output = self.target.run('cd /tmp/ && scons')
+        msg = 'scons compile failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        status, output = self.target.run('/tmp/hello')
+        msg = 'running compiled file failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
diff --git a/meta/lib/oeqa/runtime/files/SConstruct b/meta/lib/oeqa/runtime/files/SConstruct
new file mode 100644
index 0000000000..d2cb6dd122
--- /dev/null
+++ b/meta/lib/oeqa/runtime/files/SConstruct
@@ -0,0 +1 @@
+Program('hello.c')
diff --git a/meta/lib/oeqa/runtime/files/hello.c b/meta/lib/oeqa/runtime/files/hello.c
new file mode 100644
index 0000000000..b0697a3304
--- /dev/null
+++ b/meta/lib/oeqa/runtime/files/hello.c
@@ -0,0 +1,5 @@
+int
+      main()
+      {
+          printf("Hello, world!\n");
+      }
-- 
2.20.1


