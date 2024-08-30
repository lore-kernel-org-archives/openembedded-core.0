Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D8DCA0FED
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 12:53:08 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.13601.1725022383048998836
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Aug 2024 05:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aMT7Dm2u;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2020e83eca1so18841045ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 05:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725022382; x=1725627182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=soCcW28YUiE/QVJO7BDuT9LU6LUrdrCGiJn7LKru3rA=;
        b=aMT7Dm2u3b/Ka+9WZV372zIPxnqJZHljMquYAOWeCQxZjVgCkgniyDxd6aw5McTB7q
         O3eCpR1z+d2EIuKZg+IMH0MlqP2D81ozy3RcbbTzzh0K1K+4rSitWGsjE1iFRR8xmqMb
         TDLqx6/L5Bk7vbNBgsIxUL4MkRgQczaY3Zphek0ghCHxUStnK6PIwz6Yb7eyPu+kJxuv
         iGoMnYVI6dZf7t3vzJznTwFMIYun0Y05dEGEiCg2KVZsxBj5Iw5jQjhEYJCwwo0kbMgC
         VLrzSYS60+NbzBN/zrAIfzg9uISMPKVeLHM8lEyBwj8KE4ezlHRCsBtgzmeXPIBKacEw
         TGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022382; x=1725627182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=soCcW28YUiE/QVJO7BDuT9LU6LUrdrCGiJn7LKru3rA=;
        b=Ebk/jeHmUjmfXGGYtWcPF3RB/rb9MIj21M1N5f2kwysR/o8u8uCEullansmoanamqj
         LI8eRH27gtJOi4VEAEACbQkNLzgbpDtv+aODL2TgK5Lg+SXm5WDIfuiA3lmrNAF632Mg
         u0VIrAifx4FyCENMw6TseN7ysjTPpdhAZ8Ce24myed5vgFaeaLPBv1YLDUuVv3n/eseR
         jwrs7MKf9qcJ3arhKQFLpM6Jq5ovgqp6y9l/LL3w+uiEt6HjH3e9M+OQjvnrMje6B5Gy
         /pSt5LuZwOsAOcWOsqFd4UmzmlAtyaSbql4bCz6RxCwaI2uJt6nHxB8EBLE8oQv16b1w
         9a9w==
X-Gm-Message-State: AOJu0YzLddoFgj44uZFGkcpJ/kn2DnaD9urXEOUMaKAAS6t+zDtFch1W
	YtMHpOy91FW/gKoEakXV7X5BkbRFzDczaOcweA+g9uuq02rlC0YOAHbp6vxnitanIjYow5gb4ju
	e+JA=
X-Google-Smtp-Source: AGHT+IGT8ae95LZkUVOmst3w/S37H9k/LYm1mwkbX5neQs3nmBifnmSH6p5fBf3Nt1PR0s+yb46XaA==
X-Received: by 2002:a17:903:35ce:b0:203:a196:3bf5 with SMTP id d9443c01a7336-2050c215850mr67749555ad.4.1725022382186;
        Fri, 30 Aug 2024 05:53:02 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2051554235bsm26295975ad.214.2024.08.30.05.53.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 05:53:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/7] grub: fs/fat: Don't error when mtime is 0
Date: Fri, 30 Aug 2024 05:52:47 -0700
Message-Id: <6992437d725f9cc88da4261814b69aaadc5ef0f2.1725022186.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725022186.git.steve@sakoman.com>
References: <cover.1725022186.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 12:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203966

From: Ming Liu <liu.ming50@gmail.com>

A issue was found when I run "runqemu genericx86-64 ovmf", grub failed
to boot, it's a known issue has been fixed in grub upstream, backport
the fix.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 51eab4bb0cae46c9c32d28986eb97badf47594b7)
Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
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
index e6c6cd98b4..2718379474 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -40,6 +40,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch \
 	   file://CVE-2023-4692.patch \
            file://CVE-2023-4693.patch \
+           file://0001-fs-fat-Don-t-error-when-mtime-is-0.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.34.1


