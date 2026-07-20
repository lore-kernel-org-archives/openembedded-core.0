Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D03C4452C
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 12:20:29 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7643.1784550021939097819
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 05:20:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LZ3urYYc;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5250; q=dns/txt;
  s=iport01; t=1784550021; x=1785759621;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=cDYwSixIx3mpUczVrurce3jxamIEb3Ym7RhkY9JhGm4=;
  b=LZ3urYYcfjo4NPeAyT7ImfYCpHkb6Owc0wHkYDjfkF146PFqW6hwj3M+
   1OAOgNDq4w6nj2z+PYYQ1yuqvYJb/3DZteQL894pw3//IRdQS74o+bpD9
   Kow7CGuay3066TpnB1113mRvN0E2IVYvXwidLNPhHSYEFlyGKegAcYamq
   9sFMYDzlPwywWmMSEXNTWlJOehYeZwoPKaywhbdgT+AZq5pek1zy5ra8U
   f2B7OBUiPd7wmkUX5smIiUzARkN3G88RBwLp4LEVk875yihdEwxKDosFM
   UTlAyNFvqe922tpXoB5F0c0A2DHRLdioKWK7EPJ7zfjSveC7/zkftbHD5
   w==;
X-CSE-ConnectionGUID: geVJztLlQTqnT/5+gJD3Zw==
X-CSE-MsgGUID: SuCPOXLsRh2OqOtq9bHTrA==
X-IPAS-Result: =?us-ascii?q?A0BJAgAZEV5q/43/Ja1aglmCV3RfQkmUKYIhA4tkkjcUg?=
 =?us-ascii?q?WoPAQEBD0QNBAEBhD9GAo1TAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NhloBAgEDMgEYAT0cAwECLyALIwgRCIMCAYI6AzcDEbwvG?=
 =?us-ascii?q?jeCLIEBgygBPwJDUNhJDYJYAQsUAYE4hT+CfYUjXBgBhHwnGxuBcoR+gQWBG?=
 =?us-ascii?q?kIBAYFGhl8EgiKBDIFaHo9uSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F?=
 =?us-ascii?q?4EMGwcFgR2BOoEChHQjHwM5f4EvdUp3LWoSF4EmghICgTsCBwMLGA1IESw3F?=
 =?us-ascii?q?BkEPm4HjTwjgj89UQErgUMRpkugIXEKKIN1jCGPPoV8GjOqbAuYfY4KhAmRX?=
 =?us-ascii?q?2iEaYFoPIEoHwsHcBWCbgEzCUoZD444g2uBf8gPPDUCCTIBAQcCBw4DC4Fok?=
 =?us-ascii?q?X4BAQ?=
IronPort-Data: A9a23:+VQ7tqMuOccAqU7vrR30lsFynXyQoLVcMsEvi/4bfWQNrUol32cHz
 WcbWW/QbK2KNjf2e4pxPImx9R8CvZfRy9YyHHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6gWYsbwr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/pjMmMkIakcw9puB10Jq
 L8XChxWXA/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmFS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzNXwsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQsieO3bICJK4HiqcN9pVuzn
 kX223/DAks9LfuD0GuP0k62r7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++Mv0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXLIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:j01AVKOZBwQGUsBcTu2jsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:t7Yh5W/OrsdPolD00BaVv0EZJOI3blnZ9UvJJXP/VCVmapHOe0DFrQ==
X-Talos-MUID: 9a23:vBV5kwkZi+m8N1brMcn5dnpZKexQxJSKE3oNy7IfnNWdZCZQBy202WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208";a="513242495"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 12:20:16 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id B13FC180005DD
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:20:15 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id D46F5CC037D; Mon, 20 Jul 2026 17:50:13 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH v2 05/10] expat: fix CVE-2026-56410
Date: Mon, 20 Jul 2026 17:46:10 +0530
Message-Id: <20260720121615.2520859-6-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720121615.2520859-1-deeratho@cisco.com>
References: <20260710130809.2817559-1-deeratho@cisco.com>
 <20260720121615.2520859-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:20:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241383

From: Deepak Rathore <deeratho@cisco.com>

These patches apply the upstream fixes shown in [1] and [2], as
referenced by [3].

