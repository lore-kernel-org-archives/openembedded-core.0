Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91752C25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 14:44:43 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.17798.1715784278737173858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 07:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iLEFjeb1;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-437610adf96so45022881cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 07:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715784278; x=1716389078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qHasSuvU6yGYBqTBlLHg4+4PXnxz6jeftpQy7SKZ6cI=;
        b=iLEFjeb17ba5C9rNu5H4h48HEG2YEab+2jtZ58AF09x2cSLyTWv2v+RPyU1t/9DAn4
         nSLBgQ5P7iiDSoxMSHAYGPCj/j+prXfsdL5TVnBsrcIFKbbfWCmoES8CMmScQfpx3TFV
         4cMX9Gt1obMHbs4PrrvwawvifEjUOpxCQsYOHZHdWWIVKlCvBhcc3BUL3rjniOUxIe4l
         cTLoGHFkDSTPhMvFdA8JFTe+qb0T9xez/UIRBCi7SWn/cfXV6xyRJMQWqAInhub+LKtp
         GfwnLiB8fKW14s4aE1NcUTo1qQQF9nHdjTPKEti4mjaJBFlb0xLJI2Jo6VivCsXB1Ox8
         WECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715784278; x=1716389078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qHasSuvU6yGYBqTBlLHg4+4PXnxz6jeftpQy7SKZ6cI=;
        b=Uo+UHqpbIN3f/1XdIRdWvhkp22fwYnLizIpOH61wGOxNu2GMzFVNoRLi+1Qz8vZpMf
         5zyAL3GOp7tjvO1UbVTzpkn0rzK7QhJH0yFw/TP+ABCUTNHpO+6mDBlE/2F/UzAARW9h
         s/qcmc/BvGizO6ZGXNjAiUeliXVDOahUT2hLCMDVQmOhU1UO78EqB/c9yrsdz+vu6lzl
         MkVcfk/ZOzuJxXedef9AHCC/UpTrIr+HzdrXu/pGgRNhF6A0deYPq2uyrSEPPBYUWL8c
         titEDBXXpmtPK+291jTXVI9n+Fi4hOt3nHXMEvQd9iHzHDqk3N+fLFYP+g1YjoOo4+ZY
         umJg==
X-Gm-Message-State: AOJu0YxHhnyVLRs+OFZ1aEPbJC3LNAlVwDGduLOFUQIt3P7o/h+7+yTy
	hDgcaPdYa0qCu3r5+s/2kPJd8Os/WMFpNKVcU1g5VWJjwtLjCAMn
X-Google-Smtp-Source: AGHT+IGjhqwthQCE9kALAhTE/Ilelg6kdO6xe6GdFcccaz/2Qd2u5Vht+KOEwLvt8eWBZPtkWijtnQ==
X-Received: by 2002:a05:622a:14cf:b0:43d:f335:425b with SMTP id d75a77b69052e-43dfdb68ffamr169673231cf.44.1715784277232;
        Wed, 15 May 2024 07:44:37 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43df54d6e47sm83003011cf.28.2024.05.15.07.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 07:44:36 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: fix build against 6.9 libc-headers
Date: Wed, 15 May 2024 10:44:32 -0400
Message-Id: <20240515144432.3152351-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 14:44:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199291

From: Bruce Ashfield <bruce.ashfield@gmail.com>

When building against the 6.9 linux-libc-headrs the following build
issue was hit:

  | Program check-filesystems.sh found: YES (build/tmp/work/cortexa57-poky-linux/systemd/255.4/git/src/basic/check-filesystems.sh)
  |
  | ../git/src/basic/meson.build:238:8: ERROR: Problem encountered: Unknown filesystems defined in kernel headers:
  |
  | Filesystem found in kernel header but not in filesystems-gperf.gperf: PID_FS_MAGIC

Upstream already has this fixed, so we backport the commit.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Richard,

