Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01749C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 20:56:50 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.19969.1740517001399922107
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 12:56:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hK/PhRRM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2fc4418c0e1so305226a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 12:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740517001; x=1741121801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1sNhz6B7SNuFptpSxXYMmVb+23dBr9vW3b1Z9Hi/6+M=;
        b=hK/PhRRMSIsus5vXN6ogM+fChSTwWaQaTzGTMhd6RqEYO9FmOk9kPD+p8wJPy+JXep
         j4ts9mZZnMSsZgvM/AZN7Lvokebr/XmjVtcwbyz3ucsUY+UnoZifO/Yv8Ui6ae+DBD99
         6mihZ7/Et3o1gEovohx5Ag9MLR7fcps4jXp2x2DGNiHEOom4e3d+awgdgTLnN2kqA6Y0
         5uAEqIfLKIHDt9tx+yQcVm1TVncDyjE0HSeo6231ywMlpwjG7b0EJmEOWGE0sdxZt2Nh
         I7b2xBBlsravM6LC+doVawRin00iNW2iXvGr2dhb67mUKeDbHkz1Ci/9v8aw+XtBHEWw
         brCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740517001; x=1741121801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sNhz6B7SNuFptpSxXYMmVb+23dBr9vW3b1Z9Hi/6+M=;
        b=Lnt1zM9Dg0iFrCkywm1WVelLeRKTgqQiYzR8vSqiQfHV9b/kWGnr3qtyBlVnOVUO/R
         V0K6/FTC5TrVnD6N74slTG7ksVtOufMrE8CbXChGVoiAZxENDxkQEDEAA740nZ50aroc
         LHqyOHFU2ieeLzNb13zRkqH8m4bB7DRaCb5tuFSv6uxrxWqBRu1Sg/BAcRxSH7XbQt/B
         dJ+d493Vw99VDs7+vE5liA6gTMBgq4XOH0vdAhqZtYf2UBhG5WdLXlPjqVGn5e7u0gLp
         DHvdwz0UVYS21N7pHhlaq7qnEeUBijtK78jDq0TzwmNS3dFEop64RWiKrZZbZwZsMBJz
         GsdA==
X-Gm-Message-State: AOJu0YxnuK3nB3I5fVlHY0+9SrUfsjk29BotOGH6TGWIQw85JhLpe1gc
	sNFmo8o/hIAAX8WnGx47q2KSZ8T9GVhzGqJgkS1J0bX8TBBcVPIsB0clN3/QkZFI1fFgYAybfU1
	4
X-Gm-Gg: ASbGnctZRy/rAm1VwOqgSGQ0ZnmmfTyhXTKoA5hLcAfhbT1MiOZrnDj0iLNZA+9nZ5O
	wJJ6+kCp4T40kIn6LUnTBRJMOmAabaN3oGwN7fjKZEXBzrCSmpAk6GgR+A8h/fTTT5EI/86+c2d
	UCiu4UHaXa80KhW9EP3Wl07kCHYxiAy/KFuhIWLElYxe6nCvY0za+GTNlhZ13UCSUApNf1FvIEI
	D0Hd4cFax7X7UfJdIu9JC8Cs5+NgPvDstHnlaFtcVyOihaqY5k88EcOWLhdGvCIq+9Z5DA+3dly
	5Sskv+xfq9uO2gNQfA==
X-Google-Smtp-Source: AGHT+IGUMlAswoBUm50mzaTglo1flmK6NgM66G593WaFxSyaSZk4nlLxSYK9dRGzTaekj/jrl4rHWA==
X-Received: by 2002:a17:90b:2792:b0:2fa:1e56:5d82 with SMTP id 98e67ed59e1d1-2fce7b74fbbmr30990471a91.17.1740517000666;
        Tue, 25 Feb 2025 12:56:40 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb02d9b4sm10083810a91.6.2025.02.25.12.56.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:56:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/10] u-boot: fix CVE-2024-57254
Date: Tue, 25 Feb 2025 12:56:24 -0800
Message-ID: <eea9fee59bc7576bef94f0da466887e4daff0356.1740516861.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740516861.git.steve@sakoman.com>
References: <cover.1740516861.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 20:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211925

From: Hongxu Jia <hongxu.jia@windriver.com>

An integer overflow in sqfs_inode_size in Das U-Boot before
2025.01-rc1 occurs in the symlink size calculation via a
crafted squashfs filesystem.

https://nvd.nist.gov/vuln/detail/CVE-2024-57254

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../u-boot/files/CVE-2024-57254.patch         | 47 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  4 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57254.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2024-57254.patch b/meta/recipes-bsp/u-boot/files/CVE-2024-57254.patch
new file mode 100644
index 0000000000..be00121224
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2024-57254.patch
@@ -0,0 +1,47 @@
+From 3f9deb424ecd6ecd50f165b42f0b0290d83853f5 Mon Sep 17 00:00:00 2001
+From: Richard Weinberger <richard@nod.at>
+Date: Fri, 2 Aug 2024 18:36:45 +0200
+Subject: [PATCH 1/8] squashfs: Fix integer overflow in sqfs_inode_size()
+
+A carefully crafted squashfs filesystem can exhibit an extremly large
+inode size and overflow the calculation in sqfs_inode_size().
+As a consequence, the squashfs driver will read from wrong locations.
+
+Fix by using __builtin_add_overflow() to detect the overflow.
+
+Signed-off-by: Richard Weinberger <richard@nod.at>
+Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
+
+CVE: CVE-2024-57254
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/c8e929e5758999933f9e905049ef2bf3fe6b140d]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ fs/squashfs/sqfs_inode.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/fs/squashfs/sqfs_inode.c b/fs/squashfs/sqfs_inode.c
+index d25cfb53..bb3ccd37 100644
+--- a/fs/squashfs/sqfs_inode.c
++++ b/fs/squashfs/sqfs_inode.c
+@@ -78,11 +78,16 @@ int sqfs_inode_size(struct squashfs_base_inode *inode, u32 blk_size)
+ 
+ 	case SQFS_SYMLINK_TYPE:
+ 	case SQFS_LSYMLINK_TYPE: {
++		int size;
++
+ 		struct squashfs_symlink_inode *symlink =
+ 			(struct squashfs_symlink_inode *)inode;
+ 
+-		return sizeof(*symlink) +
+-			get_unaligned_le32(&symlink->symlink_size);
++		if (__builtin_add_overflow(sizeof(*symlink),
++		    get_unaligned_le32(&symlink->symlink_size), &size))
++			return -EINVAL;
++
++		return size;
+ 	}
+ 
+ 	case SQFS_BLKDEV_TYPE:
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 1f17bd7d0a..9ce42e829f 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -14,7 +14,9 @@ PE = "1"
 # repo during parse
 SRCREV = "866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e"
 
-SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
+SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master \
+           file://CVE-2024-57254.patch \
+"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
-- 
2.43.0


