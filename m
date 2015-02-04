Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id 0314A6E6C2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 22:45:11 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id E88F13A3; Wed,  4 Feb 2015 23:45:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 5AA35D;
	Wed,  4 Feb 2015 23:45:18 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Wed,  4 Feb 2015 23:45:02 +0100
Message-Id: <1423089902-12673-1-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: [PATCH v2] wic: use kB for the partitions size
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
X-List-Received-Date: Wed, 04 Feb 2015 22:45:11 -0000

Use kB instead of MB for the partition size to get a better granularity.

This is needed on some SoC (i.mx, omap) where it is necessary to create
partitions as small as 64kB.

Keep the backward compatibility by assuming MB when no unit is provided.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Tested-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Acked-by: Tom Zanussi <tom.zanussi@linux.intel.com>
Tested-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/help.py                          |  8 ++---
 .../wic/3rdparty/pykickstart/commands/partition.py |  4 +--
 scripts/lib/wic/3rdparty/pykickstart/options.py    | 21 ++++++++++++-
 scripts/lib/wic/kickstart/__init__.py              |  2 +-
 .../lib/wic/kickstart/custom_commands/partition.py | 36 +++++++++++-----------
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  2 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  2 +-
 scripts/lib/wic/utils/partitionedfs.py             |  4 +--
 8 files changed, 49 insertions(+), 30 deletions(-)

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index 6b74f5766211..0d8a6adfaa71 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -673,10 +673,10 @@ DESCRIPTION
 
        The following are supported 'part' options:
 
-         --size: The minimum partition size in MBytes. Specify an
-                 integer value such as 500. Do not append the number
-                 with "MB". You do not need this option if you use
-                 --source.
+         --size: The minimum partition size. Specify an integer value
+                 such as 500. Multipliers k, M ang G can be used. If
+                 not specified, the size is in MB.
+                 You do not need this option if you use --source.
 
          --source: This option is a wic-specific option that names the
                    source of the data that will populate the
diff --git a/scripts/lib/wic/3rdparty/pykickstart/commands/partition.py b/scripts/lib/wic/3rdparty/pykickstart/commands/partition.py
index 56b91aa9d9a4..b564b1a7abb9 100644
--- a/scripts/lib/wic/3rdparty/pykickstart/commands/partition.py
+++ b/scripts/lib/wic/3rdparty/pykickstart/commands/partition.py
@@ -78,7 +78,7 @@ class FC3_PartData(BaseData):
         if self.recommended:
             retval += " --recommended"
         if self.size and self.size != 0:
-            retval += " --size=%s" % self.size
+            retval += " --size=%sk" % self.size
         if hasattr(self, "start") and self.start != 0:
             retval += " --start=%s" % self.start
 
@@ -216,7 +216,7 @@ class FC3_Partition(KickstartCommand):
                       callback=part_cb, nargs=1, type="string")
         op.add_option("--recommended", dest="recommended", action="store_true",
                       default=False)
