Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0ABC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 03:15:37 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.3190.1645586135506507483
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 19:15:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 21N3FXCS029095
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 19:15:34 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 22 Feb 2022 19:15:33 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 19:15:33 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 22 Feb 2022 19:15:32 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] expat: fix CVE-2022-23990
Date: Wed, 23 Feb 2022 11:15:29 +0800
Message-ID: <20220223031529.31686-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 03:15:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162240

From: Kai Kang <kai.kang@windriver.com>

CVE: CVE-2022-23990

Based on Steve Sakoman's patch for branch dunfell, fix CVE-2022-23990
for expat in branch hardknott.

And correct indent as well.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../expat/expat/CVE-2022-23990.patch          | 49 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.10.bb       |  7 +--
 2 files changed, 53 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-23990.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-23990.patch b/meta/recipes-core/expat/expat/CVE-2022-23990.patch
new file mode 100644
index 0000000000..c599517b3e
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-23990.patch
@@ -0,0 +1,49 @@
+From ede41d1e186ed2aba88a06e84cac839b770af3a1 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Wed, 26 Jan 2022 02:36:43 +0100
+Subject: [PATCH] lib: Prevent integer overflow in doProlog (CVE-2022-23990)
+
+The change from "int nameLen" to "size_t nameLen"
+addresses the overflow on "nameLen++" in code
+"for (; name[nameLen++];)" right above the second
+change in the patch.
+
+Upstream-Status: Backport:
+https://github.com/libexpat/libexpat/pull/551/commits/ede41d1e186ed2aba88a06e84cac839b770af3a1
+
+CVE: CVE-2022-23990
+
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ lib/xmlparse.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 5ce31402..d1d17005 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5372,7 +5372,7 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+       if (dtd->in_eldecl) {
+         ELEMENT_TYPE *el;
+         const XML_Char *name;
+-        int nameLen;
++        size_t nameLen;
+         const char *nxt
+             = (quant == XML_CQUANT_NONE ? next : next - enc->minBytesPerChar);
+         int myindex = nextScaffoldPart(parser);
+@@ -5388,7 +5388,13 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+         nameLen = 0;
+         for (; name[nameLen++];)
+           ;
+-        dtd->contentStringLen += nameLen;
++
++        /* Detect and prevent integer overflow */
++        if (nameLen > UINT_MAX - dtd->contentStringLen) {
++          return XML_ERROR_NO_MEMORY;
++        }
++
++        dtd->contentStringLen += (unsigned)nameLen;
+         if (parser->m_elementDeclHandler)
+           handleDefault = XML_FALSE;
+       }
diff --git a/meta/recipes-core/expat/expat_2.2.10.bb b/meta/recipes-core/expat/expat_2.2.10.bb
index 074441dc2a..a851e54b2a 100644
--- a/meta/recipes-core/expat/expat_2.2.10.bb
+++ b/meta/recipes-core/expat/expat_2.2.10.bb
@@ -10,13 +10,14 @@ VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 
 SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://libtool-tag.patch \
-	   file://run-ptest \
-	   file://0001-Add-output-of-tests-result.patch \
+           file://run-ptest \
+           file://0001-Add-output-of-tests-result.patch \
            file://CVE-2022-22822-27.patch \
            file://CVE-2021-45960.patch \
            file://CVE-2021-46143.patch \
            file://CVE-2022-23852.patch \
-	  "
+           file://CVE-2022-23990.patch \
+           "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
 
-- 
2.17.1


