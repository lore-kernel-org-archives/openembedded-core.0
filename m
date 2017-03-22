Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id D8C3B77B52
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 13:44:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 22 Mar 2017 06:44:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,205,1486454400"; d="scan'208";a="1111070056"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 22 Mar 2017 06:44:09 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 908BA2C8002
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 06:44:03 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Mar 2017 15:42:33 +0200
Message-Id: <7d65673d83bbd7aa799c65bfce1f1d271db37056.1490188583.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490188583.git.ed.bartosh@linux.intel.com>
References: <cover.1490188583.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 09/10] selftest: pylinted wic test suite.
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
X-List-Received-Date: Wed, 22 Mar 2017 13:44:08 -0000

Fixed long lines, indentation and one unused variable.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 52 +++++++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 2e22362..327dd07 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -210,7 +210,7 @@ class Wic(oeSelfTest):
 
     @testcase(1385)
     @only_for_arch(['i586', 'i686', 'x86_64'])
-    def test_directdisk_bootloader_config(self):
+    def test_bootloader_config(self):
         """Test creation of directdisk-bootloader-config image"""
         cmd = "wic create directdisk-bootloader-config -e core-image-minimal -o %s" % self.resultdir
         self.assertEqual(0, runCmd(cmd).status)
@@ -252,9 +252,9 @@ class Wic(oeSelfTest):
     def test_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
         bb_vars = get_bb_vars(['STAGING_DATADIR', 'RECIPE_SYSROOT_NATIVE'],
-                               'wic-tools')
+                              'wic-tools')
         bb_vars.update(get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_ROOTFS'],
-                                 'core-image-minimal'))
+                                   'core-image-minimal'))
         bbvars = {key.lower(): value for key, value in bb_vars.items()}
         bbvars['resultdir'] = self.resultdir
         status = runCmd("wic create directdisk "
@@ -362,9 +362,9 @@ class Wic(oeSelfTest):
     def test_rootfs_artifacts(self):
         """Test usage of rootfs plugin with rootfs paths"""
         bb_vars = get_bb_vars(['STAGING_DATADIR', 'RECIPE_SYSROOT_NATIVE'],
-                               'wic-tools')
+                              'wic-tools')
         bb_vars.update(get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_ROOTFS'],
-                                 'core-image-minimal'))
+                                   'core-image-minimal'))
         bbvars = {key.lower(): value for key, value in bb_vars.items()}
         bbvars['wks'] = "directdisk-multi-rootfs"
         bbvars['resultdir'] = self.resultdir
@@ -388,7 +388,8 @@ class Wic(oeSelfTest):
             wks_file = 'temp.wks'
             with open(wks_file, 'w') as wks:
                 rootfs_dir = get_bb_var('IMAGE_ROOTFS', 'core-image-minimal')
-                wks.write("""part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path usr
+                wks.write("""
+part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path usr
 part /usr --source rootfs --ondisk mmcblk0 --fstype=ext4 --rootfs-dir %s/usr
 part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --rootfs-dir %s/usr"""
                           % (rootfs_dir, rootfs_dir))
@@ -423,25 +424,27 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
                                            (wicimg, part_file, start, length)).status)
 
             def extract_files(debugfs_output):
-                # extract file names from the output of debugfs -R 'ls -p',
-                # which looks like this:
-                #
-                # /2/040755/0/0/.//\n
-                # /2/040755/0/0/..//\n
-                # /11/040700/0/0/lost+found^M//\n
-                # /12/040755/1002/1002/run//\n
-                # /13/040755/1002/1002/sys//\n
-                # /14/040755/1002/1002/bin//\n
-                # /80/040755/1002/1002/var//\n
-                # /92/040755/1002/1002/tmp//\n
-                #
+                """
+                extract file names from the output of debugfs -R 'ls -p',
+                which looks like this:
+
+                 /2/040755/0/0/.//\n
+                 /2/040755/0/0/..//\n
+                 /11/040700/0/0/lost+found^M//\n
+                 /12/040755/1002/1002/run//\n
+                 /13/040755/1002/1002/sys//\n
+                 /14/040755/1002/1002/bin//\n
+                 /80/040755/1002/1002/var//\n
+                 /92/040755/1002/1002/tmp//\n
+                """
                 # NOTE the occasional ^M in file names
                 return [line.split('/')[5].strip() for line in \
                         debugfs_output.strip().split('/\n')]
 
             # Test partition 1, should contain the normal root directories, except
             # /usr.
-            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part1"))
+            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % \
+                             os.path.join(self.resultdir, "selftest_img.part1"))
             self.assertEqual(0, res.status)
             files = extract_files(res.output)
             self.assertIn("etc", files)
@@ -449,7 +452,8 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
 
             # Partition 2, should contain common directories for /usr, not root
             # directories.
-            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part2"))
+            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % \
+                             os.path.join(self.resultdir, "selftest_img.part2"))
             self.assertEqual(0, res.status)
             files = extract_files(res.output)
             self.assertNotIn("etc", files)
@@ -458,14 +462,16 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
 
             # Partition 3, should contain the same as partition 2, including the bin
             # directory, but not the files inside it.
-            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part3"))
+            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % \
+                             os.path.join(self.resultdir, "selftest_img.part3"))
             self.assertEqual(0, res.status)
             files = extract_files(res.output)
             self.assertNotIn("etc", files)
             self.assertNotIn("usr", files)
             self.assertIn("share", files)
             self.assertIn("bin", files)
-            res = runCmd("debugfs -R 'ls -p bin' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part3"))
+            res = runCmd("debugfs -R 'ls -p bin' %s 2>/dev/null" % \
+                             os.path.join(self.resultdir, "selftest_img.part3"))
             self.assertEqual(0, res.status)
             files = extract_files(res.output)
             self.assertIn(".", files)
@@ -483,8 +489,6 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         """Test --exclude-path wks option error handling."""
         wks_file = 'temp.wks'
 
-        rootfs_dir = get_bb_var('IMAGE_ROOTFS', 'core-image-minimal')
-
         # Absolute argument.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path /usr")
-- 
2.1.4


