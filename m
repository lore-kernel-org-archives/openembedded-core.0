Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5504F71C9B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 19:14:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 Feb 2017 11:14:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,348,1484035200"; d="scan'208";a="1104796425"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2017 11:14:37 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 4DE3B6A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 11:13:36 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 20:51:28 +0200
Message-Id: <be0d5785a8a3437f15cdacacef541384c5541d34.1486579259.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1486579259.git.ed.bartosh@linux.intel.com>
References: <cover.1486579259.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 4/9] wic: direct: get rid of _get_parts getter
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
X-List-Received-Date: Wed, 08 Feb 2017 19:14:37 -0000

Replaced _get_parts getter with direct attribute
access to self.parts

Removed code that implicitly created partition
if there are no partitions mentioned in .wks file

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 36 +++++++-------------------------
 1 file changed, 8 insertions(+), 28 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index ae420a6..71ffc36 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -94,6 +94,7 @@ class DirectPlugin(ImagerPlugin):
         self._disk_format = "direct"
         self._disk_names = []
         self.ptable_format = self.ks.bootloader.ptable
+        self.parts = self.ks.partitions
 
     def do_create(self):
         """
@@ -140,7 +141,7 @@ class DirectPlugin(ImagerPlugin):
         with open(fstab_path) as fstab:
             fstab_lines = fstab.readlines()
 
-        if self._update_fstab(fstab_lines, self._get_parts()):
+        if self._update_fstab(fstab_lines, self.parts):
             shutil.copyfile(fstab_path, fstab_path + ".orig")
 
             with open(fstab_path, "w") as fstab:
@@ -179,22 +180,6 @@ class DirectPlugin(ImagerPlugin):
         """
         self.bootimg_dir = bootimg_dir
 
-    def _get_parts(self):
-        if not self.ks:
-            raise CreatorError("Failed to get partition info, "
-                               "please check your kickstart setting.")
-
-        # Set a default partition if no partition is given out
-        if not self.ks.partitions:
-            partstr = "part / --size 1900 --ondisk sda --fstype=ext3"
-            args = partstr.split()
-            part = self.ks.parse(args[1:])
-            if part not in self.ks.partitions:
-                self.ks.partitions.append(part)
-
-        # partitions list from kickstart file
-        return self.ks.partitions
-
     def _full_path(self, path, name, extention):
         """ Construct full file path to a file we generate. """
         return os.path.join(path, "%s-%s.%s" % (self.name, name, extention))
@@ -208,12 +193,10 @@ class DirectPlugin(ImagerPlugin):
         filesystems from the artifacts directly and combine them into
         a partitioned image.
         """
-        parts = self._get_parts()
-
         self._image = Image(self.native_sysroot)
 
         disk_ids = {}
-        for num, part in enumerate(parts, 1):
+        for num, part in enumerate(self.parts, 1):
             # as a convenience, set source to the boot partition source
             # instead of forcing it to be set via bootloader --source
             if not self.ks.bootloader.source and part.mountpoint == "/boot":
@@ -227,11 +210,11 @@ class DirectPlugin(ImagerPlugin):
                     if part.disk not in disk_ids:
                         disk_ids[part.disk] = int.from_bytes(os.urandom(4), 'little')
                     disk_id = disk_ids[part.disk]
-                    part.uuid = '%0x-%02d' % (disk_id, self._get_part_num(num, parts))
+                    part.uuid = '%0x-%02d' % (disk_id, self._get_part_num(num, self.parts))
 
         fstab_path = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
 
-        for part in parts:
+        for part in self.parts:
             # get rootfs size from bitbake variable if it's not set in .ks file
             if not part.size:
                 # and if rootfs name is specified for the partition
@@ -323,8 +306,6 @@ class DirectPlugin(ImagerPlugin):
         """
         msg = "The new image(s) can be found here:\n"
 
-        parts = self._get_parts()
-
         for disk_name in self._image.disks:
             extension = "direct" + {"gzip": ".gz",
                                     "bzip2": ".bz2",
@@ -334,7 +315,7 @@ class DirectPlugin(ImagerPlugin):
             msg += '  %s\n\n' % full_path
 
         msg += 'The following build artifacts were used to create the image(s):\n'
-        for part in parts:
+        for part in self.parts:
             if part.rootfs_dir is None:
                 continue
             if part.mountpoint == '/':
@@ -357,14 +338,13 @@ class DirectPlugin(ImagerPlugin):
 
         Assume partition order same as in wks
         """
-        parts = self._get_parts()
-        for num, part in enumerate(parts, 1):
+        for num, part in enumerate(self.parts, 1):
             if part.mountpoint == "/":
                 if part.uuid:
                     return "PARTUUID=%s" % part.uuid
                 else:
                     suffix = 'p' if part.disk.startswith('mmcblk') else ''
-                    pnum = self._get_part_num(num, parts)
+                    pnum = self._get_part_num(num, self.parts)
                     return "/dev/%s%s%-d" % (part.disk, suffix, pnum)
 
     def cleanup(self):
-- 
2.1.4


