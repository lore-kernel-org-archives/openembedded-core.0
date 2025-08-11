Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F503C87FDA
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 06:57:54 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.42148.1754895469528232806
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 23:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=V9+N7ryP;
 spf=pass (domain: mvista.com, ip: 209.85.214.174, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23fd91f2f8bso28777505ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 23:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1754895469; x=1755500269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fu5wNXAwGiYyr3cseVJu7+RnUJp86LsHVDPIyJp2ORM=;
        b=V9+N7ryPYNSIJuoCTQ9mCEbWOqF3hhVlQF3qq5XgD2XR1ubOij1mhl4d+c8Up+GwPH
         GWwyRerUpH07tRRgcnxv2XlHigp3zVQAPxY/iQzZx5eddpbvRYZvoAtgTKxh60VfB2El
         d5i5ZCAW4hPyqs0x70BmpVB71Fdf8DGHDdfiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754895469; x=1755500269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fu5wNXAwGiYyr3cseVJu7+RnUJp86LsHVDPIyJp2ORM=;
        b=o3JHxDJM3Py/uMFEgp+GajJBLkZ7W9lUwC1YOO+QLZLUmsp75NlHUDEBU0/EZDFfqc
         z+Tom4yJkCfXyHOeamDmWBp5ZWTrEFcbjRZPagVW5xmvU++T5F9KLkviPupD/VNPyMJt
         zsVkUY921hrvr9RaxnKq2r8Rbpm04Vnywk2Z9oeP/sr6eGGChfyrhTatllPyMbGILWXZ
         UDhIuQ8W/TwaZ7EHx3t8SF1G5QXHf8YGaIJzh/nQlAjoshKDk4Xuo1fb6XbqSRdoYBmD
         AB8w8v0imzE8+l6DU0I1QxIpQGMk1Pcg25VBdNpm+8G9w0HgKjrv2RApsfZjBORYghVs
         SMRg==
X-Gm-Message-State: AOJu0YzcZf5GOVStrGxFE1WMYPCqAgOlxvUKjtQbe/gD34nx5qE2Kegz
	5bdwFbJaqzcRC3znRGXgBueCheTs3WvK01Gsc8+0BomAkjClrDv4/LnukVpDHYiT5LRSlfvR/vG
	x8jDP
X-Gm-Gg: ASbGncs7TLXu9Uq/HK2NWsuKheaci+YEV131b4epZjxv8Lvl2R2BjnquHR/6vnJA0e0
	mD0Zb5p3CoY47AhM/jnISdhMCk0kfH47YGwfhCWgGrJG1iOYIzMB51N7KuoEaewdAUOrlBcGOrp
	ueoDIf7M+SkdC/Wmsk3MebBcDdGMz7yhetGrTUlmNuRwB/VSqzstKTfopY0r3q5FU3qmTOYu7PJ
	lTKyqjsBG9EZdVCsPA7DaSY/d+VDC2WOfNoQKfhtyNXdQq+t72CxkB3djT5uHaCh6xWtST0fEjC
	goV1fyFKZA2+b8JuIdOGvb4o7ljcNzM7j/skJavyl4ppykyQCG+qABj0zyh6qc4Wh/fvIR979wq
	6RZydG44bfHsRWpSiYBJXQL1j7DnOyKHP7Ghg
X-Google-Smtp-Source: AGHT+IEo43VmuYVQGzAqafdL1oM9ZnQwnFCZvRp0fwnuARqzJyxTET5HpVoVO4xcOWX8RX9dZT6Ehw==
X-Received: by 2002:a17:903:1103:b0:240:3ed3:13e7 with SMTP id d9443c01a7336-242c2228d0bmr195282785ad.42.1754895468168;
        Sun, 10 Aug 2025 23:57:48 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8976cb1sm265317055ad.89.2025.08.10.23.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 23:57:47 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] libxslt: fix CVE-2023-40403
Date: Mon, 11 Aug 2025 12:27:03 +0530
Message-ID: <20250811065717.65352-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 06:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221719

Upstream-Status: Backport from  https://gitlab.gnome.org/GNOME/libxslt/-/commit/adebe45f6ef9f9d036acacd8aec7411d4ea84e25 && https://gitlab.gnome.org/GNOME/libxslt/-/commit/1d9820635c271b35f88431f33ea78dc8be349e5b && https://gitlab.gnome.org/GNOME/libxslt/-/commit/ccec6fa31d11ab0a5299f15ea184c7a457e92940 && https://gitlab.gnome.org/GNOME/libxslt/-/commit/82f6cbf8ca61b1f9e00dc04aa3b15d563e7bbc6d && https://gitlab.gnome.org/GNOME/libxslt/-/commit/452fb4ca9b9803448826008b9573987c615912a1

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libxslt/libxslt/CVE-2023-40403-001.patch  | 257 +++++++++++++
 .../libxslt/libxslt/CVE-2023-40403-002.patch  | 147 ++++++++
 .../libxslt/libxslt/CVE-2023-40403-003.patch  | 231 ++++++++++++
 .../libxslt/libxslt/CVE-2023-40403-004.patch  | 349 ++++++++++++++++++
 .../libxslt/libxslt/CVE-2023-40403-005.patch  |  55 +++
 .../recipes-support/libxslt/libxslt_1.1.35.bb |   5 +
 6 files changed, 1044 insertions(+)
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2023-40403-001.patch
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2023-40403-002.patch
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2023-40403-003.patch
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2023-40403-004.patch
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2023-40403-005.patch

