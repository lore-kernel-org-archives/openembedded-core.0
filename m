Return-Path: <libertad.cruz@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6CDFE77B45
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 20:34:18 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 27 Sep 2017 13:34:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,446,1500966000"; d="scan'208";a="156836866"
Received: from liberta1-mobl1.zpn.intel.com ([10.219.128.45])
	by fmsmga006.fm.intel.com with ESMTP; 27 Sep 2017 13:34:19 -0700
From: libertad.cruz@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Sep 2017 15:43:39 -0500
Message-Id: <1506545019-4144-1-git-send-email-libertad.cruz@intel.com>
X-Mailer: git-send-email 2.1.4
Cc: libertad.cruz@intel.com
Subject: [PATCH V3] dpky.py: Adds testcases for dpkg package manager
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
X-List-Received-Date: Wed, 27 Sep 2017 20:34:18 -0000

From: libertad <libertad.cruz@intel.com>

Adds dpkg testcases for testing basic operation functionality for the dpkg packgage manager.Adds new assert function to verify expected results given by the dpkg package.

[YOCTO #10063]

Signed-off-by: libertad <libertad.cruz@intel.com>
---
 meta/lib/oeqa/runtime/cases/dpkg.py | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/dpkg.py b/meta/lib/oeqa/runtime/cases/dpkg.py
index cd1183c7f12..1bef332effa 100644
--- a/meta/lib/oeqa/runtime/cases/dpkg.py
+++ b/meta/lib/oeqa/runtime/cases/dpkg.py
@@ -10,9 +10,10 @@ from oeqa.runtime.decorator.package import OEHasPackage
 
 
 class dpkgTest(OERuntimeTestCase):
-    def dpkg(self, command, expected=0):
+    def dpkg(self, command, expectedStr, expected=0):
         status, output = self.target.run(command, 1500)
         message = os.linesep.join([command, output])
+        self.assertIn(expectedStr, output) 
         self.assertEqual(status, expected, message)
         return output
 
@@ -24,29 +25,29 @@ class dpkgBasicTest(dpkgTest):
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OETestID(1801)
     def test_dpkg_help(self):
-        self.dpkg('dpkg --help')
+        self.dpkg('dpkg --help',"Usage: dpkg [<option> ...] <command>")
 
     @OETestDepends(['dpkg.dpkgBasicTest.test_dpkg_help'])
     @OETestID(1802)
     def test_dpkg_version(self):
-        self.dpkg('dpkg --version')
+        self.dpkg('dpkg --version',"Debian 'dpkg' package management program version")
 
     @OETestID(1803)
     def test_dpkg_Dhelp(self):
-        self.dpkg('dpkg -Dhelp')
+        self.dpkg('dpkg -Dhelp',"dpkg debugging option, --debug=<octal> or -D<octal>:")
 
     @OETestID(1805)
     def test_dpkg_force_help(self):
-        self.dpkg('dpkg --force-help')
+        self.dpkg('dpkg --force-help',"dpkg forcing options - control behaviour when problems found:")
 
     @OETestID(1806)
     def test_dpkg_deb_help(self):
-        self.dpkg('dpkg-deb --help')
+        self.dpkg('dpkg-deb --help',"Usage: dpkg-deb [<option> ...] <command>")
 
     @OETestID(1812)
     def test_dpkg_status(self):
-        self.dpkg('dpkg -s dpkg')
+        self.dpkg('dpkg -s dpkg',"Package: dpkg")
 
     @OETestID(1814)
     def test_dpkg_list(self):
-        self.dpkg('dpkg -l')
+        self.dpkg('dpkg -l',"Desired=Unknown/Install/Remove/Purge/Hold")
-- 
2.12.3


