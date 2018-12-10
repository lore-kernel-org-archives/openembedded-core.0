Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1F55660777
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 15:07:10 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id x10so10815276wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 07:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=12ZWXUOXFHG+wSDYsPOI8RB5AhJn8dM4OP3UDkXv2xY=;
	b=APWcPAhhTq0v0oKoPbKwzmcQYgePbnIJkH0BuuK/WKNWzp3ejVBaGd2U1HYjS+oM6b
	gbfWUhpGSGRY68+6VxjR80aVlH7Z5yRYF36okNEfaYniIZfAMY6oy4zeroigihu6y9Sw
	DGxgOQH7yI3WT6KUFGbYHrryTrwSsXltw6ItjamH4Hgzkx5xC0cfFF5y4fZAru1C/7iS
	LgK9I9piqkSTlPNE3/o6dOfVJWRzcRRH/RwRV5b/cwB7Ce7VVT3fz70WY+YX3WgFvISV
	nOc79YZEI8EDV/Bf4Jh4R+L+AywVa4uTcXMmn2RQiZ5G1gTFoA06JsLA1u/BeoFhfVhQ
	WUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=12ZWXUOXFHG+wSDYsPOI8RB5AhJn8dM4OP3UDkXv2xY=;
	b=DNk3gTuPdedzasTOLWijlh41dSojC4BE+6EGPKZt7YbUJMHQqs+u2tlWChJ40Jc0l/
	Ifvd1rkDvGTEYtGWtJi7kdSeYcQcNUDoUqybg9ngva2Ej6neZ+IG89fuLRsPULRm/ZCq
	qUhU2/0B/FXWot+ElZ7xhShqx0ILTI05CL+qrqV70fQQxPzO3AgW44bnwdL9dbNrCCBt
	lIURqYIgTllfz6nwm+V93gU0ZGQQT7jas9oh/o+hiUi0CgjUbM8mPTQ0xM8UyI6NaTlJ
	ly6DauQ1jh3rWWF48NgqAB2rWSpoXZWK9CzATn9Y1Sof4tA48SGau9w7AdR2usWOr7cj
	Up4g==
X-Gm-Message-State: AA+aEWaRs9SFRtw6JaCLwkjN6G8kHPkoCpXEo0PI1p9l7LDlyBBVn2ak
	Qi82gA0DRuvWa6bnIfYkaFm8ZrUpXIk=
X-Google-Smtp-Source: AFSGD/WonZh7My1TKK0u6pY5aBZuLfaLTahGVhF7+FmItM37L0naiMMtds0oQ3Gw3cT1qfhXhh5h1Q==
X-Received: by 2002:a5d:6808:: with SMTP id w8mr9685433wru.270.1544454431351; 
	Mon, 10 Dec 2018 07:07:11 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t76sm16610138wme.33.2018.12.10.07.07.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Dec 2018 07:07:10 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Dec 2018 15:07:07 +0000
Message-Id: <20181210150707.7239-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] oeqa/sdk: show output if run() fails
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
X-List-Received-Date: Mon, 10 Dec 2018 15:07:11 -0000

Use oeqa.utils.subprocesstweak to monkey-patch the subprocess exception to show
the output if available, and clean up explicit try/catch handling that would
have hidden this.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/sdk/cases/buildcpio.py |  3 +++
 meta/lib/oeqa/sdk/cases/buildlzip.py |  2 ++
 meta/lib/oeqa/sdk/cases/gcc.py       |  3 +++
 meta/lib/oeqa/sdk/cases/perl.py      | 12 ++++++------
 meta/lib/oeqa/sdk/cases/python.py    | 21 +++++++++------------
 5 files changed, 23 insertions(+), 18 deletions(-)

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
index 2254867d455..aaab050e9ae 100644
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
+        cmd = "python3 -c \"import codecs; print(codecs.encocde('Uryyb, jbeyq', 'rot13'))\""
+        output = self._run(cmd)
+        self.assertEqual(output, "Hello, world\n")
-- 
2.11.0


