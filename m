Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8273D73D5E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 07:54:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3O7sLg1021381
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 00:54:21 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 24 Apr 2015 00:54:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Apr 2015 00:54:11 -0700
Message-ID: <8f42b3da9d8221050a7076377fca4033ffcc2fe3.1429861978.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429861978.git.liezhi.yang@windriver.com>
References: <cover.1429861978.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/12] libxml2: remove libxml2-CVE-2014-3660.patch
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
X-List-Received-Date: Fri, 24 Apr 2015 07:54:23 -0000
Content-Type: text/plain

It is a backport patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../libxml/libxml2/libxml2-CVE-2014-3660.patch     |  147 --------------------
 1 file changed, 147 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-3660.patch

diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-3660.patch b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-3660.patch
deleted file mode 100644
index b9621c9..0000000
--- a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-3660.patch
+++ /dev/null
@@ -1,147 +0,0 @@
-From be2a7edaf289c5da74a4f9ed3a0b6c733e775230 Mon Sep 17 00:00:00 2001
-From: Daniel Veillard <veillard@redhat.com>
-Date: Thu, 16 Oct 2014 13:59:47 +0800
-Subject: Fix for CVE-2014-3660
-
-Issues related to the billion laugh entity expansion which happened to
-escape the initial set of fixes
-
-Upstream-status: Backport
-Reference: https://git.gnome.org/browse/libxml2/commit/?id=be2a7edaf289c5da74a4f9ed3a0b6c733e775230&context=3&ignorews=0&ss=0
-
-Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
-
-diff --git a/parser.c b/parser.c
-index f51e8d2..1d93967 100644
---- a/parser.c
-+++ b/parser.c
-@@ -130,6 +130,29 @@ xmlParserEntityCheck(xmlParserCtxtPtr ctxt, size_t size,
-         return (0);
-     if (ctxt->lastError.code == XML_ERR_ENTITY_LOOP)
-         return (1);
-+
-+    /*
-+     * This may look absurd but is needed to detect
-+     * entities problems
-+     */
-+    if ((ent != NULL) && (ent->etype != XML_INTERNAL_PREDEFINED_ENTITY) &&
-+	(ent->content != NULL) && (ent->checked == 0)) {
-+	unsigned long oldnbent = ctxt->nbentities;
-+	xmlChar *rep;
-+
-+	ent->checked = 1;
-+
-+	rep = xmlStringDecodeEntities(ctxt, ent->content,
-+				  XML_SUBSTITUTE_REF, 0, 0, 0);
-+
-+	ent->checked = (ctxt->nbentities - oldnbent + 1) * 2;
-+	if (rep != NULL) {
-+	    if (xmlStrchr(rep, '<'))
-+		ent->checked |= 1;
-+	    xmlFree(rep);
-+	    rep = NULL;
-+	}
-+    }
-     if (replacement != 0) {
- 	if (replacement < XML_MAX_TEXT_LENGTH)
- 	    return(0);
-@@ -189,9 +212,12 @@ xmlParserEntityCheck(xmlParserCtxtPtr ctxt, size_t size,
-             return (0);
-     } else {
-         /*
--         * strange we got no data for checking just return
-+         * strange we got no data for checking
-          */
--        return (0);
-+	if (((ctxt->lastError.code != XML_ERR_UNDECLARED_ENTITY) &&
-+	     (ctxt->lastError.code != XML_WAR_UNDECLARED_ENTITY)) ||
-+	    (ctxt->nbentities <= 10000))
-+	    return (0);
-     }
-     xmlFatalErr(ctxt, XML_ERR_ENTITY_LOOP, NULL);
-     return (1);
-@@ -2589,6 +2615,7 @@ xmlParserHandlePEReference(xmlParserCtxtPtr ctxt) {
- 				      name, NULL);
- 		    ctxt->valid = 0;
- 		}
-+		xmlParserEntityCheck(ctxt, 0, NULL, 0);
- 	    } else if (ctxt->input->free != deallocblankswrapper) {
- 		    input = xmlNewBlanksWrapperInputStream(ctxt, entity);
- 		    if (xmlPushInput(ctxt, input) < 0)
-@@ -2759,6 +2786,7 @@ xmlStringLenDecodeEntities(xmlParserCtxtPtr ctxt, const xmlChar *str, int len,
- 	    if ((ctxt->lastError.code == XML_ERR_ENTITY_LOOP) ||
- 	        (ctxt->lastError.code == XML_ERR_INTERNAL_ERROR))
- 	        goto int_error;
-+	    xmlParserEntityCheck(ctxt, 0, ent, 0);
- 	    if (ent != NULL)
- 	        ctxt->nbentities += ent->checked / 2;
- 	    if ((ent != NULL) &&
-@@ -2810,6 +2838,7 @@ xmlStringLenDecodeEntities(xmlParserCtxtPtr ctxt, const xmlChar *str, int len,
- 	    ent = xmlParseStringPEReference(ctxt, &str);
- 	    if (ctxt->lastError.code == XML_ERR_ENTITY_LOOP)
- 	        goto int_error;
-+	    xmlParserEntityCheck(ctxt, 0, ent, 0);
- 	    if (ent != NULL)
- 	        ctxt->nbentities += ent->checked / 2;
- 	    if (ent != NULL) {
-@@ -7312,6 +7341,7 @@ xmlParseReference(xmlParserCtxtPtr ctxt) {
- 		   (ret != XML_WAR_UNDECLARED_ENTITY)) {
- 	    xmlFatalErrMsgStr(ctxt, XML_ERR_UNDECLARED_ENTITY,
- 		     "Entity '%s' failed to parse\n", ent->name);
-+	    xmlParserEntityCheck(ctxt, 0, ent, 0);
- 	} else if (list != NULL) {
- 	    xmlFreeNodeList(list);
- 	    list = NULL;
-@@ -7418,7 +7448,7 @@ xmlParseReference(xmlParserCtxtPtr ctxt) {
- 		/*
- 		 * We are copying here, make sure there is no abuse
- 		 */
--		ctxt->sizeentcopy += ent->length;
-+		ctxt->sizeentcopy += ent->length + 5;
- 		if (xmlParserEntityCheck(ctxt, 0, ent, ctxt->sizeentcopy))
- 		    return;
- 
-@@ -7466,7 +7496,7 @@ xmlParseReference(xmlParserCtxtPtr ctxt) {
- 		/*
- 		 * We are copying here, make sure there is no abuse
- 		 */
--		ctxt->sizeentcopy += ent->length;
-+		ctxt->sizeentcopy += ent->length + 5;
- 		if (xmlParserEntityCheck(ctxt, 0, ent, ctxt->sizeentcopy))
- 		    return;
- 
-@@ -7652,6 +7682,7 @@ xmlParseEntityRef(xmlParserCtxtPtr ctxt) {
- 		ctxt->sax->reference(ctxt->userData, name);
- 	    }
- 	}
-+	xmlParserEntityCheck(ctxt, 0, ent, 0);
- 	ctxt->valid = 0;
-     }
- 
-@@ -7845,6 +7876,7 @@ xmlParseStringEntityRef(xmlParserCtxtPtr ctxt, const xmlChar ** str) {
- 			  "Entity '%s' not defined\n",
- 			  name);
- 	}
-+	xmlParserEntityCheck(ctxt, 0, ent, 0);
- 	/* TODO ? check regressions ctxt->valid = 0; */
-     }
- 
-@@ -8004,6 +8036,7 @@ xmlParsePEReference(xmlParserCtxtPtr ctxt)
- 			  name, NULL);
- 	    ctxt->valid = 0;
- 	}
-+	xmlParserEntityCheck(ctxt, 0, NULL, 0);
-     } else {
- 	/*
- 	 * Internal checking in case the entity quest barfed
-@@ -8243,6 +8276,7 @@ xmlParseStringPEReference(xmlParserCtxtPtr ctxt, const xmlChar **str) {
- 			  name, NULL);
- 	    ctxt->valid = 0;
- 	}
-+	xmlParserEntityCheck(ctxt, 0, NULL, 0);
-     } else {
- 	/*
- 	 * Internal checking in case the entity quest barfed
--- 
-cgit v0.10.1
-
-- 
1.7.9.5


