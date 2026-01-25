Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F160E63CAC
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 18:41:30 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1995.1769366479817429361
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 10:41:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=agMqCATE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260125184116dcbbe5cd090002073d-msjl2x@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260125184116dcbbe5cd090002073d
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Jan 2026 19:41:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=kQpxP8zLYTe5ovWkkOFkr+5vXRJa0BHndhPEAXQb/uI=;
 b=agMqCATEvgGMyos/pvpRBBThHnB/q9osGKyXdd1q+KPuu36XlqP9eghtr9Vkj61+VpHr4/
 JzhcocewQ0bJmVEBCUBWE5MWgCkQD6ZXL7mOdCEeroh3fQmFTmUtDBOMML5rXYoG9CaNE8sx
 4rsnZFYB5Zjwkfx9FQAnjQYvbfp9EH55mciTwtQHAId5eYUzyixM3hLgF/W7G5/I+qE/NiPl
 fw09aiMCDitSl1maXgsq4FmGJJ6CSZxnxMoUxLHZ+4Z9RhE1fns8VA/UjihMTZwj0qPXR5rP
 VENiVcY/GjZ4xVh0rDjBjVT7UMOY07ZhLjcaaI9fEoc6gbByH+y3h6rw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] libxml2: patch CVE-2026-0989
Date: Sun, 25 Jan 2026 19:34:20 +0100
Message-Id: <20260125183420.1541068-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 18:41:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229940

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1] linked from [2].

[1] https://gitlab.gnome.org/GNOME/libxml2/-/merge_requests/374
[2] https://gitlab.gnome.org/GNOME/libxml2/-/issues/998

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libxml/libxml2/CVE-2026-0989.patch        | 309 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.15.1.bb    |   1 +
 2 files changed, 310 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch
new file mode 100644
index 0000000000..635a39a7ed
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
+@@ -136,6 +136,10 @@ XMLPUBFUN int
+ 		    xmlRelaxParserSetFlag	(xmlRelaxNGParserCtxt *ctxt,
+ 						 int flag);
+ 
++XMLPUBFUN int
++		    xmlRelaxParserSetIncLImit	(xmlRelaxNGParserCtxt *ctxt,
++						 int limit);
++
+ XMLPUBFUN void
+ 		    xmlRelaxNGFreeParserCtxt	(xmlRelaxNGParserCtxt *ctxt);
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
+@@ -44,6 +46,12 @@
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
+@@ -218,6 +226,7 @@ struct _xmlRelaxNGParserCtxt {
+     int incNr;                  /* Depth of the include parsing stack */
+     int incMax;                 /* Max depth of the parsing stack */
+     xmlRelaxNGIncludePtr *incTab;       /* array of incs */
++    int incLimit;               /* Include limit, to avoid stack-overflow on parse */
+ 
+     int idref;                  /* requires idref checking */
+ 
+@@ -1342,6 +1351,23 @@ xmlRelaxParserSetFlag(xmlRelaxNGParserCtxt *ctxt, int flags)
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
+@@ -1397,7 +1423,7 @@ xmlRelaxReadMemory(xmlRelaxNGParserCtxtPtr ctxt, const char *buf, int size) {
+  *
+  * @param ctxt  the parser context
+  * @param value  the element doc
+- * @returns 0 in case of error, the index in the stack otherwise
++ * @returns -1 in case of error, the index in the stack otherwise
+  */
+ static int
+ xmlRelaxNGIncludePush(xmlRelaxNGParserCtxtPtr ctxt,
+@@ -1411,9 +1437,15 @@ xmlRelaxNGIncludePush(xmlRelaxNGParserCtxtPtr ctxt,
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
+@@ -1422,7 +1454,7 @@ xmlRelaxNGIncludePush(xmlRelaxNGParserCtxtPtr ctxt,
+                                                 sizeof(ctxt->incTab[0]));
+         if (ctxt->incTab == NULL) {
+             xmlRngPErrMemory(ctxt);
+-            return (0);
++            return (-1);
+         }
+     }
+     ctxt->incTab[ctxt->incNr] = value;
+@@ -1586,7 +1618,9 @@ xmlRelaxNGLoadInclude(xmlRelaxNGParserCtxtPtr ctxt, const xmlChar * URL,
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
+@@ -7261,11 +7295,32 @@ xmlRelaxNGParse(xmlRelaxNGParserCtxt *ctxt)
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
+@@ -3741,6 +3741,70 @@ rngTest(const char *filename,
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
+  * Parse a set of files with streaming, applying an RNG schemas
+@@ -5202,6 +5266,9 @@ testDesc testDescriptions[] = {
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
diff --git a/meta/recipes-core/libxml/libxml2_2.15.1.bb b/meta/recipes-core/libxml/libxml2_2.15.1.bb
index a64ed8098e..2f741a2d71 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.1.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.1.bb
@@ -21,6 +21,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
            file://0001-testlimits-optionally-accept-timeout-input.patch \
+           file://CVE-2026-0989.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c008bac08fd5c7b4a87f7b8a71f283fa581d80d80ff8d2efd3b26224c39bc54c"

