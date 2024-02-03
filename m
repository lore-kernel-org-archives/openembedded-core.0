Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3FBC48299
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 19:15:13 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.23483.1706987706568658995
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 11:15:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1MpyBU4H;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5d8b519e438so3068879a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 11:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706987705; x=1707592505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Ld9C/hYRzTGO+syuFVZTuRCC+soKL3ZPrniYtp/WyE=;
        b=1MpyBU4HPvSV9cD0q85PvYiX2KbMqtsmzOqnvDo1P4X/gX1grr46fsvHys5pE2iw9M
         KxQFFlJclbDFPIMcuM9b4tIWNDfXrP5ZT+Hq2/kb33fczidi9GLeGafFgacII+H7Qad/
         3c00q+QkVJsoNMwulasTJEoYaRmXg6EdTLI9Cbm7/NhU+VHgsjSC87hpRK24L4ReEyhL
         Toa94BL5leS5a9jQrZ9rUgvs4Wr9Zz86e4dzNW3ItZKcz/fmJsr73UUlambeQ3V8icHW
         FRVnDU1u3+rtIp0eKnBjb0B3QfvLsthoD6xJTO+gypjsEBZk8BAxuMZmyAPSfVRjRKZY
         NKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706987705; x=1707592505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Ld9C/hYRzTGO+syuFVZTuRCC+soKL3ZPrniYtp/WyE=;
        b=B+8noRJ+SqMSBu5QRH/Mzg90bgI2AYrEKxQJ+UaYYWmhCEa4clf7kEODvRBHCLsLx2
         +2KqMeHWEb8UEL4iDbp+YveL2KLD5XmhEuvZ6qv8RSgtGqfmq0OVo8d3gIR7ibCr5T6Y
         qeYADTH0uDeXGtqBvxjGnQFVXHlWqZGaN3AvH+lolrpnOTYp+2sPpuWG5z2T/2vmB5Xn
         kP2L58LtrG3CK8PDsLti5US19/ZqP0n6nGPcnt+Yz2iFpxPAllQVcMbf+iCLk/GBrXS3
         XKW0/EO+7GCW4v97pHMZJqz42S0X4PCNbnWjwQAAqFuFVrvGZq+SQzieiZ57beFOxcyJ
         guXA==
X-Gm-Message-State: AOJu0Yzh310LS0vUOKlZdXcCg+PMoehulHsrpqdE7a7dCPQi8DtsVArI
	IDdeA5vOwUQz1JU9Mmy14eLzf2kgDKTcuCLyuEUf2Bk++ROGkbl23QwE4dOdRR70la4rQukJBfF
	pjag=
X-Google-Smtp-Source: AGHT+IEG8gf6k2FIpHzk42tro+1limPOe0dXyBEnqVzBm3r//KXkMCAcqIUGoUhAO+j2TZpi05Tqew==
X-Received: by 2002:a05:6a21:394c:b0:19e:499c:dd7 with SMTP id ac12-20020a056a21394c00b0019e499c0dd7mr7263359pzc.52.1706987705228;
        Sat, 03 Feb 2024 11:15:05 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w63-20020a17090a6bc500b00296443780d7sm2376863pjj.47.2024.02.03.11.15.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 11:15:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 09/15] grub: fs/fat: Don't error when mtime is 0
Date: Sat,  3 Feb 2024 09:14:36 -1000
Message-Id: <10f783721decaec06e87dd7a140ea16f12b97539.1706987549.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706987549.git.steve@sakoman.com>
References: <cover.1706987549.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 19:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194853

From: Ming Liu <liu.ming50@gmail.com>

A issue was found when I run "runqemu genericx86-64 ovmf", grub failed
to boot, it's a known issue has been fixed in grub upstream, backport
the fix.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 51eab4bb0cae46c9c32d28986eb97badf47594b7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-fs-fat-Don-t-error-when-mtime-is-0.patch | 70 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-mtime-is-0.patch

