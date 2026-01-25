Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB3AE63CBE
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 18:42:10 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2010.1769366526995287693
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 10:42:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Cdq7ttAr;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202601251842076798c69bca0002079a-drjkqg@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202601251842076798c69bca0002079a
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Jan 2026 19:42:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=zZa0oLQifHd8q8yucSIxNpIzFVIl5CxsyQucm1dDVkM=;
 b=Cdq7ttArQrKADJgMVkIykkrmkAgBb267HFqiH12MxRVZl2HbqkzLV96tAX8Xrvqkz3ruuC
 n9B5PMbilHltZFTg9OLuKh1n1xi8fdEM9xDDPFUyjH/Tw+BB7arYathnKMsckWSHHfVWspJE
 iX3zcCpaSLdkPeQmzoyqJTcKTf6ms7RP/7MqxdaDknv8lHHUuHE4JczG8ozSRR2Xfmiiw4vE
 7Sz51h1pTNL/INnyHlr+IRGxgyljPqPNZwSn1NtQ31DrgHEja3l5xk67os6DPtkQ3xPA205M
 Jx/CaOKY6VeG7kvgNjxekCZ/P5yd+dU9bAWj2KtvaLmVRbu9W0XGO8RA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 3/3] libxml2: patch CVE-2026-0992
Date: Sun, 25 Jan 2026 19:35:06 +0100
Message-Id: <20260125183506.1621113-3-peter.marko@siemens.com>
In-Reply-To: <20260125183506.1621113-1-peter.marko@siemens.com>
References: <20260125183506.1621113-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 18:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229946

From: Peter Marko <peter.marko@siemens.com>

Pick patch which closed [1].
Adapt for missing xmlCatalogPrintDebug per [2].

[1] https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019
[2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/728869809eb7eee1b1681d558b4b506a8019c151

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libxml/libxml2/CVE-2026-0992.patch        | 49 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch
new file mode 100644
index 00000000000..b335dafb634
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
+@@ -1266,9 +1266,27 @@ xmlParseXMLCatalogNode(xmlNodePtr cur, xmlCatalogPrefer prefer,
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
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 6a03fc3f6c7..fa081c2382f 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -27,6 +27,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2025-7425.patch \
            file://CVE-2026-0989.patch \
            file://CVE-2026-0990.patch \
+           file://CVE-2026-0992.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"

