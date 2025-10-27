Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8821CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 21:38:44 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.3434.1761601119742179567
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 14:38:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=DO76JVVp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2025102721383408cedcf262000207a4-uvkbgv@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025102721383408cedcf262000207a4
        for <openembedded-core@lists.openembedded.org>;
        Mon, 27 Oct 2025 22:38:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=9uxHY5eW52PLQ6ncPMlwUQMXlIgcS9xIx3Vs+ntaNe8=;
 b=DO76JVVpksbgp91KEHaNeo1VvyKXMuN/2G/kcLXjiiCDdHA3JF2GIkuUBEtlFoWW+HRHct
 6tUk5UgqhIxFBeJKA2RqHKwqTCLDyODT4BAVZCmYxpc/REIzNGg4HPJiqH9rD47BT1ZrIsTi
 MNPollfhl6/5qTG0cW6zfBnf5L7UtazTmb+TfSrDGPXiAweKVOs+qe1KVyiyiCZtiVRfnLv7
 x0BbAZiGEL/pUbFq79EDXGW1sN1yyqeGt8XbHrCm02pgaRJShS0t0J1CDYxJz9+LGK2m8AFr
 +ImVpG+CTmLjUB94k3bqPOHnE6Y+P3MtaogiQbCwovA4VNAu0oM3+Lyw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] lz4: patch CVE-2025-62813
Date: Mon, 27 Oct 2025 22:38:00 +0100
Message-Id: <20251027213800.3983237-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 21:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225362

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../lz4/lz4/CVE-2025-62813.patch              | 69 +++++++++++++++++++
 meta/recipes-support/lz4/lz4_1.10.0.bb        |  4 +-
 2 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/lz4/lz4/CVE-2025-62813.patch

diff --git a/meta/recipes-support/lz4/lz4/CVE-2025-62813.patch b/meta/recipes-support/lz4/lz4/CVE-2025-62813.patch
new file mode 100644
index 00000000000..4fa0373ff77
--- /dev/null
+++ b/meta/recipes-support/lz4/lz4/CVE-2025-62813.patch
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
+@@ -539,9 +539,16 @@ LZ4F_CDict*
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
+@@ -1486,6 +1493,10 @@ LZ4F_errorCode_t LZ4F_getFrameInfo(LZ4F_dctx* dctx,
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
+@@ -714,10 +714,13 @@ static int unitTests(U32 seed, double compressibility)
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
diff --git a/meta/recipes-support/lz4/lz4_1.10.0.bb b/meta/recipes-support/lz4/lz4_1.10.0.bb
index 9bd3cfc27be..f2a86036b56 100644
--- a/meta/recipes-support/lz4/lz4_1.10.0.bb
+++ b/meta/recipes-support/lz4/lz4_1.10.0.bb
@@ -14,7 +14,9 @@ SRCREV = "ebb370ca83af193212df4dcbadcc5d87bc0de2f0"
 
 SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
            file://reproducibility.patch \
-           file://run-ptest"
+           file://run-ptest \
+           file://CVE-2025-62813.patch \
+"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 inherit ptest

