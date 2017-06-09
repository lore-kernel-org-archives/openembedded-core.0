Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8FFF8782E5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 17:01:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jun 2017 10:01:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,317,1493708400"; d="scan'208";a="97608081"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.117])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2017 10:01:27 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 12:01:27 -0500
Message-Id: <edd5d38fe4c23dd08b3e3e869713e610b9a06730.1497027624.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497027624.git.anibal.limon@linux.intel.com>
References: <cover.1497027624.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1497027624.git.anibal.limon@linux.intel.com>
References: <cover.1497027624.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>,
	paul.eggleton@linux.intel.com
Subject: [PATCH 3/4] oeqa/sdk/cases: Added validation for SDK compatibility tests with eSDK
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
X-List-Received-Date: Fri, 09 Jun 2017 17:01:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>

The manifests for eSDK are generated using shared states so there is a
need to validate to different "packages names" into the test cases.

For example for perl:

SDK provides nativesdk-perl
eSDK provides perl-native

[YOCTO #9090]

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/sdk/cases/buildiptables.py | 3 ++-
 meta/lib/oeqa/sdk/cases/gcc.py           | 3 ++-
 meta/lib/oeqa/sdk/cases/perl.py          | 3 ++-
 meta/lib/oeqa/sdk/cases/python.py        | 3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildiptables.py b/meta/lib/oeqa/sdk/cases/buildiptables.py
index 0bd00d1..419c7eb 100644
--- a/meta/lib/oeqa/sdk/cases/buildiptables.py
+++ b/meta/lib/oeqa/sdk/cases/buildiptables.py
@@ -17,7 +17,8 @@ class BuildIptablesTest(OESDKTestCase):
 
         machine = self.td.get("MACHINE")
 
-        if not self.tc.hasHostPackage("packagegroup-cross-canadian-%s" % machine):
+        if not (self.tc.hasTargetPackage("packagegroup-cross-canadian-%s" % machine) or
+                self.tc.hasTargetPackage("gcc")):
             raise unittest.SkipTest("SDK doesn't contain a cross-canadian toolchain")
 
     def test_iptables(self):
diff --git a/meta/lib/oeqa/sdk/cases/gcc.py b/meta/lib/oeqa/sdk/cases/gcc.py
index 74ad2a2..d11f4b6 100644
--- a/meta/lib/oeqa/sdk/cases/gcc.py
+++ b/meta/lib/oeqa/sdk/cases/gcc.py
@@ -18,7 +18,8 @@ class GccCompileTest(OESDKTestCase):
 
     def setUp(self):
         machine = self.td.get("MACHINE")
-        if not self.tc.hasHostPackage("packagegroup-cross-canadian-%s" % machine):
+        if not (self.tc.hasTargetPackage("packagegroup-cross-canadian-%s" % machine) or
+                self.tc.hasTargetPackage("gcc")):
             raise unittest.SkipTest("GccCompileTest class: SDK doesn't contain a cross-canadian toolchain")
 
     def test_gcc_compile(self):
diff --git a/meta/lib/oeqa/sdk/cases/perl.py b/meta/lib/oeqa/sdk/cases/perl.py
index e1bded2..8085678 100644
--- a/meta/lib/oeqa/sdk/cases/perl.py
+++ b/meta/lib/oeqa/sdk/cases/perl.py
@@ -8,7 +8,8 @@ from oeqa.sdk.case import OESDKTestCase
 class PerlTest(OESDKTestCase):
     @classmethod
     def setUpClass(self):
-        if not self.tc.hasHostPackage("nativesdk-perl"):
+        if not (self.tc.hasHostPackage("nativesdk-perl") or
+                self.tc.hasHostPackage("perl-native")):
             raise unittest.SkipTest("No perl package in the SDK")
 
         for f in ['test.pl']:
diff --git a/meta/lib/oeqa/sdk/cases/python.py b/meta/lib/oeqa/sdk/cases/python.py
index 94a296f..72dfcc7 100644
--- a/meta/lib/oeqa/sdk/cases/python.py
+++ b/meta/lib/oeqa/sdk/cases/python.py
@@ -8,7 +8,8 @@ from oeqa.sdk.case import OESDKTestCase
 class PythonTest(OESDKTestCase):
     @classmethod
     def setUpClass(self):
-        if not self.tc.hasHostPackage("nativesdk-python"):
+        if not (self.tc.hasHostPackage("nativesdk-python") or
+                self.tc.hasHostPackage("python-native")):
             raise unittest.SkipTest("No python package in the SDK")
 
         for f in ['test.py']:
-- 
2.1.4


