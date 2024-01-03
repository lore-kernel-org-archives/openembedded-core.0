Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2362C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 12:31:24 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.16402.1704285075755446149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 04:31:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WYiu0SiC;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: liu.ming50@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d480c6342dso40170825ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 04:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704285074; x=1704889874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yQ1Mc8b6gokeHqFEI4lFpwwme42z10KzIKrs33PQY9s=;
        b=WYiu0SiCPmvhro5gd77vsqRpD3Ddf+2DO3RLQ4QhNwHx9E7j4uZPBKmLSJPct+RKOT
         5Wz4HZzg8AFgB5DWe18QUEghUgYkAytItnt9eNrIIaSl1lNcyfiAAs22+cAvtdU+L4si
         V7GvTw9tuVp3/bUgCGpqlmWCyF9vOTBwMuq+mHIDRP3G16dFYWdkXqP6jSjwytGCscqP
         +x8itNx4gw9ehIegltK1AeszyjqDdUEROI9sJGl0M972nmfdb2svnOvHqoNvH/DCIwy1
         Zz8eKxQNrkGxbsb3h8k0JEXmP4hILoFKL0ARrZWm9r+KBcPZdNx9U00J5yMF+pBv/u5S
         K3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704285074; x=1704889874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yQ1Mc8b6gokeHqFEI4lFpwwme42z10KzIKrs33PQY9s=;
        b=eh7Qdhk3v3QXCRut+jmYRK24sRgOxon/J+NyDU7ghD3TsMMB3Nnl8PGqJy4GS7uIJX
         AyPtG1q8nz89MPDQxxBUz2DNB0ejZXtYRC6mkYg3qW+ycu02XiDtek8LCZ24m/Eprtd2
         uxQO1rcG7KCJOn7e3odoP7wnt7qSXGMCgDiY1bJ9gHh9L2DfVtE3LqTscvR0EJJI/25X
         ygvkO/3NloSCRJ3IE3zOeMXQ7hWb5lmlUT9LqJ6j4oFgb+gvpbBVTuBYC75NeX+4dSLY
         FeBKzMkAVxdaqZEMnBPziDwKGEDrkfm+IId1DS0UR5f/iYAE73Iz55lUzwiDJZwA8LpK
         EvSg==
X-Gm-Message-State: AOJu0YxVDNZ08cPVP3Kn2LYCG4Q3MbNBv0IgWKOZkanlI7uV1NhsipV0
	xmaI53cml8enbgftodI8nHM9ParJKng=
X-Google-Smtp-Source: AGHT+IG5BFP8l3F7EwcJv9yz8o8g49JbrdiE4oqEMrdSc1HQV08ges+aPTOaETX4Fk2izoYr+OAgDQ==
X-Received: by 2002:a17:90b:1210:b0:28c:b04d:a6cf with SMTP id gl16-20020a17090b121000b0028cb04da6cfmr3996021pjb.81.1704285074472;
        Wed, 03 Jan 2024 04:31:14 -0800 (PST)
Received: from peterliu-Precision-7530.atlascopco.group ([213.50.243.108])
        by smtp.gmail.com with ESMTPSA id nh5-20020a17090b364500b0028bdc7e5a15sm1528089pjb.53.2024.01.03.04.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 04:31:08 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] grub: fs/fat: Don't error when mtime is 0
Date: Wed,  3 Jan 2024 13:30:52 +0100
Message-Id: <20240103123052.711083-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 12:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193286

From: Ming Liu <liu.ming50@gmail.com>

A issue was found when I run "runqemu genericx86-64 ovmf", grub failed
to boot, it's a known issue has been fixed in grub upstream, backport
the fix.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
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


