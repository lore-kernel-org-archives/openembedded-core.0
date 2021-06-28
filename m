Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web09.12346.1624892771250668539
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 08:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=lp7SQJJy;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.49, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f49.google.com with SMTP id v5-20020a0568301bc5b029045c06b14f83so19045551ota.13
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 08:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZZV9FGN/GAW5jdAxfrlIjn1kJH/7P7/U72PV2U+usS0=;
        b=lp7SQJJyWiXY3Sbz+Tu/ffT0tr3BXw/cvCRigXtQOILWb2Q28s5LesgHG8yq1jk+WH
         3G54UZ+Vy0n6k/UhmBVzp5VW+YSlmBWU74Qu3VzNZomhLQ7aZ1O0A5w8vXLt8O2UkWoY
         pMmmbz0SVqGucL7o0/7rJMF4UTRwZ2tksGmCKnvEuYUcqOIB8jNlEmEI8AwrDNqQoklX
         sSbLn6s8geMAQB3uR46wv2CrfX+ljrY7OR4wD2HgZgXwS2mGTYqV/KGywtBmcdlgI82h
         DnkPoKHhnT+tXyW9IJ4IKwnoqgsh+WZf6K4yQ++NK98Z3Sganeryfj9mPCJDryUhv3yV
         kI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZZV9FGN/GAW5jdAxfrlIjn1kJH/7P7/U72PV2U+usS0=;
        b=PyWf4/guLLCiSFenxt1+pl7YGQhbf2hkZIgzPJXVhVLXoIjmZNSaynPUGYAvD0+ori
         vTh84u2bH+XesNYOvsQ/3aS8c0bcsQCuxzT5998LUlPcw1mliZdmcSkLLzZLiSugtkGx
         5Vp/B9RGxzCXA35gf5ZC12297aKbCw860EN4eY7dEJ8wiw+7mL8g1aq6t4ZDuvwzw5/S
         IJllwuPKEPsLkCQoF9g5c4pAmxEZOBJP27ixvUew4ZwWFyAQF4MP1jTUY7KHVsOoa05P
         W1T/2ckiVTn6hDBKFj2vJuHBuBIcEyqdy/Wi2x5hpyAPVc6hNlOBaCK7gRQEEWNh4o1T
         CEpA==
X-Gm-Message-State: AOAM531YSLrLsXbfR1bN+ntMKdnrJX+0qTSc2MVoU8bideUN/xIBu+w0
	4aOC31Uo5WKn4RN09IsaCna9Hemi2saLPbcitpg=
X-Google-Smtp-Source: ABdhPJzdJpSI70ElLfAmEAGlqOyjN2Aj8MGAdWK8GIznyQDz8wtK4icCYAndocJf9aaQaPxxqi6kYw==
X-Received: by 2002:a9d:64a:: with SMTP id 68mr63182otn.68.1624892769880;
        Mon, 28 Jun 2021 08:06:09 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id c21sm2095892otp.8.2021.06.28.08.06.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 08:06:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/14] libxml2: Fix CVE-2021-3518
Date: Mon, 28 Jun 2021 05:05:20 -1000
Message-Id: <ef2a81a473e7c36a36facb209ca907a7439d36f2.1624892565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1624892565.git.steve@sakoman.com>
References: <cover.1624892565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jasper Orschulko <jasper@fancydomain.eu>

There's a flaw in libxml2 in versions before 2.9.11. An attacker who is able to submit a crafted file to be processed by an application linked with libxml2 could trigger a use-after-free. The greatest impact from this flaw is to confidentiality, integrity, and availability.

