Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663EDCCD18C
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:19 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.9189.1760038279016436478
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zpShv/pv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-78af9ebe337so1039765b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038278; x=1760643078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GDDYcq8slEEDB8S27Gs2GwhetwMmIlYm9TLA9Kb1NEc=;
        b=zpShv/pve9ud5wHEIGxvrM3BEkAYpOTFziSgm+gegJ/ZT1NPgqTunbB8X9XWDa4IYi
         z2MmYIZNo/ayXNmoom1UOWC6H3Cx1BEVb2Vkt6D7I2530+aobZQthK7SB4oO7eyfbTnt
         mcmMPsljM+8YdKn4N3q5I5tDsRvJVDAfxtGlPKQQ11nfvYY0Tu63iAP6newzsvCyVRdN
         EdXvQ7ZChO5w/Hrr4tCbK65f6gIsSrFGye/giZWviqsHFA7Ub9kscHudCrg5lM+0CHAu
         ZKrCpvNoKWwVfmSWaB3Kvqq8drShTG5M7DdZopLMFTKx1XxoU4CGNiHtTMX6dio3N4b5
         yaqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038278; x=1760643078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDDYcq8slEEDB8S27Gs2GwhetwMmIlYm9TLA9Kb1NEc=;
        b=QmasiziaOhfOl2ICME0b9XCo4g7rQxtWfSkDLwqFdXiadu1kFiKg8FvYa14drCG3cu
         7xdedSqmXmNGBFlzOMLddqoZELrX+L5DJFsVc2xU6eB7vRnkkcf/5dpjV3j0pJdBnDez
         YeWJJ72ck1zCYiLVe7d25u9tGcBfDt0XXem7rIPNO0w6yRTwxmC8Jl8ki8caKZpJdWWo
         DED/CJtM72OuGPYmQNztePgTtLgZQaWF43l3bZms7DO4uj3dni3ThwIenLfXh72UJFOQ
         si/lwFxSBTnaR6vTLwqzb//6662n0ia2Uxaquz16Xhf8KUeNZD1XLmyvROwLfzatpoHI
         YRsQ==
X-Gm-Message-State: AOJu0YymE/S3R0Yk+SxJgqtvlFOI4RtpzdDWB3moTqovFGRPbZmJlTEo
	8Ho/H0Z3YYlx81yAnPQRNxT5cv1vBDKHYiGXv2ol9rz35D3QRZ/57lIv1UntU4B7sbN8bPAvOZh
	7aUN4
X-Gm-Gg: ASbGncuiv5wR8gs8b46LyKIw99qDlCSsUxuVr4UfXnf1ndgNeOZm4egTfs3c/Sdry07
	j+voaEw/juraMSBx0V6pd+NKLtLPb9ZhP4XeBTaW2BgmhkCP0P6iB/fwrDcOq8Gz80M6m7aTC3f
	YZx/nl1UpI/t68UNLAducgkJFBsrIrq3KoLxJWogNqCd4myjH17mI05zq2v3I+y3qQhTp5CDn/S
	G/4UyBfq609LijiNsNretX9JbWA3lhQH6C2kg9WsKTVarURqXHkqBwljxiQfnTiOADw0jsNW4kI
	If+zXu41QDWDZZr2/2Lm6EqQ4D1VMg+AUL5mpxS5O+PyOWsM91xJJSivb0krPkqZJKCqPs3QWZH
	mrU9h8fhFVtrtQtZPYImw3MbP0xUQjuCU3SuAmA==
X-Google-Smtp-Source: AGHT+IF2PFCUi81hV+xG8wFa/e+1iEmnX0F+dW0uOttuFheNBf76g1iLPrVbscTxR8sU44Su71CPcw==
X-Received: by 2002:a05:6a00:1701:b0:78c:9b1b:e0e3 with SMTP id d2e1a72fcca58-79385703ee8mr9886869b3a.7.1760038278112;
        Thu, 09 Oct 2025 12:31:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/24] libxml2: fix CVE-2025-9714
Date: Thu,  9 Oct 2025 12:30:45 -0700
Message-ID: <277692c2472f03ae62401bfbd26e8c4d872113d0.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224620

From: Theo GAIGE <tgaige.opensource@witekio.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libxml2/-/commit/677a42645ef22b5a50741bad5facf9d8a8bc6d21

