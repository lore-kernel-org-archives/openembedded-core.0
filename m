Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0946FC47DB1
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 02:51:52 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.2805.1705546310074804427
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 18:51:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0Rs1pZBo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d6efee006bso2181025ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 18:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705546309; x=1706151109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oi35tItYA22Zc2izT4CR28BeEBr4mbbd1nJsfzDn7WM=;
        b=0Rs1pZBoTnoQcuyZglm8cg0A+PS+Z2ON9/S1wOUWsmcwnRsPd4oqVzvwH2XoFsrJnK
         /12utfLldtB6gAPx5KJdPBbyEq1YiHzXDySvtonfX3Sw90xAQbdTySxvFKYGw1u56Y4W
         GnignmlA0Q5YGJ07mlhqMdvy41WLFvq4zVh0VDcO6ZIvW9iWp75rwqkFIVGId9fjZanF
         ezZggKc1y9V1GAPLH2cuV2kN32SbkRXGDjAcQZinB0V7y+LZEp+XCLg4VVinx/O7aDV/
         GI4SZcG4xQQDC4avTaoIxV0TI6QBmiJmFjc370NQIyvT3pxwPKkmMI/vQcgAzuQQAj9c
         F6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705546309; x=1706151109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oi35tItYA22Zc2izT4CR28BeEBr4mbbd1nJsfzDn7WM=;
        b=W3Gtc06K8eTASOnM8giABgdPfMsqUPUV/karvuOEe9R/1uA/PUIqOcG7GF3PvVVJjI
         B21s2mqIGgwXoNKTUqshTEws5buzu2fjJajp5W4PVpmvfN+ONTSsdqjz3ocK4YKsdYl3
         B+SOpsaxVY1sFiUibbcNbRUChyQTAf2zWguzUQJjcPrTXxsUWa+vvxzWKktIN0Iaz7SX
         ehT/q6ZvZ/zyYjP81PBT32L00rrjT6d4Rd/HUhLPYBR223/d+dmFsRag7ivFROoVmkq/
         YQa68X5agn+9X2XRruco4ZL1xLspZkKHwn+bGAGm5rTnSy9UNUP6EwbeiwLdlUnWmMsA
         bjYQ==
X-Gm-Message-State: AOJu0YxEzRKRSENhtE8SBZGsWPPbQD9JL+3VkAqW9q/7wuJBtfMrUyhb
	fCDg35RfH48I4BCWLow2LmwaxDZoE+5KVAdFvgkOJGV7KHuY1zjLEUo/chAqP5VjB/qPABGXOFg
	eKFw=
X-Google-Smtp-Source: AGHT+IF+Wr+Te7XN0W4tu09eaIarAaI8vg26d7NuBkg8FQQztsdY0R5tKgoZ8CIx8HHE4opUlbJ79A==
X-Received: by 2002:a17:90a:eb06:b0:290:21d7:aecb with SMTP id j6-20020a17090aeb0600b0029021d7aecbmr264044pjz.35.1705546308709;
        Wed, 17 Jan 2024 18:51:48 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id qb2-20020a17090b280200b0028dd956835bsm441844pjb.2.2024.01.17.18.51.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 18:51:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/6] libxml2: Fix for CVE-2023-45322
Date: Wed, 17 Jan 2024 16:51:35 -1000
Message-Id: <03b766e42beb42a2085285308acbcf941f346b06.1705546122.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705546122.git.steve@sakoman.com>
References: <cover.1705546122.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 02:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193958

From: Vijay Anusuri <vanusuri@mvista.com>

Backport patch for gitlab issue mentioned in NVD CVE report.
* https://gitlab.gnome.org/GNOME/libxml2/-/issues/583
Backport also one of 14 patches for older issue with similar errors
to have clean cherry-pick without patch fuzz.
* https://gitlab.gnome.org/GNOME/libxml2/-/issues/344

The CVE is disputed because the maintainer does not think that
errors after memory allocation failures are not critical enough
to warrant a CVE ID.
This patch will formally fix reported error case, trying to backport
another 13 patches and resolve conflicts would be probably overkill
due to disputed state.
This CVE was ignored on master branch (as diputed).

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2023-45322-1.patch     | 50 ++++++++++++
 .../libxml/libxml2/CVE-2023-45322-2.patch     | 80 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  2 +
 3 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-45322-1.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-45322-2.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2023-45322-1.patch b/meta/recipes-core/libxml/libxml2/CVE-2023-45322-1.patch
