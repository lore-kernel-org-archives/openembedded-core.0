Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDED8C83F01
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 13:38:23 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.10923.1751377103556048501
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 06:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ppMOU/xc;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b34a78bb6e7so2429311a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 06:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751377103; x=1751981903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bf+x2YPb4YXcAurZu008kl64X7Aqcay96jjor1UwcJM=;
        b=ppMOU/xc1dTmv2V1KcnR0VPTLt4SEcIaeIAklMH4TnmFdeaXiLGKLd7AQ275s+7iSK
         bwCzCOHKObRaNh1dS98RrukOzAzYr/WXbQpDz3DthhgCJ6bPxjY5jpilQwyfP/wGbEXP
         YN6syUCJPWLkba6e5sRIWlnjsjMS420TeMB8xQQaaWNpgsbaCgsP0YKQiJ2IKOSe1E42
         lKd3DG+EOdZ6g7ab+pScHHcB4y16Zb6JrDbh3LQSJqsHZ/etkZZ50v0Mb1yqkcFFkgqJ
         gSegxAuWrxcwL5fYaN4QSptirm8VUOGievvEY/7vFl8pI0R4eNLoWXpdHsXhJm39hATv
         asUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751377103; x=1751981903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bf+x2YPb4YXcAurZu008kl64X7Aqcay96jjor1UwcJM=;
        b=jCTKoWFgjDuoy2MlaIgfTVPOgxkDaF+BVWVuDZk4AE/oHe8FYgiaMT8s2slBsUUm3D
         /iBjfTQOMUs64SFmGqvrRVaGfQD7iAb3ZSNY4Egk9SHLUlH8/Mb2L0Uz+r3kyYBq0Q4/
         CPJQlXYzfxgI3dptE4yNIyV9D0GRTzy7tKZOY//DZ7/Ohgh/fvVJD2k3Th11rr4UWfEB
         0O8rgwaH8MGjCXQlFqTZxlBcf02UVQa4AZ2k6JDscDMZeLHHTKk4+M4FCaGikzC9IX4v
         5zRIgG40ddLzf9aixxKTNp7e5CMJRT7Qe9+aPLcbuAnK+aMlDMTSj3RUZP7YWGDq7hVg
         7wbQ==
X-Gm-Message-State: AOJu0YzLm7SS7DlFdaJwP66FB+/xc+UjsPkrmHapcLHR0/GghAp2Rdtn
	80uvoVr/vlNcHJCS9XCZ5xOdhmEaWztMRPr7jWAaVp9BsxDQ1TUfluIdMTLqPqEt1/rlYH3KM4S
	dnze0
X-Gm-Gg: ASbGncvhSfkHxwZ2IJ1u4EFsmzCW74uGQXli13G2J0zXCP1BLWwhZLi31OOBzcLj2t/
	oEdgJIZakXzt9SLlzje72jPElYbibe1Q60YCG/KB1OTUyKXQ0ybZd6oN4jMC8k5RdYG5GIx4ymu
	bgGuDvlvNcsDu5KYQjDbugIiIEBjejDRyzjIhNpB5wRIRCVG0zBvKs5SquNBRdl4OAmp80zg6hX
	clNTPpbjFBybJg7jYnqQAn6HCYFkkj568xY0gheGMk7LhNxVLARbY8RqrkkFT9oPIReNW5Qimj1
	eNs14V8nG/H59NGhuSqycPYhhRguCEukxV6mLRM9QMNk380J/aCa1g==
X-Google-Smtp-Source: AGHT+IFNDIloP/Uh1Pe9TdsVxg4k8FfC42ZsOSvBQVAbWJS5gFGLFLaE112NvD1dA3RlJJRxOLIUyg==
X-Received: by 2002:a17:90b:2c84:b0:311:e8cc:424c with SMTP id 98e67ed59e1d1-318c92fa800mr23547242a91.25.1751377102571;
        Tue, 01 Jul 2025 06:38:22 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c152331fsm11466117a91.44.2025.07.01.06.38.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 06:38:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 04/11] libarchive: fix CVE-2025-5914
Date: Tue,  1 Jul 2025 06:38:02 -0700
Message-ID: <ba5c5ca00d31d6440a1d810f7ef19720019845e8.1751376952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751376952.git.steve@sakoman.com>
References: <cover.1751376952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 13:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219575

From: Colin Pinnell McAllister <colin.mcallister@garmin.com>

Adds patch to backport fix for CVE-2025-5914.

Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/libarchive/CVE-2025-5914.patch | 46 +++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  4 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
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
index 9d134f7d38..1fa61c3218 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -29,7 +29,9 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 
 EXTRA_OECONF += "--enable-largefile --without-iconv"
 
-SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
+SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
+		   file://CVE-2025-5914.patch \
+		   "
 
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.43.0


