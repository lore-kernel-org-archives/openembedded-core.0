Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF22AC47082
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.7190.1649169707422558639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 07:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=FXUe1Z2Z;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649169732; x=1680705732;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=6k9sP7G4CbhQLxpeCbtd2WHqVQtRhmBmCiCM22k4Zbg=;
  b=FXUe1Z2ZgnYbHgBPnTRZgQMZQd4Wm7hkLNakkvPyBJM7C9VotGpqJ1Kc
   58xT0c9WNh+HIxqeqaQVDy6blPa+Ls+1e9Fhsw3AzjxTuJEEvesm4YDA9
   FNMCHKsZd+eqsiwH3mYl/aFD2Ge1w+FBtx+m747iOvA9WT3Zqcj4F13SS
   gRGOEi4p4d3kb4wmxdfGGQUyrzoH4j4Z/kvrJwJT7elU5PCEIBG+Cb5H1
   BuBAKQlkmNYrETkJpzEOqPZ6jgKdefz/XtR9O2ty9Pvqvne4+mKUk8yAL
   LYG0kDpzfbOJPDOR5csdJvWduzjfgdEwYOj4tq7+w7YNfhdbt+YiKPwJq
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="258348944"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="258348944"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:42:12 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="696953657"
Received: from ntabdull-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.226.238])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:42:11 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 17/22] libxml2: update to 2.9.13
Date: Tue,  5 Apr 2022 22:41:36 +0800
Message-Id: 
 <cf098eeb8267119eb1036cf743c83d1e775e7bcf.1649169646.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649169646.git.anuj.mittal@intel.com>
References: <cover.1649169646.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164035

From: Ralph Siemsen <ralph.siemsen@linaro.org>

- new version includes fix for CVE-2022-23308
- drop patche which was upstream
- refresh patch

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d687f1ac2017a1cc94ac4733cd46755d5aabd120)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../0002-Work-around-lxml-API-abuse.patch     | 213 ------------------
 .../libxml2/libxml-m4-use-pkgconfig.patch     |  16 +-
 .../{libxml2_2.9.12.bb => libxml2_2.9.13.bb}  |   5 +-
 3 files changed, 8 insertions(+), 226 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/0002-Work-around-lxml-API-abuse.patch
 rename meta/recipes-core/libxml/{libxml2_2.9.12.bb => libxml2_2.9.13.bb} (96%)

