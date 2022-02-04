Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED00C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:13:18 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.9481.1643983972820228964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 06:13:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Att9vaFf;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643983996; x=1675519996;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=0UPC+7w6mv3lAPJoqkyNhS/MWNB6J5ZHJ3Hvo5QC85o=;
  b=Att9vaFfA5rxIovA8PNa42S6zHsVEh8R6QXPgO9LJ5U1OfeNpVVV513W
   FXedB+Q+ZNUKufmH6/zZsv7V77QkR/pLtcNS8mEKJP5xixltJgM60MJzz
   xvi/kl+0whDtSYj3ZOIRPHTLCssWN6Mdqubf820FoAqzzGA76qG0m029Q
   mS+rHEZZxrfDj9IlHcJnN2Slyds7kasmnPU4+EYvARgrgrI/vPw4+wwf9
   Vn2TeoPTXyuruUhg1WIpoYNydeiwRnXwxi3ioTN6oUvkxLhqHGoR02mVb
   QFkniYC2qnahQwNEAS36AMKRqQVqCpBmHUohBO68hQG4/fWEa2AB/dWo9
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248321677"
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="248321677"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:13:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="566750123"
Received: from raajloka-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.235.116])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:13:15 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 17/17] libxml2: Backport python3-lxml workaround
 patch
Date: Fri,  4 Feb 2022 22:12:43 +0800
Message-Id: 
 <3e40efa0a05bbe9f9c3a5a2553319ce6a5f1b123.1643983711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643983711.git.anuj.mittal@intel.com>
References: <cover.1643983711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 14:13:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161364

From: Carlos Rafael Giani <crg7475@mailbox.org>

This is a workaround for the following issue that affects python3-lxml:

https://gitlab.gnome.org/GNOME/libxml2/-/issues/255

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2f52be7c42ea37243f9aea1898ef7052904f9290)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../0002-Work-around-lxml-API-abuse.patch     | 213 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.12.bb    |   1 +
 2 files changed, 214 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/0002-Work-around-lxml-API-abuse.patch

