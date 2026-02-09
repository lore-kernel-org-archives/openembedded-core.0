Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 303BBE7E0A9
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:37 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43989.1770629369195041592
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PdkwZu+f;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4805ef35864so35360775e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629367; x=1771234167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHAB0U7nmEbE12e77TcEGpVsofOnN3eJDYEXd5JEs8A=;
        b=PdkwZu+fNrgPQHtWZ3ZIhicakBVO04QSLGgSqyRj5KYUJJ8SKRQCltBHy4IEEolx2y
         cH4rBBW6oiJIGag954ZAhl5hcDZAWtTFgrAGYvtOJRjIawGwEQ9huDwK4rYngSRiFmok
         2ktyvPKFsept6tp+9qzAlcFBZ4aiHZ3bCxuZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629367; x=1771234167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uHAB0U7nmEbE12e77TcEGpVsofOnN3eJDYEXd5JEs8A=;
        b=AiSHNyKvXoc1szLpS81dqneE3yYIGJOTKXfPTYi8ircW+uuFVYOmjyFdvyfwAeyANF
         npdh4RgsRN3HTAluPu1iCz9m+ohFEsiGUn/CQvdwdN++VHq+K8k68ARdmUgP5sHbhTQR
         iSwQ+TLQmM9bljO0adwFqCoQEt3muY5Ah5R2RuAieRCXneBAVhxpreHlthSD8Vp6LU/V
         xU+6+pbYj5hTv9WVF+l8XWpoW598s7nXmbjEFqXMmmJVhuOUQsjDj/p64J5y/9ypGVCc
         qLFMqWUx6NfFmxswckpZKzbRsGq7pGGa7EbRx+2bsAldBc3mSpnhqejBo/zpfucTjl5q
         Jr3Q==
X-Gm-Message-State: AOJu0Yztxx/xuP/HiMOsTq57apok2/zbK8q0QLwXNdwTAw0LGKUxt02M
	gft/Ep0I1h2l14rQi86lk3oh5BrvxmJXXH/pzFpxAxDmXzsTE8wf6lxkGzM1ujmaY5yyS+9zHd7
	INQVAudM=
X-Gm-Gg: AZuq6aI9sO+cXSB+AQ7S8vqzl8MbN7Pv97TDpO0LpEWRk6kU+6txMeCaqCi0g9oFYGO
	QjHtsppDEh8A8xq+xyPl8OkUgoaFK4GxHrc/UsoXfDu20DTvVpi9ENHFQbQhn8wjfkNJB2W14b+
	4gna/BlHOS82DhE235YegS0cgP8w9eXDj1nyCiOnyKzPn4v7P3lUsYjNOobUguReWvnH2Kdp3rZ
	z06/MOFiZFHeyNgzkxA+oleIzw0OM681BBxeQ7anXFqcMuLu3NE9N5/c7SIu5fiboD42hkPH3gz
	SXoejakW9Um0i4eWFJZODsQlBiauLjwWoQLp+ZOtKDh5pz7hltg2lSbqdHgVYr6dVenyL+kYguo
	qqUTb1bCDoPgZdC4XKA5tH9qNn+4te6V6UZKRLr0z5mGBIZ0JzvRlbhqvnAWukP3LzFalg5ENtZ
	vSW3nsb/KKZSpx0Gk5fi5voUiYpKjSnDPwJeQGIlxSuX80ZMXfhis7oWkzph8f8zYihz9fidM/w
	SaPdmqG/HaRwMo=
X-Received: by 2002:a05:600c:81ca:b0:480:68ed:1e70 with SMTP id 5b1f17b1804b1-483202282c4mr177657755e9.35.1770629367294;
        Mon, 09 Feb 2026 01:29:27 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:26 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/25] libxml2: patch CVE-2026-0990
Date: Mon,  9 Feb 2026 10:28:54 +0100
Message-ID: <a81f3465b1b1e0fdef814ce90e081cf349de8793.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230762

From: Peter Marko <peter.marko@siemens.com>

Pick patch which closed [1].

[1] https://gitlab.gnome.org/GNOME/libxml2/-/issues/1018

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libxml/libxml2/CVE-2026-0990.patch        | 76 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
new file mode 100644
index 00000000000..d001da19bcc
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
+@@ -2086,12 +2086,21 @@ static xmlChar *
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
+@@ -2105,21 +2114,27 @@ xmlCatalogListXMLResolveURI(xmlCatalogEntryPtr catal, const xmlChar *URI) {
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
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 396be51d994..6a03fc3f6c7 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -26,6 +26,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2025-6170.patch \
            file://CVE-2025-7425.patch \
            file://CVE-2026-0989.patch \
+           file://CVE-2026-0990.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"

