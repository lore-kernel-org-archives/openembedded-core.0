Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91986C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 05:51:50 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.3757.1648705909228935193
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 22:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22V5pm1P018524
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 22:51:48 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 22V5plGH008282
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 22:51:48 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 30 Mar 2022 22:51:47 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 30 Mar 2022 22:51:47 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 30 Mar 2022 22:51:46 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 2/3] expat: fix CVE-2022-25314
Date: Thu, 31 Mar 2022 13:51:38 +0800
Message-ID: <20220331055139.1975-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220331055139.1975-1-kai.kang@windriver.com>
References: <20220331055139.1975-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 05:51:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163802

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2022-25314 for expat.

CVE: CVE-2022-25314

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../expat/expat/CVE-2022-25314.patch          | 35 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.10.bb       |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25314.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-25314.patch b/meta/recipes-core/expat/expat/CVE-2022-25314.patch
new file mode 100644
index 0000000000..56e875894e
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-25314.patch
@@ -0,0 +1,35 @@
+CVE: CVE-2022-25314
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/efcb3474]
+
+Ref:
+* https://github.com/libexpat/libexpat/pull/560
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From efcb347440ade24b9f1054671e6bd05e60b4cafd Mon Sep 17 00:00:00 2001
+From: Samanta Navarro <ferivoz@riseup.net>
+Date: Tue, 15 Feb 2022 11:56:57 +0000
+Subject: [PATCH] Prevent integer overflow in copyString
+
+The copyString function is only used for encoding string supplied by
+the library user.
+---
+ expat/lib/xmlparse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 4b43e613..a39377c2 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7412,7 +7412,7 @@ getElementType(XML_Parser parser, const ENCODING *enc, const char *ptr,
+ 
+ static XML_Char *
+ copyString(const XML_Char *s, const XML_Memory_Handling_Suite *memsuite) {
+-  int charsRequired = 0;
++  size_t charsRequired = 0;
+   XML_Char *result;
+ 
+   /* First determine how long the string is */
+-- 
+2.33.0
+
diff --git a/meta/recipes-core/expat/expat_2.2.10.bb b/meta/recipes-core/expat/expat_2.2.10.bb
index 7454718dca..0ab93bd93d 100644
--- a/meta/recipes-core/expat/expat_2.2.10.bb
+++ b/meta/recipes-core/expat/expat_2.2.10.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
            file://CVE-2022-25236-1.patch \
            file://CVE-2022-25236-2.patch \
            file://CVE-2022-25313.patch \
+           file://CVE-2022-25314.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.17.1


