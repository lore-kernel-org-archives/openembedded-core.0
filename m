Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.2575.1615661527481240549
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:52:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BtD8CUbz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.43, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f43.google.com with SMTP id l23-20020a05683004b7b02901b529d1a2fdso3139422otd.8
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Aqjaco4EFhwtkQsGG7uRC2PRTFeG61fzm5SogmKl+IU=;
        b=BtD8CUbz4kO8hN+EJ5mGHzGFEIgn1BmCnYk6xDbVpv7YOk3y8NlbYcj4r2z43BobxD
         p+AoJ66kJQGmL1TfXgU/oc4CFg2t3qpB6+nmpdIbomXcgSSTqUehxbc3CjKUTzKFFyUJ
         lJn4T2N/TgaVV/jDrNf9kdYC/IjcitRngF9h7E9ebmkGYeI6nlp/dyvt9sGpAKokuiu7
         iFLVAGQZB+XLz0I/3jB3jUUZj5IU/ckKWCR2UzGwrexfEC0fhYBUZmbX43uBS/HS9NVm
         p+Z87qbe3f4fx2QtK5t90xeXyGpOQgjXsa9fs/1y6CckSAYhHdRaaY3VUT6s0DK3gZ5j
         8LoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Aqjaco4EFhwtkQsGG7uRC2PRTFeG61fzm5SogmKl+IU=;
        b=LV0gnw+1XAALpVW0x3BKtXtZvPCy1X+jk0+nb+oH7rjoRts5f/hkPhORg6r3p2dlne
         FH7y9+6CEYizyjD/oBYKZJ/3StBcttR1QbGFi5Vn8jm5DgzihnnXgfoZ6kKnx5hlWK+H
         3LS36I40VHP6PkXwSL1Gd9Ecxs8xsIopwcmwU+jJFUYx/9lb+Dk5UAJPtkz9lC1Dt/Lu
         uk+0o/2x+aGpgqEyV2Mm7TCCm4ExCgYdNLd3emXY5qE5HYsbcOGZwr0v1cqs19ddx+Mf
         zh5brNcHPaqL/5f4mOO7Je26eoLlIIzEie1tRtFW41bRENDOEvwKMGM81jfzNd+fMquj
         uE4A==
X-Gm-Message-State: AOAM532cSkj9bYB0QW8DUCAbU/XtsVwZ65wRHEuhyeESn7nXoSU5JVxR
	Nc1mybi6+2azuzepFRqIChptC6PrCrw4Do/E
X-Google-Smtp-Source: ABdhPJy/MjY6E12mU05UxH3DMffoFnLE5ASV7XudMwIjR9nlBp5cXmnBpZGlwq+sHbLaIvcQh4AR+Q==
X-Received: by 2002:a9d:66:: with SMTP id 93mr7883239ota.147.1615661526279;
        Sat, 13 Mar 2021 10:52:06 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.52.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:52:05 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 27/38] wic: Warn if an ext filesystem affected by the Y2038 problem is used
Date: Sat, 13 Mar 2021 08:49:16 -1000
Message-Id: <280bf295a12b49a1d5199d86da6641516df0ce6a.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Bezdeka <florian.bezdeka@siemens.com>

We are getting closer and closer to the year 2038 where the 32 bit
time_t overflow will happen. While products (= embedded systems) with an
expected life time of 15 years are still save the situation may change
if your system has to survive the next 20 years.

ext2 and ext3 filesystems are always affected by the time overflow, so
let's warn the user if these filesystems are still being used.

If ext4 is affected depends on the inode size chosen during filesystem
creation. At least 256 bytes are necessary to be safe. As ext4 is
used very often (and partitions may be created small first and extended
later) this might be an issue for many users.

Some filesystems created during CI runs were already affected by the Y2038
problem. By using `--mkfs-extraopts "-T default"` we tell mke2fs not to
auto-detect the usage type based on the filesystem size. mke2fs will use
the default values for tuning parameters instead. The inode size is one
of these parameters.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eecbe625558406680121d2a7e84917fea45ea9dc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/canned-wks/common.wks.inc     |  2 +-
 scripts/lib/wic/canned-wks/directdisk-gpt.wks |  2 +-
 scripts/lib/wic/canned-wks/mkefidisk.wks      |  2 +-
 scripts/lib/wic/misc.py                       |  1 +
 scripts/lib/wic/partition.py                  | 38 +++++++++++++++++++
 5 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/canned-wks/common.wks.inc b/scripts/lib/wic/canned-wks/common.wks.inc
