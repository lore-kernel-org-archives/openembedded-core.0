Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id CE24972027
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 23:46:48 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id C8DE18E; Tue, 10 Feb 2015 00:46:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 89F217E;
	Tue, 10 Feb 2015 00:46:48 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Tue, 10 Feb 2015 00:46:43 +0100
Message-Id: <1423525604-18344-4-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423525604-18344-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1423525604-18344-1-git-send-email-alexandre.belloni@free-electrons.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] wic: properly label filesystems
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
X-List-Received-Date: Mon, 09 Feb 2015 23:46:53 -0000

Use the partition label option, when available, to label the filesystem.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 .../lib/wic/kickstart/custom_commands/partition.py | 42 +++++++++++++++++-----
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 315c6128849d..4f5a1e5ce4c0 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -246,8 +246,12 @@ class Wic_PartData(Mic_PartData):
 
         extra_imagecmd = "-i 8192"
 
-        mkfs_cmd = "mkfs.%s -F %s %s -d %s" % \
-            (self.fstype, extra_imagecmd, rootfs, image_rootfs)
+        label_str = ""
+        if (self.label):
+            label_str = "-L %s" % self.label
+
+        mkfs_cmd = "mkfs.%s -F %s %s %s -d %s" % \
+            (self.fstype, extra_imagecmd, rootfs, label_str, image_rootfs)
         (rc, out) = exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
         if rc:
             print "rootfs_dir: %s" % rootfs_dir
@@ -291,8 +295,12 @@ class Wic_PartData(Mic_PartData):
             (rootfs, rootfs_size)
         exec_cmd(dd_cmd)
 
-        mkfs_cmd = "mkfs.%s -b %d -r %s %s" % \
-            (self.fstype, rootfs_size * 1024, image_rootfs, rootfs)
+        label_str = ""
+        if (self.label):
+            label_str = "-L %s" % self.label
+
+        mkfs_cmd = "mkfs.%s -b %d -r %s %s %s" % \
+            (self.fstype, rootfs_size * 1024, image_rootfs, label_str, rootfs)
         (rc, out) = exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
         if rc:
             msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details) when creating filesystem from rootfs directory: %s" % (self.fstype, rc, rootfs_dir))
@@ -334,7 +342,11 @@ class Wic_PartData(Mic_PartData):
         if blocks % 16 != 0:
             blocks += (16 - (blocks % 16))
 
-        dosfs_cmd = "mkdosfs -n boot -S 512 -C %s %d" % (rootfs, blocks)
+        label_str = "-n boot"
+        if (self.label):
+            label_str = "-n %s" % self.label
+
+        dosfs_cmd = "mkdosfs %s -S 512 -C %s %d" % (label_str, rootfs, blocks)
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, image_rootfs)
@@ -405,7 +417,12 @@ class Wic_PartData(Mic_PartData):
 
         extra_imagecmd = "-i 8192"
 
-        mkfs_cmd = "mkfs.%s -F %s %s" % (self.fstype, extra_imagecmd, fs)
+        label_str = ""
+        if (self.label):
+            label_str = "-L %s" % self.label
+
+        mkfs_cmd = "mkfs.%s -F %s %s %s" % \
+            (self.fstype, extra_imagecmd, label_str, fs)
         (rc, out) = exec_native_cmd(mkfs_cmd, native_sysroot)
         if rc:
             msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details)" % (self.fstype, rc))
@@ -425,7 +442,12 @@ class Wic_PartData(Mic_PartData):
             (fs, self.size)
         exec_cmd(dd_cmd)
 
-        mkfs_cmd = "mkfs.%s -b %d %s" % (self.fstype, self.size * 1024, fs)
+        label_str = ""
+        if (self.label):
+            label_str = "-L %s" % self.label
+
+        mkfs_cmd = "mkfs.%s -b %d %s %s" % \
+            (self.fstype, self.size * 1024, label_str, fs)
         (rc, out) = exec_native_cmd(mkfs_cmd, native_sysroot)
         if rc:
             msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details)" % (self.fstype, rc))
@@ -443,7 +465,11 @@ class Wic_PartData(Mic_PartData):
 
         blocks = self.size
 
-        dosfs_cmd = "mkdosfs -n boot -S 512 -C %s %d" % (fs, blocks)
+        label_str = "-n boot"
+        if (self.label):
+            label_str = "-n %s" % self.label
+
+        dosfs_cmd = "mkdosfs %s -S 512 -C %s %d" % (label_str, fs, blocks)
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
         chmod_cmd = "chmod 644 %s" % fs
-- 
2.1.0


