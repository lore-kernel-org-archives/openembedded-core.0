Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75384C36008
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 19:37:05 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.48753.1742845024708503699
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 12:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Wqwo/2T3;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30332dfc821so2987092a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 12:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1742845024; x=1743449824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmafGn9/Blnfs0qqsq3Z8EmHAbx1BfnNsCq/g8q28gI=;
        b=Wqwo/2T3kFqj/1F0OdA4ilnNJr5gaG66ltKyVc7CbrPlgoJ1neXmnLegh7jd1WiMJu
         pQFT/g6o/igKOrzMox9g+ao8/vpA8tv7rtALh8C2CIfzn6Dijm7e9zWgern29KCpC+g+
         1qptkjFu/cg57i+nPoOb303yyxidnZke0/1eoTlY3egb0RXBqhK0G+Cd9qgY4jdhpkXy
         hCLmoFZ4NFVsukOA19iiie8LDNw+1I5s3PXLhGSb8fNjFHGhnkM8y9cFIxNmns6+v0mx
         R/Xzvaq3ZT+Qcqla4Zr4UYQ1e3AA3nkuu+/kLoZIzLCxn0dqi7dAxhMDR5C4psHzwz4y
         KAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742845024; x=1743449824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmafGn9/Blnfs0qqsq3Z8EmHAbx1BfnNsCq/g8q28gI=;
        b=iJCv06dz+bCRE/8/xC4FyAOLoU3b3t/cC7prwUSWD6sC6EWNnkuPeVZH4Af4k91Z9y
         l9faf0xXzSzmvXQbIuZZjauujuy/P2tjx9GQQAXYb+YWixyQXUSVmao4ndgGG5Q2f4D+
         GkGyX6LV3/tAIaHqkuH2AtU0V9shJq+6zMDp/0HFrdnbvQAbByeIBPFVcODMI2CLsw26
         1a8z2hXcIgGC1mImPZY2h9ORTg47w3OeApIH1TfzWR16zE76SLfJeSKY2bQndaXF12ia
         SLZInq14gGQvW3VfZhGcfDGELVgRh1cICEYuq0yehucJ45TWopRO/aEREtRnUpA036oD
         N6CA==
X-Gm-Message-State: AOJu0YxfcQGFIFt6WEzpjMKIYYOZgnF7PBMLsMmuFLfhKxU4z2x9xsya
	dF+LUUHgL91Jf/1sKhOX2uasx/g+DkqHW9Ds0BNDJ9/mcntEG+dh4cvAVel25oOJESELtfdMmUY
	H
X-Gm-Gg: ASbGnctD3hBBgtkirZJydob7jHPE2ZRHuQ1KaXGaeXPtpkeKZy2QxQR5zcdwAOgwwtn
	8n/hSDDihH9uOTC8m3lg9OHb1mRDCUn1tJhumesEoeyj3CMJIJhCgqQzeU8EkN31kep/S+Thd3r
	3UhPU9efiLrbkxIqSiV7G3FKlvnBLeNcREsOedTGMKwGQrAcl9Pvkn4SPFfGOQKTTRegaBDPuv4
	Pw0bbMY6kSu1B0w02f6ewWECIdl5l7Oakd+mjujFx3A83Qgoc6GyQZlnMNrfJZHzg6JWg1WaHev
	RSHkzxg5YYrNWDUaU6Dis3l6FWZT3z5kxdmM
X-Google-Smtp-Source: AGHT+IF7iQHGK2I+QhsmMIclHwAo/BPqE6EYXNFNdM7SzhwOrxD6vqfz4fSnSY0AVW8eZdC8yNZiPA==
X-Received: by 2002:a17:90b:5105:b0:2ea:37b4:5373 with SMTP id 98e67ed59e1d1-3030fea47e8mr24509986a91.10.1742845023690;
        Mon, 24 Mar 2025 12:37:03 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:ee18:96b4:93d3:b88c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f806b48sm8640876a91.44.2025.03.24.12.37.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 12:37:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/6] libxslt: Fix for CVE-2025-24855
