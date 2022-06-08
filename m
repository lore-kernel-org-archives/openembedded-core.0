Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCCFCCA494
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:47:19 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.7345.1654699631869222125
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=w37zaoPW;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id h192so12306334pgc.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=y9eQOrmckH2oUNRgeODfkGJpeh/vknftrhqQqZ3vBw4=;
        b=w37zaoPWTElVftTRBt+6TCe+7eG4zoBzQY6elcdmnqvqu/A/zSQVW6X737xIKvxY8O
         ohRn8ZXUtG7dj/5fgv6fFemykgZsGRV2yzzksBY/L0OjzcmFJLTOXRyloNnP7qANi85c
         vrmRZTS3D/8jJg5ckoR4kcL+DfxulU/S1xNuZ8xAyyKrZvaCpAaBO1Qarc2NVsNTZWqz
         3CXdydUE/VH2QJvp3c2x/za0zHJrtLGUTwbTUDVDzD80EAlUR8iAIkRSGcgSoy5GkUuA
         JxCLFk5PVQ0lRkxphcYmbOoh30uADokFZPDIbcL9rRWBR5psguFB3mOhER2EiOk1Uwn9
         f3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y9eQOrmckH2oUNRgeODfkGJpeh/vknftrhqQqZ3vBw4=;
        b=aWHk1YzukJ665yrA6G2kMN8SkHW6kBJUMrRiM8bkoaaM+55MLTrw4G6U4XCTEAENO+
         OJJvmUbLi6h6f30bfGln+Hb8n0vONf3sOUWpwyIV2KkROT3gacdef1hk6963QCMEpwUj
         NS3gAHthBLE24dQ0zvw+jppMgXL5zE1oEpcmxiBPg1o6hllF3rHVylsGr55XSVpKxTfg
         kZzTlQOxySfV1ruoEFEEZNuERivV4vMqWEaayWakFNFLu3cpR+ofb5Ie5IQJWquF8WeN
         1GzO6uSRbrIzjCfFQMm1u2D1Shjxlnns0NOWyZZufVOzxmcnJMkQFocm2HalGrY86z2L
         Czlw==
X-Gm-Message-State: AOAM531LQPW9dKITfJygN5es3eWUgxpTBrzym+krAqTqZN9OcX/VfHvw
	bQwzUSp4bUJ50g4j7WeCRZRR/PJD2opJPpwk
X-Google-Smtp-Source: 
 ABdhPJzc+enV7MlNeScXD7R43tixHgkoxalKXsKh8F6WPhhgDY4B90uaTrj5FFXMkjK3tzLbu8NdSQ==
X-Received: by 2002:a63:2a0d:0:b0:3ab:392c:f45c with SMTP id
 q13-20020a632a0d000000b003ab392cf45cmr30575303pgq.575.1654699630729;
        Wed, 08 Jun 2022 07:47:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 bg13-20020a17090b0d8d00b001e08461ceaesm16709701pjb.37.2022.06.08.07.47.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:47:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/14] libxslt: Fix CVE-2021-30560
Date: Wed,  8 Jun 2022 04:46:30 -1000
Message-Id: 
 <3e01aa47b85ebeba26443fc3293c341b5ef72817.1654699348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654699348.git.steve@sakoman.com>
References: <cover.1654699348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:47:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166741

From: omkar patil <omkar.patil@kpit.com>

CVE: CVE-2021-30560

Signed-off-by: omkar patil <omkar.patil@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


