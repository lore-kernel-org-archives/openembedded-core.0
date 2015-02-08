Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id 57277606E8
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Feb 2015 23:16:26 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 92242386; Mon,  9 Feb 2015 00:16:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 565D132B;
	Mon,  9 Feb 2015 00:16:33 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Mon,  9 Feb 2015 00:16:23 +0100
Message-Id: <1423437384-21971-3-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423437384-21971-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1423437384-21971-1-git-send-email-alexandre.belloni@free-electrons.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] wic: allow to configure overhead factor per partition
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

Introduce a new option --overhead-factor to replace
IMAGE_OVERHEAD_FACTOR.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 scripts/lib/image/help.py                              |  6 ++++++
 scripts/lib/wic/kickstart/custom_commands/partition.py | 14 ++++++++++++--
 scripts/lib/wic/utils/oe/misc.py                       |  1 -
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index 8e026986aa97..e1eb2659792f 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -749,6 +749,12 @@ DESCRIPTION
                         beyond the size specified by --size.
                         By default, 10MB.
 
+         --overhead-factor: This option is specific to wic. The
+                            size of the partition is multiplied by
+                            this factor. It has to be greater than or
+                            equal to 1.
+                            The default value is 1.3.
+
     * bootloader
 
       This command allows the user to specify various bootloader
diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 8bde1b80e16a..44df20c58a25 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -51,6 +51,7 @@ class Wic_PartData(Mic_PartData):
         self.rootfs = kwargs.get("rootfs-dir", None)
         self.no_table = kwargs.get("no-table", False)
         self.extra_space = kwargs.get("extra-space", "10M")
+        self.overhead_factor = kwargs.get("overhead-factor", 1.3)
         self.source_file = ""
         self.size = 0
 
@@ -66,6 +67,7 @@ class Wic_PartData(Mic_PartData):
         if self.no_table:
             retval += " --no-table"
         retval += " --extra-space=%d" % self.extra_space
+        retval += " --overhead-factor=%f" % self.overhead_factor
 
         return retval
 
@@ -233,7 +235,7 @@ class Wic_PartData(Mic_PartData):
             extra_blocks = self.extra_space
 
         rootfs_size = actual_rootfs_size + extra_blocks
-        rootfs_size *= IMAGE_OVERHEAD_FACTOR
+        rootfs_size *= self.overhead_factor
 
         msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
                     (extra_blocks, self.mountpoint, rootfs_size))
@@ -280,7 +282,7 @@ class Wic_PartData(Mic_PartData):
             extra_blocks = self.extra_space
 
         rootfs_size = actual_rootfs_size + extra_blocks
-        rootfs_size *= IMAGE_OVERHEAD_FACTOR
+        rootfs_size *= self.overhead_factor
 
         msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
                     (extra_blocks, self.mountpoint, rootfs_size))
@@ -512,6 +514,11 @@ class Wic_Partition(Mic_Partition):
     removedAttrs = Mic_Partition.removedAttrs
 
     def _getParser(self):
+        def overhead_cb (option, opt_str, value, parser):
+            if (value < 1):
+                raise OptionValueError("Option %s: invalid value: %r" % (option, value))
+            setattr(parser.values, option.dest, value)
+
         op = Mic_Partition._getParser(self)
         # use specified source file to fill the partition
         # and calculate partition size
@@ -529,4 +536,7 @@ class Wic_Partition(Mic_Partition):
         # extra space beyond the partition size
         op.add_option("--extra-space", dest="extra_space", action="store",
                       type="size", nargs=1, default="10M")
+        op.add_option("--overhead-factor", dest="overhead_factor",
+                      action="callback", callback=overhead_cb, type="float",
+                      nargs=1, default=1.3)
         return op
diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index fa14fee1abc9..ea9b6e8ec405 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -122,7 +122,6 @@ def add_wks_var(key, val):
     wks_vars[key] = val
 
 BOOTDD_EXTRA_SPACE = 16384
-IMAGE_OVERHEAD_FACTOR = 1.3
 
 __bitbake_env_lines = ""
 
-- 
2.1.0


