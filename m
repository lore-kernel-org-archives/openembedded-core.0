Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.379.1611586432925926274
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:53:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=tyCSoggW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d13so1989983plg.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JhnHKU6Ls2KJufT9l22GWSixQ/SqGpoxi4ErRtABVqE=;
        b=tyCSoggW9j7ReFunu5+PqtNuQ4dnomUqwwHfbaiwVpt+8fPwzLRc8usC8cX8IWxSc9
         T+qM8rqYcuZAYcePREuZSzRfvdfgp9dq3rLdRE9Br85tJdoP2M4qO6N57Q0h41XrMzl4
         +UAUxugjDQRKEUvgS92btTZJDCUNivoeKcKMLvj5meYgYcBlFlS+vpaLjODFDGfGGhP9
         XAWDiOrcS0ixtz45H4CLSCNvdNA/yYO2FsX5EpnS63RzuPCkJr5ve6y4m3kOWIyy04Jf
         AaVo8OspttzGiPCWoxrSvr7Udq6ezOwpPTEKxPCZpOtpoHb1odScez8GGXH7w0P2Aw4v
         KEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JhnHKU6Ls2KJufT9l22GWSixQ/SqGpoxi4ErRtABVqE=;
        b=jrxx/sX73JfU762IUbvNs3me4kwYKYqh0RZ9ToUi4KbKcQ8PniPoVhUDYW6DysxUpv
         EkpmmozGVnAgR8TXo5udWxZIqc3TjzZe9KLBx1IL6+XoVhaSRUzllLiy+7xNJZIUQsqL
         HGBCfrL6fbczdUk7jZI5WzXKFzs707kv9z8vUiBSz9mDwHlVNjRx9GNJRAmnSiy72bv0
         rX5IWeNeTRMEZDLEhf71VxrKqUZwstfPN/61SzTcLNonxVYUDNaENjkMQnokrePFNzwl
         QGyy8p+kznIryefSB8c6GFvjs61nVkdZNV7OM2EfjTTsUouG+ALhYIMTKik335Tl9qje
         bN9w==
X-Gm-Message-State: AOAM530HMOdkoBCAo+KfxXqRfC6sLi6aCjsZOat8J4ctsN82iu1Nlwm6
	EIK8R/rvwGyajttNglO8BggOH/jhs/UQqKao/9Y=
X-Google-Smtp-Source: ABdhPJwOvfWb/y6owfoK/5HOsv8/xOiL4BD7cDfP+EHRDMuevmxtL79RAdhMw4Riqg7Sku3Hbdxtgw==
X-Received: by 2002:a17:90a:d258:: with SMTP id o24mr547493pjw.231.1611586431943;
        Mon, 25 Jan 2021 06:53:51 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.53.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:53:51 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 47/47] wic: Optimise fstab modification for ext2/3/4 and msdos partitions
Date: Mon, 25 Jan 2021 04:51:19 -1000
Message-Id: <e7ddc40c525ad0cfa6f19734efa0d18682ab6ab2.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5fb8ae0e9159597d7eaa9307a3a8543800bf9405)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index f19ec3312b..c8c1c0f58f 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -77,6 +77,7 @@ class RootfsPlugin(SourcePlugin):
                                "it is not a valid path, exiting" % part.rootfs_dir)
 
         part.rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
+        part.has_fstab = os.path.exists(os.path.join(part.rootfs_dir, "etc/fstab"))
         pseudo_dir = os.path.join(part.rootfs_dir, "../pseudo")
         if not os.path.lexists(pseudo_dir):
             logger.warn("%s folder does not exist. "
@@ -86,7 +87,7 @@ class RootfsPlugin(SourcePlugin):
         new_rootfs = None
         new_pseudo = None
         # Handle excluded paths.
-        if part.exclude_path or part.include_path or part.change_directory or part.updated_fstab_path:
+        if part.exclude_path or part.include_path or part.change_directory or part.update_fstab_in_rootfs:
             # We need a new rootfs directory we can safely modify without
             # interfering with other tasks. Copy to workdir.
             new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
@@ -159,8 +160,10 @@ class RootfsPlugin(SourcePlugin):
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
2.25.1

