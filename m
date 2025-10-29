Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E811CCF9F2
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 02:55:04 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.39.1761706496615428183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 19:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ur7HAeBK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-290cd62acc3so75015585ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 19:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1761706496; x=1762311296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/z+HtnknAKnaovJbXB9+ZxjkflXoL5ptkzL8ulzkxs=;
        b=Ur7HAeBKHFEqUcHV4ixW6bD4RLuztEIslTeYjD3qFFQ9JIkJYL1ZX7lXApzzhC/QAZ
         dx9mk7cB7+AopQts9ydoc8QGx7/8/bDPKleZ9ZV28acGWGYQanzT8v2aQjY3geXvv0FV
         zkapOIuW+G3eCTc9Am5g7j9Jtst9MHeZQ6PWFBKJlwRYr87NdwoEK34spSgdSXCv4MVq
         1FoL8M6dDcm2DXOKBFU8H/AbSJM9Yf3xUmama99HlSiZq3dImZQWvaJ1Birqe2zC8gKa
         NeoFauKQqRf6r7U1cTMGGqYDZQs0ZoZdB7ChcLKTDwJDY/KHEObvlouNEpZJJL7I8QW3
         d2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761706496; x=1762311296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/z+HtnknAKnaovJbXB9+ZxjkflXoL5ptkzL8ulzkxs=;
        b=ACWxeZQNPv9FfP/vPtZKSColL3eFSNRAeSDXRh6F15yoAbtK2/He51hBaAUucV3kHF
         0hrnhyPhzD3K0mVaWPiYHEnxmq5R2JhqJ9cbOQiEjPwiaYq6r2DusnRmWmnLUaSI//mE
         2LqpDrG9hwwObYwsutW2pNEIPBt3oGq2vHPYNSUWnBF/pyRUzmdHiYXwzVxc8O3bleEy
         usNTD29CzM61wBDVYN60uv7cmsfLzEGhQxBUxenbgKta2xEVNUZnKDsLa4jTQFksWzI9
         SZ1aSfubLAGe3JcJVCiZCPorgXW6ZRFNLHe481A8zXCaWQXdS86Myd19wvfple6rgkHV
         RFxQ==
X-Gm-Message-State: AOJu0YyuEihUC4jOi2l97WjyO8+qNhVttxzbOW+7tG2AzDksoHQb1FDq
	vvlg1NHB3IGhYcZskWydmiCjml1MqmqAO2ydvaIEz14OAW/5cMHgNp27CVlvvpyHJx47Zmd6R0H
	0QTqNxU0=
X-Gm-Gg: ASbGncsadMc49eXwDsdzwlVn8UDX3Mhqq59kgDpnJ0c0RpXl0mp8bqsThwULFq4zD5n
	U325lRli90MRTpokRkrd2hUvU8X76BRplCPNh1PU5uDpWrcIy2ev+DwPm+8+OuXDe3PuHV4I6D9
	uS4pk+AvHYQbTaXtEpN55I2xFdKFFcnrMo+aIz2kTYAEJCBIxmWqbzJcLshJy2S1Utq8DRlv1Hw
	HBpUBrg/gdvvu7RLBq0jrQXGPprRlldeorSvlwbwzRjF2gKTAVKVID3H83q9Ze4ysYTnI+HZ+rr
	A5CphPK7Fq7Idhp8ttdy1x23scCxyg+cKvQyifCzIEf4pRYSfRF7jSM1BfHhI5PIZmLkXfm6YcN
	G8VHGipddX8OcEPOloeeFAim0AW4dnFd1dQUESZgDVTHJ2IwVOvY8qF98IWgYChsPrGw=
X-Google-Smtp-Source: AGHT+IEQMI3uBQh7aup4RgEPm4AhaKRZlggR7X7Zmf5V5RoLztUpEcErbfLlIQnrsewbP7DRnj9D7A==
X-Received: by 2002:a17:902:da88:b0:294:cc1d:e2b3 with SMTP id d9443c01a7336-294deed41c8mr16123515ad.38.1761706495684;
        Tue, 28 Oct 2025 19:54:55 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2bae:51f5:3bdc:4c68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d27345sm131058945ad.54.2025.10.28.19.54.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 19:54:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/4] lz4: patch CVE-2025-62813
Date: Tue, 28 Oct 2025 19:54:30 -0700
Message-ID: <612d09f6b9e262640ed3ee0ee81ac4b6d7c29f4d.1761692326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761692326.git.steve@sakoman.com>
References: <cover.1761692326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 02:55:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225426

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lz4/files/CVE-2025-62813.patch            | 69 +++++++++++++++++++
 meta/recipes-support/lz4/lz4_1.9.4.bb         |  4 +-
 2 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/lz4/files/CVE-2025-62813.patch

diff --git a/meta/recipes-support/lz4/files/CVE-2025-62813.patch b/meta/recipes-support/lz4/files/CVE-2025-62813.patch
new file mode 100644
index 0000000000..cb4d497d7c
--- /dev/null
+++ b/meta/recipes-support/lz4/files/CVE-2025-62813.patch
@@ -0,0 +1,69 @@
+From f64efec011c058bd70348576438abac222fe6c82 Mon Sep 17 00:00:00 2001
+From: louislafosse <louis.lafosse@epitech.eu>
+Date: Mon, 31 Mar 2025 20:48:52 +0200
+Subject: [PATCH] fix(null) : improve error handlings when passing a null
+ pointer to some functions from lz4frame
+
+CVE: CVE-2025-62813
+Upstream-Status: Backport [https://github.com/lz4/lz4/commit/f64efec011c058bd70348576438abac222fe6c82]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/lz4frame.c    | 15 +++++++++++++--
+ tests/frametest.c |  9 ++++++---
+ 2 files changed, 19 insertions(+), 5 deletions(-)
+
+diff --git a/lib/lz4frame.c b/lib/lz4frame.c
+index 85daca7b..c9e4a3cf 100644
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
+index de0fe643..90247547 100644
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
index a2a178bab5..16bb4d0823 100644
--- a/meta/recipes-support/lz4/lz4_1.9.4.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.4.bb
@@ -12,7 +12,9 @@ PE = "1"
 
 SRCREV = "5ff839680134437dbf4678f3d0c7b371d84f4964"
 
-SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https"
+SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
+           file://CVE-2025-62813.patch \
+"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


