Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5E66D6BCF1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 23:26:40 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id q18so15820703wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 15:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Uk0hzf4sFMOXl6ZviEkCfUe30w8Nz2BlsIjxfEbkUys=;
	b=dLC5nCCvvX6PM1l5SEoTiYJHNW+rKR3upHd6Hu2tVa89LJqD9SEzRht8zXKA3NBMVj
	OGp/1YAngplF0V11xnGRaRjjHtcvGVbqB6f4oPKbJYCEc7CMkV9EDADhkVbqneMBp0fr
	jDdL+ZYAHR5fip7/8XucoVwGevXS931EiJrriAsMq3Hv8FBCJ2xrPlDl/PyJsGS+wW+2
	OiwVa6tGpocLm7cFTGN4G5LUOVNlZVrs+O37U03ug8Vnr5zTuXETSIZXcZrqu1fco6yT
	tBFHN2wJ4nqOpZ8JlAV+Hvo9tT4Jaxu1w75VTHAzbb3+OqeC22HYT2Ekt0xtRBDCy0IQ
	5OfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Uk0hzf4sFMOXl6ZviEkCfUe30w8Nz2BlsIjxfEbkUys=;
	b=bwmY/22oeFcuXGZqVGO2kqklvftUgN9eFtNPHc0x9gIWTfVoYiJ0obs3/tOFQk3MFr
	gsF0GRZm38eiqnuCC3pNbBwl0qfasxxVqzJldVS3p6VaaUxmInnO+RpjYWAk04W2/BFw
	+tCOoeGNsY0jUC2NNyRnvfIf0C9buZFBbSUpEcXzTdTQbRdEP44nPLXAOZ7mlyNTIm1S
	LtKK4nHS7pD8dvN8+H5QlpYURg1Z1TOgY6YjayLQgPKokxIcDVH2MF9kJTwC7AaCJsCG
	Xq1CUyV2FqTXwqcPDRRD1MIFBjleIlKYGlSG377625/R692gfMLtkOafAeBb2vxZ1spP
	MRew==
X-Gm-Message-State: AA+aEWaD91lY1fKU4YjbRUgeGexDIDjL9WWgDsjC7Xf3amKUjXcFQgZ0
	cwjI/J7mtFpwQBwGF6VMzkwGz5vvQO4=
X-Google-Smtp-Source: AFSGD/V0eFa+EGrmxbFamONNRxxVTSMITJD8WyIPHAkjFk0e6QXAcSZur07u1Q7sl9AbGXIwh6Xgwg==
X-Received: by 2002:adf:fb0d:: with SMTP id c13mr16589745wrr.285.1544570800782;
	Tue, 11 Dec 2018 15:26:40 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v19sm30194595wrd.46.2018.12.11.15.26.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Dec 2018 15:26:40 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2018 23:26:33 +0000
Message-Id: <20181211232636.13113-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181211232636.13113-1-ross.burton@intel.com>
References: <20181211232636.13113-1-ross.burton@intel.com>
Subject: [PATCH V2 2/5] oeqa/sdk: show output if run() fails
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
X-List-Received-Date: Tue, 11 Dec 2018 23:26:40 -0000

Use oeqa.utils.subprocesstweak to monkey-patch the subprocess exception so that
any output is shown, and remove any explicit try/catch handling that would have
hidden this.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/sdk/cases/buildcpio.py  |  3 +++
 meta/lib/oeqa/sdk/cases/buildlzip.py  |  2 ++
 meta/lib/oeqa/sdk/cases/gcc.py        |  3 +++
 meta/lib/oeqa/sdk/cases/perl.py       | 12 ++++++------
 meta/lib/oeqa/sdk/cases/python.py     | 21 +++++++++------------
 meta/lib/oeqa/sdkext/cases/devtool.py |  3 +++
 6 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
index f348ac5d909..6697b12de29 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -2,6 +2,9 @@ import unittest
 from oeqa.sdk.case import OESDKTestCase
 from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
 
+from oeqa.utils.subprocesstweak import errors_have_output
+errors_have_output()
+
 class BuildCpioTest(OESDKTestCase):
     td_vars = ['DATETIME']
 
diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py b/meta/lib/oeqa/sdk/cases/buildlzip.py
index 9d137f30ebf..b57fbbece7f 100644
--- a/meta/lib/oeqa/sdk/cases/buildlzip.py
+++ b/meta/lib/oeqa/sdk/cases/buildlzip.py
@@ -2,6 +2,8 @@ import unittest
 from oeqa.sdk.case import OESDKTestCase
 from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
 
+from oeqa.utils.subprocesstweak import errors_have_output
+errors_have_output()
 
 class BuildLzipTest(OESDKTestCase):
     td_vars = ['DATETIME']
