Return-Path: <Ting.Wang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8771061AEC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 05:36:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s035auQS015706
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jan 2014 21:36:56 -0800 (PST)
Received: from pek-lpgtest7.wrs.com (128.224.153.87) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 2 Jan 2014 21:36:56 -0800
From: <ting.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Jan 2014 13:36:51 +0800
Message-ID: <1388727411-32158-1-git-send-email-ting.wang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [oeqa][PATCH] lib/oeqa/runtime: add test for python
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
X-List-Received-Date: Fri, 03 Jan 2014 05:36:58 -0000
Content-Type: text/plain

From: Ting Wang <ting.wang@windriver.com>

Run a python script on the target
1)checks the output.
2)Call os.system method create a testfile
---
 meta/classes/testimage.bbclass      |    4 ++--
 meta/lib/oeqa/runtime/files/test.py |    6 ++++++
 meta/lib/oeqa/runtime/python.py     |   33 +++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/files/test.py
 create mode 100644 meta/lib/oeqa/runtime/python.py

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 1161e59..4777e14 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -27,8 +27,8 @@ TEST_LOG_DIR ?= "${WORKDIR}/testimage"
 
 DEFAULT_TEST_SUITES = "ping auto"
 DEFAULT_TEST_SUITES_pn-core-image-minimal = "ping"
-DEFAULT_TEST_SUITES_pn-core-image-sato = "ping ssh df connman syslog xorg scp vnc date rpm smart dmesg"
-DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh df connman syslog xorg scp vnc date perl ldd gcc rpm smart kernelmodule dmesg"
+DEFAULT_TEST_SUITES_pn-core-image-sato = "ping ssh df connman syslog xorg scp vnc date rpm smart dmesg python"
+DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh df connman syslog xorg scp vnc date perl ldd gcc rpm smart kernelmodule dmesg python"
 
 TEST_SUITES ?= "${DEFAULT_TEST_SUITES}"
 
diff --git a/meta/lib/oeqa/runtime/files/test.py b/meta/lib/oeqa/runtime/files/test.py
new file mode 100644
index 0000000..f3a2273
--- /dev/null
+++ b/meta/lib/oeqa/runtime/files/test.py
@@ -0,0 +1,6 @@
+import os
+
+os.system('touch /tmp/testfile.python')
+
+a = 9.01e+21 - 9.01e+21 + 0.01
+print "the value of a is %s" % a
diff --git a/meta/lib/oeqa/runtime/python.py b/meta/lib/oeqa/runtime/python.py
new file mode 100644
index 0000000..c037ab2
--- /dev/null
+++ b/meta/lib/oeqa/runtime/python.py
@@ -0,0 +1,33 @@
+import unittest
+import os
+from oeqa.oetest import oeRuntimeTest, skipModule
+from oeqa.utils.decorators import *
+
+def setUpModule():
+    if not oeRuntimeTest.hasPackage("python"):
+        skipModule("No python package in the image")
+
+
+class PythonTest(oeRuntimeTest):
+
+    @classmethod
+    def setUpClass(self):
+        oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "test.py"), "/tmp/test.py")
+
+    def test_python_exists(self):
+        (status, output) = self.target.run('which python')
+        self.assertEqual(status, 0, msg="Python binary not in PATH or not on target.")
+
+    def test_python_stdout(self):
+        (status, output) = self.target.run('python /tmp/test.py')
+        self.assertEqual(status, 0, msg="Exit status was not 0. Output: %s" % output)
+        self.assertEqual(output, "the value of a is 0.01", msg="Incorrect output: %s" % output)
+
+    def test_python_testfile(self):
+        (status, output) = self.target.run('ls /tmp/testfile.python')
+        self.assertEqual(status, 0, msg="Python test file generate failed.")
+        
+
+    @classmethod
+    def tearDownClass(self):
+        oeRuntimeTest.tc.target.run("rm /tmp/test.py /tmp/testfile.python")
-- 
1.7.9.5


