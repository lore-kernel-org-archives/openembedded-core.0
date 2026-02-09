Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD4FE7E0A1
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:37 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43991.1770629370534478213
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ad453Trl;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43638a33157so1025158f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629369; x=1771234169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26QFH8vD7/zqx3ft2yCccMMB3acy6we6zwjfRwKMbI8=;
        b=ad453Trlx2BHB1YbLgmPrUWhFJVN9TD1qsYNdYYwXUxRJ0P67krmKCfnKVzGXctSla
         jmYu4/axEtOpVygP6OBnNoslRBF1zQUtEw3/Jix3Up92bjvbX2sU9dC15IWf/Lb5xRls
         h8Dg5pz5Kr2sayMHazsv9O5tijT4yFNiaR+VU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629369; x=1771234169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=26QFH8vD7/zqx3ft2yCccMMB3acy6we6zwjfRwKMbI8=;
        b=mUMskTGlRYamzIq0hIJLjLxHUtXTAph8BPfqti/j7n250j8XqB4LNfXuK/N53Is2fj
         z7X3iGLNwLjbyGnljIaJ/WLm0/bvlt/NFdt4DcDf3F25Rp/Ds0y+xmrZKoab2kmiL5wv
         7z+uxap14F+KNY2gvjkxoI6y300DFIOkIQTR//+qt3RGgEApedCnhZ3nAifhRh0vTV13
         ydACPZOYG0KHJjKphqPqyCpKzCEP4yHSy+AWjZLUJd9FvOSu+VWF9fcdBPKEOkYy3/qw
         +t49b6Gu9P/zy5yneExfpBF2FzWsr8h7fROQU/CCxyIcofn3E3QDYSXMaHfRE4mtmTmY
         Qehw==
X-Gm-Message-State: AOJu0YwpkNdBx7Hu/7VAD8/tWV2ffNUa3GfDbXTUJwdqbnVduZhmGgLy
	kSRG7UsBfQysr303zd84j8B1sPCyZ+d7I2b/l8SoO+EFn5vV4zjWS809F0YYrAwN/zOVH0qopes
	ztMPLM8Q=
X-Gm-Gg: AZuq6aIUDUabE2JC1qUzSYplFQr5FSHOX5c7MToaFYsTf4iOR1eNxJQL0kG5Pm0kUYI
	hFFbMeVn5rBK4Fjz2K+kal13ZBGSxYk/k6bHgO8hZxLeSHKX1TA8//Ky/IYM4ktGTxCgiznOqNC
	yRZGFyuiVipZmkkSYiZBel1rK99NVtk1jWi6TH5l5rgkJdflxyXbVFbAEkEj5Lvw9uGHtpBMcSC
	6LYDT63K8MeRsvqwUbjNFmC9sajvUorWNlE3KG6GWI/eZPWm+QMy+gVjDvcP0i4QXyF25joQnvs
	T3LHVER4tDV0GdxakcBXPSwk8HCVejw3qWfYiZQNn9ckE1BBVu7ujMProYOxPoUdumFKrEwUr0d
	VtshnUoCDG5fh+eL3fqIVf2isIEh5tQTeYkcTvr3GFoYYshzM2IBefaQxydqxTdROLj5vTXSZf3
	j2Zdt9VHagD8p48TIIiIFskRMfMj0czY3kR9TfaTuz7hbpDi37LafjDeqby2p3etaCW5bVWqJhC
	m5GjNsLwz/N/zI=
X-Received: by 2002:a05:6000:2585:b0:435:e451:39d4 with SMTP id ffacd0b85a97d-4362937ba48mr16416072f8f.44.1770629368487;
        Mon, 09 Feb 2026 01:29:28 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:28 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/25] libxml2: add follow-up patch for CVE-2026-0992
Date: Mon,  9 Feb 2026 10:28:56 +0100
Message-ID: <8b7d2e4979f567f38d2072b1f65e1cbddb3169c0.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230764

