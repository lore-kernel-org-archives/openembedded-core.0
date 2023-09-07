Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B50BEE14DB
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 09:48:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9324.1694080095806431194
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 02:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=E5HMD/aL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=761428b686=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3879eC0t025647
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Sep 2023 09:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Xjxh+
	bTaPMD93Vpu+P5EfUsGGjIs0/f2uvyOYpV7NMc=; b=E5HMD/aLcYjYJV427PoFB
	ql/1NnNKrbY7EYd2Aj5Tf1L5mfxxpBiho0xxlhv+UyUOkWUaIvYge/fkUYVnRy95
	B2a2I22dYTR0U2oZgGmOmI/op6H0wEtuaStX6EK6NxXQld2VopMc4ivD/NCo1qBO
	kwRHAGvr+4XSDWNzVyvo1ZZqRP6n0maH5KZaQsvV7BMJsc6e0cOC477/ltvLxUHK
	9t89dW/QghhwWwfm0CxraVOKefU6b7DPJyimiLuFbI40h0B3CjuWmax1xLFKFjq5
	kJzirPojTGk/GaPW3nLN2gluyo6MHesfdtG+2W+l2qYUoScKdGd7f7B3fwCmqnYK
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3suv15vebr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 09:48:14 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 7 Sep 2023 02:48:12 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] libxml2: Fix CVE-2023-39615
Date: Thu, 7 Sep 2023 09:47:55 +0000
Message-ID: <20230907094755.441278-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: gNl5_XWhWA85eEEqvJd7rORYPCPoDWQT
X-Proofpoint-GUID: gNl5_XWhWA85eEEqvJd7rORYPCPoDWQT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_02,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309070086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 09:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187369

From: Soumya Sambu <soumya.sambu@windriver.com>

Xmlsoft Libxml2 v2.11.0 was discovered to contain a global buffer overflow via
the xmlSAX2StartElement() function at /libxml2/SAX2.c. This vulnerability
allows attackers to cause a Denial of Service (DoS) via supplying a crafted XML
file.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-39615

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../libxml/libxml2/CVE-2023-39615-0001.patch  | 37 ++++++++++
 .../libxml/libxml2/CVE-2023-39615-0002.patch  | 72 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  2 +
 3 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-39615-0001.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-39615-0002.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2023-39615-0001.patch b/meta/recipes-core/libxml/libxml2/CVE-2023-39615-0001.patch
new file mode 100644
index 0000000000..3506779c4c
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2023-39615-0001.patch
@@ -0,0 +1,37 @@
+From d0c3f01e110d54415611c5fa0040cdf4a56053f9 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Sat May 6 17:47:37 2023 +0200
+Subject: [PATCH 1/2] parser: Fix old SAX1 parser with custom callbacks
+
+For some reason, xmlCtxtUseOptionsInternal set the start and end element
+SAX handlers to the internal DOM builder functions when XML_PARSE_SAX1
+was specified. This means that custom SAX handlers could never work with
+that flag because these functions would receive the wrong user data
+argument and crash immediately.
+
+Fixes #535.
+
+CVE: CVE-2023-39615
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/d0c3f01e110d54415611c5fa0040cdf4a56053f9]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ parser.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/parser.c b/parser.c
+index 0f76577..b781c80 100644
+--- a/parser.c
++++ b/parser.c
+@@ -15069,8 +15069,6 @@ xmlCtxtUseOptionsInternal(xmlParserCtxtPtr ctxt, int options, const char *encodi
+     }
+ #ifdef LIBXML_SAX1_ENABLED
+     if (options & XML_PARSE_SAX1) {
+-        ctxt->sax->startElement = xmlSAX2StartElement;
+-        ctxt->sax->endElement = xmlSAX2EndElement;
+         ctxt->sax->startElementNs = NULL;
+         ctxt->sax->endElementNs = NULL;
+         ctxt->sax->initialized = 1;
+--
+2.40.0
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2023-39615-0002.patch b/meta/recipes-core/libxml/libxml2/CVE-2023-39615-0002.patch
new file mode 100644
index 0000000000..d922ddc730
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2023-39615-0002.patch
@@ -0,0 +1,72 @@
+From 235b15a590eecf97b09e87bdb7e4f8333e9de129 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Mon May 8 17:58:02 2023 +0200
+Subject: [PATCH 2/2] SAX: Always initialize SAX1 element handlers
+
+Follow-up to commit d0c3f01e. A parser context will be initialized to
+SAX version 2, but this can be overridden with XML_PARSE_SAX1 later,
+so we must initialize the SAX1 element handlers as well.
+
+Change the check in xmlDetectSAX2 to only look for XML_SAX2_MAGIC, so
+we don't switch to SAX1 if the SAX2 element handlers are NULL.
+
+CVE: CVE-2023-39615
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/235b15a590eecf97b09e87bdb7e4f8333e9de129]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ SAX2.c   | 11 +++++++----
+ parser.c |  5 +----
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/SAX2.c b/SAX2.c
+index 0319246..f7c77c2 100644
+--- a/SAX2.c
++++ b/SAX2.c
+@@ -2842,20 +2842,23 @@ xmlSAXVersion(xmlSAXHandler *hdlr, int version)
+ {
+     if (hdlr == NULL) return(-1);
+     if (version == 2) {
+-	hdlr->startElement = NULL;
+-	hdlr->endElement = NULL;
+	hdlr->startElementNs = xmlSAX2StartElementNs;
+	hdlr->endElementNs = xmlSAX2EndElementNs;
+	hdlr->serror = NULL;
+	hdlr->initialized = XML_SAX2_MAGIC;
+ #ifdef LIBXML_SAX1_ENABLED
+     } else if (version == 1) {
+-	hdlr->startElement = xmlSAX2StartElement;
+-	hdlr->endElement = xmlSAX2EndElement;
+	hdlr->initialized = 1;
+ #endif /* LIBXML_SAX1_ENABLED */
+     } else
+         return(-1);
++#ifdef LIBXML_SAX1_ENABLED
++    hdlr->startElement = xmlSAX2StartElement;
++    hdlr->endElement = xmlSAX2EndElement;
++#else
++    hdlr->startElement = NULL;
++    hdlr->endElement = NULL;
++#endif /* LIBXML_SAX1_ENABLED */
+     hdlr->internalSubset = xmlSAX2InternalSubset;
+     hdlr->externalSubset = xmlSAX2ExternalSubset;
+     hdlr->isStandalone = xmlSAX2IsStandalone;
+diff --git a/parser.c b/parser.c
+index b781c80..738dbee 100644
+--- a/parser.c
++++ b/parser.c
+@@ -1109,10 +1109,7 @@ xmlDetectSAX2(xmlParserCtxtPtr ctxt) {
+     if (ctxt == NULL) return;
+     sax = ctxt->sax;
+ #ifdef LIBXML_SAX1_ENABLED
+-    if ((sax) &&  (sax->initialized == XML_SAX2_MAGIC) &&
+-        ((sax->startElementNs != NULL) ||
+-         (sax->endElementNs != NULL) ||
+-         ((sax->startElement == NULL) && (sax->endElement == NULL))))
++    if ((sax) && (sax->initialized == XML_SAX2_MAGIC))
+         ctxt->sax2 = 1;
+ #else
+     ctxt->sax2 = 1;
+--
+2.40.0
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index 9241b279e4..437bccf4ed 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -27,6 +27,8 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2022-40304.patch \
            file://CVE-2023-28484.patch \
            file://CVE-2023-29469.patch \
+           file://CVE-2023-39615-0001.patch \
+           file://CVE-2023-39615-0002.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-- 
2.40.0


