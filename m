Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA4FC55174
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 05:57:03 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.701.1785477409296444506
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 22:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iC87SDQ2;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2728; q=dns/txt;
  s=iport01; t=1785477414; x=1786687014;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=tQvOlv9dGzJQZyzlEr2d9XE7RTLvSgFkW7RXZt3VOtE=;
  b=iC87SDQ2HIbSM+O2NqAjbtBADqZ6hGDXb8lNWGDwBkM/PR6HBi/UxCpp
   nMXwMvc0r3PtbUios2r4fi/8zrSjJ0ub4XqJNwg/90AkgetoV6Maing0M
   F2Grc0nOmrfId6zxKs7APne0Qs7dWDjqNOtX+lLht0Mbx1R/P/EZHhuKm
   UdoiWb+aYirKLiqiAHIUw90LucAEduVVjWAASv0X20ZOkTu1QjbQSQRfS
   QCuN3IZq7bmLdLJfabmcV81IzzOuGLkF4aq6Kc5EvgX6gWapvyQOKFy+i
   NDlYOI1j2YDvXrzUAb8TXt8ui3r6rn5fBEM9wNzsSRC+nEjWWKyDSsAFj
   w==;
X-CSE-ConnectionGUID: Jdg5G7KZSiyypssBbMNPTg==
X-CSE-MsgGUID: LSbKwmrMS5W97LMXOn9Gcg==
X-IPAS-Result: =?us-ascii?q?A0AaAAD1N2xq/5L/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ0X0JJjHKHN4IhA4tkkjeBfg8BAQEPRA0EAQGEP0YCjWYCJjQJD?=
 =?us-ascii?q?gECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgECAQMyARgBP?=
 =?us-ascii?q?RwDAQIvIAsjCBEIgwIBgjoDNwMRujAaN4IsgQGDKAE/AkNQ2EkNglgBCxQBg?=
 =?us-ascii?q?TgBhT6CfYUjXBgBhHwnGxuBcoEUAYNpgQWBGkIBAYIGJ4V4BIIigQyBWh6EK?=
 =?us-ascii?q?4wSSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwcFgR2BKy+EUyMZN?=
 =?us-ascii?q?nyBL3VKdS1qEheBGoMxAoJfAwsYDUgRLDcUGQQ+bgeNaSCCPgE9UQErgUMRp?=
 =?us-ascii?q?C2CHqAhcQoog3WMIY8+hXwaM6psC5h9jgqECZJHhGmBaDyBKB8LB3AVgm4BM?=
 =?us-ascii?q?wlKGQ+OOINrgX/MQzw1AgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:RDiLQqPF758dxpvvrR30lsFynXyQoLVcMsEvi/4bfWQNrUoh0WEHy
 TMWXmmAbP2IYGv1c48gOYy29RhXu56HmtZiQHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6gGYsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69diAxwZYq4qwedmEHlV7
 tYSDRY1Uh/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmIS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMnwsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQsieazaoWKJ4ziqcN9un2Sh
 X3D5UHCXy5La/i6+R2Do12nibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MskCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:t9/kSKEd5tX1gArypLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3Aci7Yo2lFEBaC7WrWs4SR+whIzZjXOV/Rwyr/fGy?=
 =?us-ascii?q?KMmd4WaWOUnWa3YVcr8U7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AEtFumg0yusEJYhOre627iZ3FgzUjx5+kK18Ii7A?=
 =?us-ascii?q?95vbVaghVCxCb3Ru8Tdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,195,1779148800"; 
   d="scan'208";a="516627758"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Jul 2026 05:56:54 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 9EDAB18000203
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:56:53 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id B6FAACC037D; Fri, 31 Jul 2026 11:26:51 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 04/10] expat: fix CVE-2026-56405
Date: Fri, 31 Jul 2026 11:26:19 +0530
Message-Id: <20260731055625.4187716-5-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260731055625.4187716-1-deeratho@cisco.com>
References: <20260717060437.2910653-1-deeratho@cisco.com>
 <20260731055625.4187716-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242401

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/2c6c42d33689f6b266a5267b639e03cde17e53c0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56405

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes in v2:
- Rebased the recipe SRC_URI context on current Scarthgap after upstream
  added Expat CVE-2026-41080-* and CVE-2026-45186-* patch entries.
- No change to the embedded upstream source patch.

 .../expat/expat/CVE-2026-56405.patch          | 30 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56405.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56405.patch b/meta/recipes-core/expat/expat/CVE-2026-56405.patch
new file mode 100644
index 0000000000..6759517341
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56405.patch
@@ -0,0 +1,30 @@
+From 49ba5bdafa7aaee9b77a32ffaa798e625bd46e73 Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Fri, 29 May 2026 11:45:17 +0530
+Subject: [PATCH 05/17] lib: Protect function getAttributeId from signed
+ integer overflow
+
+CVE: CVE-2026-56405
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/2c6c42d33689f6b266a5267b639e03cde17e53c0]
+
+(cherry picked from commit 2c6c42d33689f6b266a5267b639e03cde17e53c0)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 9d21e136..80ad0811 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -7312,6 +7312,10 @@ getAttributeId(XML_Parser parser, const ENCODING *enc, const char *start,
+     } else {
+       int i;
+       for (i = 0; name[i]; i++) {
++        /* Detect and prevent signed integer overflow */
++        if (i == INT_MAX) {
++          return NULL;
++        }
+         /* attributes without prefix are *not* in the default namespace */
+         if (name[i] == XML_T(ASCII_COLON)) {
+           int j;
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 5e3aef3b7e..6d71393b2a 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -65,6 +65,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56403_p2.patch;striplevel=2 \
            file://CVE-2026-56408.patch;striplevel=2 \
            file://CVE-2026-56404.patch;striplevel=2 \
+           file://CVE-2026-56405.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


