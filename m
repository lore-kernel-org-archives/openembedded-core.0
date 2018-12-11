Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id E68596B067
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 18:20:31 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id m1so2606481wml.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 10:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JqXIOtY2rrFloXbPbsYcqI5lJS1gENy1XgbXfbkwKUU=;
	b=Y6e83mUErQCTJCH+fRKazCna4XoxXBMRQu2dhjQD3uGpAeJs2RL7T0iPzqUz8ATkxs
	JX8Ln7LpAB5h0OSSTaHYHp6XZuCq6ErfAfcHl5LVz6+OAH4JLUTBR2S30Gpo3JPr8zYm
	9AFmhHlcFegkItuoFXDxInAgB4d/Wotj6RHKBlLLioDJQQuhsxmLypxoe4eu1GTB8X3v
	gqr60FsfGKCG/4r4QgvaPLfR8YoeaXIjwl8Eyi7ccQ5V16GBXhXjo+biajAYDX1nP2dw
	hXayMDKMs1JO3sSLWxl3qa37EXnty6AFBxRBKAH1M40lFb7b868ndJaH7HoOTCXp52EK
	0WWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JqXIOtY2rrFloXbPbsYcqI5lJS1gENy1XgbXfbkwKUU=;
	b=hA+Zls8aRXN1DoWOck/nE0u7KUR9YISVkue6SYLsOFYv8vfqzluOl90iGmqhaM94ti
	gHdR72gA/LCbrf/DPTWb/D2BiYfrtKcdA5N6NOSkD4i5cit9KnUn+gG5zrm+JxJ9r30G
	M7m6XlMN8dz9YkYNO5JanxgFkKoq8ugWHFcBjeok/Mfu0ewQiXXxo3k5OVm4e4UPEah7
	/qbFn3hWS/Gg3ObCXDo6vvbwhBg1TeAWZkhZW4AByeXa2/aawQmZaJa1qCDY5Ja08zF7
	ZVGU4AWbjrR54zJ3G+Z93SpLSHLAu+A71lyByg4uAMGWNLFFUxF5lw6C9U2U9/W8v8bm
	fUNg==
X-Gm-Message-State: AA+aEWa76+EAP/Lz2tKaTL6S7EvSTSMQL8BYmExwhol//A1RFACjrKj2
	GAG4BzCyepcSJ/36cByx+/JpujClKEI=
X-Google-Smtp-Source: AFSGD/XHNKRENDFE/p7Hmb/WpY3TVojnFrmujJllV0CHoOhEqns+K8wOeTQIP9pFCk7e+uUrnE8PBw==
X-Received: by 2002:a7b:c1d7:: with SMTP id a23mr3219580wmj.48.1544552432359; 
	Tue, 11 Dec 2018 10:20:32 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b18sm16253616wrw.83.2018.12.11.10.20.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Dec 2018 10:20:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2018 18:20:22 +0000
Message-Id: <20181211182025.20381-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181211182025.20381-1-ross.burton@intel.com>
References: <20181211182025.20381-1-ross.burton@intel.com>
Subject: [PATCH 2/5] oeqa/sdk: show output if run() fails
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
X-List-Received-Date: Tue, 11 Dec 2018 18:20:32 -0000

Use oeqa.utils.subprocesstweak to monkey-patch the subprocess exception so that
any output is shown, and remove any explicit try/catch handling that would have
hidden this.

(From OE-Core rev: 0fcc1f7d1f7d4efc793005e194edc048b0c9d388)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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


