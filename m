Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D99DE63CB9
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 18:41:40 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2017.1769366494819548114
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 10:41:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=AjjcPS9J;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2026012518413652fcf1bb9600020714-huk9a6@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026012518413652fcf1bb9600020714
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Jan 2026 19:41:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=o527aouMrLPqFWzYmNnwsCI530zodcuRBeEU95P1r5w=;
 b=AjjcPS9Jo57Y0hGcxE+P4WrPZ8iuo5A7vFpKCWaxyJAPREClGAECWSIVEYpSwQTqKXRw41
 RT8pZpltaPXUOwTtD3Ri6vuCY6gtTJvD0Qd8nBNr3nFf7k4+kaFtRKKQv7DajESVebP3D/4B
 t+dWt5FcrIGJ1+Uyh8po+UGG9zkASiwHYxXqWkS3P0NB35YcwXBSSjhDurYyERhRVyiOHuCQ
 drwWdhz4FjumIoxhorZ5D+iJ2Q+1gLpW3t6Rc6WdOnBzgYagvakd2DaLqxzYtSd5ESGLtLbx
 g6jU/7i5yAVT+iQEkesvHw7qZb6hrVn4rXaY+7D1jMphXtL8yzZTw86g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH 2/3] libxml2: patch CVE-2026-0990
Date: Sun, 25 Jan 2026 19:34:37 +0100
Message-Id: <20260125183438.1579158-2-peter.marko@siemens.com>
In-Reply-To: <20260125183438.1579158-1-peter.marko@siemens.com>
References: <20260125183438.1579158-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 18:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229942

From: Peter Marko <peter.marko@siemens.com>

Pick patch which closed [1].

[1] https://gitlab.gnome.org/GNOME/libxml2/-/issues/1018

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libxml/libxml2/CVE-2026-0990.patch        | 76 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.14.6.bb    |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
new file mode 100644
index 0000000000..62cb8c2754
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
+CVE: CVE-2026-0990
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
+@@ -2047,12 +2047,21 @@ static xmlChar *
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
+@@ -2066,21 +2075,27 @@ xmlCatalogListXMLResolveURI(xmlCatalogEntryPtr catal, const xmlChar *URI) {
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
diff --git a/meta/recipes-core/libxml/libxml2_2.14.6.bb b/meta/recipes-core/libxml/libxml2_2.14.6.bb
index f214fcd88f..7b47f823f9 100644
--- a/meta/recipes-core/libxml/libxml2_2.14.6.bb
+++ b/meta/recipes-core/libxml/libxml2_2.14.6.bb
@@ -20,6 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
            file://CVE-2025-6021.patch \
            file://CVE-2026-0989.patch \
+           file://CVE-2026-0990.patch \
            "
 
 SRC_URI[archive.sha256sum] = "7ce458a0affeb83f0b55f1f4f9e0e55735dbfc1a9de124ee86fb4a66b597203a"

