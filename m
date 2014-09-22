Return-Path: <georgex.l.musat@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C0AAF610F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 10:51:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Sep 2014 03:44:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,571,1406617200"; d="scan'208";a="606484859"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 22 Sep 2014 03:50:50 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 406C26A4087;
	Mon, 22 Sep 2014 03:50:05 -0700 (PDT)
From: Lucian Musat <georgex.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Sep 2014 13:45:05 +0300
Message-Id: <1411382705-10869-1-git-send-email-georgex.l.musat@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] oeqa/selftest: Added decorators to buildoptions.py
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
X-List-Received-Date: Mon, 22 Sep 2014 10:51:24 -0000

Signed-off-by: Lucian Musat <georgex.l.musat@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index ec541e5..a250cae 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -7,9 +7,11 @@ from oeqa.selftest.base import oeSelfTest
 from oeqa.selftest.buildhistory import BuildhistoryBase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 import oeqa.utils.ftools as ftools
+from oeqa.utils.decorators import testcase
 
 class ImageOptionsTests(oeSelfTest):
 
+    @testcase(761)
     def test_incremental_image_generation(self):
         bitbake("-c cleanall core-image-minimal")
         self.write_config('INC_RPM_IMAGE_GEN = "1"')
@@ -22,6 +24,7 @@ class ImageOptionsTests(oeSelfTest):
         res = runCmd("grep 'Removing openssh-sshd' %s" %(os.path.join(get_bb_var("WORKDIR", "core-image-minimal"), "temp/log.do_rootfs")),ignore_status=True)
         self.assertEqual(0, res.status, msg="openssh-sshd was not removed from image")
 
+    @testcase(925)
     def test_rm_old_image(self):
         bitbake("core-image-minimal")
         deploydir = get_bb_var("DEPLOY_DIR_IMAGE", target="core-image-minimal")
@@ -37,6 +40,7 @@ class ImageOptionsTests(oeSelfTest):
         remaining_not_expected = [path for path in track_original_files if os.path.basename(path) in deploydir_files]
         self.assertFalse(remaining_not_expected, msg="\nThe following image files ware not removed: %s" % ', '.join(map(str, remaining_not_expected)))
 
+    @testcase(286)
     def test_ccache_tool(self):
         bitbake("ccache-native")
         self.assertTrue(os.path.isfile(os.path.join(get_bb_var('STAGING_BINDIR_NATIVE', 'ccache-native'), "ccache")))
@@ -50,6 +54,7 @@ class ImageOptionsTests(oeSelfTest):
 
 class DiskMonTest(oeSelfTest):
 
+    @testcase(277)
     def test_stoptask_behavior(self):
         self.write_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},100000G,100K"')
         res = bitbake("m4", ignore_status = True)
@@ -65,6 +70,7 @@ class DiskMonTest(oeSelfTest):
 
 class SanityOptionsTest(oeSelfTest):
 
+    @testcase(927)
     def test_options_warnqa_errorqa_switch(self):
         bitbake("xcursor-transparent-theme -ccleansstate")
 
@@ -84,6 +90,7 @@ class SanityOptionsTest(oeSelfTest):
         self.delete_recipeinc('xcursor-transparent-theme')
         self.assertTrue("WARNING: QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors." in res.output, msg=res.output)
 
+    @testcase(278)
     def test_sanity_userspace_dependency(self):
         self.append_config('WARN_QA_append = " unsafe-references-in-binaries unsafe-references-in-scripts"')
         bitbake("-ccleansstate gzip nfs-utils")
@@ -93,10 +100,12 @@ class SanityOptionsTest(oeSelfTest):
 
 class BuildhistoryTests(BuildhistoryBase):
 
+    @testcase(293)
     def test_buildhistory_basic(self):
         self.run_buildhistory_operation('xcursor-transparent-theme')
         self.assertTrue(os.path.isdir(get_bb_var('BUILDHISTORY_DIR')))
 
+    @testcase(294)
     def test_buildhistory_buildtime_pr_backwards(self):
         self.add_command_to_tearDown('cleanup-workdir')
         target = 'xcursor-transparent-theme'
-- 
1.9.1


