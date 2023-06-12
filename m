Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4649C7EE2F
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 18:11:04 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.67109.1686593457577606300
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 11:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=mC3H/qB8;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-543c6a2aa07so2473087a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 11:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686593457; x=1689185457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rqTuLf2rSbh3XwQAPRN8jbqiNHJhjvRgmueHh4KlGcU=;
        b=mC3H/qB8qSKeF1Gt09s0assrtmrUntLfN9a6mQQtZbjd8do0X1LfAbz7H/bADPJQk9
         SVmqsnMdlx0le6j1W5oPzm6r+xp2MUGlXk7IPmNuFJ8DaHGSrbxOEho8DWGuG/THM1JZ
         NEZ89F+CgqkeJvwWrdnSLn80bnTXcyLnQ9E26d2w1JhhgBgIjIOTWKxjJ0doEon9xMch
         aICyX/fR8eevF+H5K+AHLLTKIxgLgzSGRfxsY6RTbFCndP2wNS8ZWc/zx25kHo5eQDGH
         8C31wC5pObWPfcZjHmeVIOD1ARb7pRo+IuMwJWZazyUnit9XgOUyi364H1NajTlj8kOR
         ZUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686593457; x=1689185457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqTuLf2rSbh3XwQAPRN8jbqiNHJhjvRgmueHh4KlGcU=;
        b=Qf2GDz3g0tlOvgLElG3UFTC0d/4D2o5cMG9ui62D9Xsi0KddrSStJJnd3tCC+dYUma
         oHLR5D/HCN+Fs0macEsn768c7Zsru7ERxR719N56rlBV/0AahHescbvndx+BkZ/1IbjY
         waK2lKN8Eaxgq+uuKIF5SLIRxewFIZh2rpOGMPT3yVMJfZhdyHVAxQR/6/2WI+1RX9tS
         2l6fqJ1VaZM7aa9MW6b88XlJBwo8MAt7v99dQeP9LuQ0Uj4a9ekuKD4FkAYeReeM3wPJ
         FScWAoH2z2LK+uJ3XCFLM3oPrgadFUkOQlvJFdh6gJMAe22qGUZX5r0zmnW3UhTRQw7t
         TPtQ==
X-Gm-Message-State: AC+VfDwxajzxYEzvGbhVEK6LGI3h5m4v7VkbSP4tD3Aid4nAibyV7NXL
	JxBgXN2JH/AeNS2uC/+qrf1FK5ac/9E=
X-Google-Smtp-Source: ACHHUZ6AW2n/JXhkq7xnprhXwCUcx8XLJdr6DLpKxJLyvh1hw4OuRsEbgIoRNyWqTz9fYLv9h+zl0w==
X-Received: by 2002:a17:90a:4544:b0:259:10a8:2389 with SMTP id r4-20020a17090a454400b0025910a82389mr7626460pjm.35.1686593456514;
        Mon, 12 Jun 2023 11:10:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id k9-20020a17090a658900b00255d3bd5ce5sm9469159pjj.45.2023.06.12.11.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:10:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] parted: Add missing libuuid to linker cmdline for libparted-fs-resize.so
Date: Mon, 12 Jun 2023 11:10:54 -0700
Message-ID: <20230612181054.674846-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 18:11:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182684

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...o-linker-flags-for-libparted-fs-resi.patch | 34 +++++++++++++++++++
 meta/recipes-extended/parted/parted_3.5.bb    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/parted/files/0001-fs-Add-libuuid-to-linker-flags-for-libparted-fs-resi.patch

diff --git a/meta/recipes-extended/parted/files/0001-fs-Add-libuuid-to-linker-flags-for-libparted-fs-resi.patch b/meta/recipes-extended/parted/files/0001-fs-Add-libuuid-to-linker-flags-for-libparted-fs-resi.patch
new file mode 100644
index 00000000000..10354f1ed9d
--- /dev/null
+++ b/meta/recipes-extended/parted/files/0001-fs-Add-libuuid-to-linker-flags-for-libparted-fs-resi.patch
@@ -0,0 +1,34 @@
+From 1fc88332f7e906294fd889287b9e84cefc7f1586 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 12 Jun 2023 10:40:07 -0700
+Subject: [PATCH] fs: Add libuuid to linker flags for libparted-fs-resize
+ library
+
+This library uses uuid_generate function which comes from libuuid and
+hence it should be mentioned on linker cmdline
+
+fixes
+| aarch64-yoe-linux-ld.lld: error: undefined reference due to --no-allow-shlib-undefined: uuid_generate
+| >>> referenced by /mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/fatresize/1.1.0-r0/recipe-sysroot/usr/lib/libparted-fs-resize.so
+
+Upstream-Status: Submitted [https://alioth-lists.debian.net/pipermail/parted-devel/2023-June/005873.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libparted/fs/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libparted/fs/Makefile.am b/libparted/fs/Makefile.am
+index 2f345f3..a8970eb 100644
+--- a/libparted/fs/Makefile.am
++++ b/libparted/fs/Makefile.am
+@@ -75,6 +75,7 @@ libparted_fs_resize_la_LDFLAGS =		\
+ EXTRA_DIST += fsresize.sym
+ libparted_fs_resize_la_DEPENDENCIES = $(sym_file)
+ 
++libparted_fs_resize_la_LIBADD   = $(UUID_LIBS)
+ libparted_fs_resize_la_SOURCES = \
+   r/filesys.c			\
+   r/fat/bootsector.c		\
+-- 
+2.41.0
+
diff --git a/meta/recipes-extended/parted/parted_3.5.bb b/meta/recipes-extended/parted/parted_3.5.bb
index f403840d3c2..b269c143b41 100644
--- a/meta/recipes-extended/parted/parted_3.5.bb
+++ b/meta/recipes-extended/parted/parted_3.5.bb
@@ -9,6 +9,7 @@ DEPENDS = "ncurses util-linux virtual/libiconv"
 SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://fix-doc-mandir.patch \
            file://autoconf-2.73.patch \
+           file://0001-fs-Add-libuuid-to-linker-flags-for-libparted-fs-resi.patch \
            file://run-ptest \
            "
 
-- 
2.41.0


