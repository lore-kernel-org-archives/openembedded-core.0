Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF860EDEC66
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 14:31:06 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.13478.1694615458629080644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 07:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=v+83pKnM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-68fdd5c1bbbso783768b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 07:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694615457; x=1695220257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ZZq/br3fitBNJYHGeKR9ByROS5V52+zDHbwGWdg57o=;
        b=v+83pKnMQRrntQZdD92D5dd3Li093hjgBF69j4H/aUNvXk+JE4CscmvCdck6mJAVYw
         V32I6BiGGhrvXeg4NljisI08MyOeO8KHCBpbztuv2lBhmKvMD/r3uoufyeMj0L5ZSWI0
         o9Wgx47INKeaKUNy4gp3f5+LjL9HDmmM2UG48HeRVTKxpKEYj8XoN9kunrcLZOokaZuE
         EtMG4tPOJbyLOx+aZsl2HXaNoy3wQ1MMoXpzqPZoi//NcknAdLUz4nsWMOse8tHR74yf
         h54MvlqLl/2UPlOZpiQ/8WHB+Lb8wgRc0buRi8ss6f24aPXtCNlMscO5nMV5pY8rPR5p
         1q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694615457; x=1695220257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZZq/br3fitBNJYHGeKR9ByROS5V52+zDHbwGWdg57o=;
        b=OU/yeCR4s4RxqiTDahQRMNI9C3kgP0PcOVzgIAUrJw9okRF/DVbn+PX2Eghj+mqbhh
         2GlA0AoCTB7m04/8zWD90COtv56WNe82SwkSgWWYCXvBaGUcgOazT2brWZEInohYmOww
         sQxq5OXaeFAMIhwNRAx9waAf018RDsPUTPJxxQZwaK/Obm5hCWulIaPV5oouVNrowanp
         MJWvQZ96z3+sSpylQ1mwLDwQbdo4l4SqxBsK0MSf8HIKmdVburTAl4fLa4wou/1eL590
         eKaUx4NjgU+I3WkZG3duQohsVNNaySgV2mZNwy/v29WMSzZWq0TmSiZcFhKKgmZfGL+f
         7gww==
X-Gm-Message-State: AOJu0YwzJb5/l12ImlSZfhXMLqm8q9776qHurgQjj3XGzmbbynCEDp3Y
	OfQjYAfVtPrCuBcLkWMtZZM1nkqpE+kHqFPwIEE=
X-Google-Smtp-Source: AGHT+IHkp1EtuOxijMvVXi3mTSx/BAHuwkvpxo/faSaeNBzSu2LIPHII3Lyvjyzak+t9XatvbQv/Sw==
X-Received: by 2002:a05:6a00:985:b0:68a:48e7:9deb with SMTP id u5-20020a056a00098500b0068a48e79debmr9860814pfg.2.1694615457127;
        Wed, 13 Sep 2023 07:30:57 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u2-20020aa78382000000b00686ec858fb0sm9185796pfm.190.2023.09.13.07.30.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 07:30:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/8] libxml2: Fix CVE-2023-39615
Date: Wed, 13 Sep 2023 04:30:36 -1000
Message-Id: <9a2ad95caffae37014fa27d9b20d45f9779d0fbf.1694613269.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694613269.git.steve@sakoman.com>
References: <cover.1694613269.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 14:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187599

From: Soumya Sambu <soumya.sambu@windriver.com>

Xmlsoft Libxml2 v2.11.0 was discovered to contain a global buffer overflow via
the xmlSAX2StartElement() function at /libxml2/SAX2.c. This vulnerability
allows attackers to cause a Denial of Service (DoS) via supplying a crafted XML
file.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-39615

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2023-39615-0001.patch  | 37 ++++++++++
 .../libxml/libxml2/CVE-2023-39615-0002.patch  | 72 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  2 +
 3 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-39615-0001.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-39615-0002.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2023-39615-0001.patch b/meta/recipes-core/libxml/libxml2/CVE-2023-39615-0001.patch
