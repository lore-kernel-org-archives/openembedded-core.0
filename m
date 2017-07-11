Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id D8C77781C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 20:23:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 11 Jul 2017 13:24:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,347,1496127600"; d="scan'208";a="1171279866"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2017 13:23:59 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 15:23:45 -0500
Message-Id: <bcfcefb74ffc4c9818692aa54b5d52dcecc44f4e.1499803885.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499803885.git.anibal.limon@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1499803885.git.anibal.limon@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCH 30/30] oeqa/selftest/cases: systemd_boot enable threaded runs
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
X-List-Received-Date: Tue, 11 Jul 2017 20:23:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../lib/oeqa/selftest/cases/systemd_boot.py        | 26 ++++++++++++----------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/meta-yocto-bsp/lib/oeqa/selftest/cases/systemd_boot.py b/meta-yocto-bsp/lib/oeqa/selftest/cases/systemd_boot.py
index dd5eeec1633..0bd52dc6b85 100644
--- a/meta-yocto-bsp/lib/oeqa/selftest/cases/systemd_boot.py
+++ b/meta-yocto-bsp/lib/oeqa/selftest/cases/systemd_boot.py
@@ -3,9 +3,11 @@ import os
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 
 class Systemdboot(OESelftestTestCase):
+    _use_own_builddir = True
+    _main_thread = False
+
     def _common_setup(self):
         """
         Common setup for test cases: 1445, 1528
@@ -22,7 +24,7 @@ class Systemdboot(OESelftestTestCase):
         """
 
         # Build a genericx86-64/efi systemdboot image
-        bitbake('mtools-native core-image-minimal')
+        self.bitbake('mtools-native core-image-minimal')
 
 
     @OETestID(1445)
@@ -38,14 +40,14 @@ class Systemdboot(OESelftestTestCase):
 
         # We'd use DEPLOY_DIR_IMAGE here, except that we need its value for
         # MACHINE="genericx86-64 which is probably not the one configured
-        systemdbootfile = os.path.join(get_bb_var('DEPLOY_DIR'), 'images', 'genericx86-64', 'systemd-bootx64.efi')
+        systemdbootfile = os.path.join(self.get_bb_var('DEPLOY_DIR'), 'images', 'genericx86-64', 'systemd-bootx64.efi')
 
         self._common_setup()
 
         # Ensure we're actually testing that this gets built and not that
         # it was around from an earlier build
-        bitbake('-c cleansstate systemd-boot')
-        runCmd('rm -f %s' % systemdbootfile)
+        self.bitbake('-c cleansstate systemd-boot')
+        self.runCmd('rm -f %s' % systemdbootfile)
 
         self._common_build()
 
@@ -71,20 +73,20 @@ class Systemdboot(OESelftestTestCase):
         AutomatedBy:  Jose Perez Carranza <jose.perez.carranza at linux-intel.com>
         """
 
-        systemdbootfile = os.path.join(get_bb_var('DEPLOY_DIR'), 'images', 'genericx86-64',
+        systemdbootfile = os.path.join(self.get_bb_var('DEPLOY_DIR'), 'images', 'genericx86-64',
                                            'systemd-bootx64.efi')
-        systemdbootimage = os.path.join(get_bb_var('DEPLOY_DIR'), 'images', 'genericx86-64',
+        systemdbootimage = os.path.join(self.get_bb_var('DEPLOY_DIR'), 'images', 'genericx86-64',
                                                 'core-image-minimal-genericx86-64.hddimg')
-        imagebootfile = os.path.join(get_bb_var('DEPLOY_DIR'), 'images', 'genericx86-64',
+        imagebootfile = os.path.join(self.get_bb_var('DEPLOY_DIR'), 'images', 'genericx86-64',
                                                             'bootx64.efi')
-        mcopynative = os.path.join(get_bb_var('STAGING_BINDIR_NATIVE'), 'mcopy')
+        mcopynative = os.path.join(self.get_bb_var('STAGING_BINDIR_NATIVE'), 'mcopy')
 
         #Clean environment before start the test
         if os.path.isfile(imagebootfile):
-            runCmd('rm -f %s' % imagebootfile)
+            self.runCmd('rm -f %s' % imagebootfile)
 
             #Step 1
-            runCmd('%s -i %s ::EFI/BOOT/bootx64.efi %s' % (mcopynative ,systemdbootimage,
+            self.runCmd('%s -i %s ::EFI/BOOT/bootx64.efi %s' % (mcopynative ,systemdbootimage,
                                                            imagebootfile))
 
             #Step 2
@@ -93,6 +95,6 @@ class Systemdboot(OESelftestTestCase):
                             % imagebootfile)
 
             #Step 3
-            result = runCmd('md5sum %s %s' % (systemdbootfile, imagebootfile))
+            result = self.runCmd('md5sum %s %s' % (systemdbootfile, imagebootfile))
             self.assertEqual(result.output.split()[0], result.output.split()[2],
                              '%s was not correclty generated' % imagebootfile)
-- 
2.11.0