diff --git a/meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-mtime-is-0.patch b/meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-mtime-is-0.patch
new file mode 100644
index 0000000000..a5fbd58f46
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-mtime-is-0.patch
@@ -0,0 +1,70 @@
+From e43f3d93b28cce852c110c7a8e40d8311bcd8bb1 Mon Sep 17 00:00:00 2001
+From: Robbie Harwood <rharwood@redhat.com>
+Date: Fri, 15 Jul 2022 16:13:02 -0400
+Subject: [PATCH] fs/fat: Don't error when mtime is 0
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In the wild, we occasionally see valid ESPs where some file modification
+times are 0. For instance:
+
+    ├── [Dec 31  1979]  EFI
+    │   ├── [Dec 31  1979]  BOOT
+    │   │   ├── [Dec 31  1979]  BOOTX64.EFI
+    │   │   └── [Dec 31  1979]  fbx64.efi
+    │   └── [Jun 27 02:41]  fedora
+    │       ├── [Dec 31  1979]  BOOTX64.CSV
+    │       ├── [Dec 31  1979]  fonts
+    │       ├── [Mar 14 03:35]  fw
+    │       │   ├── [Mar 14 03:35]  fwupd-359c1169-abd6-4a0d-8bce-e4d4713335c1.cap
+    │       │   ├── [Mar 14 03:34]  fwupd-9d255c4b-2d88-4861-860d-7ee52ade9463.cap
+    │       │   └── [Mar 14 03:34]  fwupd-b36438d8-9128-49d2-b280-487be02d948b.cap
+    │       ├── [Dec 31  1979]  fwupdx64.efi
+    │       ├── [May 10 10:47]  grub.cfg
+    │       ├── [Jun  3 12:38]  grub.cfg.new.new
+    │       ├── [May 10 10:41]  grub.cfg.old
+    │       ├── [Jun 27 02:41]  grubenv
+    │       ├── [Dec 31  1979]  grubx64.efi
+    │       ├── [Dec 31  1979]  mmx64.efi
+    │       ├── [Dec 31  1979]  shim.efi
+    │       ├── [Dec 31  1979]  shimx64.efi
+    │       └── [Dec 31  1979]  shimx64-fedora.efi
+    └── [Dec 31  1979]  FSCK0000.REC
+
+    5 directories, 17 files
+
+This causes grub-probe failure, which in turn causes grub-mkconfig
+failure. They are valid filesystems that appear intact, and the Linux
+FAT stack is able to mount and manipulate them without complaint.
+
+The check for mtime of 0 has been present since
+20def1a3c3952982395cd7c3ea7e78638527962b (fat: support file
+modification times).
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=e43f3d93b28cce852c110c7a8e40d8311bcd8bb1]
+
+Signed-off-by: Robbie Harwood <rharwood@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ grub-core/fs/fat.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/grub-core/fs/fat.c b/grub-core/fs/fat.c
+index 0951b2e63..c5efed724 100644
+--- a/grub-core/fs/fat.c
++++ b/grub-core/fs/fat.c
+@@ -1027,9 +1027,6 @@ grub_fat_dir (grub_device_t device, const char *path, grub_fs_dir_hook_t hook,
+ 					  grub_le_to_cpu16 (ctxt.dir.w_date),
+ 					  &info.mtime);
+ #endif
+-      if (info.mtimeset == 0)
+-	grub_error (GRUB_ERR_OUT_OF_RANGE,
+-		    "invalid modification timestamp for %s", path);
+ 
+       if (hook (ctxt.filename, &info, hook_data))
+ 	break;
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index f594e7d3a4..1215b24668 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -44,6 +44,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-fs-ext2-Ignore-checksum-seed-incompat-feature.patch \
            file://CVE-2023-4692.patch \
            file://CVE-2023-4693.patch \
+           file://0001-fs-fat-Don-t-error-when-mtime-is-0.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.34.1


