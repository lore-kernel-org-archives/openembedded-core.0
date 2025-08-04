Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E9EC87FCB
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 08:48:24 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.13591.1754297298295685531
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 01:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=akmDqVQ3;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b785a69454so1694508f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 01:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1754297297; x=1754902097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IxKqcOw9FgFQRh3Ikfzy5JXkFpCRhbyoycOKnMXhp08=;
        b=akmDqVQ32DxY/E0bDHqQvoSncxiutFYacGowL+6bi9X3aTZ3Vq8FWyT11/Sz/wt0te
         XMVvnCWzv/OqD11z6A9fzSYUcnj9YcG2ptUyGsvFIeZG8pKejJp3T7QIxmq7Tx0DQC2l
         b3tgb+XR3fxBLyecgRsBiP/hQsGH6PewWRpag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754297297; x=1754902097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxKqcOw9FgFQRh3Ikfzy5JXkFpCRhbyoycOKnMXhp08=;
        b=KdxD9d6f4FhrSgAZSmt3jCnoY95CmPImt2eGPzPqI5CGsYnbNpycTYh5rpHNsSg4pq
         RN0ke+R9BGz4pJ+3M888g34a50U9ek/6LX9I3eq9rr3Vx4NlJgPYpsXx6kl/aOeGwgOt
         BnPWQwb83thu2HUqZaKIFbI58kGRfc2QWEHjDwRuFylrlPxwG1urZeciuuCNrdGRWNXf
         yMmXkd1ctPT4pYxBfZ2eclsz5HDIF2T62tyeMvTawznQYk5L/idmh+NabN4xf5q2A7AO
         WfBKe/PPUSGsat1CGXaijFx8pCZeyEEM61QS6O+mgCekEx9eAqtnFTjboGytlvhdbkg4
         Xtlg==
X-Gm-Message-State: AOJu0YzFatN8FAGKhLvYhOYu1Rjrth9hgu4FoRq3L9dPg0dL906Feuzk
	697R0iXOnPwuOsjkrUT3nP3SbxegeIm/mIx6zn24COKQotbXSRLyQ/IrXy4dHBPO4ZzxBpwAK2C
	yuAgB
X-Gm-Gg: ASbGncttBytrseH6tb2z2ML3wdgUUvx6gN4nsIV8/Q4KEnY++F1YyDTFV0Mfnrsriti
	pY6zRweaFr/F7PTt9KbtzUZL/zJIvZ4k8P3mrr9Lr9A6CSImvXokBFBc7ls96GLH3GOIscfbzRi
	z2xQ1xuwXtYA5UCtdEqUpNcoci4bw3NHBifrdy433uS9kCRKmidEV6uIXPrX8vDl89cSqzEfoYZ
	xaLknpTfi45aeidycpNcW1rr/mbZUITUIzoNdDQ+cLz9PezAn/R3MSerqDwtbLKa1SOsgzsAOnB
	4sEkHC57dy4Ho9YYe87NLSBn4KUbkBhakqOG1hMv3WsLpX6KlQCnEKHGk9lwi1absPc8EK3UZFi
	plX6HG8+LXpWIHH95KPHVFv3T1/o8GyeKRKu9A8t/qECDaz4=
X-Google-Smtp-Source: AGHT+IG7tVk/9MZ54+63RvBLXtCMI7w2X0TiDJmxD/evNkKk0vcz+LD3N8V8OvnlkFfW2OrCmqzwUA==
X-Received: by 2002:a5d:5f51:0:b0:3b7:9a01:e50e with SMTP id ffacd0b85a97d-3b8d94babcdmr6322329f8f.42.1754297296628;
        Mon, 04 Aug 2025 01:48:16 -0700 (PDT)
