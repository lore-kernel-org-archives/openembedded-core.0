Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC924E9B27A
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21270.1771943100814129043
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ijEaSwX4;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4833115090dso54046465e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943099; x=1772547899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQ7deOGN/ASrNd6cWeuAduL4Jogn81WrVdjhJAt45LA=;
        b=ijEaSwX4GaoTdljzJzb9E2nQqh8At9ozSSEP0bB8Zq6scxDoaMxjf4iq4q+5mu1ynd
         da+bbGyLxHxop1tHkBVosotSPVKXaJBNdhSdv/RZH0GOiKorQxi1o7aKF1+VD0A45x5G
         qUfQwgyREbMEId+a6ck/RMVSsaYoSnqP53VC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943099; x=1772547899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DQ7deOGN/ASrNd6cWeuAduL4Jogn81WrVdjhJAt45LA=;
        b=Vwgnu1q/ax9jqswrI/6rfnzQQQVyRvrLS6yfcW7gJ0eMfAocIeXkD3fNtZ8qgcyden
         opwagpJnNlX0HHBK+tLR1Ru6mdnYvIG4szir+OWcEK5LL8of8F+9hRDYjUWhXHdhneyj
         Za6XivQiIQDTQpyEqO4q1nWtr5oanhNiuVWb7Mba87x7UCsHar8Nq79lCuBpGBPeuGHK
         oZbMAaDTkMEHBjbCV2ojxAxuyP2VBLDW312OZgXHmJK/Ql2vL4FA7GHwtvXBW828a0CD
         3JHWtd4R1vveEsgN9QnIcwxJW1CxXDJc71WOkH+qLhIFGUM4tPfNRYNEiYWuf5F2g0T7
         ulQQ==
X-Gm-Message-State: AOJu0YxleUASzOrjamT1Pn60/kZQIk2GoaAjkek7SQi7Rhm/3NrWbm9c
	htwOXQnH0F+1thUZNJlbnS3c1toibxYHULkwlYYuZ41inXPW1diAw9YFYGTkEJW6tYHIXOqHUIu
	wzSoZ
X-Gm-Gg: AZuq6aKlJmHf4rUYttpC18gaYXs/Ef9JsQkZ/OmVwk+ENTqnFvGgFNRn/RekeA0ruqT
	GjTJgLqqm8Ge3XKX+z6Xc/Vy2cDC80pJP8v6Ly256FYvIIDLLQ/sG7mZ7dbC3+BrJ/iWwBfsePf
	6CZ2DT8bR1jZNYP8JSPcpn81rY0MzJV4iJKClAwhDdRKeCmGgeGce/J5zcbkLGx1IbQJEMCTPC9
	dKW/EreAX42y2Klqr0iSkQh2NWS4bPTtGO+Av+z73kFTmd3KjD2Rk6w6cnmBvKncM3V4Xp2XIEC
	GiaRlYPysLguYlFKJVDlPmNnlGrOd6dI6x9mBERVk1g7z/HRNAQ5Sc5e0Lfnntmcf8GJeDjMkMv
	xoUUdtIkkFsHHu5uheQtaMUfUrLw15xectUiz9WZZXtLFxgHn8uF1ZU0DXT7TJKv+yhJGLdupFL
	Tdhq/LXOLMSEY6gGZXKr//cwe1mqfcdBfTNyCCKtSOKVAtpDA93B/n0e5jo2RdsnOMDjP4Pt1GW
	ww7AA9m9hpyp0ls/altOWtRbcxnIKmYyCge6TSPMDcS
X-Received: by 2002:a05:600c:1e1d:b0:483:456a:514b with SMTP id 5b1f17b1804b1-483a95befe5mr207449395e9.12.1771943098778;
        Tue, 24 Feb 2026 06:24:58 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.24.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:24:58 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/38] expat: patch CVE-2026-24515
Date: Tue, 24 Feb 2026 15:23:59 +0100
Message-ID: <b5b1a1d0d10bd0723d547a7304922bd37329d37d.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231773

From: Peter Marko <peter.marko@siemens.com>

Pick fix commit from PR linked in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-24515.patch          | 43 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.5.0.bb        |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-24515.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-24515.patch b/meta/recipes-core/expat/expat/CVE-2026-24515.patch
new file mode 100644
index 00000000000..da11cf81cf1
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-24515.patch
@@ -0,0 +1,43 @@
+From 86fc914a7acc49246d5fde0ab6ed97eb8a0f15f9 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 18 Jan 2026 17:53:37 +0100
+Subject: [PATCH] lib: Make XML_ExternalEntityParserCreate copy unknown
+ encoding handler user data
+
+Patch suggested by Artiphishell Inc.
+
+CVE: CVE-2026-24515
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/86fc914a7acc49246d5fde0ab6ed97eb8a0f15f9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 593cd90d..18577ee3 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -1289,6 +1289,7 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser, const XML_Char *context,
+   XML_ExternalEntityRefHandler oldExternalEntityRefHandler;
+   XML_SkippedEntityHandler oldSkippedEntityHandler;
+   XML_UnknownEncodingHandler oldUnknownEncodingHandler;
++  void *oldUnknownEncodingHandlerData;
+   XML_ElementDeclHandler oldElementDeclHandler;
+   XML_AttlistDeclHandler oldAttlistDeclHandler;
+   XML_EntityDeclHandler oldEntityDeclHandler;
+@@ -1333,6 +1334,7 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser, const XML_Char *context,
+   oldExternalEntityRefHandler = parser->m_externalEntityRefHandler;
+   oldSkippedEntityHandler = parser->m_skippedEntityHandler;
+   oldUnknownEncodingHandler = parser->m_unknownEncodingHandler;
++  oldUnknownEncodingHandlerData = parser->m_unknownEncodingHandlerData;
+   oldElementDeclHandler = parser->m_elementDeclHandler;
+   oldAttlistDeclHandler = parser->m_attlistDeclHandler;
+   oldEntityDeclHandler = parser->m_entityDeclHandler;
+@@ -1391,6 +1393,7 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser, const XML_Char *context,
+   parser->m_externalEntityRefHandler = oldExternalEntityRefHandler;
+   parser->m_skippedEntityHandler = oldSkippedEntityHandler;
+   parser->m_unknownEncodingHandler = oldUnknownEncodingHandler;
++  parser->m_unknownEncodingHandlerData = oldUnknownEncodingHandlerData;
+   parser->m_elementDeclHandler = oldElementDeclHandler;
+   parser->m_attlistDeclHandler = oldAttlistDeclHandler;
+   parser->m_entityDeclHandler = oldEntityDeclHandler;
diff --git a/meta/recipes-core/expat/expat_2.5.0.bb b/meta/recipes-core/expat/expat_2.5.0.bb
index 33207ff0dab..ae661947c3a 100644
--- a/meta/recipes-core/expat/expat_2.5.0.bb
+++ b/meta/recipes-core/expat/expat_2.5.0.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 	   file://CVE-2024-45492.patch \
 	   file://CVE-2024-50602-01.patch \
 	   file://CVE-2024-50602-02.patch \
+	   file://CVE-2026-24515.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"

