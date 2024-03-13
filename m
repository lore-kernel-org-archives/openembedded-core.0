Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB189C54E58
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 22:40:19 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.10118.1710369615009153381
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 15:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=lvbI9ze3;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20240313224011b287e7cabddcaca61c-z297tb@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20240313224011b287e7cabddcaca61c
        for <openembedded-core@lists.openembedded.org>;
        Wed, 13 Mar 2024 23:40:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gEZeSklZZMYWw0qbY4ot+s2NMGV3NyF4JFmR5OV5cEQ=;
 b=lvbI9ze36+wayfirT8khJp73mlikEs8UQU0xbMaAMf5Of9XrDrTfdduHnpPRdyHBce8P9W
 A1vhjevXOpj8sqQ88N0scpWJwkq+is6N/uX3kd4Y6j73ZPApbrFuI0oAQHTRFKs7bpWXwDYL
 GNiVtDAg2gn/EHMib/558ucM0NbR8=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] expat: patch CVE-2024-28757
Date: Wed, 13 Mar 2024 23:39:24 +0100
Message-Id: <20240313223924.1221921-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 22:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197093

From: Peter Marko <peter.marko@siemens.com>

Picked patch from https://github.com/libexpat/libexpat/pull/842
which is referenced in the NVD CVE report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../expat/expat/CVE-2024-28757.patch          | 58 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.5.0.bb        |  1 +
 2 files changed, 59 insertions(+)
 create mode 100755 meta/recipes-core/expat/expat/CVE-2024-28757.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2024-28757.patch b/meta/recipes-core/expat/expat/CVE-2024-28757.patch
new file mode 100755
index 0000000000..768dab0c84
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2024-28757.patch
@@ -0,0 +1,58 @@
+From 1d50b80cf31de87750103656f6eb693746854aa8 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 4 Mar 2024 23:49:06 +0100
+Subject: [PATCH] lib/xmlparse.c: Detect billion laughs attack with isolated
+ external parser
+
+When parsing DTD content with code like ..
+
+  XML_Parser parser = XML_ParserCreate(NULL);
+  XML_Parser ext_parser = XML_ExternalEntityParserCreate(parser, NULL, NULL);
+  enum XML_Status status = XML_Parse(ext_parser, doc, (int)strlen(doc), XML_TRUE);
+
+.. there are 0 bytes accounted as direct input and all input from `doc` accounted
+as indirect input.  Now function accountingGetCurrentAmplification cannot calculate
+the current amplification ratio as "(direct + indirect) / direct", and it did refuse
+to divide by 0 as one would expect, but it returned 1.0 for this case to indicate
+no amplification over direct input.  As a result, billion laughs attacks from
+DTD-only input were not detected with this isolated way of using an external parser.
+
+The new approach is to assume direct input of length not 0 but 22 -- derived from
+ghost input "<!ENTITY a SYSTEM 'b'>", the shortest possible way to include an external
+DTD --, and do the usual "(direct + indirect) / direct" math with "direct := 22".
+
+GitHub issue #839 has more details on this issue and its origin in ClusterFuzz
+finding 66812.
+
+CVE: CVE-2024-28757
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/1d50b80cf31de87750103656f6eb693746854aa8]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index b884d82b5..d44baa68d 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7655,6 +7655,8 @@ copyString(const XML_Char *s, const XML_Memory_Handling_Suite *memsuite) {
+ 
+ static float
+ accountingGetCurrentAmplification(XML_Parser rootParser) {
++  //                                          1.........1.........12 => 22
++  const size_t lenOfShortestInclude = sizeof("<!ENTITY a SYSTEM 'b'>") - 1;
+   const XmlBigCount countBytesOutput
+       = rootParser->m_accounting.countBytesDirect
+         + rootParser->m_accounting.countBytesIndirect;
+@@ -7662,7 +7664,9 @@ accountingGetCurrentAmplification(XML_Parser rootParser) {
+       = rootParser->m_accounting.countBytesDirect
+             ? (countBytesOutput
+                / (float)(rootParser->m_accounting.countBytesDirect))
+-            : 1.0f;
++            : ((lenOfShortestInclude
++                + rootParser->m_accounting.countBytesIndirect)
++               / (float)lenOfShortestInclude);
+   assert(! rootParser->m_parentParser);
+   return amplificationFactor;
+ }
diff --git a/meta/recipes-core/expat/expat_2.5.0.bb b/meta/recipes-core/expat/expat_2.5.0.bb
index 7080f934d1..eb7ce1436e 100644
--- a/meta/recipes-core/expat/expat_2.5.0.bb
+++ b/meta/recipes-core/expat/expat_2.5.0.bb
@@ -10,6 +10,7 @@ VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 
 SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://run-ptest \
+           file://CVE-2024-28757.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.30.2


