Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5000EC19778
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:30:22 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.9023.1740493814467814936
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:30:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0nfGczqK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-220d28c215eso88055245ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740493814; x=1741098614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVTFiAxU8ESXH6WNakAI+4VvCK0G8wpO/RDY8YUY/Jc=;
        b=0nfGczqKkBjESYmumNlBZl8xnQDRh5K8o3Ae0vYPiNvzQmjIn5eFO8oRdf9rtOWKss
         HPpeqOwb6uXxIPBauybolBSp3R2NpF3yORA679yw+PavbvBpLYuFK2QVPKfdBCN3avTk
         hUeYXvlhw6gyrMah2STWe7Wlj7ptpfFQJlnmtfL6VV85aPry5w7CW2VOrHSH++lGVqbd
         XrlYilMUQ/XOGMSUcglzyoWZxwmjRve93QAL8V+AkBVV4OFz60ep4VEgIdGkyZYewRE3
         vCA7sYaIvCgLH++H8R5NxF0SEkrkyGCpiuBNlfpPRsYMnQGaSGs8usCKhIPObcNvg8nF
         buRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493814; x=1741098614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVTFiAxU8ESXH6WNakAI+4VvCK0G8wpO/RDY8YUY/Jc=;
        b=hg8cWmypHU8FlGE1TNX2JjvPcxdnk73cjGkGTUnrKrqU7hS0la/Um+Y50HqF2qcjLU
         ttC/tvptoWH3XPrz1mJoHajY4vOkZVKEb6PL3EE/N5yxmDygvky+2EvZESCGXFC++S20
         RWCWKYzQqU/RZ63VdK7qErlLbHizUhVLT1R9p7GaUFfWEpky7V17WCg5N1k54U9QNDQZ
         xRFjdK+/6b0kUWBcC/5Gu8/hXv/gI5UH6nfWWXN6PhUl5lTkmhnek8sjk8PJ66QKc4sl
         RhEnZjICr39Bro+29f7tX2mHnAJ+BvUi/ZkQT3VfhAUdnIS/HVVIkeb8tEYkQ4zhr0gu
         Sn6g==
X-Gm-Message-State: AOJu0YwWL39vSgCGmHnh1AeCVj/QZ90w0gyhZWBgEOr59a0/Dq3lr6S+
	mCgJWw6DxsWwYTZnweTOYr7Vz5j3/XUJTvhqLqVRtzda8U55whckB9wPgzDRG/zf8JiHSrZIFYX
	W
X-Gm-Gg: ASbGnctGd36dIDAnDNLWNH2/u6sVPitEc1lyOk+DIuViNRzJ3hkXvvzXIRhSwXddN8D
	sj4zzUomYdpcJpPQqG53n20VXmQ0FtHdztIYf1OsVpjfEwPIDy/e/tIcnE+JOKV+4TIn0JQoZ7H
	zvLZVZZKIHLi3VznU7ilL35FSCON4FZtUmKSAoyZEXefm3AIA/Ea+cuVec1K+MSk5ZImaCCVbNM
	6Q2ofvQPiWfs9lgXObqKkN6XbmzeTIBzUSBzdokRA0qjSGVYKOKGOUHcxQGFFesr361hh72lUP1
	B40hwgxb2pioQNOvZQ==
X-Google-Smtp-Source: AGHT+IHE2qkFtEDM6CjJiOPvc9yTeHeCHP1Ze0D516G9uB1gazdrQXe1BivIvJfIdI4r2JSkl24wfw==
X-Received: by 2002:a05:6a00:1145:b0:730:74f8:25b6 with SMTP id d2e1a72fcca58-734790c8c32mr5306675b3a.6.1740493813534;
        Tue, 25 Feb 2025 06:30:13 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ed10sm1535650b3a.129.2025.02.25.06.30.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:30:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/22] u-boot: fix CVE-2024-57256
Date: Tue, 25 Feb 2025 06:29:40 -0800
Message-ID: <534aa63726f31241e3a9d4aa70d4005fa0300133.1740493685.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740493685.git.steve@sakoman.com>
References: <cover.1740493685.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211890

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
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |  1 +
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
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index cfe36256f3..c643fb35f3 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -13,6 +13,7 @@ SRC_URI +=       " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://CVE-2022-2347_2.patch \
                    file://CVE-2024-57254.patch \
                    file://CVE-2024-57255.patch \
+                   file://CVE-2024-57256.patch \
                  "
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.43.0


