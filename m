Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD2FC021BB
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:30:12 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.9082.1740493810752737043
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:30:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QZSu+YX3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22101839807so13944145ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740493810; x=1741098610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTH/Ib25q07PalQs1aAwGCYQk7kBmk6bFjKNFCk9mxU=;
        b=QZSu+YX3ujX5g9UqWGAr5VRF5lw1V+DsKUtUy4pRygtKopPaw16PgRflvDzLR8jp6z
         qjD8YmDkVpIrSNmO+yEiwBtmNFy6aZuL4bPxz7PHl8vTqzhFn7Ay9fqjX16Z3uH5BaOE
         V3TSNyKWJWs2TpYApH3R/WSEcV0HWEqmieEs6Typ+SqY3cZzaetmrD5QTFJX+Juyf0UU
         Eq+svgLxYa9rfAz743kS9gpRa1yT7pi6qvzj5Cyxc1Bk7+FSN06HS1m8F3epIiIDYUK6
         nrrwUB0KT9jeFhZTpLwjHSxYOm0fl2EAKpGFPTs0/YHTbBd4dnIDE8n3cDZQdQu4uFR8
         dhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493810; x=1741098610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTH/Ib25q07PalQs1aAwGCYQk7kBmk6bFjKNFCk9mxU=;
        b=bzWb2C1D3szmiX9cU9jnfHjZS6C4xbmPdaWleuaEH6ni8Tnrppaac3vG0mQkV4yUBr
         0IUcBitN77HIlkCymSbDjtdk95nOV0ZWmbaN99WDfMJSIe9jdbnLi33ZpRjPmm7YDj6l
         Zcaom75ZHl7cPLD+havGyousNANPtcWKfQQ+IPbZz0duchuj3Y8b344IMmgozfc4GzH3
         dsOChqereq+k/S7C59Dc3U+P7y4omUBGdQrgQKUpZ/hkzsZwsIwBnFScdE+a2TxPzN3B
         Rp6jhh1jd+Bty7KfYP9sBLMUziXO/yAuvrx59G4Wj8DO1Ho+5+jVGmUg/rpJbC45dS2I
         KiiQ==
X-Gm-Message-State: AOJu0YxqG9pojfVVo3d65dtExrDGK2IP9xz+Yh3WRGgEy1+C4TvHpmb1
	QpihbbwiSZjrzspdftnA3EQHqUhfwH2mMmkRy+k5xI9vURekOkDKW4Fd3bxcgmFrM0uiC6f4J+u
	9
X-Gm-Gg: ASbGnct2TC9IUEwHWfRHU4JC7KLTLNTmde2pZ003H5V61Gc5Fn3oomHA0FXKlumkv7M
	/XpApT2t6OrC8DPtkujpZHhiIjAg6EYs85fDI46rAkHdEUSO0h0gUXWWxE1+hLqM8YAeOks9siD
	8E/CYNAYhVI9tDxT1JXvjU+1OPIoM98tmw7yp1nasktc9ZtfyaY0GSfgE5TsFfd0YV/DMEF9fMV
	5YHOWomMxk8Lb+Tkde221fhNMk98eR/7oOP9/tPPcDK0yaygKFcCQId/RQBgwjWVuHCQEhZg2H5
	tecKn5Pes51sAaXo1w==
X-Google-Smtp-Source: AGHT+IHcEv2IOONnaX1TdRazMVceUjwEmvd03wFyEd2aksMy4Vd4TnR+9Pij8D9/m1vOQ5X+/UbLuA==
X-Received: by 2002:a05:6a00:2d87:b0:732:1bad:e245 with SMTP id d2e1a72fcca58-73426cab1ecmr28091253b3a.7.1740493809974;
        Tue, 25 Feb 2025 06:30:09 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ed10sm1535650b3a.129.2025.02.25.06.30.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:30:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/22] u-boot: fix CVE-2024-57254
Date: Tue, 25 Feb 2025 06:29:38 -0800
Message-ID: <956836ab347e9112be0f8892b1b82c4bcb17990c.1740493685.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740493685.git.steve@sakoman.com>
References: <cover.1740493685.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211888

From: Hongxu Jia <hongxu.jia@windriver.com>

An integer overflow in sqfs_inode_size in Das U-Boot before
2025.01-rc1 occurs in the symlink size calculation via a
crafted squashfs filesystem.

https://nvd.nist.gov/vuln/detail/CVE-2024-57254

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../u-boot/files/CVE-2024-57254.patch         | 47 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |  1 +
 2 files changed, 48 insertions(+)
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
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index 62ebe40cb6..d9c6fcb993 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -11,6 +11,7 @@ SRC_URI +=       " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://CVE-2022-30790.patch \
                    file://CVE-2022-2347_1.patch \
                    file://CVE-2022-2347_2.patch \
+                   file://CVE-2024-57254.patch \
                  "
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.43.0


