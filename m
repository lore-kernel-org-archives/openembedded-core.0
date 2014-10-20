Return-Path: <joe@deserted.net>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 58BD060097
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 17:51:23 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id tr6so5268091ieb.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 10:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=wthQK5GxsJdtm3ebejlGDqqay28cJCE50jhm/NL/6nY=;
	b=YhoJKYA614TGtGfoxc6RmLl9VuPljk1T7cBAOWN7IfBpH0P6w/QE/Q8dsitVxC+YBj
	MKSUOZHvAzxc84J3vsz3YKf3l7+XSXmel8nBV7rsA8+lQhEssTfBFhbWdCae/X9tDCPl
	1D5Gz2ATk5JKDZ26df3L8CPjtwkZm66VWeLvrB9Fj06DaFqaFBO9BkspNUuBn4PQ000S
	FmpHZnLox5eqoQouKpm8tTnyFBQDZFUZZiu9uKeMUh6o6EyMlCCfTtjhmdO9oJEa0TKw
	Pi88QRBHltf08yufg3D5FVkRCd0dlnA44C4AlMhcekA64K959LQeaWJNUcvqj0xiwHDZ
	ukRg==
X-Gm-Message-State: ALoCoQnxGJNu1g9LZ1tQ6tolRjCcfYEdGMuDkFl0hhVW6oXGZJAoJgmPQwndwCfb+J1A8wErtgwq
X-Received: by 10.50.70.40 with SMTP id j8mr20397839igu.31.1413827483528;
	Mon, 20 Oct 2014 10:51:23 -0700 (PDT)
Received: from mir.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250])
	by mx.google.com with ESMTPSA id p62sm4817202ioe.33.2014.10.20.10.51.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Oct 2014 10:51:22 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Oct 2014 13:51:21 -0400
Message-Id: <1413827481-11123-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] libxml2: fix CVE-2014-3660
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
X-List-Received-Date: Mon, 20 Oct 2014 17:51:32 -0000

It was discovered that the patch for CVE-2014-0191 for libxml2 is
incomplete.  It is still possible to have libxml2 incorrectly perform
entity substituton even when the application using libxml2 explicitly
disables the feature.  This can allow a remote denial-of-service attack on
systems with libxml2 prior to 2.9.2.

References:
    http://www.openwall.com/lists/oss-security/2014/10/17/7
    https://www.ncsc.nl/actueel/nieuwsberichten/kwetsbaarheid-ontdekt-in-libxml2.html

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
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


