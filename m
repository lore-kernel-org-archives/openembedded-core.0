Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65AD9C54EBC
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 16:21:51 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.28305.1673454109844185819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 08:21:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=xaK6+Q3J;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id h7-20020a17090aa88700b00225f3e4c992so20599101pjq.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 08:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pkBsQgwR9cWLUnpAS/YImF1Bil4JCxg0ZN5OCUSNsZE=;
        b=xaK6+Q3Jjt3FXcDmPaCVB9pCMvRXDiqfAqHZ78El5XFwV4sVM85U9DEvjhnlfNDdTR
         X4Q7Vaxe7+HH5+gMX2D4fg8ZaaVAhkYl6GDXB6go3hnmCRq2uI8XfRuFiMoNWO6ejO8c
         HP7ZCXchYACx7qyxJQAm79iePgFcgPUPme2cW1ucg9eVYAIFUzqXw+ih76nAJzc9Cr5y
         fUQTVQiw9ysM99oyPl9n7UA/FAil7mfp/Pb1hz7Se4JT5tCyMsgX3M6j4AbZby76J6ZB
         1e7qT6nneYqvr/zqUgduSbiWriWqaC98VkDu5wW9Qkd5lQC0h2HMPvX/QIocjDf9+/T7
         /jNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkBsQgwR9cWLUnpAS/YImF1Bil4JCxg0ZN5OCUSNsZE=;
        b=wpJTbSUBdBeNkkKhOAd2623XtGT+yEjTJurxVhC9uPn5RqzoCx8GG+OZms50+YiGCF
         Iq57p0Eae6L8vElkVmLBv4w6vVc+mUDYoj85nJ9YJR93J6ak7uwczvC/GtAochCMuB4w
         xI6uNXiVHc3jV0TiZEWdaXkGbw9Ri8cOlIp3uT1NK9JAqNeY9g2nt0KLOD2YqEGaP9AC
         dBYR2RZvUsMdjzps0Q5qn9CkS8jJPU2VZPrfQRWB33iMWhPAuONC6aZAYEFvCTdGfoKS
         Q8Z08daSnW5h/6wSixbU5lwVRt4iGzHxJ5SZmUhrJw/ZXuwtTkeLhMcVPHRLaNXZgzlQ
         38OQ==
X-Gm-Message-State: AFqh2kr0eLRnamMYpMUMfnIn7rocVIBYTp743H+0Zu0x1jpJdxLSesM5
	IN8S9s9qZC8JwcodNT46qwa61IPjt6/bGKWN+t8=
X-Google-Smtp-Source: AMrXdXsQ/3O9v6SWIedpvRZ9Es9PPVWLB8osBqtnSe9Qx4zC2nccCBMUvfY5OmZUZWZ7Adtsfjxs+A==
X-Received: by 2002:a05:6a21:86a8:b0:ad:6305:a4 with SMTP id ox40-20020a056a2186a800b000ad630500a4mr71637547pzb.48.1673454108782;
        Wed, 11 Jan 2023 08:21:48 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id u14-20020a63ef0e000000b0046feca0883fsm8685384pgh.64.2023.01.11.08.21.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 08:21:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 03/11] libarchive: upgrade 3.6.1 -> 3.6.2
Date: Wed, 11 Jan 2023 06:21:29 -1000
Message-Id: <4dd785cc05fd57f6cce8838cca7379c6e0bfd15c.1673453368.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673453368.git.steve@sakoman.com>
References: <cover.1673453368.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 16:21:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175759

From: Alexander Kanavin <alex.kanavin@gmail.com>

Libarchive 3.6.2 is a bugfix and security release.

Important security fixes:

NULL pointer dereference vulnerability in archive_write.c (#1754, #1759, CVE-2022-36227)

Important bug fixes:

include ZSTD in Windows builds (#1688)
SSL fixes on Windows (#1714, #1723, #1724)
rar5 reader: fix possible garbled output with bsdtar -O (#1745)
mtree reader: support reading mtree files with tabs (#1783)
various small fixes for issues found by CodeQL

Use --without-iconv as otherwise autotools write a bogus iconv
dependency into .pc file.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit edce1bce81fe2f47fb2c5e2b94ebda73f95cbaea)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...t-include-sys-mount.h-when-linux-fs..patch | 47 -------------------
 .../libarchive/CVE-2022-36227.patch           | 42 -----------------
 ...ibarchive_3.6.1.bb => libarchive_3.6.2.bb} |  9 ++--
 3 files changed, 3 insertions(+), 95 deletions(-)
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0001-libarchive-Do-not-include-sys-mount.h-when-linux-fs..patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch
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
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch
deleted file mode 100644
index d0d143710c..0000000000
--- a/meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From b5332ed6d59ba5113a0a2c67fd82b69fcd5cde68 Mon Sep 17 00:00:00 2001
-From: obiwac <obiwac@gmail.com>
-Date: Fri, 22 Jul 2022 22:41:10 +0200
-Subject: [PATCH] libarchive: CVE-2022-36227 Handle a `calloc` returning NULL
- (fixes #1754)
-
-Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/bff38efe8c110469c5080d387bec62a6ca15b1a5]
-CVE: CVE-2022-36227
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com
----
- libarchive/archive_write.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/libarchive/archive_write.c b/libarchive/archive_write.c
-index 66592e8..27626b5 100644
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
-2.25.1
-
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.1.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
similarity index 89%
rename from meta/recipes-extended/libarchive/libarchive_3.6.1.bb
rename to meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index 79e13e514f..f447035b67 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -30,15 +30,12 @@ PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
 PACKAGECONFIG[mbedtls] = "--with-mbedtls,--without-mbedtls,mbedtls,"
 PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 
-EXTRA_OECONF += "--enable-largefile"
+EXTRA_OECONF += "--enable-largefile --without-iconv"
 
-SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
-           file://0001-libarchive-Do-not-include-sys-mount.h-when-linux-fs..patch \
-           file://CVE-2022-36227.patch \
-	   "
+SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-SRC_URI[sha256sum] = "c676146577d989189940f1959d9e3980d28513d74eedfbc6b7f15ea45fe54ee2"
+SRC_URI[sha256sum] = "ba6d02f15ba04aba9c23fd5f236bb234eab9d5209e95d1c4df85c44d5f19b9b3"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.25.1