-        op.add_option("--size", dest="size", action="store", type="int",
+        op.add_option("--size", dest="size", action="store", type="size",
                       nargs=1)
         op.add_option("--start", dest="start", action="store", type="int",
                       nargs=1)
diff --git a/scripts/lib/wic/3rdparty/pykickstart/options.py b/scripts/lib/wic/3rdparty/pykickstart/options.py
index 341c5d7298b0..b2d8e3e51615 100644
--- a/scripts/lib/wic/3rdparty/pykickstart/options.py
+++ b/scripts/lib/wic/3rdparty/pykickstart/options.py
@@ -143,6 +143,24 @@ def _check_string(option, opt, value):
     else:
         return value
 
+def _check_size(option, opt, value):
+    # Former default was MB
+    if (value.isdigit()):
+        return int(value) * 1024L
+
+    mapping = {"opt": opt, "value": value}
+    if (not value[:-1].isdigit()):
+        raise OptionValueError(_("Option %(opt)s: invalid size value: %(value)r") % mapping)
+
+    size = int(value[:-1])
+    if (value.endswith("k") or value.endswith("K")):
+        return size
+    if (value.endswith("M")):
+        return size * 1024L
+    if (value.endswith("G")):
+        return size * 1024L * 1024L
+    raise OptionValueError(_("Option %(opt)s: invalid size value: %(value)r") % mapping)
+
 # Creates a new Option class that supports several new attributes:
 # - required:  any option with this attribute must be supplied or an exception
 #              is thrown
@@ -169,10 +187,11 @@ class KSOption (Option):
     ACTIONS = Option.ACTIONS + ("map", "map_extend",)
     STORE_ACTIONS = Option.STORE_ACTIONS + ("map", "map_extend",)
 
-    TYPES = Option.TYPES + ("ksboolean", "string")
+    TYPES = Option.TYPES + ("ksboolean", "string", "size")
     TYPE_CHECKER = copy(Option.TYPE_CHECKER)
     TYPE_CHECKER["ksboolean"] = _check_ksboolean
     TYPE_CHECKER["string"] = _check_string
+    TYPE_CHECKER["size"] = _check_size
 
     def _check_required(self):
         if self.required and not self.takes_value():
diff --git a/scripts/lib/wic/kickstart/__init__.py b/scripts/lib/wic/kickstart/__init__.py
index 600098293aef..1d094e9d5d8b 100644
--- a/scripts/lib/wic/kickstart/__init__.py
+++ b/scripts/lib/wic/kickstart/__init__.py
@@ -77,7 +77,7 @@ def get_image_size(ks, default = None):
         if p.mountpoint == "/" and p.size:
             __size = p.size
     if __size > 0:
-        return int(__size) * 1024L * 1024L
+        return int(__size) * 1024L
     else:
         return default
 
diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 54a494e033b9..7a307065f289 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -99,7 +99,7 @@ class Wic_PartData(Mic_PartData):
 
     def get_extra_block_count(self, current_blocks):
         """
-        The --size param is reflected in self.size (in MB), and we already
+        The --size param is reflected in self.size (in kB), and we already
         have current_blocks (1k) blocks, calculate and return the
         number of (1k) blocks we need to add to get to --size, 0 if
         we're already there or beyond.
@@ -110,7 +110,7 @@ class Wic_PartData(Mic_PartData):
         if not self.size:
             return 0
 
-        requested_blocks = self.size * 1024
+        requested_blocks = self.size
 
         msger.debug("Requested blocks %d, current_blocks %d" % \
                     (requested_blocks, current_blocks))
@@ -171,7 +171,7 @@ class Wic_PartData(Mic_PartData):
         Handle an already-created partition e.g. xxx.ext3
         """
         rootfs = oe_builddir
-        du_cmd = "du -Lbms %s" % rootfs
+        du_cmd = "du -Lbks %s" % rootfs
         out = exec_cmd(du_cmd)
         rootfs_size = out.split()[0]
 
@@ -247,8 +247,8 @@ class Wic_PartData(Mic_PartData):
             print "rootfs_dir: %s" % rootfs_dir
             msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details) when creating filesystem from rootfs directory: %s" % (self.fstype, rc, rootfs_dir))
 
-        # get the rootfs size in the right units for kickstart (Mb)
-        du_cmd = "du -Lbms %s" % rootfs
+        # get the rootfs size in the right units for kickstart (kB)
+        du_cmd = "du -Lbks %s" % rootfs
         out = exec_cmd(du_cmd)
         rootfs_size = out.split()[0]
 
@@ -292,8 +292,8 @@ class Wic_PartData(Mic_PartData):
         if rc:
             msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details) when creating filesystem from rootfs directory: %s" % (self.fstype, rc, rootfs_dir))
 
-        # get the rootfs size in the right units for kickstart (Mb)
-        du_cmd = "du -Lbms %s" % rootfs
+        # get the rootfs size in the right units for kickstart (kB)
+        du_cmd = "du -Lbks %s" % rootfs
         out = exec_cmd(du_cmd)
         rootfs_size = out.split()[0]
 
@@ -341,8 +341,8 @@ class Wic_PartData(Mic_PartData):
         chmod_cmd = "chmod 644 %s" % rootfs
         exec_cmd(chmod_cmd)
 
