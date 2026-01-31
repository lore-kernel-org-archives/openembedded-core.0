Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48C4D79778
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 14:51:48 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10242.1769871103798289948
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Jan 2026 06:51:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=T272kt5D;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260131145145d315c0c7690002073a-9pyfld@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260131145145d315c0c7690002073a
        for <openembedded-core@lists.openembedded.org>;
        Sat, 31 Jan 2026 15:51:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=uX3J5QknqkwjlULZq3T5MNQ0sqhpifkRmQtNI2OxGDE=;
 b=T272kt5D9APMawg9+k0xjHlG/uPCZX3BONzdIN8xQ9gp2MAFKzPMaPVJ5Q0DzeLbO7czOI
 AtJcDB5pNl4ElSi3RTz9LxV13nQYGFtMOGDel+J6J+muj6WOSsP6xx637jYKUVMF4T/2G1vJ
 kovyK+OTWEjj5+dLFBCdZffWVMGBdDIwWPlW26r7l/OiHR0L5oKe/zoW4onSJx8TQj2NS8eS
 b09Xx1GvS13mdiEg2yk/fNasZEhmR/FKtq7NXcCmBuqc2tEOT5Yy9HgZhHAscSuPHRsjWwIh
 I9G0Yk7mdXPktSEP9iwXKZulRBNHbYWzEr4ZzpVTrYM2fi7a4fpQATXw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH] libxml2: add follow-up patch for CVE-2026-0992
Date: Sat, 31 Jan 2026 15:51:41 +0100
Message-Id: <20260131145141.3770930-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 14:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230238

From: Peter Marko <peter.marko@siemens.com>

References:
* https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019
* https://gitlab.gnome.org/GNOME/libxml2/-/merge_requests/377

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...2026-0992.patch => CVE-2026-0992-01.patch} |   0
 .../libxml/libxml2/CVE-2026-0992-02.patch     | 336 ++++++++++++++++++
 .../libxml/libxml2/CVE-2026-0992-03.patch     |  33 ++
 meta/recipes-core/libxml/libxml2_2.14.6.bb    |   4 +-
 4 files changed, 372 insertions(+), 1 deletion(-)
 rename meta/recipes-core/libxml/libxml2/{CVE-2026-0992.patch => CVE-2026-0992-01.patch} (100%)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-03.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0992-01.patch