From: Peter Marko <peter.marko@siemens.com>

References:
* https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019
* https://gitlab.gnome.org/GNOME/libxml2/-/merge_requests/377

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...2026-0992.patch => CVE-2026-0992-01.patch} |   0
 .../libxml/libxml2/CVE-2026-0992-02.patch     | 323 ++++++++++++++++++
 .../libxml/libxml2/CVE-2026-0992-03.patch     |  33 ++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |   4 +-
 4 files changed, 359 insertions(+), 1 deletion(-)
 rename meta/recipes-core/libxml/libxml2/{CVE-2026-0992.patch => CVE-2026-0992-01.patch} (100%)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-03.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0992-01.patch
similarity index 100%
rename from meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch
rename to meta/recipes-core/libxml/libxml2/CVE-2026-0992-01.patch
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.patch
new file mode 100644
index 00000000000..bab0c4e1f0c
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.patch
@@ -0,0 +1,323 @@
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
+ test/catalogs/catalog-recursive.xml     |  3 +
+ test/catalogs/repeated-next-catalog.xml | 10 +++
+ testcatalog.c                           | 96 +++++++++++++++++++++++++
+ 7 files changed, 163 insertions(+), 19 deletions(-)
+ create mode 100644 test/catalogs/catalog-recursive.xml
+ create mode 100644 test/catalogs/repeated-next-catalog.xml
+ create mode 100644 testcatalog.c
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 163661f8..7d5702df 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -517,6 +517,7 @@ if(LIBXML2_WITH_TESTS)
+ 		runxmlconf
+ 		runsuite
+ 		testapi
++		testcatalog
+ 		testchar
+ 		testdict
+ 		testModule
+@@ -543,6 +544,7 @@ if(LIBXML2_WITH_TESTS)
+ 	if(NOT WIN32)
+ 		add_test(NAME testapi COMMAND testapi)
+ 	endif()
++	add_test(NAME testcatalog COMMAND testcatalog)
+ 	add_test(NAME testchar COMMAND testchar)
+ 	add_test(NAME testdict COMMAND testdict)
+ 	add_test(NAME testparser COMMAND testparser)
+diff --git a/Makefile.am b/Makefile.am
+index c51dfd8e..c794eac8 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -21,6 +21,7 @@ check_PROGRAMS = \
+ 	testModule \
+ 	testThreads \
+ 	testapi \
++	testcatalog \
+ 	testchar \
+ 	testdict \
+ 	testlimits \
+@@ -143,6 +144,10 @@ testlimits_SOURCES=testlimits.c
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
+@@ -206,6 +211,7 @@ check-local:
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
+@@ -649,43 +649,54 @@ static void xmlDumpXMLCatalogNode(xmlCatalogEntryPtr catal, xmlNodePtr catalog,
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
+@@ -3417,6 +3428,20 @@ xmlCatalogDump(FILE *out) {
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
index 00000000000..5964fd16b51
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
+@@ -1286,7 +1286,6 @@ xmlParseXMLCatalogNode(xmlNodePtr cur, xmlCatalogPrefer prefer,
+ 	while (prev != NULL) {
+ 	    if ((prev->type == XML_CATA_NEXT_CATALOG) &&
+ 		(xmlStrEqual (prev->URL, entry->URL)) &&
+-		(xmlStrEqual (prev->value, entry->value)) &&
+ 		(prev->prefer == entry->prefer) &&
+ 		(prev->group == entry->group)) {
+ 		    if (xmlDebugCatalogs)
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index fa081c2382f..25da11bd2d3 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -27,7 +27,9 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2025-7425.patch \
            file://CVE-2026-0989.patch \
            file://CVE-2026-0990.patch \
-           file://CVE-2026-0992.patch \
+           file://CVE-2026-0992-01.patch \
+           file://CVE-2026-0992-02.patch \
+           file://CVE-2026-0992-03.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"

