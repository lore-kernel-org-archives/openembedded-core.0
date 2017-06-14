Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 1A8AE783A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 15:27:00 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v5EFR1pu006091
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 17:27:01 +0200
Received: from dev.sbt.siemens.com ([163.242.56.100])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v5EFR076023651;
	Wed, 14 Jun 2017 17:27:01 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 418B61DDA3B;
	Wed, 14 Jun 2017 17:27:01 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 17:26:46 +0200
Message-Id: <1497454006-13902-8-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1497454006-13902-1-git-send-email-andrej.valek@siemens.com>
References: <1497454006-13902-1-git-send-email-andrej.valek@siemens.com>
Subject: [PATCH 7/7] libxml2: Revert "Add an XML_PARSE_NOXXE flag to block all entities loading even local"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Jun 2017 15:27:01 -0000

The new flag doesn't work and the change even broke the XML_PARSE_NONET option.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../libxml/libxml2/CVE-2016-9318.patch             | 207 ---------------------
 meta/recipes-core/libxml/libxml2_2.9.4.bb          |   1 -
 2 files changed, 208 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-9318.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2016-9318.patch b/meta/recipes-core/libxml/libxml2/CVE-2016-9318.patch
deleted file mode 100644
index 3581ab8..0000000
--- a/meta/recipes-core/libxml/libxml2/CVE-2016-9318.patch
+++ /dev/null
@@ -1,207 +0,0 @@
-From 7fa1cd31552d52d50a9101f07c816ff6dd2d9f19 Mon Sep 17 00:00:00 2001
-From: Doran Moppert <dmoppert@redhat.com>
-Date: Fri, 7 Apr 2017 16:45:56 +0200
-Subject: [PATCH] Add an XML_PARSE_NOXXE flag to block all entities loading
- even local
-
-For https://bugzilla.gnome.org/show_bug.cgi?id=772726
-
-* include/libxml/parser.h: Add a new parser flag XML_PARSE_NOXXE
-* elfgcchack.h, xmlIO.h, xmlIO.c: associated loading routine
-* include/libxml/xmlerror.h: new error raised
-* xmllint.c: adds --noxxe flag to activate the option
-
-Upstream-Status: Backport
-CVE: CVE-2016-9318
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- elfgcchack.h              | 10 ++++++++++
- include/libxml/parser.h   |  3 ++-
- include/libxml/xmlIO.h    |  8 ++++++++
- include/libxml/xmlerror.h |  1 +
- parser.c                  |  4 ++++
- xmlIO.c                   | 40 +++++++++++++++++++++++++++++++++++-----
- xmllint.c                 |  5 +++++
- 7 files changed, 65 insertions(+), 6 deletions(-)
-
-diff --git a/elfgcchack.h b/elfgcchack.h
-index 8c52884..1b81dcd 100644
---- a/elfgcchack.h
-+++ b/elfgcchack.h
-@@ -6547,6 +6547,16 @@ extern __typeof (xmlNoNetExternalEntityLoader) xmlNoNetExternalEntityLoader__int
- #endif
- #endif
- 
-+#ifdef bottom_xmlIO
-+#undef xmlNoXxeExternalEntityLoader
-+extern __typeof (xmlNoXxeExternalEntityLoader) xmlNoXxeExternalEntityLoader __attribute((alias("xmlNoXxeExternalEntityLoader__internal_alias")));
-+#else
-+#ifndef xmlNoXxeExternalEntityLoader
-+extern __typeof (xmlNoXxeExternalEntityLoader) xmlNoXxeExternalEntityLoader__internal_alias __attribute((visibility("hidden")));
-+#define xmlNoXxeExternalEntityLoader xmlNoXxeExternalEntityLoader__internal_alias
-+#endif
-+#endif
-+
- #ifdef bottom_tree
- #undef xmlNodeAddContent
- extern __typeof (xmlNodeAddContent) xmlNodeAddContent __attribute((alias("xmlNodeAddContent__internal_alias")));
-diff --git a/include/libxml/parser.h b/include/libxml/parser.h
-index 47fbec0..63ca1b9 100644
---- a/include/libxml/parser.h
-+++ b/include/libxml/parser.h
-@@ -1111,7 +1111,8 @@ typedef enum {
-     XML_PARSE_HUGE      = 1<<19,/* relax any hardcoded limit from the parser */
-     XML_PARSE_OLDSAX    = 1<<20,/* parse using SAX2 interface before 2.7.0 */
-     XML_PARSE_IGNORE_ENC= 1<<21,/* ignore internal document encoding hint */
--    XML_PARSE_BIG_LINES = 1<<22 /* Store big lines numbers in text PSVI field */
-+    XML_PARSE_BIG_LINES = 1<<22,/* Store big lines numbers in text PSVI field */
-+    XML_PARSE_NOXXE	= 1<<23 /* Forbid any external entity loading */
- } xmlParserOption;
- 
- XMLPUBFUN void XMLCALL
-diff --git a/include/libxml/xmlIO.h b/include/libxml/xmlIO.h
-index 3e41744..8d3fdef 100644
---- a/include/libxml/xmlIO.h
-+++ b/include/libxml/xmlIO.h
-@@ -300,6 +300,14 @@ XMLPUBFUN xmlParserInputPtr XMLCALL
- 					 xmlParserCtxtPtr ctxt);
- 
- /*
-+ * A predefined entity loader external entity expansion
-+ */
-+XMLPUBFUN xmlParserInputPtr XMLCALL
-+	xmlNoXxeExternalEntityLoader	(const char *URL,
-+					 const char *ID,
-+					 xmlParserCtxtPtr ctxt);
-+
-+/*
-  * xmlNormalizeWindowsPath is obsolete, don't use it.
-  * Check xmlCanonicPath in uri.h for a better alternative.
-  */
-diff --git a/include/libxml/xmlerror.h b/include/libxml/xmlerror.h
-index 037c16d..3036062 100644
---- a/include/libxml/xmlerror.h
-+++ b/include/libxml/xmlerror.h
-@@ -470,6 +470,7 @@ typedef enum {
-     XML_IO_EADDRINUSE, /* 1554 */
-     XML_IO_EALREADY, /* 1555 */
-     XML_IO_EAFNOSUPPORT, /* 1556 */
-+    XML_IO_ILLEGAL_XXE, /* 1557 */
-     XML_XINCLUDE_RECURSION=1600,
-     XML_XINCLUDE_PARSE_VALUE, /* 1601 */
-     XML_XINCLUDE_ENTITY_DEF_MISMATCH, /* 1602 */
-diff --git a/parser.c b/parser.c
-index 53a6b7f..609a270 100644
---- a/parser.c
-+++ b/parser.c
-@@ -15350,6 +15350,10 @@ xmlCtxtUseOptionsInternal(xmlParserCtxtPtr ctxt, int options, const char *encodi
- 	ctxt->options |= XML_PARSE_NONET;
-         options -= XML_PARSE_NONET;
-     }
-+    if (options & XML_PARSE_NOXXE) {
-+	ctxt->options |= XML_PARSE_NOXXE;
-+        options -= XML_PARSE_NOXXE;
-+    }
-     if (options & XML_PARSE_COMPACT) {
- 	ctxt->options |= XML_PARSE_COMPACT;
-         options -= XML_PARSE_COMPACT;
-diff --git a/xmlIO.c b/xmlIO.c
-index 1a79c09..304f822 100644
---- a/xmlIO.c
-+++ b/xmlIO.c
-@@ -210,6 +210,7 @@ static const char *IOerr[] = {
-     "adddress in use",		/* EADDRINUSE */
-     "already in use",		/* EALREADY */
-     "unknown address familly",	/* EAFNOSUPPORT */
-+    "Attempt to load external entity %s", /* XML_IO_ILLEGAL_XXE */
- };
- 
- #if defined(_WIN32) || defined (__DJGPP__) && !defined (__CYGWIN__)
-@@ -4053,13 +4054,22 @@ xmlDefaultExternalEntityLoader(const char *URL, const char *ID,
-     xmlGenericError(xmlGenericErrorContext,
-                     "xmlDefaultExternalEntityLoader(%s, xxx)\n", URL);
- #endif
--    if ((ctxt != NULL) && (ctxt->options & XML_PARSE_NONET)) {
-+    if (ctxt != NULL) {
-         int options = ctxt->options;
- 
--	ctxt->options -= XML_PARSE_NONET;
--        ret = xmlNoNetExternalEntityLoader(URL, ID, ctxt);
--	ctxt->options = options;
--	return(ret);
-+        if (options & XML_PARSE_NOXXE) {
-+            ctxt->options -= XML_PARSE_NOXXE;
-+            ret = xmlNoXxeExternalEntityLoader(URL, ID, ctxt);
-+            ctxt->options = options;
-+            return(ret);
-+        }
-+ 
-+        if (options & XML_PARSE_NONET) {
-+            ctxt->options -= XML_PARSE_NONET;
-+            ret = xmlNoNetExternalEntityLoader(URL, ID, ctxt);
-+            ctxt->options = options;
-+            return(ret);
-+        }
-     }
- #ifdef LIBXML_CATALOG_ENABLED
-     resource = xmlResolveResourceFromCatalog(URL, ID, ctxt);
-@@ -4160,6 +4170,13 @@ xmlNoNetExternalEntityLoader(const char *URL, const char *ID,
-     xmlParserInputPtr input = NULL;
-     xmlChar *resource = NULL;
- 
-+    if (ctxt == NULL) {
-+        return(NULL);
-+    }
-+    if (ctxt->input_id == 1) {
-+        return xmlDefaultExternalEntityLoader((const char *) URL, ID, ctxt);
-+    }
-+
- #ifdef LIBXML_CATALOG_ENABLED
-     resource = xmlResolveResourceFromCatalog(URL, ID, ctxt);
- #endif
-@@ -4182,5 +4199,18 @@ xmlNoNetExternalEntityLoader(const char *URL, const char *ID,
-     return(input);
- }
- 
-+xmlParserInputPtr
-+xmlNoXxeExternalEntityLoader(const char *URL, const char *ID,
-+                          xmlParserCtxtPtr ctxt) {
-+    if (ctxt == NULL) {
-+        return(NULL);
-+    }
-+    if (ctxt->input_id == 1) {
-+        return xmlDefaultExternalEntityLoader((const char *) URL, ID, ctxt);
-+    }
-+    xmlIOErr(XML_IO_ILLEGAL_XXE, (const char *) URL);
-+    return(NULL);
-+}
-+
- #define bottom_xmlIO
- #include "elfgcchack.h"
-diff --git a/xmllint.c b/xmllint.c
-index 67f7adb..d9368c1 100644
---- a/xmllint.c
-+++ b/xmllint.c
-@@ -3019,6 +3019,7 @@ static void usage(const char *name) {
-     printf("\t--path 'paths': provide a set of paths for resources\n");
-     printf("\t--load-trace : print trace of all external entities loaded\n");
-     printf("\t--nonet : refuse to fetch DTDs or entities over network\n");
-+    printf("\t--noxxe : forbid any external entity loading\n");
-     printf("\t--nocompact : do not generate compact text nodes\n");
-     printf("\t--htmlout : output results as HTML\n");
-     printf("\t--nowrap : do not put HTML doc wrapper\n");
-@@ -3461,6 +3462,10 @@ main(int argc, char **argv) {
-                    (!strcmp(argv[i], "--nonet"))) {
- 	    options |= XML_PARSE_NONET;
- 	    xmlSetExternalEntityLoader(xmlNoNetExternalEntityLoader);
-+        } else if ((!strcmp(argv[i], "-noxxe")) ||
-+                   (!strcmp(argv[i], "--noxxe"))) {
-+	    options |= XML_PARSE_NOXXE;
-+	    xmlSetExternalEntityLoader(xmlNoXxeExternalEntityLoader);
-         } else if ((!strcmp(argv[i], "-nocompact")) ||
-                    (!strcmp(argv[i], "--nocompact"))) {
- 	    options &= ~XML_PARSE_COMPACT;
--- 
-2.10.2
-
diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb b/meta/recipes-core/libxml/libxml2_2.9.4.bb
index 677d8c9..f67c47d 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
@@ -28,7 +28,6 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml2-CVE-2017-9049_CVE-2017-9050.patch \
            file://libxml2-CVE-2017-5969.patch \
            file://libxml2-CVE-2017-0663.patch \
-           file://CVE-2016-9318.patch \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
            "
 
-- 
2.1.4


