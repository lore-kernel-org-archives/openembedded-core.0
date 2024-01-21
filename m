Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2323FC47DD9
	for <webhook@archiver.kernel.org>; Sun, 21 Jan 2024 18:58:15 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.54358.1705863490018732924
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jan 2024 10:58:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nNPV1+5J;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6db05618c1fso2350517b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 10:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705863489; x=1706468289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=844PA1GzHm/Dd1gmu4rpYWzRoA/SQ9SVxX83Aw4iEdM=;
        b=nNPV1+5JrrkGMdbzpX2v/uAI2pE+2KyDSKqnNQ+EF2fEuydAsmGVXiO9i96r9F6tSZ
         4sufRxUNvDkztCQGNlpZRsxH4scVW1srs+2o/2Q/0i/W6U12Iw88Coppr5fvS1WwHewE
         LNVt003DDKx0/336ZjKLdzLFvZlE66p+sbfEBD+FCRrTUdUXIlSLVEwcp9HDjJV167jH
         ZhV2Az2cS7euBTriCr2uHuKQwxlVvTcekra3wv9HLsZzHzC8lpYTr8xGzuReayDHTkA5
         UtijT7J+jEppBBr0sNCJ5CnpUAfETbctWJEE08zV4kCfF0Evymej/lRylDv7y52Ow91i
         jDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705863489; x=1706468289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=844PA1GzHm/Dd1gmu4rpYWzRoA/SQ9SVxX83Aw4iEdM=;
        b=uIIbPlhjs/OQUpAYzp0Yk4De78qKExCyC9Ek11jLK0gGPvnhix7DGYuwr95EigO/kE
         SCDW5Ps93+tU3P7P44pjmIEq2pKsH9WSOKhpxXiLgnptplXLQ8EAlcRij/QlHginaoIN
         uIoGccLZU8F3bQeI3rHYyx4TjBKRAQ+EmIjCHVBxwWhdx1nEl4TrDT8BDhI14k6t7kDg
         2TaS7829ldq+kn+lkR6pQkBZZZpDFkc+QU3bLNbpt1Ympj0RNWogKANu57J294AC/odq
         T70lU7dSfR4ClUWw85y0NvX2k9vAIQ6GuyZ6wpKFjPOUGgVjhKKSCXaFERAPrkKlzWOq
         RABw==
X-Gm-Message-State: AOJu0YzWx6WDIjQXNqbUVxgNknJII8Y5ByjtMAgHYASAy9zHX3EmUceB
	cBuyMWORx0QxtOJNtoRiDDcKKzx+xFRR7u9DX1ZYMX0c7Njoc1NYv+ozsSv0RZtPILMxATRqZlq
	hJdwHCQ==
X-Google-Smtp-Source: AGHT+IGj8KiJg0mI3wEpthbq53sROzXoExzA5FMs4MaKTNOksM+7JiMqQ5C9hJrpALxXWMiEl8ZKfA==
X-Received: by 2002:a05:6a00:3901:b0:6db:ca49:9ce3 with SMTP id fh1-20020a056a00390100b006dbca499ce3mr5560205pfb.6.1705863488672;
        Sun, 21 Jan 2024 10:58:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id t187-20020a6281c4000000b006d99125b114sm8675277pfd.65.2024.01.21.10.58.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 10:58:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/6] pam: fix CVE-2024-22365 pam_namespace misses
Date: Sun, 21 Jan 2024 08:57:54 -1000
Message-Id: <9af2e012ee4483541559788dfb9510e0223daefe.1705863274.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705863274.git.steve@sakoman.com>
References: <cover.1705863274.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 18:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194099

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/linux-pam/linux-pam/commit/031bb5a5d0d950253b68138b498dc93be69a64cb

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pam/libpam/CVE-2024-22365.patch           | 62 +++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.2.bb     |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-22365.patch

diff --git a/meta/recipes-extended/pam/libpam/CVE-2024-22365.patch b/meta/recipes-extended/pam/libpam/CVE-2024-22365.patch
new file mode 100644
index 0000000000..e9e3a078e0
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/CVE-2024-22365.patch
@@ -0,0 +1,62 @@
+From 031bb5a5d0d950253b68138b498dc93be69a64cb Mon Sep 17 00:00:00 2001
+From: Matthias Gerstner <matthias.gerstner@suse.de>
+Date: Wed, 27 Dec 2023 14:01:59 +0100
+Subject: [PATCH] pam_namespace: protect_dir(): use O_DIRECTORY to prevent
+ local DoS situations
+
+Without O_DIRECTORY the path crawling logic is subject to e.g. FIFOs
+being placed in user controlled directories, causing the PAM module to
+block indefinitely during `openat()`.
+
+Pass O_DIRECTORY to cause the `openat()` to fail if the path does not
+refer to a directory.
+
+With this the check whether the final path element is a directory
+becomes unnecessary, drop it.
+
+Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit/031bb5a5d0d950253b68138b498dc93be69a64cb]
+CVE: CVE-2024-22365
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ modules/pam_namespace/pam_namespace.c      | 18 +-----------------
+ 1 file changed, 1 insertion(+), 17 deletions(-)
+
+diff --git a/modules/pam_namespace/pam_namespace.c b/modules/pam_namespace/pam_namespace.c
+index 4d4188d..d6b1d3c 100644
+--- a/modules/pam_namespace/pam_namespace.c
++++ b/modules/pam_namespace/pam_namespace.c
+@@ -1103,7 +1103,7 @@ static int protect_dir(const char *path, mode_t mode, int do_mkdir,
+ 	int dfd = AT_FDCWD;
+ 	int dfd_next;
+ 	int save_errno;
+-	int flags = O_RDONLY;
++	int flags = O_RDONLY | O_DIRECTORY;
+ 	int rv = -1;
+ 	struct stat st;
+ 
+@@ -1157,22 +1157,6 @@ static int protect_dir(const char *path, mode_t mode, int do_mkdir,
+ 		rv = openat(dfd, dir, flags);
+ 	}
+ 
+-	if (rv != -1) {
+-		if (fstat(rv, &st) != 0) {
+-			save_errno = errno;
+-			close(rv);
+-			rv = -1;
+-			errno = save_errno;
+-			goto error;
+-		}
+-		if (!S_ISDIR(st.st_mode)) {
+-			close(rv);
+-			errno = ENOTDIR;
+-			rv = -1;
+-			goto error;
+-		}
+-	}
+-
+ 	if (flags & O_NOFOLLOW) {
+ 		/* we are inside user-owned dir - protect */
+ 		if (protect_mount(rv, p, idata) == -1) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-extended/pam/libpam_1.5.2.bb
index 0799102f8e..20745aa837 100644
--- a/meta/recipes-extended/pam/libpam_1.5.2.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://github.com/linux-pam/linux-pam/releases/download/v${PV}/Linux
            file://pam-volatiles.conf \
            file://CVE-2022-28321-0002.patch \
            file://0001-pam_motd-do-not-rely-on-all-filesystems-providing-a-.patch \
+           file://CVE-2024-22365.patch \
            "
 
 SRC_URI[sha256sum] = "e4ec7131a91da44512574268f493c6d8ca105c87091691b8e9b56ca685d4f94d"
-- 
2.34.1


