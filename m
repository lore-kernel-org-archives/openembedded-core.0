Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A6A4B609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 09:23:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 21 May 2015 02:23:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,467,1427785200"; d="scan'208";a="574750152"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 21 May 2015 02:23:27 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id A96E26A4005;
	Thu, 21 May 2015 02:22:55 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 10:29:52 +0300
Message-Id: <1432193392-27124-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: Make sure file exists before removing it
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
X-List-Received-Date: Thu, 21 May 2015 09:23:30 -0000

Bunch of os.remove calls were added to the partition.py lately.
They're causing wic to fail with OSError: [Errno 2] No such file or directory
if file doesn't exist.

Added check for file existence to all recently added calls of
os.remove. That should fix this regression.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/kickstart/custom_commands/partition.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index e864076..d9f77d9 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -230,7 +230,7 @@ class Wic_PartData(Mic_PartData):
         image_rootfs = rootfs_dir
         rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label ,self.fstype)
 
-        os.remove(rootfs)
+        os.path.isfile(rootfs) and os.remove(rootfs)
         du_cmd = "du -ks %s" % image_rootfs
         out = exec_cmd(du_cmd)
         actual_rootfs_size = int(out.split()[0])
@@ -282,7 +282,7 @@ class Wic_PartData(Mic_PartData):
         image_rootfs = rootfs_dir
         rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
-        os.remove(rootfs)
+        os.path.isfile(rootfs) and os.remove(rootfs)
         du_cmd = "du -ks %s" % image_rootfs
         out = exec_cmd(du_cmd)
         actual_rootfs_size = int(out.split()[0])
@@ -327,7 +327,7 @@ class Wic_PartData(Mic_PartData):
         image_rootfs = rootfs_dir
         rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
-        os.remove(rootfs)
+        os.path.isfile(rootfs) and os.remove(rootfs)
         du_cmd = "du -bks %s" % image_rootfs
         out = exec_cmd(du_cmd)
         blocks = int(out.split()[0])
@@ -380,7 +380,7 @@ class Wic_PartData(Mic_PartData):
         image_rootfs = rootfs_dir
         rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label ,self.fstype)
 
-        os.remove(rootfs)
+        os.path.isfile(rootfs) and os.remove(rootfs)
         squashfs_cmd = "mksquashfs %s %s -noappend" % \
                        (image_rootfs, rootfs)
         exec_native_cmd(pseudo + squashfs_cmd, native_sysroot)
@@ -419,7 +419,7 @@ class Wic_PartData(Mic_PartData):
         """
         fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
-        os.remove(fs)
+        os.path.isfile(fs) and os.remove(fs)
         dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
             (fs, self.size)
         exec_cmd(dd_cmd)
@@ -447,7 +447,7 @@ class Wic_PartData(Mic_PartData):
         """
         fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
-        os.remove(fs)
+        os.path.isfile(fs) and os.remove(fs)
         dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
             (fs, self.size)
         exec_cmd(dd_cmd)
@@ -472,7 +472,7 @@ class Wic_PartData(Mic_PartData):
         Prepare an empty vfat partition.
         """
         fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
-        os.remove(fs)
+        os.path.isfile(fs) and os.remove(fs)
 
         blocks = self.size
 
@@ -499,7 +499,7 @@ class Wic_PartData(Mic_PartData):
                       "Proceeding as requested." % self.mountpoint)
 
         fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
-        os.remove(fs)
+        os.path.isfile(fs) and os.remove(fs)
 
         # it is not possible to create a squashfs without source data,
         # thus prepare an empty temp dir that is used as source
-- 
2.1.4


