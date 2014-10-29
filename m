Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4E6F770EE2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 22:04:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Oct 2014 15:04:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,280,1413270000"; d="scan'208";a="598625611"
Received: from enewy-mobl1.amr.corp.intel.com (HELO localhost) ([10.254.56.8])
	by orsmga001.jf.intel.com with ESMTP; 29 Oct 2014 15:04:25 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: philip@balister.org, maciej.borzecki@open-rnd.pl,
	openembedded-core@lists.openembedded.org
Date: Wed, 29 Oct 2014 17:04:19 -0500
Message-Id: <92a50f084bc31cb2824d01435737b85be99f0d1d.1414618765.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1414618765.git.tom.zanussi@linux.intel.com>
References: <cover.1414618765.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/6] wic: Don't allow mkfs to fail silently in partition command
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
X-List-Received-Date: Wed, 29 Oct 2014 22:04:30 -0000

The return code from the mkfs command used by the partition creation
command was being ignored, allowing it to silently fail and leaving
users mystified as to why the resulting filesystem was corrupted.

This became obvious when failures occurred when creating large
e.g. sdk filesystems [YOCTO #6863].

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 .../lib/wic/kickstart/custom_commands/partition.py | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 8b0ace6..3950b43 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -241,8 +241,10 @@ class Wic_PartData(Mic_PartData):
 
         mkfs_cmd = "mkfs.%s -F %s %s -d %s" % \
             (self.fstype, extra_imagecmd, rootfs, image_rootfs)
-        exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
-
+        (rc, out) = exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
+        if rc:
+            print "rootfs_dir: %s" % rootfs_dir
+            msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details) when creating filesystem from rootfs directory: %s" % (self.fstype, rc, rootfs_dir))
 
         # get the rootfs size in the right units for kickstart (Mb)
         du_cmd = "du -Lbms %s" % rootfs
@@ -284,7 +286,9 @@ class Wic_PartData(Mic_PartData):
 
         mkfs_cmd = "mkfs.%s -b %d -r %s %s" % \
             (self.fstype, rootfs_size * 1024, image_rootfs, rootfs)
-        exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
+        (rc, out) = exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
+        if rc:
+            msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details) when creating filesystem from rootfs directory: %s" % (self.fstype, rc, rootfs_dir))
 
         # get the rootfs size in the right units for kickstart (Mb)
         du_cmd = "du -Lbms %s" % rootfs
@@ -396,7 +400,9 @@ class Wic_PartData(Mic_PartData):
         extra_imagecmd = "-i 8192"
 
         mkfs_cmd = "mkfs.%s -F %s %s" % (self.fstype, extra_imagecmd, fs)
-        exec_native_cmd(mkfs_cmd, native_sysroot)
+        (rc, out) = exec_native_cmd(mkfs_cmd, native_sysroot)
+        if rc:
+            msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details)" % (self.fstype, rc))
 
         self.source_file = fs
 
@@ -414,10 +420,14 @@ class Wic_PartData(Mic_PartData):
         exec_cmd(dd_cmd)
 
         mkfs_cmd = "mkfs.%s -b %d %s" % (self.fstype, self.size * 1024, rootfs)
-        exec_native_cmd(mkfs_cmd, native_sysroot)
+        (rc, out) = exec_native_cmd(mkfs_cmd, native_sysroot)
+        if rc:
+            msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details)" % (self.fstype, rc))
 
         mkfs_cmd = "mkfs.%s -F %s %s" % (self.fstype, extra_imagecmd, fs)
-        exec_native_cmd(mkfs_cmd, native_sysroot)
+        (rc, out) = exec_native_cmd(mkfs_cmd, native_sysroot)
+        if rc:
+            msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details)" % (self.fstype, rc))
 
         self.source_file = fs
 
-- 
1.9.3


