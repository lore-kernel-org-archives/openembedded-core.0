Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D889E9B274
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:10 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21269.1771943100435410678
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qHpOeV7V;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso45147935e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943099; x=1772547899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scwdX76KmJoUgEjsUPWaYTJyc79taAry713zGbUZxhw=;
        b=qHpOeV7V6mBPpXiJVZS3mPglk1kqUMy1tZQq5gpdgpH23tifGewC5vdVUzpFvOvFTj
         7tj7KN1kR2Y+icSyyR+QZGGlsAkMZp3e9y2ZJ/VO3lY+eYl7VqWgO3R/oanC4qZAX2NJ
         ZDqsptwePCa+ecMU6h8AC8DEFXNokJXlx2eUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943099; x=1772547899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=scwdX76KmJoUgEjsUPWaYTJyc79taAry713zGbUZxhw=;
        b=F98gf5BIFTKziD865jexFHswUp3U868OMpwk1pWgx1Ai4CqK2V9/Sshtooo8pfNl4g
         60zOhF/oPOIq+/dU409wX4dsAvVwLJ+wNDvpi4SM4YyejZ30K8rj4JrqAcl+fYf3/RXi
         gRfD2byVsB3sHARJ/R0Vk3lXh2DhZ/EZMlw+B4rT2Z/a0ugQWPTPIb9/eJn5iKKFOxrp
         oSGYGGVTHBzTkPaNIlPfYrYWgSAeLKIKPsyjwCc4cnoC8IGrjgwtHMkdo9I32U/4dN5Y
         Wfik+SIw0kZrEYius34z/HU03kHPW5nbHv1excNYOJbXMlkDJ+3FRvWjIR6+8de5bXEh
         iofg==
X-Gm-Message-State: AOJu0Yxc2+CdqtYCFITRG0QFaAsqlNqnNNoFqDWVKdm0QKPnsCoZkgiz
	BXJf4lotqbbUjyi1yK9vmWplMkhSIJOGmFfdpIILuWVPsNskVHoZovYtJSXcCqXebRLcUMsYyhk
	F8LnA
X-Gm-Gg: AZuq6aJK1wXGXO2IzHC2rr22r/XtjQtfaARuypqcSleVZwEK9wjLqHrfpN/YMrRWys8
	eln+VsJeo3zb1vJVoXaruhIJ6ye4sNPwIA6r34pQ5D1GjjTdYqJr2AAM9wTbxYNvsLZfQRFEXk4
	koJYUx+JNYLRND4kabEuVX3xXHbCsYxEyNC5bHvgIGE/7r+uOhluvdHDFRAGbyGt1PUP2R+Af5+
	q6owDnrovlLMiuN1hfIF6JeH5Pl6WuLbuo2V1dwNN6LMfpVQAvA5JuiXA76zRtcbaGqNVgVXowV
	ASWXqDaMSaJusFFG8Wj1L/VsmIlZLdOOsgtMaRjJiJ9C+UfcfRe+A/DHLQ3uTAZLh8MKSP6djed
	oGYDRS2PnapFDJJ45GmnLKi3yAOndVYORvAj2+h+mdfjWSR9KE4URT7Iwexsx3mdYYZfZl1VYLe
	PRRplyOENmQ5E/n5r+k9MGY0aW0XJGgTUOX6XYIfrnwy5EWvprctNkjvKqgNvqea9McHVgIiShN
	o24Z83JbuiQrUG2Y/tE85ztE/u3q/nlgv1TAiMiUcmw
X-Received: by 2002:a05:600c:4f95:b0:483:8e43:6def with SMTP id 5b1f17b1804b1-483a95e5a97mr188760825e9.28.1771943098153;
        Tue, 24 Feb 2026 06:24:58 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.24.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:24:57 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/38] libxml2: add follow-up patch for CVE-2026-0992
Date: Tue, 24 Feb 2026 15:23:58 +0100
Message-ID: <4bf920205f1290e0894b5fce47e35ca5c1bd41aa.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231772

