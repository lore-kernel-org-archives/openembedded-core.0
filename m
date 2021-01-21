Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.1397.1611246150445140456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 08:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Gk2USckXq012XePaF4jFz/rpM3ni06b/qodvqEwPdXDJV7csBMn1dm2tjqRmvyydLr3+k9/S+F
 JG6+56hDC21g==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="166392495"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="166392495"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:37 -0800
IronPort-SDR: JyCjsyegAm5jTWvZhoXxkJCN8hBmsJ3yXNNF4dqI61hFVfIluzcoj8zayCaCxqFSuAJhaq3SbN
 ZZyCfhvl8yKA==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="427413853"
Received: from yonshuta-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.18])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:36 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 16/20] wic: Copy rootfs dir if fstab needs updating
Date: Fri, 22 Jan 2021 00:22:01 +0800
Message-Id: <39f98ef8c1f6b0259deb43ea902f5ac8e5b069cd.1611245974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611245974.git.anuj.mittal@intel.com>
References: <cover.1611245974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

By default, wic updates the /etc/fstab in the rootfs to include details
of additional partitions described in the selected wks file. If this
modification is performed in place, other tasks which create an image
file from the rootfs directory (e.g. do_image_tar and do_image_ext4)
will pick up the modified fstab file which would not be appropriate for
those images as they do not include the additional partitions described
in the wks file. wic does undo modifications to the fstab file once it
has finished creating the filesystem image, however this leaves open a
race condition if one of the other tasks reads the contents of the fstab
file from the rootfs directory between the point where wic modifies the
fstab file and the point where wic restores the files original content.

This could be solved by adding a lockfile for tasks which use the rootfs
directory to ensure that no other such task is reading the rootfs
directory while do_image_wic is running. This would serialize several
do_image_* tasks and result in slower builds, especially for large
images. Another drawback of this solution is that it is hard to
selectively optimise - adding lockfiles to do_image_* tasks would result
in these tasks always being serialized even if no fstab modification
will take place.

An alternative solution is to copy the rootfs directory when fstab needs
to be modified. The code to do this in wic already exists as it is
needed when including or excluding content in the rootfs. This still
results in an impact on build times but the copy uses hardlinks if
possible (so little data is actually copied) and we can make selective
optimisations to improve things. The rootfs copy will only take place if
fstab modification is required (or if it was already needed to include
or exclude rootfs content). We can also follow up with further
optimisations after this commit. So this second solution is chosen.

Fixes [Yocto #13994]

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ce682a73b7447652f898ce1d1d0416a456df5416)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/wic/partition.py             |  5 +++-
 scripts/lib/wic/plugins/imager/direct.py | 36 ++++++++----------------
 scripts/lib/wic/plugins/source/rootfs.py | 17 +++++++++--
 3 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 286c7867cb..f59eceb23d 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -54,6 +54,7 @@ class Partition():
         self.uuid = args.uuid
         self.fsuuid = args.fsuuid
         self.type = args.type
+        self.updated_fstab_path = None
 
         self.lineno = lineno
         self.source_file = ""
@@ -118,11 +119,13 @@ class Partition():
         return self.fixed_size if self.fixed_size else self.size
 
     def prepare(self, creator, cr_workdir, oe_builddir, rootfs_dir,
-                bootimg_dir, kernel_dir, native_sysroot):
+                bootimg_dir, kernel_dir, native_sysroot, updated_fstab_path):
         """
         Prepare content for individual partitions, depending on
         partition command parameters.
         """
