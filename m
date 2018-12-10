Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 92F2B6C4BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 17:11:52 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id b14so11262997wru.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 09:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Uk0hzf4sFMOXl6ZviEkCfUe30w8Nz2BlsIjxfEbkUys=;
	b=RlqxFX25Ftm9q3zRxF5B6yzaB0dytjyfN5H0r5TQ2gAH33sFzTJl6bF/AQ8v3yKW7v
	ik8fz50vusPCdVAXsSxzKYBTBCuVdk7Jepk2iD1Z69m41o7WQlxiVQYTa9BwZEEnpSCb
	6ttT3aEMydj7NXcxbNo+OJU1GZLEnBRYPz+nynuOh2P2qQ4C2kWsAfPW9MHhDzMcADH+
	ZVwn8AvPWO/t5+iLbNk3WVWknXbnlJCq8K+y9zOe97NYzqo6bWuA+ZLtQMB5I/mzNPI9
	DZtKNFqCBzlpmLqTYEUZMpf5+q/++Va2LkvQzrGGB607JSHOGSW6nJP0B1/NsD+MiCcx
	t2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Uk0hzf4sFMOXl6ZviEkCfUe30w8Nz2BlsIjxfEbkUys=;
	b=bkWPheDQXUscL60s6gZo0I4wf8zoJkAVhBo5S8ZKR5GpP0S3cMAPHR20O3IC/cjIQK
	C80uog894aP4cm1At8LFHbKttSQrKbKeKk7/wqhc8wATJUExNom8/mu7KbeK/Hvw0Led
	/q/bbRsY59Kvjrk3hba4W6H3XHhPOna82UalO7O0E9fC0q6HxrvUsA84PtZWwvthq8am
	UaugSPcM6clVmygRLggXq1aLKLM4+PsQsy68HFeGxyk0ov2DlXDfbcHRumMCr5tMzY7m
	K9xiXAGUZpD5T8yJ16JQnqeLjX7C+WrOhywboRPd5tGhSpIRbUioKU5FWAhqWcxhPGLE
	jfLQ==
X-Gm-Message-State: AA+aEWaUoySjdBxMyw1L24TgJ3JDQ1z6rJL+qUAdVjjM7nHDa1E5cJl6
	qdYsoW+sGOTA31VQ19i4/0Kn7vb7fIs=
X-Google-Smtp-Source: AFSGD/WMwyKX3tMZ05hKlCtE8A5DxHKkxGVHHHFDWvry9juBBG20a4Byx50cWIPceHeZ7RKxWgWiOw==
X-Received: by 2002:adf:f5d1:: with SMTP id k17mr11495294wrp.59.1544461913086; 
	Mon, 10 Dec 2018 09:11:53 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y13sm12343505wrn.73.2018.12.10.09.11.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Dec 2018 09:11:52 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Dec 2018 17:11:39 +0000
Message-Id: <20181210171141.10722-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181210171141.10722-1-ross.burton@intel.com>
References: <20181210171141.10722-1-ross.burton@intel.com>
Subject: [PATCH 2/4] oeqa/sdk: show output if run() fails
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
X-List-Received-Date: Mon, 10 Dec 2018 17:11:52 -0000

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


