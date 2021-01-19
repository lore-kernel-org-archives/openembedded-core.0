Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.13640.1611073583285824148
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 08:26:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tPoq81Ht;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id c5so20323470wrp.6
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 08:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LUvXWXMYEJl45y3OpPIAbB8LBhHfMdbwqW41uVmDSbc=;
        b=tPoq81Ht2hKiMudkQK/ldbQ3YoRVfX3gpgxabFGGCHPTafl5eAIteq73DqcM8X/IDc
         zFBUovIdEiHRfiGRG2wdpZvqJ+GwI5tZ2jqHUMoL7ERxZ0mBzztBJ+cqgkEN/GZJVTA0
         fyzOg3cyX3N6Imvdw8SjyZwXFV/YPIba9ISf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LUvXWXMYEJl45y3OpPIAbB8LBhHfMdbwqW41uVmDSbc=;
        b=qwBKatmzEn49nGnZyYtSci+N33Lcx/tdbu1PHbH22XUaGt9qQVDQyQVwXguWLVtVMK
         mOgBWpSsmOE3+ovnkC5+lq2S02cP2Sk83SoiyB/QsY4xNnAiOii5Ged7uBXuKSuzfnfV
         lKt6fUHyts/+298Xo3eOUCbbOqIRik9ooGbU0dZc5gwGfwG9USocye0zZu9eqbas0Klo
         uWpRrcR490ruMaznsmLk63F4a6VtOSaG6aNJqjMnPBlGI7sK8Cz38FaoRJjJK/lvYIkV
         FfVkMmUlRpmHSJByM19J3RSlZ+DzPhsueXt5026hlHH/Sm+OsMrg4kG9SCyAo4oTCqBK
         jEKQ==
X-Gm-Message-State: AOAM532BK+0lJO0xbdqqgGoDI5Pgu3ymm0nU6KFLZjSdCa/tTZ/4+7Ys
	2Fynm9P1Da9Ju+vPmiTyj8uA4+9mld17aQ==
X-Google-Smtp-Source: ABdhPJzyUcHWUEKPPrbLUd7eMO9HSkhSpZQUaniTpO576PlKotg50n7tOeWmwWJPodke5Ie5e/kIDw==
X-Received: by 2002:adf:90e3:: with SMTP id i90mr5396417wri.248.1611073581617;
        Tue, 19 Jan 2021 08:26:21 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76132-clif11-2-0-cust80.12-4.cable.virginm.net. [80.7.160.81])
        by smtp.gmail.com with ESMTPSA id d85sm9223754wmd.2.2021.01.19.08.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 08:26:21 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v2 5/5] wic: Optimise fstab modification for ext2/3/4 and msdos partitions
