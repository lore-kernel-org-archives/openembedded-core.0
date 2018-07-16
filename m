Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1E82E7609F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 12:51:28 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id j5-v6so25263709wrr.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 05:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=BZXiC9u+XA/LwdrZSPvyERDYQ8pfK5i1VoNlCOWe00E=;
	b=eBD1AOZFLbXMjTSjD3bwfjdq1uFysv3RR4zkRHD8GUU02c+2lRaCeRTmhDn9kfViT7
	IcGd5VmQcmKwSevReRvDcdjfLabLoM/pwwtHJx8b1g2f05pUwPNdOMOqQiDTbI7oVovg
	hiOLAVLL4U11wIEpM5wEP1ZWnT0Ur2I9lfjJjIg+frDncyRHatKt2NcozgrualEUPIOC
	FOLKxixksoxCbcup8KXtAMjWSfXvvDzI02LfBhRTw8AnC8rkMwOEj3dvdqLl/tPfg1Dz
	1TxZOL9SKMZkesckWry1Tv9taCoXHdyGPtgjwpJDV3FOTAh+6FP4raXnGmf7Bbp/rw3C
	oABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BZXiC9u+XA/LwdrZSPvyERDYQ8pfK5i1VoNlCOWe00E=;
	b=O8jAtYEMMzzXlF1KOo1tG8EbISfoT/yKAfivwq8ahSEhnvIAK0EyYPjno8M4a0DI5l
	VT2EWIIqyG9H3CsSTqPfu9HZKlDLnd68u+h4Jmh6Kq2tXg8ctesd0+SHe+x4c/WVWHjL
	EwpYXmDMHnCtJ4Lza1yF/4ItHiNA7Ovatktp7C4t+74oJNYXve7h/ZJa/eyldWXbCJy7
	da9zRZaUsoJZgmfukP2abFW0NfPX2mlxa64znp8hvQ+xjuBiJJDmCCNVadc0UTPVblsm
	6VCVv2KPs8AEq2BC2TtlePzdBmA/MPesWzGjcBkQFS1LgaHRjccM2JPfOIBKe6EhL64C
	KAzw==
X-Gm-Message-State: AOUpUlFOcGqxv87qIcdqydao0CVZQwMYhijkq3fWc1ufpK5M8m7sIc0j
	ZXv/rMSc6KoqoPuiOp55LEOHsgxU
X-Google-Smtp-Source: AAOMgpeOEKhPguS4B/o9bCEewAF5AN68t4gLfn0PH3A6fCT8emKqFVF7MkBPKEbPLu4R4vc1qNe/mA==
X-Received: by 2002:adf:a541:: with SMTP id
	j1-v6mr13206489wrb.155.1531745488593; 
	Mon, 16 Jul 2018 05:51:28 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a14-v6sm12502837wmb.44.2018.07.16.05.51.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 05:51:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 13:51:26 +0100
Message-Id: <20180716125126.12829-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] oeqa/runtime/python: clean up Python test
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
X-List-Received-Date: Mon, 16 Jul 2018 12:51:29 -0000

Currently this is three test cases:

1) test_python_exists.  Fail if python3 isn't in PATH.
2) test_python_stdout.  Run a Python script and check the output is as expected
3) test_python_testfile.  Check that a file test_python_stdout wrote to exists.

(1) should be a setup and skip the test module if it isn't present.
(2) and (3) should be merged, there's no point copying over a two line Python
file, and the test doesn't verify that the file doesn't exist in the first
place.

Rewrite the test to check that Python is present in a class setup so the entire
test is skipped if it isn't and do some simple rot13 to verify that bytecode is
being executed correctly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/runtime/cases/python.py | 38 ++++++++---------------------------
 1 file changed, 8 insertions(+), 30 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/python.py b/meta/lib/oeqa/runtime/cases/python.py
index 3d6eb088024..4419a9f6394 100644
--- a/meta/lib/oeqa/runtime/cases/python.py
+++ b/meta/lib/oeqa/runtime/cases/python.py
@@ -1,43 +1,21 @@
-import os
-
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
-from oeqa.runtime.decorator.package import OEHasPackage
 
 class PythonTest(OERuntimeTestCase):
-
     @classmethod
     def setUpClass(cls):
-        src = os.path.join(cls.tc.files_dir, 'test.py')
-        dst = '/tmp/test.py'
-        cls.tc.target.copyTo(src, dst)
-
-    @classmethod
-    def tearDownClass(cls):
-        dst = '/tmp/test.py'
-        cls.tc.target.run('rm %s' % dst)
-
-    @OETestID(1145)
-    @OETestDepends(['ssh.SSHTest.test_ssh'])
-    @OEHasPackage(['python3-core'])
-    def test_python_exists(self):
-        status, output = self.target.run('which python3')
-        msg = 'Python binary not in PATH or not on target.'
-        self.assertEqual(status, 0, msg=msg)
+        import unittest
+        if "python3-core" not in cls.tc.image_packages:
+            raise unittest.SkipTest("Python3 not on target")
 
     @OETestID(965)
-    @OETestDepends(['python.PythonTest.test_python_exists'])
-    def test_python_stdout(self):
-        status, output = self.target.run('python3 /tmp/test.py')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_python3(self):
+        cmd = "python3 -c \"import codecs; print(codecs.encode('Uryyb, jbeyq', 'rot13'))\""
+        status, output = self.target.run(cmd)
         msg = 'Exit status was not 0. Output: %s' % output
         self.assertEqual(status, 0, msg=msg)
 
         msg = 'Incorrect output: %s' % output
-        self.assertEqual(output, "the value of a is 0.01", msg=msg)
-
-    @OETestID(1146)
-    @OETestDepends(['python.PythonTest.test_python_stdout'])
-    def test_python_testfile(self):
-        status, output = self.target.run('ls /tmp/testfile.python')
-        self.assertEqual(status, 0, msg='Python test file generate failed.')
+        self.assertEqual(output, "Hello, world", msg=msg)
-- 
2.11.0


