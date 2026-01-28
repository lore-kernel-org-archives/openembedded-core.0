Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A628D3567F
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 05:56:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7015.1769579780162060034
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 21:56:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dgQWdpqr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5488604eb2=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S47m0q1993881
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 05:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Z/C2YBS9rnASvPVwVpW3
	OiwTvPdi5uO3+5k3+mF18AM=; b=dgQWdpqrQQ0YcN6YvMsc/I4kH7aKtl4rXhWV
	8YVF7IjEL+C6HnsVpgJWrtwGUJa7z0C5iw0xli03nZgwKxACoIVzCNfba8RqXqKl
	RB6wNI/vIQmrq9bZcq7sZFR5WNB069/pD1+RCVaoVnA9SKCxUF0yLz6vfjAnpMzF
	HP9GfUdfXNOGUB6Tmx43sNLORVd99gZzikqJagfiWtsQuOd+GroAx8IyHlCPAdxl
	q1YZ2f4lut+fcDNzwc6s2m+483lS+y5sFi7p91TUFKMFSOusbrn+GaELL+LcqvUO
	dAgOmhKE7r/pyDlglVz5M8Q/A+vjaTTfn7nByxZi2i5c/MTFRg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bvka04mg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 05:56:18 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 27 Jan 2026 21:56:17 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 27 Jan 2026 21:56:17 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libxml2: Fix CVE-2026-0989
Date: Wed, 28 Jan 2026 13:56:16 +0800
Message-ID: <20260128055616.3324710-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=I+hohdgg c=1 sm=1 tr=0 ts=6979a503 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=GHR8O2WEAAAA:20
 a=t0mHMAjQAAAA:8 a=SSmOFEACAAAA:8 a=t7CeM3EgAAAA:8 a=iox4zFpeAAAA:8
 a=f4PKJlgd2zb832-YhugA:9 a=m9p5bXcFLgAA:10 a=as1qGJVG6DKwKbMQaqLw:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA0NSBTYWx0ZWRfXxi+9FxbC400Y
 6oA659h/n2+k5OGwyJNVIiXXUzStS20qLC75pUYDy1nZtMnGIx/23Scfc/vlLo0QSgG/q1G8C4I
 st3qXKXJmwJIjY42R/BZx/1uyEFQiyTty90oiFlMnPm/COLHweEefYytA/92hEoOb4+mFV/4xIV
 yZHZGNQwXQbEBT4sj06j0blk8HtB0kNUzyA/+KDFNjqr1f0kTFs/3wsSYSkX0CjcGIRrFLg6/ZS
 qkVAu1p8HDnzwRPBjzg9UrphxFhbeCvAiE+QGOZbHi8UrXHbNYKtLWHl1BltOTuuLn43/6CZzJw
 bLnv6bUSBiJuTPLn7DBdJaIatouraA6KAOyYZTwMT+rYPYLTdLov+q89HaX9OnYEfYL6Q/r6cId
 1hviMRvRvxQHadpqaiCwF89ohpmdXzO8OYcVz4oOmUoFCWLeI8GFaSTVXry7WHntDNneLUrh3T4
 4R7A7gpf3Q5zSjM015g==
X-Proofpoint-GUID: FW3MNz81XooKpVhPazuTbYmScNdTqEMm
X-Proofpoint-ORIG-GUID: FW3MNz81XooKpVhPazuTbYmScNdTqEMm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 05:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230077

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch [1] to fix CVE-2026-0989.

