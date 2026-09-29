Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6ABCA5FB2
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 04:18:40 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.655.1790655517558975401
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 21:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Aq+wsWJV;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9426; q=dns/txt;
  s=iport01; t=1790655518; x=1791865118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uczez0uQcmVA8O8XqK7kkYlnfpz36KXQxVm/8/22wzQ=;
  b=Aq+wsWJV5q04y02hoQvR5IvyfCOPUZ9nQBZLIfFxa0SijCqxwCI0FO+g
   8FICrYvJCG69IqlJFD/CSO66eOcjqTPrKiunqjGWGW7BDM19iGspVAlqL
   fVrQIuwM3tS2HFJGWZb77DV/DGSFtqRLd43nTKBbgLtZipQZZzohQ1nVV
   KpE/sDdr5NB2Lnez/WYCCySR2sDo4PcPVL2ZaoG0gDFf8oH9NTkuo/C4I
   TQmq41hwpb0GWCh+ERYbr2epEFkkONNIMZfeZeMYw+8RbBBapQpd37Lyb
   a+H6zSfh3MKu+ZqeecmTBbicQy9+yYItV7GDEqRmb2GJW5Ark5Z4BrsHO
   A==;
X-CSE-ConnectionGUID: UfpeZ09JSouyg4nvrMn3nQ==
X-CSE-MsgGUID: uQH5yvOXQIuvA7wGOarQtA==
X-IPAS-Result: =?us-ascii?q?A0AnAABDO7tq/5D/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YUJJjHKJWAOBE50HgX4PAQEBD0QNBAEBhD9GAo4IAiY0CQ4BAgQDAgMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBLRAcAwECL?=
 =?us-ascii?q?ysjCBmDAgGCdAIBEcABgXkzgQGDKQE/AkNQ2zIBCxQBBYEzAYU/iCNdGAFEh?=
 =?us-ascii?q?DgnGxuBcoEVgTuBOHaBBYFcAQECiCMEgiKBDIFaHpM4SIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4EHGwYFgR2BIIIZIxk2eoEJXoErKWABEBeBB4IHA?=
 =?us-ascii?q?oJUggECAUlDDgdFUwklRRJHJiIIEgkBExowC4EhOEEJKD8YDUgRLDcVGQQ+b?=
 =?us-ascii?q?geQPx6CGC0ZBwF6EwEoAgEXgR2BMpJ0kCeCIYE1n1oKKIN2jCKVOhozqm8Lm?=
 =?us-ascii?q?H2OCpU0gRyEaYFoPIFHCwdwFYMiCUoZD445g2uBf4MUxyYkNQIJMgEBBwIHD?=
 =?us-ascii?q?gMLgWiRfgEB?=
IronPort-Data: A9a23:3olM/a5QfEz+Taaa1N5Y8gxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 mJNCzuCOveMZ2ahL4wgPdjj80MD6pXWmodiG1BlryA1Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqajNOu/rZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eAIMA99QvUEN18
 uEJJ2wLcAqmgbmw+efuIgVsrpxLwMjDJogTvDRkiDreF/tjGc+FSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkETUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3FbYCFJ4fVH54F9qqej
 n//3znoHDYqDf2C1xPa7V2Lj/X2gQquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjdCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:jJDy4axDVRIomCst+LL9KrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: 9a23:pAKAHGA7auKeXbD6ExRp7EMmQpEHSXrA3XiMJVGiLGAyToTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3A7NH+DQ194mFhgWoKNmH0FpV8hzUj/p2OVVETtqU?=
 =?us-ascii?q?/mtSaHHNvFBCUlg2ra9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,129,1787011200"; 
   d="scan'208";a="528537238"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Sep 2026 04:18:37 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 16923180003E5;
	Tue, 29 Sep 2026 04:18:37 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 67E25CC127C; Mon, 28 Sep 2026 21:18:36 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 8/8] libxml2: Fix CVE-2026-86144
Date: Mon, 28 Sep 2026 21:18:36 -0700
Message-Id: <20260929041836.2217090-8-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260929041836.2217090-1-hthakar@cisco.com>
References: <20260929041836.2217090-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 04:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246816

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/GNOME/libxml2/commit/b63cd517afecb76582dd9488c55e54ceaf50de61
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86144

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../libxml/libxml2/CVE-2026-86144.patch       | 219 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |   1 +
 2 files changed, 220 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86144.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86144.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86144.patch
new file mode 100644
index 0000000000..41fee42732
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86144.patch
@@ -0,0 +1,219 @@
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
+- Use xmlLoadExternalEntity() with xmlCtxtUseOptions() because Scarthgap 2.12.10 predates xmlLoadResource() and resource-loader callbacks.
+- Adapt the regression tests for 2.12.10 by using the global structured-error handler, matching 2.12.10 loader network-entity diagnostics, and restoring the test handler after xmlXIncludeProcess().
+- Omit the upstream XML_IO_NETWORK_ATTEMPT filter because the 2.12.10 xmlLoadExternalEntity() path has no corresponding post-load error-filtering block.
+- Add a parser-context allocation guard because the target version can return NULL from xmlNewParserCtxt().
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
index 1b0c3d50da..c100ef2a8c 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -38,6 +38,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-86141.patch \
            file://CVE-2026-86142.patch \
            file://CVE-2026-86143.patch \
+           file://CVE-2026-86144.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.35.6