-        # get the rootfs size in the right units for kickstart (Mb)
-        du_cmd = "du -Lbms %s" % rootfs
+        # get the rootfs size in the right units for kickstart (kB)
+        du_cmd = "du -Lbks %s" % rootfs
         out = exec_cmd(du_cmd)
         rootfs_size = out.split()[0]
 
@@ -361,8 +361,8 @@ class Wic_PartData(Mic_PartData):
                        (image_rootfs, rootfs)
         exec_native_cmd(pseudo + squashfs_cmd, native_sysroot)
 
-        # get the rootfs size in the right units for kickstart (Mb)
-        du_cmd = "du -Lbms %s" % rootfs
+        # get the rootfs size in the right units for kickstart (kB)
+        du_cmd = "du -Lbks %s" % rootfs
         out = exec_cmd(du_cmd)
         rootfs_size = out.split()[0]
 
@@ -395,7 +395,7 @@ class Wic_PartData(Mic_PartData):
         """
         fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
-        dd_cmd = "dd if=/dev/zero of=%s bs=1M seek=%d count=0" % \
+        dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
             (fs, self.size)
         exec_cmd(dd_cmd)
 
@@ -417,11 +417,11 @@ class Wic_PartData(Mic_PartData):
         """
         fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
-        dd_cmd = "dd if=/dev/zero of=%s bs=1M seek=%d count=0" % \
+        dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
             (fs, self.size)
         exec_cmd(dd_cmd)
 
-        mkfs_cmd = "mkfs.%s -b %d %s" % (self.fstype, self.size * 1024, rootfs)
+        mkfs_cmd = "mkfs.%s -b %d %s" % (self.fstype, self.size, rootfs)
         (rc, out) = exec_native_cmd(mkfs_cmd, native_sysroot)
         if rc:
             msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details)" % (self.fstype, rc))
@@ -442,7 +442,7 @@ class Wic_PartData(Mic_PartData):
         """
         fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
-        blocks = self.size * 1024
+        blocks = self.size
 
         dosfs_cmd = "mkdosfs -n boot -S 512 -C %s %d" % (fs, blocks)
         exec_native_cmd(dosfs_cmd, native_sysroot)
@@ -474,8 +474,8 @@ class Wic_PartData(Mic_PartData):
 
         os.rmdir(tmpdir)
 
-        # get the rootfs size in the right units for kickstart (Mb)
-        du_cmd = "du -Lbms %s" % fs
+        # get the rootfs size in the right units for kickstart (kB)
+        du_cmd = "du -Lbks %s" % fs
         out = exec_cmd(du_cmd)
         fs_size = out.split()[0]
 
@@ -490,7 +490,7 @@ class Wic_PartData(Mic_PartData):
         """
         fs = "%s/fs.%s" % (cr_workdir, self.fstype)
 
-        dd_cmd = "dd if=/dev/zero of=%s bs=1M seek=%d count=0" % \
+        dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
             (fs, self.size)
         exec_cmd(dd_cmd)
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index e4067b6dbf6b..ee57881e90f8 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -228,7 +228,7 @@ class BootimgEFIPlugin(SourcePlugin):
         chmod_cmd = "chmod 644 %s" % bootimg
         exec_cmd(chmod_cmd)
 
-        du_cmd = "du -Lbms %s" % bootimg
+        du_cmd = "du -Lbks %s" % bootimg
         out = exec_cmd(du_cmd)
         bootimg_size = out.split()[0]
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 8a1aca1ad16a..c4786a6e0ea1 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -190,7 +190,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         chmod_cmd = "chmod 644 %s" % bootimg
         exec_cmd(chmod_cmd)
 
-        du_cmd = "du -Lbms %s" % bootimg
+        du_cmd = "du -Lbks %s" % bootimg
         out = exec_cmd(du_cmd)
         bootimg_size = out.split()[0]
 
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index fb95cc790e00..f109e2c227c5 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -92,8 +92,8 @@ class Image:
 
         ks_pnum = len(self.partitions)
 
-        # Converting MB to sectors for parted
-        size = size * 1024 * 1024 / self.sector_size
+        # Converting kB to sectors for parted
+        size = size * 1024 / self.sector_size
 
         # We still need partition for "/" or non-subvolume
         if mountpoint == "/" or not fsopts:
-- 
2.1.0


