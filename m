Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D631C83F07
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 14:25:35 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.25253.1751466332353358278
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 07:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YUSd1QaE;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3134c67a173so4210363a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751466331; x=1752071131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Frmi6foTxI3OhbIanExunZWMzlMPBT4wBZgDIKw73gI=;
        b=YUSd1QaEdihIksQd6CN5uIbJ9x2tel0kpdevaywoXCA+9pXkNdC/X/BiANQPBQUnzL
         OQvspWuI/xcv6sJXrhdiMliW/rF29SE2YIT9CxyWiHIP77efi/ii48YWbT00bKV6g2HP
         sER7Q5rnHwf+Lve7kpPtVnix/7ceQMC6XKQ1bq9JndnLHeAVGAU4uapmRjB0te7Da3FR
         AdywtTNZqXgf3laTv7RZavocRSXbqakjgyIlybwJ1AOcHW6tEXvGUzZ14026ek0gOje3
         n96enLQXmD+CaETgdFcUx6GVBY28iO0QEXmsLkvS+fEOWojsejsIas3fHd5h7sKc9xMM
         9CLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466331; x=1752071131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Frmi6foTxI3OhbIanExunZWMzlMPBT4wBZgDIKw73gI=;
        b=eiNoXXKVjg4bwCBi+XZtb7T8S8V+xnYWqJYxr5+qhnK4Vy7ehl0vsX1vQI02cU+HvM
         LOngaDFp7vuxS6tEXzuqQDrnlxXHRraFwteByphXxodPV1h4Cl9Ti4nwYdaZ0atr9ctO
         3Fn4UM4yaW72BVfDftEE8oRqSjtCeaAeTIKTmaetAQLPSPbLks2yCJ++f5E5t42nQEPa
         txu1WcchRfb71JtoNKzSemZJZb4l5ZCOvWNoY4m4vgDdcp77FlSRyHpReqO4WLgBk9Z0
         xtBGFuj3v1WJ91sTKsspDmZJBrANdctx0OhMJ2acaADVJ3WQYokYk07Ao6g2wbz2mKZO
         7LcQ==
X-Gm-Message-State: AOJu0YzrQLU1cq02cABpb6do+rgYd688mL5pZL5T8r01AIKWK+IzsLv8
	qSHeDb1XvhOE+JukPtXOXuArMcUKCVNP2l30zCe9AwbUL/CtP/06e9q2orgsjwt+5tyCdmD+mjv
	+emwU
X-Gm-Gg: ASbGncuzmf2RUATmsSM6D+H4BOcaLhJkj2BnNITXUFEG59mv/KrtG7+o9E7qgD38Evq
	nAaEwIvpAtRDr1/Y0FgMIMZ0Pc46XgJIBGTuJx7VQs+ZBupOvrsS5hr+HHgji+QnoOBMzuQxHWA
	kVdQMKfyuvoMx0W3tVlZ6rGxqUUpN/9T7/BLPskWtx3i3jIgIvyn6sG0VPio0WDZM4ZfedkDUR4
	wMNZ8t1tteuIt+BLMnEUvc2lrAissO0+opA2WBUgMB0Fn2lbuHA3RAVENIzNWmxzOhOF+ZafRnf
	Z3Q4T9MScE3rLxhyOqYl7bWLLaR48JmKxJtQvpjB7sYwsIf07VkHdA==
X-Google-Smtp-Source: AGHT+IEfVQD/HEdrX2LFMGHN3hvBHdbFpM42yTWRXZtuoRV7nWvBalzMINztS4CSQME5Ol3aw01RkA==
X-Received: by 2002:a17:90b:17d0:b0:312:1d2d:18df with SMTP id 98e67ed59e1d1-31a90befbe0mr3525645a91.23.1751466331438;
        Wed, 02 Jul 2025 07:25:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:acee:7642:9516:37b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c15232c9sm14871637a91.45.2025.07.02.07.25.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:25:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/9] libarchive: fix CVE-2025-5914
Date: Wed,  2 Jul 2025 07:25:16 -0700
Message-ID: <d85d5181af0d3941169447ae20a01f950ed3ae04.1751466215.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751466215.git.steve@sakoman.com>
References: <cover.1751466215.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 14:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219835

From: Colin Pinnell McAllister <colin.mcallister@garmin.com>

Adds patch to backport fix for CVE-2025-5914.

Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/libarchive/CVE-2025-5914.patch | 46 +++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch
new file mode 100644
index 0000000000..4d95dba209
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch
@@ -0,0 +1,46 @@
+From 72a83b2885c31254687702e3a8429e3e0523221c Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <stoeckmann@users.noreply.github.com>
+Date: Sun, 11 May 2025 02:17:19 +0200
+Subject: [PATCH] rar: Fix double free with over 4 billion nodes (#2598)
+
+If a system is capable of handling 4 billion nodes in memory, a double
+free could occur because of an unsigned integer overflow leading to a
+realloc call with size argument of 0. Eventually, the client will
+release that memory again, triggering a double free.
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+
+CVE: CVE-2025-5914
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/09685126fcec664e2b8ca595e1fc371bd494d209]
+Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
+---
+ libarchive/archive_read_support_format_rar.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 9d155c66..9eb3c848 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -335,8 +335,8 @@ struct rar
+   int found_first_header;
+   char has_endarc_header;
+   struct data_block_offsets *dbo;
+-  unsigned int cursor;
+-  unsigned int nodes;
++  size_t cursor;
++  size_t nodes;
+   char filename_must_match;
+ 
+   /* LZSS members */
+@@ -1186,7 +1186,7 @@ archive_read_format_rar_seek_data(struct archive_read *a, int64_t offset,
+     int whence)
+ {
+   int64_t client_offset, ret;
+-  unsigned int i;
++  size_t i;
+   struct rar *rar = (struct rar *)(a->format->data);
+ 
+   if (rar->compression_method == COMPRESS_METHOD_STORE)
+-- 
+2.49.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index 4dd6794bb1..5bbdb86e07 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -31,6 +31,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://configurehack.patch \
+		   file://CVE-2025-5914.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.43.0


