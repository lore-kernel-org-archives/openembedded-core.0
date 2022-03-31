Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27DF8C4321E
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 13:48:00 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web08.7386.1648734471130321746
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 06:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=LhMcpbGf;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648734473; x=1680270473;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=TqF/2kcjLjRlJjkEOGU/YpvWmofYGfbnf/2cI7kmPPE=;
  b=LhMcpbGfK2cKmRKNNvbat3UYgqoVPAAgYliQ4q/yuMLnc6qe+eLVx58L
   UHETm6m2lhjkGJqu3tyzk7987lZ/VG8ms3b0QNpSNd7q38pHARtXNBqHE
   nDFB/9U+/hS3eZpigag2UdG2R7PqC5n2HeFGBUxHr2lp3OQhtwsltffr1
   UQkBIOzqN+bePQ9CWtXiRMJMWdHPuoBbVEOaGGURNSI1mZEu73P0+BH2u
   RQMPiXlkYe9kc6BykPcWnqJ1FYoLe+U1bGu94tAqjvpvz4+kFH5jquMVg
   LF6MXv3oqa+VZ9X+4IARFmuM4Roa1yuzY/XMBec410wd4nVrmyR9ZfI1G
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259551784"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="259551784"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:36 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="520542090"
Received: from scho7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.39])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:35 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 04/20] libxml2: Fix CVE-2022-23308
Date: Thu, 31 Mar 2022 21:47:09 +0800
Message-Id: 
 <38e97e67f053cc7b86dd487d8e65b9e68237c73b.1648734169.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648734169.git.anuj.mittal@intel.com>
References: <cover.1648734169.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 13:48:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163819

From: Joe Slater <joe.slater@windriver.com>

The first patch is the fix in version 2.9.13.  The second
patch was added later and fixes a regression introduced
by the first.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../CVE-2022-23308-fix-regression.patch       |  99 +++++++++
 .../libxml/libxml2/CVE-2022-23308.patch       | 209 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   2 +
 3 files changed, 310 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-23308.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch b/meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch
