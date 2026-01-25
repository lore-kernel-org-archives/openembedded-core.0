Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C764C2A06F
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 18:42:20 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2016.1769366535391599130
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 10:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=KoFnH+2J;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026012518421312e08c6ebf00020711-4n_ox1@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026012518421312e08c6ebf00020711
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Jan 2026 19:42:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=tTYYp8YJgczWd07UGz733+95FLIkmmXQE8Db/wSvado=;
 b=KoFnH+2JQlLUCmFKbUogKubFPEKZ7pX6TGwwTifbAIWxUZfo9QsEiemqUNkD/u94LNpMop
 yrN4l2dlfBy/i/Dj2CRWSwj8nwOPtB58qJAQVgYHJyfqp7YgHrqVvflUtW6u2OClBFeHj5wn
 aTbIflu/S5649RCBMtZgBYoHo+nS2frlqKbO7N98r0qRILThoo2VTCNeVv9rwxWQZJLDknfV
 J7ewL5OfExvKWXnIlKMOxfKDkNmBSqVG2DuIJbaVPXt/1xsH48e3yxYW7GIsQKcxwgs6DJPj
 sEeO1Jt6uuhBsaFnA/Vaa7H/MY0AUTkDcLjOB2Ec2bAONg0X0u2FU+5A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 1/2] libxml2: patch CVE-2026-0990
Date: Sun, 25 Jan 2026 19:35:18 +0100
Message-Id: <20260125183519.1634980-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 18:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229947

From: Peter Marko <peter.marko@siemens.com>

Pick patch which closed [1].

[1] https://gitlab.gnome.org/GNOME/libxml2/-/issues/1018

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libxml/libxml2/CVE-2026-0990.patch        | 76 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
new file mode 100644
index 0000000000..e0c1e3c707
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
@@ -0,0 +1,76 @@
+From 1961208e958ca22f80a0b4e4c9d71cfa050aa982 Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Wed, 17 Dec 2025 15:24:08 +0100
+Subject: [PATCH] catalog: prevent inf recursion in xmlCatalogXMLResolveURI
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/issues/1018
+
+CVE: CVE-2026-0989
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/1961208e958ca22f80a0b4e4c9d71cfa050aa982]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ catalog.c | 31 +++++++++++++++++++++++--------
+ 1 file changed, 23 insertions(+), 8 deletions(-)
+
+diff --git a/catalog.c b/catalog.c
+index 76c063a8..46b877e6 100644
+--- a/catalog.c
++++ b/catalog.c
+@@ -2099,12 +2099,21 @@ static xmlChar *
+ xmlCatalogListXMLResolveURI(xmlCatalogEntryPtr catal, const xmlChar *URI) {
+     xmlChar *ret = NULL;
+     xmlChar *urnID = NULL;
++    xmlCatalogEntryPtr cur = NULL;
+ 
+     if (catal == NULL)
+         return(NULL);
+     if (URI == NULL)
+ 	return(NULL);
+ 
++    if (catal->depth > MAX_CATAL_DEPTH) {
++	xmlCatalogErr(catal, NULL, XML_CATALOG_RECURSION,
++		      "Detected recursion in catalog %s\n",
++		      catal->name, NULL, NULL);
++	return(NULL);
++    }
++    catal->depth++;
++
+     if (!xmlStrncmp(URI, BAD_CAST XML_URN_PUBID, sizeof(XML_URN_PUBID) - 1)) {
+ 	urnID = xmlCatalogUnWrapURN(URI);
+ 	if (xmlDebugCatalogs) {
+@@ -2118,21 +2127,27 @@ xmlCatalogListXMLResolveURI(xmlCatalogEntryPtr catal, const xmlChar *URI) {
+ 	ret = xmlCatalogListXMLResolve(catal, urnID, NULL);
+ 	if (urnID != NULL)
+ 	    xmlFree(urnID);
++	catal->depth--;
+ 	return(ret);
+     }
+-    while (catal != NULL) {
+-	if (catal->type == XML_CATA_CATALOG) {
+-	    if (catal->children == NULL) {
+-		xmlFetchXMLCatalogFile(catal);
++    cur = catal;
++    while (cur != NULL) {
++	if (cur->type == XML_CATA_CATALOG) {
++	    if (cur->children == NULL) {
++		xmlFetchXMLCatalogFile(cur);
+ 	    }
+-	    if (catal->children != NULL) {
+-		ret = xmlCatalogXMLResolveURI(catal->children, URI);
+-		if (ret != NULL)
++	    if (cur->children != NULL) {
++		ret = xmlCatalogXMLResolveURI(cur->children, URI);
++		if (ret != NULL) {
++		    catal->depth--;
+ 		    return(ret);
++		}
+ 	    }
+ 	}
+-	catal = catal->next;
++	cur = cur->next;
+     }
++
++    catal->depth--;
+     return(ret);
+ }
+ 
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index 05a7dce95b..a72aff6c83 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -44,6 +44,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2025-6170.patch \
            file://CVE-2025-9714.patch \
            file://CVE-2025-7425.patch \
+           file://CVE-2026-0990.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"

