Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id CE7A171AD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 17:17:23 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 29 Mar 2017 10:17:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,242,1486454400"; d="scan'208";a="241706616"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 29 Mar 2017 10:17:24 -0700
Received: from yocto-ab03.ostc.intel.com (yocto-ab03.ostc.intel.com
	[10.54.69.73])
	by linux.intel.com (Postfix) with ESMTP id D0FC86A4080;
	Wed, 29 Mar 2017 10:17:17 -0700 (PDT)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2017 10:17:20 -0700
Message-Id: <1490807840-33667-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH v4] oeqa/sdk/cases:Adds validation for SDK	compatibility tests
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
X-List-Received-Date: Wed, 29 Mar 2017 17:17:24 -0000

Added validation for SDK compatibility tests with eSDK.
buildiptables, gcc, perl, python and buildgalculator based on target manifest file.Running with: $ bitbake <image> -c testsdkext
[YOCTO #9090]

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/lib/oeqa/sdk/cases/buildgalculator.py | 4 +++-
 meta/lib/oeqa/sdk/cases/buildiptables.py   | 4 +++-
 meta/lib/oeqa/sdk/cases/gcc.py             | 4 +++-
 meta/lib/oeqa/sdk/cases/perl.py            | 5 ++++-
 meta/lib/oeqa/sdk/cases/python.py          | 5 ++++-
 5 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index 42e8ddb..e0b6465 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -9,7 +9,9 @@ class GalculatorTest(OESDKTestCase):
     @classmethod
     def setUpClass(self):
         if not (self.tc.hasTargetPackage("gtk+3") or\
-                self.tc.hasTargetPackage("libgtk-3.0")):
+                self.tc.hasTargetPackage("libgtk-3.0")
+                self.tc.hasTargetPackage("gtk") or
+                self.tc.hasTargetPackage("matchbox-config-gtk"))
             raise unittest.SkipTest("GalculatorTest class: SDK don't support gtk+3")
 
     def test_galculator(self):
diff --git a/meta/lib/oeqa/sdk/cases/buildiptables.py b/meta/lib/oeqa/sdk/cases/buildiptables.py
index 0bd00d1..e7a0187 100644
--- a/meta/lib/oeqa/sdk/cases/buildiptables.py
+++ b/meta/lib/oeqa/sdk/cases/buildiptables.py
@@ -17,7 +17,9 @@ class BuildIptablesTest(OESDKTestCase):
 
         machine = self.td.get("MACHINE")
 
-        if not self.tc.hasHostPackage("packagegroup-cross-canadian-%s" % machine):
+        if not self.tc.hasTargetPackage("packagegroup-cross-canadian-%s" % machine) or
+               self.tc.hasTargetPackage("gcc-runtime") or
+               self.tc.hasTargetPackage("libgcc") or
             raise unittest.SkipTest("SDK doesn't contain a cross-canadian toolchain")
 
     def test_iptables(self):
diff --git a/meta/lib/oeqa/sdk/cases/gcc.py b/meta/lib/oeqa/sdk/cases/gcc.py
index 74ad2a2..a7e6026 100644
--- a/meta/lib/oeqa/sdk/cases/gcc.py
+++ b/meta/lib/oeqa/sdk/cases/gcc.py
@@ -18,7 +18,9 @@ class GccCompileTest(OESDKTestCase):
 
     def setUp(self):
         machine = self.td.get("MACHINE")
-        if not self.tc.hasHostPackage("packagegroup-cross-canadian-%s" % machine):
+        if not (self.tc.hasTargetPackage("packagegroup-cross-canadian-%s" % machine) or
+                self.tc.hasTargetPackage("gcc-runtime") or
+                self.tc.hasTargetPackage("libgcc")):
             raise unittest.SkipTest("GccCompileTest class: SDK doesn't contain a cross-canadian toolchain")
 
     def test_gcc_compile(self):
diff --git a/meta/lib/oeqa/sdk/cases/perl.py b/meta/lib/oeqa/sdk/cases/perl.py
index e1bded2..622eaaf 100644
--- a/meta/lib/oeqa/sdk/cases/perl.py
+++ b/meta/lib/oeqa/sdk/cases/perl.py
@@ -8,7 +8,10 @@ from oeqa.sdk.case import OESDKTestCase
 class PerlTest(OESDKTestCase):
     @classmethod
     def setUpClass(self):
-        if not self.tc.hasHostPackage("nativesdk-perl"):
+        if not (self.tc.hasHostPackage("nativesdk-perl") or
+                self.tc.hashostPackage("perl-native") or
+                self.tc.hasHostPackage("libperl5") or
+                self.tc.hasHostPackage("perl")):
             raise unittest.SkipTest("No perl package in the SDK")
 
         for f in ['test.pl']:
diff --git a/meta/lib/oeqa/sdk/cases/python.py b/meta/lib/oeqa/sdk/cases/python.py
index 94a296f..29705bf 100644
--- a/meta/lib/oeqa/sdk/cases/python.py
+++ b/meta/lib/oeqa/sdk/cases/python.py
@@ -8,7 +8,10 @@ from oeqa.sdk.case import OESDKTestCase
 class PythonTest(OESDKTestCase):
     @classmethod
     def setUpClass(self):
-        if not self.tc.hasHostPackage("nativesdk-python"):
+        if not (self.tc.hasHostPackage("nativesdk-python") or
+                self.tc.hasHostPackage("python-smartpm-native") or
+                self.tc.hasHostPackage("nativesdk-python3")):
+
             raise unittest.SkipTest("No python package in the SDK")
 
         for f in ['test.py']:
-- 
1.8.3.1