[1] https://github.com/libexpat/libexpat/commit/deeb97f7c88d17a16b0ea2521a13733abc283347
[2] https://github.com/libexpat/libexpat/commit/cee20e91bf14dc7f6d2fc48f0d70d86b2dc3afea
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-56410

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
- Changes from v1 to v2:
- Drop the Wrynose-only stdint.h include from CVE-2026-56410_p1.patch
  because current Wrynose already provides it through expat.h via OE-Core
  commit 21042df15008.
- Keep Backport Changes only for the remaining older malloc-cast context
  adjustment.

 .../expat/expat/CVE-2026-56410_p1.patch       | 40 ++++++++++++++++++
 .../expat/expat/CVE-2026-56410_p2.patch       | 41 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.7.5.bb        |  2 +
 3 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
new file mode 100644
index 0000000000..aa4378f1b7
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
@@ -0,0 +1,40 @@
+From 759b77a8439bcbf57c86900bc472d46d8ef70c92 Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Fri, 29 May 2026 17:51:25 +0530
+Subject: [PATCH] xmlwf: protect resolveSystemId from integer overflow
+
+CVE: CVE-2026-56410
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/deeb97f7c88d17a16b0ea2521a13733abc283347]
+
+Backport Changes:
+- Adjust the removed allocation line for Wrynose's explicit malloc cast while
+  keeping upstream's overflow checks and final allocation logic.
+
+(cherry picked from commit deeb97f7c88d17a16b0ea2521a13733abc283347)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlfile.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/expat/xmlwf/xmlfile.c b/expat/xmlwf/xmlfile.c
+index c4eb839f..31a40209 100644
+--- a/expat/xmlwf/xmlfile.c
++++ b/expat/xmlwf/xmlfile.c
+@@ -138,8 +138,13 @@ resolveSystemId(const XML_Char *base, const XML_Char *systemId,
+ #endif
+   )
+     return systemId;
+-  *toFree = (XML_Char *)malloc((tcslen(base) + tcslen(systemId) + 2)
+-                               * sizeof(XML_Char));
++  const size_t charsRequired = tcslen(base) + tcslen(systemId) + 2;
++
++  /* Detect and prevent integer overflow */
++  if (charsRequired > SIZE_MAX / sizeof(XML_Char))
++    return systemId;
++
++  *toFree = malloc(charsRequired * sizeof(XML_Char));
+   if (! *toFree)
+     return systemId;
+   tcscpy(*toFree, base);
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch
new file mode 100644
index 0000000000..71f3122602
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch
@@ -0,0 +1,41 @@
+From f16fa442eaa81bfceec5302d977219959eaac7b7 Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Sat, 30 May 2026 11:28:51 +0530
+Subject: [PATCH] xmlwf: guard each operator in resolveSystemId length sum
+
+CVE: CVE-2026-56410
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/cee20e91bf14dc7f6d2fc48f0d70d86b2dc3afea]
+
+(cherry picked from commit cee20e91bf14dc7f6d2fc48f0d70d86b2dc3afea)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlfile.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/expat/xmlwf/xmlfile.c b/expat/xmlwf/xmlfile.c
+index 31a40209..15c69217 100644
+--- a/expat/xmlwf/xmlfile.c
++++ b/expat/xmlwf/xmlfile.c
+@@ -139,9 +139,17 @@ resolveSystemId(const XML_Char *base, const XML_Char *systemId,
+ #endif
+   )
+     return systemId;
+-  const size_t charsRequired = tcslen(base) + tcslen(systemId) + 2;
++  const size_t baseLen = tcslen(base);
++  const size_t systemIdLen = tcslen(systemId);
+ 
+-  /* Detect and prevent integer overflow */
++  /* Detect and prevent integer overflow in the addition (without risking
++     underflow) */
++  if (baseLen > SIZE_MAX - systemIdLen || baseLen > SIZE_MAX - systemIdLen - 2)
++    return systemId;
++
++  const size_t charsRequired = baseLen + systemIdLen + 2;
++
++  /* Detect and prevent integer overflow in the multiplication */
+   if (charsRequired > SIZE_MAX / sizeof(XML_Char))
+     return systemId;
+ 
+-- 
+2.43.7
+
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index 789fd7e077..5c93b15484 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -24,6 +24,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56408.patch;striplevel=2 \
            file://CVE-2026-56404.patch;striplevel=2 \
            file://CVE-2026-56405.patch;striplevel=2 \
+           file://CVE-2026-56410_p1.patch;striplevel=2 \
+           file://CVE-2026-56410_p2.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6

