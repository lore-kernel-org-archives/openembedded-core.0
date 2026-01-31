Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FD7D79761
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:57:16 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5012.1769846230054765577
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:57:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bCHpdQza;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806fbc6bf3so29283505e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 23:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846228; x=1770451028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVnYBIZkPJEM46n6wdRq2rGL8cCprUD2lhx4NFA8VaQ=;
        b=bCHpdQzaqIEYKhnKnGFBlT+1pOzanBfMwPgq4bGzpjrOZTmUyAIAzeT5r2cMjrWT7J
         crH5VnRQ8MFZlSR5TScv9Mum0KLvKV5aKJvWnPMWQGolZCstrgDyKCRnvWeZtSC1/fCl
         fOcOEdv5lN2tuE5QeRud+nKZFjS9z6IAFFaGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846228; x=1770451028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hVnYBIZkPJEM46n6wdRq2rGL8cCprUD2lhx4NFA8VaQ=;
        b=irdXJqiwTKWSL3Vqc5J9S+08x6HbUKBzaz84nES/6+dR6dX2wHPiowuXhqzh7nHgfW
         5g5GusrI845aEOcnkPTSW1/tDI9wscuJAfgGOiQpzweSJeVFYs0NmBck8n3hB7j7AlCO
         2eIOp/MsLErFEbXBSjYbR2aBzTJNauBnf45MzkS/8pYkA2WEca6m9ea7oYUjPOSOEWT+
         XnYRd4hPe2FJry2yOJadTT1p/Y9+ysYMsyHQpF65vlH1/4OKSjtJeZXAcX/WbSi0VzRX
         cW2sG2CCYdloVLndreWAdPq+36x+Z9aHWLwCrC4/OBQosPkMftGvOptW4JzHmEyA6+Mv
         ld/A==
X-Gm-Message-State: AOJu0Yx4ZrqvnmXkswubSc/KloagabXAfyFTC58kc7Wa0MU9Q9hQlcqW
	qMk3i3Vbco95Bs8FKugQDWbxOjDTGMdnvU4Evj+BTEaJ7/8olDNpagRJDYqe2aJEpUFpBdAvWKF
	Ltyj64N0=
X-Gm-Gg: AZuq6aK5qO05qYniFvFEl4mVCwQ+LO4j4ypijfY9NErSMydW9BYZVq8KkiZ7ZfP6aaG
	5gi+CpViVHSmYLYoiDtqFOqWpTZ6vY5scFfNpNf98rVA17Mh+on2jR/2l9tBOkKUhTwCBTpJzq7
	OiucyG6/yQ65tc4hSKo7RTrvG5eOiTp6xIK708OfL4LacpjMLsw0GdEhOahzXt9GLOHPS97UKx7
	RTxYtP7MbpZVYrYaNC5+mA40aiD4hzOhQhPWaXiySvZw9xhwwVLQ/KU4+kE8uCi5cdCcJptpSpC
	5rfB0JXGE5CCsXa/KszORrolTmirqbh7nCM3QDpCPbdPNKu8D7MYbLubLqF+1XBairK5bOzsd6b
	dLEv0o+ZuWdy1GUXHBlUmcW5A1qsCAC/wGXN/ZKinc4VxgmUtSNlPbKiKDU3ClXZW/8xmsmmE+2
	zInkVofb1rS1eRFSeGX7N2+XwUomCZEKHLlmab72laMI5+CBtc2X2ycm+qwjGNfaxXN8k9AyTpL
	uDqIBwJV+GsvEzw
X-Received: by 2002:a05:600c:64c6:b0:477:5ad9:6df1 with SMTP id 5b1f17b1804b1-482db4593a1mr66102475e9.3.1769846228184;
        Fri, 30 Jan 2026 23:57:08 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fa8b238ae1dd6dd8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fa8b:238a:e1dd:6dd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm258621475e9.14.2026.01.30.23.57.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:57:07 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 20/22] libxml2: patch CVE-2026-0990
Date: Sat, 31 Jan 2026 08:56:31 +0100
Message-ID: <a8684a230cd69dd54f4cf71b0121d36efa70052e.1769845858.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769845858.git.yoann.congal@smile.fr>
References: <cover.1769845858.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 07:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230225

From: Peter Marko <peter.marko@siemens.com>

Pick patch which closed [1].

[1] https://gitlab.gnome.org/GNOME/libxml2/-/issues/1018

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libxml/libxml2/CVE-2026-0990.patch        | 76 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.14.6.bb    |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
new file mode 100644
index 00000000000..62cb8c27541
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
index f214fcd88f6..7b47f823f92 100644
--- a/meta/recipes-core/libxml/libxml2_2.14.6.bb
+++ b/meta/recipes-core/libxml/libxml2_2.14.6.bb
@@ -20,6 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
            file://CVE-2025-6021.patch \
            file://CVE-2026-0989.patch \
+           file://CVE-2026-0990.patch \
            "
 
 SRC_URI[archive.sha256sum] = "7ce458a0affeb83f0b55f1f4f9e0e55735dbfc1a9de124ee86fb4a66b597203a"

