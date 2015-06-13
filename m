Return-Path: <costin.c.constantin@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E92B07597B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jun 2015 21:33:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 13 Jun 2015 14:33:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,608,1427785200"; d="scan'208";a="507798028"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Jun 2015 14:33:53 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 1DEC26A4005;
	Sat, 13 Jun 2015 14:33:16 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Jun 2015 00:43:53 +0300
Message-Id: <1434231833-32218-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] meta/lib/oeqa/selftest/wic.py: dynamic BSP name loading + small typo
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
X-List-Received-Date: Sat, 13 Jun 2015 21:33:53 -0000

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 358f09e..45abd3b 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -52,7 +52,7 @@ class Wic(oeSelfTest):
 
     def test02_createhelp(self):
         """Test wic create --help"""
-        self.assertEqual(0, runCmd('wic creat --help').status)
+        self.assertEqual(0, runCmd('wic create --help').status)
 
     def test03_listhelp(self):
         """Test wic list --help"""
@@ -66,12 +66,18 @@ class Wic(oeSelfTest):
 
     def test05_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
-        self.assertEqual(0, runCmd("wic create directdisk "
-                                   "-b tmp/sysroots/qemux86/usr/share "
-                                   "-k tmp/deploy/images/qemux86 "
-                                   "-n tmp/sysroots/x86_64-linux "
-                                   "-r tmp/work/qemux86-poky-linux/"
-                                   "core-image-minimal/1.0-r0/rootfs").status)
+        self.append_config("wic_test_var = \"${MACHINE}\"")
+        self.machine_name = runCmd("bitbake -e | egrep '^wic_test_var='").output
+        self.machine_name = self.machine_name.replace("-","_")
+        self.machine_name = self.machine_name.split('"')[1]
+        self.wic_command = "wic create directdisk \
+                            -b tmp/sysroots/qemux86/usr/share \
+                            -k tmp/deploy/images/qemux86 \
+                            -n tmp/sysroots/x86_64-linux \
+                            -r tmp/work/" + self.machine_name + \
+                            "-poky-linux/core-image-minimal/1.0-r0/rootfs"
+        self.wic_command = " ".join(self.wic_command.split())
+        self.assertEqual(0, runCmd(self.wic_command).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     def test06_gpt_image(self):
-- 
2.1.4