[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/19549c61590c1873468c53e0026a2fbffae428ef

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../libxml/libxml2/CVE-2026-0989.patch        | 314 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.15.1.bb    |   1 +
 2 files changed, 315 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch
new file mode 100644
index 0000000000..800c8cf845
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch
@@ -0,0 +1,314 @@
+From 19549c61590c1873468c53e0026a2fbffae428ef Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Fri, 10 Oct 2025 09:38:31 +0200
+Subject: [PATCH] Add RelaxNG include limit
+
+This patch adds a default xmlRelaxNGIncludeLimit of 1.000, and that
+limit can be modified at runtime with the env variable
+RNG_INCLUDE_LIMIT.
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/issues/998
+
+CVE: CVE-2026-0989
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/19549c61590c1873468c53e0026a2fbffae428ef]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ include/libxml/relaxng.h                 |  4 ++
+ relaxng.c                                | 63 ++++++++++++++++++++--
+ runtest.c                                | 67 ++++++++++++++++++++++++
+ test/relaxng/include/include-limit.rng   |  4 ++
+ test/relaxng/include/include-limit_1.rng |  4 ++
+ test/relaxng/include/include-limit_2.rng |  4 ++
+ test/relaxng/include/include-limit_3.rng |  8 +++
+ 7 files changed, 150 insertions(+), 4 deletions(-)
+ create mode 100644 test/relaxng/include/include-limit.rng
+ create mode 100644 test/relaxng/include/include-limit_1.rng
+ create mode 100644 test/relaxng/include/include-limit_2.rng
+ create mode 100644 test/relaxng/include/include-limit_3.rng
+
+diff --git a/include/libxml/relaxng.h b/include/libxml/relaxng.h
+index eafc6604..099dacd8 100644
+--- a/include/libxml/relaxng.h
++++ b/include/libxml/relaxng.h
+@@ -136,6 +136,10 @@ XMLPUBFUN int
+ 		    xmlRelaxParserSetFlag	(xmlRelaxNGParserCtxt *ctxt,
+ 						 int flag);
+ 
++XMLPUBFUN int
++		    xmlRelaxParserSetIncLImit	(xmlRelaxNGParserCtxt *ctxt,
++						 int limit);
++
+ XMLPUBFUN void
+ 		    xmlRelaxNGFreeParserCtxt	(xmlRelaxNGParserCtxt *ctxt);
+ XMLPUBFUN void
+diff --git a/relaxng.c b/relaxng.c
+index 1d74ba9f..c0e94a3c 100644
+--- a/relaxng.c
++++ b/relaxng.c
+@@ -18,6 +18,8 @@
+ 
+ #ifdef LIBXML_RELAXNG_ENABLED
+ 
++#include <errno.h>
++#include <stdlib.h>
+ #include <string.h>
+ #include <stdio.h>
+ #include <stddef.h>
+@@ -44,6 +46,12 @@
+ static const xmlChar *xmlRelaxNGNs = (const xmlChar *)
+     "http://relaxng.org/ns/structure/1.0";
+ 
++/*
++ * Default include limit, this can be override with RNG_INCLUDE_LIMIT
++ * env variable
++ */
++static const int _xmlRelaxNGIncludeLimit = 1000;
++
+ #define IS_RELAXNG(node, typ)						\
+    ((node != NULL) && (node->ns != NULL) &&				\
+     (node->type == XML_ELEMENT_NODE) &&					\
+@@ -218,6 +226,7 @@ struct _xmlRelaxNGParserCtxt {
+     int incNr;                  /* Depth of the include parsing stack */
+     int incMax;                 /* Max depth of the parsing stack */
+     xmlRelaxNGIncludePtr *incTab;       /* array of incs */
++    int incLimit;               /* Include limit, to avoid stack-overflow on parse */
+ 
+     int idref;                  /* requires idref checking */
+ 
+@@ -1342,6 +1351,23 @@ xmlRelaxParserSetFlag(xmlRelaxNGParserCtxt *ctxt, int flags)
+     return(0);
+ }
+ 
++/**
++ * Semi private function used to set the include recursion limit to a
++ * parser context. Set to 0 to use the default value.
++ *
++ * @param ctxt  a RelaxNG parser context
++ * @param limit the new include depth limit
++ * @returns 0 if success and -1 in case of error
++ */
++int
++xmlRelaxParserSetIncLImit(xmlRelaxNGParserCtxt *ctxt, int limit)
++{
++    if (ctxt == NULL) return(-1);
++    if (limit < 0) return(-1);
++    ctxt->incLimit = limit;
++    return(0);
++}
++
+ /************************************************************************
+  *									*
+  *			Document functions				*
+@@ -1397,7 +1423,7 @@ xmlRelaxReadMemory(xmlRelaxNGParserCtxtPtr ctxt, const char *buf, int size) {
+  *
+  * @param ctxt  the parser context
+  * @param value  the element doc
+- * @returns 0 in case of error, the index in the stack otherwise
++ * @returns -1 in case of error, the index in the stack otherwise
+  */
+ static int
+ xmlRelaxNGIncludePush(xmlRelaxNGParserCtxtPtr ctxt,
+@@ -1411,9 +1437,15 @@ xmlRelaxNGIncludePush(xmlRelaxNGParserCtxtPtr ctxt,
+                                                sizeof(ctxt->incTab[0]));
+         if (ctxt->incTab == NULL) {
+             xmlRngPErrMemory(ctxt);
+-            return (0);
++            return (-1);
+         }
+     }
++    if (ctxt->incNr >= ctxt->incLimit) {
++        xmlRngPErr(ctxt, (xmlNodePtr)value->doc, XML_RNGP_PARSE_ERROR,
++                   "xmlRelaxNG: inclusion recursion limit reached\n", NULL, NULL);
++        return(-1);
++    }
++
+     if (ctxt->incNr >= ctxt->incMax) {
+         ctxt->incMax *= 2;
+         ctxt->incTab =
+@@ -1422,7 +1454,7 @@ xmlRelaxNGIncludePush(xmlRelaxNGParserCtxtPtr ctxt,
+                                                 sizeof(ctxt->incTab[0]));
+         if (ctxt->incTab == NULL) {
+             xmlRngPErrMemory(ctxt);
+-            return (0);
++            return (-1);
+         }
+     }
+     ctxt->incTab[ctxt->incNr] = value;
+@@ -1586,7 +1618,9 @@ xmlRelaxNGLoadInclude(xmlRelaxNGParserCtxtPtr ctxt, const xmlChar * URL,
+     /*
+      * push it on the stack
+      */
+-    xmlRelaxNGIncludePush(ctxt, ret);
++    if (xmlRelaxNGIncludePush(ctxt, ret) < 0) {
++        return (NULL);
++    }
+ 
+     /*
+      * Some preprocessing of the document content, this include recursing
+@@ -7261,11 +7295,32 @@ xmlRelaxNGParse(xmlRelaxNGParserCtxt *ctxt)
+     xmlDocPtr doc;
+     xmlNodePtr root;
+ 
++    const char *include_limit_env = getenv("RNG_INCLUDE_LIMIT");
++
+     xmlRelaxNGInitTypes();
+ 
+     if (ctxt == NULL)
+         return (NULL);
+ 
++    if (ctxt->incLimit == 0) {
++        ctxt->incLimit = _xmlRelaxNGIncludeLimit;
++        if (include_limit_env != NULL) {
++            char *strEnd;
++            unsigned long val = 0;
++            errno = 0;
++            val = strtoul(include_limit_env, &strEnd, 10);
++            if (errno != 0 || *strEnd != 0 || val > INT_MAX) {
++                xmlRngPErr(ctxt, NULL, XML_RNGP_PARSE_ERROR,
++                           "xmlRelaxNGParse: invalid RNG_INCLUDE_LIMIT %s\n",
++                           (const xmlChar*)include_limit_env,
++                           NULL);
++                return(NULL);
++            }
++            if (val)
++                ctxt->incLimit = val;
++        }
++    }
++
+     /*
+      * First step is to parse the input document into an DOM/Infoset
+      */
+diff --git a/runtest.c b/runtest.c
+index 49519aef..45109f0a 100644
+--- a/runtest.c
++++ b/runtest.c
+@@ -3741,6 +3741,70 @@ rngTest(const char *filename,
+     return(ret);
+ }
+ 
++/**
++ * Parse an RNG schemas with a custom RNG_INCLUDE_LIMIT
++ *
++ * @param filename  the schemas file
++ * @param result  the file with expected result
++ * @param err  the file with error messages
++ * @returns 0 in case of success, an error code otherwise
++ */
++static int
++rngIncludeTest(const char *filename,
++               const char *resul ATTRIBUTE_UNUSED,
++               const char *errr ATTRIBUTE_UNUSED,
++               int options ATTRIBUTE_UNUSED) {
++    xmlRelaxNGParserCtxtPtr ctxt;
++    xmlRelaxNGPtr schemas;
++    int ret = 0;
++
++    /* first compile the schemas if possible */
++    ctxt = xmlRelaxNGNewParserCtxt(filename);
++    xmlRelaxNGSetParserStructuredErrors(ctxt, testStructuredErrorHandler,
++                                        NULL);
++
++    /* Should work */
++    schemas = xmlRelaxNGParse(ctxt);
++    if (schemas == NULL) {
++        testErrorHandler(NULL, "Relax-NG schema %s failed to compile\n",
++                         filename);
++        ret = -1;
++        goto done;
++    }
++    xmlRelaxNGFree(schemas);
++    xmlRelaxNGFreeParserCtxt(ctxt);
++
++    ctxt = xmlRelaxNGNewParserCtxt(filename);
++    /* Should fail */
++    xmlRelaxParserSetIncLImit(ctxt, 2);
++    xmlRelaxNGSetParserStructuredErrors(ctxt, testStructuredErrorHandler,
++                                        NULL);
++    schemas = xmlRelaxNGParse(ctxt);
++    if (schemas != NULL) {
++        ret = -1;
++        xmlRelaxNGFree(schemas);
++    }
++    xmlRelaxNGFreeParserCtxt(ctxt);
++
++    ctxt = xmlRelaxNGNewParserCtxt(filename);
++    /* Should work */
++    xmlRelaxParserSetIncLImit(ctxt, 3);
++    xmlRelaxNGSetParserStructuredErrors(ctxt, testStructuredErrorHandler,
++                                        NULL);
++    schemas = xmlRelaxNGParse(ctxt);
++    if (schemas == NULL) {
++        testErrorHandler(NULL, "Relax-NG schema %s failed to compile\n",
++                         filename);
++        ret = -1;
++        goto done;
++    }
++    xmlRelaxNGFree(schemas);
++
++done:
++    xmlRelaxNGFreeParserCtxt(ctxt);
++    return(ret);
++}
++
+ #ifdef LIBXML_READER_ENABLED
+ /**
+  * Parse a set of files with streaming, applying an RNG schemas
+@@ -5202,6 +5266,9 @@ testDesc testDescriptions[] = {
+     { "Relax-NG regression tests" ,
+       rngTest, "./test/relaxng/*.rng", NULL, NULL, NULL,
+       XML_PARSE_DTDATTR | XML_PARSE_NOENT },
++    { "Relax-NG include limit tests" ,
++      rngIncludeTest, "./test/relaxng/include/include-limit.rng", NULL, NULL, NULL,
++      0 },
+ #ifdef LIBXML_READER_ENABLED
+     { "Relax-NG streaming regression tests" ,
+       rngStreamTest, "./test/relaxng/*.rng", NULL, NULL, NULL,
+diff --git a/test/relaxng/include/include-limit.rng b/test/relaxng/include/include-limit.rng
+new file mode 100644
+index 00000000..51f03942
+--- /dev/null
++++ b/test/relaxng/include/include-limit.rng
+@@ -0,0 +1,4 @@
++<?xml version="1.0" encoding="UTF-8"?>
++<grammar xmlns="http://relaxng.org/ns/structure/1.0">
++    <include href="include-limit_1.rng"/>
++</grammar>
+diff --git a/test/relaxng/include/include-limit_1.rng b/test/relaxng/include/include-limit_1.rng
+new file mode 100644
+index 00000000..4672da38
+--- /dev/null
++++ b/test/relaxng/include/include-limit_1.rng
+@@ -0,0 +1,4 @@
++<?xml version="1.0" encoding="UTF-8"?>
++<grammar xmlns="http://relaxng.org/ns/structure/1.0">
++    <include href="include-limit_2.rng"/>
++</grammar>
+diff --git a/test/relaxng/include/include-limit_2.rng b/test/relaxng/include/include-limit_2.rng
+new file mode 100644
+index 00000000..b35ecaa8
+--- /dev/null
++++ b/test/relaxng/include/include-limit_2.rng
+@@ -0,0 +1,4 @@
++<?xml version="1.0" encoding="UTF-8"?>
++<grammar xmlns="http://relaxng.org/ns/structure/1.0">
++    <include href="include-limit_3.rng"/>
++</grammar>
+diff --git a/test/relaxng/include/include-limit_3.rng b/test/relaxng/include/include-limit_3.rng
+new file mode 100644
+index 00000000..86213c62
+--- /dev/null
++++ b/test/relaxng/include/include-limit_3.rng
+@@ -0,0 +1,8 @@
++<?xml version="1.0" encoding="UTF-8"?>
++<grammar xmlns="http://relaxng.org/ns/structure/1.0">
++    <start>
++        <element name="root">
++            <empty/>
++        </element>
++    </start>
++</grammar>
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.15.1.bb b/meta/recipes-core/libxml/libxml2_2.15.1.bb
index a64ed8098e..26fe27e933 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.1.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.1.bb
@@ -17,6 +17,7 @@ inherit gnomebase
 SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testtar \
            file://CVE-2026-0990.patch \
            file://CVE-2026-0992.patch \
+           file://CVE-2026-0989.patch \
            file://run-ptest \
            file://install-tests.patch \
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
-- 
2.34.1