diff --git a/meta/recipes-core/libxml/libxml2/0002-Work-around-lxml-API-abuse.patch b/meta/recipes-core/libxml/libxml2/0002-Work-around-lxml-API-abuse.patch
new file mode 100644
index 0000000000..f09ce9707a
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/0002-Work-around-lxml-API-abuse.patch
@@ -0,0 +1,213 @@
+From 85b1792e37b131e7a51af98a37f92472e8de5f3f Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 18 May 2021 20:08:28 +0200
+Subject: [PATCH] Work around lxml API abuse
+
+Make xmlNodeDumpOutput and htmlNodeDumpFormatOutput work with corrupted
+parent pointers. This used to work with the old recursive code but the
+non-recursive rewrite required parent pointers to be set correctly.
+
+Unfortunately, lxml relies on the old behavior and passes subtrees with
+a corrupted structure. Fall back to a recursive function call if an
+invalid parent pointer is detected.
+
+Fixes #255.
+
+Upstream-Status: Backport [85b1792e37b131e7a51af98a37f92472e8de5f3f]
+---
+ HTMLtree.c | 46 ++++++++++++++++++++++++++++------------------
+ xmlsave.c  | 31 +++++++++++++++++++++----------
+ 2 files changed, 49 insertions(+), 28 deletions(-)
+
+diff --git a/HTMLtree.c b/HTMLtree.c
+index 24434d45..bdd639c7 100644
+--- a/HTMLtree.c
++++ b/HTMLtree.c
+@@ -744,7 +744,7 @@ void
+ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
+ 	                 xmlNodePtr cur, const char *encoding ATTRIBUTE_UNUSED,
+                          int format) {
+-    xmlNodePtr root;
++    xmlNodePtr root, parent;
+     xmlAttrPtr attr;
+     const htmlElemDesc * info;
+ 
+@@ -755,6 +755,7 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
+     }
+ 
+     root = cur;
++    parent = cur->parent;
+     while (1) {
+         switch (cur->type) {
+         case XML_HTML_DOCUMENT_NODE:
+@@ -762,13 +763,25 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
+             if (((xmlDocPtr) cur)->intSubset != NULL) {
+                 htmlDtdDumpOutput(buf, (xmlDocPtr) cur, NULL);
+             }
+-            if (cur->children != NULL) {
++            /* Always validate cur->parent when descending. */
++            if ((cur->parent == parent) && (cur->children != NULL)) {
++                parent = cur;
+                 cur = cur->children;
+                 continue;
+             }
+             break;
+ 
+         case XML_ELEMENT_NODE:
++            /*
++             * Some users like lxml are known to pass nodes with a corrupted
++             * tree structure. Fall back to a recursive call to handle this
++             * case.
++             */
++            if ((cur->parent != parent) && (cur->children != NULL)) {
++                htmlNodeDumpFormatOutput(buf, doc, cur, encoding, format);
++                break;
++            }
++
+             /*
+              * Get specific HTML info for that node.
+              */
+@@ -817,6 +830,7 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
+                     (cur->name != NULL) &&
+                     (cur->name[0] != 'p')) /* p, pre, param */
+                     xmlOutputBufferWriteString(buf, "\n");
++                parent = cur;
+                 cur = cur->children;
+                 continue;
+             }
+@@ -825,9 +839,9 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
+                 (info != NULL) && (!info->isinline)) {
+                 if ((cur->next->type != HTML_TEXT_NODE) &&
+                     (cur->next->type != HTML_ENTITY_REF_NODE) &&
+-                    (cur->parent != NULL) &&
+-                    (cur->parent->name != NULL) &&
+-                    (cur->parent->name[0] != 'p')) /* p, pre, param */
++                    (parent != NULL) &&
++                    (parent->name != NULL) &&
++                    (parent->name[0] != 'p')) /* p, pre, param */
+                     xmlOutputBufferWriteString(buf, "\n");
+             }
+ 
+@@ -842,9 +856,9 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
+                 break;
+             if (((cur->name == (const xmlChar *)xmlStringText) ||
+                  (cur->name != (const xmlChar *)xmlStringTextNoenc)) &&
+-                ((cur->parent == NULL) ||
+-                 ((xmlStrcasecmp(cur->parent->name, BAD_CAST "script")) &&
+-                  (xmlStrcasecmp(cur->parent->name, BAD_CAST "style"))))) {
++                ((parent == NULL) ||
++                 ((xmlStrcasecmp(parent->name, BAD_CAST "script")) &&
++                  (xmlStrcasecmp(parent->name, BAD_CAST "style"))))) {
+                 xmlChar *buffer;
+ 
+                 buffer = xmlEncodeEntitiesReentrant(doc, cur->content);
+@@ -902,13 +916,9 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
+                 break;
+             }
+ 
+-            /*
+-             * The parent should never be NULL here but we want to handle
+-             * corrupted documents gracefully.
+-             */
+-            if (cur->parent == NULL)
+-                return;
+-            cur = cur->parent;
++            cur = parent;
++            /* cur->parent was validated when descending. */
++            parent = cur->parent;
+ 
+             if ((cur->type == XML_HTML_DOCUMENT_NODE) ||
+                 (cur->type == XML_DOCUMENT_NODE)) {
+@@ -939,9 +949,9 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
+                     (cur->next != NULL)) {
+                     if ((cur->next->type != HTML_TEXT_NODE) &&
+                         (cur->next->type != HTML_ENTITY_REF_NODE) &&
+-                        (cur->parent != NULL) &&
+-                        (cur->parent->name != NULL) &&
+-                        (cur->parent->name[0] != 'p')) /* p, pre, param */
++                        (parent != NULL) &&
++                        (parent->name != NULL) &&
++                        (parent->name[0] != 'p')) /* p, pre, param */
+                         xmlOutputBufferWriteString(buf, "\n");
+                 }
+             }
+diff --git a/xmlsave.c b/xmlsave.c
+index 61a40459..aedbd5e7 100644
+--- a/xmlsave.c
++++ b/xmlsave.c
+@@ -847,7 +847,7 @@ htmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNodePtr cur) {
+ static void
+ xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNodePtr cur) {
+     int format = ctxt->format;
+-    xmlNodePtr tmp, root, unformattedNode = NULL;
++    xmlNodePtr tmp, root, unformattedNode = NULL, parent;
+     xmlAttrPtr attr;
+     xmlChar *start, *end;
+     xmlOutputBufferPtr buf;
+@@ -856,6 +856,7 @@ xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNodePtr cur) {
+     buf = ctxt->buf;
+ 
+     root = cur;
++    parent = cur->parent;
+     while (1) {
+         switch (cur->type) {
+         case XML_DOCUMENT_NODE:
+@@ -868,7 +869,9 @@ xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNodePtr cur) {
+             break;
+ 
+         case XML_DOCUMENT_FRAG_NODE:
+-            if (cur->children != NULL) {
++            /* Always validate cur->parent when descending. */
++            if ((cur->parent == parent) && (cur->children != NULL)) {
++                parent = cur;
+                 cur = cur->children;
+                 continue;
+             }
+@@ -887,7 +890,18 @@ xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNodePtr cur) {
+             break;
+ 
+         case XML_ELEMENT_NODE:
+-	    if ((cur != root) && (ctxt->format == 1) && (xmlIndentTreeOutput))
++            /*
++             * Some users like lxml are known to pass nodes with a corrupted
++             * tree structure. Fall back to a recursive call to handle this
++             * case.
++             */
++            if ((cur->parent != parent) && (cur->children != NULL)) {
++                xmlNodeDumpOutputInternal(ctxt, cur);
++                break;
++            }
++
++	    if ((ctxt->level > 0) && (ctxt->format == 1) &&
++                (xmlIndentTreeOutput))
+ 		xmlOutputBufferWrite(buf, ctxt->indent_size *
+ 				     (ctxt->level > ctxt->indent_nr ?
+ 				      ctxt->indent_nr : ctxt->level),
+@@ -942,6 +956,7 @@ xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNodePtr cur) {
+                 xmlOutputBufferWrite(buf, 1, ">");
+                 if (ctxt->format == 1) xmlOutputBufferWrite(buf, 1, "\n");
+                 if (ctxt->level >= 0) ctxt->level++;
++                parent = cur;
+                 cur = cur->children;
+                 continue;
+             }
+@@ -1058,13 +1073,9 @@ xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNodePtr cur) {
+                 break;
+             }
+ 
+-            /*
+-             * The parent should never be NULL here but we want to handle
+-             * corrupted documents gracefully.
+-             */
+-            if (cur->parent == NULL)
+-                return;
+-            cur = cur->parent;
++            cur = parent;
++            /* cur->parent was validated when descending. */
++            parent = cur->parent;
+ 
+             if (cur->type == XML_ELEMENT_NODE) {
+                 if (ctxt->level > 0) ctxt->level--;
+-- 
+2.32.0
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.12.bb b/meta/recipes-core/libxml/libxml2_2.9.12.bb
index c387587dfd..a7939c9713 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.12.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.12.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
            file://fix-execution-of-ptests.patch \
            file://remove-fuzz-from-ptests.patch \
+           file://0002-Work-around-lxml-API-abuse.patch \
            "
 
 SRC_URI[libtar.sha256sum] = "c8d6681e38c56f172892c85ddc0852e1fd4b53b4209e7f4ebf17f7e2eae71d92"
-- 
2.34.1


