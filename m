Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E0FC54E76
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:53 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.177179.1672213058947151996
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZDNXBaZz;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id fm16-20020a05600c0c1000b003d96fb976efso8548108wmb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxCDNXEs4gHGwYDsblB3sVxnU+WsoVtqFXdnGlm0Nj8=;
        b=ZDNXBaZzRCQS8xEERJ+fSAyLfc+FZRkdpFb6TprdPIWm7LLBXYeefdm3QGb7ocuPUd
         dibBIb38OSI7Gii6v+jH8I+VjHS4IfsycVCh4GnUzgcJ5PjbrzKVViBYwKFsv9/WPoD8
         Cu73SWirA2shUNr/qB/9+IL9iQcjqKT7CKv32hyEUnOw/0SfnduhYrED8CZRcQFx4k/z
         xvp7XcdNYhcpqXOCiqDVM1ysZ8oTiRyGsuvPlcTlxqvEcZZfVPDSwNEK2+A86CHtSI6q
         gzqvZpEkd+puh2Dq+m+Qfx1XhDhBKZDYBulM/K0muxRAD/RSwi7O1chyUlrqxGsdpAy/
         3bWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxCDNXEs4gHGwYDsblB3sVxnU+WsoVtqFXdnGlm0Nj8=;
        b=IQyUb14Ria2Eb5ThpcBwxhZ2lcmuNd65Q4GXflrtCogEd2935TCBIaN8+mra20ExlF
         ohnjQ0rreO4v+Lo0b04g/jw8nTyTGTtSlOCv+fR/njGeVauREL9OOs0V0ccMEUfnMys8
         V62W10DZ9U5Hzt8xHbVna04mUe+4adZ+ZpmhkjhKo/nhmAer+AgcnWrVR1oYkFF/Z9/6
         3rQdsQ7gsDfaFtMy1u904TyltITvv+Iv8ILNNy03myx5i3lJJ7pHyXaYN8s2kSZjN/UY
         Oi8IKXCwteQrWJh9vrNuMdJuvsqVzWdOlOximT8RGo4h6cpZd5cayZ+AhEBgw86xH7Mc
         qOWg==
X-Gm-Message-State: AFqh2kpHJsAg+26pHQ0cMmzQ1av5B7qTXiA/+LS4vfDy1tqzg04kU3km
	1/1fRVlf+rtyVasFLEDksaU/Lw3+r7U=
X-Google-Smtp-Source: AMrXdXvCAy5NJax8rggxiKmPYYNeqKiRK+aaMizowgTLVChuNBs/5VEjespCpvdoiujp0NHaX/8hcQ==
X-Received: by 2002:a05:600c:1911:b0:3d9:8635:a916 with SMTP id j17-20020a05600c191100b003d98635a916mr7721611wmq.9.1672213064538;
        Tue, 27 Dec 2022 23:37:44 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:44 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/25] libarchive: upgrade 3.6.1 -> 3.6.2
Date: Wed, 28 Dec 2022 08:37:18 +0100
Message-Id: <20221228073721.3454255-22-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175060

