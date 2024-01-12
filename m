Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B3DC47077
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 03:06:29 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.11288.1705028779078001946
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 19:06:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=E9SeWk7Z;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d3e84fded7so34818635ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 19:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1705028778; x=1705633578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bb0RvFTiN8sT0Fo8640OIIHnaEXkX909SNN6MxbALLY=;
        b=E9SeWk7Zfopxn0MHRw+tqY4rK6YZx6ApV1qMudtXiwJ/XNeTJBNczKAlBM7/xZ2e9l
         H/WxlqQqo2il6D+U1AC7CcK9qqaWVbaEMixexJi4yZv4g8JzSiRRA8ln1NzBdsNeM9OO
         eq12YVOOLXg/X36zUpr2nsPgAgc5Xb1h65FPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705028778; x=1705633578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bb0RvFTiN8sT0Fo8640OIIHnaEXkX909SNN6MxbALLY=;
        b=bJDelS7JlCgmX4g52czTPGxjjipiLlsRmntFzlaJIr91p5JbG2xCG7NnDaJOtsZHdh
         kkdb0K7kT3MaNfZq60D36ypjFo//PGaovRGjmoVvKYCM1wcuk75Q3pgYWrXh5XvbFXzo
         MeWkh1/DATAy4Yie0opsuqOyUNZwDpab4JiAHq54hkdhCul3VnGLq/ZqQNSshZRY79RH
         Y0ZeAmWu2IBus9lDbr+HnAxAs+YbEsZc6+I3uVTaFtl0WnLhXJW/JSbA8fFo1Zf+CmZ2
         9rJrc/7AzU2g7l3NQ7fJS0+BtwXE+Z5EWYCbQdy+iFaH6BLg9s7bCT/cZEn4+w5I8t8J
         9D9Q==
X-Gm-Message-State: AOJu0YwV0ff5D+2eA9RcklZQPCq2GOnmv7NyM1v1YqQsEaDq8PF2/Jgr
	VDDrdhd0QUeWHFfiRPNedFZK5dotK9M5Iew8NvsJpCNW7+g=
X-Google-Smtp-Source: AGHT+IEa09tVonH/OjtLwCgqRjQxWEcg2gbni4zF/E8gYiEem6OjZbBkYSN1rJ/AfqvbHu9j2S4p/Q==
X-Received: by 2002:a17:902:be04:b0:1d3:e78a:3f05 with SMTP id r4-20020a170902be0400b001d3e78a3f05mr239131pls.38.1705028777612;
        Thu, 11 Jan 2024 19:06:17 -0800 (PST)
Received: from MVIN00020.mvista.com ([223.230.62.128])
        by smtp.gmail.com with ESMTPSA id mm4-20020a1709030a0400b001d05456394csm1945192plb.28.2024.01.11.19.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 19:06:17 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] libxml2: Fix for CVE-2023-45322
Date: Fri, 12 Jan 2024 08:34:06 +0530
Message-Id: <20240112030406.6835-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 03:06:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193565

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
2.25.1