Upstream-Status: Backport [from fedora:
https://bugzilla.redhat.com/show_bug.cgi?id=1954243]

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2021-3518.patch        | 112 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3518.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3518.patch b/meta/recipes-core/libxml/libxml2/CVE-2021-3518.patch
new file mode 100644
index 0000000000..40d3debea1
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3518.patch
@@ -0,0 +1,112 @@
+From ac82a514e16eb81b4506e2cba1a1ee45b9f025b5 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Wed, 10 Jun 2020 16:34:52 +0200
+Subject: [PATCH 1/2] Don't recurse into xi:include children in
+ xmlXIncludeDoProcess
+
+Otherwise, nested xi:include nodes might result in a use-after-free
+if XML_PARSE_NOXINCNODE is specified.
+
+Found with libFuzzer and ASan.
+
+Upstream-Status: Backport [from fedora: https://bugzilla.redhat.com/show_bug.cgi?id=1954243]
+
+The upstream patch 752e5f71d7cea2ca5a7e7c0b8f72ed04ce654be4 has been modified,
+as to avoid unnecessary modifications to fallback files.
+
+CVE: CVE-2021-3518
+Signed-off-by: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
+---
+ xinclude.c | 24 ++++++++++--------------
+ 1 file changed, 10 insertions(+), 14 deletions(-)
+
+diff --git a/xinclude.c b/xinclude.c
+index ba850fa5..f260c1a7 100644
+--- a/xinclude.c
++++ b/xinclude.c
+@@ -2392,21 +2392,19 @@ xmlXIncludeDoProcess(xmlXIncludeCtxtPtr ctxt, xmlDocPtr doc, xmlNodePtr tree) {
+      * First phase: lookup the elements in the document
+      */
+     cur = tree;
+-    if (xmlXIncludeTestNode(ctxt, cur) == 1)
+-	xmlXIncludePreProcessNode(ctxt, cur);
+     while ((cur != NULL) && (cur != tree->parent)) {
+ 	/* TODO: need to work on entities -> stack */
+-	if ((cur->children != NULL) &&
+-	    (cur->children->type != XML_ENTITY_DECL) &&
+-	    (cur->children->type != XML_XINCLUDE_START) &&
+-	    (cur->children->type != XML_XINCLUDE_END)) {
+-	    cur = cur->children;
+-	    if (xmlXIncludeTestNode(ctxt, cur))
+-		xmlXIncludePreProcessNode(ctxt, cur);
+-	} else if (cur->next != NULL) {
++        if (xmlXIncludeTestNode(ctxt, cur) == 1) {
++            xmlXIncludePreProcessNode(ctxt, cur);
++        } else if ((cur->children != NULL) &&
++                   (cur->children->type != XML_ENTITY_DECL) &&
++                   (cur->children->type != XML_XINCLUDE_START) &&
++                   (cur->children->type != XML_XINCLUDE_END)) {
++            cur = cur->children;
++            continue;
++        }
++	if (cur->next != NULL) {
+ 	    cur = cur->next;
+-	    if (xmlXIncludeTestNode(ctxt, cur))
+-		xmlXIncludePreProcessNode(ctxt, cur);
+ 	} else {
+ 	    if (cur == tree)
+ 	        break;
+@@ -2416,8 +2414,6 @@ xmlXIncludeDoProcess(xmlXIncludeCtxtPtr ctxt, xmlDocPtr doc, xmlNodePtr tree) {
+ 		    break; /* do */
+ 		if (cur->next != NULL) {
+ 		    cur = cur->next;
+-		    if (xmlXIncludeTestNode(ctxt, cur))
+-			xmlXIncludePreProcessNode(ctxt, cur);
+ 		    break; /* do */
+ 		}
+ 	    } while (cur != NULL);
+-- 
+2.32.0
+
+
+From 3ad5ac1e39e3cd42f838c1cd27ffd4e9b79e6121 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Thu, 22 Apr 2021 19:26:28 +0200
+Subject: [PATCH 2/2] Fix user-after-free with `xmllint --xinclude --dropdtd`
+
+The --dropdtd option can leave dangling pointers in entity reference
+nodes. Make sure to skip these nodes when processing XIncludes.
+
+This also avoids scanning entity declarations and even modifying
+them inadvertently during XInclude processing.
+
+Move from a block list to an allow list approach to avoid descending
+into other node types that can't contain elements.
+
+Fixes #237.
+Upstream-Status: Backport
+CVE: CVE-2021-3518
+Signed-off-by: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
+---
+ xinclude.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/xinclude.c b/xinclude.c
+index f260c1a7..d7648529 100644
+--- a/xinclude.c
++++ b/xinclude.c
+@@ -2397,9 +2397,8 @@ xmlXIncludeDoProcess(xmlXIncludeCtxtPtr ctxt, xmlDocPtr doc, xmlNodePtr tree) {
+         if (xmlXIncludeTestNode(ctxt, cur) == 1) {
+             xmlXIncludePreProcessNode(ctxt, cur);
+         } else if ((cur->children != NULL) &&
+-                   (cur->children->type != XML_ENTITY_DECL) &&
+-                   (cur->children->type != XML_XINCLUDE_START) &&
+-                   (cur->children->type != XML_XINCLUDE_END)) {
++                   ((cur->type == XML_DOCUMENT_NODE) ||
++                    (cur->type == XML_ELEMENT_NODE))) {
+             cur = cur->children;
+             continue;
+         }
+-- 
+2.32.0
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 097613fb28..b5fb3e6315 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://CVE-2020-24977.patch \
            file://CVE-2021-3517.patch \
            file://CVE-2021-3537.patch \
+           file://CVE-2021-3518.patch \
            "
 
 SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-- 
2.25.1

