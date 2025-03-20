Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587E3C36000
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 11:57:38 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.5644.1742471853469195596
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 04:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dyOmY1VU;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-225df540edcso36231915ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 04:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1742471852; x=1743076652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zz8KCJPcUM51QINnsDCAwT8lt6s7gxO8/0FRPgveueI=;
        b=dyOmY1VUI07ofaltX1LXvE4w7UqlZB9olXgY5gjLaHpe+ye6AxKG/CyyINystJOsC2
         /J2KFIOKViqP1yJgu73zNa2myCJ7YpIoBgnn/TckxRHOOoZxypqYvts+rmCrJepMgbxx
         l706zbzoE9DvjcDmeKbTm6YJBYwGMh37ERq10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742471852; x=1743076652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zz8KCJPcUM51QINnsDCAwT8lt6s7gxO8/0FRPgveueI=;
        b=dMXxzhxYrQoOItCLEKhTJ15YykXBGJvplR6eIl5UK+YLUKzoj+7NacQ0pxyn8DBZCU
         x8RLFd0WUyfSHDo8z013DZ+kTpTjeI7pmyF4jtjdGeZ//tNYo1Q0X1+llsKS7orCPOal
         V17edRwYDWLkr20As6gUH6+f6o4bQxWWxlmt1T251NK00NNPZEz3633/FHyStpP9xf7j
         QYDMyKs3n0urJhuYU+JTrGBDXJj5g0UwwkfTJ+vZJrr0hs9bXTBiMMZc0KSWdxFnq8S2
         62etqZDFHl8pL0AqNhiZLd40h4SjWmkgo+6g+0d5o5/4bmv2QlNG/4di529Tc2MU+RgJ
         Vbzg==
X-Gm-Message-State: AOJu0YxKow03aMtWJBFlIvcZWyKzzm3OZ/PHvZXe4/wwkpFCLOZi+FmI
	yD5eY8ezWZGlwns8KlIeEWso4Rwazli3cQTAqpw9ikD1R35uzngafzUTIAbn/BFv+7kOm5KxgY6
	V1iI=
X-Gm-Gg: ASbGnctYwl+GbB8j7Tl+SspRxgJgN44L4+bZT4D7HUbcwTSZV+e0Ch2yw0AZuWlUTza
	xK4zTpV9ppUmCW3Byp1Hk+63IM9c8uh+xsW6rwyOEgyncuHSARaLZBoWof/QvRIJaKcmHoToz35
	H9ytGCLlrvdRSVmaVdnh62eOtya9aoDK9oO4ZpEWOiWrmMEaYi3o+ZlTcuHhMCEu3IDmH0Fh7t4
	Nyb/3x38uGz22XwvsqZokHO8NIohf9346YqNo6MnKqIojYm+kz74caXguBlpmYwVo9eOtEkIH0g
	JfLiBaGtBXE5Xg6xeG2vI9M0Qd/j0azSeeOpyOKT327vF8+dzzTimWU=
X-Google-Smtp-Source: AGHT+IFSLTXjdeb4HWKw96ZMbF8KwjZLjhLeb2o9tAPHgeRg0Q3cu+SJYxGNWSs/aZjfRYeyP9Y1zA==
X-Received: by 2002:a05:6a00:4c1b:b0:736:bced:f4cf with SMTP id d2e1a72fcca58-73779f4a5c4mr4811795b3a.0.1742471852130;
        Thu, 20 Mar 2025 04:57:32 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.195.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739031c5ac5sm50508b3a.174.2025.03.20.04.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 04:57:31 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 2/2] libxslt: Fix for CVE-2025-24855
Date: Thu, 20 Mar 2025 17:27:06 +0530
Message-Id: <20250320115706.179605-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250320115706.179605-1-vanusuri@mvista.com>
References: <20250320115706.179605-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 11:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213384

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Commit: https://gitlab.gnome.org/GNOME/libxslt/-/commit/c7c7f1f78dd202a053996fcefe57eb994aec8ef2

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


