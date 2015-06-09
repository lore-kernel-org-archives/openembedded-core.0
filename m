Return-Path: <costin.c.constantin@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DDA1672491
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 11:25:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jun 2015 04:25:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,579,1427785200"; d="scan'208";a="743564182"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2015 04:25:05 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 3E5DC6A4083;
	Tue,  9 Jun 2015 04:24:29 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jun 2015 14:34:58 +0300
Message-Id: <1433849698-21978-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] lib/oeqa/selftest/buildoptions.py: added auto test for image build with GPL licenses for containing packages
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
X-List-Received-Date: Tue, 09 Jun 2015 11:25:11 -0000

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index a3297fd..cddfa48 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -156,3 +156,32 @@ class BuildImagesTest(oeSelfTest):
           self.prc.kill(9)
           self.log.error("It is possible that runquemu didn't start correctly. Add this line your_username  ALL=NOPASSWD:       ALL\nto your visudo")
           self.assertTrue(False, "Couldn't start qemu")
+
+class ArchiverTest(oeSelfTest):
+    @testcase(929)
+    def test_gpl_licenses(self):
+        """
+        Test for checking that correct GPL licenses are used when explicitly required.
+        """
+        self.add_command_to_tearDown('cleanup-workdir')
+        self.write_config("MACHINE = \"qemux86\"\nINHERIT += \"archiver\"\nARCHIVER_MODE[src] = \"original\"\nCOPYLEFT_LICENSE_INCLUDE = \"GPLv2* GPLv3*\"")
+        self.res = bitbake("core-image-minimal").status
+        self.remove_config("MACHINE = \"qemux86\"\nINHERIT += \"archiver\"\nARCHIVER_MODE[src] = \"original\"\nCOPYLEFT_LICENSE_INCLUDE = \"GPLv2* GPLv3*\"")
+        self.assertEqual(self.res, 0, "core-image-minimal didn't build. Please check logs for further details")
+        self.built_pkgs_list = os.listdir(self.builddir + "/tmp/deploy/sources/i586-poky-linux/")# the list containing built pkgs with ver.
+        self.pkg_name_split = [i.split("-") for i in self.built_pkgs_list]
+        self.pkgs = [] # this will contain the pkgs name as found in tmp/deploy/licenses
+        for i in self.pkg_name_split:
+          self.name = ""
+          for j in i:
+            if i.index(j) == 0:
+              self.name = j
+            elif j.isalpha() and i.index(j) != 0:
+              self.name = self.name + "-" + j
+            else:
+              self.pkgs.append(self.name)
+              break
+        self.license_dir = self.builddir + "/tmp/deploy/licenses/"
+        for i in self.pkgs:
+          if os.path.isdir(self.license_dir + i):
+            self.assertTrue(g.glob(self.license_dir + i + "/*GPL*"), "couldn't find GPL license in " + self.license_dir + i)
\ No newline at end of file
-- 
2.1.4


