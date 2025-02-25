Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1590CC021BE
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 20:56:50 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.19951.1740517002791022137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 12:56:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MbsK7YTX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-221050f3f00so138647515ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 12:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740517002; x=1741121802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufnRetGq+/k2JheWvltkVw7DJrLIOlqBA1PUuAgPrvY=;
        b=MbsK7YTXuFvkJcodq1KKzSm1RPlYBMGd/vGVy3/UnBMogk8FMXLHvGzE2/ElAmMjJD
         p+PsgrJIIkJ/aeKoj5T/qggR/zJ4TbwamPeLKfUEU/5pzZoK/j6aJLps2qpjvRt5bg68
         ucCyIgY8EOsrTdKH+Hdl/8wxy4Xh90xsbRkjKfCTLE6ip3x48Fb78tLt2e8iyH07WwEJ
         IyxYd18BXYv9EPK0c+h9ciB5RKEVm6Y9dfJd7PNk7lTqDqxTeYfOOrePIP1pFybRWua0
         Ad1tIdBiMyTatM530CKD9UMqmExyX4V0uvQacnqkhQmQw6gB8O5vYLyqiGbDc7EyL6Gz
         VLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740517002; x=1741121802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufnRetGq+/k2JheWvltkVw7DJrLIOlqBA1PUuAgPrvY=;
        b=pH4/r3HOGA77N2K4D6ei2PXwlegCfeDMqIQY8cPF7l+buYPb+ytvro2w6Rqs/uHqvl
         vsqt9cDHHxPn+NWZnup19QXBOFQZ4YC4tt6ssm3gnwdbytEuGy9i9aWwKLrNTEUgZkSa
         kDg0SP/HS1h5ZAkHq9AVBvjLLtSUoRW+ijHF2AqKkgGEQb5JkgqlpfnpWQ4Oj8yxT1xQ
         yMF5QhDc/tQVgGUcvMqGerZZkiqGs/B2sHrKbQmE8gXQsCc28MpS+VwxlW/e5zGG0cex
         g9Uuj9EWpH/C3Tnp5XH8FVOEKYr7Jjq3E71WzXSkBJqidcGalcrQx+/xxO1C/+UA6Ig8
         XXHw==
X-Gm-Message-State: AOJu0YwDfuQicvD4/jBqmhduNwN++TAiXziovsGfVR4Qv70M5xLIPBJf
	G3TIj6LITJUcmeNsgRFgEafkx0IpalNVVyZ5x7mLRcijRSnf0xZEGzLargjzLMPWku8yqYaKL7n
	T
X-Gm-Gg: ASbGncvx5CSoZ94Y0+a3AYZz+xVX1AZTrjdRnbGOkrRb8stdDzSs4KAyKcmHq25Jk+9
	KsNpoZkyVGRM58Jaw9tkRR2M1JgTfUSgfZjrVuWpAx+Jjv3gL7dt/IbbcORXAY3KTIc9q0yIZkc
	x1jJgDWE/mtk4tRduW68oZJT0ULJVqRn8BQEmZ4PGLK3vRQNni7GEUFmpXBjMz9fiEZgV9uAI96
	sjLS4SjqgnuWQsUIWGH/rxFo7GVgTk+kK3UHZCqp86V99Q3Yl/agoXA4AFqUV8QTtb0GDOaEtqC
	U42A5iThfkGe9DMajg==
X-Google-Smtp-Source: AGHT+IF/zUS8qqXeLOasXJ0MeBu5/ga9jsI7oUTJ5BoNG1jyS0AbTXEDVd7uUUFbKbyNxdS8QBhjCg==
X-Received: by 2002:a17:90b:2dc6:b0:2fa:1e3e:9be5 with SMTP id 98e67ed59e1d1-2fe68a2df32mr8908374a91.0.1740517002057;
        Tue, 25 Feb 2025 12:56:42 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb02d9b4sm10083810a91.6.2025.02.25.12.56.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:56:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/10] u-boot: fix CVE-2024-57255
Date: Tue, 25 Feb 2025 12:56:25 -0800
Message-ID: <c3784c108f003c6663ca969585414e4a90f06606.1740516861.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740516861.git.steve@sakoman.com>
References: <cover.1740516861.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 20:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211926

From: Hongxu Jia <hongxu.jia@windriver.com>

An integer overflow in sqfs_resolve_symlink in Das U-Boot before 2025.01-rc1
occurs via a crafted squashfs filesystem with an inode size of 0xffffffff,
resulting in a malloc of zero and resultant memory overwrite.

https://nvd.nist.gov/vuln/detail/CVE-2024-57255

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../u-boot/files/CVE-2024-57255.patch         | 53 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57255.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2024-57255.patch b/meta/recipes-bsp/u-boot/files/CVE-2024-57255.patch
new file mode 100644
index 0000000000..4ca72da554
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2024-57255.patch
@@ -0,0 +1,53 @@
+From 5d7ca74388544bf8c95e104517a9120e94bfe40d Mon Sep 17 00:00:00 2001
+From: Richard Weinberger <richard@nod.at>
+Date: Fri, 2 Aug 2024 18:36:44 +0200
+Subject: [PATCH 2/8] squashfs: Fix integer overflow in sqfs_resolve_symlink()
+
+A carefully crafted squashfs filesystem can exhibit an inode size of 0xffffffff,
+as a consequence malloc() will do a zero allocation.
+Later in the function the inode size is again used for copying data.
+So an attacker can overwrite memory.
+Avoid the overflow by using the __builtin_add_overflow() helper.
+
+Signed-off-by: Richard Weinberger <richard@nod.at>
+Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
+
+CVE: CVE-2024-57255
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/233945eba63e24061dffeeaeb7cd6fe985278356]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ fs/squashfs/sqfs.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/fs/squashfs/sqfs.c b/fs/squashfs/sqfs.c
+index 1430e671..16a07c06 100644
+--- a/fs/squashfs/sqfs.c
++++ b/fs/squashfs/sqfs.c
+@@ -422,8 +422,10 @@ static char *sqfs_resolve_symlink(struct squashfs_symlink_inode *sym,
+ 	char *resolved, *target;
+ 	u32 sz;
+ 
+-	sz = get_unaligned_le32(&sym->symlink_size);
+-	target = malloc(sz + 1);
++	if (__builtin_add_overflow(get_unaligned_le32(&sym->symlink_size), 1, &sz))
++		return NULL;
++
++	target = malloc(sz);
+ 	if (!target)
+ 		return NULL;
+ 
+@@ -431,9 +433,9 @@ static char *sqfs_resolve_symlink(struct squashfs_symlink_inode *sym,
+ 	 * There is no trailling null byte in the symlink's target path, so a
+ 	 * copy is made and a '\0' is added at its end.
+ 	 */
+-	target[sz] = '\0';
++	target[sz - 1] = '\0';
+ 	/* Get target name (relative path) */
+-	strncpy(target, sym->symlink, sz);
++	strncpy(target, sym->symlink, sz - 1);
+ 
+ 	/* Relative -> absolute path conversion */
+ 	resolved = sqfs_get_abs_path(base_path, target);
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 9ce42e829f..e907edd2eb 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -16,6 +16,7 @@ SRCREV = "866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master \
            file://CVE-2024-57254.patch \
+           file://CVE-2024-57255.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.43.0


