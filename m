Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3451E7E63B
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 14:12:23 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.20200.1695737538335928954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 07:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3M9fEt0w;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-692d2e8c003so3657574b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 07:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695737537; x=1696342337; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/nuVBpjx5sHofG3wvv+qSFpmzyoUSbLbgNm6RahiXw=;
        b=3M9fEt0woCz0Rj0aFZ4a9Y4y+nd3MjuswShZ9nLzAb12+0dl61VVJmj2+pDx4Cj7Um
         ob4x/PeOxxoWKMP4rFU/q/3UnjveP9004LQJ2LJk0pBGRd+uJhQymQgd360QVeDd8CBp
         aZYtQVLSJK9US1HeSFolEz24v4As5aYGTQY8aQ1p6pbDV4yUysYiK0CxhFzYFIYOp8dg
         1GJXoghRtCvtTfgCfIvpxTfELlY1a9nXqQvAlB8I29gwUEu9nqGQGa37mhXtUodo+srV
         G2VN+Q6V/a+YOt6tBa6AQZXefSkqbI3fHgKiQeJ5JikdhUbCpBw/hjvCKHQ7398VdBS6
         V/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695737537; x=1696342337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/nuVBpjx5sHofG3wvv+qSFpmzyoUSbLbgNm6RahiXw=;
        b=xM8Y9OyJDqRcP26d0nMYLrlFqH2OvvXiIMH6UwMVj882G1d9cDpYRLICk72j/Vpf5g
         JqIphicisw92RY11LuQugS69sI3bhaJBv/cYcSxdn49gatZrxDgwhmoYQbDAMu3QYWbi
         T5uXcKMiocECKo6VMM+7eQyP1YfE7o6aMOUw6V+zF0iXNDNjMyzDCaMLwHOBtXEJh3vl
         SqudCw8gqwvnbjSvn3Vf/1a+r9t0amafWLFDbNMupedckqItkjHheCy9vX3L1ZzJtzRT
         DERt6QqmFR3zOm3bnjCVG+Nh0BvI/x44dadl3OJKZmgLUFnpbGeVQxw7kf3LuRB2c74/
         Qwww==
X-Gm-Message-State: AOJu0YwrE9IW8G48Pl07AGSCMId2/6WfIWMVctW59evbQbomz3i3u680
	hltLHbaQtclJHpKETSpP04P8p2Dv+I22rMyLusg=
X-Google-Smtp-Source: AGHT+IH5oJel/aw+pw7sNa3xHhCaVoSY3zMUCUG0V37UrnSBY3GGotVOR464j9vbkoYAYN2Oppi4Og==
X-Received: by 2002:a05:6a21:78a5:b0:14c:7021:b3f1 with SMTP id bf37-20020a056a2178a500b0014c7021b3f1mr4178976pzc.21.1695737537265;
        Tue, 26 Sep 2023 07:12:17 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u7-20020a637907000000b00584b293d157sm1348861pgc.80.2023.09.26.07.12.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 07:12:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/7] libxml2: Fix CVE-2023-39615
Date: Tue, 26 Sep 2023 04:12:03 -1000
Message-Id: <d8a585a8c3712cdce9d9a5241ae7e620bc014ed9.1695737244.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695737244.git.steve@sakoman.com>
References: <cover.1695737244.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 14:12:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188248

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://gitlab.gnome.org/GNOME/libxml2/-/commit/d0c3f01e110d54415611c5fa0040cdf4a56053f9, https://gitlab.gnome.org/GNOME/libxml2/-/commit/235b15a590eecf97b09e87bdb7e4f8333e9de129]
CVE: CVE-2023-39615
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2023-39615-0001.patch  | 36 ++++++++++
 .../libxml/libxml2/CVE-2023-39615-0002.patch  | 71 +++++++++++++++++++
 .../libxml/libxml2/CVE-2023-39615-pre.patch   | 44 ++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  3 +
 4 files changed, 154 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-39615-0001.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-39615-0002.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-39615-pre.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2023-39615-0001.patch b/meta/recipes-core/libxml/libxml2/CVE-2023-39615-0001.patch
