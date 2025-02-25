Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FC5C021BC
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:30:22 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.9091.1740493818738498199
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iFBtqIIR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220f4dd756eso119589025ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740493818; x=1741098618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFAjsHoOKkxPIio2VfQfvyFuG8NB3zno4fJKDG4UCd4=;
        b=iFBtqIIRoR/QIUZDH8LgAB5u/7n5aL6MLfFJc9tPSJe6kEg2VTFCOHzNVkLvdVlr45
         TTw0re8PzCvmyASWJAEmhjlLt/J20v2IqdqfH17DX/UP442f79ZrQ+806qTeKmU0i7h/
         Ms2deAHunp63ZAcxYvBwByhmT8jMxInjm/fgtNNEr/8kPfgNPHx4oj7oFS203bXTfZ2R
         9Lvibg+ASxY8ipp+AIbW/eJozfZ8J98g07TYMedWJOWnMLGp0nX2kEn0YnpKKxQGhGo+
         BJ501gzQPheV0re77m179wXE1Rc1QIIgs0yBcabxZjbaWb6kbYW2A3RP7qgFP+gdpAsu
         I8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493818; x=1741098618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFAjsHoOKkxPIio2VfQfvyFuG8NB3zno4fJKDG4UCd4=;
        b=M6JaBK0Gih3kM0uInaduOrVPCizEJsCwSpPUJTn5TsUhSuQBBCwVX/dCdBtNIs+mXu
         WP342no1OToexmC0do4dEz7uXvEktNdPCkAXFUntKwjHc7uffahn2AL8GrP7wpoaVpgo
         USriNUR10lQ/ntGXAh/TcbMkZkXbcXv+S6Ewsd8g1N2AvGAGry20dbtsIqNizSO6w6wm
         lyI0rd9aSRd5WBjae/u60zq9xJfds0KrcAa+Uov455x4sZ4pAroYyq5g7Sgjp+r7S9qh
         sMcDrZPW9ZC9yu74d+p4DsbfIzYnYGPYY+k91tEEUXIqKdWvTC7Qeu2RsQJYvGiUPZbm
         Z8Jg==
X-Gm-Message-State: AOJu0YzoGQknT0QUKYSy3vh5OEsTTNelvddCd5/cLdWkXVCFbsQfUlOu
	2ZiA0MBNkq0XfGefmMZv2iVeQJic2AZ5ahGSTtRrrwyMH52+YeI2U0E7o63fnsZFGgkN6hGRd7G
	o
X-Gm-Gg: ASbGnctVEGelwXae2BJ7cAV0EO12nCIlAUB6PITnwYNar3MuxpLap1/esm8gU2YpbOp
	zxGnk1mkZNX23yqt3HP3eIDJC0Jr/NOgIR1AeM0nU/6c7+uaAM7s44ztqjVaVeb7LcmQxn1T1LV
	ZVn5p4aRUZU3MaCU4gzHcvEwpT7J2fZE81JxHj0PTCFvbQMfW6NSoqArHGeGoLYZvDhTKoTIpi0
	Q1DgckeF+c8r9IKFh3tN1IrUl66z+9eXdxWx+tq9EwW0ULScua/Q/0N6EZ2tkzeBeJcu9CvGtV6
	ErHHM4R4tNLiM/lMqA==
X-Google-Smtp-Source: AGHT+IGRMsBxK/+0Yg6JyR0367s2oMd9yD5ZzfkMvwB7MZ9ou2Tg43+bBJ3ISyTzYV1AXj/fHKXgQQ==
X-Received: by 2002:a05:6a00:230b:b0:734:9cc:a6e4 with SMTP id d2e1a72fcca58-734791ab6bfmr6312350b3a.21.1740493817836;
        Tue, 25 Feb 2025 06:30:17 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ed10sm1535650b3a.129.2025.02.25.06.30.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:30:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/22] u-boot: fix CVE-2024-57259
Date: Tue, 25 Feb 2025 06:29:43 -0800
Message-ID: <e4b713ff07695487cc9307ffc3576a11775cde4d.1740493685.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740493685.git.steve@sakoman.com>
References: <cover.1740493685.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211893

From: Hongxu Jia <hongxu.jia@windriver.com>

sqfs_search_dir in Das U-Boot before 2025.01-rc1 exhibits an off-by-one error
and resultant heap memory corruption for squashfs directory listing because the
path separator is not considered in a size calculation.

https://nvd.nist.gov/vuln/detail/CVE-2024-57259

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../u-boot/files/CVE-2024-57259.patch         | 41 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57259.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2024-57259.patch b/meta/recipes-bsp/u-boot/files/CVE-2024-57259.patch
new file mode 100644
index 0000000000..fdf5fdfce4
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2024-57259.patch
@@ -0,0 +1,41 @@
+From 2c08fe306c6cbc60ec4beb434c71e56bb7abb678 Mon Sep 17 00:00:00 2001
+From: Richard Weinberger <richard@nod.at>
+Date: Fri, 2 Aug 2024 22:05:09 +0200
+Subject: [PATCH 8/8] squashfs: Fix heap corruption in sqfs_search_dir()
+
+res needs to be large enough to store both strings rem and target,
+plus the path separator and the terminator.
+Currently the space for the path separator is not accounted, so
+the heap is corrupted by one byte.
+
+Signed-off-by: Richard Weinberger <richard@nod.at>
+Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
+
+CVE: CVE-2024-57259
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/048d795bb5b3d9c5701b4855f5e74bcf6849bf5e]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ fs/squashfs/sqfs.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/fs/squashfs/sqfs.c b/fs/squashfs/sqfs.c
+index a5b7890e..1bd9b2a4 100644
+--- a/fs/squashfs/sqfs.c
++++ b/fs/squashfs/sqfs.c
+@@ -563,8 +563,11 @@ static int sqfs_search_dir(struct squashfs_dir_stream *dirs, char **token_list,
+ 				ret = -ENOMEM;
+ 				goto out;
+ 			}
+-			/* Concatenate remaining tokens and symlink's target */
+-			res = malloc(strlen(rem) + strlen(target) + 1);
++			/*
++			 * Concatenate remaining tokens and symlink's target.
++			 * Allocate enough space for rem, target, '/' and '\0'.
++			 */
++			res = malloc(strlen(rem) + strlen(target) + 2);
+ 			if (!res) {
+ 				ret = -ENOMEM;
+ 				goto out;
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index cdee9fc721..0ff2477c39 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -18,6 +18,7 @@ SRC_URI +=       " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://CVE-2024-57258-1.patch \
                    file://CVE-2024-57258-2.patch \
                    file://CVE-2024-57258-3.patch \
+                   file://CVE-2024-57259.patch \
                  "
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.43.0