diff --git a/meta/lib/oeqa/sdk/cases/gcc.py b/meta/lib/oeqa/sdk/cases/gcc.py
index b32b01fc241..54c6fc488bc 100644
--- a/meta/lib/oeqa/sdk/cases/gcc.py
+++ b/meta/lib/oeqa/sdk/cases/gcc.py
@@ -5,6 +5,9 @@ import unittest
 from oeqa.core.utils.path import remove_safe
 from oeqa.sdk.case import OESDKTestCase
 
+from oeqa.utils.subprocesstweak import errors_have_output
+errors_have_output()
+
 class GccCompileTest(OESDKTestCase):
     td_vars = ['MACHINE']
 
diff --git a/meta/lib/oeqa/sdk/cases/perl.py b/meta/lib/oeqa/sdk/cases/perl.py
index e1d2bc159a0..b8adc5ac72d 100644
--- a/meta/lib/oeqa/sdk/cases/perl.py
+++ b/meta/lib/oeqa/sdk/cases/perl.py
@@ -1,6 +1,9 @@
 import unittest
 from oeqa.sdk.case import OESDKTestCase
 
+from oeqa.utils.subprocesstweak import errors_have_output
+errors_have_output()
+
 class PerlTest(OESDKTestCase):
     def setUp(self):
         if not (self.tc.hasHostPackage("nativesdk-perl") or
@@ -8,9 +11,6 @@ class PerlTest(OESDKTestCase):
             raise unittest.SkipTest("No perl package in the SDK")
 
     def test_perl(self):
-        try:
-            cmd = "perl -e '$_=\"Uryyb, jbeyq\"; tr/a-zA-Z/n-za-mN-ZA-M/;print'"
-            output = self._run(cmd)
-            self.assertEqual(output, "Hello, world")
-        except subprocess.CalledProcessError as e:
-            self.fail("Unexpected exit %d (output %s)" % (e.returncode, e.output))
+        cmd = "perl -e '$_=\"Uryyb, jbeyq\"; tr/a-zA-Z/n-za-mN-ZA-M/;print'"
+        output = self._run(cmd)
+        self.assertEqual(output, "Hello, world")
diff --git a/meta/lib/oeqa/sdk/cases/python.py b/meta/lib/oeqa/sdk/cases/python.py
index 2254867d455..b9174fadbaa 100644
--- a/meta/lib/oeqa/sdk/cases/python.py
+++ b/meta/lib/oeqa/sdk/cases/python.py
@@ -1,6 +1,9 @@
 import subprocess, unittest
 from oeqa.sdk.case import OESDKTestCase
 
+from oeqa.utils.subprocesstweak import errors_have_output
+errors_have_output()
+
 class Python2Test(OESDKTestCase):
     def setUp(self):
         if not (self.tc.hasHostPackage("nativesdk-python-core") or
@@ -8,12 +11,9 @@ class Python2Test(OESDKTestCase):
             raise unittest.SkipTest("No python package in the SDK")
 
     def test_python2(self):
-        try:
-            cmd = "python -c \"import codecs; print(codecs.encode('Uryyb, jbeyq', 'rot13'))\""
-            output = self._run(cmd)
-            self.assertEqual(output, "Hello, world\n")
-        except subprocess.CalledProcessError as e:
-            self.fail("Unexpected exit %d (output %s)" % (e.returncode, e.output))
+        cmd = "python -c \"import codecs; print(codecs.encode('Uryyb, jbeyq', 'rot13'))\""
+        output = self._run(cmd)
+        self.assertEqual(output, "Hello, world\n")
 
 class Python3Test(OESDKTestCase):
     def setUp(self):
@@ -22,9 +22,6 @@ class Python3Test(OESDKTestCase):
             raise unittest.SkipTest("No python3 package in the SDK")
 
     def test_python3(self):
-        try:
-            cmd = "python3 -c \"import codecs; print(codecs.encode('Uryyb, jbeyq', 'rot13'))\""
-            output = self._run(cmd)
-            self.assertEqual(output, "Hello, world\n")
-        except subprocess.CalledProcessError as e:
-            self.fail("Unexpected exit %d (output %s)" % (e.returncode, e.output))
+        cmd = "python3 -c \"import codecs; print(codecs.encode('Uryyb, jbeyq', 'rot13'))\""
+        output = self._run(cmd)
+        self.assertEqual(output, "Hello, world\n")
diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index 0860e8d17cf..d322f86c73e 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -9,6 +9,9 @@ from oeqa.sdkext.case import OESDKExtTestCase
 from oeqa.core.decorator.oeid import OETestID
 from oeqa.utils.httpserver import HTTPService
 
+from oeqa.utils.subprocesstweak import errors_have_output
+errors_have_output()
+
 class DevtoolTest(OESDKExtTestCase):
     @classmethod
     def setUpClass(cls):
-- 
2.11.0


