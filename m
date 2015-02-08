Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id 580A5606E9
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Feb 2015 23:16:26 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 0F8F7382; Mon,  9 Feb 2015 00:16:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id C5AFA32B;
	Mon,  9 Feb 2015 00:16:32 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Mon,  9 Feb 2015 00:16:22 +0100
Message-Id: <1423437384-21971-2-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423437384-21971-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1423437384-21971-1-git-send-email-alexandre.belloni@free-electrons.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] wic: allow to configure extra space per partition
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
X-List-Received-Date: Sun, 08 Feb 2015 23:16:36 -0000

Introduce a new option --extra-space instead of using IMAGE_EXTRA_SPACE.
This is useful for boot partitions where the extra space is often
useless or for huge partition where 10MiB may not be enough.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 scripts/lib/image/help.py                            |  6 ++++++
 .../lib/wic/kickstart/custom_commands/partition.py   | 20 +++++++++++---------
 scripts/lib/wic/utils/oe/misc.py                     |  1 -
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index aab0b609afd5..8e026986aa97 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -743,6 +743,12 @@ DESCRIPTION
                      partition table. It may be useful for
                      bootloaders.
 
+         --extra-space: This option is specific to wic. It adds extra
+                        space after the space filled by the content
+                        of the partition. The final size can go
+                        beyond the size specified by --size.
+                        By default, 10MB.
+
     * bootloader
 
       This command allows the user to specify various bootloader
diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 9be6b0457b48..8bde1b80e16a 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -50,6 +50,7 @@ class Wic_PartData(Mic_PartData):
         self.sourceparams = kwargs.get("sourceparams", None)
         self.rootfs = kwargs.get("rootfs-dir", None)
         self.no_table = kwargs.get("no-table", False)
+        self.extra_space = kwargs.get("extra-space", "10M")
         self.source_file = ""
         self.size = 0
 
@@ -64,6 +65,7 @@ class Wic_PartData(Mic_PartData):
                 retval += " --rootfs-dir=%s" % self.rootfs
         if self.no_table:
             retval += " --no-table"
+        retval += " --extra-space=%d" % self.extra_space
 
         return retval
 
@@ -227,9 +229,8 @@ class Wic_PartData(Mic_PartData):
         actual_rootfs_size = int(out.split()[0])
 
         extra_blocks = self.get_extra_block_count(actual_rootfs_size)
-
-        if extra_blocks < IMAGE_EXTRA_SPACE:
-            extra_blocks = IMAGE_EXTRA_SPACE
+        if extra_blocks < self.extra_space:
+            extra_blocks = self.extra_space
 
         rootfs_size = actual_rootfs_size + extra_blocks
         rootfs_size *= IMAGE_OVERHEAD_FACTOR
@@ -275,9 +276,8 @@ class Wic_PartData(Mic_PartData):
         actual_rootfs_size = int(out.split()[0])
 
         extra_blocks = self.get_extra_block_count(actual_rootfs_size)
-
-        if extra_blocks < IMAGE_EXTRA_SPACE:
-            extra_blocks = IMAGE_EXTRA_SPACE
+        if extra_blocks < self.extra_space:
+            extra_blocks = self.extra_space
 
         rootfs_size = actual_rootfs_size + extra_blocks
         rootfs_size *= IMAGE_OVERHEAD_FACTOR
@@ -316,9 +316,8 @@ class Wic_PartData(Mic_PartData):
         blocks = int(out.split()[0])
 
         extra_blocks = self.get_extra_block_count(blocks)
-
-        if extra_blocks < IMAGE_EXTRA_SPACE:
-            extra_blocks = IMAGE_EXTRA_SPACE
+        if extra_blocks < self.extra_space:
+            extra_blocks = self.extra_space
 
         blocks += extra_blocks
 
@@ -527,4 +526,7 @@ class Wic_Partition(Mic_Partition):
         # wether to add the partition in the partition table
         op.add_option("--no-table", dest="no_table", action="store_true",
                       default=False)
+        # extra space beyond the partition size
+        op.add_option("--extra-space", dest="extra_space", action="store",
+                      type="size", nargs=1, default="10M")
         return op
diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index b0b5baab7322..fa14fee1abc9 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -122,7 +122,6 @@ def add_wks_var(key, val):
     wks_vars[key] = val
 
 BOOTDD_EXTRA_SPACE = 16384
-IMAGE_EXTRA_SPACE = 10240
 IMAGE_OVERHEAD_FACTOR = 1.3
 
 __bitbake_env_lines = ""
-- 
2.1.0


