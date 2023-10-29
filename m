Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4462C4332F
	for <webhook@archiver.kernel.org>; Sun, 29 Oct 2023 23:40:37 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.84325.1698622828181208489
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Oct 2023 16:40:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=mDnwPAUx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202310292340245b6d19162e2027cdc0-qsqbhs@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202310292340245b6d19162e2027cdc0
        for <openembedded-core@lists.openembedded.org>;
        Mon, 30 Oct 2023 00:40:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=jboB1haPaEi/uoo2xC4XDFEk1s7LEBqWC8G2PfHYMhw=;
 b=mDnwPAUxDZzv6R7Z+Fovc4rMNnS1vgmoliSsfXNVGgZ4iCHXiH4OLUzkjaBzu+jqqsTRXh
 2QbT2y7bptlgk9bf20NwA+skBeFtY1evuUUgTCrtEeqfSZfKjugmhHawmDIHpQBFzV6LlkHD
 5OH3HgTVn4T3zFilI6fOggDrb62bA=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] libxml2: Patch CVE-2023-45322
Date: Mon, 30 Oct 2023 00:39:43 +0100
Message-Id: <20231029233943.1808296-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 23:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189778

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
2.30.2


