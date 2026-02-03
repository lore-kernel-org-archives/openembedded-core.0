Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DC3E6E7F6
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:19:45 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13493.1770113976652581541
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oLz68MyO;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fed090e5fso4273345f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770113975; x=1770718775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERCEMi7jVEXM8otKid1rPym/74NUc/w8YNyPC5Xp4tM=;
        b=oLz68MyOqIe9uZDIw9vq7p06mfJs1tqDsjOEoR73U8qLYW1z6cgW5gfH2SfiogW81s
         gnP6KnXXcxZoJut/mAgL/A8ym+XbXtZS4cmnsnWEYzGiow4NiNCTGU64YbvpmV7eKyJA
         1XjbnbUxMZSZGFHtk05rp4Ttf3eY8npnv3Z6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113975; x=1770718775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ERCEMi7jVEXM8otKid1rPym/74NUc/w8YNyPC5Xp4tM=;
        b=s4LO+G/U8K7XAldZo1xlxB31kw+CQHALMFLklP5G+0bJ1NIVjF1rwMOqjMhsmbZ6Hp
         bpeaQ4jkdnrI7Xd6MJ+hasOPEdsd5VJaZ3wsi0vf8S7rgofadSrioDsHjKW99aAHmbh5
         /43+2RiBARMzssVj2cYQveT9nwKU9polKarhmCgYY8UMLLYAS7ACcDvGsSVF5VN1yS0/
         KgCAg+xRQ86bioItmF7pt74GU94pJLT/ZSecXKbEwWbVEPZtwOJgQyPd1htBHxSUOyxE
         oAr06zLECzBU6hVuUKPELE2mmg10CJVUeTwKUOpH9vHtdAjEeNC1wqeAoABGnWeKcow/
         0H1g==
X-Gm-Message-State: AOJu0YxONyNJsCD82tv3DDw6rjVR1uqEampkR/mVRA3QCYKbc5mT9AAc
	kymiscAedXqdoKWiEpct/kNPJkzx/auoxlhz+su1bZBF1lVR6axnZIAuiLpdWvN7IZsSfb0oxO6
	+2ZgJpFc=
X-Gm-Gg: AZuq6aLuH7wGlWBU/+RHz/E3Xx8plO7OUHfPnLgIJapTRYxNj8xRaeExtUrVDcEUmA5
	QglczRZVXgNywVRB4CRfu8No+tTiMMaFe+g0xTa9CsEQXcxqr04JeKh5/Kp2S3zhcBw9WNO2hWq
	QEpy4tRnd2FnumiHEkGf9h/hdMelkToWXZqERIDcRCOOJ7VXn0ZGB1rxv7yphvbP5icXOITdlKP
	UKH2WtT/hPPjyUYONyZo84kg2I8jVYBRW7sGBgXsfntsMcfOgOOXojMambaS4tqBOfxwdqxLDKl
	11WxBbeHYsYk3itfgFad8TiLNnWfWhRmjTNBL4ShLULOwdz5kxO/hKaFtKxUAUFWrzWwZh0201L
	YEPOtp3uGvnGEXHQnCGrUOIgLDt9vmqWNFTm2jq9M95R3fG4rZUQxq5I25N+DJ24AzhWwC6iAR2
	HPwvaPtQYyAED/nMtVMhFFGmtXBQTgLXZxTTUfIzWlyRJzAI5a2+bl0Ndo4DdDcCc3QyFEc61Mw
	pHqoRenSqXBmu4=
X-Received: by 2002:a5d:5f88:0:b0:431:266:d13a with SMTP id ffacd0b85a97d-435f3abb4f1mr20857382f8f.48.1770113974597;
        Tue, 03 Feb 2026 02:19:34 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm52293041f8f.27.2026.02.03.02.19.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:19:34 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 19/22] libxml2: patch CVE-2026-0992
Date: Tue,  3 Feb 2026 11:16:48 +0100
Message-ID: <e856b69947104cbf6e778c055e746b82f2961870.1770109549.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770109549.git.yoann.congal@smile.fr>
References: <cover.1770109549.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230447

From: Peter Marko <peter.marko@siemens.com>

Pick patch which closed [1].

[1] https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libxml/libxml2/CVE-2026-0992.patch        | 49 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.14.6.bb    |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch
new file mode 100644
index 00000000000..ad23498a4c0
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
index 7b47f823f92..b881a89a5ff 100644
--- a/meta/recipes-core/libxml/libxml2_2.14.6.bb
+++ b/meta/recipes-core/libxml/libxml2_2.14.6.bb
@@ -21,6 +21,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2025-6021.patch \
            file://CVE-2026-0989.patch \
            file://CVE-2026-0990.patch \
+           file://CVE-2026-0992.patch \
            "
 
 SRC_URI[archive.sha256sum] = "7ce458a0affeb83f0b55f1f4f9e0e55735dbfc1a9de124ee86fb4a66b597203a"

