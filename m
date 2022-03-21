Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73ADCC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 22:29:30 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.2511.1647901769189880507
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Wkd+9u+Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id jx9so331870pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=p39R6JQVX4yGuMjAaj1JB7UXczyOgH9ry4rOmc/Gip8=;
        b=Wkd+9u+QmamT4DYpxExXgXc1WOVgeaSN6GtYLke48RZyiUyFXeKHkPwN3n43nzEV7R
         aSio+hJNI6Sk1lW4tRmRuBAl/R5Su5UR5LtNt5gulu0XkjqGESBgasMFLsk3xzJMKNfd
         h9BkvDWwlPzMBat99Eh155hcra6YhNvvLfFpBos6zZbtNgueXgzxxkrrnoSSUO6UxJ6E
         HO427//Wg/9mBIJZA30PsMHLtoqV274RDHdtixrK0OaVydgRuyFBxE1KkCQMpC68B9RN
         Eh2l6sroSHlAkt5hOJFbR7KozZRq2IaGjK83PGepK+Fe7Msqh0qgLD7LQdbuUqE6T6yJ
         F4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p39R6JQVX4yGuMjAaj1JB7UXczyOgH9ry4rOmc/Gip8=;
        b=4mr6ic//uyuyEHRC7orPKaTUaSSzzZgidThzJGow3fvcfJ1HiVRrXoLejOU7u3pf5S
         ITsa+1Uaha+gLGrxAm3i6sIMgP8e5mTtS/CshbKh9zRjJhvZ6famiBiHWpj6XKQXxp4Y
         ITZMGbS/HHRRL81v05sNMcJm9qBPVBsTZUWUeXw0iCu378c6g99bhrKfE2VFKFrLfYJI
         5I52ZdeOW/Vna7WMUh0B2t2iZZyo24yqMmHppmzq9I7K9dB8X28EJ+SCu0XQN71LUJZS
         mpdAHJH93OzHoh/xUqmQOmkN5eCiVH3pKxgzSdo6BHbgyANPOypokanrcy4BxXr6TAPi
         uAHQ==
X-Gm-Message-State: AOAM532/WXyOAexOKXm+TB5c9R6e79JNYmflPFV5yCwDWWLBQWSYeodu
	IU/SFGi1Z/H80E7Z14Ggsqhu4ZlEpKLnBeJS3vE=
X-Google-Smtp-Source: 
 ABdhPJwQqSesKFFpfjs1UrqYB5x1/vO8mSCWHwn+lLgTKusO23rLFqPTqtl3GaLS36J8axVuYYnNtA==
X-Received: by 2002:a17:90b:4b02:b0:1c7:1bc3:690b with SMTP id
 lx2-20020a17090b4b0200b001c71bc3690bmr1428952pjb.174.1647901767897;
        Mon, 21 Mar 2022 15:29:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 k13-20020aa7820d000000b004fa72a52040sm12352649pfi.172.2022.03.21.15.29.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 15:29:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/13] libxml2: backport fix for CVE-2022-23308
Date: Mon, 21 Mar 2022 12:29:01 -1000
Message-Id: 
 <6c2f91ce93921c9bfe52c62c0347b992df98d62d.1647901591.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1647901591.git.steve@sakoman.com>
References: <cover.1647901591.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 22:29:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163514

From: Ralph Siemsen <ralph.siemsen@linaro.org>

Use-after-free of ID and IDREF attributes, which could result in denial
of service.

https://nvd.nist.gov/vuln/detail/CVE-2022-23308
CVE: CVE-2022-23308

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2022-23308.patch       | 204 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   1 +
 2 files changed, 205 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-23308.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2022-23308.patch b/meta/recipes-core/libxml/libxml2/CVE-2022-23308.patch
new file mode 100644
index 0000000000..bf5604e81a
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2022-23308.patch
@@ -0,0 +1,204 @@
+From 8b66850de350f0fcd786ae776a65ba15a5999e50 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 8 Feb 2022 03:29:24 +0100
+Subject: [PATCH] Use-after-free of ID and IDREF attributes
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
+
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libxml2/-/commit/652dd12a858989b14eed4e84e453059cd3ba340e]
+
+The upstream patch 652dd12a858989b14eed4e84e453059cd3ba340e has been modified
+to skip the patch to the testsuite result (result/XInclude/ns1.xml.rdr), as
+this particular test does not exist in v2.9.10 (it was added later).
+
+CVE: CVE-2022-23308
+Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
+
+---
+ valid.c | 88 +++++++++++++++++++++++++++++++++++----------------------
+ 1 file changed, 55 insertions(+), 33 deletions(-)
+
+diff --git a/valid.c b/valid.c
+index 07963e7..ee75311 100644
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
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index ebb996c8dd..1b22e5672c 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://CVE-2021-3537.patch \
            file://CVE-2021-3518.patch \
            file://CVE-2021-3541.patch \
+           file://CVE-2022-23308.patch \
            "
 
 SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-- 
2.25.1