new file mode 100644
index 0000000000..eefecb9adb
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch
@@ -0,0 +1,99 @@
+From 646fe48d1c8a74310c409ddf81fe7df6700052af Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 22 Feb 2022 11:51:08 +0100
+Subject: [PATCH] Fix --without-valid build
+
+Regressed in commit 652dd12a.
+---
+ valid.c | 58 ++++++++++++++++++++++++++++-----------------------------
+ 1 file changed, 29 insertions(+), 29 deletions(-)
+---
+
+From https://github.com/GNOME/libxml2.git
+ commit 646fe48d1c8a74310c409ddf81fe7df6700052af
+
+CVE: CVE-2022-23308
+Upstream-status: Backport
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+diff --git a/valid.c b/valid.c
+index 8e596f1d..9684683a 100644
+--- a/valid.c
++++ b/valid.c
+@@ -479,35 +479,6 @@ nodeVPop(xmlValidCtxtPtr ctxt)
+     return (ret);
+ }
+ 
+-/**
+- * xmlValidNormalizeString:
+- * @str: a string
+- *
+- * Normalize a string in-place.
+- */
+-static void
+-xmlValidNormalizeString(xmlChar *str) {
+-    xmlChar *dst;
+-    const xmlChar *src;
+-
+-    if (str == NULL)
+-        return;
+-    src = str;
+-    dst = str;
+-
+-    while (*src == 0x20) src++;
+-    while (*src != 0) {
+-	if (*src == 0x20) {
+-	    while (*src == 0x20) src++;
+-	    if (*src != 0)
+-		*dst++ = 0x20;
+-	} else {
+-	    *dst++ = *src++;
+-	}
+-    }
+-    *dst = 0;
+-}
+-
+ #ifdef DEBUG_VALID_ALGO
+ static void
+ xmlValidPrintNode(xmlNodePtr cur) {
+@@ -2636,6 +2607,35 @@ xmlDumpNotationTable(xmlBufferPtr buf, xmlNotationTablePtr table) {
+ 	    (xmlDictOwns(dict, (const xmlChar *)(str)) == 0)))	\
+ 	    xmlFree((char *)(str));
+ 
++/**
++ * xmlValidNormalizeString:
++ * @str: a string
++ *
++ * Normalize a string in-place.
++ */
++static void
++xmlValidNormalizeString(xmlChar *str) {
++    xmlChar *dst;
++    const xmlChar *src;
++
++    if (str == NULL)
++        return;
++    src = str;
++    dst = str;
++
++    while (*src == 0x20) src++;
++    while (*src != 0) {
++	if (*src == 0x20) {
++	    while (*src == 0x20) src++;
++	    if (*src != 0)
++		*dst++ = 0x20;
++	} else {
++	    *dst++ = *src++;
++	}
++    }
++    *dst = 0;
++}
++
+ static int
+ xmlIsStreaming(xmlValidCtxtPtr ctxt) {
+     xmlParserCtxtPtr pctxt;
+-- 
+2.35.1
+
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2022-23308.patch b/meta/recipes-core/libxml/libxml2/CVE-2022-23308.patch
new file mode 100644
index 0000000000..708a98b45a
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2022-23308.patch
@@ -0,0 +1,209 @@
+From 652dd12a858989b14eed4e84e453059cd3ba340e Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 8 Feb 2022 03:29:24 +0100
+Subject: [PATCH] [CVE-2022-23308] Use-after-free of ID and IDREF attributes
+
+If a document is parsed with XML_PARSE_DTDVALID and without
+XML_PARSE_NOENT, the value of ID attributes has to be normalized after
+potentially expanding entities in xmlRemoveID. Otherwise, later calls
+to xmlGetID can return a pointer to previously freed memory.
+
+ID attributes which are empty or contain only whitespace after
+entity expansion are affected in a similar way. This is fixed by
+not storing such attributes in the ID table.
+
+The test to detect streaming mode when validating against a DTD was
+broken. In connection with the defects above, this could result in a
+use-after-free when using the xmlReader interface with validation.
+Fix detection of streaming mode to avoid similar issues. (This changes
+the expected result of a test case. But as far as I can tell, using the
+XML reader with XIncludes referencing the root document never worked
+properly, anyway.)
+
+All of these issues can result in denial of service. Using xmlReader
+with validation could result in disclosure of memory via the error
+channel, typically stderr. The security impact of xmlGetID returning
+a pointer to freed memory depends on the application. The typical use
+case of calling xmlGetID on an unmodified document is not affected.
+---
+ result/XInclude/ns1.xml.rdr |  2 +-
+ valid.c                     | 88 +++++++++++++++++++++++--------------
+ 2 files changed, 56 insertions(+), 34 deletions(-)
+ ---
+ 
+From https://github.com/GNOME/libxml2.git
+ commit 652dd12a858989b14eed4e84e453059cd3ba340e
+
+Remove patch to ns1.xml.rdr which does not exist in version 2.9.10.
+
+CVE: CVE-2022-23308
+Upstream-status: Backport
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+diff --git a/valid.c b/valid.c
+index 5ee391c0..8e596f1d 100644
+--- a/valid.c
++++ b/valid.c
+@@ -479,6 +479,35 @@ nodeVPop(xmlValidCtxtPtr ctxt)
+     return (ret);
+ }
+ 
++/**
++ * xmlValidNormalizeString:
++ * @str: a string
++ *
++ * Normalize a string in-place.
++ */
++static void
++xmlValidNormalizeString(xmlChar *str) {
++    xmlChar *dst;
++    const xmlChar *src;
++
++    if (str == NULL)
++        return;
++    src = str;
++    dst = str;
++
++    while (*src == 0x20) src++;
++    while (*src != 0) {
++	if (*src == 0x20) {
++	    while (*src == 0x20) src++;
++	    if (*src != 0)
++		*dst++ = 0x20;
++	} else {
++	    *dst++ = *src++;
++	}
++    }
++    *dst = 0;
++}
++
+ #ifdef DEBUG_VALID_ALGO
+ static void
+ xmlValidPrintNode(xmlNodePtr cur) {
+@@ -2607,6 +2636,24 @@ xmlDumpNotationTable(xmlBufferPtr buf, xmlNotationTablePtr table) {
+ 	    (xmlDictOwns(dict, (const xmlChar *)(str)) == 0)))	\
+ 	    xmlFree((char *)(str));
+ 
++static int
++xmlIsStreaming(xmlValidCtxtPtr ctxt) {
++    xmlParserCtxtPtr pctxt;
++
++    if (ctxt == NULL)
++        return(0);
++    /*
++     * These magic values are also abused to detect whether we're validating
++     * while parsing a document. In this case, userData points to the parser
++     * context.
++     */
++    if ((ctxt->finishDtd != XML_CTXT_FINISH_DTD_0) &&
++        (ctxt->finishDtd != XML_CTXT_FINISH_DTD_1))
++        return(0);
++    pctxt = ctxt->userData;
++    return(pctxt->parseMode == XML_PARSE_READER);
++}
++
+ /**
+  * xmlFreeID:
+  * @not:  A id
+@@ -2650,7 +2697,7 @@ xmlAddID(xmlValidCtxtPtr ctxt, xmlDocPtr doc, const xmlChar *value,
+     if (doc == NULL) {
+ 	return(NULL);
+     }
+-    if (value == NULL) {
++    if ((value == NULL) || (value[0] == 0)) {
+ 	return(NULL);
+     }
+     if (attr == NULL) {
+@@ -2681,7 +2728,7 @@ xmlAddID(xmlValidCtxtPtr ctxt, xmlDocPtr doc, const xmlChar *value,
+      */
+     ret->value = xmlStrdup(value);
+     ret->doc = doc;
+-    if ((ctxt != NULL) && (ctxt->vstateNr != 0)) {
++    if (xmlIsStreaming(ctxt)) {
+ 	/*
+ 	 * Operating in streaming mode, attr is gonna disappear
+ 	 */
+@@ -2820,6 +2867,7 @@ xmlRemoveID(xmlDocPtr doc, xmlAttrPtr attr) {
+     ID = xmlNodeListGetString(doc, attr->children, 1);
+     if (ID == NULL)
+         return(-1);
++    xmlValidNormalizeString(ID);
+ 
+     id = xmlHashLookup(table, ID);
+     if (id == NULL || id->attr != attr) {
+@@ -3009,7 +3057,7 @@ xmlAddRef(xmlValidCtxtPtr ctxt, xmlDocPtr doc, const xmlChar *value,
+      * fill the structure.
+      */
+     ret->value = xmlStrdup(value);
+-    if ((ctxt != NULL) && (ctxt->vstateNr != 0)) {
++    if (xmlIsStreaming(ctxt)) {
+ 	/*
+ 	 * Operating in streaming mode, attr is gonna disappear
+ 	 */
+@@ -4028,8 +4076,7 @@ xmlValidateAttributeValue2(xmlValidCtxtPtr ctxt, xmlDocPtr doc,
+ xmlChar *
+ xmlValidCtxtNormalizeAttributeValue(xmlValidCtxtPtr ctxt, xmlDocPtr doc,
+ 	     xmlNodePtr elem, const xmlChar *name, const xmlChar *value) {
+-    xmlChar *ret, *dst;
+-    const xmlChar *src;
++    xmlChar *ret;
+     xmlAttributePtr attrDecl = NULL;
+     int extsubset = 0;
+ 
+@@ -4070,19 +4117,7 @@ xmlValidCtxtNormalizeAttributeValue(xmlValidCtxtPtr ctxt, xmlDocPtr doc,
+     ret = xmlStrdup(value);
+     if (ret == NULL)
+ 	return(NULL);
+-    src = value;
+-    dst = ret;
+-    while (*src == 0x20) src++;
+-    while (*src != 0) {
+-	if (*src == 0x20) {
+-	    while (*src == 0x20) src++;
+-	    if (*src != 0)
+-		*dst++ = 0x20;
+-	} else {
+-	    *dst++ = *src++;
+-	}
+-    }
+-    *dst = 0;
++    xmlValidNormalizeString(ret);
+     if ((doc->standalone) && (extsubset == 1) && (!xmlStrEqual(value, ret))) {
+ 	xmlErrValidNode(ctxt, elem, XML_DTD_NOT_STANDALONE,
+ "standalone: %s on %s value had to be normalized based on external subset declaration\n",
+@@ -4114,8 +4149,7 @@ xmlValidCtxtNormalizeAttributeValue(xmlValidCtxtPtr ctxt, xmlDocPtr doc,
+ xmlChar *
+ xmlValidNormalizeAttributeValue(xmlDocPtr doc, xmlNodePtr elem,
+ 			        const xmlChar *name, const xmlChar *value) {
+-    xmlChar *ret, *dst;
+-    const xmlChar *src;
++    xmlChar *ret;
+     xmlAttributePtr attrDecl = NULL;
+ 
+     if (doc == NULL) return(NULL);
+@@ -4145,19 +4179,7 @@ xmlValidNormalizeAttributeValue(xmlDocPtr doc, xmlNodePtr elem,
+     ret = xmlStrdup(value);
+     if (ret == NULL)
+ 	return(NULL);
+-    src = value;
+-    dst = ret;
+-    while (*src == 0x20) src++;
+-    while (*src != 0) {
+-	if (*src == 0x20) {
+-	    while (*src == 0x20) src++;
+-	    if (*src != 0)
+-		*dst++ = 0x20;
+-	} else {
+-	    *dst++ = *src++;
+-	}
+-    }
+-    *dst = 0;
++    xmlValidNormalizeString(ret);
+     return(ret);
+ }
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index cabf911816..778312f662 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -30,6 +30,8 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://CVE-2021-3518-0002.patch \
            file://CVE-2021-3537.patch \
            file://CVE-2021-3541.patch \
+           file://CVE-2022-23308.patch \
+           file://CVE-2022-23308-fix-regression.patch \
            "
 
 SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-- 
2.35.1


