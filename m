Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6007E772BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 18:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0KI5E7g019641; Fri, 20 Jan 2017 18:05:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SMpNFaFIyhtF; Fri, 20 Jan 2017 18:05:14 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0KI5Avh019616
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Jan 2017 18:05:11 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cUdYk-0000uI-GP; Fri, 20 Jan 2017 18:05:10 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 18:04:56 +0000
Message-Id: <1484935506-3419-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484935506-3419-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484935506-3419-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 04/14] wic: fix getting path of native sysroot
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
X-List-Received-Date: Fri, 20 Jan 2017 18:05:16 -0000

From: Ed Bartosh <ed.bartosh@linux.intel.com>

wic used STAGING_DIR_NATIVE variable as a path to native sysroot.
This doesn't work with recipe specific sysroots as STAGING_DIR_NATIVE
points to the native sysroot of the current recipe.

Used RECIPE_SYSROOT_NATIVE variable of wic-tools recipe
to fix the issue.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 12 ++++++------
 scripts/wic                   |  3 +--
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index e45594f..77f1bdc 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -210,12 +210,12 @@ class Wic(oeSelfTest):
     def test_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
         bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal'))
-                      for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
-                                  'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
+                      for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE', 'IMAGE_ROOTFS'))
+        bbvars['recipe_sysroot_native'] = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
         status = runCmd("wic create directdisk "
                         "-b %(staging_datadir)s "
                         "-k %(deploy_dir_image)s "
-                        "-n %(staging_dir_native)s "
+                        "-n %(recipe_sysroot_native)s "
                         "-r %(image_rootfs)s" % bbvars).status
         self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
@@ -301,13 +301,13 @@ class Wic(oeSelfTest):
     def test_rootfs_artifacts(self):
         """Test usage of rootfs plugin with rootfs paths"""
         bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal'))
-                      for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
-                                  'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
+                      for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE', 'IMAGE_ROOTFS'))
+        bbvars['recipe_sysroot_native'] = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
         bbvars['wks'] = "directdisk-multi-rootfs"
         status = runCmd("wic create %(wks)s "
                         "--bootimg-dir=%(staging_datadir)s "
                         "--kernel-dir=%(deploy_dir_image)s "
-                        "--native-sysroot=%(staging_dir_native)s "
+                        "--native-sysroot=%(recipe_sysroot_native)s "
                         "--rootfs-dir rootfs1=%(image_rootfs)s "
                         "--rootfs-dir rootfs2=%(image_rootfs)s"
                         % bbvars).status
diff --git a/scripts/wic b/scripts/wic
index 1ad1666..f09dbc2 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -175,8 +175,7 @@ def wic_create_subcommand(args, usage_str):
 
         rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", options.image_name)
         kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE", options.image_name)
-        native_sysroot = get_bitbake_var("STAGING_DIR_NATIVE",
-                                         options.image_name)
+        native_sysroot = os.path.join(get_bitbake_var("RECIPE_SYSROOT_NATIVE", "wic-tools"))
     else:
         if options.build_rootfs:
             print("Image name is not specified, exiting. (Use -e/--image-name to specify it)\n")
-- 
2.7.4


