Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B739C6C1B5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 08:37:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA98aVL5032012
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Nov 2018 00:36:41 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 9 Nov 2018 00:36:21 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 9 Nov 2018 00:36:20 -0800
Message-ID: <20181109083620.47941-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] testsdk: fix skipped testcase output "UNKNOWN" status while multiprocess execution
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
X-List-Received-Date: Fri, 09 Nov 2018 08:37:07 -0000
Content-Type: text/plain

Usually skipped testcase output "SKIPPED"
[snip serial execution]
|RESULTS - buildgalculator.GalculatorTest.test_galculator - Testcase -1: SKIPPED (0.01s)
|RESULTS - python.PythonTest.test_python3 - Testcase -1: SKIPPED (0.01s)
[snip serial execution]

But if enable multiprocess execution, skipped testcase output "UNKNOWN" status
[snip enable multiprocess execution]
|RESULTS - buildgalculator.GalculatorTest.test_galculator - Testcase -1: UNKNOWN
|RESULTS - python.PythonTest.test_python3 - Testcase -1: UNKNOWN
[snip enable multiprocess execution]

Here is my investigation:

There is a class pairs TestProtocolClient and TestProtocolServer
provided by python3-subunit. The TestProtocolClient generates a
subunit stream of TestResult from a test run, and TestProtocolServer
parses the stream of subunit TestResult.

The class ProtocolTestCase is a unittest.TestCase adapter and it
uses TestProtocolServer to parse the stream of subunit TestResult.

In Yocto testsdk, it forks multiple processes to execute testcases
and use TestProtocolClient to generate TestResult stream; and then
it creates multiple threads to use ProtocolTestCase to parse stream
of subunit TestResult through pipe; finally it passes multiple
ProtocolTestCase as TestCase instance to main process and output
status result.

The problem point is TestProtocolServer parses `skip:' directive
after reading a `test:' directive. Without `test:' directive,
`skip:' directive will be ignored. All above requires SkipTest should
be raised inside a test method rather than setUpClass method.

Throwing SkipTest inside setUp works correctly

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oeqa/sdk/cases/assimp.py          | 3 +--
 meta/lib/oeqa/sdk/cases/buildcpio.py       | 1 +
 meta/lib/oeqa/sdk/cases/buildgalculator.py | 3 +--
 meta/lib/oeqa/sdk/cases/buildlzip.py       | 1 +
 meta/lib/oeqa/sdk/cases/perl.py            | 3 +--
 meta/lib/oeqa/sdk/cases/python.py          | 3 +--
 6 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/assimp.py b/meta/lib/oeqa/sdk/cases/assimp.py
index 26c1df0..f5c7547 100644
--- a/meta/lib/oeqa/sdk/cases/assimp.py
+++ b/meta/lib/oeqa/sdk/cases/assimp.py
@@ -12,8 +12,7 @@ class BuildAssimp(OESDKTestCase):
 
     td_vars = ['DATETIME', 'TARGET_OS', 'TARGET_ARCH']
 
-    @classmethod
-    def setUpClass(self):
+    def setUp(self):
         if not (self.tc.hasHostPackage("nativesdk-cmake") or
                 self.tc.hasHostPackage("cmake-native")):
             raise unittest.SkipTest("Needs cmake")
diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
index 333dc7c..f348ac5 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -14,6 +14,7 @@ class BuildCpioTest(OESDKTestCase):
                         self.tc.sdk_dir, self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
 
+    def setUp(self):
         machine = self.td.get("MACHINE")
         if not self.tc.hasHostPackage("packagegroup-cross-canadian-%s" % machine):
             raise unittest.SkipTest("SDK doesn't contain a cross-canadian toolchain")
diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index 050d1b3..9e12b3a 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -6,8 +6,7 @@ from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
 class GalculatorTest(OESDKTestCase):
     td_vars = ['DATETIME']
 
-    @classmethod
-    def setUpClass(self):
+    def setUp(self):
         if not (self.tc.hasTargetPackage("gtk+3", multilib=True) or \
                 self.tc.hasTargetPackage("libgtk-3.0", multilib=True)):
             raise unittest.SkipTest("GalculatorTest class: SDK don't support gtk+3")
diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py b/meta/lib/oeqa/sdk/cases/buildlzip.py
index b28cc3a..9d137f3 100644
--- a/meta/lib/oeqa/sdk/cases/buildlzip.py
+++ b/meta/lib/oeqa/sdk/cases/buildlzip.py
@@ -15,6 +15,7 @@ class BuildLzipTest(OESDKTestCase):
                         self.tc.sdk_dir, self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
 
+    def setUp(self):
         machine = self.td.get("MACHINE")
 
         if not (self.tc.hasHostPackage("packagegroup-cross-canadian-%s" % machine) or
diff --git a/meta/lib/oeqa/sdk/cases/perl.py b/meta/lib/oeqa/sdk/cases/perl.py
index ff50b46..e1d2bc1 100644
--- a/meta/lib/oeqa/sdk/cases/perl.py
+++ b/meta/lib/oeqa/sdk/cases/perl.py
@@ -2,8 +2,7 @@ import unittest
 from oeqa.sdk.case import OESDKTestCase
 
 class PerlTest(OESDKTestCase):
-    @classmethod
-    def setUpClass(self):
+    def setUp(self):
         if not (self.tc.hasHostPackage("nativesdk-perl") or
                 self.tc.hasHostPackage("perl-native")):
             raise unittest.SkipTest("No perl package in the SDK")
diff --git a/meta/lib/oeqa/sdk/cases/python.py b/meta/lib/oeqa/sdk/cases/python.py
index bd5f1f6..7c1d183 100644
--- a/meta/lib/oeqa/sdk/cases/python.py
+++ b/meta/lib/oeqa/sdk/cases/python.py
@@ -2,8 +2,7 @@ import subprocess, unittest
 from oeqa.sdk.case import OESDKTestCase
 
 class PythonTest(OESDKTestCase):
-    @classmethod
-    def setUpClass(self):
+    def setUp(self):
         if not (self.tc.hasHostPackage("nativesdk-python3") or
                 self.tc.hasHostPackage("python3-native")):
             raise unittest.SkipTest("No python package in the SDK")
-- 
2.10.2


