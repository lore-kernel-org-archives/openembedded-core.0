Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC810C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 22:05:44 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.8515.1698789935200997187
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 15:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RxyK81QN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6b36e1fcee9so5444422b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 15:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698789934; x=1699394734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0FrSrwwM1xSYEzHkAQFJAEZbfe+YGL1NrmMlmBnPTE=;
        b=RxyK81QNazc4Svls3Pkc2izR3dnG4Tc2tUx07CAG8dktQrHhU3x10pcWLuA0m2ZsSp
         G6Q5rKUoZmQfLWMIz+4WQ/B8EE8iE5/E5hyhR2EETYdQKwxYxrFYUrgD2d5gu9efLbFJ
         xDJ4Y9ICbQPHFLnH+rbmc8gnfPs6Nyhrq7Xg3ueEPxH1GkRzbKhFTGH3LYFxXCE/06Dx
         L5Q6X/djamv5JSc3LVgp1JwsiwWqp3z3IaKRWTRP4cxFLQ77LZxZpii6+s0HP7ZZdcLo
         NLwPxEqSLEh8K5nn3E6BwXFcyGgEb7baoHgc6gk2EFSZk2Vu9XROmANHF+kfAcsmY1Qd
         CM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698789934; x=1699394734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0FrSrwwM1xSYEzHkAQFJAEZbfe+YGL1NrmMlmBnPTE=;
        b=AvCQUZ91dwaAX7B07aCcXG/UyiA+PV54lUjPoZW5YGDrfDG9KuLIrTFiYuf942xbE7
         Atb0SIrveHjLFv5l7DYihCDxPEx6AHiL8gsy0iqVIrGmFzI2g/+WaWgzjwOtR5H13uVw
         KPQGSeEbas7DOc0XxICBSPRQe7Lsx9OLIX22KEquVcBgqLMrfN9SugMDt6KNC0IYYdw5
         iCak+48NlK3Oi9EqmTeQXhF1SijRxT+q0Osb9lx/wrqSeh7FZtxyFiy4XR2V7o6Op3gK
         QLo8KxgI0O5W5dzL60UKzWedSKyxfux6vUAZ4IRU9F1LaOHF4OQSiPprDM9Pyh4sQxQ8
         OuQw==
X-Gm-Message-State: AOJu0Yy3lXL9zbJi2Fqn3QazTg23TRX6NJBbIOsUU6z2sY1E4BW6Fwjq
	e1m8nVTvZhA76WvIaij+14duXjTDQ6+jRe8L1pov4w==
X-Google-Smtp-Source: AGHT+IHhpIUChgLOicGUuMl6Y77ZCjnPjyjgIK75jC19LxSAMkp1Z1wXJBQrI3B2/2dg6maow8lgGA==
X-Received: by 2002:a05:6a00:84b:b0:69b:5395:59a8 with SMTP id q11-20020a056a00084b00b0069b539559a8mr13250874pfk.34.1698789933482;
        Tue, 31 Oct 2023 15:05:33 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c24-20020a62e818000000b0068be3489b0dsm100301pfi.172.2023.10.31.15.05.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 15:05:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/3] libxml2: Patch CVE-2023-45322
Date: Tue, 31 Oct 2023 12:05:17 -1000
Message-Id: <d29a89412b37995857269d617e16ada116f14270.1698789786.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698789786.git.steve@sakoman.com>
References: <cover.1698789786.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189871

From: Peter Marko <peter.marko@siemens.com>

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

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2023-45322-1.patch     | 49 ++++++++++++
 .../libxml/libxml2/CVE-2023-45322-2.patch     | 79 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  2 +
 3 files changed, 130 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-45322-1.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-45322-2.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2023-45322-1.patch b/meta/recipes-core/libxml/libxml2/CVE-2023-45322-1.patch
new file mode 100644
index 0000000000..5f1cb72534
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2023-45322-1.patch
@@ -0,0 +1,49 @@
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
index 0000000000..845fd70c66
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2023-45322-2.patch
@@ -0,0 +1,79 @@
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
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index 437bccf4ed..533a6dae01 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -29,6 +29,8 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2023-29469.patch \
            file://CVE-2023-39615-0001.patch \
            file://CVE-2023-39615-0002.patch \
+           file://CVE-2023-45322-1.patch \
+           file://CVE-2023-45322-2.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-- 
2.34.1


