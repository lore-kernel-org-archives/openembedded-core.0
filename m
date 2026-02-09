Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231DEE7E0A7
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:37 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44203.1770629369888015695
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vQir1hGF;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4359249bbacso2883369f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629368; x=1771234168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvsAmmJk1nn5Q54y5wapzWLcJe+YbcG6W+S8D5b5P2E=;
        b=vQir1hGF8GmPxrIqUuIiGHR+oxaHqsBkoLExnOP/60y5U1t0/KRIBpCgLhnN+FbCEq
         ujAAP2UxfwB8+qvP/r5UmnI3N6CTBZangUDDhdERBHRacrcMeOGcizsW+WFAThEsFEHB
         YnO3+ytDrKsHvOql+EMnR85i36AM7fnVRqYtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629368; x=1771234168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EvsAmmJk1nn5Q54y5wapzWLcJe+YbcG6W+S8D5b5P2E=;
        b=Vb0cr0LVAkpHmIMuAqU6vOUo9aXlWRmdBPz5ETyGAjcS1NsSi5JfWfBtkjtzcSaIoQ
         WK8kzmVZ7yQAsB7giwmUYW2cadfa7XBn9ju/fhkpARDWcOG+n/skfZNHbOxXdQX1q6nv
         1dx2JaEOBqR0bfN2Y+JXdiaIJDW2gMkpitTL9p7tOUGuuZR2fJAiEWrwF9JdVV4OGv5O
         uYDFpmVGorjo9e3y5WOlRiF9EKHAyiBTYRq2yzGV/6DEWMgbastNGBOhYGEDQHPBtc2Y
         E2fTihw1xPNjex69Oxt5deX32fPcm1Irv1zJrL3iaogC/ZCdCLnM8ZHcz6vPsz1bc6Hd
         H9xg==
X-Gm-Message-State: AOJu0YwxNNoWgNtnJXNL6s692ul31u/+r36Tz6KIoCURyMWD08ZrHQbb
	xUQMdtjoV44osvS2Br7AEtdTBZgT/EYV/YvgsB646IFQV+KmLT9dhR8eTU/VtVmfFxR0gN57dW0
	WPtfewFM=
X-Gm-Gg: AZuq6aI6JgxmooKhPWhqOVpUasQvX58QJjtKzadL9X6dSZUEGULSnjpyFjW+uhzSlwY
	RIi1rcUDMBUw/CM/8WTi0TSpwEr6dfrL9sFMOimOxQL8zLMIWfO0N3eoaCDaLY6aBbLxQJvW3N9
	FKdhbH2g0h7MMUU/tke27slVS5ar2a+xoZdwjpyHYOFtZku8a1G9YTzww9BMRXDhngsqWGBUMlF
	ibzwEEug7XlWIK7x4GV6A1UccDhUM38W+6K1JDb5vGvlqCubCBIssiQX/pPxyvIFnrbozSUF7bQ
	9ybcaU9+aBou+ZFKFecXN83xi4jDcQoJ5orKW2aqKqxCZGhPJJQPB+IpQnGIjp2kXChXkYPbt8o
	TVLSAHsMG5XpNNTCnbgZfYhN0BWvMAauWW1f7PDr1J1zIkGuCUvIwjXL0prC+EUb0cgp+hQxAIJ
	sELz24SdGZTcjAAFVrVNRzqgNM7Bi74btvx0cXmgwC26jQ4NM2mVegcB/G8PdkNBI6l/eZiOvQd
	5ONWRu9lfCRCKyqdZbrLoZbsA==
X-Received: by 2002:a05:6000:2510:b0:437:722d:5c66 with SMTP id ffacd0b85a97d-437722d5d26mr2079417f8f.16.1770629367821;
        Mon, 09 Feb 2026 01:29:27 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:27 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/25] libxml2: patch CVE-2026-0992
Date: Mon,  9 Feb 2026 10:28:55 +0100
Message-ID: <412eea0b1c9f39ad0079e80b152ac774af8a1164.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230763

From: Peter Marko <peter.marko@siemens.com>

Pick patch which closed [1].
Adapt for missing xmlCatalogPrintDebug per [2].

[1] https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019
[2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/728869809eb7eee1b1681d558b4b506a8019c151

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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