+        self.updated_fstab_path = updated_fstab_path
+
         if not self.source:
             if not self.size and not self.fixed_size:
                 raise WicError("The %s partition has a size of zero. Please "
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index f107e60089..7e1c1c03ab 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -58,7 +58,7 @@ class DirectPlugin(ImagerPlugin):
         self.compressor = options.compressor
         self.bmap = options.bmap
         self.no_fstab_update = options.no_fstab_update
-        self.original_fstab = None
+        self.updated_fstab_path = None
 
         self.name = "%s-%s" % (os.path.splitext(os.path.basename(wks_file))[0],
                                strftime("%Y%m%d%H%M"))
@@ -100,11 +100,8 @@ class DirectPlugin(ImagerPlugin):
         finally:
             self.cleanup()
 
-    def _write_fstab(self, image_rootfs):
-        """overriden to generate fstab (temporarily) in rootfs. This is called
-        from _create, make sure it doesn't get called from
-        BaseImage.create()
-        """
+    def update_fstab(self, image_rootfs):
+        """Assume partition order same as in wks"""
         if not image_rootfs:
             return
 
@@ -114,18 +111,9 @@ class DirectPlugin(ImagerPlugin):
 
         with open(fstab_path) as fstab:
             fstab_lines = fstab.readlines()
-            self.original_fstab = fstab_lines.copy()
-
-        if self._update_fstab(fstab_lines, self.parts):
-            with open(fstab_path, "w") as fstab:
-                fstab.writelines(fstab_lines)
-        else:
-            self.original_fstab = None
 
-    def _update_fstab(self, fstab_lines, parts):
-        """Assume partition order same as in wks"""
         updated = False
-        for part in parts:
+        for part in self.parts:
             if not part.realnum or not part.mountpoint \
                or part.mountpoint == "/":
                 continue
@@ -154,7 +142,10 @@ class DirectPlugin(ImagerPlugin):
             fstab_lines.append(line)
             updated = True
 
-        return updated
+        if updated:
+            self.updated_fstab_path = os.path.join(self.workdir, "fstab")
+            with open(self.updated_fstab_path, "w") as f:
+                f.writelines(fstab_lines)
 
     def _full_path(self, path, name, extention):
         """ Construct full file path to a file we generate. """
@@ -170,7 +161,7 @@ class DirectPlugin(ImagerPlugin):
         a partitioned image.
         """
         if not self.no_fstab_update:
-            self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
+            self.update_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
 
         for part in self.parts:
             # get rootfs size from bitbake variable if it's not set in .ks file
@@ -283,12 +274,6 @@ class DirectPlugin(ImagerPlugin):
             if os.path.isfile(path):
                 shutil.move(path, os.path.join(self.outdir, fname))
 
-        #Restore original fstab
-        if self.original_fstab:
-            fstab_path = self.rootfs_dir.get("ROOTFS_DIR") + "/etc/fstab"
-            with open(fstab_path, "w") as fstab:
-                fstab.writelines(self.original_fstab)
-
         # remove work directory
         shutil.rmtree(self.workdir, ignore_errors=True)
 
@@ -368,7 +353,8 @@ class PartitionedImage():
             # sizes before we can add them and do the layout.
             part.prepare(imager, imager.workdir, imager.oe_builddir,
                          imager.rootfs_dir, imager.bootimg_dir,
-                         imager.kernel_dir, imager.native_sysroot)
+                         imager.kernel_dir, imager.native_sysroot,
+                         imager.updated_fstab_path)
 
             # Converting kB to sectors for parted
             part.size_sec = part.disk_size * 1024 // self.sector_size
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index afb1eb9202..6fd415af5b 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -103,9 +103,9 @@ class RootfsPlugin(SourcePlugin):
         new_rootfs = None
         new_pseudo = None
         # Handle excluded paths.
-        if part.exclude_path or part.include_path or part.change_directory:
-            # We need a new rootfs directory we can delete files from. Copy to
-            # workdir.
+        if part.exclude_path or part.include_path or part.change_directory or part.updated_fstab_path:
+            # We need a new rootfs directory we can safely modify without
+            # interfering with other tasks. Copy to workdir.
             new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
 
             if os.path.lexists(new_rootfs):
@@ -214,6 +214,17 @@ class RootfsPlugin(SourcePlugin):
                     rm_cmd = "rm -rf %s" % (full_path)
                     exec_native_cmd(rm_cmd, native_sysroot, pseudo)
 
+            has_fstab = os.path.exists(os.path.join(new_rootfs, "etc/fstab"))
+            if part.updated_fstab_path and has_fstab:
+                fstab_path = os.path.join(new_rootfs, "etc/fstab")
+                # Assume that fstab should always be owned by root with fixed permissions
+                install_cmd = "install -m 0644 %s %s" % (part.updated_fstab_path, fstab_path)
+                if new_pseudo:
+                    pseudo = cls.__get_pseudo(native_sysroot, new_rootfs, new_pseudo)
+                else:
+                    pseudo = None
+                exec_native_cmd(install_cmd, native_sysroot, pseudo)
+
         part.prepare_rootfs(cr_workdir, oe_builddir,
                             new_rootfs or part.rootfs_dir, native_sysroot,
                             pseudo_dir = new_pseudo or pseudo_dir)
-- 
2.29.2

