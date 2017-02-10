Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8BE6D71ABF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 15:28:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Feb 2017 07:28:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,142,1484035200"; d="scan'208";a="1093210349"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 10 Feb 2017 07:28:55 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id D003F6A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 07:27:53 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 17:05:44 +0200
Message-Id: <9f2fc7b9f88a233c1fe200b5218688e413c4d972.1486738307.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1486738307.git.ed.bartosh@linux.intel.com>
References: <cover.1486738307.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 08/13] wic: direct: add 'realnum' attribute to partition
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
X-List-Received-Date: Fri, 10 Feb 2017 15:28:54 -0000

Replaced call of _get_part_num method with an attribute.
This eliminates the need to call the method and loop over
partitions every time we need to know realnum for partition.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 46 ++++++++++++++------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index d0a1cad..ffe6c84 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -74,6 +74,19 @@ class DirectPlugin(ImagerPlugin):
         self.ptable_format = self.ks.bootloader.ptable
         self.parts = self.ks.partitions
 
+        # calculate the real partition number, accounting for partitions not
+        # in the partition table and logical partitions
+        realnum = 0
+        for part in self.parts:
+            if part.no_table:
+                part.realnum = 0
+            else:
+                realnum += 1
+                if self.ptable_format == 'msdos' and realnum > 3:
+                    part.realnum = realnum + 1
+                    continue
+                part.realnum = realnum
+
     def do_create(self):
         """
         Plugin entry point.
@@ -86,22 +99,6 @@ class DirectPlugin(ImagerPlugin):
         finally:
             self.cleanup()
 
-    def _get_part_num(self, num, parts):
-        """calculate the real partition number, accounting for partitions not
-        in the partition table and logical partitions
-        """
-        realnum = 0
-        for pnum, part in enumerate(parts, 1):
-            if not part.no_table:
-                realnum += 1
-            if pnum == num:
-                if  part.no_table:
-                    return 0
-                if self.ptable_format == 'msdos' and realnum > 3:
-                    # account for logical partition numbering, ex. sda5..
-                    return realnum + 1
-                return realnum
-
     def _write_fstab(self, image_rootfs):
         """overriden to generate fstab (temporarily) in rootfs. This is called
         from _create, make sure it doesn't get called from
@@ -128,15 +125,14 @@ class DirectPlugin(ImagerPlugin):
     def _update_fstab(self, fstab_lines, parts):
         """Assume partition order same as in wks"""
         updated = False
-        for num, part in enumerate(parts, 1):
-            pnum = self._get_part_num(num, parts)
-            if not pnum or not part.mountpoint \
+        for part in parts:
+            if not part.realnum or not part.mountpoint \
                or part.mountpoint in ("/", "/boot"):
                 continue
 
             # mmc device partitions are named mmcblk0p1, mmcblk0p2..
             prefix = 'p' if  part.disk.startswith('mmcblk') else ''
-            device_name = "/dev/%s%s%d" % (part.disk, prefix, pnum)
+            device_name = "/dev/%s%s%d" % (part.disk, prefix, part.realnum)
 
             opts = part.fsopts if part.fsopts else "defaults"
             line = "\t".join([device_name, part.mountpoint, part.fstype,
@@ -164,7 +160,7 @@ class DirectPlugin(ImagerPlugin):
         self._image = PartitionedImage(image_path, self.ptable_format,
                                        self.native_sysroot)
 
-        for num, part in enumerate(self.parts, 1):
+        for part in self.parts:
             # as a convenience, set source to the boot partition source
             # instead of forcing it to be set via bootloader --source
             if not self.ks.bootloader.source and part.mountpoint == "/boot":
@@ -175,8 +171,7 @@ class DirectPlugin(ImagerPlugin):
                 if self.ptable_format == 'gpt':
                     part.uuid = str(uuid.uuid4())
                 else: # msdos partition table
-                    part.uuid = '%0x-%02d' % (self._image.identifier,
-                                              self._get_part_num(num, self.parts))
+                    part.uuid = '%0x-%02d' % (self._image.identifier, part.realnum)
 
         fstab_path = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
 
@@ -277,14 +272,13 @@ class DirectPlugin(ImagerPlugin):
 
         Assume partition order same as in wks
         """
-        for num, part in enumerate(self.parts, 1):
+        for part in self.parts:
             if part.mountpoint == "/":
                 if part.uuid:
                     return "PARTUUID=%s" % part.uuid
                 else:
                     suffix = 'p' if part.disk.startswith('mmcblk') else ''
-                    pnum = self._get_part_num(num, self.parts)
-                    return "/dev/%s%s%-d" % (part.disk, suffix, pnum)
+                    return "/dev/%s%s%-d" % (part.disk, suffix, part.realnum)
 
     def cleanup(self):
         if self._image:
-- 
2.1.4