diff --git a/meta/recipes-support/libxslt/libxslt/CVE-2023-40403-001.patch b/meta/recipes-support/libxslt/libxslt/CVE-2023-40403-001.patch
new file mode 100644
index 0000000000..044e100373
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/CVE-2023-40403-001.patch
@@ -0,0 +1,257 @@
+From 4f26166f9e253aa62f8c121a6a25c76df5aa8142 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Wed, 31 Aug 2022 15:29:57 +0200
+Subject: [PATCH] Infrastructure to store extra data in source nodes
+
+Provide a mechanism to store bit flags in nodes from the source
+document. This will later be used to store key and id status.
+
+Provide a function to find the psvi member of a node.
+
+Revert any changes to the source document after the transformation.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxslt/-/commit/adebe45f6ef9f9d036acacd8aec7411d4ea84e25]
+CVE: CVE-2023-40403
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+---
+ libxslt/transform.c     |  34 ++++++++++
+ libxslt/xsltInternals.h |   1 +
+ libxslt/xsltutils.c     | 135 ++++++++++++++++++++++++++++++++++++++++
+ libxslt/xsltutils.h     |  13 ++++
+ 4 files changed, 183 insertions(+)
+
+diff --git a/libxslt/transform.c b/libxslt/transform.c
+index 57f05bf..40ab810 100644
+--- a/libxslt/transform.c
++++ b/libxslt/transform.c
+@@ -5747,6 +5747,37 @@ xsltCountKeys(xsltTransformContextPtr ctxt)
+     return(ctxt->nbKeys);
+ }
+ 
++/**
++ * xsltCleanupSourceDoc:
++ * @doc:  Document
++ *
++ * Resets source node flags and ids stored in 'psvi' member.
++ */
++static void
++xsltCleanupSourceDoc(xmlDocPtr doc) {
++    xmlNodePtr cur = (xmlNodePtr) doc;
++    void **psviPtr;
++
++    while (1) {
++        xsltClearSourceNodeFlags(cur, XSLT_SOURCE_NODE_MASK);
++        psviPtr = xsltGetPSVIPtr(cur);
++        if (psviPtr)
++            *psviPtr = NULL;
++
++        if (cur->children != NULL && cur->type != XML_ENTITY_REF_NODE) {
++            cur = cur->children;
++        } else {
++            while (cur->next == NULL) {
++                cur = cur->parent;
++                if (cur == (xmlNodePtr) doc)
++                    return;
++            }
++
++            cur = cur->next;
++        }
++    }
++}
++
+ /**
+  * xsltApplyStylesheetInternal:
+  * @style:  a parsed XSLT stylesheet
+@@ -6145,6 +6176,9 @@ xsltApplyStylesheetInternal(xsltStylesheetPtr style, xmlDocPtr doc,
+     printf("# Reused variables     : %d\n", ctxt->cache->dbgReusedVars);
+ #endif
+ 
++    if (ctxt->sourceDocDirty)
++        xsltCleanupSourceDoc(doc);
++
+     if ((ctxt != NULL) && (userCtxt == NULL))
+ 	xsltFreeTransformContext(ctxt);
+ 
+diff --git a/libxslt/xsltInternals.h b/libxslt/xsltInternals.h
+index 14343d2..b0125c2 100644
+--- a/libxslt/xsltInternals.h
++++ b/libxslt/xsltInternals.h
+@@ -1786,6 +1786,7 @@ struct _xsltTransformContext {
+     int maxTemplateVars;
+     unsigned long opLimit;
+     unsigned long opCount;
++    int sourceDocDirty;
+ };
+ 
+ /**
+diff --git a/libxslt/xsltutils.c b/libxslt/xsltutils.c
+index 9faa6b2..a879aa8 100644
+--- a/libxslt/xsltutils.c
++++ b/libxslt/xsltutils.c
+@@ -1835,6 +1835,141 @@ xsltSaveResultToString(xmlChar **doc_txt_ptr, int * doc_txt_len,
+     return 0;
+ }
+ 
++/**
++ * xsltGetSourceNodeFlags:
++ * @node:  Node from source document
++ *
++ * Returns the flags for a source node.
++ */
++int
++xsltGetSourceNodeFlags(xmlNodePtr node) {
++    /*
++     * Squeeze the bit flags into the upper bits of
++     *
++     * - 'int properties' member in struct _xmlDoc
++     * - 'xmlAttributeType atype' member in struct _xmlAttr
++     * - 'unsigned short extra' member in struct _xmlNode
++     */
++    switch (node->type) {
++        case XML_DOCUMENT_NODE:
++        case XML_HTML_DOCUMENT_NODE:
++            return ((xmlDocPtr) node)->properties >> 27;
++
++        case XML_ATTRIBUTE_NODE:
++            return ((xmlAttrPtr) node)->atype >> 27;
++
++        case XML_ELEMENT_NODE:
++        case XML_TEXT_NODE:
++        case XML_CDATA_SECTION_NODE:
++        case XML_PI_NODE:
++        case XML_COMMENT_NODE:
++            return node->extra >> 12;
++
++        default:
++            return 0;
++    }
++}
++
++/**
++ * xsltSetSourceNodeFlags:
++ * @node:  Node from source document
++ * @flags:  Flags
++ *
++ * Sets the specified flags to 1.
++ *
++ * Returns 0 on success, -1 on error.
++ */
++int
++xsltSetSourceNodeFlags(xsltTransformContextPtr ctxt, xmlNodePtr node,
++                       int flags) {
++    if (node->doc == ctxt->initialContextDoc)
++        ctxt->sourceDocDirty = 1;
++
++    switch (node->type) {
++        case XML_DOCUMENT_NODE:
++        case XML_HTML_DOCUMENT_NODE:
++            ((xmlDocPtr) node)->properties |= flags << 27;
++            return 0;
++
++        case XML_ATTRIBUTE_NODE:
++            ((xmlAttrPtr) node)->atype |= flags << 27;
++            return 0;
++
++        case XML_ELEMENT_NODE:
++        case XML_TEXT_NODE:
++        case XML_CDATA_SECTION_NODE:
++        case XML_PI_NODE:
++        case XML_COMMENT_NODE:
++            node->extra |= flags << 12;
++            return 0;
++
++        default:
++            return -1;
++    }
++}
++
++/**
++ * xsltClearSourceNodeFlags:
++ * @node:  Node from source document
++ * @flags:  Flags
++ *
++ * Sets the specified flags to 0.
++ *
++ * Returns 0 on success, -1 on error.
++ */
++int
++xsltClearSourceNodeFlags(xmlNodePtr node, int flags) {
++    switch (node->type) {
++        case XML_DOCUMENT_NODE:
++        case XML_HTML_DOCUMENT_NODE:
++            ((xmlDocPtr) node)->properties &= ~(flags << 27);
++            return 0;
++
++        case XML_ATTRIBUTE_NODE:
++            ((xmlAttrPtr) node)->atype &= ~(flags << 27);
++            return 0;
++
++        case XML_ELEMENT_NODE:
++        case XML_TEXT_NODE:
++        case XML_CDATA_SECTION_NODE:
++        case XML_PI_NODE:
++        case XML_COMMENT_NODE:
++            node->extra &= ~(flags << 12);
++            return 0;
++
++        default:
++            return -1;
++    }
++}
++
++/**
++ * xsltGetPSVIPtr:
++ * @cur:  Node
++ *
++ * Returns a pointer to the psvi member of a node or NULL on error.
++ */
++void **
++xsltGetPSVIPtr(xmlNodePtr cur) {
++    switch (cur->type) {
++        case XML_DOCUMENT_NODE:
++        case XML_HTML_DOCUMENT_NODE:
++            return &((xmlDocPtr) cur)->psvi;
++
++        case XML_ATTRIBUTE_NODE:
++            return &((xmlAttrPtr) cur)->psvi;
++
++        case XML_ELEMENT_NODE:
++        case XML_TEXT_NODE:
++        case XML_CDATA_SECTION_NODE:
++        case XML_PI_NODE:
++        case XML_COMMENT_NODE:
++            return &cur->psvi;
++
++        default:
++            return NULL;
++    }
++}
++
+ #ifdef WITH_PROFILER
+ 
+ /************************************************************************
+diff --git a/libxslt/xsltutils.h b/libxslt/xsltutils.h
+index ea6c374..202694f 100644
+--- a/libxslt/xsltutils.h
++++ b/libxslt/xsltutils.h
+@@ -247,6 +247,19 @@ XSLTPUBFUN xmlXPathCompExprPtr XSLTCALL
+ 						 const xmlChar *str,
+ 						 int flags);
+ 
++#ifdef IN_LIBXSLT
++#define XSLT_SOURCE_NODE_MASK       15
++int
++xsltGetSourceNodeFlags(xmlNodePtr node);
++int
++xsltSetSourceNodeFlags(xsltTransformContextPtr ctxt, xmlNodePtr node,
++                       int flags);
++int
++xsltClearSourceNodeFlags(xmlNodePtr node, int flags);
++void **
++xsltGetPSVIPtr(xmlNodePtr cur);
++#endif
++
+ /*
+  * Profiling.
+  */
diff --git a/meta/recipes-support/libxslt/libxslt/CVE-2023-40403-002.patch b/meta/recipes-support/libxslt/libxslt/CVE-2023-40403-002.patch
new file mode 100644
index 0000000000..0d815c1090
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/CVE-2023-40403-002.patch
@@ -0,0 +1,147 @@
+From b392a3d0265f190d86cc122d86769a23ddb1fe66 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Wed, 31 Aug 2022 15:34:47 +0200
+Subject: [PATCH] Store key status of source nodes as bit flag
+
+This frees up the psvi member.
+
+CVE: CVE-2023-40403
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxslt/-/commit/1d9820635c271b35f88431f33ea78dc8be349e5b]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+---
+ libxslt/keys.c      | 19 +------------------
+ libxslt/pattern.c   | 37 ++-----------------------------------
+ libxslt/xsltutils.h |  1 +
+ 3 files changed, 4 insertions(+), 53 deletions(-)
+
+diff --git a/libxslt/keys.c b/libxslt/keys.c
+index ecef538..3a134ab 100644
+--- a/libxslt/keys.c
++++ b/libxslt/keys.c
+@@ -834,24 +834,7 @@ fprintf(stderr, "xsltInitCtxtKey %s : %d\n", keyDef->name, ctxt->keyInitLevel);
+ 		*/
+ 		xmlXPathNodeSetAdd(keylist, cur);
+ 	    }
+-	    switch (cur->type) {
+-		case XML_ELEMENT_NODE:
+-		case XML_TEXT_NODE:
+-		case XML_CDATA_SECTION_NODE:
+-		case XML_PI_NODE:
+-		case XML_COMMENT_NODE:
+-		    cur->psvi = keyDef;
+-		    break;
+-		case XML_ATTRIBUTE_NODE:
+-		    ((xmlAttrPtr) cur)->psvi = keyDef;
+-		    break;
+-		case XML_DOCUMENT_NODE:
+-		case XML_HTML_DOCUMENT_NODE:
+-		    ((xmlDocPtr) cur)->psvi = keyDef;
+-		    break;
+-		default:
+-		    break;
+-	    }
++            xsltSetSourceNodeFlags(ctxt, cur, XSLT_SOURCE_NODE_HAS_KEY);
+ 	    xmlFree(str);
+ 	    str = NULL;
+ 
+diff --git a/libxslt/pattern.c b/libxslt/pattern.c
+index 1944661..9372bc3 100644
+--- a/libxslt/pattern.c
++++ b/libxslt/pattern.c
+@@ -2283,7 +2283,6 @@ xsltGetTemplate(xsltTransformContextPtr ctxt, xmlNodePtr node,
+     const xmlChar *name = NULL;
+     xsltCompMatchPtr list = NULL;
+     float priority;
+-    int keyed = 0;
+ 
+     if ((ctxt == NULL) || (node == NULL))
+ 	return(NULL);
+@@ -2361,37 +2360,25 @@ xsltGetTemplate(xsltTransformContextPtr ctxt, xmlNodePtr node,
+ 		    list = curstyle->rootMatch;
+ 		else
+ 		    list = curstyle->elemMatch;
+-		if (node->psvi != NULL) keyed = 1;
+ 		break;
+ 	    case XML_ATTRIBUTE_NODE: {
+-	        xmlAttrPtr attr;
+-
+ 		list = curstyle->attrMatch;
+-		attr = (xmlAttrPtr) node;
+-		if (attr->psvi != NULL) keyed = 1;
+ 		break;
+ 	    }
+ 	    case XML_PI_NODE:
+ 		list = curstyle->piMatch;
+-		if (node->psvi != NULL) keyed = 1;
+ 		break;
+ 	    case XML_DOCUMENT_NODE:
+ 	    case XML_HTML_DOCUMENT_NODE: {
+-	        xmlDocPtr doc;
+-
+ 		list = curstyle->rootMatch;
+-		doc = (xmlDocPtr) node;
+-		if (doc->psvi != NULL) keyed = 1;
+ 		break;
+ 	    }
+ 	    case XML_TEXT_NODE:
+ 	    case XML_CDATA_SECTION_NODE:
+ 		list = curstyle->textMatch;
+-		if (node->psvi != NULL) keyed = 1;
+ 		break;
+ 	    case XML_COMMENT_NODE:
+ 		list = curstyle->commentMatch;
+-		if (node->psvi != NULL) keyed = 1;
+ 		break;
+ 	    case XML_ENTITY_REF_NODE:
+ 	    case XML_ENTITY_NODE:
+@@ -2461,7 +2448,7 @@ xsltGetTemplate(xsltTransformContextPtr ctxt, xmlNodePtr node,
+ 	}
+ 
+ keyed_match:
+-	if (keyed) {
++        if (xsltGetSourceNodeFlags(node) & XSLT_SOURCE_NODE_HAS_KEY) {
+ 	    list = curstyle->keyMatch;
+ 	    while ((list != NULL) &&
+                    ((ret == NULL) ||
+@@ -2489,27 +2476,7 @@ keyed_match:
+ 	    if (xsltComputeAllKeys(ctxt, node) == -1)
+ 		goto error;
+ 
+-	    switch (node->type) {
+-		case XML_ELEMENT_NODE:
+-		    if (node->psvi != NULL) keyed = 1;
+-		    break;
+-		case XML_ATTRIBUTE_NODE:
+-		    if (((xmlAttrPtr) node)->psvi != NULL) keyed = 1;
+-		    break;
+-		case XML_TEXT_NODE:
+-		case XML_CDATA_SECTION_NODE:
+-		case XML_COMMENT_NODE:
+-		case XML_PI_NODE:
+-		    if (node->psvi != NULL) keyed = 1;
+-		    break;
+-		case XML_DOCUMENT_NODE:
+-		case XML_HTML_DOCUMENT_NODE:
+-		    if (((xmlDocPtr) node)->psvi != NULL) keyed = 1;
+-		    break;
+-		default:
+-		    break;
+-	    }
+-	    if (keyed)
++            if (xsltGetSourceNodeFlags(node) & XSLT_SOURCE_NODE_HAS_KEY)
+ 		goto keyed_match;
+ 	}
+ 	if (ret != NULL)
+diff --git a/libxslt/xsltutils.h b/libxslt/xsltutils.h
+index 202694f..dcfd139 100644
+--- a/libxslt/xsltutils.h
++++ b/libxslt/xsltutils.h
+@@ -249,6 +249,7 @@ XSLTPUBFUN xmlXPathCompExprPtr XSLTCALL
+ 
+ #ifdef IN_LIBXSLT
+ #define XSLT_SOURCE_NODE_MASK       15
++#define XSLT_SOURCE_NODE_HAS_KEY    1
+ int
+ xsltGetSourceNodeFlags(xmlNodePtr node);
+ int
diff --git a/meta/recipes-support/libxslt/libxslt/CVE-2023-40403-003.patch b/meta/recipes-support/libxslt/libxslt/CVE-2023-40403-003.patch
new file mode 100644
index 0000000000..0b9ab5829e
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/CVE-2023-40403-003.patch
@@ -0,0 +1,231 @@
+From 8986995b07126852762e8a59eaee83be0b8de9a3 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Wed, 31 Aug 2022 15:35:37 +0200
+Subject: [PATCH] Store RVT ownership in 'compression' member
+
+'compression' is another unused member in struct _xmlDoc which is even
+better suited to store ownership status. More importantly, this frees up
+the 'psvi' member.
+
+This changes the public API but this feature is only required to
+implement EXSLT functions.
+
+CVE: CVE-2023-40403
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxslt/-/commit/ccec6fa31d11ab0a5299f15ea184c7a457e92940]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+---
+ libexslt/functions.c    |  2 +-
+ libxslt/transform.c     |  8 ++++----
+ libxslt/variables.c     | 44 ++++++++++++++++++++---------------------
+ libxslt/variables.h     |  6 +++---
+ libxslt/xsltInternals.h |  2 +-
+ 5 files changed, 31 insertions(+), 31 deletions(-)
+
+diff --git a/libexslt/functions.c b/libexslt/functions.c
+index 958bf60..859a992 100644
+--- a/libexslt/functions.c
++++ b/libexslt/functions.c
+@@ -775,7 +775,7 @@ exsltFuncResultElem (xsltTransformContextPtr ctxt,
+ 	}
+         /* Mark as function result. */
+         xsltRegisterLocalRVT(ctxt, container);
+-        container->psvi = XSLT_RVT_FUNC_RESULT;
++        container->compression = XSLT_RVT_FUNC_RESULT;
+ 
+ 	oldInsert = ctxt->insert;
+ 	ctxt->insert = (xmlNodePtr) container;
+diff --git a/libxslt/transform.c b/libxslt/transform.c
+index 40ab810..19d7326 100644
+--- a/libxslt/transform.c
++++ b/libxslt/transform.c
+@@ -2276,17 +2276,17 @@ xsltReleaseLocalRVTs(xsltTransformContextPtr ctxt, xmlDocPtr base)
+     do {
+         tmp = cur;
+         cur = (xmlDocPtr) cur->next;
+-        if (tmp->psvi == XSLT_RVT_LOCAL) {
++        if (tmp->compression == XSLT_RVT_LOCAL) {
+             xsltReleaseRVT(ctxt, tmp);
+-        } else if (tmp->psvi == XSLT_RVT_GLOBAL) {
++        } else if (tmp->compression == XSLT_RVT_GLOBAL) {
+             xsltRegisterPersistRVT(ctxt, tmp);
+-        } else if (tmp->psvi == XSLT_RVT_FUNC_RESULT) {
++        } else if (tmp->compression == XSLT_RVT_FUNC_RESULT) {
+             /*
+              * This will either register the RVT again or move it to the
+              * context variable.
+              */
+             xsltRegisterLocalRVT(ctxt, tmp);
+-            tmp->psvi = XSLT_RVT_FUNC_RESULT;
++            tmp->compression = XSLT_RVT_FUNC_RESULT;
+         } else {
+             xmlGenericError(xmlGenericErrorContext,
+                     "xsltReleaseLocalRVTs: Unexpected RVT flag %p\n",
+diff --git a/libxslt/variables.c b/libxslt/variables.c
+index 4c972a4..dab0bab 100644
+--- a/libxslt/variables.c
++++ b/libxslt/variables.c
+@@ -123,7 +123,7 @@ xsltRegisterTmpRVT(xsltTransformContextPtr ctxt, xmlDocPtr RVT)
+ 	return(-1);
+ 
+     RVT->prev = NULL;
+-    RVT->psvi = XSLT_RVT_LOCAL;
++    RVT->compression = XSLT_RVT_LOCAL;
+ 
+     /*
+     * We'll restrict the lifetime of user-created fragments
+@@ -163,7 +163,7 @@ xsltRegisterLocalRVT(xsltTransformContextPtr ctxt,
+ 	return(-1);
+ 
+     RVT->prev = NULL;
+-    RVT->psvi = XSLT_RVT_LOCAL;
++    RVT->compression = XSLT_RVT_LOCAL;
+ 
+     /*
+     * When evaluating "select" expressions of xsl:variable
+@@ -255,7 +255,7 @@ xsltExtensionInstructionResultRegister(
+  * Returns 0 in case of success and -1 in case of error.
+  */
+ int
+-xsltFlagRVTs(xsltTransformContextPtr ctxt, xmlXPathObjectPtr obj, void *val) {
++xsltFlagRVTs(xsltTransformContextPtr ctxt, xmlXPathObjectPtr obj, int val) {
+     int i;
+     xmlNodePtr cur;
+     xmlDocPtr doc;
+@@ -302,34 +302,34 @@ xsltFlagRVTs(xsltTransformContextPtr ctxt, xmlXPathObjectPtr obj, void *val) {
+ 	    return(-1);
+ 	}
+ 	if (doc->name && (doc->name[0] == ' ') &&
+-            doc->psvi != XSLT_RVT_GLOBAL) {
++            doc->compression != XSLT_RVT_GLOBAL) {
+ 	    /*
+ 	    * This is a result tree fragment.
+-	    * We store ownership information in the @psvi field.
++	    * We store ownership information in the @compression field.
+ 	    * TODO: How do we know if this is a doc acquired via the
+ 	    *  document() function?
+ 	    */
+ #ifdef WITH_XSLT_DEBUG_VARIABLE
+             XSLT_TRACE(ctxt,XSLT_TRACE_VARIABLES,xsltGenericDebug(xsltGenericDebugContext,
+-                "Flagging RVT %p: %p -> %p\n", doc, doc->psvi, val));
++                "Flagging RVT %p: %d -> %d\n", doc, doc->compression, val));
+ #endif
+ 
+             if (val == XSLT_RVT_LOCAL) {
+-                if (doc->psvi == XSLT_RVT_FUNC_RESULT)
+-                    doc->psvi = XSLT_RVT_LOCAL;
++                if (doc->compression == XSLT_RVT_FUNC_RESULT)
++                    doc->compression = XSLT_RVT_LOCAL;
+             } else if (val == XSLT_RVT_GLOBAL) {
+-                if (doc->psvi != XSLT_RVT_LOCAL) {
++                if (doc->compression != XSLT_RVT_LOCAL) {
+ 		    xmlGenericError(xmlGenericErrorContext,
+-                            "xsltFlagRVTs: Invalid transition %p => GLOBAL\n",
+-                            doc->psvi);
+-                    doc->psvi = XSLT_RVT_GLOBAL;
++                            "xsltFlagRVTs: Invalid transition %d => GLOBAL\n",
++                            doc->compression);
++                    doc->compression = XSLT_RVT_GLOBAL;
+                     return(-1);
+                 }
+ 
+                 /* Will be registered as persistant in xsltReleaseLocalRVTs. */
+-                doc->psvi = XSLT_RVT_GLOBAL;
++                doc->compression = XSLT_RVT_GLOBAL;
+             } else if (val == XSLT_RVT_FUNC_RESULT) {
+-	        doc->psvi = val;
++	        doc->compression = val;
+             }
+ 	}
+     }
+@@ -382,7 +382,7 @@ xsltReleaseRVT(xsltTransformContextPtr ctxt, xmlDocPtr RVT)
+ 	/*
+ 	* Reset the ownership information.
+ 	*/
+-	RVT->psvi = NULL;
++	RVT->compression = 0;
+ 
+ 	RVT->next = (xmlNodePtr) ctxt->cache->RVT;
+ 	ctxt->cache->RVT = RVT;
+@@ -421,7 +421,7 @@ xsltRegisterPersistRVT(xsltTransformContextPtr ctxt, xmlDocPtr RVT)
+ {
+     if ((ctxt == NULL) || (RVT == NULL)) return(-1);
+ 
+-    RVT->psvi = XSLT_RVT_GLOBAL;
++    RVT->compression = XSLT_RVT_GLOBAL;
+     RVT->prev = NULL;
+     RVT->next = (xmlNodePtr) ctxt->persistRVT;
+     if (ctxt->persistRVT != NULL)
+@@ -580,15 +580,15 @@ xsltFreeStackElem(xsltStackElemPtr elem) {
+ 	    cur = elem->fragment;
+ 	    elem->fragment = (xmlDocPtr) cur->next;
+ 
+-            if (cur->psvi == XSLT_RVT_LOCAL) {
++            if (cur->compression == XSLT_RVT_LOCAL) {
+ 		xsltReleaseRVT(elem->context, cur);
+-            } else if (cur->psvi == XSLT_RVT_FUNC_RESULT) {
++            } else if (cur->compression == XSLT_RVT_FUNC_RESULT) {
+                 xsltRegisterLocalRVT(elem->context, cur);
+-                cur->psvi = XSLT_RVT_FUNC_RESULT;
++                cur->compression = XSLT_RVT_FUNC_RESULT;
+             } else {
+                 xmlGenericError(xmlGenericErrorContext,
+-                        "xsltFreeStackElem: Unexpected RVT flag %p\n",
+-                        cur->psvi);
++                        "xsltFreeStackElem: Unexpected RVT flag %d\n",
++                        cur->compression);
+             }
+ 	}
+     }
+@@ -989,7 +989,7 @@ xsltEvalVariable(xsltTransformContextPtr ctxt, xsltStackElemPtr variable,
+ 		* the Result Tree Fragment.
+ 		*/
+ 		variable->fragment = container;
+-                container->psvi = XSLT_RVT_LOCAL;
++                container->compression = XSLT_RVT_LOCAL;
+ 
+ 		oldOutput = ctxt->output;
+ 		oldInsert = ctxt->insert;
+diff --git a/libxslt/variables.h b/libxslt/variables.h
+index 039288f..e2adee0 100644
+--- a/libxslt/variables.h
++++ b/libxslt/variables.h
+@@ -43,7 +43,7 @@ extern "C" {
+  *
+  * RVT is destroyed after the current instructions ends.
+  */
+-#define XSLT_RVT_LOCAL       ((void *)1)
++#define XSLT_RVT_LOCAL       1
+ 
+ /**
+  * XSLT_RVT_FUNC_RESULT:
+@@ -52,14 +52,14 @@ extern "C" {
+  * destroyed after exiting a template and will be reset to XSLT_RVT_LOCAL or
+  * XSLT_RVT_VARIABLE in the template that receives the return value.
+  */
+-#define XSLT_RVT_FUNC_RESULT ((void *)2)
++#define XSLT_RVT_FUNC_RESULT 2
+ 
+ /**
+  * XSLT_RVT_GLOBAL:
+  *
+  * RVT is part of a global variable.
+  */
+-#define XSLT_RVT_GLOBAL      ((void *)3)
++#define XSLT_RVT_GLOBAL      3
+ 
+ /*
+  * Interfaces for the variable module.
+diff --git a/libxslt/xsltInternals.h b/libxslt/xsltInternals.h
+index b0125c2..74a2b64 100644
+--- a/libxslt/xsltInternals.h
++++ b/libxslt/xsltInternals.h
+@@ -1916,7 +1916,7 @@ XSLTPUBFUN int XSLTCALL
+ 			xsltFlagRVTs(
+ 						 xsltTransformContextPtr ctxt,
+ 						 xmlXPathObjectPtr obj,
+-						 void *val);
++						 int val);
+ XSLTPUBFUN void XSLTCALL
+ 			xsltFreeRVTs		(xsltTransformContextPtr ctxt);
+ XSLTPUBFUN void XSLTCALL
diff --git a/meta/recipes-support/libxslt/libxslt/CVE-2023-40403-004.patch b/meta/recipes-support/libxslt/libxslt/CVE-2023-40403-004.patch
new file mode 100644
index 0000000000..59e7c1bad3
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/CVE-2023-40403-004.patch
@@ -0,0 +1,349 @@
+From 91c9c56dcca01bfe3f9dae74fb75dcf792ebe58b Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Wed, 31 Aug 2022 13:35:23 +0200
+Subject: [PATCH] Make generate-id() deterministic
+
+Rework the generate-id() function to return deterministic values. We use
+a simple incrementing counter and store ids in the 'psvi' member of
+nodes which was freed up by previous commits. The presence of an id is
+indicated by a new "source node" flag.
+
+This fixes long-standing problems with reproducible builds, see
+https://bugzilla.gnome.org/show_bug.cgi?id=751621
+
+This also hardens security, as the old implementation leaked the
+difference between a heap and a global pointer, see
+https://bugs.chromium.org/p/chromium/issues/detail?id=1356211
+
+The old implementation could also generate the same id for dynamically
+created nodes which happened to reuse the same memory. Ids for namespace
+nodes were completely broken. They now use the id of the parent element
+together with the hex-encoded namespace prefix.
+
+CVE: CVE-2023-40403
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxslt/-/commit/82f6cbf8ca61b1f9e00dc04aa3b15d563e7bbc6d]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+---
+ libxslt/functions.c               | 107 +++++++++++++++++++++++++-----
+ libxslt/xsltInternals.h           |   1 +
+ libxslt/xsltutils.h               |   1 +
+ tests/REC/test-12.4-1.out         |  11 +++
+ tests/REC/test-12.4-1.xml         |   6 ++
+ tests/REC/test-12.4-1.xsl         |  38 +++++++++++
+ tests/exslt/common/dynamic-id.out |  13 ++++
+ tests/exslt/common/dynamic-id.xml |   1 +
+ tests/exslt/common/dynamic-id.xsl |  29 ++++++++
+ 9 files changed, 191 insertions(+), 16 deletions(-)
+ create mode 100644 tests/REC/test-12.4-1.out
+ create mode 100644 tests/REC/test-12.4-1.xml
+ create mode 100644 tests/REC/test-12.4-1.xsl
+ create mode 100644 tests/exslt/common/dynamic-id.out
+ create mode 100644 tests/exslt/common/dynamic-id.xml
+ create mode 100644 tests/exslt/common/dynamic-id.xsl
+
+diff --git a/libxslt/functions.c b/libxslt/functions.c
+index 7887dda..da25c24 100644
+--- a/libxslt/functions.c
++++ b/libxslt/functions.c
+@@ -693,11 +693,16 @@ xsltFormatNumberFunction(xmlXPathParserContextPtr ctxt, int nargs)
+  */
+ void
+ xsltGenerateIdFunction(xmlXPathParserContextPtr ctxt, int nargs){
+-    static char base_address;
++    xsltTransformContextPtr tctxt;
+     xmlNodePtr cur = NULL;
+     xmlXPathObjectPtr obj = NULL;
+-    long val;
+-    xmlChar str[30];
++    char *str;
++    const xmlChar *nsPrefix = NULL;
++    void **psviPtr;
++    unsigned long id;
++    size_t size, nsPrefixSize;
++
++    tctxt = xsltXPathGetTransformContext(ctxt);
+ 
+     if (nargs == 0) {
+ 	cur = ctxt->context->node;
+@@ -707,16 +712,15 @@ xsltGenerateIdFunction(xmlXPathParserContextPtr ctxt, int nargs){
+ 
+ 	if ((ctxt->value == NULL) || (ctxt->value->type != XPATH_NODESET)) {
+ 	    ctxt->error = XPATH_INVALID_TYPE;
+-	    xsltTransformError(xsltXPathGetTransformContext(ctxt), NULL, NULL,
++	    xsltTransformError(tctxt, NULL, NULL,
+ 		"generate-id() : invalid arg expecting a node-set\n");
+-	    return;
++            goto out;
+ 	}
+ 	obj = valuePop(ctxt);
+ 	nodelist = obj->nodesetval;
+ 	if ((nodelist == NULL) || (nodelist->nodeNr <= 0)) {
+-	    xmlXPathFreeObject(obj);
+ 	    valuePush(ctxt, xmlXPathNewCString(""));
+-	    return;
++	    goto out;
+ 	}
+ 	cur = nodelist->nodeTab[0];
+ 	for (i = 1;i < nodelist->nodeNr;i++) {
+@@ -725,22 +729,93 @@ xsltGenerateIdFunction(xmlXPathParserContextPtr ctxt, int nargs){
+ 	        cur = nodelist->nodeTab[i];
+ 	}
+     } else {
+-	xsltTransformError(xsltXPathGetTransformContext(ctxt), NULL, NULL,
++	xsltTransformError(tctxt, NULL, NULL,
+ 		"generate-id() : invalid number of args %d\n", nargs);
+ 	ctxt->error = XPATH_INVALID_ARITY;
+-	return;
++	goto out;
++    }
++
++    size = 30; /* for "id%lu" */
++
++    if (cur->type == XML_NAMESPACE_DECL) {
++        xmlNsPtr ns = (xmlNsPtr) cur;
++
++        nsPrefix = ns->prefix;
++        if (nsPrefix == NULL)
++            nsPrefix = BAD_CAST "";
++        nsPrefixSize = xmlStrlen(nsPrefix);
++        /* For "ns" and hex-encoded string */
++        size += nsPrefixSize * 2 + 2;
++
++        /* Parent is stored in 'next'. */
++        cur = (xmlNodePtr) ns->next;
++    }
++
++    psviPtr = xsltGetPSVIPtr(cur);
++    if (psviPtr == NULL) {
++        xsltTransformError(tctxt, NULL, NULL,
++                "generate-id(): invalid node type %d\n", cur->type);
++        ctxt->error = XPATH_INVALID_TYPE;
++        goto out;
+     }
+ 
+-    if (obj)
+-        xmlXPathFreeObject(obj);
++    if (xsltGetSourceNodeFlags(cur) & XSLT_SOURCE_NODE_HAS_ID) {
++        id = (unsigned long) *psviPtr;
++    } else {
++        if (cur->type == XML_TEXT_NODE && cur->line == USHRT_MAX) {
++            /* Text nodes store big line numbers in psvi. */
++            cur->line = 0;
++        } else if (*psviPtr != NULL) {
++            xsltTransformError(tctxt, NULL, NULL,
++                    "generate-id(): psvi already set\n");
++            ctxt->error = XPATH_MEMORY_ERROR;
++            goto out;
++        }
++
++        if (tctxt->currentId == ULONG_MAX) {
++            xsltTransformError(tctxt, NULL, NULL,
++                    "generate-id(): id overflow\n");
++            ctxt->error = XPATH_MEMORY_ERROR;
++            goto out;
++        }
++
++        id = ++tctxt->currentId;
++        *psviPtr = (void *) id;
++        xsltSetSourceNodeFlags(tctxt, cur, XSLT_SOURCE_NODE_HAS_ID);
++    }
+ 
+-    val = (long)((char *)cur - (char *)&base_address);
+-    if (val >= 0) {
+-      snprintf((char *)str, sizeof(str), "idp%ld", val);
++    str = xmlMalloc(size);
++    if (str == NULL) {
++        xsltTransformError(tctxt, NULL, NULL,
++                "generate-id(): out of memory\n");
++        ctxt->error = XPATH_MEMORY_ERROR;
++        goto out;
++    }
++    if (nsPrefix == NULL) {
++        snprintf(str, size, "id%lu", id);
+     } else {
+-      snprintf((char *)str, sizeof(str), "idm%ld", -val);
++        size_t i, j;
++
++        snprintf(str, size, "id%luns", id);
++
++        /*
++         * Only ASCII alphanumerics are allowed, so we hex-encode the prefix.
++         */
++        j = strlen(str);
++        for (i = 0; i < nsPrefixSize; i++) {
++            int v;
++
++            v = nsPrefix[i] >> 4;
++            str[j++] = v < 10 ? '0' + v : 'A' + (v - 10);
++            v = nsPrefix[i] & 15;
++            str[j++] = v < 10 ? '0' + v : 'A' + (v - 10);
++        }
++        str[j] = '\0';
+     }
+-    valuePush(ctxt, xmlXPathNewString(str));
++    valuePush(ctxt, xmlXPathWrapString(BAD_CAST str));
++
++out:
++    xmlXPathFreeObject(obj);
+ }
+ 
+ /**
+diff --git a/libxslt/xsltInternals.h b/libxslt/xsltInternals.h
+index 74a2b64..2fd1f68 100644
+--- a/libxslt/xsltInternals.h
++++ b/libxslt/xsltInternals.h
+@@ -1787,6 +1787,7 @@ struct _xsltTransformContext {
+     unsigned long opLimit;
+     unsigned long opCount;
+     int sourceDocDirty;
++    unsigned long currentId; /* For generate-id() */
+ };
+ 
+ /**
+diff --git a/libxslt/xsltutils.h b/libxslt/xsltutils.h
+index dcfd139..6c14ecf 100644
+--- a/libxslt/xsltutils.h
++++ b/libxslt/xsltutils.h
+@@ -250,6 +250,7 @@ XSLTPUBFUN xmlXPathCompExprPtr XSLTCALL
+ #ifdef IN_LIBXSLT
+ #define XSLT_SOURCE_NODE_MASK       15
+ #define XSLT_SOURCE_NODE_HAS_KEY    1
++#define XSLT_SOURCE_NODE_HAS_ID     2
+ int
+ xsltGetSourceNodeFlags(xmlNodePtr node);
+ int
+diff --git a/tests/REC/test-12.4-1.out b/tests/REC/test-12.4-1.out
+new file mode 100644
+index 0000000..237a9f2
+--- /dev/null
++++ b/tests/REC/test-12.4-1.out
+@@ -0,0 +1,11 @@
++<?xml version="1.0"?>
++<result>
++  <document>id1</document>
++  <element>id2</element>
++  <attribute>id3</attribute>
++  <namespace>id2ns</namespace>
++  <namespace>id2nsC3A4C3B6C3BC</namespace>
++  <text>id4</text>
++  <comment>id5</comment>
++  <processing-instruction>id6</processing-instruction>
++</result>
+diff --git a/tests/REC/test-12.4-1.xml b/tests/REC/test-12.4-1.xml
+new file mode 100644
+index 0000000..84484f6
+--- /dev/null
++++ b/tests/REC/test-12.4-1.xml
+@@ -0,0 +1,6 @@
++<doc xmlns="s:def">
++    <elem attr="value" xmlns:äöü="uri"/>
++    <text>text</text>
++    <!-- comment -->
++    <?pi content?>
++</doc>
+diff --git a/tests/REC/test-12.4-1.xsl b/tests/REC/test-12.4-1.xsl
+new file mode 100644
+index 0000000..5cf5dd3
+--- /dev/null
++++ b/tests/REC/test-12.4-1.xsl
+@@ -0,0 +1,38 @@
++<xsl:stylesheet
++    version="1.0"
++    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
++    xmlns:d="s:def"
++    exclude-result-prefixes="d">
++
++<xsl:output indent="yes"/>
++
++<xsl:template match="/">
++    <result>
++        <document>
++            <xsl:value-of select="generate-id(/)"/>
++        </document>
++        <element>
++            <xsl:value-of select="generate-id(/d:doc/d:elem)"/>
++        </element>
++        <attribute>
++            <xsl:value-of select="generate-id(d:doc/d:elem/@attr)"/>
++        </attribute>
++        <namespace>
++            <xsl:value-of select="generate-id(d:doc/d:elem/namespace::*[local-name()=''])"/>
++        </namespace>
++        <namespace>
++            <xsl:value-of select="generate-id(d:doc/d:elem/namespace::äöü)"/>
++        </namespace>
++        <text>
++            <xsl:value-of select="generate-id(d:doc/d:text/text())"/>
++        </text>
++        <comment>
++            <xsl:value-of select="generate-id(d:doc/comment())"/>
++        </comment>
++        <processing-instruction>
++            <xsl:value-of select="generate-id(d:doc/processing-instruction())"/>
++        </processing-instruction>
++    </result>
++</xsl:template>
++
++</xsl:stylesheet>
+diff --git a/tests/exslt/common/dynamic-id.out b/tests/exslt/common/dynamic-id.out
+new file mode 100644
+index 0000000..1b7b7ba
+--- /dev/null
++++ b/tests/exslt/common/dynamic-id.out
+@@ -0,0 +1,13 @@
++<?xml version="1.0"?>
++<result xmlns:exsl="http://exslt.org/common">
++  <id>id1</id>
++  <id>id2</id>
++  <id>id3</id>
++  <id>id4</id>
++  <id>id5</id>
++  <id>id6</id>
++  <id>id7</id>
++  <id>id8</id>
++  <id>id9</id>
++  <id>id10</id>
++</result>
+diff --git a/tests/exslt/common/dynamic-id.xml b/tests/exslt/common/dynamic-id.xml
+new file mode 100644
+index 0000000..69d62f2
+--- /dev/null
++++ b/tests/exslt/common/dynamic-id.xml
+@@ -0,0 +1 @@
++<doc/>
+diff --git a/tests/exslt/common/dynamic-id.xsl b/tests/exslt/common/dynamic-id.xsl
+new file mode 100644
+index 0000000..8478f6a
+--- /dev/null
++++ b/tests/exslt/common/dynamic-id.xsl
+@@ -0,0 +1,29 @@
++<xsl:stylesheet
++    version="1.0"
++    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
++    xmlns:exsl="http://exslt.org/common">
++
++<xsl:output indent="yes"/>
++
++<xsl:template name="dynamic-id">
++    <id>
++        <xsl:value-of select="generate-id(exsl:node-set('string'))"/>
++    </id>
++</xsl:template>
++
++<xsl:template match="/">
++    <result>
++        <xsl:call-template name="dynamic-id"/>
++        <xsl:call-template name="dynamic-id"/>
++        <xsl:call-template name="dynamic-id"/>
++        <xsl:call-template name="dynamic-id"/>
++        <xsl:call-template name="dynamic-id"/>
++        <xsl:call-template name="dynamic-id"/>
++        <xsl:call-template name="dynamic-id"/>
++        <xsl:call-template name="dynamic-id"/>
++        <xsl:call-template name="dynamic-id"/>
++        <xsl:call-template name="dynamic-id"/>
++    </result>
++</xsl:template>
++
++</xsl:stylesheet>
diff --git a/meta/recipes-support/libxslt/libxslt/CVE-2023-40403-005.patch b/meta/recipes-support/libxslt/libxslt/CVE-2023-40403-005.patch
new file mode 100644
index 0000000000..e27034a0ec
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/CVE-2023-40403-005.patch
@@ -0,0 +1,55 @@
+From 3014af50b22f1be89b5514faea284de7b63fa5dc Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Wed, 31 Aug 2022 21:37:44 +0200
+Subject: [PATCH] Clean up attributes in source doc
+
+Also make bit flag constants unsigned to avoid implicit-conversion
+warnings.
+
+CVE: CVE-2023-40403
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxslt/-/commit/452fb4ca9b9803448826008b9573987c615912a1]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+---
+ libxslt/transform.c | 10 ++++++++++
+ libxslt/xsltutils.h |  6 +++---
+ 2 files changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/libxslt/transform.c b/libxslt/transform.c
+index 19d7326..7299eb5 100644
+--- a/libxslt/transform.c
++++ b/libxslt/transform.c
+@@ -5764,6 +5764,16 @@ xsltCleanupSourceDoc(xmlDocPtr doc) {
+         if (psviPtr)
+             *psviPtr = NULL;
+ 
++        if (cur->type == XML_ELEMENT_NODE) {
++            xmlAttrPtr prop = cur->properties;
++
++            while (prop) {
++                prop->atype &= ~(XSLT_SOURCE_NODE_MASK << 27);
++                prop->psvi = NULL;
++                prop = prop->next;
++            }
++        }
++
+         if (cur->children != NULL && cur->type != XML_ENTITY_REF_NODE) {
+             cur = cur->children;
+         } else {
+diff --git a/libxslt/xsltutils.h b/libxslt/xsltutils.h
+index 6c14ecf..2af4282 100644
+--- a/libxslt/xsltutils.h
++++ b/libxslt/xsltutils.h
+@@ -248,9 +248,9 @@ XSLTPUBFUN xmlXPathCompExprPtr XSLTCALL
+ 						 int flags);
+ 
+ #ifdef IN_LIBXSLT
+-#define XSLT_SOURCE_NODE_MASK       15
+-#define XSLT_SOURCE_NODE_HAS_KEY    1
+-#define XSLT_SOURCE_NODE_HAS_ID     2
++#define XSLT_SOURCE_NODE_MASK       15u
++#define XSLT_SOURCE_NODE_HAS_KEY    1u
++#define XSLT_SOURCE_NODE_HAS_ID     2u
+ int
+ xsltGetSourceNodeFlags(xmlNodePtr node);
+ int
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.35.bb b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
index 3df372b267..2291ed2cad 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.35.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
@@ -16,6 +16,11 @@ DEPENDS = "libxml2"
 SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz \
            file://CVE-2024-55549.patch \
            file://CVE-2025-24855.patch \
+           file://CVE-2023-40403-001.patch \
+           file://CVE-2023-40403-002.patch \
+           file://CVE-2023-40403-003.patch \
+           file://CVE-2023-40403-004.patch \
+           file://CVE-2023-40403-005.patch \
           "
 
 SRC_URI[sha256sum] = "8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eebc10c93ce1f34dd79"
-- 
2.50.1