new file mode 100644
index 0000000000..3506779c4c
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2023-39615-0001.patch
@@ -0,0 +1,37 @@
+From d0c3f01e110d54415611c5fa0040cdf4a56053f9 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Sat May 6 17:47:37 2023 +0200
+Subject: [PATCH 1/2] parser: Fix old SAX1 parser with custom callbacks
+
+For some reason, xmlCtxtUseOptionsInternal set the start and end element
+SAX handlers to the internal DOM builder functions when XML_PARSE_SAX1
+was specified. This means that custom SAX handlers could never work with
+that flag because these functions would receive the wrong user data
+argument and crash immediately.
+
+Fixes #535.
+
+CVE: CVE-2023-39615
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/d0c3f01e110d54415611c5fa0040cdf4a56053f9]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ parser.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/parser.c b/parser.c
+index 0f76577..b781c80 100644
+--- a/parser.c
++++ b/parser.c
+@@ -15069,8 +15069,6 @@ xmlCtxtUseOptionsInternal(xmlParserCtxtPtr ctxt, int options, const char *encodi
+     }
+ #ifdef LIBXML_SAX1_ENABLED
+     if (options & XML_PARSE_SAX1) {
+-        ctxt->sax->startElement = xmlSAX2StartElement;
+-        ctxt->sax->endElement = xmlSAX2EndElement;
+         ctxt->sax->startElementNs = NULL;
+         ctxt->sax->endElementNs = NULL;
+         ctxt->sax->initialized = 1;
+--
+2.40.0
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2023-39615-0002.patch b/meta/recipes-core/libxml/libxml2/CVE-2023-39615-0002.patch
new file mode 100644
index 0000000000..d922ddc730
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2023-39615-0002.patch
@@ -0,0 +1,72 @@
+From 235b15a590eecf97b09e87bdb7e4f8333e9de129 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Mon May 8 17:58:02 2023 +0200
+Subject: [PATCH 2/2] SAX: Always initialize SAX1 element handlers
+
+Follow-up to commit d0c3f01e. A parser context will be initialized to
+SAX version 2, but this can be overridden with XML_PARSE_SAX1 later,
+so we must initialize the SAX1 element handlers as well.
+
+Change the check in xmlDetectSAX2 to only look for XML_SAX2_MAGIC, so
+we don't switch to SAX1 if the SAX2 element handlers are NULL.
+
+CVE: CVE-2023-39615
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/235b15a590eecf97b09e87bdb7e4f8333e9de129]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ SAX2.c   | 11 +++++++----
+ parser.c |  5 +----
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/SAX2.c b/SAX2.c
+index 0319246..f7c77c2 100644
+--- a/SAX2.c
++++ b/SAX2.c
+@@ -2842,20 +2842,23 @@ xmlSAXVersion(xmlSAXHandler *hdlr, int version)
+ {
+     if (hdlr == NULL) return(-1);
+     if (version == 2) {
+-	hdlr->startElement = NULL;
+-	hdlr->endElement = NULL;
+	hdlr->startElementNs = xmlSAX2StartElementNs;
+	hdlr->endElementNs = xmlSAX2EndElementNs;
+	hdlr->serror = NULL;
+	hdlr->initialized = XML_SAX2_MAGIC;
+ #ifdef LIBXML_SAX1_ENABLED
+     } else if (version == 1) {
+-	hdlr->startElement = xmlSAX2StartElement;
+-	hdlr->endElement = xmlSAX2EndElement;
+	hdlr->initialized = 1;
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
+index b781c80..738dbee 100644
+--- a/parser.c
++++ b/parser.c
+@@ -1109,10 +1109,7 @@ xmlDetectSAX2(xmlParserCtxtPtr ctxt) {
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
+2.40.0
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index 9241b279e4..437bccf4ed 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -27,6 +27,8 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2022-40304.patch \
            file://CVE-2023-28484.patch \
            file://CVE-2023-29469.patch \
+           file://CVE-2023-39615-0001.patch \
+           file://CVE-2023-39615-0002.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-- 
2.34.1


