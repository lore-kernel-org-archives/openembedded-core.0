Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C345C4450F
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 06:05:37 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7689.1784268333310355865
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 23:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WebiZFR7;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5073; q=dns/txt;
  s=iport01; t=1784268333; x=1785477933;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=PsybrWQcpvCKR/WgIPf64UWvXQuE7BW6elJU71LffIo=;
  b=WebiZFR7OR3oqfaa7nUMEGpIvJnacukO/u1NA2HCof+vvNNS5/kn7q00
   vVtbGd0qF0G+TTBL9HjFW20+oEx61Z3uuZVFSmGMChLK52Gz6KxI3Tx1R
   GjF9eDk/5r39wU09bGlwKoZZONk7S2JKq6cQKWn7d8B1uWRoqtR14ZEN2
   QeFSj6HL1/dtHP44qs+ns/WJOQahqW5DgNwPAJiyq9Gq9y99E63OYQgKp
   f0X8ocWzg5BpL+x+s7jS2RwTFXVUX89uJMQNuM0nHQVP/V5Iwwh/t7Cx6
   SOeYX1xtEG4DvlpiFdsM4q7TI6CLBRx+FLi2ejCCQezYCvXFB+XUREan5
   Q==;
X-CSE-ConnectionGUID: WxCdGvhRQk61JD9lDAK0CQ==
X-CSE-MsgGUID: aPtHJ5JhQN+aEFjAdp6gmA==
X-IPAS-Result: =?us-ascii?q?A0BIAgBIxVlq/4//Ja1aHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?QOLZJI3gX4PAQEBD0QNBAEBhD9GAo1SAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFgQ4Thk8NhloBAgEDMgEYAT0cAwECLyALIwgRCIMCAYI6A?=
 =?us-ascii?q?zcDEbx6GjeCLIEBgygBPwJDUNhJDYJYAQsUAYE4hT+CfYUjXBgBhHwnGxuBc?=
 =?us-ascii?q?oR+gQWBGkIBAYglBIIigQyBWh6Ec4sOSIEeA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EMGwcFgR2BOoEAhHYjHwM5f4EvdUp3LWoSF4FOghSBPgMLGA1IE?=
 =?us-ascii?q?Sw3FBsEPm4HjUgjgj+BDgErgUMRpkugIXEKKIN1jCGPPoV8GjOqbAuYfY4Kh?=
 =?us-ascii?q?AmSR4RpgWg8gSgfCwdwFYJuATMJShkPjjiDa4F/zEE8NQIJMgEBBwIHDgMLg?=
 =?us-ascii?q?WiRfgEB?=
IronPort-Data: A9a23:dc1gfqgFm6r0YM8hgmwZf0t/X161MREKZh0ujC45NGQN5FlHY01je
 htvWmnUbquDYWSjfY0lb42w/UgEucSHmIRrHQNrpX83Qi1jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMtPvd8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUn6s17Ln9Oz
 8UbdmkvQkGHq8uVmJmCH7wEasQLdKEHPasFsX1miDWcBvE8TNWbHePB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgx/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9J4XTG58JxRbEz
 o7A123BHjE4af6f8BzG+1+ChMbDhX30XatHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmAHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:lD80LajQ23pE2slh4/JpLSoph3BQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3AxLCDp2pFtb4kDGyIDDr8lxzmUf81WXHy0nfqGkz?=
 =?us-ascii?q?mUERFGbm5YHzI05oxxg=3D=3D?=
X-Talos-MUID: 9a23:w/REngtk3aIf3uGCaM2njQl+FOU1waSXLgMEvLsEksWcayN1EmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="511624384"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 06:05:32 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 2F78C18000270
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:05:32 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 507F9CC037D; Fri, 17 Jul 2026 11:35:30 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 05/10] expat: fix CVE-2026-56410
Date: Fri, 17 Jul 2026 11:34:32 +0530
Message-Id: <20260717060437.2910653-6-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260717060437.2910653-1-deeratho@cisco.com>
References: <20260717060437.2910653-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241144

From: Deepak Rathore <deeratho@cisco.com>

These patches apply the upstream fixes shown in [1] and [2], as
referenced by [3].

[1] https://github.com/libexpat/libexpat/commit/deeb97f7c88d17a16b0ea2521a13733abc283347
[2] https://github.com/libexpat/libexpat/commit/cee20e91bf14dc7f6d2fc48f0d70d86b2dc3afea
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-56410

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../expat/expat/CVE-2026-56410_p1.patch       | 46 +++++++++++++++++++
 .../expat/expat/CVE-2026-56410_p2.patch       | 39 ++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  2 +
 3 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
new file mode 100644
index 0000000000..0a685bb5d1
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
@@ -0,0 +1,46 @@
+From b454931c42290c9f0faf2a01f9634d82db636bac Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Fri, 29 May 2026 17:51:25 +0530
+Subject: [PATCH 06/17] xmlwf: protect resolveSystemId from integer overflow
+
+CVE: CVE-2026-56410
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/deeb97f7c88d17a16b0ea2521a13733abc283347]
+
+Backport Changes:
+- Adapt the allocation hunk to Scarthgap 2.6.4's explicit cast and
+  include stdint.h so SIZE_MAX is available.
+
+(cherry picked from commit deeb97f7c88d17a16b0ea2521a13733abc283347)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlfile.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/expat/xmlwf/xmlfile.c b/expat/xmlwf/xmlfile.c
+index 9c4f7f8d..ad691b12 100644
+--- a/expat/xmlwf/xmlfile.c
++++ b/expat/xmlwf/xmlfile.c
+@@ -41,6 +41,7 @@
+ #include "expat_config.h"
+ 
+ #include <stdio.h>
++#include <stdint.h>
+ #include <stdlib.h>
+ #include <stddef.h>
+ #include <string.h>
+@@ -130,8 +131,13 @@ resolveSystemId(const XML_Char *base, const XML_Char *systemId,
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
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch
new file mode 100644
index 0000000000..97977e6af5
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch
@@ -0,0 +1,39 @@
+From 7e6230212ddc4ea74115218fdbe5717e8e1c0f2b Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Sat, 30 May 2026 11:28:51 +0530
+Subject: [PATCH 07/17] xmlwf: guard each operator in resolveSystemId length
+ sum
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
+index ad691b12..4d2e3220 100644
+--- a/expat/xmlwf/xmlfile.c
++++ b/expat/xmlwf/xmlfile.c
+@@ -131,9 +131,17 @@ resolveSystemId(const XML_Char *base, const XML_Char *systemId,
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
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 615d404d56..ee4a88c5f9 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -56,6 +56,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56408.patch;striplevel=2 \
            file://CVE-2026-56404.patch;striplevel=2 \
            file://CVE-2026-56405.patch;striplevel=2 \
+           file://CVE-2026-56410_p1.patch;striplevel=2 \
+           file://CVE-2026-56410_p2.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

