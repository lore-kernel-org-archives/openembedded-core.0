Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.32038.1610361180523131709
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 02:33:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Vif3NtmI;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id c5so15805123wrp.6
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Jan 2021 02:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hjGLae/LA65MlG7VN5FHLGeGlJTvo0ihBbGmRGirfnU=;
        b=Vif3NtmIKvJcPOrxuW+2zERlTIx9vBWaFSSyA90cgMwCrFfTMs1RTW35C0Z8V0uM56
         3H53YghGWR8Vdvnmv79TiknIy1RTFLWGG7xk+6D3XfveOfEh60AAwPIiobXp/IEtZpCb
         2IacvVsn7mLLth3ytasTKN5NwF7MxTdZDisLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hjGLae/LA65MlG7VN5FHLGeGlJTvo0ihBbGmRGirfnU=;
        b=sMw5GxS7T1BvxTurJl3A6nJQ9K1MFAahAtIa/sNCPVOralSIxyRlctXbKVAVeZzmKN
         i4M6f9sebQTi8+6/XgmHiDWH0jyt5xripLKYx1PgMcU3oXJnhJ9PxreMdOnkDYM90vnq
         CjCPkT9rF3NUbv1cp5MBDK6zTJXfv1yrcD4JupPXbEARl1/jzjwsh34VXY4l4XYW+Zbl
         /yr/qlCmH8tuJ12PTnkJK3R+XXOvbJJ33Rh84ekSq7RhXKxS5OJuXPni28Jh3CJA/V8Y
         Ijt2UxerVExsKmZIBLJ35XIz+wxD14l8EbuA2FsxzuV2qXpeCzIzZ5ChX86+pjQWU0se
         WbyQ==
X-Gm-Message-State: AOAM532Yil3C7c8paZub/1Wp/SONq2vInygn/Www6e7bVRMey21nnLyx
	TfnGDO9VjywMxheG4JYdCjprninX41l+RQ==
X-Google-Smtp-Source: ABdhPJwx3nPltVJ3pJJDjcEtddhL+m9hUtwfAR3PPMSK1UMKNGQF8yGM0Buwmaz7naU5uEyQ3ZMrow==
X-Received: by 2002:adf:c6c4:: with SMTP id c4mr15928753wrh.348.1610361178797;
        Mon, 11 Jan 2021 02:32:58 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76132-clif11-2-0-cust80.12-4.cable.virginm.net. [80.7.160.81])
        by smtp.gmail.com with ESMTPSA id a13sm23536969wrt.96.2021.01.11.02.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 02:32:58 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 5/6] wic: Copy rootfs dir if fstab needs updating
Date: Mon, 11 Jan 2021 10:32:46 +0000
Message-Id: <20210111103247.11685-5-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111103247.11685-1-pbarker@konsulko.com>
References: <20210111103247.11685-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index b329568c7a..d0f228567e 100644
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
@@ -90,11 +90,8 @@ class DirectPlugin(ImagerPlugin):
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
 
@@ -104,18 +101,9 @@ class DirectPlugin(ImagerPlugin):
 
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
@@ -144,7 +132,10 @@ class DirectPlugin(ImagerPlugin):
             fstab_lines.append(line)
             updated = True
 
-        return updated
+        if updated:
+            self.updated_fstab_path = os.path.join(self.workdir, "fstab")
+            with open(self.updated_fstab_path, "w") as f:
+                f.writelines(fstab_lines)
 
     def _full_path(self, path, name, extention):
         """ Construct full file path to a file we generate. """
@@ -160,7 +151,7 @@ class DirectPlugin(ImagerPlugin):
         a partitioned image.
         """
         if not self.no_fstab_update:
-            self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
+            self.update_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
 
         for part in self.parts:
             # get rootfs size from bitbake variable if it's not set in .ks file
@@ -273,12 +264,6 @@ class DirectPlugin(ImagerPlugin):
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
 
@@ -358,7 +343,8 @@ class PartitionedImage():
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
2.26.2

