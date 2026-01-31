Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8766AD79752
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:57:16 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5114.1769846229529528642
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:57:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SlzF1vKn;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-480706554beso30112815e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 23:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846228; x=1770451028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTVkd4KTBvQc/6KVUqUEFryBrJnLPCIPb4f9Mf7fC7Y=;
        b=SlzF1vKn69X+lgE1RmQuEDyK3KpsMbiV5pVzKbRq2F0xKCErmgs6OM3Pi4bz4/pvBG
         I4y1aZKAy1zVqLJapENJRi9BDOc6tsfWeAC0nI7hTZgotJw5p8zu4YooOr8GVgv+FwqI
         +AeMWM9cXVIBmtvfkXm+7+U26Z8Pl9e7a97Fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846228; x=1770451028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pTVkd4KTBvQc/6KVUqUEFryBrJnLPCIPb4f9Mf7fC7Y=;
        b=At8jB3kxtVh+1Mjy8RRyP2J1xjaUWYnZik2Wri4fWnXP6FM0zrMQb6oMZxqZl+b50s
         NDZovXwNYwvll3Q/yjkHjFjaRzLNPzZf1Ci4IJ+DDFbobnGtZ88NuzpUDGZM7Y2VfmHR
         nKPrgbrtdY33R5BtaouLpBkbsIFwMZkSE+0h68iwKp0tVEgkXyhTEgNBep44VtRj9EjZ
         FX1l4jBnJ7+QqNCW8GBVwZUlNwGfBaGOGUGhv5KLjEpA8Ldzjykl48WHNl91bnaaSae3
         zOGOL9d5rCCnVmWOWGXR2uQL1GkehRw9zuIClFK3Ls5c6JUNCpwUMTLv2K32wgOxUI26
         zb2A==
X-Gm-Message-State: AOJu0Yycdn7YYas6x0y7ynyTXvK6vzlYYfhzXBMVW+UKeQ2q2KbM11FW
	yr+LKDbanyX/kNsKX4htT86Qpmi5u5/XE3Kq8FHkCgWJ6dFl1jGM64WZelbJVVZqBCstDJe4cUx
	GF9alLXo=
X-Gm-Gg: AZuq6aKV0TET/colqPjh2GAaDOZ/nUNBmygwfqTqmA/K6mxCoCDVmjF5d84pzfgcuNj
	3Geb0oVbprWx0+o5K4BUmqn3KSIb3GZXmNfw4KrKEs+0CnVHmv2h2x9aGeH6iaOGmLMe/ZFO5ls
	iFqRZ8nSNSKFlOcsUbtZzf/Qu90evSRf7gHU/1B/rYURwnKhMrBC7Q+y5BZlRMJIkXmVUW3OXx6
	hhoNTxnldIBsPj7+OhVWvdUer3FRhlDg2haheu1ib8lOIICUU4oJunrcDkOWAC0IU/l308v3YJH
	2mIwRY7gCzbt2IXcn7CywuTiKVuSau6v0G2JQybg17afarwOKVtx1YKnpkyUvbFnSb9kvnDZNlE
	xIu12lSMhKl39PWEnF/tAbV0exsUBTEIfhyayracJhGyaBBsL4LNwf+bU0RNq4WQY/6UjO7WwOg
	vOX0522MXUjQcXRBprtIcLUVrnkW1wZqYgPS9FssBoi6i2Nif6MKBtxLkI0Xy1YW+IHWcBKoES/
	4tQFhFf4hPjNh/H
X-Received: by 2002:a05:600c:8b31:b0:47e:e78a:c832 with SMTP id 5b1f17b1804b1-482db4b692dmr61480905e9.37.1769846227563;
        Fri, 30 Jan 2026 23:57:07 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fa8b238ae1dd6dd8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fa8b:238a:e1dd:6dd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm258621475e9.14.2026.01.30.23.57.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:57:06 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 19/22] libxml2: patch CVE-2026-0989
Date: Sat, 31 Jan 2026 08:56:30 +0100
Message-ID: <d99c5471f0a2f0b390d038f3c7aa1c7942ab5e99.1769845858.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769845858.git.yoann.congal@smile.fr>
References: <cover.1769845858.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 07:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230224

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1] linked from [2].

[1] https://gitlab.gnome.org/GNOME/libxml2/-/merge_requests/374
[2] https://gitlab.gnome.org/GNOME/libxml2/-/issues/998

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libxml/libxml2/CVE-2026-0989.patch        | 309 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.14.6.bb    |   1 +
 2 files changed, 310 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch
