Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143DDC021B0
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 21:10:18 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.7388.1739913016180906444
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 13:10:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jt53pTg4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f441791e40so8783702a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739913015; x=1740517815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pmiwlVNY6OUne2IPets111kb9dtbxiGOLeH+/HD145k=;
        b=jt53pTg4crnGUta4aeZWQaqMiqKcGwSmoRxof0If2Rc6dQ029qEiHAycLvDUq2lzmT
         OPWKNAMYN+7q8Y45M3o1iscSe8FF0BtymbT2/Qwfcyz+l4f84aF3PseQyiFDJusOeOKx
         V/w/o5WlUlFqt9g30twgyrcFSmGWgUEITtdZ3zHi0935PpBqSJnYMzWCYuQj2GA23AyN
         LInCmyQsV7GtPNJ5QujOwk6JOHgqTlR8lBQ7m/A2rXjA9GyOAQ+r8+xhdiXAtr6trYef
         mHwNfHs02aC1oU/bjotGripXPYl/OtBOHXZQhDFwhPy4xGespYdfYKes07mQGiNN76iz
         D7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739913015; x=1740517815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmiwlVNY6OUne2IPets111kb9dtbxiGOLeH+/HD145k=;
        b=laNbJiH0oVu0gId5gmlh3GlPYs5ciy43mNRjGUTDxgIVcsmdXgT53pXBOnVsAaca8L
         gV9JSd7biTuyVQ6DUIvSbbOh3RQQEKrc73V+Vtv7y4YlJmWp5tMZ13oheKvgXcj0ILvH
         XxlDGgiSPTic57t5XfPe2tu9NHhA5Z/SDS5xzhaQrqlZESIKLxnpJGsYRXA0AG2LFCNq
         d4IKYBZJIkTsX9VIOLXJgaHxDSQPEWeUifqPFaUZEq7Nqhcw8l/Q5Q3wQeSDFOWLTaAA
         hGQ51WCOjoTNoS3HYA60ODF+cm+5qiyNOMAGagYPFmBuYPTl6FgVvh7ZO5Fry21og1Tc
         rS3w==
X-Gm-Message-State: AOJu0YwWgJvALgifaPkiMgFnG8mcOUWl3Ii/xz7EWYGuGDZOyGwRChz1
	of/pzYhqlUkV1/UbQXYYTN1zx1/0HYAooQbQyIG+KOz+/iNobbJm/rfmQO7+ApSmMrzohu3oTMH
	W
X-Gm-Gg: ASbGncuiw5avgetaHb0P7/7X+YjICXlONLDhrZ4zbYwFpsBGaUWcMFKNgcg0/PYgfxD
	3H7MYYt9MGfjiuQbPfikotUFgmRBLMXOW8W6gaMSg3oZNQnBiC1rkAUCFXxnpMLwubpG1G4YM3x
	CyTfSDlMujC30ybyX9X+PgloCskPnxlD2wGaVhMdlgKhF71yi/z3Qgxk5RlEUvXbuo1etSWHmcf
	WoS42TW71bGsPTgEykgYR+m8TA5yuH/BSi2NJysEE40dD+EtsloOuhOeqgUBkrdmy2bfUBQ1MdI
	/2yf9RU=
X-Google-Smtp-Source: AGHT+IEpOJWLdr5+XfcB17jYpsNRynHXQNH/2SjoMxzj7MN0n7c2Tfo7OKgSkSSMCwDbcGB8ZDlnqQ==
X-Received: by 2002:a17:90b:4c0c:b0:2ee:c6c8:d89f with SMTP id 98e67ed59e1d1-2fc40f108e9mr26436524a91.14.1739913015433;
        Tue, 18 Feb 2025 13:10:15 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:83c7:94a9:a555:bf05])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b326bsm12820720a91.1.2025.02.18.13.10.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 13:10:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/12] libxml2: Fix for CVE-2022-49043
Date: Tue, 18 Feb 2025 13:09:56 -0800
Message-ID: <bd66a1a4b420463283ee40a7153e6f7edbb3a0bb.1739912869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739912869.git.steve@sakoman.com>
References: <cover.1739912869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 21:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211642

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/5a19e21605398cef6a8b1452477a8705cb41562b]

Reference:
https://access.redhat.com/security/cve/cve-2022-49043

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2022-49043.patch       | 38 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-49043.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2022-49043.patch b/meta/recipes-core/libxml/libxml2/CVE-2022-49043.patch
new file mode 100644
index 0000000000..25c7bc847c
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2022-49043.patch
@@ -0,0 +1,38 @@
+From 5a19e21605398cef6a8b1452477a8705cb41562b Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Wed, 2 Nov 2022 16:13:27 +0100
+Subject: [PATCH] malloc-fail: Fix use-after-free in xmlXIncludeAddNode
+
+Found with libFuzzer, see #344.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/5a19e21605398cef6a8b1452477a8705cb41562b]
+CVE: CVE-2022-49043
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xinclude.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/xinclude.c b/xinclude.c
+index e5fdf0f..36fa8ec 100644
+--- a/xinclude.c
++++ b/xinclude.c
+@@ -612,14 +612,15 @@ xmlXIncludeAddNode(xmlXIncludeCtxtPtr ctxt, xmlNodePtr cur) {
+     }
+     URL = xmlSaveUri(uri);
+     xmlFreeURI(uri);
+-    xmlFree(URI);
+     if (URL == NULL) {
+ 	xmlXIncludeErr(ctxt, cur, XML_XINCLUDE_HREF_URI,
+ 	               "invalid value URI %s\n", URI);
+ 	if (fragment != NULL)
+ 	    xmlFree(fragment);
++	xmlFree(URI);
+ 	return(-1);
+     }
++    xmlFree(URI);
+ 
+     if (xmlStrEqual(URL, ctxt->doc->URL))
+ 	local = 1;
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index 94b3b510ae..ecaae0b436 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -33,6 +33,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2023-45322-2.patch \
            file://CVE-2024-25062.patch \
            file://CVE-2024-34459.patch \
+           file://CVE-2022-49043.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-- 
2.43.0


