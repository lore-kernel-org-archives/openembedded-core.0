Return-Path: <costin.c.constantin@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9ABC365C78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 11:20:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 14 Jul 2015 04:20:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,471,1432623600"; d="scan'208";a="746829848"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jul 2015 04:20:46 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 792B16A4005;
	Tue, 14 Jul 2015 04:20:04 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 14:31:11 +0300
Message-Id: <1436873471-17794-3-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1436873471-17794-1-git-send-email-costin.c.constantin@intel.com>
References: <1436873471-17794-1-git-send-email-costin.c.constantin@intel.com>
Subject: [PATCH 3/3] oeqa/buildoptions: add useful failure messages for all test cases
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
X-List-Received-Date: Tue, 14 Jul 2015 11:20:46 -0000

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 926ffe9..13ec276 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -44,18 +44,18 @@ class ImageOptionsTests(oeSelfTest):
         bitbake("-C rootfs core-image-minimal")
         deploydir_files = os.listdir(deploydir)
         remaining_not_expected = [path for path in track_original_files if os.path.basename(path) in deploydir_files]
-        self.assertFalse(remaining_not_expected, msg="\nThe following image files ware not removed: %s" % ', '.join(map(str, remaining_not_expected)))
+        self.assertFalse(remaining_not_expected, msg="\nThe following image files were not removed: %s" % ', '.join(map(str, remaining_not_expected)))
 
     @testcase(286)
     def test_ccache_tool(self):
         bitbake("ccache-native")
-        self.assertTrue(os.path.isfile(os.path.join(get_bb_var('STAGING_BINDIR_NATIVE', 'ccache-native'), "ccache")))
+        self.assertTrue(os.path.isfile(os.path.join(get_bb_var('STAGING_BINDIR_NATIVE', 'ccache-native'), "ccache")), msg = "No ccache found under %s" % str(get_bb_var('STAGING_BINDIR_NATIVE', 'ccache-native')))
         self.write_config('INHERIT += "ccache"')
         bitbake("m4 -c cleansstate")
         bitbake("m4 -c compile")
+        self.addCleanup(bitbake, 'ccache-native -ccleansstate')
         res = runCmd("grep ccache %s" % (os.path.join(get_bb_var("WORKDIR","m4"),"temp/log.do_compile")), ignore_status=True)
-        self.assertEqual(0, res.status, msg="No match for ccache in m4 log.do_compile")
-        bitbake("ccache-native -ccleansstate")
+        self.assertEqual(0, res.status, msg="No match for ccache in m4 log.do_compile. For further details: %s" % os.path.join(get_bb_var("WORKDIR","m4"),"temp/log.do_compile"))
 
 
 class DiskMonTest(oeSelfTest):
@@ -64,15 +64,15 @@ class DiskMonTest(oeSelfTest):
     def test_stoptask_behavior(self):
         self.write_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},100000G,100K"')
         res = bitbake("m4", ignore_status = True)
-        self.assertTrue('ERROR: No new tasks can be executed since the disk space monitor action is "STOPTASKS"!' in res.output)
-        self.assertEqual(res.status, 1)
+        self.assertTrue('ERROR: No new tasks can be executed since the disk space monitor action is "STOPTASKS"!' in res.output, msg = "Tasks should have stopped. Disk monitor is set to STOPTASK: %s" % res.output)
+        self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
         self.write_config('BB_DISKMON_DIRS = "ABORT,${TMPDIR},100000G,100K"')
         res = bitbake("m4", ignore_status = True)
-        self.assertTrue('ERROR: Immediately abort since the disk space monitor action is "ABORT"!' in res.output)
-        self.assertEqual(res.status, 1)
+        self.assertTrue('ERROR: Immediately abort since the disk space monitor action is "ABORT"!' in res.output, "Tasks should have been aborted immediatelly. Disk monitor is set to ABORT: %s" % res.output)
+        self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
         self.write_config('BB_DISKMON_DIRS = "WARN,${TMPDIR},100000G,100K"')
         res = bitbake("m4")
-        self.assertTrue('WARNING: The free space' in res.output)
+        self.assertTrue('WARNING: The free space' in res.output, msg = "A warning should have been displayed for disk monitor is set to WARN: %s" %res.output)
 
 class SanityOptionsTest(oeSelfTest):
 
@@ -87,7 +87,7 @@ class SanityOptionsTest(oeSelfTest):
         res = bitbake("xcursor-transparent-theme", ignore_status=True)
         self.delete_recipeinc('xcursor-transparent-theme')
         self.assertTrue("ERROR: QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors." in res.output, msg=res.output)
-        self.assertEqual(res.status, 1)
+        self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
         self.write_recipeinc('xcursor-transparent-theme', 'PACKAGES += \"${PN}-dbg\"')
         self.append_config('ERROR_QA_remove = "packages-list"')
         self.append_config('WARN_QA_append = " packages-list"')
@@ -101,15 +101,15 @@ class SanityOptionsTest(oeSelfTest):
         self.append_config('WARN_QA_append = " unsafe-references-in-binaries unsafe-references-in-scripts"')
         bitbake("-ccleansstate gzip nfs-utils")
         res = bitbake("gzip nfs-utils")
-        self.assertTrue("WARNING: QA Issue: gzip" in res.output)
-        self.assertTrue("WARNING: QA Issue: nfs-utils" in res.output)
+        self.assertTrue("WARNING: QA Issue: gzip" in res.output, "WARNING: QA Issue: gzip message is not present in bitbake's output: %s" % res.output)
+        self.assertTrue("WARNING: QA Issue: nfs-utils" in res.output, "WARNING: QA Issue: nfs-utils message is not present in bitbake's output: %s" % res.output)
 
 class BuildhistoryTests(BuildhistoryBase):
 
     @testcase(293)
     def test_buildhistory_basic(self):
         self.run_buildhistory_operation('xcursor-transparent-theme')
-        self.assertTrue(os.path.isdir(get_bb_var('BUILDHISTORY_DIR')))
+        self.assertTrue(os.path.isdir(get_bb_var('BUILDHISTORY_DIR')), "buildhistory dir was not created.")
 
     @testcase(294)
     def test_buildhistory_buildtime_pr_backwards(self):
-- 
2.1.4


