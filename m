Return-Path: <omkarpatil10.93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA668C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 12:18:06 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.6574.1654258685166019463
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 05:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=epO45MqK;
 spf=pass (domain: gmail.com, ip: 209.85.216.46,
 mailfrom: omkarpatil10.93@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 d12-20020a17090abf8c00b001e2eb431ce4so7080820pjs.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 05:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=7K/tMlim/fkgJlruhLrGK1ERWcTWoJfnC3ZBsEctNeU=;
        b=epO45MqK946DmVzQsGyx/FJkgu5ig7uE7cq51SraGV3rlFXqqavY/PHErTBHDfHGi0
         Yvy8F4svbrDMWpxvpMuZd5UVlSur0At9cIs1Ny2UMWyS6E2TA8onE/bS8WygBEL/zcn9
         50dxUBVo4M09ZXKBYNCL+RYD/8ey7U3HgKMyYf+irZn7PVa+WEH31hJKusyzfJbO/Oz1
         31f+M21gWiEdJBeUTCDTR9gOkXeXi6ZHozAkYoMReNkDdWuzaRx+HXHlFDV7ry4zf4v5
         y3nsgPAGz7+AKOp0YXJejrTjJ33D6iebJC0tJinqYrnbT9Vv4kEu9wr+b0TmDudVw3C4
         udLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7K/tMlim/fkgJlruhLrGK1ERWcTWoJfnC3ZBsEctNeU=;
        b=XZraO5dNnuohpdftcBFsmXifY0ZG1fCqomcjVYeKRBNHIHvCTKZJ/jHVp1MjUP3Bd+
         Xj6CjnkR8SNUt98IjBH0hELSahz9jrXn9zGSsEo/5P+jWFVDJw4hj652+Im2g4ed06pS
         wH5xKOtEfvw55siOYNmgC/2Hy06lKHKh68B3mi/vuzOMAneM+Y3X6KihH0lYm2NK18/H
         79xR47UTaoqAz3sso8beO7vx4clQWsTUe39l+1sNtOCIa28GX2DEav3WzaWv42kzSO6E
         AVGqHoq3U0oBZLtfHvoD+eBn+Iy+0SgpH+SUmvA/nRskRBhE7pIcnQ7+5pPNt7QMbhby
         NV5Q==
X-Gm-Message-State: AOAM533gk36avVXpqpRk17SUP9tU9kEzAvvo25NE8YzmbgXdV5NtYR68
	UcAWPzc3t9IIZZydVVf8QaVvNeaY5/U=
X-Google-Smtp-Source: 
 ABdhPJylilGXQs0KNmLROwqeBFZoXFIZNveKDSvz+aNG93lRtH+HiXQN+eJ3+ZcHdW9FrPvVQ92XLA==
X-Received: by 2002:a17:902:e54a:b0:166:50b6:a08b with SMTP id
 n10-20020a170902e54a00b0016650b6a08bmr5251475plf.90.1654258684184;
        Fri, 03 Jun 2022 05:18:04 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4042:4e8c:4a84:cd17:5023:cf84:4172])
        by smtp.gmail.com with ESMTPSA id
 y2-20020a170902ed4200b0016392bd5060sm5247887plb.142.2022.06.03.05.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 05:18:03 -0700 (PDT)
From: Omkar Patil <omkarpatil10.93@gmail.com>
To: openembedded-core@lists.openembedded.org,
	omkar.patil@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][dunfell][PATCH 1/2] libxslt: Fix CVE-2021-30560
Date: Fri,  3 Jun 2022 17:47:49 +0530
Message-Id: <20220603121750.30519-1-omkarpatil10.93@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 12:18:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166518

From: omkar patil <omkar.patil@kpit.com>

CVE: CVE-2021-30560

Signed-off-by: omkar patil <omkar.patil@kpit.com>
---
 .../libxslt/libxslt/CVE-2021-30560.patch      | 201 ++++++++++++++++++
 .../recipes-support/libxslt/libxslt_1.1.34.bb |   1 +
 2 files changed, 202 insertions(+)
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2021-30560.patch