Date: Tue, 19 Jan 2021 16:26:10 +0000
Message-Id: <20210119162610.13104-5-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210119162610.13104-1-pbarker@konsulko.com>
References: <20210119162610.13104-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fix for [Yocto #13994] required the rootfs directory to be copied
(using hardlinks if possible) when modifying the fstab file under wic.

We can optimise this copy away for filesystems where we have the tools
to modify the contents of the partition image after it is created. For
ext2/3/4 filesystems we have the debugfs tool and for msdos/vfat
filesystems we have the mcopy tool. So for any of these filesystems we
skip the modification of the fstab file in the rootfs directory (and
skip the associated copy unless it is otherwise necessary) and update
the contents of fstab directly in the partition image.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 scripts/lib/wic/partition.py             | 27 +++++++++++++++++++-----
 scripts/lib/wic/plugins/source/rootfs.py |  9 +++++---
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index f59eceb23d..e574f40c47 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -55,6 +55,8 @@ class Partition():
         self.fsuuid = args.fsuuid
         self.type = args.type
         self.updated_fstab_path = None
+        self.has_fstab = False
+        self.update_fstab_in_rootfs = False
 
         self.lineno = lineno
         self.source_file = ""
@@ -125,6 +127,8 @@ class Partition():
         partition command parameters.
         """
         self.updated_fstab_path = updated_fstab_path
+        if self.updated_fstab_path and not (self.fstype.startswith("ext") or self.fstype == "msdos"):
+            self.update_fstab_in_rootfs = True
 
         if not self.source:
             if not self.size and not self.fixed_size:
@@ -250,7 +254,7 @@ class Partition():
 
         prefix = "ext" if self.fstype.startswith("ext") else self.fstype
         method = getattr(self, "prepare_rootfs_" + prefix)
-        method(rootfs, oe_builddir, rootfs_dir, native_sysroot, pseudo)
+        method(rootfs, cr_workdir, oe_builddir, rootfs_dir, native_sysroot, pseudo)
         self.source_file = rootfs
 
         # get the rootfs size in the right units for kickstart (kB)
@@ -258,7 +262,7 @@ class Partition():
         out = exec_cmd(du_cmd)
         self.size = int(out.split()[0])
 
-    def prepare_rootfs_ext(self, rootfs, oe_builddir, rootfs_dir,
+    def prepare_rootfs_ext(self, rootfs, cr_workdir, oe_builddir, rootfs_dir,
                            native_sysroot, pseudo):
         """
         Prepare content for an ext2/3/4 rootfs partition.
@@ -282,10 +286,19 @@ class Partition():
             (self.fstype, extraopts, rootfs, label_str, self.fsuuid, rootfs_dir)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
+        if self.updated_fstab_path and self.has_fstab:
+            debugfs_script_path = os.path.join(cr_workdir, "debugfs_script")
+            with open(debugfs_script_path, "w") as f:
+                f.write("cd etc\n")
+                f.write("rm fstab\n")
+                f.write("write %s fstab\n" % (self.updated_fstab_path))
+            debugfs_cmd = "debugfs -w -f %s %s" % (debugfs_script_path, rootfs)
+            exec_native_cmd(debugfs_cmd, native_sysroot)
+
         mkfs_cmd = "fsck.%s -pvfD %s" % (self.fstype, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
-    def prepare_rootfs_btrfs(self, rootfs, oe_builddir, rootfs_dir,
+    def prepare_rootfs_btrfs(self, rootfs, cr_workdir, oe_builddir, rootfs_dir,
                              native_sysroot, pseudo):
         """
         Prepare content for a btrfs rootfs partition.
@@ -308,7 +321,7 @@ class Partition():
              self.mkfs_extraopts, self.fsuuid, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
-    def prepare_rootfs_msdos(self, rootfs, oe_builddir, rootfs_dir,
+    def prepare_rootfs_msdos(self, rootfs, cr_workdir, oe_builddir, rootfs_dir,
                              native_sysroot, pseudo):
         """
         Prepare content for a msdos/vfat rootfs partition.
@@ -337,12 +350,16 @@ class Partition():
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, rootfs_dir)
         exec_native_cmd(mcopy_cmd, native_sysroot)
 
+        if self.updated_fstab_path and self.has_fstab:
+            mcopy_cmd = "mcopy -i %s %s ::/etc/fstab" % (rootfs, self.updated_fstab_path)
+            exec_native_cmd(mcopy_cmd, native_sysroot)
+
         chmod_cmd = "chmod 644 %s" % rootfs
         exec_cmd(chmod_cmd)
 
     prepare_rootfs_vfat = prepare_rootfs_msdos
 
-    def prepare_rootfs_squashfs(self, rootfs, oe_builddir, rootfs_dir,
+    def prepare_rootfs_squashfs(self, rootfs, cr_workdir, oe_builddir, rootfs_dir,
                                 native_sysroot, pseudo):
         """
         Prepare content for a squashfs rootfs partition.
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 6fd415af5b..96d940a91d 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -94,6 +94,7 @@ class RootfsPlugin(SourcePlugin):
                                "it is not a valid path, exiting" % part.rootfs_dir)
 
         part.rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
+        part.has_fstab = os.path.exists(os.path.join(part.rootfs_dir, "etc/fstab"))
         pseudo_dir = os.path.join(part.rootfs_dir, "../pseudo")
         if not os.path.lexists(pseudo_dir):
             logger.warn("%s folder does not exist. "
@@ -103,7 +104,7 @@ class RootfsPlugin(SourcePlugin):
         new_rootfs = None
         new_pseudo = None
         # Handle excluded paths.
-        if part.exclude_path or part.include_path or part.change_directory or part.updated_fstab_path:
+        if part.exclude_path or part.include_path or part.change_directory or part.update_fstab_in_rootfs:
             # We need a new rootfs directory we can safely modify without
             # interfering with other tasks. Copy to workdir.
             new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
@@ -214,8 +215,10 @@ class RootfsPlugin(SourcePlugin):
                     rm_cmd = "rm -rf %s" % (full_path)
                     exec_native_cmd(rm_cmd, native_sysroot, pseudo)
 
-            has_fstab = os.path.exists(os.path.join(new_rootfs, "etc/fstab"))
-            if part.updated_fstab_path and has_fstab:
+            # Update part.has_fstab here as fstab may have been added or
+            # removed by the above modifications.
+            part.has_fstab = os.path.exists(os.path.join(new_rootfs, "etc/fstab"))
+            if part.update_fstab_in_rootfs and part.has_fstab:
                 fstab_path = os.path.join(new_rootfs, "etc/fstab")
                 # Assume that fstab should always be owned by root with fixed permissions
                 install_cmd = "install -m 0644 %s %s" % (part.updated_fstab_path, fstab_path)
-- 
2.26.2

