Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0460BC021BB
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 20:56:50 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.19952.1740517008792675277
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 12:56:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GQsNzY9A;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2fa8ada6662so12001833a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 12:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740517008; x=1741121808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k35+yDCoj/NO1SJ5B7NyXM5nsiayhurrbygb4jHOzF4=;
        b=GQsNzY9AX+eqfzVvvX1mPK5fm1kbyFYg1TKMWrMWvsqBJpCZTOwfFH5en8bip6aQXm
         hjWcrfXsCCYUjFwqNat5kB/o4lE7QJa91DBGEyjfpTw4dA7jOOPhrQsSgaIIpjMCEQP/
         rV6XdGvwFcIbyjU8c+oteibZdKEWV35NMNJoax4nFnB2TjltgM6HJYT4sUiZHCCQr7Rl
         AjSVIrfId2ZIm9gqaMwNBzstpqUZI7e4wPQu0ACWGzg14zLpPCjFLfGLyxJWWK8b2W9d
         8GkhafB2j/S5ai4o/NG3O/rveJqMlsJfBJZdvhLrU9tEohkH32cWOUi0a4PsRxaicgKs
         7WMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740517008; x=1741121808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k35+yDCoj/NO1SJ5B7NyXM5nsiayhurrbygb4jHOzF4=;
        b=O+G2whcaB0YDzfqYUenjAsGfoBXM3jYJU8L5SsaM7/AZKS6GQ+rWWtLnJV8qKyqCYx
         GasQUeNsjunZs1SooToRVjO3h0JcXuMkZiZ0IfjJA29LgY6JHXjZ6+mvwuc0nP+1Ltci
         SN22lNsoiWhUCivt6ctwMZoIqLJdLwtwflUFgXiN6yYtKdOcucxgD9xb7atxjB65m6dx
         pEgZKbUA0CjKiDFdMCYfhQRRFQdgOeA9GFRkB0qKT/yzoerIiArUbEsWvRhQwysHlR79
         1fk3g6azErVo7gTdkJrz0lw4gY0y4/L+HJ51Jb4+HwOTdzX8Tq/44NszEPMGQTjLcTYz
         Yc3w==
X-Gm-Message-State: AOJu0YyzpPiqR0/fge94ELd1YpH/DuZCJigtg4QQa5kD30htVPmPVwcO
	k+h73vlq1Wz3vE7UUiDoyjMVM2nX9UvOZhkPW6l73i4O53KTZBuv4V/PFLsAYrO6ld3sTk/ahr8
	R
X-Gm-Gg: ASbGncth8ghIj+ODQPKYP3IRjFHatYV2krkXODlcXcx/gyjKB4kRrpGTIRHR84wh9FB
	4hQY7AHTRjqQXMvImml/jLydQMvOKQRfUwQh85E2xyjqvryvUmbR48TGgUMnHYitoeMPysIb26r
	uHslqh79zJdaPnipJVUNhEftZfHO78JxGLaxI8fZCgQ7g7vrh7jIqt0J1LR4/9WXPnkVuXqHUvo
	uqyJywWW+1oO3YKDlRv/Ht1ffkH2GU49AspD1CMYjYukaHZcsB2sIpIhkLcp/5mlYXmL/1xem+g
	n0iroGfBsU9UeRiD2g==
X-Google-Smtp-Source: AGHT+IHaKMzqNJlfUGsgbvLjySAa9mbuBLTXF6LDunv5QKRGhetKY0rVC88OsbB4uYX73qVwKHocQg==
X-Received: by 2002:a17:90b:548f:b0:2ee:5958:828 with SMTP id 98e67ed59e1d1-2fce86adf6cmr33130477a91.9.1740517008039;
        Tue, 25 Feb 2025 12:56:48 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb02d9b4sm10083810a91.6.2025.02.25.12.56.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:56:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/10] u-boot: fix CVE-2024-57259
Date: Tue, 25 Feb 2025 12:56:29 -0800
Message-ID: <8fad176e6258a44d1ba1eed224cd27745b6a57cf.1740516861.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740516861.git.steve@sakoman.com>
References: <cover.1740516861.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 20:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211930

From: Hongxu Jia <hongxu.jia@windriver.com>

sqfs_search_dir in Das U-Boot before 2025.01-rc1 exhibits an off-by-one error
and resultant heap memory corruption for squashfs directory listing because the
path separator is not considered in a size calculation.

https://nvd.nist.gov/vuln/detail/CVE-2024-57259

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../u-boot/files/CVE-2024-57259.patch         | 41 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  1 +
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
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index d3af17f82b..3a48b63c42 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -22,6 +22,7 @@ SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master \
            file://CVE-2024-57258-1.patch \
            file://CVE-2024-57258-2.patch \
            file://CVE-2024-57258-3.patch \
+           file://CVE-2024-57259.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.43.0