diff --git a/meta/recipes-support/libxslt/libxslt/CVE-2021-30560.patch b/meta/recipes-support/libxslt/libxslt/CVE-2021-30560.patch
new file mode 100644
index 0000000000..614047ea7a
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/CVE-2021-30560.patch
@@ -0,0 +1,201 @@
+From 50f9c9cd3b7dfe9b3c8c795247752d1fdcadcac8 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Sat, 12 Jun 2021 20:02:53 +0200
+Subject: [PATCH] Fix use-after-free in xsltApplyTemplates
+
+xsltApplyTemplates without a select expression could delete nodes in
+the source document.
+
+1. Text nodes with strippable whitespace
+
+Whitespace from input documents is already stripped, so there's no
+need to strip it again. Under certain circumstances, xsltApplyTemplates
+could be fooled into deleting text nodes that are still referenced,
+resulting in a use-after-free.
+
+2. The DTD
+
+The DTD was only unlinked, but there's no good reason to do this just
+now. Maybe it was meant as a micro-optimization.
+
+3. Unknown nodes
+
+Useless and dangerous as well, especially with XInclude nodes.
+See https://gitlab.gnome.org/GNOME/libxml2/-/issues/268
+
+Simply stop trying to uselessly delete nodes when applying a template.
+This part of the code is probably a leftover from a time where
+xsltApplyStripSpaces wasn't implemented yet. Also note that
+xsltApplyTemplates with a select expression never tried to delete
+nodes.
+
+Also stop xsltDefaultProcessOneNode from deleting nodes for the same
+reasons.
+
+This fixes CVE-2021-30560.
+
+CVE: CVE-2021-30560
+Upstream-Status: Backport [https://github.com/GNOME/libxslt/commit/50f9c9cd3b7dfe9b3c8c795247752d1fdcadcac8.patch]
+Comment: No change in any hunk
+Signed-off-by: Omkar Patil <Omkar.Patil@kpit.com>
+
+---
+ libxslt/transform.c | 119 +++-----------------------------------------
+ 1 file changed, 7 insertions(+), 112 deletions(-)
+
+diff --git a/libxslt/transform.c b/libxslt/transform.c
+index 04522154..3aba354f 100644
+--- a/libxslt/transform.c
++++ b/libxslt/transform.c
+@@ -1895,7 +1895,7 @@ static void
+ xsltDefaultProcessOneNode(xsltTransformContextPtr ctxt, xmlNodePtr node,
+ 			  xsltStackElemPtr params) {
+     xmlNodePtr copy;
+-    xmlNodePtr delete = NULL, cur;
++    xmlNodePtr cur;
+     int nbchild = 0, oldSize;
+     int childno = 0, oldPos;
+     xsltTemplatePtr template;
+@@ -1968,54 +1968,13 @@ xsltDefaultProcessOneNode(xsltTransformContextPtr ctxt, xmlNodePtr node,
+ 	    return;
+     }
+     /*
+-     * Handling of Elements: first pass, cleanup and counting
++     * Handling of Elements: first pass, counting
+      */
+     cur = node->children;
+     while (cur != NULL) {
+-	switch (cur->type) {
+-	    case XML_TEXT_NODE:
+-	    case XML_CDATA_SECTION_NODE:
+-	    case XML_DOCUMENT_NODE:
+-	    case XML_HTML_DOCUMENT_NODE:
+-	    case XML_ELEMENT_NODE:
+-	    case XML_PI_NODE:
+-	    case XML_COMMENT_NODE:
+-		nbchild++;
+-		break;
+-            case XML_DTD_NODE:
+-		/* Unlink the DTD, it's still reachable using doc->intSubset */
+-		if (cur->next != NULL)
+-		    cur->next->prev = cur->prev;
+-		if (cur->prev != NULL)
+-		    cur->prev->next = cur->next;
+-		break;
+-	    default:
+-#ifdef WITH_XSLT_DEBUG_PROCESS
+-		XSLT_TRACE(ctxt,XSLT_TRACE_PROCESS_NODE,xsltGenericDebug(xsltGenericDebugContext,
+-		 "xsltDefaultProcessOneNode: skipping node type %d\n",
+-		                 cur->type));
+-#endif
+-		delete = cur;
+-	}
++	if (IS_XSLT_REAL_NODE(cur))
++	    nbchild++;
+ 	cur = cur->next;
+-	if (delete != NULL) {
+-#ifdef WITH_XSLT_DEBUG_PROCESS
+-	    XSLT_TRACE(ctxt,XSLT_TRACE_PROCESS_NODE,xsltGenericDebug(xsltGenericDebugContext,
+-		 "xsltDefaultProcessOneNode: removing ignorable blank node\n"));
+-#endif
+-	    xmlUnlinkNode(delete);
+-	    xmlFreeNode(delete);
+-	    delete = NULL;
+-	}
+-    }
+-    if (delete != NULL) {
+-#ifdef WITH_XSLT_DEBUG_PROCESS
+-	XSLT_TRACE(ctxt,XSLT_TRACE_PROCESS_NODE,xsltGenericDebug(xsltGenericDebugContext,
+-	     "xsltDefaultProcessOneNode: removing ignorable blank node\n"));
+-#endif
+-	xmlUnlinkNode(delete);
+-	xmlFreeNode(delete);
+-	delete = NULL;
+     }
+ 
+     /*
+@@ -4864,7 +4823,7 @@ xsltApplyTemplates(xsltTransformContextPtr ctxt, xmlNodePtr node,
+     xsltStylePreCompPtr comp = (xsltStylePreCompPtr) castedComp;
+ #endif
+     int i;
+-    xmlNodePtr cur, delNode = NULL, oldContextNode;
++    xmlNodePtr cur, oldContextNode;
+     xmlNodeSetPtr list = NULL, oldList;
+     xsltStackElemPtr withParams = NULL;
+     int oldXPProximityPosition, oldXPContextSize;
+@@ -4998,73 +4957,9 @@ xsltApplyTemplates(xsltTransformContextPtr ctxt, xmlNodePtr node,
+ 	else
+ 	    cur = NULL;
+ 	while (cur != NULL) {
+-	    switch (cur->type) {
+-		case XML_TEXT_NODE:
+-		    if ((IS_BLANK_NODE(cur)) &&
+-			(cur->parent != NULL) &&
+-			(cur->parent->type == XML_ELEMENT_NODE) &&
+-			(ctxt->style->stripSpaces != NULL)) {
+-			const xmlChar *val;
+-
+-			if (cur->parent->ns != NULL) {
+-			    val = (const xmlChar *)
+-				  xmlHashLookup2(ctxt->style->stripSpaces,
+-						 cur->parent->name,
+-						 cur->parent->ns->href);
+-			    if (val == NULL) {
+-				val = (const xmlChar *)
+-				  xmlHashLookup2(ctxt->style->stripSpaces,
+-						 BAD_CAST "*",
+-						 cur->parent->ns->href);
+-			    }
+-			} else {
+-			    val = (const xmlChar *)
+-				  xmlHashLookup2(ctxt->style->stripSpaces,
+-						 cur->parent->name, NULL);
+-			}
+-			if ((val != NULL) &&
+-			    (xmlStrEqual(val, (xmlChar *) "strip"))) {
+-			    delNode = cur;
+-			    break;
+-			}
+-		    }
+-		    /* Intentional fall-through */
+-		case XML_ELEMENT_NODE:
+-		case XML_DOCUMENT_NODE:
+-		case XML_HTML_DOCUMENT_NODE:
+-		case XML_CDATA_SECTION_NODE:
+-		case XML_PI_NODE:
+-		case XML_COMMENT_NODE:
+-		    xmlXPathNodeSetAddUnique(list, cur);
+-		    break;
+-		case XML_DTD_NODE:
+-		    /* Unlink the DTD, it's still reachable
+-		     * using doc->intSubset */
+-		    if (cur->next != NULL)
+-			cur->next->prev = cur->prev;
+-		    if (cur->prev != NULL)
+-			cur->prev->next = cur->next;
+-		    break;
+-		case XML_NAMESPACE_DECL:
+-		    break;
+-		default:
+-#ifdef WITH_XSLT_DEBUG_PROCESS
+-		    XSLT_TRACE(ctxt,XSLT_TRACE_APPLY_TEMPLATES,xsltGenericDebug(xsltGenericDebugContext,
+-		     "xsltApplyTemplates: skipping cur type %d\n",
+-				     cur->type));
+-#endif
+-		    delNode = cur;
+-	    }
++            if (IS_XSLT_REAL_NODE(cur))
++		xmlXPathNodeSetAddUnique(list, cur);
+ 	    cur = cur->next;
+-	    if (delNode != NULL) {
+-#ifdef WITH_XSLT_DEBUG_PROCESS
+-		XSLT_TRACE(ctxt,XSLT_TRACE_APPLY_TEMPLATES,xsltGenericDebug(xsltGenericDebugContext,
+-		     "xsltApplyTemplates: removing ignorable blank cur\n"));
+-#endif
+-		xmlUnlinkNode(delNode);
+-		xmlFreeNode(delNode);
+-		delNode = NULL;
+-	    }
+ 	}
+     }
+ 
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.34.bb b/meta/recipes-support/libxslt/libxslt_1.1.34.bb
index 63cce6fe06..62afec5755 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.34.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.34.bb
@@ -14,6 +14,7 @@ SECTION = "libs"
 DEPENDS = "libxml2"
 
 SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz \
+           file://CVE-2021-30560.patch \
           "
 
 SRC_URI[md5sum] = "db8765c8d076f1b6caafd9f2542a304a"
-- 
2.17.1


