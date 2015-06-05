Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1C99375771
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 08:06:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jun 2015 01:06:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,557,1427785200"; d="scan'208";a="721218851"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jun 2015 01:06:56 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 73FC76A4083;
	Fri,  5 Jun 2015 01:06:22 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jun 2015 09:13:07 +0300
Message-Id: <1433484789-304-3-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433484789-304-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1433484789-304-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 2/4] wic: move checks to exec_native_cmd
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
X-List-Received-Date: Fri, 05 Jun 2015 08:06:56 -0000

Checked for return code and output of native commands
inside exec_native_cmd.

Removed similar code from a lot of places where
exec_native_cmd is called.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index d9f77d9..5d033bb 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -257,10 +257,7 @@ class Wic_PartData(Mic_PartData):
 
         mkfs_cmd = "mkfs.%s -F %s %s %s -d %s" % \
             (self.fstype, extra_imagecmd, rootfs, label_str, image_rootfs)
-        (rc, out) = exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
-        if rc:
-            print "rootfs_dir: %s" % rootfs_dir
-            msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details) when creating filesystem from rootfs directory: %s" % (self.fstype, rc, rootfs_dir))
+        exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
 
         # get the rootfs size in the right units for kickstart (kB)
         du_cmd = "du -Lbks %s" % rootfs
@@ -307,9 +304,7 @@ class Wic_PartData(Mic_PartData):
 
         mkfs_cmd = "mkfs.%s -b %d -r %s %s %s" % \
             (self.fstype, rootfs_size * 1024, image_rootfs, label_str, rootfs)
-        (rc, out) = exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
-        if rc:
-            msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details) when creating filesystem from rootfs directory: %s" % (self.fstype, rc, rootfs_dir))
+        exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
 
         # get the rootfs size in the right units for kickstart (kB)
         du_cmd = "du -Lbks %s" % rootfs
@@ -357,9 +352,7 @@ class Wic_PartData(Mic_PartData):
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, image_rootfs)
-        rc, out = exec_native_cmd(mcopy_cmd, native_sysroot)
-        if rc:
-            msger.error("ERROR: mcopy returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details)" % rc)
+        exec_native_cmd(mcopy_cmd, native_sysroot)
 
         chmod_cmd = "chmod 644 %s" % rootfs
         exec_cmd(chmod_cmd)
@@ -432,9 +425,7 @@ class Wic_PartData(Mic_PartData):
 
         mkfs_cmd = "mkfs.%s -F %s %s %s" % \
             (self.fstype, extra_imagecmd, label_str, fs)
-        (rc, out) = exec_native_cmd(mkfs_cmd, native_sysroot)
-        if rc:
-            msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details)" % (self.fstype, rc))
+        exec_native_cmd(mkfs_cmd, native_sysroot)
 
         self.source_file = fs
 
@@ -458,9 +449,7 @@ class Wic_PartData(Mic_PartData):
 
         mkfs_cmd = "mkfs.%s -b %d %s %s" % \
             (self.fstype, self.size * 1024, label_str, fs)
-        (rc, out) = exec_native_cmd(mkfs_cmd, native_sysroot)
-        if rc:
-            msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details)" % (self.fstype, rc))
+        exec_native_cmd(mkfs_cmd, native_sysroot)
 
         self.source_file = fs
 
diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index 9eaf039..f08ff15 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -86,6 +86,12 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch=3):
         msger.error("A native program %s required to build the image "
                     "was not found (see details above). Please make sure "
                     "it's installed and try again." % args[0])
+    if out:
+        msger.debug('"%s" output: %s' % (args[0], out))
+
+    if rc != 0:
+        msger.error("exec_cmd: '%s' returned '%s' instead of 0" % \
+                    (cmd_and_args, rc))
 
     return (rc, out)
 
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index eacf267..8fd44a6 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -227,17 +227,7 @@ class Image:
         args = ' '.join(args)
         msger.debug(args)
 
-        rc, out = exec_native_cmd(args, self.native_sysroot)
-
-        if out:
-            msger.debug('"parted" output: %s' % out)
-
-        if rc != 0:
-            # We don't throw exception when return code is not 0, because
-            # parted always fails to reload part table with loop devices. This
-            # prevents us from distinguishing real errors based on return
-            # code.
-            msger.error("WARNING: parted returned '%s' instead of 0 (use --debug for details)" % rc)
+        exec_native_cmd(args, self.native_sysroot)
 
     def __create_partition(self, device, parttype, fstype, start, size):
         """ Create a partition on an image described by the 'device' object. """
-- 
2.1.4


