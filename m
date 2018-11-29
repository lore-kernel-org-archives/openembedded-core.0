Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id C7B776D5B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 17:39:35 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 125so3176520wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 09:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=NIuzUnnj65EikZHVtTfL47AxRDFgErGLZssgkpgQ2GY=;
	b=LriW9lTwFM4JoUAl47N3P7BC38hWkoZj8dsQYoLefUg60rJp50QPo9fe95pv3yrMxe
	MA7pHGmBq0FTPiRvAbR+zV1HlSpdDCL9+FmsWDrP6SUskKsbN2gHg15+iBg4DlDP67cl
	Fk+1FbLfj3q3iooaqCk3fqeqZoaj9VtjrL2TEtukhfAmqkR1q00+mZiS3ocxaaes1Wfz
	i20Bt20Kmddlvk2QxYAUojTpqaqxFnJSCpHYwZEbM2GYd2tbwTzVc/4ZM37tm/lA/5ou
	qQMSR2y3mFFPh5G/OQkdPdsi++Rom4TkWkckV1TGSEmpoDRMvl0s5hqi02CYuMRTHV9t
	3YuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=NIuzUnnj65EikZHVtTfL47AxRDFgErGLZssgkpgQ2GY=;
	b=cSj2VOC90lu6nbh7wNpsFxPXYfVs5VGxyIUJm0XU6L9Lh1hryyXoZRQ+aaZizJ6B2r
	AFC7+GmyLOLliPTyotK60wuTbHnJbJDQo9f8xwxqjjIigwgsjE5qK2tyyLGycQQd6HSm
	P3dM5DjtZ3pq2Ak+SeCGYoFMx1yHNDcqR+htduVxYThY5msy8+p2998jVh5YxA7n7pmD
	GRMTSJUtjGs5Ngtr4JSlfnNPl9rkIxE1YxZZ6s3Kl1V8lBMpiafd1ff/gkiSyIb59A6K
	xNq0OsaAwADItDOOWpa+Hc6zupgaYhl0Y51N25OlNZ/P+xx0J/mRBdckDABVWseGHasO
	GiVw==
X-Gm-Message-State: AA+aEWbM9MVwnxREWpmyTzmpUU0lKa2y3i59XpsPTkgEQRvh3GiJSUyc
	rERVfUbjO/tAcG45684jTdRNr3GQhwo=
X-Google-Smtp-Source: AFSGD/UOLXO2CWtGiZlHOwzAVUBktpot/vZWlgIEQSuZaDsm2xA7RquO73BSsfI3Q4DwJ2PVpPwozA==
X-Received: by 2002:a1c:d912:: with SMTP id q18mr2577992wmg.122.1543513176172; 
	Thu, 29 Nov 2018 09:39:36 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b16sm2451941wrm.41.2018.11.29.09.39.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Nov 2018 09:39:35 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 17:39:33 +0000
Message-Id: <20181129173933.2936-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] oeqa/sdk/python: add Python 2 and fix detection
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
X-List-Received-Date: Thu, 29 Nov 2018 17:39:36 -0000

Add a Python 2 form to exercise that if present, and fix the setUp() so it
actually looks for a package that exists (nativesdk-python3 is a virtual
package, the interpretter is in nativesdk-python3-core).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/sdk/cases/python.py | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/python.py b/meta/lib/oeqa/sdk/cases/python.py
index 7c1d183e529..8b871414033 100644
--- a/meta/lib/oeqa/sdk/cases/python.py
+++ b/meta/lib/oeqa/sdk/cases/python.py
@@ -1,14 +1,28 @@
 import subprocess, unittest
 from oeqa.sdk.case import OESDKTestCase
 
-class PythonTest(OESDKTestCase):
+class Python2Test(OESDKTestCase):
     def setUp(self):
-        if not (self.tc.hasHostPackage("nativesdk-python3") or
-                self.tc.hasHostPackage("python3-native")):
+        if not (self.tc.hasHostPackage("nativesdk-python-core") or
+                self.tc.hasHostPackage("python-core-native")):
             raise unittest.SkipTest("No python package in the SDK")
 
     def test_python3(self):
         try:
+            cmd = "python -c \"import codecs; print(codecs.encode('Uryyb, jbeyq', 'rot13'))\""
+            output = self._run(cmd)
+            self.assertEqual(output, "Hello, world\n")
+        except subprocess.CalledProcessError as e:
+            self.fail("Unexpected exit %d (output %s)" % (e.returncode, e.output))
+
+class Python3Test(OESDKTestCase):
+    def setUp(self):
+        if not (self.tc.hasHostPackage("nativesdk-python3-core") or
+                self.tc.hasHostPackage("python3-core-native")):
+            raise unittest.SkipTest("No python3 package in the SDK")
+
+    def test_python3(self):
+        try:
             cmd = "python3 -c \"import codecs; print(codecs.encode('Uryyb, jbeyq', 'rot13'))\""
             output = self._run(cmd)
             self.assertEqual(output, "Hello, world\n")
-- 
2.11.0


