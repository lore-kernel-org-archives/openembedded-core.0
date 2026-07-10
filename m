Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38732C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 13:09:50 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12203.1783688980176535799
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 06:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ajxUPyR4;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4723; q=dns/txt;
  s=iport01; t=1783688980; x=1784898580;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6nVBRE92YAj4bGXzdgG1XkJNFx443QrcSmRSH8mD0io=;
  b=ajxUPyR4qsMRFOj54out26DayqR7XYTivuO3kLwSIFvQ9obI4mNabxEN
   lGz4RS+YSu78A6LM5cNuh4Cuifi+3qQi6S9LGomrdwLgIUUxe1h8wxo+E
   LZZsowtLB6HBujpMXmYuR795P4nA3d1xyR2h1oJ9TUvC6VRW5tF31+gcC
   b056iGTgcqVA2atBVifg1Q7ZWU5KT9qpzVK6K++Im1Q2G4auLFFng/Adn
   SWVLXFC9pxWNmn9LeD+UGXuFJHso3thfzrRPNZx3Vb6GT5rMpkaRd+cms
   +4ZrpmWeDOyq/eLJeIRuVbkBJu7puvqqZqNq1KO5v6DzskXxXPQz4Gh4c
   Q==;
X-CSE-ConnectionGUID: uN8eyn76SCewZBolz0Y7sA==
X-CSE-MsgGUID: NFcn46oGRTiVSJJbsdzwWg==
X-IPAS-Result: =?us-ascii?q?A0BDAgBH7lBq/4r/Ja1aglmCV3RfQkmUKY4IkjeBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGEP44VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBOAEYAVkDAQJPCyMhgwIBgjoDNgIBEbk/GjeCLIEBgygBPwJDU?=
 =?us-ascii?q?NhJDYJYAQsUAYE4hT+CfIUjWxgBhHwnGxuBcoR+gQWBGkIBAYglBIIigQyBW?=
 =?us-ascii?q?h6FB4prSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BWYECh?=
 =?us-ascii?q?HkjHwM5f4EwdUp5LXMSHgqBUoIWVAMLGA1IESw3FBsEPm4HjT4XD4I+gQ4sg?=
 =?us-ascii?q?UMRpk6gHnEKKIN1jCGPPoV8GjOqbAuYfY4KhAmSR4RpgWg8gSgfCwdwFYJuA?=
 =?us-ascii?q?TMJShkPjjiDa4F/zFskNQIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:ae0c3qoov7XxYZc094WhOZBpFG1eBmJJZBIvgKrLsJaIsI4StFCzt
 garIBnQPvqOZTTwLtFyb96/9RwBvcfTyNRqHAs6+3w8ECkW9OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8EM35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0vtRUWxf8
 6NGExsAcSKpgOakmIPkUcA506zPLOGzVG8ekmtrwTecCbMtRorOBv2To9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5MWPrSn8/w7pX7WzFVpUicuaowy2PS1wd2lrPqNbI5f/TXHZoEwx7D/
 z2uE2LRJD8RMoDBzhW/znOSvc3tlzj3Sp0tG+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZMZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:b8EMZKnLUlhtvvAm0L+1Bz34NIzpDfIc3DAbv31ZSRFFG/Fw8P
 re/sjzuiWbtN98YhwdcLO7Scq9qBHnlKKdiLN5VdzJYOCMggSVxe9ZgbcKuweBJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadE/DFCm5rY4ts3CBxWPGVXV50=
X-Talos-CUID: 9a23:6zqQkGPXokRlAO5DRQ83+V8SRZ4eWXDC/l3XJ13gODlyYejA
X-Talos-MUID: =?us-ascii?q?9a23=3Ag/QS3AyeFcgSR7vDw48DhhVuA9CaqIKAA0ZRz5I?=
 =?us-ascii?q?pgfWFCxdSGT2GgCaofYByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="507950317"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jul 2026 13:09:39 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 45BDA180001CD
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:09:39 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id E6FF4CC2EC3; Fri, 10 Jul 2026 06:09:38 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 05/10] expat: fix CVE-2026-56410
Date: Fri, 10 Jul 2026 06:09:11 -0700
Message-ID: <20260710130912.2821509-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240645

From: Deepak Rathore <deeratho@cisco.com>

These patches apply the upstream fixes shown in [1] and [2], as
referenced by [3].

[1] https://github.com/libexpat/libexpat/commit/deeb97f7c88d17a16b0ea2521a13733abc283347
[2] https://github.com/libexpat/libexpat/commit/cee20e91bf14dc7f6d2fc48f0d70d86b2dc3afea
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-56410

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
new file mode 100644
index 0000000000..30fb59b2a3
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
@@ -0,0 +1,48 @@
+From 759b77a8439bcbf57c86900bc472d46d8ef70c92 Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Fri, 29 May 2026 17:51:25 +0530
+Subject: [PATCH] xmlwf: protect resolveSystemId from integer overflow
+
+CVE: CVE-2026-56410
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/deeb97f7c88d17a16b0ea2521a13733abc283347]
+
+Backport Changes:
+- Adapt the allocation hunk to the explicit cast used by Expat 2.7.5 and
+  include stdint.h for SIZE_MAX.
+
+(cherry picked from commit deeb97f7c88d17a16b0ea2521a13733abc283347)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlfile.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/expat/xmlwf/xmlfile.c b/expat/xmlwf/xmlfile.c
+index c4eb839f..31a40209 100644
+--- a/expat/xmlwf/xmlfile.c
++++ b/expat/xmlwf/xmlfile.c
+@@ -42,6 +42,7 @@
+ #include "expat_config.h"
+ 
+ #include <stdio.h>
++#include <stdint.h>
+ #include <stdlib.h>
+ #include <stddef.h>
+ #include <string.h>
+@@ -138,8 +139,13 @@ resolveSystemId(const XML_Char *base, const XML_Char *systemId,
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
index 0000000000..63d574f591
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch
@@ -0,0 +1,40 @@
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
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index 578d745e61..dcccc7597e 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -15,6 +15,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56408.patch;striplevel=2 \
            file://CVE-2026-56404.patch;striplevel=2 \
            file://CVE-2026-56405.patch;striplevel=2 \
+           file://CVE-2026-56410_p1.patch;striplevel=2 \
+           file://CVE-2026-56410_p2.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


