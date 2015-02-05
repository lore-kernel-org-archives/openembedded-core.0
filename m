Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 89D5471E68
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:04:18 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id bj1so10910744pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=3iMPp8lsbS8u3BC4Z9xJanWPr98P4j0rAyiy2nwz6WA=;
	b=CViT8pOKLlPnGr7zQAHanUH5I3XTa6pWcp3U/rl7pGzrEUbg0srvqCvcXI2ZLAh5e0
	x4gwLKQnmwGhTfCQ/L48vECRe4Hl6NX2vr6bSnBs7tZsvJzp3iSuyzVvlrlhh2PzbhH/
	08NyuCrJASpV2oSUL8/XRrmJGwiM75AaoX2sUdWZ9Sx4q933umQp2uekN1B1cGGFPStT
	hNcFWYCXsiAeX+CiCe77oZqDTgvDq21CFwzJ5GydOomdWwUmjLo5cDgW+945g8pikLzK
	VlN3AuwbqHc8W3iIzYziwAfPfkiChjmyo2e68LkB+7RnfXaN2UwUw7ELVMURjatB2Gsu
	Qrsw==
X-Received: by 10.68.254.1 with SMTP id ae1mr954702pbd.110.1423152259833;
	Thu, 05 Feb 2015 08:04:19 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:04:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:11 -0800
Message-Id: <d61da74e7804db80fe81d0aa1b9c26b16cdd47e8.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Cc: Joe MacDonald <joe_macdonald@mentor.com>
Subject: [PATCH 03/61] libxml2: fix CVE-2014-3660
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
X-List-Received-Date: Thu, 05 Feb 2015 16:04:24 -0000

From: Joe MacDonald <joe_macdonald@mentor.com>

It was discovered that the patch for CVE-2014-0191 for libxml2 is
incomplete.  It is still possible to have libxml2 incorrectly perform
entity substituton even when the application using libxml2 explicitly
disables the feature.  This can allow a remote denial-of-service attack on
systems with libxml2 prior to 2.9.2.

References:
    http://www.openwall.com/lists/oss-security/2014/10/17/7
    https://www.ncsc.nl/actueel/nieuwsberichten/kwetsbaarheid-ontdekt-in-libxml2.html

(From OE-Core rev: 643597a5c432b2e02033d0cefa3ba4da980d078f)

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/libxml/libxml2.inc               |   1 +
 .../libxml/libxml2/libxml2-CVE-2014-3660.patch     | 147 +++++++++++++++++++++
 2 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-3660.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index bcf9a62..c729c19 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -21,6 +21,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml2-CVE-2014-0191-fix.patch \
            file://python-sitepackages-dir.patch \
            file://libxml-m4-use-pkgconfig.patch \
+           file://libxml2-CVE-2014-3660.patch \
           "
 
 BINCONFIG = "${bindir}/xml2-config"
diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-3660.patch b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-3660.patch
new file mode 100644
index 0000000..b9621c9
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-3660.patch
@@ -0,0 +1,147 @@
+From be2a7edaf289c5da74a4f9ed3a0b6c733e775230 Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Thu, 16 Oct 2014 13:59:47 +0800
+Subject: Fix for CVE-2014-3660
+
+Issues related to the billion laugh entity expansion which happened to
+escape the initial set of fixes
+
+Upstream-status: Backport
+Reference: https://git.gnome.org/browse/libxml2/commit/?id=be2a7edaf289c5da74a4f9ed3a0b6c733e775230&context=3&ignorews=0&ss=0
+
+Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+
+diff --git a/parser.c b/parser.c
+index f51e8d2..1d93967 100644
+--- a/parser.c
++++ b/parser.c
+@@ -130,6 +130,29 @@ xmlParserEntityCheck(xmlParserCtxtPtr ctxt, size_t size,
+         return (0);
+     if (ctxt->lastError.code == XML_ERR_ENTITY_LOOP)
+         return (1);
++
++    /*
++     * This may look absurd but is needed to detect
++     * entities problems
++     */
++    if ((ent != NULL) && (ent->etype != XML_INTERNAL_PREDEFINED_ENTITY) &&
++	(ent->content != NULL) && (ent->checked == 0)) {
++	unsigned long oldnbent = ctxt->nbentities;
++	xmlChar *rep;
++
++	ent->checked = 1;
++
++	rep = xmlStringDecodeEntities(ctxt, ent->content,
++				  XML_SUBSTITUTE_REF, 0, 0, 0);
++
++	ent->checked = (ctxt->nbentities - oldnbent + 1) * 2;
++	if (rep != NULL) {
++	    if (xmlStrchr(rep, '<'))
++		ent->checked |= 1;
++	    xmlFree(rep);
++	    rep = NULL;
++	}
++    }
+     if (replacement != 0) {
+ 	if (replacement < XML_MAX_TEXT_LENGTH)
+ 	    return(0);
+@@ -189,9 +212,12 @@ xmlParserEntityCheck(xmlParserCtxtPtr ctxt, size_t size,
+             return (0);
+     } else {
+         /*
+-         * strange we got no data for checking just return
++         * strange we got no data for checking
+          */
+-        return (0);
++	if (((ctxt->lastError.code != XML_ERR_UNDECLARED_ENTITY) &&
++	     (ctxt->lastError.code != XML_WAR_UNDECLARED_ENTITY)) ||
++	    (ctxt->nbentities <= 10000))
++	    return (0);
+     }
+     xmlFatalErr(ctxt, XML_ERR_ENTITY_LOOP, NULL);
+     return (1);
+@@ -2589,6 +2615,7 @@ xmlParserHandlePEReference(xmlParserCtxtPtr ctxt) {
+ 				      name, NULL);
+ 		    ctxt->valid = 0;
+ 		}
++		xmlParserEntityCheck(ctxt, 0, NULL, 0);
+ 	    } else if (ctxt->input->free != deallocblankswrapper) {
+ 		    input = xmlNewBlanksWrapperInputStream(ctxt, entity);
+ 		    if (xmlPushInput(ctxt, input) < 0)
+@@ -2759,6 +2786,7 @@ xmlStringLenDecodeEntities(xmlParserCtxtPtr ctxt, const xmlChar *str, int len,
+ 	    if ((ctxt->lastError.code == XML_ERR_ENTITY_LOOP) ||
+ 	        (ctxt->lastError.code == XML_ERR_INTERNAL_ERROR))
+ 	        goto int_error;
++	    xmlParserEntityCheck(ctxt, 0, ent, 0);
+ 	    if (ent != NULL)
+ 	        ctxt->nbentities += ent->checked / 2;
+ 	    if ((ent != NULL) &&
+@@ -2810,6 +2838,7 @@ xmlStringLenDecodeEntities(xmlParserCtxtPtr ctxt, const xmlChar *str, int len,
+ 	    ent = xmlParseStringPEReference(ctxt, &str);
+ 	    if (ctxt->lastError.code == XML_ERR_ENTITY_LOOP)
+ 	        goto int_error;
++	    xmlParserEntityCheck(ctxt, 0, ent, 0);
+ 	    if (ent != NULL)
+ 	        ctxt->nbentities += ent->checked / 2;
+ 	    if (ent != NULL) {
+@@ -7312,6 +7341,7 @@ xmlParseReference(xmlParserCtxtPtr ctxt) {
+ 		   (ret != XML_WAR_UNDECLARED_ENTITY)) {
+ 	    xmlFatalErrMsgStr(ctxt, XML_ERR_UNDECLARED_ENTITY,
+ 		     "Entity '%s' failed to parse\n", ent->name);
++	    xmlParserEntityCheck(ctxt, 0, ent, 0);
+ 	} else if (list != NULL) {
+ 	    xmlFreeNodeList(list);
+ 	    list = NULL;
+@@ -7418,7 +7448,7 @@ xmlParseReference(xmlParserCtxtPtr ctxt) {
+ 		/*
+ 		 * We are copying here, make sure there is no abuse
+ 		 */
+-		ctxt->sizeentcopy += ent->length;
++		ctxt->sizeentcopy += ent->length + 5;
+ 		if (xmlParserEntityCheck(ctxt, 0, ent, ctxt->sizeentcopy))
+ 		    return;
+ 
+@@ -7466,7 +7496,7 @@ xmlParseReference(xmlParserCtxtPtr ctxt) {
+ 		/*
+ 		 * We are copying here, make sure there is no abuse
+ 		 */
+-		ctxt->sizeentcopy += ent->length;
++		ctxt->sizeentcopy += ent->length + 5;
+ 		if (xmlParserEntityCheck(ctxt, 0, ent, ctxt->sizeentcopy))
+ 		    return;
+ 
+@@ -7652,6 +7682,7 @@ xmlParseEntityRef(xmlParserCtxtPtr ctxt) {
+ 		ctxt->sax->reference(ctxt->userData, name);
+ 	    }
+ 	}
++	xmlParserEntityCheck(ctxt, 0, ent, 0);
+ 	ctxt->valid = 0;
+     }
+ 
+@@ -7845,6 +7876,7 @@ xmlParseStringEntityRef(xmlParserCtxtPtr ctxt, const xmlChar ** str) {
+ 			  "Entity '%s' not defined\n",
+ 			  name);
+ 	}
++	xmlParserEntityCheck(ctxt, 0, ent, 0);
+ 	/* TODO ? check regressions ctxt->valid = 0; */
+     }
+ 
+@@ -8004,6 +8036,7 @@ xmlParsePEReference(xmlParserCtxtPtr ctxt)
+ 			  name, NULL);
+ 	    ctxt->valid = 0;
+ 	}
++	xmlParserEntityCheck(ctxt, 0, NULL, 0);
+     } else {
+ 	/*
+ 	 * Internal checking in case the entity quest barfed
+@@ -8243,6 +8276,7 @@ xmlParseStringPEReference(xmlParserCtxtPtr ctxt, const xmlChar **str) {
+ 			  name, NULL);
+ 	    ctxt->valid = 0;
+ 	}
++	xmlParserEntityCheck(ctxt, 0, NULL, 0);
+     } else {
+ 	/*
+ 	 * Internal checking in case the entity quest barfed
+-- 
+cgit v0.10.1
+
-- 
1.9.1