new file mode 100644
index 00000000000..5fcfd2280ad
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch
@@ -0,0 +1,309 @@
+From 19549c61590c1873468c53e0026a2fbffae428ef Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Fri, 10 Oct 2025 09:38:31 +0200
+Subject: [PATCH] Add RelaxNG include limit
+
+This patch adds a default xmlRelaxNGIncludeLimit of 1.000, and that
+limit can be modified at runtime with the env variable
+RNG_INCLUDE_LIMIT.
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/issues/998
+
+CVE: CVE-2026-0989
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/19549c61590c1873468c53e0026a2fbffae428ef]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ include/libxml/relaxng.h                 |  4 ++
+ relaxng.c                                | 63 ++++++++++++++++++++--
+ runtest.c                                | 67 ++++++++++++++++++++++++
+ test/relaxng/include/include-limit.rng   |  4 ++
+ test/relaxng/include/include-limit_1.rng |  4 ++
+ test/relaxng/include/include-limit_2.rng |  4 ++
+ test/relaxng/include/include-limit_3.rng |  8 +++
+ 7 files changed, 150 insertions(+), 4 deletions(-)
+ create mode 100644 test/relaxng/include/include-limit.rng
+ create mode 100644 test/relaxng/include/include-limit_1.rng
+ create mode 100644 test/relaxng/include/include-limit_2.rng
+ create mode 100644 test/relaxng/include/include-limit_3.rng
+
+diff --git a/include/libxml/relaxng.h b/include/libxml/relaxng.h
+index eafc6604..099dacd8 100644
+--- a/include/libxml/relaxng.h
++++ b/include/libxml/relaxng.h
+@@ -139,6 +139,10 @@ XMLPUBFUN int
+ 		    xmlRelaxParserSetFlag	(xmlRelaxNGParserCtxtPtr ctxt,
+ 						 int flag);
+ 
++XMLPUBFUN int
++		    xmlRelaxParserSetIncLImit	(xmlRelaxNGParserCtxt *ctxt,
++						 int limit);
++
+ XMLPUBFUN void
+ 		    xmlRelaxNGFreeParserCtxt	(xmlRelaxNGParserCtxtPtr ctxt);
+ XMLPUBFUN void
+diff --git a/relaxng.c b/relaxng.c
+index 1d74ba9f..c0e94a3c 100644
+--- a/relaxng.c
++++ b/relaxng.c
+@@ -18,6 +18,8 @@
+ 
+ #ifdef LIBXML_RELAXNG_ENABLED
+ 
++#include <errno.h>
++#include <stdlib.h>
+ #include <string.h>
+ #include <stdio.h>
+ #include <stddef.h>
+@@ -43,6 +45,12 @@
+ static const xmlChar *xmlRelaxNGNs = (const xmlChar *)
+     "http://relaxng.org/ns/structure/1.0";
+ 
++/*
++ * Default include limit, this can be override with RNG_INCLUDE_LIMIT
++ * env variable
++ */
++static const int _xmlRelaxNGIncludeLimit = 1000;
++
+ #define IS_RELAXNG(node, typ)						\
+    ((node != NULL) && (node->ns != NULL) &&				\
+     (node->type == XML_ELEMENT_NODE) &&					\
+@@ -219,6 +227,7 @@ struct _xmlRelaxNGParserCtxt {
+     int incNr;                  /* Depth of the include parsing stack */
+     int incMax;                 /* Max depth of the parsing stack */
+     xmlRelaxNGIncludePtr *incTab;       /* array of incs */
++    int incLimit;               /* Include limit, to avoid stack-overflow on parse */
+ 
+     int idref;                  /* requires idref checking */
+ 
+@@ -1405,6 +1414,23 @@ xmlRelaxParserSetFlag(xmlRelaxNGParserCtxtPtr ctxt, int flags)
+     return(0);
+ }
+ 
++/**
++ * Semi private function used to set the include recursion limit to a
++ * parser context. Set to 0 to use the default value.
++ *
++ * @param ctxt  a RelaxNG parser context
++ * @param limit the new include depth limit
++ * @returns 0 if success and -1 in case of error
++ */
++int
++xmlRelaxParserSetIncLImit(xmlRelaxNGParserCtxt *ctxt, int limit)
++{
++    if (ctxt == NULL) return(-1);
++    if (limit < 0) return(-1);
++    ctxt->incLimit = limit;
++    return(0);
++}
++
+ /************************************************************************
+  *									*
+  *			Document functions				*
+@@ -1462,7 +1488,7 @@ xmlRelaxReadMemory(xmlRelaxNGParserCtxtPtr ctxt, const char *buf, int size) {
+  *
+  * Pushes a new include on top of the include stack
+  *
+- * Returns 0 in case of error, the index in the stack otherwise
++ * Returns -1 in case of error, the index in the stack otherwise
+  */
+ static int
+ xmlRelaxNGIncludePush(xmlRelaxNGParserCtxtPtr ctxt,
+@@ -1476,9 +1502,15 @@ xmlRelaxNGIncludePush(xmlRelaxNGParserCtxtPtr ctxt,
+                                                sizeof(ctxt->incTab[0]));
+         if (ctxt->incTab == NULL) {
+             xmlRngPErrMemory(ctxt);
+-            return (0);
++            return (-1);
+         }
+     }
++    if (ctxt->incNr >= ctxt->incLimit) {
++        xmlRngPErr(ctxt, (xmlNodePtr)value->doc, XML_RNGP_PARSE_ERROR,
++                   "xmlRelaxNG: inclusion recursion limit reached\n", NULL, NULL);
++        return(-1);
++    }
++
+     if (ctxt->incNr >= ctxt->incMax) {
+         ctxt->incMax *= 2;
+         ctxt->incTab =
+@@ -1487,7 +1519,7 @@ xmlRelaxNGIncludePush(xmlRelaxNGParserCtxtPtr ctxt,
+                                                 sizeof(ctxt->incTab[0]));
+         if (ctxt->incTab == NULL) {
+             xmlRngPErrMemory(ctxt);
+-            return (0);
++            return (-1);
+         }
+     }
+     ctxt->incTab[ctxt->incNr] = value;
+@@ -1657,7 +1689,9 @@ xmlRelaxNGLoadInclude(xmlRelaxNGParserCtxtPtr ctxt, const xmlChar * URL,
+     /*
+      * push it on the stack
+      */
+-    xmlRelaxNGIncludePush(ctxt, ret);
++    if (xmlRelaxNGIncludePush(ctxt, ret) < 0) {
++        return (NULL);
++    }
+ 
+     /*
+      * Some preprocessing of the document content, this include recursing
+@@ -7381,11 +7415,32 @@ xmlRelaxNGParse(xmlRelaxNGParserCtxtPtr ctxt)
+     xmlDocPtr doc;
+     xmlNodePtr root;
+ 
++    const char *include_limit_env = getenv("RNG_INCLUDE_LIMIT");
++
+     xmlRelaxNGInitTypes();
+ 
+     if (ctxt == NULL)
+         return (NULL);
+ 
++    if (ctxt->incLimit == 0) {
++        ctxt->incLimit = _xmlRelaxNGIncludeLimit;
++        if (include_limit_env != NULL) {
++            char *strEnd;
++            unsigned long val = 0;
++            errno = 0;
++            val = strtoul(include_limit_env, &strEnd, 10);
++            if (errno != 0 || *strEnd != 0 || val > INT_MAX) {
++                xmlRngPErr(ctxt, NULL, XML_RNGP_PARSE_ERROR,
++                           "xmlRelaxNGParse: invalid RNG_INCLUDE_LIMIT %s\n",
++                           (const xmlChar*)include_limit_env,
++                           NULL);
++                return(NULL);
++            }
++            if (val)
++                ctxt->incLimit = val;
++        }
++    }
++
+     /*
+      * First step is to parse the input document into an DOM/Infoset
+      */
+diff --git a/runtest.c b/runtest.c
+index 49519aef..45109f0a 100644
+--- a/runtest.c
++++ b/runtest.c
+@@ -3832,6 +3832,70 @@ rngTest(const char *filename,
+     return(ret);
+ }
+ 
++/**
++ * Parse an RNG schemas with a custom RNG_INCLUDE_LIMIT
++ *
++ * @param filename  the schemas file
++ * @param result  the file with expected result
++ * @param err  the file with error messages
++ * @returns 0 in case of success, an error code otherwise
++ */
++static int
++rngIncludeTest(const char *filename,
++               const char *resul ATTRIBUTE_UNUSED,
++               const char *errr ATTRIBUTE_UNUSED,
++               int options ATTRIBUTE_UNUSED) {
++    xmlRelaxNGParserCtxtPtr ctxt;
++    xmlRelaxNGPtr schemas;
++    int ret = 0;
++
++    /* first compile the schemas if possible */
++    ctxt = xmlRelaxNGNewParserCtxt(filename);
++    xmlRelaxNGSetParserStructuredErrors(ctxt, testStructuredErrorHandler,
++                                        NULL);
++
++    /* Should work */
++    schemas = xmlRelaxNGParse(ctxt);
++    if (schemas == NULL) {
++        testErrorHandler(NULL, "Relax-NG schema %s failed to compile\n",
++                         filename);
++        ret = -1;
++        goto done;
++    }
++    xmlRelaxNGFree(schemas);
++    xmlRelaxNGFreeParserCtxt(ctxt);
++
++    ctxt = xmlRelaxNGNewParserCtxt(filename);
++    /* Should fail */
++    xmlRelaxParserSetIncLImit(ctxt, 2);
++    xmlRelaxNGSetParserStructuredErrors(ctxt, testStructuredErrorHandler,
++                                        NULL);
++    schemas = xmlRelaxNGParse(ctxt);
++    if (schemas != NULL) {
++        ret = -1;
++        xmlRelaxNGFree(schemas);
++    }
++    xmlRelaxNGFreeParserCtxt(ctxt);
++
++    ctxt = xmlRelaxNGNewParserCtxt(filename);
++    /* Should work */
++    xmlRelaxParserSetIncLImit(ctxt, 3);
++    xmlRelaxNGSetParserStructuredErrors(ctxt, testStructuredErrorHandler,
++                                        NULL);
++    schemas = xmlRelaxNGParse(ctxt);
++    if (schemas == NULL) {
++        testErrorHandler(NULL, "Relax-NG schema %s failed to compile\n",
++                         filename);
++        ret = -1;
++        goto done;
++    }
++    xmlRelaxNGFree(schemas);
++
++done:
++    xmlRelaxNGFreeParserCtxt(ctxt);
++    return(ret);
++}
++
+ #ifdef LIBXML_READER_ENABLED
+ /**
+  * rngStreamTest:
+@@ -5299,6 +5363,9 @@ testDesc testDescriptions[] = {
+     { "Relax-NG regression tests" ,
+       rngTest, "./test/relaxng/*.rng", NULL, NULL, NULL,
+       XML_PARSE_DTDATTR | XML_PARSE_NOENT },
++    { "Relax-NG include limit tests" ,
++      rngIncludeTest, "./test/relaxng/include/include-limit.rng", NULL, NULL, NULL,
++      0 },
+ #ifdef LIBXML_READER_ENABLED
+     { "Relax-NG streaming regression tests" ,
+       rngStreamTest, "./test/relaxng/*.rng", NULL, NULL, NULL,
+diff --git a/test/relaxng/include/include-limit.rng b/test/relaxng/include/include-limit.rng
+new file mode 100644
+index 00000000..51f03942
+--- /dev/null
++++ b/test/relaxng/include/include-limit.rng
+@@ -0,0 +1,4 @@
++<?xml version="1.0" encoding="UTF-8"?>
++<grammar xmlns="http://relaxng.org/ns/structure/1.0">
++    <include href="include-limit_1.rng"/>
++</grammar>
+diff --git a/test/relaxng/include/include-limit_1.rng b/test/relaxng/include/include-limit_1.rng
+new file mode 100644
+index 00000000..4672da38
+--- /dev/null
++++ b/test/relaxng/include/include-limit_1.rng
+@@ -0,0 +1,4 @@
++<?xml version="1.0" encoding="UTF-8"?>
++<grammar xmlns="http://relaxng.org/ns/structure/1.0">
++    <include href="include-limit_2.rng"/>
++</grammar>
+diff --git a/test/relaxng/include/include-limit_2.rng b/test/relaxng/include/include-limit_2.rng
+new file mode 100644
+index 00000000..b35ecaa8
+--- /dev/null
++++ b/test/relaxng/include/include-limit_2.rng
+@@ -0,0 +1,4 @@
++<?xml version="1.0" encoding="UTF-8"?>
++<grammar xmlns="http://relaxng.org/ns/structure/1.0">
++    <include href="include-limit_3.rng"/>
++</grammar>
+diff --git a/test/relaxng/include/include-limit_3.rng b/test/relaxng/include/include-limit_3.rng
+new file mode 100644
+index 00000000..86213c62
+--- /dev/null
++++ b/test/relaxng/include/include-limit_3.rng
+@@ -0,0 +1,8 @@
++<?xml version="1.0" encoding="UTF-8"?>
++<grammar xmlns="http://relaxng.org/ns/structure/1.0">
++    <start>
++        <element name="root">
++            <empty/>
++        </element>
++    </start>
++</grammar>
diff --git a/meta/recipes-core/libxml/libxml2_2.14.6.bb b/meta/recipes-core/libxml/libxml2_2.14.6.bb
index 6ed8760f4cd..f214fcd88f6 100644
--- a/meta/recipes-core/libxml/libxml2_2.14.6.bb
+++ b/meta/recipes-core/libxml/libxml2_2.14.6.bb
@@ -19,6 +19,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
            file://CVE-2025-6021.patch \
+           file://CVE-2026-0989.patch \
            "
 
 SRC_URI[archive.sha256sum] = "7ce458a0affeb83f0b55f1f4f9e0e55735dbfc1a9de124ee86fb4a66b597203a"

