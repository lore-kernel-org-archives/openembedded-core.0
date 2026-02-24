Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 814A3E9B270
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:00 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21456.1771943098159467622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=e7V9M3Ud;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso48933405e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943096; x=1772547896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bf64QealnwzKpf2UA1Wfvd2J2ybR82DT3fEOxtU+JAM=;
        b=e7V9M3UdAlf3GnD/CENDpECbS14mWR3nze9Lu72g86tPaNtzmpzo36Cuz3V9I7rJd6
         ftrWMrBdrMmJ6nbOynZQxJi1TYUkKjnpx6aY3VuZt1Z56L67oXXH4BVFNv6wLrE2mIM2
         fn06IH14sV9zpu4GNMg/gjjOLcUDMM6QMShW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943096; x=1772547896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bf64QealnwzKpf2UA1Wfvd2J2ybR82DT3fEOxtU+JAM=;
        b=ioYnclmSNi2n7iRse4ikiVS7YlKUGGS4Kjz1d2QbvoX7maKn9isI5NJKXCdUA3o94v
         nL9GLqEDqdl1N97hQPsd17powBBPQBQY67bHGrkVsL3eQ8IUqMcZmTrVzwCiuxR9Sf7b
         pYA/8rrSZNUZSlRuu5NnJ6ihEMgvx9SC9VnPxDE065QjLW/8Lfi/mos5SpEKrq/65liU
         HtnQYqSFVpsn7SHJ+mLLYfS+gxKhYwurrLXpD3MCu30+JUj+NQY2DSMLsUd7rR60WbqB
         gc8TLN7XfBSjeJzq9UANjmZs9R2XEXRd3L46vous02ubEWEqCGJWg6CBfGb/XG39qO08
         t1CQ==
X-Gm-Message-State: AOJu0Yz7HkSryukpXuHuDpuPbx3E4iJDKZqwGHsc6Vc5VDaiVaJta2AS
	Vkcjjh1i1gfo7oUFe0iQKl/Fd58tns8VtmnXUOQHxbPST1fKipVhiW6SmJLlaUUth25rRWtSMVM
	I3jWG
X-Gm-Gg: AZuq6aK6EycOJ2dzWBNpa5vWzZ4R4jG7I5XdVCQT8eluaPXJo3HzB1kBDmEk0wVt41J
	YbOMJm1VIavtuLfOCFt6zT3Wo09uJuGUhV1+Nndb37LJmTa5iRXO2DN0VLcuL+u8LVcuqn0O7iq
	i+AbLiJtfU5pkS7iHv/FSPIeQCcAR780JSvXJV/dIGNRwKcDAhLvDQaedDt0gX3ZQAen5r/yPFQ
	k5fKlNKfwyZIbZpszlVfU3kkGhKnJ0KlZMJAG/EOHz7xm5AR26KXtGUEuPNOaML9shf4pdjS4ak
	QOtPuY8OU5MBimV97mVQLt/te3g5nGZXx899RRDMoi+GS/hJg9xrdLQhe/qFSKIK3SClB0nvaYG
	gH/5AbSR9SnjVV5Iire0Jo72GBCmuer6JSr71aotLkaq4Zb0eB2v2l3dYHKgOr1XrXkNHUhVnea
	CeiaeS1IyUM9VkP5HIH6X4iutPEm4eisly4+MVzjPDRTVAINqTQSnHfeE0sIO/ZcjrXMhq6q5/4
	rdktItLBUNSP1xMe6lf6BrGtZgXPAQlCg==
X-Received: by 2002:a05:600c:820a:b0:483:709e:f22d with SMTP id 5b1f17b1804b1-483a96379c1mr213094515e9.27.1771943096250;
        Tue, 24 Feb 2026 06:24:56 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.24.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:24:55 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/38] libxml2: patch CVE-2026-0990
Date: Tue, 24 Feb 2026 15:23:56 +0100
Message-ID: <e56c95db02661de1d7a701f46bc0ecc3b2795dbd.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231770

From: Peter Marko <peter.marko@siemens.com>

Pick patch which closed [1].

[1] https://gitlab.gnome.org/GNOME/libxml2/-/issues/1018

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libxml/libxml2/CVE-2026-0990.patch        | 76 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
new file mode 100644
index 00000000000..e0c1e3c7076
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
index 05a7dce95b4..a72aff6c83d 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -44,6 +44,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2025-6170.patch \
            file://CVE-2025-9714.patch \
            file://CVE-2025-7425.patch \
+           file://CVE-2026-0990.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"