Date: Mon, 24 Mar 2025 12:36:50 -0700
Message-ID: <eced74ca3be7d6c47e7c50152a36e0b1e8eba74a.1742844907.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1742844907.git.steve@sakoman.com>
References: <cover.1742844907.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 19:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213575

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Commit: https://gitlab.gnome.org/GNOME/libxslt/-/commit/c7c7f1f78dd202a053996fcefe57eb994aec8ef2

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxslt/libxslt/CVE-2025-24855.patch      | 134 ++++++++++++++++++
 .../recipes-support/libxslt/libxslt_1.1.35.bb |   1 +
 2 files changed, 135 insertions(+)
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2025-24855.patch

diff --git a/meta/recipes-support/libxslt/libxslt/CVE-2025-24855.patch b/meta/recipes-support/libxslt/libxslt/CVE-2025-24855.patch
new file mode 100644
index 0000000000..b8c2f5b0c8
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/CVE-2025-24855.patch
@@ -0,0 +1,134 @@
+From c7c7f1f78dd202a053996fcefe57eb994aec8ef2 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 17 Dec 2024 15:56:21 +0100
+Subject: [PATCH] [CVE-2025-24855] Fix use-after-free of XPath context node
+
+There are several places where the XPath context node isn't restored
+after modifying it, leading to use-after-free errors with nested XPath
+evaluations and dynamically allocated context nodes.
+
+Restore XPath context node in
+
+- xsltNumberFormatGetValue
+- xsltEvalXPathPredicate
+- xsltEvalXPathStringNs
+- xsltComputeSortResultInternal
+
+In some places, the transformation context node was saved and restored
+which shouldn't be necessary.
+
+Thanks to Ivan Fratric for the report!
+
+Fixes #128.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxslt/-/commit/c7c7f1f78dd202a053996fcefe57eb994aec8ef2]
+CVE: CVE-2025-24855
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libxslt/numbers.c   | 5 +++++
+ libxslt/templates.c | 9 ++++++---
+ libxslt/xsltutils.c | 4 ++--
+ 3 files changed, 13 insertions(+), 5 deletions(-)
+
+diff --git a/libxslt/numbers.c b/libxslt/numbers.c
+index 0e1fa136..741124d1 100644
+--- a/libxslt/numbers.c
++++ b/libxslt/numbers.c
+@@ -733,9 +733,12 @@ xsltNumberFormatGetValue(xmlXPathContextPtr context,
+     int amount = 0;
+     xmlBufferPtr pattern;
+     xmlXPathObjectPtr obj;
++    xmlNodePtr oldNode;
+ 
+     pattern = xmlBufferCreate();
+     if (pattern != NULL) {
++        oldNode = context->node;
++
+ 	xmlBufferCCat(pattern, "number(");
+ 	xmlBufferCat(pattern, value);
+ 	xmlBufferCCat(pattern, ")");
+@@ -748,6 +751,8 @@ xsltNumberFormatGetValue(xmlXPathContextPtr context,
+ 	    xmlXPathFreeObject(obj);
+ 	}
+ 	xmlBufferFree(pattern);
++
++        context->node = oldNode;
+     }
+     return amount;
+ }
+diff --git a/libxslt/templates.c b/libxslt/templates.c
+index f08b9bda..1c8d96e2 100644
+--- a/libxslt/templates.c
++++ b/libxslt/templates.c
+@@ -61,6 +61,7 @@ xsltEvalXPathPredicate(xsltTransformContextPtr ctxt, xmlXPathCompExprPtr comp,
+     int oldNsNr;
+     xmlNsPtr *oldNamespaces;
+     xmlNodePtr oldInst;
++    xmlNodePtr oldNode;
+     int oldProximityPosition, oldContextSize;
+ 
+     if ((ctxt == NULL) || (ctxt->inst == NULL)) {
+@@ -69,6 +70,7 @@ xsltEvalXPathPredicate(xsltTransformContextPtr ctxt, xmlXPathCompExprPtr comp,
+         return(0);
+     }
+ 
++    oldNode = ctxt->xpathCtxt->node;
+     oldContextSize = ctxt->xpathCtxt->contextSize;
+     oldProximityPosition = ctxt->xpathCtxt->proximityPosition;
+     oldNsNr = ctxt->xpathCtxt->nsNr;
+@@ -96,8 +98,9 @@ xsltEvalXPathPredicate(xsltTransformContextPtr ctxt, xmlXPathCompExprPtr comp,
+ 	ctxt->state = XSLT_STATE_STOPPED;
+ 	ret = 0;
+     }
+-    ctxt->xpathCtxt->nsNr = oldNsNr;
+ 
++    ctxt->xpathCtxt->node = oldNode;
++    ctxt->xpathCtxt->nsNr = oldNsNr;
+     ctxt->xpathCtxt->namespaces = oldNamespaces;
+     ctxt->inst = oldInst;
+     ctxt->xpathCtxt->contextSize = oldContextSize;
+@@ -137,7 +140,7 @@ xsltEvalXPathStringNs(xsltTransformContextPtr ctxt, xmlXPathCompExprPtr comp,
+     }
+ 
+     oldInst = ctxt->inst;
+-    oldNode = ctxt->node;
++    oldNode = ctxt->xpathCtxt->node;
+     oldPos = ctxt->xpathCtxt->proximityPosition;
+     oldSize = ctxt->xpathCtxt->contextSize;
+     oldNsNr = ctxt->xpathCtxt->nsNr;
+@@ -167,7 +170,7 @@ xsltEvalXPathStringNs(xsltTransformContextPtr ctxt, xmlXPathCompExprPtr comp,
+ 	 "xsltEvalXPathString: returns %s\n", ret));
+ #endif
+     ctxt->inst = oldInst;
+-    ctxt->node = oldNode;
++    ctxt->xpathCtxt->node = oldNode;
+     ctxt->xpathCtxt->contextSize = oldSize;
+     ctxt->xpathCtxt->proximityPosition = oldPos;
+     ctxt->xpathCtxt->nsNr = oldNsNr;
+diff --git a/libxslt/xsltutils.c b/libxslt/xsltutils.c
+index 0e9dc62f..a20da961 100644
+--- a/libxslt/xsltutils.c
++++ b/libxslt/xsltutils.c
+@@ -1065,8 +1065,8 @@ xsltComputeSortResultInternal(xsltTransformContextPtr ctxt, xmlNodePtr sort,
+ 	return(NULL);
+     }
+ 
+-    oldNode = ctxt->node;
+     oldInst = ctxt->inst;
++    oldNode = ctxt->xpathCtxt->node;
+     oldPos = ctxt->xpathCtxt->proximityPosition;
+     oldSize = ctxt->xpathCtxt->contextSize;
+     oldNsNr = ctxt->xpathCtxt->nsNr;
+@@ -1137,8 +1137,8 @@ xsltComputeSortResultInternal(xsltTransformContextPtr ctxt, xmlNodePtr sort,
+ 	    results[i] = NULL;
+ 	}
+     }
+-    ctxt->node = oldNode;
+     ctxt->inst = oldInst;
++    ctxt->xpathCtxt->node = oldNode;
+     ctxt->xpathCtxt->contextSize = oldSize;
+     ctxt->xpathCtxt->proximityPosition = oldPos;
+     ctxt->xpathCtxt->nsNr = oldNsNr;
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.35.bb b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
index 1f0d845421..3df372b267 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.35.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
@@ -15,6 +15,7 @@ DEPENDS = "libxml2"
 
 SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz \
            file://CVE-2024-55549.patch \
+           file://CVE-2025-24855.patch \
           "
 
 SRC_URI[sha256sum] = "8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eebc10c93ce1f34dd79"
-- 
2.43.0