similarity index 100%
rename from meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch
rename to meta/recipes-core/libxml/libxml2/CVE-2026-0992-01.patch
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.patch
new file mode 100644
index 0000000000..ed11e85061
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.patch
@@ -0,0 +1,336 @@
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
+ Makefile.am                             |  6 ++
+ catalog.c                               | 63 +++++++++++-----
+ include/libxml/catalog.h                |  2 +
+ meson.build                             |  1 +
+ test/catalogs/catalog-recursive.xml     |  3 +
+ test/catalogs/repeated-next-catalog.xml | 10 +++
+ testcatalog.c                           | 96 +++++++++++++++++++++++++
+ 8 files changed, 164 insertions(+), 19 deletions(-)
+ create mode 100644 test/catalogs/catalog-recursive.xml
+ create mode 100644 test/catalogs/repeated-next-catalog.xml
+ create mode 100644 testcatalog.c
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 163661f8..7d5702df 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -488,6 +488,7 @@ if(LIBXML2_WITH_TESTS)
+         runxmlconf
+         runsuite
+         testapi
++        testcatalog
+         testchar
+         testdict
+         testModule
+@@ -512,6 +513,7 @@ if(LIBXML2_WITH_TESTS)
+     if(NOT WIN32)
+         add_test(NAME testapi COMMAND testapi)
+     endif()
++    add_test(NAME testcatalog COMMAND testcatalog)
+     add_test(NAME testchar COMMAND testchar)
+     add_test(NAME testdict COMMAND testdict)
+     add_test(NAME testparser COMMAND testparser WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
+diff --git a/Makefile.am b/Makefile.am
+index c51dfd8e..c794eac8 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -20,6 +20,7 @@ check_PROGRAMS = \
+ 	runxmlconf \
+ 	testModule \
+ 	testapi \
++	testcatalog \
+ 	testchar \
+ 	testdict \
+ 	testlimits \
+@@ -130,6 +131,10 @@ testlimits_SOURCES=testlimits.c
+ testlimits_DEPENDENCIES = $(DEPS)
+ testlimits_LDADD= $(LDADDS)
+ 
++testcatalog_SOURCES=testcatalog.c
++testcatalog_DEPENDENCIES = $(DEPS)
++testcatalog_LDADD= $(LDADDS)
++
+ testchar_SOURCES=testchar.c
+ testchar_DEPENDENCIES = $(DEPS)
+ testchar_LDADD= $(LDADDS)
+@@ -179,6 +184,7 @@ check-local:
+ 	$(CHECKER) ./runtest$(EXEEXT)
+ 	$(CHECKER) ./testrecurse$(EXEEXT)
+ 	$(CHECKER) ./testapi$(EXEEXT)
++	$(CHECKER) ./testcatalog$(EXEEXT)
+ 	$(CHECKER) ./testchar$(EXEEXT)
+ 	$(CHECKER) ./testdict$(EXEEXT)
+ 	$(CHECKER) ./testparser$(EXEEXT)
+diff --git a/catalog.c b/catalog.c
+index 401dbc14..eb889162 100644
+--- a/catalog.c
++++ b/catalog.c
+@@ -637,43 +637,54 @@ static void xmlDumpXMLCatalogNode(xmlCatalogEntryPtr catal, xmlNodePtr catalog,
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
+@@ -3357,6 +3368,20 @@ xmlCatalogDump(FILE *out) {
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
+@@ -119,6 +119,8 @@ XMLPUBFUN void
+ #ifdef LIBXML_OUTPUT_ENABLED
+ XMLPUBFUN void
+ 		xmlCatalogDump		(FILE *out);
++XMLPUBFUN xmlDocPtr
++		xmlCatalogDumpDoc	(void);
+ #endif /* LIBXML_OUTPUT_ENABLED */
+ XMLPUBFUN xmlChar *
+ 		xmlCatalogResolve	(const xmlChar *pubID,
+diff --git a/meson.build b/meson.build
+index 1cd89f09..4bf17f6c 100644
+--- a/meson.build
++++ b/meson.build
+@@ -539,6 +539,7 @@ checks = {
+ # Disabled for now, see #694
+ #    'testModule': [],
+     'testapi': [],
++    'testcatalog': [],
+     'testchar': [],
+     'testdict': [],
+     'testlimits': [],
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
index 0000000000..be9759feb4
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
+@@ -1247,7 +1247,6 @@ xmlParseXMLCatalogNode(xmlNodePtr cur, xmlCatalogPrefer prefer,
+ 	while (prev != NULL) {
+ 	    if ((prev->type == XML_CATA_NEXT_CATALOG) &&
+ 		(xmlStrEqual (prev->URL, entry->URL)) &&
+-		(xmlStrEqual (prev->value, entry->value)) &&
+ 		(prev->prefer == entry->prefer) &&
+ 		(prev->group == entry->group)) {
+ 		    if (xmlDebugCatalogs)
diff --git a/meta/recipes-core/libxml/libxml2_2.14.6.bb b/meta/recipes-core/libxml/libxml2_2.14.6.bb
index b881a89a5f..78ecece666 100644
--- a/meta/recipes-core/libxml/libxml2_2.14.6.bb
+++ b/meta/recipes-core/libxml/libxml2_2.14.6.bb
@@ -21,7 +21,9 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2025-6021.patch \
            file://CVE-2026-0989.patch \
            file://CVE-2026-0990.patch \
-           file://CVE-2026-0992.patch \
+           file://CVE-2026-0992-01.patch \
+           file://CVE-2026-0992-02.patch \
+           file://CVE-2026-0992-03.patch \
            "
 
 SRC_URI[archive.sha256sum] = "7ce458a0affeb83f0b55f1f4f9e0e55735dbfc1a9de124ee86fb4a66b597203a"

