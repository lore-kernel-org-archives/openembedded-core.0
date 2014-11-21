Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3E94572160
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 16:08:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Nov 2014 08:08:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,432,1413270000"; d="scan'208";a="626255378"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO localhost)
	([10.255.13.176])
	by fmsmga001.fm.intel.com with ESMTP; 21 Nov 2014 08:07:55 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 21 Nov 2014 10:07:47 -0600
Message-Id: <db14e81d99065b4381af1878a856f4933a0aa9c5.1416585198.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1416585198.git.tom.zanussi@linux.intel.com>
References: <cover.1416585198.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/6][dizzy] wic: Don't allow mkfs to fail silently in partition command
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
X-List-Received-Date: Fri, 21 Nov 2014 16:08:25 -0000

The return code from the mkfs command used by the partition creation
command was being ignored, allowing it to silently fail and leaving
users mystified as to why the resulting filesystem was corrupted.

This became obvious when failures occurred when creating large
e.g. sdk filesystems [YOCTO #6863].

(From OE-Core rev: 8cef3b06f7e9f9d922673f430ddb3170d2fac000)

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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


