Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8484CCF9F1
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 20:12:10 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.13452.1761768730272696165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 13:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aXiftojk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7a27bf4fbcbso328481b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 13:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1761768729; x=1762373529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LDjm6zzQbtplvHgJKRTR87yPQpBd1O5jrOgREsDKirQ=;
        b=aXiftojkV/NC4GjzHBdnklBxrL9zdTzyvKcP/eGAw2dDlne2mPgOauIJlhbwdvhMcy
         5t8h/MSFvC3xilFA1My14nEj5vqqocq86BIReipULW26KNpqAO0gqJBIRgclrsg53g8W
         kXahLMDMxenhR9fXwBFKS41oM+HBLYmpsBvvJpg4B7uSfZYv+s/U1gpm07xGGqL6l/aW
         p8bNkks4GwqYZbntKf107CsTWn5sMxCw/hOdvb0TrC44Tzp7xcPzG222qKKlmkdKoq7g
         qSgaxC93LbhBZAq+inTieyKH/+/CjO+TXTtub0aZ5t1OeVFndkp49kE275B66aHBCyUn
         kwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761768729; x=1762373529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDjm6zzQbtplvHgJKRTR87yPQpBd1O5jrOgREsDKirQ=;
        b=wRAHG1KCcV5c3Y2s3lnna/HebfMQh8ooBcQDpBqF4Vu+hxu3XozWR2LyeZUqpUs3/8
         fc3ogHKJ32o3NkAYX3EIZw/Lyunot3ZgUXQ5Sit0M3U3mL6uB9qbLMU64z0mfTiPvYO4
         yaivl9WznOeTD3yR1KMVZkY0C2vsjEtEzFzIlCJjHQg67B69wNnZ4pXMOBPNWYb1CBal
         ddMLc9WGq4D9dwPAlpXT8dCyEdR7wBv8i6emDWGvN4etSwkLFAd0vFpl2xtpj/iV9Qt4
         UP6FZYWDC5qNSWqT/Eso42VQ3Pfu05BpNPaZVyr2vOLjSN0dUvkFtVKgGL9qfNM4+g9P
         Iq4w==
X-Gm-Message-State: AOJu0YzD1x3k2JIIP9MiWrRyJM2QWkY8Ta+L3ThLDdNQl70nwPyQYCHS
	PsYmrAvx46eye19uYXmuai5BUVIG5btg+X3BFRbgcVUqAaUzjhqDi0btEyOcPWhV8JuZ0T8sPfb
	2xbTcZgU=
X-Gm-Gg: ASbGncsTTbKhnw2Pq599b/YlJmISSSw7YM3+uUr8uyzfVxg0CQ04b1qkYzcRgEvdeH/
	xG42QTDlhHvbwly03UxMB5LDbOHJoeeF8c9VKv6lnnOud78n/PzZvXTzdMUb8x650j7WTN9ZJZy
	Z5D2SyHkM0PGIAdmCk1XxLZMG+tGqofSewn4flAr+peFW+QgUfQp3p87yYCuKxlEOw4TO4PHftO
	VjNKTjvRMwNX6U/BK98VybILHn5zLmrSLZbqaoaZauQaOcYxQLg0YSWrNyaOsKv+A6rI5CNTKY1
	0BimBdAIvJSq3k4RxpueD+wG+6m4ZG6wxHuHKcDbO5YxpQVi3iF9Tx0G5HoW1ABUGjwmVudVFMW
	l0EEJYtu/jCk130ud9FaTZzp89EoSDyTFUf2q6ahloxwgFmCEzQx9107UjdrcdjlaEz4=
X-Google-Smtp-Source: AGHT+IExqcbccxhzt1mkVrRAUbukyi+/5G/v94Lq80rxlu/x9M54W9B+XZQS9NP5TOoVByLMg8m37A==
X-Received: by 2002:a05:6a20:2584:b0:344:97a7:8c61 with SMTP id adf61e73a8af0-34654a05a52mr5231164637.37.1761768729331;
        Wed, 29 Oct 2025 13:12:09 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414087d2asm16522100b3a.63.2025.10.29.13.12.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 13:12:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/6] lz4: fix CVE-2025-62813
Date: Wed, 29 Oct 2025 13:11:50 -0700
Message-ID: <0a63e3e120cc6958e2963a3ad510ec7c03f1adae.1761768602.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761768602.git.steve@sakoman.com>
References: <cover.1761768602.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 20:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225465

From: David Nyström <david.nystrom@est.tech>

Prevent attackers to cause a denial of service (application crash) or
possibly have unspecified other impact when the application processes
untrusted LZ4 frames. For example, LZ4F_createCDict_advanced in
lib/lz4frame.c mishandles NULL checks.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-62813

Upstream patch:
https://github.com/lz4/lz4/commit/f64efec011c058bd70348576438abac222fe6c82

Signed-off-by: David Nyström <david.nystrom@est.tech>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lz4/files/CVE-2025-62813.patch            | 73 +++++++++++++++++++
 meta/recipes-support/lz4/lz4_1.9.4.bb         |  5 +-
 2 files changed, 76 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/lz4/files/CVE-2025-62813.patch

