Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE8BE63CBA
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 18:41:50 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2023.1769366502550937978
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 10:41:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=E+KLrpyq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202601251841406195d81d75000207fb-zbvuv3@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202601251841406195d81d75000207fb
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Jan 2026 19:41:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=iL0O17wbc5X0qzA5zr0BRM18St7RVbM9laTJFieBtQo=;
 b=E+KLrpyqHTpyFbEd7fMzIU9BIFYcrf1MrZQtqVQEoCLWKW0NKrtV2nQlZodaCkOrwpVmIq
 AtIHVxTryE/pagNdYXScHmYcr2f6olDboqOkSgbPYXT73CmdhFsFCtvLqU4VIuYRq4dkgb0p
 /ZoqRdVgWLVG6eiPZ09BMYeaT8ZLax0Ln5/U6f8oxN7Ge7b4HzEM7R/wwEOo+fMiEcLMifvl
 yyJJ4OzP79Gp5bBNysQ5euPdt77Ua/O5u2wvlioOYg9LUQyBlaRHZVbiAobRaK8iybcfD5x8
 c/ugbWE7uJ+QM7Kk4eRU/bgW47BDNySf8C8v2mH6ElTA8IjR5yOomVPA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH 3/3] libxml2: patch CVE-2026-0992
Date: Sun, 25 Jan 2026 19:34:38 +0100
Message-Id: <20260125183438.1579158-3-peter.marko@siemens.com>
In-Reply-To: <20260125183438.1579158-1-peter.marko@siemens.com>
References: <20260125183438.1579158-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 18:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229943

From: Peter Marko <peter.marko@siemens.com>

Pick patch which closed [1].

[1] https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libxml/libxml2/CVE-2026-0992.patch        | 49 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.14.6.bb    |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch
new file mode 100644
index 0000000000..ad23498a4c
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch
@@ -0,0 +1,49 @@
+From f75abfcaa419a740a3191e56c60400f3ff18988d Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Fri, 19 Dec 2025 11:02:18 +0100
+Subject: [PATCH] catalog: Ignore repeated nextCatalog entries
+
+This patch makes the catalog parsing to ignore repeated entries of
+nextCatalog with the same value.
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019
+
+CVE: CVE-2026-0992
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/f75abfcaa419a740a3191e56c60400f3ff18988d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ catalog.c | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/catalog.c b/catalog.c
+index 46b877e6..fa6d77ca 100644
+--- a/catalog.c
++++ b/catalog.c
+@@ -1227,9 +1227,27 @@ xmlParseXMLCatalogNode(xmlNodePtr cur, xmlCatalogPrefer prefer,
+ 		BAD_CAST "delegateURI", BAD_CAST "uriStartString",
+ 		BAD_CAST "catalog", prefer, cgroup);
+     } else if (xmlStrEqual(cur->name, BAD_CAST "nextCatalog")) {
++	xmlCatalogEntryPtr prev = parent->children;
++
+ 	entry = xmlParseXMLCatalogOneNode(cur, XML_CATA_NEXT_CATALOG,
+ 		BAD_CAST "nextCatalog", NULL,
+ 		BAD_CAST "catalog", prefer, cgroup);
++	/* Avoid duplication of nextCatalog */
++	while (prev != NULL) {
++	    if ((prev->type == XML_CATA_NEXT_CATALOG) &&
++		(xmlStrEqual (prev->URL, entry->URL)) &&
++		(xmlStrEqual (prev->value, entry->value)) &&
++		(prev->prefer == entry->prefer) &&
++		(prev->group == entry->group)) {
++		    if (xmlDebugCatalogs)
++			xmlCatalogPrintDebug(
++			    "Ignoring repeated nextCatalog %s\n", entry->URL);
++		    xmlFreeCatalogEntry(entry, NULL);
++		    entry = NULL;
++		    break;
++	    }
++	    prev = prev->next;
++	}
+     }
+     if (entry != NULL) {
+         if (parent != NULL) {
diff --git a/meta/recipes-core/libxml/libxml2_2.14.6.bb b/meta/recipes-core/libxml/libxml2_2.14.6.bb
index 7b47f823f9..b881a89a5f 100644
--- a/meta/recipes-core/libxml/libxml2_2.14.6.bb
+++ b/meta/recipes-core/libxml/libxml2_2.14.6.bb
@@ -21,6 +21,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2025-6021.patch \
            file://CVE-2026-0989.patch \
            file://CVE-2026-0990.patch \
+           file://CVE-2026-0992.patch \
            "
 
 SRC_URI[archive.sha256sum] = "7ce458a0affeb83f0b55f1f4f9e0e55735dbfc1a9de124ee86fb4a66b597203a"