new file mode 100644
index 0000000000..182bb29abd
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2023-45322-1.patch
@@ -0,0 +1,50 @@
+From a22bd982bf10291deea8ba0c61bf75b898c604ce Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Wed, 2 Nov 2022 15:44:42 +0100
+Subject: [PATCH] malloc-fail: Fix memory leak in xmlStaticCopyNodeList
+
+Found with libFuzzer, see #344.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/a22bd982bf10291deea8ba0c61bf75b898c604ce]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ tree.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/tree.c b/tree.c
+index 507869efe..647288ce3 100644
+--- a/tree.c
++++ b/tree.c
+@@ -4461,7 +4461,7 @@ xmlStaticCopyNodeList(xmlNodePtr node, xmlDocPtr doc, xmlNodePtr parent) {
+ 	    }
+ 	    if (doc->intSubset == NULL) {
+ 		q = (xmlNodePtr) xmlCopyDtd( (xmlDtdPtr) node );
+-		if (q == NULL) return(NULL);
++		if (q == NULL) goto error;
+ 		q->doc = doc;
+ 		q->parent = parent;
+ 		doc->intSubset = (xmlDtdPtr) q;
+@@ -4473,7 +4473,7 @@ xmlStaticCopyNodeList(xmlNodePtr node, xmlDocPtr doc, xmlNodePtr parent) {
+ 	} else
+ #endif /* LIBXML_TREE_ENABLED */
+ 	    q = xmlStaticCopyNode(node, doc, parent, 1);
+-	if (q == NULL) return(NULL);
++	if (q == NULL) goto error;
+ 	if (ret == NULL) {
+ 	    q->prev = NULL;
+ 	    ret = p = q;
+@@ -4486,6 +4486,9 @@ xmlStaticCopyNodeList(xmlNodePtr node, xmlDocPtr doc, xmlNodePtr parent) {
+ 	node = node->next;
+     }
+     return(ret);
++error:
++    xmlFreeNodeList(ret);
++    return(NULL);
+ }
+ 
+ /**
+-- 
+GitLab
+
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2023-45322-2.patch b/meta/recipes-core/libxml/libxml2/CVE-2023-45322-2.patch
new file mode 100644
index 0000000000..c7e9681e6a
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2023-45322-2.patch
@@ -0,0 +1,80 @@
+From d39f78069dff496ec865c73aa44d7110e429bce9 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Wed, 23 Aug 2023 20:24:24 +0200
+Subject: [PATCH] tree: Fix copying of DTDs
+
+- Don't create multiple DTD nodes.
+- Fix UAF if malloc fails.
+- Skip DTD nodes if tree module is disabled.
+
+Fixes #583.
+
+CVE: CVE-2023-45322
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/d39f78069dff496ec865c73aa44d7110e429bce9]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ tree.c | 31 ++++++++++++++++---------------
+ 1 file changed, 16 insertions(+), 15 deletions(-)
+
+diff --git a/tree.c b/tree.c
+index 6c8a875b9..02c1b5791 100644
+--- a/tree.c
++++ b/tree.c
+@@ -4471,29 +4471,28 @@ xmlNodePtr
+ xmlStaticCopyNodeList(xmlNodePtr node, xmlDocPtr doc, xmlNodePtr parent) {
+     xmlNodePtr ret = NULL;
+     xmlNodePtr p = NULL,q;
++    xmlDtdPtr newSubset = NULL;
+ 
+     while (node != NULL) {
+-#ifdef LIBXML_TREE_ENABLED
+ 	if (node->type == XML_DTD_NODE ) {
+-	    if (doc == NULL) {
++#ifdef LIBXML_TREE_ENABLED
++	    if ((doc == NULL) || (doc->intSubset != NULL)) {
+ 		node = node->next;
+ 		continue;
+ 	    }
+-	    if (doc->intSubset == NULL) {
+-		q = (xmlNodePtr) xmlCopyDtd( (xmlDtdPtr) node );
+-		if (q == NULL) goto error;
+-		q->doc = doc;
+-		q->parent = parent;
+-		doc->intSubset = (xmlDtdPtr) q;
+-		xmlAddChild(parent, q);
+-	    } else {
+-		q = (xmlNodePtr) doc->intSubset;
+-		xmlAddChild(parent, q);
+-	    }
+-	} else
++            q = (xmlNodePtr) xmlCopyDtd( (xmlDtdPtr) node );
++            if (q == NULL) goto error;
++            q->doc = doc;
++            q->parent = parent;
++            newSubset = (xmlDtdPtr) q;
++#else
++            node = node->next;
++            continue;
+ #endif /* LIBXML_TREE_ENABLED */
++	} else {
+ 	    q = xmlStaticCopyNode(node, doc, parent, 1);
+-	if (q == NULL) goto error;
++	    if (q == NULL) goto error;
++        }
+ 	if (ret == NULL) {
+ 	    q->prev = NULL;
+ 	    ret = p = q;
+@@ -4505,6 +4504,8 @@ xmlStaticCopyNodeList(xmlNodePtr node, xmlDocPtr doc, xmlNodePtr parent) {
+ 	}
+ 	node = node->next;
+     }
++    if (newSubset != NULL)
++        doc->intSubset = newSubset;
+     return(ret);
+ error:
+     xmlFreeNodeList(ret);
+-- 
+GitLab
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index aa17cd8cca..90d30f1ea7 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -42,6 +42,8 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            file://CVE-2023-39615-0001.patch \
            file://CVE-2023-39615-0002.patch \
            file://CVE-2021-3516.patch \
+           file://CVE-2023-45322-1.patch \
+           file://CVE-2023-45322-2.patch \
            "
 
 SRC_URI[archive.sha256sum] = "593b7b751dd18c2d6abcd0c4bcb29efc203d0b4373a6df98e3a455ea74ae2813"
-- 
2.34.1