diff --git a/meta/recipes-support/lz4/files/CVE-2025-62813.patch b/meta/recipes-support/lz4/files/CVE-2025-62813.patch
new file mode 100644
index 0000000000..bbd0f74541
--- /dev/null
+++ b/meta/recipes-support/lz4/files/CVE-2025-62813.patch
@@ -0,0 +1,73 @@
+From 10dbd089b74cf858a24a4aa4c2a438984ddf17d7 Mon Sep 17 00:00:00 2001
+From: louislafosse <louis.lafosse@epitech.eu>
+Date: Mon, 31 Mar 2025 20:48:52 +0200
+Subject: [PATCH] fix(null) : improve error handlings when passing a null
+ pointer to some functions from lz4frame
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport [Upstream commit https://github.com/lz4/lz4/commit/f64efec011c058bd70348576438abac222fe6c82]
+CVE: CVE-2025-62813
+
+Signed-off-by: David Nyström <david.nystrom@est.tech>
+---
+ lib/lz4frame.c    | 15 +++++++++++++--
+ tests/frametest.c |  9 ++++++---
+ 2 files changed, 19 insertions(+), 5 deletions(-)
+
+diff --git a/lib/lz4frame.c b/lib/lz4frame.c
+index 174f9ae4..cc6ed6f1 100644
+--- a/lib/lz4frame.c
++++ b/lib/lz4frame.c
+@@ -530,9 +530,16 @@ LZ4F_CDict*
+ LZ4F_createCDict_advanced(LZ4F_CustomMem cmem, const void* dictBuffer, size_t dictSize)
+ {
+     const char* dictStart = (const char*)dictBuffer;
+-    LZ4F_CDict* const cdict = (LZ4F_CDict*)LZ4F_malloc(sizeof(*cdict), cmem);
++    LZ4F_CDict* cdict = NULL;
++
+     DEBUGLOG(4, "LZ4F_createCDict_advanced");
+-    if (!cdict) return NULL;
++
++    if (!dictStart)
++        return NULL;
++    cdict = (LZ4F_CDict*)LZ4F_malloc(sizeof(*cdict), cmem);
++    if (!cdict)
++        return NULL;
++
+     cdict->cmem = cmem;
+     if (dictSize > 64 KB) {
+         dictStart += dictSize - 64 KB;
+@@ -1429,6 +1436,10 @@ LZ4F_errorCode_t LZ4F_getFrameInfo(LZ4F_dctx* dctx,
+                                    LZ4F_frameInfo_t* frameInfoPtr,
+                              const void* srcBuffer, size_t* srcSizePtr)
+ {
++    assert(dctx != NULL);
++    RETURN_ERROR_IF(frameInfoPtr == NULL, parameter_null);
++    RETURN_ERROR_IF(srcSizePtr == NULL, parameter_null);
++
+     LZ4F_STATIC_ASSERT(dstage_getFrameHeader < dstage_storeFrameHeader);
+     if (dctx->dStage > dstage_storeFrameHeader) {
+         /* frameInfo already decoded */
+diff --git a/tests/frametest.c b/tests/frametest.c
+index 33019551..523e35d1 100644
+--- a/tests/frametest.c
++++ b/tests/frametest.c
+@@ -589,10 +589,13 @@ int basicTests(U32 seed, double compressibility)
+         size_t const srcSize = 65 KB; /* must be > 64 KB to avoid short-size optimizations */
+         size_t const dstCapacity = LZ4F_compressFrameBound(srcSize, NULL);
+         size_t cSizeNoDict, cSizeWithDict;
+-        LZ4F_CDict* const cdict = LZ4F_createCDict(CNBuffer, dictSize);
+-        if (cdict == NULL) goto _output_error;
+-        CHECK( LZ4F_createCompressionContext(&cctx, LZ4F_VERSION) );
++        LZ4F_CDict* cdict = NULL;
+ 
++        CHECK( LZ4F_createCompressionContext(&cctx, LZ4F_VERSION) );
++        cdict = LZ4F_createCDict(CNBuffer, dictSize);
++        if (cdict == NULL)
++            goto _output_error;
++        
+         DISPLAYLEVEL(3, "Testing LZ4F_createCDict_advanced : ");
+         {   LZ4F_CDict* const cda = LZ4F_createCDict_advanced(lz4f_cmem_test, CNBuffer, dictSize);
+             if (cda == NULL) goto _output_error;
diff --git a/meta/recipes-support/lz4/lz4_1.9.4.bb b/meta/recipes-support/lz4/lz4_1.9.4.bb
index 51a854d44a..8c96f9bab4 100644
--- a/meta/recipes-support/lz4/lz4_1.9.4.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.4.bb
@@ -13,8 +13,9 @@ PE = "1"
 SRCREV = "5ff839680134437dbf4678f3d0c7b371d84f4964"
 
 SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
-	   file://run-ptest \
-	   "
+           file://run-ptest \
+           file://CVE-2025-62813.patch \
+           "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