From: Peter Marko <peter.marko@siemens.com>

References:
* https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019
* https://gitlab.gnome.org/GNOME/libxml2/-/merge_requests/377

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...2026-0992.patch => CVE-2026-0992-01.patch} |   0
 .../libxml/libxml2/CVE-2026-0992-02.patch     | 325 ++++++++++++++++++
 .../libxml/libxml2/CVE-2026-0992-03.patch     |  33 ++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   4 +-
 4 files changed, 361 insertions(+), 1 deletion(-)
 rename meta/recipes-core/libxml/libxml2/{CVE-2026-0992.patch => CVE-2026-0992-01.patch} (100%)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-03.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0992-01.patch
similarity index 100%
rename from meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch
rename to meta/recipes-core/libxml/libxml2/CVE-2026-0992-01.patch
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.patch
new file mode 100644
index 00000000000..50f72832d45
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.patch
@@ -0,0 +1,325 @@
+From f8399e62a31095bf1ced01827c33f9b29494046f Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Fri, 19 Dec 2025 12:27:54 +0100
+Subject: [PATCH] testcatalog: Add new tests for catalog.c
+
+Adds a new test program to run specific tests related to catalog
+parsing.
+
+This initial version includes a couple of tests, the first one to check
+the infinite recursion detection related to:
+https://gitlab.gnome.org/GNOME/libxml2/-/issues/1018.
+
+The second one tests the nextCatalog element repeated parsing, related
+to:
+https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019
+https://gitlab.gnome.org/GNOME/libxml2/-/issues/1040
+
+CVE: CVE-2026-0992
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/f8399e62a31095bf1ced01827c33f9b29494046f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ CMakeLists.txt                          |  2 +
+ Makefile.am                             |  8 ++-
+ catalog.c                               | 63 +++++++++++-----
+ include/libxml/catalog.h                |  2 +
+ test/catalogs/catalog-recursive.xml     |  3 +
+ test/catalogs/repeated-next-catalog.xml | 10 +++
+ testcatalog.c                           | 96 +++++++++++++++++++++++++
+ 7 files changed, 164 insertions(+), 20 deletions(-)
+ create mode 100644 test/catalogs/catalog-recursive.xml
+ create mode 100644 test/catalogs/repeated-next-catalog.xml
+ create mode 100644 testcatalog.c
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 163661f8..7d5702df 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -555,6 +555,7 @@ if(LIBXML2_WITH_TESTS)
+ 		testapi
+ 		testAutomata
+ 		testC14N
++		testcatalog
+ 		testchar
+ 		testdict
+ 		testHTML
+@@ -579,6 +580,7 @@ if(LIBXML2_WITH_TESTS)
+ 	if(NOT WIN32)
+ 		add_test(NAME testapi COMMAND testapi)
+ 	endif()
++	add_test(NAME testcatalog COMMAND testcatalog)
+ 	add_test(NAME testchar COMMAND testchar)
+ 	add_test(NAME testdict COMMAND testdict)
+ 	add_test(NAME testrecurse COMMAND testrecurse WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
+diff --git a/Makefile.am b/Makefile.am
+index c51dfd8e..c794eac8 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -12,7 +12,7 @@ AM_CFLAGS = $(EXTRA_CFLAGS) $(THREAD_CFLAGS) $(Z_CFLAGS) $(LZMA_CFLAGS)
+ 
+ check_PROGRAMS=testSchemas testRelax testSAX testHTML testXPath testURI \
+                testThreads testC14N testAutomata testRegexp \
+-               testReader testapi testModule runtest runsuite testchar \
++               testReader testapi testModule runtest runsuite testcatalog testchar \
+ 	       testdict runxmlconf testrecurse testlimits
+ 
+ bin_PROGRAMS = xmllint xmlcatalog
+@@ -81,6 +81,11 @@ testlimits_LDFLAGS =
+ testlimits_DEPENDENCIES = $(DEPS)
+ testlimits_LDADD= $(BASE_THREAD_LIBS) $(RDL_LIBS) $(LDADDS)
+ 
++testcatalog_SOURCES=testcatalog.c
++testcatalog_LDFLAGS = 
++testcatalog_DEPENDENCIES = $(DEPS)
++testcatalog_LDADD= $(LDADDS)
++
+ testchar_SOURCES=testchar.c
+ testchar_LDFLAGS = 
+ testchar_DEPENDENCIES = $(DEPS)
+@@ -213,6 +218,7 @@ runtests:
+ 	$(CHECKER) ./runtest$(EXEEXT) && \
+ 	    $(CHECKER) ./testrecurse$(EXEEXT) && \
+ 	    ASAN_OPTIONS="$$ASAN_OPTIONS:detect_leaks=0" $(CHECKER) ./testapi$(EXEEXT) && \
++	    $(CHECKER) ./testcatalog$(EXEEXT) \
+ 	    $(CHECKER) ./testchar$(EXEEXT) && \
+ 	    $(CHECKER) ./testdict$(EXEEXT) && \
+ 	    $(CHECKER) ./runxmlconf$(EXEEXT)
+diff --git a/catalog.c b/catalog.c
+index 401dbc14..eb889162 100644
+--- a/catalog.c
++++ b/catalog.c
+@@ -658,43 +658,54 @@ static void xmlDumpXMLCatalogNode(xmlCatalogEntryPtr catal, xmlNodePtr catalog,
+     }
+ }
+ 
+-static int
+-xmlDumpXMLCatalog(FILE *out, xmlCatalogEntryPtr catal) {
+-    int ret;
+-    xmlDocPtr doc;
++static xmlDocPtr
++xmlDumpXMLCatalogToDoc(xmlCatalogEntryPtr catal) {
+     xmlNsPtr ns;
+     xmlDtdPtr dtd;
+     xmlNodePtr catalog;
+-    xmlOutputBufferPtr buf;
++    xmlDocPtr doc = xmlNewDoc(NULL);
++    if (doc == NULL) {
++        return(NULL);
++    }
+ 
+-    /*
+-     * Rebuild a catalog
+-     */
+-    doc = xmlNewDoc(NULL);
+-    if (doc == NULL)
+-	return(-1);
+     dtd = xmlNewDtd(doc, BAD_CAST "catalog",
+-	       BAD_CAST "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN",
+-BAD_CAST "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd");
++                    BAD_CAST "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN",
++                    BAD_CAST "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd");
+ 
+     xmlAddChild((xmlNodePtr) doc, (xmlNodePtr) dtd);
+ 
+     ns = xmlNewNs(NULL, XML_CATALOGS_NAMESPACE, NULL);
+     if (ns == NULL) {
+-	xmlFreeDoc(doc);
+-	return(-1);
++        xmlFreeDoc(doc);
++        return(NULL);
+     }
+     catalog = xmlNewDocNode(doc, ns, BAD_CAST "catalog", NULL);
+     if (catalog == NULL) {
+-	xmlFreeNs(ns);
+-	xmlFreeDoc(doc);
+-	return(-1);
++        xmlFreeDoc(doc);
++        xmlFreeNs(ns);
++        return(NULL);
+     }
+     catalog->nsDef = ns;
+     xmlAddChild((xmlNodePtr) doc, catalog);
+-
+     xmlDumpXMLCatalogNode(catal, catalog, doc, ns, NULL);
+ 
++    return(doc);
++}
++
++static int
++xmlDumpXMLCatalog(FILE *out, xmlCatalogEntryPtr catal) {
++    int ret;
++    xmlDocPtr doc;
++    xmlOutputBufferPtr buf;
++
++    /*
++     * Rebuild a catalog
++     */
++    doc = xmlDumpXMLCatalogToDoc(catal);
++    if (doc == NULL) {
++        return(-1);
++    }
++
+     /*
+      * reserialize it
+      */
+@@ -3430,6 +3441,20 @@ xmlCatalogDump(FILE *out) {
+ 
+     xmlACatalogDump(xmlDefaultCatalog, out);
+ }
++
++/**
++ * Dump all the global catalog content as a xmlDoc
++ * This function is just for testing/debugging purposes
++ *
++ * @returns  The catalog as xmlDoc or NULL if failed, it must be freed by the caller.
++ */
++xmlDocPtr
++xmlCatalogDumpDoc(void) {
++    if (!xmlCatalogInitialized)
++        xmlInitializeCatalog();
++
++    return xmlDumpXMLCatalogToDoc(xmlDefaultCatalog->xml);
++}
+ #endif /* LIBXML_OUTPUT_ENABLED */
+ 
+ /**
+diff --git a/include/libxml/catalog.h b/include/libxml/catalog.h
+index 88a7483c..e1bc5feb 100644
+--- a/include/libxml/catalog.h
++++ b/include/libxml/catalog.h
+@@ -119,6 +119,8 @@ XMLPUBFUN void XMLCALL
+ #ifdef LIBXML_OUTPUT_ENABLED
+ XMLPUBFUN void XMLCALL
+ 		xmlCatalogDump		(FILE *out);
++XMLPUBFUN xmlDocPtr
++		xmlCatalogDumpDoc	(void);
+ #endif /* LIBXML_OUTPUT_ENABLED */
+ XMLPUBFUN xmlChar * XMLCALL
+ 		xmlCatalogResolve	(const xmlChar *pubID,
+diff --git a/test/catalogs/catalog-recursive.xml b/test/catalogs/catalog-recursive.xml
+new file mode 100644
+index 00000000..3b3d03f9
+--- /dev/null
++++ b/test/catalogs/catalog-recursive.xml
+@@ -0,0 +1,3 @@
++<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
++    <delegateURI uriStartString="/foo" catalog="catalog-recursive.xml"/>
++</catalog>
+diff --git a/test/catalogs/repeated-next-catalog.xml b/test/catalogs/repeated-next-catalog.xml
+new file mode 100644
+index 00000000..76d34c3c
+--- /dev/null
++++ b/test/catalogs/repeated-next-catalog.xml
+@@ -0,0 +1,10 @@
++<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
++  <nextCatalog catalog="registry.xml"/>
++  <nextCatalog catalog="registry.xml"/>
++  <nextCatalog catalog="./registry.xml"/>
++  <nextCatalog catalog="././registry.xml"/>
++  <nextCatalog catalog="./././registry.xml"/>
++  <nextCatalog catalog="./../catalogs/registry.xml"/>
++  <nextCatalog catalog="./../catalogs/./registry.xml"/>
++</catalog>
++
+diff --git a/testcatalog.c b/testcatalog.c
+new file mode 100644
+index 00000000..86d33bd0
+--- /dev/null
++++ b/testcatalog.c
+@@ -0,0 +1,96 @@
++/*
++ * testcatalog.c: C program to run libxml2 catalog.c unit tests
++ *
++ * To compile on Unixes:
++ * cc -o testcatalog `xml2-config --cflags` testcatalog.c `xml2-config --libs` -lpthread
++ *
++ * See Copyright for the status of this software.
++ *
++ * Author: Daniel Garcia <dani@danigm.net>
++ */
++
++
++#include "libxml.h"
++#include <stdio.h>
++
++#ifdef LIBXML_CATALOG_ENABLED
++#include <libxml/catalog.h>
++
++/* Test catalog resolve uri with recursive catalog */
++static int
++testRecursiveDelegateUri(void) {
++    int ret = 0;
++    const char *cat = "test/catalogs/catalog-recursive.xml";
++    const char *entity = "/foo.ent";
++    xmlChar *resolved = NULL;
++
++    xmlInitParser();
++    xmlLoadCatalog(cat);
++
++    /* This should trigger recursive error */
++    resolved = xmlCatalogResolveURI(BAD_CAST entity);
++    if (resolved != NULL) {
++        fprintf(stderr, "CATALOG-FAILURE: Catalog %s entity should fail to resolve\n", entity);
++        ret = 1;
++    }
++    xmlCatalogCleanup();
++
++    return ret;
++}
++
++/* Test parsing repeated NextCatalog */
++static int
++testRepeatedNextCatalog(void) {
++    int ret = 0;
++    int i = 0;
++    const char *cat = "test/catalogs/repeated-next-catalog.xml";
++    const char *entity = "/foo.ent";
++    xmlDocPtr doc = NULL;
++    xmlNodePtr node = NULL;
++
++    xmlInitParser();
++
++    xmlLoadCatalog(cat);
++    /* To force the complete recursive load */
++    xmlCatalogResolveURI(BAD_CAST entity);
++    /**
++     * Ensure that the doc doesn't contain the same nextCatalog
++     */
++    doc = xmlCatalogDumpDoc();
++    xmlCatalogCleanup();
++
++    if (doc == NULL) {
++        fprintf(stderr, "CATALOG-FAILURE: Failed to dump the catalog\n");
++        return 1;
++    }
++
++    /* Just the root "catalog" node with a series of nextCatalog */
++    node = xmlDocGetRootElement(doc);
++    node = node->children;
++    for (i=0; node != NULL; node=node->next, i++) {}
++    if (i > 1) {
++        fprintf(stderr, "CATALOG-FAILURE: Found %d nextCatalog entries and should be 1\n", i);
++        ret = 1;
++    }
++
++    xmlFreeDoc(doc);
++
++    return ret;
++}
++
++int
++main(void) {
++    int err = 0;
++
++    err |= testRecursiveDelegateUri();
++    err |= testRepeatedNextCatalog();
++
++    return err;
++}
++#else
++/* No catalog, so everything okay */
++int
++main(void) {
++    return 0;
++}
++#endif
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0992-03.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0992-03.patch
new file mode 100644
index 00000000000..89f5fb1ac66
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-0992-03.patch
@@ -0,0 +1,33 @@
+From deed3b7873dff30b7f87f7f33154c9932a772522 Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <dani@danigm.net>
+Date: Sun, 18 Jan 2026 19:47:11 +0100
+Subject: [PATCH] catalog: Do not check value for duplication nextCatalog
+
+The value field stores the path as it appears in the catalog definition,
+the URL is built using xmlBuildURI that changes the relative paths to
+absolute.
+
+This change fixes the issue of using relative path to the same catalog
+in the same file.
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/issues/1040
+
+CVE: CVE-2026-0992
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/deed3b7873dff30b7f87f7f33154c9932a772522]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ catalog.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/catalog.c b/catalog.c
+index eb889162..ba9ee7ae 100644
+--- a/catalog.c
++++ b/catalog.c
+@@ -1299,7 +1299,6 @@ xmlParseXMLCatalogNode(xmlNodePtr cur, xmlCatalogPrefer prefer,
+ 	while (prev != NULL) {
+ 	    if ((prev->type == XML_CATA_NEXT_CATALOG) &&
+ 		(xmlStrEqual (prev->URL, entry->URL)) &&
+-		(xmlStrEqual (prev->value, entry->value)) &&
+ 		(prev->prefer == entry->prefer) &&
+ 		(prev->group == entry->group)) {
+ 		    if (xmlDebugCatalogs)
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index bf3099c1f42..fa39116404b 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -45,7 +45,9 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2025-9714.patch \
            file://CVE-2025-7425.patch \
            file://CVE-2026-0990.patch \
-           file://CVE-2026-0992.patch \
+           file://CVE-2026-0992-01.patch \
+           file://CVE-2026-0992-02.patch \
+           file://CVE-2026-0992-03.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"

