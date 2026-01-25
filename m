Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C72DE63CBF
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 18:42:20 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2016.1769366535391599130
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 10:42:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=LcNTy0EY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026012518421679d5c410b400020735-p9m3wj@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026012518421679d5c410b400020735
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Jan 2026 19:42:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=FmI3IwXFevM4sOehAJOlqZl/zlwHlnZy/sNeJ71TUAs=;
 b=LcNTy0EYLC1jrl/MJPoPj3ykpZRwIg6DVWHNOB3xeDdwpBqj4xlBrNipJjStQkyM/PypHa
 hVjusIuaDKq+QZ6iSsqZtxADm1/YSFu2Vl7PWA/g//oKLudnWcng/GnIuAEZOmLM9In879JX
 iW7YyQwxSCr8ollmYZheY8h7hh6ZwzU7JiBEa2HMOrj12ur9qhGEkt2xVFNl5SxZ5gxPVxyx
 0AwMh8pjsfsMzhk9whNcYupQCjQHi93Ra/YIn5vkNPum6lMcqriXKLwnaBx+6QXBLxwovTJY
 AHg9aLP0YaOY2STZTVY0U5/XcUc4dyNPAKY1r/IvsOdvy2DPGrOW5D0w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 2/2] libxml2: patch CVE-2026-0992
Date: Sun, 25 Jan 2026 19:35:19 +0100
Message-Id: <20260125183519.1634980-2-peter.marko@siemens.com>
In-Reply-To: <20260125183519.1634980-1-peter.marko@siemens.com>
References: <20260125183519.1634980-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 18:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229948

From: Peter Marko <peter.marko@siemens.com>

Pick patch which closed [1].
Adapt for missing xmlCatalogPrintDebug per [2].

[1] https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019
[2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/728869809eb7eee1b1681d558b4b506a8019c151

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libxml/libxml2/CVE-2026-0992.patch        | 49 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch
new file mode 100644
index 0000000000..d7c0b47b33
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
+CVE: CVE-2026-0989
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
+@@ -1279,9 +1279,27 @@ xmlParseXMLCatalogNode(xmlNodePtr cur, xmlCatalogPrefer prefer,
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
++			fprintf(stderr,
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
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index a72aff6c83..bf3099c1f4 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -45,6 +45,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2025-9714.patch \
            file://CVE-2025-7425.patch \
            file://CVE-2026-0990.patch \
+           file://CVE-2026-0992.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"

