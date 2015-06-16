Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7E111601DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 08:47:46 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 16 Jun 2015 01:47:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,625,1427785200"; d="scan'208";a="588668452"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 16 Jun 2015 01:47:48 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 855576A4005;
	Tue, 16 Jun 2015 01:47:11 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2015 09:53:57 +0300
Message-Id: <1434437637-21465-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] oe-selftest: wic: Fix testcase
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
X-List-Received-Date: Tue, 16 Jun 2015 08:47:47 -0000

Fixed test05_build_artifacts testcase by using values of MACHINE
and BUILD_SYS bitbake variables in paths to artifacts.

Test was failing because of hardcoded machine(qemux86) and
build_sys(qemux86-poky-linux) in artifact paths.

[YOCTO #7730]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 358f09e..0e3f1f6 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -29,7 +29,7 @@ from glob import glob
 from shutil import rmtree
 
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import runCmd, bitbake
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 
 class Wic(oeSelfTest):
     """Wic test class."""
@@ -66,12 +66,15 @@ class Wic(oeSelfTest):
 
     def test05_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
-        self.assertEqual(0, runCmd("wic create directdisk "
-                                   "-b tmp/sysroots/qemux86/usr/share "
-                                   "-k tmp/deploy/images/qemux86 "
-                                   "-n tmp/sysroots/x86_64-linux "
-                                   "-r tmp/work/qemux86-poky-linux/"
-                                   "core-image-minimal/1.0-r0/rootfs").status)
+        vars = {'machine': get_bb_var('MACHINE'),
+                'buildsys': get_bb_var('BUILD_SYS')}
+        status = runCmd("wic create directdisk "
+                        "-b tmp/sysroots/%(machine)s/usr/share "
+                        "-k tmp/deploy/images/%(machine)s "
+                        "-n tmp/sysroots/%(buildsys)s "
+                        "-r tmp/work/%(machine)s-poky-linux/"
+                        "core-image-minimal/1.0-r0/rootfs" % vars).status
+        self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     def test06_gpt_image(self):
-- 
2.1.4


