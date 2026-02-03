Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB45CE6E7E2
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:19:44 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13494.1770113977379381668
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:19:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WwSGB7xt;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so41589125e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770113975; x=1770718775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qt/xWQEPCRyA94a24bttu0Nm5B5NfBWWrmTqC5tcYfM=;
        b=WwSGB7xtNAn0W3Zfm3fyPsS0kVR9ODOwvvXtlCZidiV6motblotbtIZ/PnTSmvXjDz
         BVYanCNnpdROH9SA2/ejSSmaM8R3RvTGuWoufmgZeQt+G0OBi85n++SjDS27W0SjQ7KD
         Nj7Aau+y++rpsQGIvcytOgygf5pLtnDlD4Ovw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113975; x=1770718775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qt/xWQEPCRyA94a24bttu0Nm5B5NfBWWrmTqC5tcYfM=;
        b=W1/vDtUEPXzLHng9Y5U3JUsa7jL9/LhrX0JR4+grmnE1g6UnM4q870O3IxxckYlNRu
         okgYm/4bseqI2oip6HI6CkDL95BDA4oRYsxaJVT2/+4jC6DcmL0yTMmKntnw9irXEF7l
         aE0V1sYvsSyk2uHiCioIgOq3VVnX431/G67TIFel+bnHVDjWc7sa/umdah0KHxliUQVl
         LtOicp5qgGU+YUPoKlspcfr7Tnme4CGQb/ruAyOF/7K8ECXml9NbKJ5n1+8IEJxp8CLS
         nVrLi0UpLe4/B+0dwRJ/ZRGCOK9tbCr+X7aK6QVyb41i87hApbDO8dFoazGYih7m6iT4
         zaUQ==
X-Gm-Message-State: AOJu0YzDxcNFugU9e6IgVRVUMnIYtkLQI7ZGleXSrDBuu2+JAH+SMCJz
	8ebA23lCy6CmQ8UeEN6CO0KnVtNGI6JKpyjHBhFnTh1qHPnbfqCMBDTOE1zqGXLvGBCMpMD3JZX
	gEj/CNNc=
X-Gm-Gg: AZuq6aKFyQESy7wU/X3J0etiJdGSmVr7jWQZr8OyLZSwgxp10cB/OrVQJu2tvjj49V8
	5uFJY74XUNm4wt3EkngbauHeMdnJadCU+jfGrtysy0b6U4t40yb9Cs9O92AyifVaUxe/9ClINQw
	y6tLO+vP51ujRTK6ZPqrWIjGu0lsr4LGcQzKHnJhbYDuX/NCvI03sW3y20Sc+iQjZja2rl5MrNw
	pMC0HsTR+7RP4uK5yU6GCM6qEgzJzQ7fO07tu4z69r813ieha1DgU7ZPKKaq/XUqjqusbGiU3sQ
	29mxvejSmO48ut7ZFrhVRXHuR0FYsvSarLL6NXcADH3WoaIhVVQhTe4E/8OJitiQ5jkMlt612yE
	e05cEypNt/8KHC9run1YJrmxIsf9HNXUyyP2QMblDqnfP31V5/4wP93TxeUL3s7gLzmtS+OHR8W
	Breig12odgOfjDd/C2MViTCpOiDPQhwcxkeFc5p0erJOlyPidnwFioeFmbu5a2ZcUtedg8xvByw
	6IrMpY9naUAa9U=
X-Received: by 2002:a05:600c:a30c:b0:480:4a8f:2d5c with SMTP id 5b1f17b1804b1-482db62305emr138237065e9.29.1770113975261;
        Tue, 03 Feb 2026 02:19:35 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm52293041f8f.27.2026.02.03.02.19.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:19:34 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 20/22] libxml2: add follow-up patch for CVE-2026-0992
Date: Tue,  3 Feb 2026 11:16:49 +0100
Message-ID: <00d502decaf6f6b966196dda5747d4627c0e7ec6.1770109549.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770109549.git.yoann.congal@smile.fr>
References: <cover.1770109549.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:19:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230448

From: Peter Marko <peter.marko@siemens.com>

References:
* https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019
* https://gitlab.gnome.org/GNOME/libxml2/-/merge_requests/377

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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
index 00000000000..ed11e85061c
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
index 00000000000..be9759feb43
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
index b881a89a5ff..78ecece6662 100644
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

