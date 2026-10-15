Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223EBCC6B3F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:03 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32440.1792040633246093218
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fzUkNLNj;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so37623935e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040631; x=1792645431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+raIgylfxOu9u25h0Xt/8jkjz1UnasRUYdWP2Y+1zRg=;
        b=fzUkNLNjkBBDhmlWgbJll3OHWVetYtxxx6flKOPdGF+89jHrl9j+izDX/L2Vnsop4+
         TQErYrDc+RCWJYqLuFo7CRKRZR1Fyaf0GhF3F/7MbAId/Pyhjb46Eigb8BixSDbbvd0o
         1kwWK2RaHxuPBoPJXCJWoY+JRTrgbX30p3fyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040631; x=1792645431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+raIgylfxOu9u25h0Xt/8jkjz1UnasRUYdWP2Y+1zRg=;
        b=Hq2a3h8taE+tckJ3SZBmO5uwKkCm6ljiWWam33S3PamJqH07yHAaGgh+8/VuGQID/I
         mVdDyHj07GtJBL64G8vW/Kr/ClCRJ2158AoRzQACxSbw9C/x0Y0dsxqyBFUDqw9d42RO
         CMt47lQkxY8kDCZEB19FURiozJf84zXjMLfDuW3P/TAl0Rvz/F2LrDNSrqQ+yyZBb4f5
         Ne2ht2CgmoO/l0JvQVXf0y/xYXJ6ILkD/NWKukDWSUzmkOKqePd1kPp7JIPYeOw8xDti
         BhytrTz7LNd8Ynk0OucGDeWYqkXbhzDX70czoPg9H13504A3CEzB4Rw+zJqXTP9bVlyj
         RanQ==
X-Gm-Message-State: AFq9FYI1hqEKVCdbBJsOnX6xUEF3F5kxNoZbRivjN0lZAPQ3Ejdb5VVL
	O3vHiCUeMKEM/hdVlQnDMC4+ry6BDorcB3rQZHIBr6AilS/uNntbOtPeB2NiAQ828d5ALV6jaLL
	hhGLaZRQ=
X-Gm-Gg: AYBFou0QcH+CIS98blHyOrr8eJVYwLw+P5YrXh0dZwx+FyJMlvvURdB25yeU8Azbnxi
	lQRV0TTswspQsSfTtquZX3ak2nvTqmSImZP5ISahhh46YBPE9HTofISBLl4gt9K/YTM1ESA+BpG
	EhxatqLmBF8Q1ocleQ7p13IjZ2rWwCUF9FyyjDjJU6TE0S2XJys5Zch9G46xrIJ+aci3pfjyt33
	BdF2b5mNdpulBA0h17/jt7d01whBYoaI0vrgZSm0DXjMp9OAcgZiLubacVNRblX3Hzj1uWXQFLC
	YaO9yQV7xZ7jLKV09mixcDVtQpX0Wtir4D4PvMzONRuLVLeLOFlmBW1EB5MVIANoNjhFDkVtFiT
	2tWyyeJiV6CKuReQGPvdoUqDcEHw8b2cJeCOlHRpRuphI/r05cfCezmQMqs2Zw23W+d/xxY1M7v
	lIdjkvQ8jX3vpGFQMRbBl9fbKUPKZf0fMtytbgtqUwB3iLH3QSrR41VfR2QZ/EskrbviSDY8VID
	LPkMuO/KdiiDKba4eTtggHUoR281K4j1szLxBM/95ibNWhNyG26tYzlqB33MJy5yIIAeWyrN1xx
	dkDd+sK7
X-Received: by 2002:a05:600c:4e55:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a18e49c008mr322528635e9.12.1792040631409;
        Wed, 14 Oct 2026 22:03:51 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:50 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/55] libxml2: Fix CVE-2026-86144
Date: Thu, 15 Oct 2026 07:02:44 +0200
Message-ID: <4b03cdc9cab9419ba55f0b0baf10c04412d690fa.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247819

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/GNOME/libxml2/commit/b63cd517afecb76582dd9488c55e54ceaf50de61
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86144

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libxml/libxml2/CVE-2026-86144.patch       | 225 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |   1 +
 2 files changed, 226 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86144.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86144.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86144.patch
