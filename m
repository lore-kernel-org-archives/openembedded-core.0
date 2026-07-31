Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43193C5516D
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 05:57:13 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.708.1785477425151479112
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 22:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GRIY/HIr;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3384; q=dns/txt;
  s=iport01; t=1785477425; x=1786687025;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=kfdVhrPEfWaUK2Nb9DUjW00l+5946U04G7vukiNyxWc=;
  b=GRIY/HIrQfdHtk9YcGrkRmP/bpjEPxTz+rLAdD67i14PG0VpNJDECj9r
   b03Bva+RdB7xjc3Fo1D99FIwinxQEvEOd3/SeuVtMTy/9x3mImQPYD1ff
   wVN6+uenfhGPAieGhkOkS73UIPehUyzM79pCv7yfv9VxnN49q9gqqNMKX
   AGnPXraEavvX5F8ynahlK1A4UK7WNJ5fGmPzcWCwXhSR5SwnJQXuZLfeo
   ArA+T2c+c5vGZTXJmVJszJnHHv0ZRaaU8hAyueuLYL99iPVc15YYMk7Mq
   794Dh4nciXj6IdpNknmZEFWttl6evw39BaQk9a9GKVh+QljwwZRbGvh3Q
   g==;
X-CSE-ConnectionGUID: 9cpxPBfcRAmT8yGu0dBh0Q==
X-CSE-MsgGUID: qpNVEC/5Sge2pWm+tyiITg==
X-IPAS-Result: =?us-ascii?q?A0BJAgC2OGxq/5H/Ja1aHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?QOLZJI3gX4PAQEBD0QNBAEBhD9GAo1mAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFgQ4Thk8NhloBAgEDJwsBGAE9HAMBAi8gCyMIEQiDAgGCO?=
 =?us-ascii?q?gM3AxG6NBo3gXkzgQGDKAE/AkNQ2EkNglgBCxQBgTiFP4J9hSNcGAGEfCcbG?=
 =?us-ascii?q?4FygRWDaYEFgRpCAQGIJQSCDRWBDIFaHoEygnmCM4lfSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4ENGwcFgR2BKy+EUyMZNnyBL3VKdS1qEheBGoMxA?=
 =?us-ascii?q?oJfAwsYDUgRLDcUGQQ+bgeNaSCCPgE9UQErRn0RZ6VkoCFxCiiDdYwhjz6Ff?=
 =?us-ascii?q?BozqmwLmH2OCoQJkkeEaYFoPIEoHwsHcBU7gjMBMwlKGQ+OLQsLg2CBf8xDP?=
 =?us-ascii?q?DUCCTIBAQcCBw4DC4FokR5gAQE?=
IronPort-Data: A9a23:TZ5izKuiugWRjby+MlalzzMmkefnVAdfMUV32f8akzHdYApBsoF/q
 tZmKTjSPKyMamejf90ka4ri/RkE68CAzd9gQQc4+SpkQX8SgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/3Y8Es11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwq+1vEVlk+
 /ciATUxPgGsmrq66rLjc7w57igjBJGD0II3oHpsy3TdSP0hW52GG/WM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtKYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUoHTGJoPxRzA9
 goq+UzgGjckGffYlAGK/yi0ueqMgTL6eb4dQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YRLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:ZaaQmaOJ0iVqIMBcTu2jsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:F24zsG1lwyNc1uSu+MoJyLxfS8s9YkX3wnzqCkqEWXdGVeWZY1/IwfYx
X-Talos-MUID: 9a23:i3RS9wQ48qLojxCPRXT1nBdcGewvvp+hBRoVrpBFp9iFFBB/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,195,1779148800"; 
   d="scan'208";a="515723208"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Jul 2026 05:57:04 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 0EA4B1800044C
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:57:04 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 2864BCC037D; Fri, 31 Jul 2026 11:27:02 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 08/10] expat: fix CVE-2026-56411
Date: Fri, 31 Jul 2026 11:26:23 +0530
Message-Id: <20260731055625.4187716-9-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260731055625.4187716-1-deeratho@cisco.com>
References: <20260717060437.2910653-1-deeratho@cisco.com>
 <20260731055625.4187716-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242405

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/528a4e5017e1bd3b48b689fd0c131df940ae3ea5
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56411

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes in v2:
- Rebased the recipe SRC_URI context on current Scarthgap after upstream
  added Expat CVE-2026-41080-* and CVE-2026-45186-* patch entries.
- No change to the embedded upstream source patch.

 .../expat/expat/CVE-2026-56411.patch          | 50 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56411.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56411.patch b/meta/recipes-core/expat/expat/CVE-2026-56411.patch
new file mode 100644
index 0000000000..c6dd601f20
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56411.patch
@@ -0,0 +1,50 @@
+From 5e696e78f8c4a709c4f774973b142e57090c4364 Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Tue, 2 Jun 2026 13:13:34 +0530
+Subject: [PATCH 11/17] xmlwf: protect notation list allocation from integer
+ overflow
+
+CVE: CVE-2026-56411
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/528a4e5017e1bd3b48b689fd0c131df940ae3ea5]
+
+Backport Changes:
+- Use Scarthgap 2.6.4 freeNotations cleanup and return directly
+  because the newer shared cleanUp label is absent.
+
+(cherry picked from commit 528a4e5017e1bd3b48b689fd0c131df940ae3ea5)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlwf.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
+index bd5f68a4..6a3d31b7 100644
+--- a/expat/xmlwf/xmlwf.c
++++ b/expat/xmlwf/xmlwf.c
+@@ -387,9 +387,9 @@ static void XMLCALL
+ endDoctypeDecl(void *userData) {
+   XmlwfUserData *data = (XmlwfUserData *)userData;
+   NotationList **notations;
+-  int notationCount = 0;
++  size_t notationCount = 0;
+   NotationList *p;
+-  int i;
++  size_t i;
+ 
+   /* How many notations do we have? */
+   for (p = data->notationListHead; p != NULL; p = p->next)
+@@ -401,6 +401,14 @@ endDoctypeDecl(void *userData) {
+     return;
+   }
+ 
++  /* Detect and prevent integer overflow in the multiplication, mirroring
++     the guards in xcsdup() and resolveSystemId() */
++  if (notationCount > SIZE_MAX / sizeof(NotationList *)) {
++    fprintf(stderr, "Unable to sort notations");
++    freeNotations(data);
++    return;
++  }
++
+   notations = malloc(notationCount * sizeof(NotationList *));
+   if (notations == NULL) {
+     fprintf(stderr, "Unable to sort notations");
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 0f996f882b..fb36108eaf 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -71,6 +71,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56406-dependent.patch;striplevel=2 \
            file://CVE-2026-56406.patch;striplevel=2 \
            file://CVE-2026-56409.patch;striplevel=2 \
+           file://CVE-2026-56411.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