I only lightly tested this against the older headers, but it shoudln't
be an issue.

Bruce

 .../0001-basic-add-PIDFS-magic-31709.patch    | 53 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_255.4.bb    |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-basic-add-PIDFS-magic-31709.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-basic-add-PIDFS-magic-31709.patch b/meta/recipes-core/systemd/systemd/0001-basic-add-PIDFS-magic-31709.patch
new file mode 100644
index 0000000000..dd4be5ed2a
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-basic-add-PIDFS-magic-31709.patch
@@ -0,0 +1,53 @@
+From ed01b92e1c92871bbd92711f280e2b2d15753f0e Mon Sep 17 00:00:00 2001
+From: cpackham-atlnz <85916201+cpackham-atlnz@users.noreply.github.com>
+Date: Tue, 12 Mar 2024 00:55:36 +1300
+Subject: [PATCH] basic: add PIDFS magic (#31709)
+
+Kernel commit cb12fd8e0dabb9a1c8aef55a6a41e2c255fcdf4b added pidfs.
+Update filesystems-gperf.gperf and missing_magic.h accordingly.
+
+This fixes the following error building against a bleeding edge kernel.
+```
+../src/basic/meson.build:234:8: ERROR: Problem encountered: Unknown filesystems defined in kernel headers:
+
+Filesystem found in kernel header but not in filesystems-gperf.gperf: PID_FS_MAGIC
+```
+
+Upstream-Status: Backport [commit ed01b92e1c92871bbd92711f280e2b2d15753f0e]
+
+---
+ src/basic/filesystems-gperf.gperf | 1 +
+ src/basic/missing_magic.h         | 5 +++++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/src/basic/filesystems-gperf.gperf b/src/basic/filesystems-gperf.gperf
+index e8c5357f91..1cd66b5a5f 100644
+--- a/src/basic/filesystems-gperf.gperf
++++ b/src/basic/filesystems-gperf.gperf
+@@ -91,6 +91,7 @@ ocfs2,           {OCFS2_SUPER_MAGIC}
+ openpromfs,      {OPENPROM_SUPER_MAGIC}
+ orangefs,        {ORANGEFS_DEVREQ_MAGIC}
+ overlay,         {OVERLAYFS_SUPER_MAGIC}
++pidfs,           {PID_FS_MAGIC}
+ pipefs,          {PIPEFS_MAGIC}
+ ppc-cmm,         {PPC_CMM_MAGIC}
+ proc,            {PROC_SUPER_MAGIC}
+diff --git a/src/basic/missing_magic.h b/src/basic/missing_magic.h
+index 27a33adecb..82d71c8ad1 100644
+--- a/src/basic/missing_magic.h
++++ b/src/basic/missing_magic.h
+@@ -128,6 +128,11 @@
+ #define DEVMEM_MAGIC 0x454d444d
+ #endif
+ 
++/* cb12fd8e0dabb9a1c8aef55a6a41e2c255fcdf4b (6.8) */
++#ifndef PID_FS_MAGIC
++#define PID_FS_MAGIC 0x50494446
++#endif
++
+ /* Not in mainline but included in Ubuntu */
+ #ifndef SHIFTFS_MAGIC
+ #define SHIFTFS_MAGIC 0x6a656a62
+-- 
+2.39.2
+
diff --git a/meta/recipes-core/systemd/systemd_255.4.bb b/meta/recipes-core/systemd/systemd_255.4.bb
index 62842d43c8..08af221a93 100644
--- a/meta/recipes-core/systemd/systemd_255.4.bb
+++ b/meta/recipes-core/systemd/systemd_255.4.bb
@@ -28,6 +28,7 @@ SRC_URI += " \
            file://systemd-pager.sh \
            file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0008-implment-systemd-sysv-install-for-OE.patch \
+           file://0001-basic-add-PIDFS-magic-31709.patch \
            "
 
 # patches needed by musl
-- 
2.39.2


