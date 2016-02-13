Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1F47376BD7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 11:12:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 13 Feb 2016 03:12:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,440,1449561600"; d="scan'208";a="911322681"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 13 Feb 2016 03:12:43 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 4B8E46A4004
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 04:00:34 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Feb 2016 11:02:20 +0200
Message-Id: <6787f14e1dccaab7e75383aadd2c0967427f3015.1455353103.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455353103.git.ed.bartosh@linux.intel.com>
References: <cover.1455353103.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1455353103.git.ed.bartosh@linux.intel.com>
References: <cover.1455353103.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v3 13/14] oe-selftest: pylinted wic tests
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
X-List-Received-Date: Sat, 13 Feb 2016 11:12:43 -0000

Fixed the following pylint warnings:
  C: 45, 0: Line too long (91/80) (line-too-long)
  C:105, 0: Wrong continued indentation.
                            ignore_status=True).status)
                            ^         | (bad-continuation)
  W: 83, 8: Redefining built-in 'vars' (redefined-builtin)
  W:175, 8: Redefining built-in 'vars' (redefined-builtin)
  W: 27, 0: Unused import sys (unused-import)

(From OE-Core rev: ecb5320e766d0fa031c269d6d9b2a24c81c7aa7e)

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/wic.py | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 7b173e4..ed03018 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -24,7 +24,6 @@
 """Test cases for wic."""
 
 import os
-import sys
 
 from glob import glob
 from shutil import rmtree
@@ -42,7 +41,8 @@ class Wic(oeSelfTest):
 
     def setUpLocal(self):
         """This code is executed before each test method."""
-        self.write_config('IMAGE_FSTYPES += " hddimg"\nMACHINE_FEATURES_append = " efi"\n')
+        self.write_config('IMAGE_FSTYPES += " hddimg"\n'
+                          'MACHINE_FEATURES_append = " efi"\n')
 
         # Do this here instead of in setUpClass as the base setUp does some
         # clean up which can result in the native tools built earlier in
@@ -80,14 +80,14 @@ class Wic(oeSelfTest):
     @testcase(1212)
     def test_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
-        vars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
+        bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
                         for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
                                     'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
         status = runCmd("wic create directdisk "
                         "-b %(staging_datadir)s "
                         "-k %(deploy_dir_image)s "
                         "-n %(staging_dir_native)s "
-                        "-r %(image_rootfs)s" % vars).status
+                        "-r %(image_rootfs)s" % bbvars).status
         self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
@@ -102,7 +102,7 @@ class Wic(oeSelfTest):
     def test_unsupported_subcommand(self):
         """Test unsupported subcommand"""
         self.assertEqual(1, runCmd('wic unsupported',
-                         ignore_status=True).status)
+                                   ignore_status=True).status)
 
     @testcase(1214)
     def test_no_command(self):
@@ -172,20 +172,20 @@ class Wic(oeSelfTest):
     @testcase(1269)
     def test_rootfs_artifacts(self):
         """Test usage of rootfs plugin with rootfs paths"""
-        vars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
+        bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
                         for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
                                     'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
-        vars['wks'] = "directdisk-multi-rootfs"
+        bbvars['wks'] = "directdisk-multi-rootfs"
         status = runCmd("wic create %(wks)s "
                         "-b %(staging_datadir)s "
                         "-k %(deploy_dir_image)s "
                         "-n %(staging_dir_native)s "
                         "--rootfs-dir rootfs1=%(image_rootfs)s "
                         "--rootfs-dir rootfs2=%(image_rootfs)s" \
-                        % vars).status
+                        % bbvars).status
         self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + \
-                                     "%(wks)s-*.direct" % vars)))
+                                     "%(wks)s-*.direct" % bbvars)))
 
     @testcase(1346)
     def test_iso_image(self):
-- 
2.1.4