index 89880b417b..4fd29fa8c1 100644
--- a/scripts/lib/wic/canned-wks/common.wks.inc
+++ b/scripts/lib/wic/canned-wks/common.wks.inc
@@ -1,3 +1,3 @@
 # This file is included into 3 canned wks files from this directory
 part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
-part / --source rootfs --use-uuid --fstype=ext4 --label platform --align 1024
+part / --source rootfs --use-uuid --fstype=ext4 --mkfs-extraopts "-T default" --label platform --align 1024
diff --git a/scripts/lib/wic/canned-wks/directdisk-gpt.wks b/scripts/lib/wic/canned-wks/directdisk-gpt.wks
index 8d7d8de6ea..cf16c0c30b 100644
--- a/scripts/lib/wic/canned-wks/directdisk-gpt.wks
+++ b/scripts/lib/wic/canned-wks/directdisk-gpt.wks
@@ -4,7 +4,7 @@
 
 
 part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
-part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
+part / --source rootfs --ondisk sda --fstype=ext4 --mkfs-extraopts "-T default" --label platform --align 1024 --use-uuid
 
 bootloader  --ptable gpt --timeout=0  --append="rootwait rootfstype=ext4 video=vesafb vga=0x318 console=tty0 console=ttyS0,115200n8"
 
diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks b/scripts/lib/wic/canned-wks/mkefidisk.wks
index 9f534fe184..d1878e23e5 100644
--- a/scripts/lib/wic/canned-wks/mkefidisk.wks
+++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
@@ -4,7 +4,7 @@
 
 part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --ondisk sda --label msdos --active --align 1024
 
-part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
+part / --source rootfs --ondisk sda --fstype=ext4 --mkfs-extraopts "-T default"  --label platform --align 1024 --use-uuid
 
 part swap --ondisk sda --size 44 --label swap1 --fstype=swap
 
diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index e4b5a0d519..8fb508dd39 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -26,6 +26,7 @@ logger = logging.getLogger('wic')
 
 # executable -> recipe pairs for exec_native_cmd
 NATIVE_RECIPES = {"bmaptool": "bmap-tools",
+                  "dumpe2fs": "e2fsprogs",
                   "grub-mkimage": "grub-efi",
                   "isohybrid": "syslinux",
                   "mcopy": "mtools",
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index e574f40c47..85f9847047 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -298,6 +298,8 @@ class Partition():
         mkfs_cmd = "fsck.%s -pvfD %s" % (self.fstype, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
+        self.check_for_Y2038_problem(rootfs, native_sysroot)
+
     def prepare_rootfs_btrfs(self, rootfs, cr_workdir, oe_builddir, rootfs_dir,
                              native_sysroot, pseudo):
         """
@@ -388,6 +390,8 @@ class Partition():
             (self.fstype, extraopts, label_str, self.fsuuid, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot)
 
+        self.check_for_Y2038_problem(rootfs, native_sysroot)
+
     def prepare_empty_partition_btrfs(self, rootfs, oe_builddir,
                                       native_sysroot):
         """
@@ -449,3 +453,37 @@ class Partition():
 
         mkswap_cmd = "mkswap %s -U %s %s" % (label_str, self.fsuuid, path)
         exec_native_cmd(mkswap_cmd, native_sysroot)
+
+    def check_for_Y2038_problem(self, rootfs, native_sysroot):
+        """
+        Check if the filesystem is affected by the Y2038 problem
+        (Y2038 problem = 32 bit time_t overflow in January 2038)
+        """
+        def get_err_str(part):
+            err = "The {} filesystem {} has no Y2038 support."
+            if part.mountpoint:
+                args = [part.fstype, "mounted at %s" % part.mountpoint]
+            elif part.label:
+                args = [part.fstype, "labeled '%s'" % part.label]
+            elif part.part_name:
+                args = [part.fstype, "in partition '%s'" % part.part_name]
+            else:
+                args = [part.fstype, "in partition %s" % part.num]
+            return err.format(*args)
+
+        # ext2 and ext3 are always affected by the Y2038 problem
+        if self.fstype in ["ext2", "ext3"]:
+            logger.warn(get_err_str(self))
+            return
+
+        ret, out = exec_native_cmd("dumpe2fs %s" % rootfs, native_sysroot)
+
+        # if ext4 is affected by the Y2038 problem depends on the inode size
+        for line in out.splitlines():
+            if line.startswith("Inode size:"):
+                size = int(line.split(":")[1].strip())
+                if size < 256:
+                    logger.warn("%s Inodes (of size %d) are too small." %
+                                (get_err_str(self), size))
+                break
+
-- 
2.25.1