Received: from FRSMI24-BLUE.example.com ([195.68.54.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3ac158sm15029754f8f.4.2025.08.04.01.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 01:48:16 -0700 (PDT)
From: pierre-loup.gosse@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
Subject: [PATCH] wic: add --keep-free option to set unused space
Date: Mon,  4 Aug 2025 10:48:09 +0200
Message-Id: <20250804084809.2797941-1-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 08:48:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221420

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

Currently, the content of the partition is filled by the filesystem
without leaving any unused free space. The --extra-space flag adds
extra space to the filesystem size, not to the partition.

Unused free space after the filesystem can be useful for some cases,
such as encrypting a partition at runtime. With --keep-free 32M, we
ensure that the last 32M of the partition is unused: this space does
not contain filesystem data and can store the LUKS2 header.

The implementation sets a difference between the partition and
filesystem size:
  - With --fixed-size, the keep-free space is removed from the
    filesystem size.
  - Otherwise (with or without --size flags), the keep-free space is
    added to the partition size.

Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
---
 scripts/lib/wic/ksparser.py  |  3 +++
 scripts/lib/wic/partition.py | 38 ++++++++++++++++++++++--------------
 2 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 7ef3dc83dd..612eed7e47 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -154,6 +154,7 @@ class KickStart():
         part.add_argument('--include-path', nargs='+', action='append')
         part.add_argument('--change-directory')
         part.add_argument("--extra-space", type=sizetype("M"))
+        part.add_argument('--keep-free', type=sizetype("M"))
         part.add_argument('--fsoptions', dest='fsopts')
         part.add_argument('--fspassno', dest='fspassno')
         part.add_argument('--fstype', default='vfat',
@@ -259,6 +260,8 @@ class KickStart():
                             err = "%s:%d: Must set the label with --label" \
                                   % (confpath, lineno)
                             raise KickStartError(err)
+                        if not parsed.keep_free:
+                            parsed.keep_free = 0
                         # using ArgumentParser one cannot easily tell if option
                         # was passed as argument, if said option has a default
                         # value; --overhead-factor/--extra-space cannot be used
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index b34691d313..e82aa5238e 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -32,6 +32,7 @@ class Partition():
         self.exclude_path = args.exclude_path
         self.include_path = args.include_path
         self.change_directory = args.change_directory
+        self.keep_free = args.keep_free
         self.fsopts = args.fsopts
         self.fspassno = args.fspassno
         self.fstype = args.fstype
@@ -91,17 +92,16 @@ class Partition():
     def get_rootfs_size(self, actual_rootfs_size=0):
         """
         Calculate the required size of rootfs taking into consideration
-        --size/--fixed-size flags as well as overhead and extra space, as
-        specified in kickstart file. Raises an error if the
-        `actual_rootfs_size` is larger than fixed-size rootfs.
-
+        --size/--fixed-size and --keep-free flags as well as overhead
+        and extra space, as specified in kickstart file. Raises an error
+        if the `actual_rootfs_size` is larger than fixed-size rootfs.
         """
         if self.fixed_size:
-            rootfs_size = self.fixed_size
+            rootfs_size = self.fixed_size - self.keep_free
             if actual_rootfs_size > rootfs_size:
                 raise WicError("Actual rootfs size (%d kB) is larger than "
-                               "allowed size %d kB" %
-                               (actual_rootfs_size, rootfs_size))
+                               "allowed size %d kB (including %d kB keep free)" %
+                               (actual_rootfs_size, rootfs_size, self.keep_free))
         else:
             extra_blocks = self.get_extra_block_count(actual_rootfs_size)
             if extra_blocks < self.extra_space:
@@ -119,10 +119,18 @@ class Partition():
     def disk_size(self):
         """
         Obtain on-disk size of partition taking into consideration
-        --size/--fixed-size options.
+        --size/--fixed-size and --keep-free options.
+
+        """
+        return self.fixed_size if self.fixed_size else self.size + self.keep_free
 
+    @property
+    def fs_size(self):
+        """
+        Obtain on-disk size of filesystem inside the partition taking into
+        consideration --size/--fixed-size and --keep-free options.
         """
-        return self.fixed_size if self.fixed_size else self.size
+        return self.fixed_size - self.keep_free if self.fixed_size else self.size
 
     def prepare(self, creator, cr_workdir, oe_builddir, rootfs_dir,
                 bootimg_dir, kernel_dir, native_sysroot, updated_fstab_path):
@@ -202,10 +210,10 @@ class Partition():
                            "This a bug in source plugin %s and needs to be fixed." %
                            (self.mountpoint, self.source))
 
-        if self.fixed_size and self.size > self.fixed_size:
+        if self.fixed_size and self.size + self.keep_free > self.fixed_size:
             raise WicError("File system image of partition %s is "
-                           "larger (%d kB) than its allowed size %d kB" %
-                           (self.mountpoint, self.size, self.fixed_size))
+                           "larger (%d kB + %d kB keep free) than its allowed size %d kB" %
+                           (self.mountpoint, self.size, self.keep_free, self.fixed_size))
 
     def prepare_rootfs(self, cr_workdir, oe_builddir, rootfs_dir,
                        native_sysroot, real_rootfs = True, pseudo_dir = None):
@@ -440,7 +448,7 @@ class Partition():
         """
         Prepare an empty ext2/3/4 partition.
         """
-        size = self.disk_size
+        size = self.fs_size
         with open(rootfs, 'w') as sparse:
             os.ftruncate(sparse.fileno(), size * 1024)
 
@@ -464,7 +472,7 @@ class Partition():
         """
         Prepare an empty btrfs partition.
         """
-        size = self.disk_size
+        size = self.fs_size
         with open(rootfs, 'w') as sparse:
             os.ftruncate(sparse.fileno(), size * 1024)
 
@@ -482,7 +490,7 @@ class Partition():
         """
         Prepare an empty vfat partition.
         """
-        blocks = self.disk_size
+        blocks = self.fs_size
 
         label_str = "-n boot"
         if self.label:
-- 
2.34.1


