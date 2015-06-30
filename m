Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 107797564B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 08:53:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 30 Jun 2015 01:53:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,376,1432623600"; d="scan'208";a="737531407"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jun 2015 01:53:08 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 0DF6B6A4005;
	Tue, 30 Jun 2015 01:52:27 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jun 2015 11:51:48 +0300
Message-Id: <1435654312-18177-17-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435654312-18177-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435654312-18177-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 16/20] wic: Refactor fstab update code
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
X-List-Received-Date: Tue, 30 Jun 2015 08:53:07 -0000

Made the code to backup and restore fstab only if it's modified.

Cleaned up the code. Made it more pythonic.

Improved code readability by moving code from several tiny
methods into one place.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 58a9e9d..561c396 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -90,74 +90,50 @@ class DirectImageCreator(BaseImageCreator):
                     return realnum + 1
                 return realnum
 
-    def __write_fstab(self, image_rootfs):
+    def _write_fstab(self, image_rootfs):
         """overriden to generate fstab (temporarily) in rootfs. This is called
         from _create, make sure it doesn't get called from
         BaseImage.create()
         """
-        if image_rootfs is None:
-            return None
+        if not image_rootfs:
+            return
+
+        fstab_path = image_rootfs + "/etc/fstab"
+        if not os.path.isfile(fstab_path):
+            return
 
-        fstab = image_rootfs + "/etc/fstab"
-        if not os.path.isfile(fstab):
-            return None
+        with open(fstab_path) as fstab:
+            fstab_lines = fstab.readlines()
 
-        parts = self._get_parts()
+        if self._update_fstab(fstab_lines, self._get_parts()):
+            shutil.copyfile(fstab_path, fstab_path + ".orig")
 
-        self._save_fstab(fstab)
-        fstab_lines = self._get_fstab(fstab, parts)
-        self._update_fstab(fstab_lines, parts)
-        self._write_fstab(fstab, fstab_lines)
+            with open(fstab_path, "w") as fstab:
+                fstab.writelines(fstab_lines)
 
-        return fstab
+            return fstab_path
 
     def _update_fstab(self, fstab_lines, parts):
         """Assume partition order same as in wks"""
-        for num, p in enumerate(parts, 1):
+        updated = False
+        for num, part in enumerate(parts, 1):
             pnum = self.__get_part_num(num, parts)
-            if not p.mountpoint or p.mountpoint == "/" or p.mountpoint == "/boot" or pnum == 0:
+            if not pnum or not part.mountpoint \
+               or part.mountpoint in ("/", "/boot"):
                 continue
 
-            part = ''
             # mmc device partitions are named mmcblk0p1, mmcblk0p2..
-            if p.disk.startswith('mmcblk'):
-                part = 'p'
-
-            device_name = "/dev/" + p.disk + part + str(pnum)
-
-            opts = "defaults"
-            if p.fsopts:
-                opts = p.fsopts
-
-            fstab_entry = device_name + "\t" + \
-                          p.mountpoint + "\t" + \
-                          p.fstype + "\t" + \
-                          opts + "\t0\t0\n"
-            fstab_lines.append(fstab_entry)
-
-    def _write_fstab(self, fstab, fstab_lines):
-        fstab = open(fstab, "w")
-        for line in fstab_lines:
-            fstab.write(line)
-        fstab.close()
-
-    def _save_fstab(self, fstab):
-        """Save the current fstab in rootfs"""
-        shutil.copyfile(fstab, fstab + ".orig")
-
-    def _restore_fstab(self, fstab):
-        """Restore the saved fstab in rootfs"""
-        if fstab is None:
-            return
-        shutil.move(fstab + ".orig", fstab)
+            prefix = 'p' if  part.disk.startswith('mmcblk') else ''
+            device_name = "/dev/%s%s%d" % (part.disk, prefix, pnum)
+
+            opts = part.fsopts if part.fsopts else "defaults"
+            line = "\t".join([device_name, part.mountpoint, part.fstype,
+                              opts, "0", "0"]) + "\n"
 
-    def _get_fstab(self, fstab, parts):
-        """Return the desired contents of /etc/fstab."""
-        f = open(fstab, "r")
-        fstab_contents = f.readlines()
-        f.close()
+            fstab_lines.append(line)
+            updated = True
 
-        return fstab_contents
+        return updated
 
     def set_bootimg_dir(self, bootimg_dir):
         """
@@ -250,7 +226,7 @@ class DirectImageCreator(BaseImageCreator):
             if not self.ks.handler.bootloader.source and p.mountpoint == "/boot":
                 self.ks.handler.bootloader.source = p.source
 
-        fstab = self.__write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
+        fstab_path = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
 
         for p in parts:
             # need to create the filesystems in order to get their
@@ -277,7 +253,8 @@ class DirectImageCreator(BaseImageCreator):
                                        part_type=p.part_type,
                                        uuid=p.uuid)
 
-        self._restore_fstab(fstab)
+        if fstab_path:
+            shutil.move(fstab_path + ".orig", fstab_path)
 
         self.__image.layout_partitions(self.ptable_format)
 
-- 
2.1.4


