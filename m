Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB29C0015E
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:30:04 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.3857.1688092197556209305
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Y4DCUnhM;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.181, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7654e1d83e8so121444785a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092196; x=1690684196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uxpLQvJQHp5vg41RIrsIEyTbkMqpvhTUwgf54l4WYM=;
        b=Y4DCUnhMyPIf5+dgyurBqIQod/XsNgELNzzJAqDsqGc11pIaad523OgcExywBKHTQM
         nzQAOQqew3JyrCozT923isxxbULs329aRytgfha/7cwkU/txLeWaAL4m/Wmm4XmS4csx
         4C5LCBxa4xMxy0PSHwmquv/DHmePT8Vcfs1jZoA4ojnNFLp+fxW5EDUSgVmVBdS2ZZDo
         RQ4hMQzFCIACzUwGOR1aAsxIEjkjDmxqhDeO7laefbiJD3z+7JViAgKRAyfgMnpWRsNq
         AtLXRA/9umN4GtLQ42NiAXhx+rUnwIHjUHYED14B2pe7aLnBmqvPKDu3SEXJ0hE9mxDg
         Gvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092196; x=1690684196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/uxpLQvJQHp5vg41RIrsIEyTbkMqpvhTUwgf54l4WYM=;
        b=MJUn/vxM17ZGjz0poWSY66YSNXV7L7Th9nYOC0drMtxNBA2tUGRx0/BOCLE12FR8zE
         VaIj0cxP49f29JMpRSvNBetP1fwQ9db6t18+rYuDDFrgxjhwo12bja+9nj7dI5nuf+AA
         1dT8ZHsHfarPJ+krb7nd1b6SjJ2Jbh3xEPeULgVoFBltgS8v0MOwGxuR/wBRJzbrjMZR
         bN9DL/U2N6mSag9w+OtdZWw/e66k9o8F9cqsoVNrQfYgJk7HdDIus7woZhW8gGLGSIZv
         eyDzFj+CSEJp1Ngj9mF8NdPWeUQwarHs6wWBWwaAHDzUQw80t/7zT/ujl2G2iP8CSnv2
         aEIg==
X-Gm-Message-State: AC+VfDwzMs6ZrwEFghvVnWppMbMpe2iePzDWdAn2LQOYcnEcJcYndaui
	zMu0L4SGVDt/AbYl49kqz3cv/YMotkdulf2jI70JQg==
X-Google-Smtp-Source: ACHHUZ6h/EylnSpjh23LRKczTPbcdI0Bivi7RiCrfgu09+8symUTalMi1hU5m5pKqpbbLiu3ZQgs4g==
X-Received: by 2002:a05:620a:8896:b0:75b:23a1:364b with SMTP id qk22-20020a05620a889600b0075b23a1364bmr1051989qkn.12.1688092196305;
        Thu, 29 Jun 2023 19:29:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 27/30] parted: Add missing libuuid to linker cmdline for libparted-fs-resize.so
Date: Thu, 29 Jun 2023 16:29:03 -1000
Message-Id: <8e42a4364921fabccf0f1c4bc4e661da72c82d06.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183667

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 493b6a17ede8033be11eb61aef347f6f5df42f7d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...o-linker-flags-for-libparted-fs-resi.patch | 34 +++++++++++++++++++
 meta/recipes-extended/parted/parted_3.5.bb    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/parted/files/0001-fs-Add-libuuid-to-linker-flags-for-libparted-fs-resi.patch

diff --git a/meta/recipes-extended/parted/files/0001-fs-Add-libuuid-to-linker-flags-for-libparted-fs-resi.patch b/meta/recipes-extended/parted/files/0001-fs-Add-libuuid-to-linker-flags-for-libparted-fs-resi.patch
new file mode 100644
index 0000000000..10354f1ed9
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
index ea2b68bbd8..ca35852eb0 100644
--- a/meta/recipes-extended/parted/parted_3.5.bb
+++ b/meta/recipes-extended/parted/parted_3.5.bb
@@ -8,6 +8,7 @@ DEPENDS = "ncurses util-linux virtual/libiconv"
 
 SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://fix-doc-mandir.patch \
+           file://0001-fs-Add-libuuid-to-linker-flags-for-libparted-fs-resi.patch \
            file://run-ptest \
            "
 
-- 
2.34.1