diff --git a/meta/recipes-core/libxml/libxml2/0002-Work-around-lxml-API-abuse.patch b/meta/recipes-core/libxml/libxml2/0002-Work-around-lxml-API-abuse.patch
deleted file mode 100644
index f09ce9707a..0000000000
--- a/meta/recipes-core/libxml/libxml2/0002-Work-around-lxml-API-abuse.patch
+++ /dev/null
@@ -1,213 +0,0 @@
-From 85b1792e37b131e7a51af98a37f92472e8de5f3f Mon Sep 17 00:00:00 2001
-From: Nick Wellnhofer <wellnhofer@aevum.de>
-Date: Tue, 18 May 2021 20:08:28 +0200
-Subject: [PATCH] Work around lxml API abuse
-
-Make xmlNodeDumpOutput and htmlNodeDumpFormatOutput work with corrupted
-parent pointers. This used to work with the old recursive code but the
-non-recursive rewrite required parent pointers to be set correctly.
-
-Unfortunately, lxml relies on the old behavior and passes subtrees with
-a corrupted structure. Fall back to a recursive function call if an
-invalid parent pointer is detected.
-
-Fixes #255.
-
-Upstream-Status: Backport [85b1792e37b131e7a51af98a37f92472e8de5f3f]
----
- HTMLtree.c | 46 ++++++++++++++++++++++++++++------------------
- xmlsave.c  | 31 +++++++++++++++++++++----------
- 2 files changed, 49 insertions(+), 28 deletions(-)
-
-diff --git a/HTMLtree.c b/HTMLtree.c
-index 24434d45..bdd639c7 100644
---- a/HTMLtree.c
-+++ b/HTMLtree.c
-@@ -744,7 +744,7 @@ void
- htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
- 	                 xmlNodePtr cur, const char *encoding ATTRIBUTE_UNUSED,
-                          int format) {
--    xmlNodePtr root;
-+    xmlNodePtr root, parent;
-     xmlAttrPtr attr;
-     const htmlElemDesc * info;
- 
-@@ -755,6 +755,7 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
-     }
- 
-     root = cur;
-+    parent = cur->parent;
-     while (1) {
-         switch (cur->type) {
-         case XML_HTML_DOCUMENT_NODE:
-@@ -762,13 +763,25 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
-             if (((xmlDocPtr) cur)->intSubset != NULL) {
-                 htmlDtdDumpOutput(buf, (xmlDocPtr) cur, NULL);
-             }
--            if (cur->children != NULL) {
-+            /* Always validate cur->parent when descending. */
-+            if ((cur->parent == parent) && (cur->children != NULL)) {
-+                parent = cur;
-                 cur = cur->children;
-                 continue;
-             }
-             break;
- 
-         case XML_ELEMENT_NODE:
-+            /*
-+             * Some users like lxml are known to pass nodes with a corrupted
-+             * tree structure. Fall back to a recursive call to handle this
-+             * case.
-+             */
-+            if ((cur->parent != parent) && (cur->children != NULL)) {
-+                htmlNodeDumpFormatOutput(buf, doc, cur, encoding, format);
-+                break;
-+            }
-+
-             /*
-              * Get specific HTML info for that node.
-              */
-@@ -817,6 +830,7 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
-                     (cur->name != NULL) &&
-                     (cur->name[0] != 'p')) /* p, pre, param */
-                     xmlOutputBufferWriteString(buf, "\n");
-+                parent = cur;
-                 cur = cur->children;
-                 continue;
-             }
-@@ -825,9 +839,9 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
-                 (info != NULL) && (!info->isinline)) {
-                 if ((cur->next->type != HTML_TEXT_NODE) &&
-                     (cur->next->type != HTML_ENTITY_REF_NODE) &&
--                    (cur->parent != NULL) &&
--                    (cur->parent->name != NULL) &&
--                    (cur->parent->name[0] != 'p')) /* p, pre, param */
-+                    (parent != NULL) &&
-+                    (parent->name != NULL) &&
-+                    (parent->name[0] != 'p')) /* p, pre, param */
-                     xmlOutputBufferWriteString(buf, "\n");
-             }
- 
-@@ -842,9 +856,9 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
-                 break;
-             if (((cur->name == (const xmlChar *)xmlStringText) ||
-                  (cur->name != (const xmlChar *)xmlStringTextNoenc)) &&
--                ((cur->parent == NULL) ||
--                 ((xmlStrcasecmp(cur->parent->name, BAD_CAST "script")) &&
--                  (xmlStrcasecmp(cur->parent->name, BAD_CAST "style"))))) {
-+                ((parent == NULL) ||
-+                 ((xmlStrcasecmp(parent->name, BAD_CAST "script")) &&
-+                  (xmlStrcasecmp(parent->name, BAD_CAST "style"))))) {
-                 xmlChar *buffer;
- 
-                 buffer = xmlEncodeEntitiesReentrant(doc, cur->content);
-@@ -902,13 +916,9 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
-                 break;
-             }
- 
--            /*
--             * The parent should never be NULL here but we want to handle
--             * corrupted documents gracefully.
--             */
--            if (cur->parent == NULL)
--                return;
--            cur = cur->parent;
-+            cur = parent;
-+            /* cur->parent was validated when descending. */
-+            parent = cur->parent;
- 
-             if ((cur->type == XML_HTML_DOCUMENT_NODE) ||
-                 (cur->type == XML_DOCUMENT_NODE)) {
-@@ -939,9 +949,9 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
-                     (cur->next != NULL)) {
-                     if ((cur->next->type != HTML_TEXT_NODE) &&
-                         (cur->next->type != HTML_ENTITY_REF_NODE) &&
--                        (cur->parent != NULL) &&
--                        (cur->parent->name != NULL) &&
--                        (cur->parent->name[0] != 'p')) /* p, pre, param */
-+                        (parent != NULL) &&
-+                        (parent->name != NULL) &&
-+                        (parent->name[0] != 'p')) /* p, pre, param */
-                         xmlOutputBufferWriteString(buf, "\n");
-                 }
-             }
-diff --git a/xmlsave.c b/xmlsave.c
-index 61a40459..aedbd5e7 100644
---- a/xmlsave.c
-+++ b/xmlsave.c
-@@ -847,7 +847,7 @@ htmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNodePtr cur) {
- static void
- xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNodePtr cur) {
-     int format = ctxt->format;
--    xmlNodePtr tmp, root, unformattedNode = NULL;
-+    xmlNodePtr tmp, root, unformattedNode = NULL, parent;
-     xmlAttrPtr attr;
-     xmlChar *start, *end;
-     xmlOutputBufferPtr buf;
-@@ -856,6 +856,7 @@ xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNodePtr cur) {
-     buf = ctxt->buf;
- 
-     root = cur;
-+    parent = cur->parent;
-     while (1) {
-         switch (cur->type) {
-         case XML_DOCUMENT_NODE:
-@@ -868,7 +869,9 @@ xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNodePtr cur) {
-             break;
- 
-         case XML_DOCUMENT_FRAG_NODE:
--            if (cur->children != NULL) {
-+            /* Always validate cur->parent when descending. */
-+            if ((cur->parent == parent) && (cur->children != NULL)) {
-+                parent = cur;
-                 cur = cur->children;
-                 continue;
-             }
-@@ -887,7 +890,18 @@ xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNodePtr cur) {
-             break;
- 
-         case XML_ELEMENT_NODE:
--	    if ((cur != root) && (ctxt->format == 1) && (xmlIndentTreeOutput))
-+            /*
-+             * Some users like lxml are known to pass nodes with a corrupted
-+             * tree structure. Fall back to a recursive call to handle this
-+             * case.
-+             */
-+            if ((cur->parent != parent) && (cur->children != NULL)) {
-+                xmlNodeDumpOutputInternal(ctxt, cur);
-+                break;
-+            }
-+
-+	    if ((ctxt->level > 0) && (ctxt->format == 1) &&
-+                (xmlIndentTreeOutput))
- 		xmlOutputBufferWrite(buf, ctxt->indent_size *
- 				     (ctxt->level > ctxt->indent_nr ?
- 				      ctxt->indent_nr : ctxt->level),
-@@ -942,6 +956,7 @@ xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNodePtr cur) {
-                 xmlOutputBufferWrite(buf, 1, ">");
-                 if (ctxt->format == 1) xmlOutputBufferWrite(buf, 1, "\n");
-                 if (ctxt->level >= 0) ctxt->level++;
-+                parent = cur;
-                 cur = cur->children;
-                 continue;
-             }
-@@ -1058,13 +1073,9 @@ xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNodePtr cur) {
-                 break;
-             }
- 
--            /*
--             * The parent should never be NULL here but we want to handle
--             * corrupted documents gracefully.
--             */
--            if (cur->parent == NULL)
--                return;
--            cur = cur->parent;
-+            cur = parent;
-+            /* cur->parent was validated when descending. */
-+            parent = cur->parent;
- 
-             if (cur->type == XML_ELEMENT_NODE) {
-                 if (ctxt->level > 0) ctxt->level--;
--- 
-2.32.0
-
diff --git a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
index 90fa193775..6f44275299 100644
--- a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
+++ b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
@@ -18,11 +18,11 @@ Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
  libxml.m4 | 190 ++----------------------------------------------------
  1 file changed, 5 insertions(+), 185 deletions(-)
 
-diff --git a/libxml.m4 b/libxml.m4
-index 09de9fe2..1c535853 100644
---- a/libxml.m4
-+++ b/libxml.m4
-@@ -1,192 +1,12 @@
+Index: libxml2-2.9.13/libxml.m4
+===================================================================
+--- libxml2-2.9.13.orig/libxml.m4
++++ libxml2-2.9.13/libxml.m4
+@@ -1,191 +1,12 @@
 -# Configure paths for LIBXML2
 -# Simon Josefsson 2020-02-12
 -# Fix autoconf 2.70+ warnings
@@ -147,9 +147,8 @@ index 09de9fe2..1c535853 100644
 -      {
 -        printf("\n*** An old version of libxml (%d.%d.%d) was found.\n",
 -               xml_major_version, xml_minor_version, xml_micro_version);
--        printf("*** You need a version of libxml newer than %d.%d.%d. The latest version of\n",
+-        printf("*** You need a version of libxml newer than %d.%d.%d.\n",
 -           major, minor, micro);
--        printf("*** libxml is always available from ftp://ftp.xmlsoft.org.\n");
 -        printf("***\n");
 -        printf("*** If you have already installed a sufficiently new version, this error\n");
 -        printf("*** probably means that the wrong copy of the xml2-config shell script is\n");
@@ -220,6 +219,3 @@ index 09de9fe2..1c535853 100644
 -  AC_SUBST(XML_LIBS)
 -  rm -f conf.xmltest
  ])
--- 
-2.7.4
-
diff --git a/meta/recipes-core/libxml/libxml2_2.9.12.bb b/meta/recipes-core/libxml/libxml2_2.9.13.bb
similarity index 96%
rename from meta/recipes-core/libxml/libxml2_2.9.12.bb
rename to meta/recipes-core/libxml/libxml2_2.9.13.bb
index 3508733cc0..be59aba84b 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.12.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.13.bb
@@ -18,14 +18,13 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            file://runtest.patch \
            file://run-ptest \
            file://python-sitepackages-dir.patch \
-           file://libxml-m4-use-pkgconfig.patch \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
            file://fix-execution-of-ptests.patch \
            file://remove-fuzz-from-ptests.patch \
-           file://0002-Work-around-lxml-API-abuse.patch \
+           file://libxml-m4-use-pkgconfig.patch \
            "
 
-SRC_URI[archive.sha256sum] = "28a92f6ab1f311acf5e478564c49088ef0ac77090d9c719bbc5d518f1fe62eb9"
+SRC_URI[archive.sha256sum] = "276130602d12fe484ecc03447ee5e759d0465558fbc9d6bd144e3745306ebf0e"
 SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
 
 BINCONFIG = "${bindir}/xml2-config"
-- 
2.35.1