new file mode 100644
index 0000000000..9689cec67d
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2023-39615-0001.patch
@@ -0,0 +1,36 @@
+From d0c3f01e110d54415611c5fa0040cdf4a56053f9 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Sat, 6 May 2023 17:47:37 +0200
+Subject: [PATCH] parser: Fix old SAX1 parser with custom callbacks
+
+For some reason, xmlCtxtUseOptionsInternal set the start and end element
+SAX handlers to the internal DOM builder functions when XML_PARSE_SAX1
+was specified. This means that custom SAX handlers could never work with
+that flag because these functions would receive the wrong user data
+argument and crash immediately.
+
+Fixes #535.
+
+Upstream-Status: Backport from [https://gitlab.gnome.org/GNOME/libxml2/-/commit/d0c3f01e110d54415611c5fa0040cdf4a56053f9]
+CVE: CVE-2023-39615
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ parser.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/parser.c b/parser.c
+index 6e09208..7814e6e 100644
+--- a/parser.c
++++ b/parser.c
+@@ -15156,8 +15156,6 @@ xmlCtxtUseOptionsInternal(xmlParserCtxtPtr ctxt, int options, const char *encodi
+     }
+ #ifdef LIBXML_SAX1_ENABLED
+     if (options & XML_PARSE_SAX1) {
+-        ctxt->sax->startElement = xmlSAX2StartElement;
+-        ctxt->sax->endElement = xmlSAX2EndElement;
+         ctxt->sax->startElementNs = NULL;
+         ctxt->sax->endElementNs = NULL;
+         ctxt->sax->initialized = 1;
+-- 
+2.24.4
+
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2023-39615-0002.patch b/meta/recipes-core/libxml/libxml2/CVE-2023-39615-0002.patch
new file mode 100644
index 0000000000..ebd9868fac
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2023-39615-0002.patch
@@ -0,0 +1,71 @@
+From 235b15a590eecf97b09e87bdb7e4f8333e9de129 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Mon, 8 May 2023 17:58:02 +0200
+Subject: [PATCH] SAX: Always initialize SAX1 element handlers
+
+Follow-up to commit d0c3f01e. A parser context will be initialized to
+SAX version 2, but this can be overridden with XML_PARSE_SAX1 later,
+so we must initialize the SAX1 element handlers as well.
+
+Change the check in xmlDetectSAX2 to only look for XML_SAX2_MAGIC, so
+we don't switch to SAX1 if the SAX2 element handlers are NULL.
+
+Upstream-Status: Backport from [https://gitlab.gnome.org/GNOME/libxml2/-/commit/235b15a590eecf97b09e87bdb7e4f8333e9de129]
+CVE: CVE-2023-39615
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ SAX2.c   | 11 +++++++----
+ parser.c |  5 +----
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/SAX2.c b/SAX2.c
+index 5f141f9..902d34d 100644
+--- a/SAX2.c
++++ b/SAX2.c
+@@ -2869,20 +2869,23 @@ xmlSAXVersion(xmlSAXHandler *hdlr, int version)
+ {
+     if (hdlr == NULL) return(-1);
+     if (version == 2) {
+-	hdlr->startElement = NULL;
+-	hdlr->endElement = NULL;
+ 	hdlr->startElementNs = xmlSAX2StartElementNs;
+ 	hdlr->endElementNs = xmlSAX2EndElementNs;
+ 	hdlr->serror = NULL;
+ 	hdlr->initialized = XML_SAX2_MAGIC;
+ #ifdef LIBXML_SAX1_ENABLED
+     } else if (version == 1) {
+-	hdlr->startElement = xmlSAX2StartElement;
+-	hdlr->endElement = xmlSAX2EndElement;
+ 	hdlr->initialized = 1;
+ #endif /* LIBXML_SAX1_ENABLED */
+     } else
+         return(-1);
++#ifdef LIBXML_SAX1_ENABLED
++    hdlr->startElement = xmlSAX2StartElement;
++    hdlr->endElement = xmlSAX2EndElement;
++#else
++    hdlr->startElement = NULL;
++    hdlr->endElement = NULL;
++#endif /* LIBXML_SAX1_ENABLED */
+     hdlr->internalSubset = xmlSAX2InternalSubset;
+     hdlr->externalSubset = xmlSAX2ExternalSubset;
+     hdlr->isStandalone = xmlSAX2IsStandalone;
+diff --git a/parser.c b/parser.c
+index 7814e6e..cf0fb38 100644
+--- a/parser.c
++++ b/parser.c
+@@ -1102,10 +1102,7 @@ xmlDetectSAX2(xmlParserCtxtPtr ctxt) {
+     if (ctxt == NULL) return;
+     sax = ctxt->sax;
+ #ifdef LIBXML_SAX1_ENABLED
+-    if ((sax) &&  (sax->initialized == XML_SAX2_MAGIC) &&
+-        ((sax->startElementNs != NULL) ||
+-         (sax->endElementNs != NULL) ||
+-         ((sax->startElement == NULL) && (sax->endElement == NULL))))
++    if ((sax) && (sax->initialized == XML_SAX2_MAGIC))
+         ctxt->sax2 = 1;
+ #else
+     ctxt->sax2 = 1;
+-- 
+2.24.4
+
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2023-39615-pre.patch b/meta/recipes-core/libxml/libxml2/CVE-2023-39615-pre.patch
new file mode 100644
index 0000000000..b177cdaba0
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2023-39615-pre.patch
@@ -0,0 +1,44 @@
+From 99fc048d7f7292c5ee18e44c400bd73bc63a47ed Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Fri, 14 Aug 2020 14:18:50 +0200
+Subject: [PATCH] Don't use SAX1 if all element handlers are NULL
+
+Running xmllint with "--sax --noout" installs a SAX2 handler with all
+callbacks set to NULL. In this case or similar situations, we don't want
+to switch to SAX1 parsing.
+
+Note: This patch is needed for "CVE-2023-39615-0002" patch to apply.
+Without this patch the build will fail with undefined sax error.
+
+Upstream-Status: Backport from [https://gitlab.gnome.org/GNOME/libxml2/-/commit/99fc048d7f7292c5ee18e44c400bd73bc63a47ed]
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ parser.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/parser.c b/parser.c
+index bb677b0..6e09208 100644
+--- a/parser.c
++++ b/parser.c
+@@ -1098,11 +1098,15 @@ xmlHasFeature(xmlFeature feature)
+  */
+ static void
+ xmlDetectSAX2(xmlParserCtxtPtr ctxt) {
++    xmlSAXHandlerPtr sax;
+     if (ctxt == NULL) return;
++    sax = ctxt->sax;
+ #ifdef LIBXML_SAX1_ENABLED
+-    if ((ctxt->sax) &&  (ctxt->sax->initialized == XML_SAX2_MAGIC) &&
+-        ((ctxt->sax->startElementNs != NULL) ||
+-         (ctxt->sax->endElementNs != NULL))) ctxt->sax2 = 1;
++    if ((sax) &&  (sax->initialized == XML_SAX2_MAGIC) &&
++        ((sax->startElementNs != NULL) ||
++         (sax->endElementNs != NULL) ||
++         ((sax->startElement == NULL) && (sax->endElement == NULL))))
++        ctxt->sax2 = 1;
+ #else
+     ctxt->sax2 = 1;
+ #endif /* LIBXML_SAX1_ENABLED */
+-- 
+2.24.4
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 034192d64e..5eac864098 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -38,6 +38,9 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            file://CVE-2022-40304.patch \
            file://CVE-2023-28484.patch \
            file://CVE-2023-29469.patch \
+           file://CVE-2023-39615-pre.patch \
+           file://CVE-2023-39615-0001.patch \
+           file://CVE-2023-39615-0002.patch \
            "
 
 SRC_URI[archive.sha256sum] = "593b7b751dd18c2d6abcd0c4bcb29efc203d0b4373a6df98e3a455ea74ae2813"
-- 
2.34.1


