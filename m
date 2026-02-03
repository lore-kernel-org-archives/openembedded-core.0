Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFB3E6E7F4
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:19:45 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13492.1770113975965282852
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BKVDZ+QF;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so5724183f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770113974; x=1770718774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVnYBIZkPJEM46n6wdRq2rGL8cCprUD2lhx4NFA8VaQ=;
        b=BKVDZ+QFUWHOJCXf0PzyubQKXnJ3+PzGT91tH9eQknBbdA89j5kdfRiLaPzf3vmhRO
         xc8EgpFQJ4YqtuT033RSB/SW877jddsjkVkcQ9fOhbJYpVLKWG8tb9O1u0oFL3JtosvS
         fGmWpnM2JQppu5mwh60tzn/nC9nauObC5Jx8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113974; x=1770718774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hVnYBIZkPJEM46n6wdRq2rGL8cCprUD2lhx4NFA8VaQ=;
        b=Sqbhc83Im74jtWCo8K/3FNiwokuo+pxK67dhopMWb+ii14LMAN2FKSvvyr+/qycMDa
         plJk7qfot+fjHP5I5Evz/SuXaWWtp3+u5a2MHBepSOC0LxxHGtXWT6DP7NBA1A7rk5GC
         upNP0PH5t0fj1lru3BzhkiSzw6WvARVYe9I9b8iCAd2f4LtcEruXJlYZEWLrLvpS0Bun
         yuANOCXpMW6rL6WhhKnDf6sUcKWyNZAhQncBFAEWiITXPPF4zRaY/SY4C8BTvgtmgPzs
         pkQI5UX8tmTnxxdC11sAlb/hmepDTu3ZyQTWenq8DUKzFdgSmqQOuMpsiLlRVyKkbvJi
         OCow==
X-Gm-Message-State: AOJu0Yz+bAALufDLPNfbvjvVWwYUJF7q6+/XKd4Gl2QCfP8MlCq7bgD0
	bt2Zal8riHNXJQ7a+Ip5WXCSkAVF5hZVKBeZer//9xkgc8NdqzfMsXpABmwKsl1NQCsCXnSraop
	8lTLDVvs=
X-Gm-Gg: AZuq6aKD+gkJ/pqeWdEG3aFpYctFVcPauWGR6rgtztwhze93aDCqqSmIOiaC+56xdG4
	s6PE0nwHfnWHmt/Ik4mcdlhvXMuSevdgpTZoDp/jhJ+Ce4rVmenk7SGQ+DQ5kqDj/Gb8AP9JZ5c
	5RqjKAB0vXWl7xod4Hma1QuWwfy47KABZhOStUyXFvWbgWCuHZPFC5l8VXIAr0pqD0Q2vikMIQa
	wCjyLGzHJBPCOrNXOiKlHV1C+EbCx3+bKr0/biEglWnqjFIJLeBw5waUceDG5Tg2lxEnb3kbK+w
	LH1mFP/HzHZZajrPo8Qmr2QHVbL2A42mRxdDQfK9qYDzPCRMwg4nrdDduXqZXmeRUX5C6t83WjA
	Qyq2VXmCKpHA3UW2Haa8WGJbUVof1viV/xK17Xs31FqZUziNUHNssGaW+v4dnh4Ot6x7y1k7Tyb
	0k1ixKIsiBkgFr68T2NdvUAov/AJ5v9U7jFNUM19oWfg4myKJ4O2moJRjmSuqh+J9l5EFeVp/Pj
	ElmAaQSyQj3MxM=
X-Received: by 2002:a05:6000:400e:b0:435:94f8:e7c6 with SMTP id ffacd0b85a97d-435f3a81d0emr20799180f8f.9.1770113973962;
        Tue, 03 Feb 2026 02:19:33 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm52293041f8f.27.2026.02.03.02.19.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:19:33 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 18/22] libxml2: patch CVE-2026-0990
Date: Tue,  3 Feb 2026 11:16:47 +0100
Message-ID: <3487e56e1817e49217a3deccfd79893bee7852a1.1770109549.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770109549.git.yoann.congal@smile.fr>
References: <cover.1770109549.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230446

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