new file mode 100644
index 00000000000..77dd2a07e28
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86144.patch
@@ -0,0 +1,225 @@
+From 8d0c6eb94f8a32a49e3c9122a6da82c519198063 Mon Sep 17 00:00:00 2001
+From: Ruben Thijssen <ruben.thijssen@cba.com.au>
+Date: Fri, 15 May 2026 15:42:18 +1000
+Subject: [PATCH] fix(xinclude): propagate parseFlags in xmlXIncludeProcess and
+ xmlXIncludeProcessTree
+
+CVE: CVE-2026-86144
+Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/b63cd517afecb76582dd9488c55e54ceaf50de61]
+
+Backport Changes:
+- Use xmlLoadExternalEntity() with xmlCtxtUseOptions() because Scarthgap
+  2.12.10 predates xmlLoadResource() and resource-loader callbacks.
+- Adapt the regression tests for 2.12.10 by using the global structured-error
+  handler, matching 2.12.10 loader network-entity diagnostics, and restoring
+  the test handler after xmlXIncludeProcess().
+- Omit the upstream XML_IO_NETWORK_ATTEMPT filter because the 2.12.10
+  xmlLoadExternalEntity() path has no corresponding post-load error-filtering
+  block.
+- Add a parser-context allocation guard because the target version can return
+  NULL from xmlNewParserCtxt().
+
+(cherry picked from commit b63cd517afecb76582dd9488c55e54ceaf50de61)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ result/XInclude/issue1120-1.xml         |  4 ++
+ result/XInclude/issue1120-1.xml.err     |  1 +
+ result/XInclude/issue1120-2.xml         |  4 ++
+ result/XInclude/issue1120-2.xml.err     |  1 +
+ runtest.c                               | 75 +++++++++++++++++++++++++
+ test/XInclude/issue1120/issue1120-1.xml |  6 ++
+ test/XInclude/issue1120/issue1120-2.xml |  6 ++
+ xinclude.c                              |  9 ++-
+ 8 files changed, 104 insertions(+), 2 deletions(-)
+ create mode 100644 result/XInclude/issue1120-1.xml
+ create mode 100644 result/XInclude/issue1120-1.xml.err
+ create mode 100644 result/XInclude/issue1120-2.xml
+ create mode 100644 result/XInclude/issue1120-2.xml.err
+ create mode 100644 test/XInclude/issue1120/issue1120-1.xml
+ create mode 100644 test/XInclude/issue1120/issue1120-2.xml
+
+diff --git a/result/XInclude/issue1120-1.xml b/result/XInclude/issue1120-1.xml
+new file mode 100644
+index 00000000..5d83cc96
+--- /dev/null
++++ b/result/XInclude/issue1120-1.xml
+@@ -0,0 +1,4 @@
++<?xml version="1.0"?>
++<doc xmlns:xi="http://www.w3.org/2001/XInclude">
++  Network access is not allowed
++</doc>
+diff --git a/result/XInclude/issue1120-1.xml.err b/result/XInclude/issue1120-1.xml.err
+new file mode 100644
+index 00000000..c134bed1
+--- /dev/null
++++ b/result/XInclude/issue1120-1.xml.err
+@@ -0,0 +1 @@
++I/O error : Attempt to load network entity http://example.invalid/file.txt
+diff --git a/result/XInclude/issue1120-2.xml b/result/XInclude/issue1120-2.xml
+new file mode 100644
+index 00000000..af5bde91
+--- /dev/null
++++ b/result/XInclude/issue1120-2.xml
+@@ -0,0 +1,4 @@
++<?xml version="1.0"?>
++<doc xmlns:xi="http://www.w3.org/2001/XInclude">
++  <p>Network access is not allowed</p>
++</doc>
+diff --git a/result/XInclude/issue1120-2.xml.err b/result/XInclude/issue1120-2.xml.err
+new file mode 100644
+index 00000000..051f5928
+--- /dev/null
++++ b/result/XInclude/issue1120-2.xml.err
+@@ -0,0 +1 @@
++I/O error : Attempt to load network entity http://example.invalid/file.xml
+diff --git a/runtest.c b/runtest.c
+index e91e2dfd..297cb5e2 100644
+--- a/runtest.c
++++ b/runtest.c
+@@ -2444,6 +2444,75 @@ noentParseTest(const char *filename, const char *result,
+     return(res);
+ }
+ 
++#ifdef LIBXML_XINCLUDE_ENABLED
++/**
++ * Parse a file and run xmlXIncludeProcess() to verify that doc->parseFlags
++ * is propagated properly.
++ *
++ * @param filename  the file to parse
++ * @param result  the file with expected result
++ * @param err  the file with error messages
++ * @returns 0 in case of success, an error code otherwise
++ */
++static int
++xincludeProcessTest(const char *filename, const char *result, const char *err,
++                    int options) {
++    xmlParserCtxtPtr ctxt;
++    xmlDocPtr doc;
++    xmlChar *base = NULL;
++    int size, res;
++    int ret = 0;
++
++    nb_tests++;
++
++    /* Create a new parser context */
++    ctxt = xmlNewParserCtxt();
++    if (ctxt == NULL)
++        return(-1);
++
++    /* Load the data from `filename` into a parser context */
++    xmlSetStructuredErrorFunc(NULL, testStructuredErrorHandler);
++    doc = xmlCtxtReadFile(ctxt, filename, NULL, options);
++    xmlFreeParserCtxt(ctxt);
++
++    /* Check if `doc` was created successfully */
++    if (doc == NULL) {
++        testErrorHandler(NULL, "%s : failed to parse\n", filename);
++        return(-1);
++    }
++
++    /*
++     * Run xmlXIncludeProcess() with a structured error handler to check that
++     * the parse flags are propagated.
++     */
++    xmlSetStructuredErrorFunc(NULL, testStructuredErrorHandler);
++    xmlXIncludeProcess(doc);
++    xmlSetStructuredErrorFunc(NULL, testStructuredErrorHandler);
++
++    /* Check the result and for any errors */
++    if (result) {
++        xmlDocDumpMemory(doc, &base, &size);
++        res = compareFileMem(result, (char *) base, size);
++        xmlFree(base);
++        if (res != 0) {
++            fprintf(stderr, "Result for %s failed in %s\n", filename, result);
++            ret = -1;
++        }
++    }
++
++    if ((ret == 0) && (err != NULL)) {
++        res = compareFileMem(err, testErrors, testErrorsSize);
++        if (res != 0) {
++            fprintf(stderr, "Error for %s failed\n", filename);
++            ret = -1;
++        }
++    }
++
++    xmlFreeDoc(doc);
++    return(ret);
++}
++#endif
++
+ /**
+  * errParseTest:
+  * @filename: the file to parse
+@@ -5134,6 +5203,12 @@ testDesc testDescriptions[] = {
+     { "XInclude regression tests without reader",
+       errParseTest, "./test/XInclude/without-reader/*", "result/XInclude/", "",
+       ".err", XML_PARSE_XINCLUDE },
++    { "XInclude issue1120 regression tests",
++      errParseTest, "./test/XInclude/issue1120/*", "result/XInclude/", "",
++      ".err", XML_PARSE_XINCLUDE | XML_PARSE_NONET },
++    { "XInclude xmlXIncludeProcess() issue1120 regression tests",
++      xincludeProcessTest, "./test/XInclude/issue1120/*", "result/XInclude/",
++      "", ".err", XML_PARSE_NONET },
+ #endif
+ #ifdef LIBXML_XPATH_ENABLED
+ #ifdef LIBXML_DEBUG_ENABLED
+diff --git a/test/XInclude/issue1120/issue1120-1.xml b/test/XInclude/issue1120/issue1120-1.xml
+new file mode 100644
+index 00000000..b0b8feef
+--- /dev/null
++++ b/test/XInclude/issue1120/issue1120-1.xml
+@@ -0,0 +1,6 @@
++<?xml version="1.0"?>
++<doc xmlns:xi="http://www.w3.org/2001/XInclude">
++  <xi:include href="http://example.invalid/file.txt" parse="text">
++    <xi:fallback>Network access is not allowed</xi:fallback>
++  </xi:include>
++</doc>
+diff --git a/test/XInclude/issue1120/issue1120-2.xml b/test/XInclude/issue1120/issue1120-2.xml
+new file mode 100644
+index 00000000..b4c9fe5e
+--- /dev/null
++++ b/test/XInclude/issue1120/issue1120-2.xml
+@@ -0,0 +1,6 @@
++<?xml version="1.0"?>
++<doc xmlns:xi="http://www.w3.org/2001/XInclude">
++  <xi:include href="http://example.invalid/file.xml">
++    <xi:fallback><p>Network access is not allowed</p></xi:fallback>
++  </xi:include>
++</doc>
+diff --git a/xinclude.c b/xinclude.c
+index b6581558..0d57f5a1 100644
+--- a/xinclude.c
++++ b/xinclude.c
+@@ -1688,6 +1688,11 @@ xmlXIncludeLoadTxt(xmlXIncludeCtxtPtr ctxt, const xmlChar *url,
+      * Load it.
+      */
+     pctxt = xmlNewParserCtxt();
++    if (pctxt == NULL) {
++        xmlXIncludeErrMemory(ctxt, ref->elem, NULL);
++        goto error;
++    }
++    xmlCtxtUseOptions(pctxt, ctxt->parseFlags);
+     inputStream = xmlLoadExternalEntity((const char*)URL, NULL, pctxt);
+     if(inputStream == NULL)
+ 	goto error;
+@@ -2416,7 +2421,7 @@ xmlXIncludeProcessFlags(xmlDocPtr doc, int flags) {
+  */
+ int
+ xmlXIncludeProcess(xmlDocPtr doc) {
+-    return(xmlXIncludeProcessFlags(doc, 0));
++    return(xmlXIncludeProcessFlags(doc, doc ? doc->parseFlags : 0));
+ }
+ 
+ /**
+@@ -2461,7 +2466,7 @@ xmlXIncludeProcessTreeFlags(xmlNodePtr tree, int flags) {
+  */
+ int
+ xmlXIncludeProcessTree(xmlNodePtr tree) {
+-    return(xmlXIncludeProcessTreeFlags(tree, 0));
++    return(xmlXIncludeProcessTreeFlags(tree, (tree && tree->doc) ? tree->doc->parseFlags : 0));
+ }
+ 
+ /**
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 1363beba7a5..5e4cabbf5d9 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -38,6 +38,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-86141.patch \
            file://CVE-2026-86142.patch \
            file://CVE-2026-86143.patch \
+           file://CVE-2026-86144.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"

