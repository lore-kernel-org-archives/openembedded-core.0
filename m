Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD6FC18E7C
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 20:56:50 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.19970.1740517004270261391
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 12:56:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=edDiqOIB;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fbfa8c73a6so11982858a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 12:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740517003; x=1741121803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dbEkiJQRvVGvexlWumXNWkO0oNUQo/IXFpe18YTFd+0=;
        b=edDiqOIB6+G0Xt1ODhD0Zv8jAbP47cM/Dt8TTf2w3+MMiqNVs5ZOt4EcGLGQdcYE4l
         X5/cvTd3ptkmNuNYhWmTbShAg1UNBJ+UkpTAgoL99qiEy2TnnweErodquhhfg3DZTsua
         9qiGux6bVf10TZoEDOvkW3B5SZmj3e8OCNEV0wO+BYjlXf3bQuLY5fg97XfPWpIoOSlt
         YJqmm/KNE8YTH0pjP8NVSdoJ9ohL4KPbmN9om6AdW7Vb2QvClUOKrNrJV7cKlEXLUhcH
         0+ZlxK9pS3irzZzIUXehYWMhnuQWOiY/3+/bcPWTW0Td758mGYvM2q+dvWgeCVG7OxwK
         4/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740517003; x=1741121803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbEkiJQRvVGvexlWumXNWkO0oNUQo/IXFpe18YTFd+0=;
        b=aLwNHqgSEpzxF/9hhPUN8TDSWPeNTRGF4P+kGpPGrRkF4fD5r2InsXBZngQZYGjd1N
         5Aatis6MH/nG32BpxV9IVBRPR6GOA+st5fn8u8UmFUBB0WWxyF5wWkYkZIcr/wrwgZCc
         X5cC4B+EiN7SD6wpYabYzz6AJt5LHsN/gVG+wXZbsE6nPRHahW7H5JYtCoijD05hNOaO
         1t17k3Rpu9l/k3UyXyMe7KPCh+K8bem6oGkBwmdsn1uPfi2fBQuTRr0DxRZ9/FmWS2G4
         9kvWIJ2Y/C7OH1qd2hfg9QSjR2wACLxKFeo7+fqi4K6WnpNG3GNLyekPGoQX2y8mkUBf
         5USg==
X-Gm-Message-State: AOJu0Yxxvovg1rC/hDiwPxR8xW3GmQwK143NwHv/Hzc7YcNxBuLCP9s6
	CozGdLh3KLiAUtXmdCZBO57gWiLUWi/D5IfL3JYKhPSDZmR6nIoxQlqGpgmk88xGT+k6mkd+lIA
	i
X-Gm-Gg: ASbGncvL2PzMFMaxfcAC6IwP7RSkj3Pyxc5Oajmm4XLelmXfNckfwUNV3+pBFOp0YN5
	NJc4AbHDXIyOwxnWVhoCkV2xDZb+rjM96lLBezZMJ2B2/JRuuV523lF1mGuy89xszlqKY6GgNC5
	lj4vm7IvREzUc7Pq23uW9SC//Q7OCMfYZzT0ewcjhzWcm1BpWvhEvz1TPzywYWGEeXrNhsMG/VP
	0DUqBDt2Z0twm4sEXczLezeBEZckHnCHWwFy6YDRuJ2JwgDm1jlbJQ4jmoSZsWqWMJ0MWBJfDEH
	xQdg/E4FhblXe2ryZA==
X-Google-Smtp-Source: AGHT+IHssDdzJbIv9szohzcFmQBM/6cCXBQzj9BV/RcMTva7n6Xiz97woe6XUr30g8pIZaDC6/1f0g==
X-Received: by 2002:a17:90b:2242:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-2fce868c4f9mr32649158a91.7.1740517003396;
        Tue, 25 Feb 2025 12:56:43 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb02d9b4sm10083810a91.6.2025.02.25.12.56.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:56:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/10] u-boot: fix CVE-2024-57256
Date: Tue, 25 Feb 2025 12:56:26 -0800
Message-ID: <21e6ac6e53112b9dddc5a84f27be5851469b9c46.1740516861.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740516861.git.steve@sakoman.com>
References: <cover.1740516861.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 20:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211927

From: Hongxu Jia <hongxu.jia@windriver.com>

An integer overflow in ext4fs_read_symlink in Das U-Boot before 2025.01-rc1
occurs for zalloc (adding one to an le32 variable) via a crafted ext4
filesystem with an inode size of 0xffffffff, resulting in a malloc of
zero and resultant memory overwrite.

https://nvd.nist.gov/vuln/detail/CVE-2024-57256

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../u-boot/files/CVE-2024-57256.patch         | 51 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57256.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2024-57256.patch b/meta/recipes-bsp/u-boot/files/CVE-2024-57256.patch
new file mode 100644
index 0000000000..78cf4ac225
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2024-57256.patch
@@ -0,0 +1,51 @@
+From 49cab731abe7a98db4ac16666e3b5ab3bc799282 Mon Sep 17 00:00:00 2001
+From: Richard Weinberger <richard@nod.at>
+Date: Fri, 9 Aug 2024 11:54:28 +0200
+Subject: [PATCH 3/8] ext4: Fix integer overflow in ext4fs_read_symlink()
+
+While zalloc() takes a size_t type, adding 1 to the le32 variable
+will overflow.
+A carefully crafted ext4 filesystem can exhibit an inode size of 0xffffffff
+and as consequence zalloc() will do a zero allocation.
+
+Later in the function the inode size is again used for copying data.
+So an attacker can overwrite memory.
+
+Avoid the overflow by using the __builtin_add_overflow() helper.
+
+Signed-off-by: Richard Weinberger <richard@nod.at>
+
+CVE: CVE-2024-57256
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/35f75d2a46e5859138c83a75cd2f4141c5479ab9]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ fs/ext4/ext4_common.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/fs/ext4/ext4_common.c b/fs/ext4/ext4_common.c
+index f50de7c0..a7798296 100644
+--- a/fs/ext4/ext4_common.c
++++ b/fs/ext4/ext4_common.c
+@@ -2188,13 +2188,18 @@ static char *ext4fs_read_symlink(struct ext2fs_node *node)
+ 	struct ext2fs_node *diro = node;
+ 	int status;
+ 	loff_t actread;
++	size_t alloc_size;
+ 
+ 	if (!diro->inode_read) {
+ 		status = ext4fs_read_inode(diro->data, diro->ino, &diro->inode);
+ 		if (status == 0)
+ 			return NULL;
+ 	}
+-	symlink = zalloc(le32_to_cpu(diro->inode.size) + 1);
++
++	if (__builtin_add_overflow(le32_to_cpu(diro->inode.size), 1, &alloc_size))
++		return NULL;
++
++	symlink = zalloc(alloc_size);
+ 	if (!symlink)
+ 		return NULL;
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index e907edd2eb..097ef685e9 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -17,6 +17,7 @@ SRCREV = "866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e"
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master \
            file://CVE-2024-57254.patch \
            file://CVE-2024-57255.patch \
+           file://CVE-2024-57256.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.43.0


