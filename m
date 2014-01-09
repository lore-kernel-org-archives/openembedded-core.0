Return-Path: <Ting.Wang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 858326D1A8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 08:26:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s098Q1Pa009355
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jan 2014 00:26:02 -0800 (PST)
Received: from pek-lpgtest7.wrs.com (128.224.153.87) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 9 Jan 2014 00:26:01 -0800
From: <ting.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Jan 2014 16:25:53 +0800
Message-ID: <1389255953-8202-1-git-send-email-ting.wang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [oeqa][PATCH] lib/oeqa/runtime: add test for gzip
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
X-List-Received-Date: Thu, 09 Jan 2014 08:26:01 -0000
Content-Type: text/plain

From: Ting Wang <ting.wang@windriver.com>

Function tests:
1)gzip compress file
2)compressed file integrity check
3)zcat compress file
4)gzip decompress file
---
 meta/classes/testimage.bbclass |    4 ++--
 meta/lib/oeqa/runtime/gzip.py  |   32 ++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/gzip.py

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 4777e14..0d861e6 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -27,8 +27,8 @@ TEST_LOG_DIR ?= "${WORKDIR}/testimage"
 
 DEFAULT_TEST_SUITES = "ping auto"
 DEFAULT_TEST_SUITES_pn-core-image-minimal = "ping"
-DEFAULT_TEST_SUITES_pn-core-image-sato = "ping ssh df connman syslog xorg scp vnc date rpm smart dmesg python"
-DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh df connman syslog xorg scp vnc date perl ldd gcc rpm smart kernelmodule dmesg python"
+DEFAULT_TEST_SUITES_pn-core-image-sato = "ping ssh df connman syslog xorg scp vnc date rpm smart dmesg python gzip"
+DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh df connman syslog xorg scp vnc date perl ldd gcc rpm smart kernelmodule dmesg python gzip"
 
 TEST_SUITES ?= "${DEFAULT_TEST_SUITES}"
 
diff --git a/meta/lib/oeqa/runtime/gzip.py b/meta/lib/oeqa/runtime/gzip.py
new file mode 100644
index 0000000..50e3b8f
--- /dev/null
+++ b/meta/lib/oeqa/runtime/gzip.py
@@ -0,0 +1,32 @@
+import unittest
+import os
+from oeqa.oetest import oeRuntimeTest, skipModule
+from oeqa.utils.decorators import *
+
+class GzipFunctionTest(oeRuntimeTest):
+
+    @skipUnlessPassed('test_ssh')
+    def test_gzip_create_testfile(self):
+        (status, output) = self.target.run('echo It is a test file > /tmp/testfile.gzip')
+        self.assertEqual(status, 0, msg="gzip test file create failed")
+
+    @skipUnlessPassed('test_gzip_create_testfile')
+    def test_gzip_fun1_compress(self):
+        (status, output) = self.target.run('gzip /tmp/testfile.gzip')
+        self.assertEqual(status, 0, msg="gzip compress file failed.")
+
+    def test_gzip_fun2_integrity_check(self):
+        (status, output) = self.target.run('gzip -t /tmp/testfile.gzip.gz')
+        self.assertEqual(status, 0, msg="Check the compressed file integrity failed")
+
+    def test_gzip_fun3_zcat(self):
+        (status, output) = self.target.run('zcat /tmp/testfile.gzip.gz')
+        self.assertEqual(output, "It is a test file", msg="Incorrect output: %s" % output)
+
+    def test_gzip_fun4_decompress(self):
+        (status, output) = self.target.run('gunzip /tmp/testfile.gzip.gz && ls /tmp/testfile.gzip')
+        self.assertEqual(status, 0, msg="gzip decompress file failed.")
+
+    @classmethod
+    def tearDownClass(self):
+        oeRuntimeTest.tc.target.run("rm /tmp/testfile.gzip")
-- 
1.7.9.5


