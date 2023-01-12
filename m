Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771E4C5479D
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 02:33:34 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.45239.1673490810496202293
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 18:33:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=qbCPq36C;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id s13-20020a17090a6e4d00b0022900843652so553189pjm.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 18:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GilXtXd4dNBh+KQyS+oHjDCX32YmT5G4NSmqSb3eScY=;
        b=qbCPq36C/UFB2U1hTp+dieS5d+D3IyHDhyiC+3EFgrQxSldL+q8QuIDCBuRd7kCZLW
         Wlatkpjpk8bpWtHosebiAQHF6gz4MWJJo6WfKfnMNDLAp+vZbLyqRPSBQEk+m+ZeNQdn
         a23ccDFVVHyx1yZCqtptPx7LXAE4yqSrXEyzcq/W1aHPkRsIXktMKXCelwsyo9QUXl/W
         sJPihHWx0upCpXMO0UsB3Je2rMKgCMdKzs/vIiJIan6lJ+QgL3/6EPA7lSDCy0JgpkY6
         MgzJw4c01+93ZS7lPPVuDLEmGviyhWraZWEgaS+3yFdGFMFk462hRa0PagEPAzgzVrg5
         GKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GilXtXd4dNBh+KQyS+oHjDCX32YmT5G4NSmqSb3eScY=;
        b=zRse/ydss7V6cfzZhxklkY5xedTwKS0KoEtuiVdb2ij/81kT3nsUgtJxGtQil7jTxZ
         iIZtn7FBnYWnOOMD3s1q5jKSY4Ak3AG/Yrr+2sZ03Ev4joNaYgVLu83xtiTuH7rrNTZ4
         4ckJPw7rvTsZ1AufHkjhcfm3td05eOzqAOxVPKSB0ZbcPjdzqxSCI5aRUbRsY0U+kk8l
         BHl7SIzIuZ+8lJQTQwTqLFlENj/J79XNfKaqFwwRTuSZjdWBPXntsUKVVA1GEq8VcJVY
         HCW77elIB4o7P8cI68VTzwP4qnzA8nT40ArV+AJrn8xuPei8+rsIMEmdhuvg9NOwiCVm
         I2xg==
X-Gm-Message-State: AFqh2kq7bPNLI+8uTX7B9aJlbFMCbPaPiLReDFd4G7xZ4Id55BY7oGM3
	6lKSepY1QZdnZpmExJvsO4J+jNF/6fI1wKYpU5Y=
X-Google-Smtp-Source: AMrXdXsqjgJAfQSMI4gHLn+rWahCE08nCFg9E+/WJyjPgekEoml5E36vrGKDryvLt4rpGe0FsFaMaw==
X-Received: by 2002:a17:903:12cf:b0:194:5178:1135 with SMTP id io15-20020a17090312cf00b0019451781135mr3142959plb.30.1673490809419;
        Wed, 11 Jan 2023 18:33:29 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902cecb00b00192d389db91sm11006719plg.75.2023.01.11.18.33.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 18:33:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/11] libarchive: upgrade 3.6.1 -> 3.6.2
Date: Wed, 11 Jan 2023 16:33:05 -1000
Message-Id: <58417a8f1d9981a181aa93354b743d8815f4444e.1673490673.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673490673.git.steve@sakoman.com>
References: <cover.1673490673.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 02:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175777

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
(cherry picked from commit 93b972845a28b62ea01ee0f4a1e043bd58fc0892)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/CVE-2022-36227.patch           | 42 -------------------
 ...ibarchive_3.6.1.bb => libarchive_3.6.2.bb} |  8 ++--
 2 files changed, 3 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.6.1.bb => libarchive_3.6.2.bb} (92%)

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
similarity index 92%
rename from meta/recipes-extended/libarchive/libarchive_3.6.1.bb
rename to meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index df9df5e0a6..acc84de9da 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -30,14 +30,12 @@ PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
 PACKAGECONFIG[mbedtls] = "--with-mbedtls,--without-mbedtls,mbedtls,"
 PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 
-EXTRA_OECONF += "--enable-largefile"
+EXTRA_OECONF += "--enable-largefile --without-iconv"
 
-SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
-           file://CVE-2022-36227.patch \
-	   "
+SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-SRC_URI[sha256sum] = "c676146577d989189940f1959d9e3980d28513d74eedfbc6b7f15ea45fe54ee2"
+SRC_URI[sha256sum] = "ba6d02f15ba04aba9c23fd5f236bb234eab9d5209e95d1c4df85c44d5f19b9b3"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.25.1