Signed-off-by: Theo GAIGE <tgaige.opensource@witekio.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2025-9714.patch        | 117 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-9714.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-9714.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-9714.patch
new file mode 100644
index 0000000000..24d1a8348c
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-9714.patch
@@ -0,0 +1,117 @@
+From 6ef8b9f05cc21d3fc28156fe5d1251834c29c7d7 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Thu, 28 Jul 2022 20:21:24 +0200
+Subject: [PATCH] Make XPath depth check work with recursive invocations
+
+EXSLT functions like dyn:map or dyn:evaluate invoke xmlXPathRunEval
+recursively. Don't set depth to zero but keep and restore the original
+value to avoid stack overflows when abusing these functions.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/677a42645ef22b5a50741bad5facf9d8a8bc6d21]
+CVE: CVE-2025-9714
+
+Signed-off-by: Theo GAIGE <tgaige.opensource@witekio.com>
+---
+ xpath.c | 23 +++++++++++++++++------
+ 1 file changed, 17 insertions(+), 6 deletions(-)
+
+diff --git a/xpath.c b/xpath.c
+index c2d845888..028471d53 100644
+--- a/xpath.c
++++ b/xpath.c
+@@ -13883,12 +13883,11 @@ static int
+ xmlXPathRunEval(xmlXPathParserContextPtr ctxt, int toBool)
+ {
+     xmlXPathCompExprPtr comp;
++    int oldDepth;
+ 
+     if ((ctxt == NULL) || (ctxt->comp == NULL))
+ 	return(-1);
+ 
+-    ctxt->context->depth = 0;
+-
+     if (ctxt->valueTab == NULL) {
+ 	/* Allocate the value stack */
+ 	ctxt->valueTab = (xmlXPathObjectPtr *)
+@@ -13942,11 +13941,13 @@ xmlXPathRunEval(xmlXPathParserContextPtr ctxt, int toBool)
+ 	    "xmlXPathRunEval: last is less than zero\n");
+ 	return(-1);
+     }
++    oldDepth = ctxt->context->depth;
+     if (toBool)
+ 	return(xmlXPathCompOpEvalToBoolean(ctxt,
+ 	    &comp->steps[comp->last], 0));
+     else
+ 	xmlXPathCompOpEval(ctxt, &comp->steps[comp->last]);
++    ctxt->context->depth = oldDepth;
+ 
+     return(0);
+ }
+@@ -14217,6 +14218,7 @@ xmlXPathCompExprPtr
+ xmlXPathCtxtCompile(xmlXPathContextPtr ctxt, const xmlChar *str) {
+     xmlXPathParserContextPtr pctxt;
+     xmlXPathCompExprPtr comp;
++    int oldDepth = 0;
+ 
+ #ifdef XPATH_STREAMING
+     comp = xmlXPathTryStreamCompile(ctxt, str);
+@@ -14230,8 +14232,10 @@ xmlXPathCtxtCompile(xmlXPathContextPtr ctxt, const xmlChar *str) {
+     if (pctxt == NULL)
+         return NULL;
+     if (ctxt != NULL)
+-        ctxt->depth = 0;
++        oldDepth = ctxt->depth;
+     xmlXPathCompileExpr(pctxt, 1);
++    if (ctxt != NULL)
++        ctxt->depth = oldDepth;
+ 
+     if( pctxt->error != XPATH_EXPRESSION_OK )
+     {
+@@ -14252,8 +14256,10 @@ xmlXPathCtxtCompile(xmlXPathContextPtr ctxt, const xmlChar *str) {
+ 	comp = pctxt->comp;
+ 	if ((comp->nbStep > 1) && (comp->last >= 0)) {
+             if (ctxt != NULL)
+-                ctxt->depth = 0;
++                oldDepth = ctxt->depth;
+ 	    xmlXPathOptimizeExpression(pctxt, &comp->steps[comp->last]);
++            if (ctxt != NULL)
++                ctxt->depth = oldDepth;
+ 	}
+ 	pctxt->comp = NULL;
+     }
+@@ -14409,6 +14415,7 @@ xmlXPathEvalExpr(xmlXPathParserContextPtr ctxt) {
+ #ifdef XPATH_STREAMING
+     xmlXPathCompExprPtr comp;
+ #endif
++    int oldDepth = 0;
+ 
+     if (ctxt == NULL) return;
+ 
+@@ -14422,8 +14429,10 @@ xmlXPathEvalExpr(xmlXPathParserContextPtr ctxt) {
+ #endif
+     {
+         if (ctxt->context != NULL)
+-            ctxt->context->depth = 0;
++            oldDepth = ctxt->context->depth;
+ 	xmlXPathCompileExpr(ctxt, 1);
++        if (ctxt->context != NULL)
++            ctxt->context->depth = oldDepth;
+         CHECK_ERROR;
+ 
+         /* Check for trailing characters. */
+@@ -14432,9 +14441,11 @@ xmlXPathEvalExpr(xmlXPathParserContextPtr ctxt) {
+ 
+ 	if ((ctxt->comp->nbStep > 1) && (ctxt->comp->last >= 0)) {
+             if (ctxt->context != NULL)
+-                ctxt->context->depth = 0;
++                oldDepth = ctxt->context->depth;
+ 	    xmlXPathOptimizeExpression(ctxt,
+ 		&ctxt->comp->steps[ctxt->comp->last]);
++            if (ctxt->context != NULL)
++                ctxt->context->depth = oldDepth;
+         }
+     }
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index f34b0c25ca..932251da98 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -42,6 +42,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2025-6021.patch \
            file://CVE-2025-49794-CVE-2025-49796.patch \
            file://CVE-2025-6170.patch \
+           file://CVE-2025-9714.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-- 
2.43.0