Use --without-iconv as otherwise autotools write a bogus iconv
dependency into .pc file.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...t-include-sys-mount.h-when-linux-fs..patch | 47 ------------------
 .../libarchive/cve-2022-36227.patch           | 48 -------------------
 ...ibarchive_3.6.1.bb => libarchive_3.6.2.bb} |  9 ++--
 3 files changed, 3 insertions(+), 101 deletions(-)
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0001-libarchive-Do-not-include-sys-mount.h-when-linux-fs..patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/cve-2022-36227.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.6.1.bb => libarchive_3.6.2.bb} (89%)

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-libarchive-Do-not-include-sys-mount.h-when-linux-fs..patch b/meta/recipes-extended/libarchive/libarchive/0001-libarchive-Do-not-include-sys-mount.h-when-linux-fs..patch
deleted file mode 100644
index 0d21799682..0000000000
--- a/meta/recipes-extended/libarchive/libarchive/0001-libarchive-Do-not-include-sys-mount.h-when-linux-fs..patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From a2f68263a1da5ad227bcb9cd8fa91b93c8b6c99f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 25 Jul 2022 10:56:53 -0700
-Subject: [PATCH] libarchive: Do not include sys/mount.h when linux/fs.h is
- present
-
-These headers are in conflict and only one is needed by
-archive_read_disk_posix.c therefore include linux/fs.h if it exists
-otherwise include sys/mount.h
-
-It also helps compiling with glibc 2.36
-where sys/mount.h conflicts with linux/mount.h see [1]
-
-[1] https://sourceware.org/glibc/wiki/Release/2.36
-
-Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/1761]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libarchive/archive_read_disk_posix.c | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/libarchive/archive_read_disk_posix.c b/libarchive/archive_read_disk_posix.c
-index 2b39e672..a96008db 100644
---- a/libarchive/archive_read_disk_posix.c
-+++ b/libarchive/archive_read_disk_posix.c
-@@ -34,9 +34,6 @@ __FBSDID("$FreeBSD$");
- #ifdef HAVE_SYS_PARAM_H
- #include <sys/param.h>
- #endif
--#ifdef HAVE_SYS_MOUNT_H
--#include <sys/mount.h>
--#endif
- #ifdef HAVE_SYS_STAT_H
- #include <sys/stat.h>
- #endif
-@@ -54,6 +51,8 @@ __FBSDID("$FreeBSD$");
- #endif
- #ifdef HAVE_LINUX_FS_H
- #include <linux/fs.h>
-+#elif HAVE_SYS_MOUNT_H
-+#include <sys/mount.h>
- #endif
- /*
-  * Some Linux distributions have both linux/ext2_fs.h and ext2fs/ext2_fs.h.
--- 
-2.25.1
-
diff --git a/meta/recipes-extended/libarchive/libarchive/cve-2022-36227.patch b/meta/recipes-extended/libarchive/libarchive/cve-2022-36227.patch
deleted file mode 100644
index 4d13bf6492..0000000000
--- a/meta/recipes-extended/libarchive/libarchive/cve-2022-36227.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From bff38efe8c110469c5080d387bec62a6ca15b1a5 Mon Sep 17 00:00:00 2001
-From: obiwac <obiwac@gmail.com>
-Date: Fri, 22 Jul 2022 22:41:10 +0200
-Subject: [PATCH] libarchive: Handle a `calloc` returning NULL (fixes #1754)
-
----
- libarchive/archive_write.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
----
-CVE: CVE-2022-36227
-
-Source-Repo: https://github.com/libarchive/libarchive.git
-
-Upstream-Status: Backport [bff38efe8c... unmodified]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
----
-diff --git a/libarchive/archive_write.c b/libarchive/archive_write.c
-index 66592e82..27626b54 100644
---- a/libarchive/archive_write.c
-+++ b/libarchive/archive_write.c
-@@ -201,6 +201,10 @@ __archive_write_allocate_filter(struct archive *_a)
- 	struct archive_write_filter *f;
- 
- 	f = calloc(1, sizeof(*f));
-+
-+	if (f == NULL)
-+		return (NULL);
-+
- 	f->archive = _a;
- 	f->state = ARCHIVE_WRITE_FILTER_STATE_NEW;
- 	if (a->filter_first == NULL)
-@@ -548,6 +552,10 @@ archive_write_open2(struct archive *_a, void *client_data,
- 	a->client_data = client_data;
- 
- 	client_filter = __archive_write_allocate_filter(_a);
-+
-+	if (client_filter == NULL)
-+		return (ARCHIVE_FATAL);
-+
- 	client_filter->open = archive_write_client_open;
- 	client_filter->write = archive_write_client_write;
- 	client_filter->close = archive_write_client_close;
--- 
-2.38.1
-
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.1.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
similarity index 89%
rename from meta/recipes-extended/libarchive/libarchive_3.6.1.bb
rename to meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index c812038352..f447035b67 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -30,15 +30,12 @@ PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
 PACKAGECONFIG[mbedtls] = "--with-mbedtls,--without-mbedtls,mbedtls,"
 PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 
-EXTRA_OECONF += "--enable-largefile"
+EXTRA_OECONF += "--enable-largefile --without-iconv"
 
-SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
-           file://0001-libarchive-Do-not-include-sys-mount.h-when-linux-fs..patch \
-           file://cve-2022-36227.patch \
-           "
+SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-SRC_URI[sha256sum] = "c676146577d989189940f1959d9e3980d28513d74eedfbc6b7f15ea45fe54ee2"
+SRC_URI[sha256sum] = "ba6d02f15ba04aba9c23fd5f236bb234eab9d5209e95d1c4df85c44d5f19b9b3"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.30.2


