Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7E0C4452B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 12:20:08 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7663.1784549999574067847
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 05:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=g5e1hdfK;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6742; q=dns/txt;
  s=iport01; t=1784549999; x=1785759599;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=uarbfuHBWC3VVxxbc1eSckFXL9uK+maEmd9OmN4/Cwo=;
  b=g5e1hdfKrZ5LU8Jy2z4NIapx5m+7u3vhuLjx3islDSpYwwca5mDiWeoh
   nPOA8hHjsB/tQZXSMlfuRQlw8w6OYAFG9KZmosqMh2EbgCG1Di91RJTYf
   JKfJNWiOyj6WFwYpEQ+51osY5QQk1T9FPhGfWKRdk1g4oLSPbxk7UaFcK
   xNTU4IAS0uoWxJjW0hvWOvIHET368vo9PcrVJzCs9Gecm1KXmAQRC+c1i
   uYU8KueE2Fm+J5BogK3W5TWUNpF6L+q8/Mw8u5AuNleRlA1JyOEglhCRD
   /a5uVH/u2Q3Ao2UoJy7W2CJbhZHVYnkuWMJGwTLvyobRV6wuILIxBLB9U
   w==;
X-CSE-ConnectionGUID: 1wyL2hYgSTCNelShSnOXuQ==
X-CSE-MsgGUID: 9DXiFTcgQTax2n076nZgww==
X-IPAS-Result: =?us-ascii?q?A0BJAgCWEV5q/4z/Ja1aglmCV3RfQkmUKYIhA4ETnQiBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjVMCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GWgECAQMnCwEYAT0cAwECLysjCBEIgwIBgnQDEbxDGjeBe?=
 =?us-ascii?q?TOBAYMoAT8CQ1DbLgELFAGBOIU/iCBcGAGEfCcbG4FygRWCc3aBBYFcAQGBJ?=
 =?us-ascii?q?4Z+BIIigQyBWh6PbkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHB?=
 =?us-ascii?q?YEdgTqBAoR0Ix8DOX+BL3VKdy1qEheBJoISAoE7AgcDCxgNSBEsNxQZBD5uB?=
 =?us-ascii?q?408I4I/PVEBK4FDESmTbpAWgh6hEgoog3WMIZU6GjOqbAuYfY4KlgNNhGmBa?=
 =?us-ascii?q?DyBKB8LB3AVgm4BMwlKGQ+OLQsLg2CBf8ZGPDUCCTIBAQcCBw4DC4FokACBf?=
 =?us-ascii?q?gEB?=
IronPort-Data: A9a23:B2fBZqlHMAvuHkA+LL1Xs3vo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbCmyOOv2NY2f3Ldh3Po62/EoHvsWGy4BgSVY5+X9nQltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLsfrb9XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FdQH68ItAVBBz
 sAzDj0JVRC4gcWG3YvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiYBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYj/7C7pm9AusrnXyfidRtFKSjaE2+GPUigd21dABNfKII4fSHpQMwR/wS
 mTurkjJAz8mP9Om9TOVqHT02bHJryzkR9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cFXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:IYDnfqyNqDR5W36VUMkfKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:M1MJZ26EUSxySbYMHtssrVEFPpolQ3Lm8Fz2LkuDCV1vb42IcArF
X-Talos-MUID: =?us-ascii?q?9a23=3A9E/lpg7AhKQbqGBMahYJx3n4xow5z5SvJnwGnqw?=
 =?us-ascii?q?6stneM3QvZTGvgyuoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208";a="513039171"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 12:19:58 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 30798180001C7
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:19:58 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 54239CC037D; Mon, 20 Jul 2026 17:49:56 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH v2 01/10] expat: fix CVE-2026-56403
Date: Mon, 20 Jul 2026 17:46:06 +0530
Message-Id: <20260720121615.2520859-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720121615.2520859-1-deeratho@cisco.com>
References: <20260710130809.2817559-1-deeratho@cisco.com>
 <20260720121615.2520859-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241378

From: Deepak Rathore <deeratho@cisco.com>

These patches apply the upstream fixes shown in [1] and [2], as
referenced by [3].

[1] https://github.com/libexpat/libexpat/commit/12dc6d8d3d65f79471a94d8565f6bf1cf245f648
[2] https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c098370a8362aed47b15
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-56403

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes in v2:
- Drop the Wrynose-only stdint.h include from CVE-2026-56403_p2.patch
  because current Wrynose already provides it through expat.h via OE-Core
  commit 21042df15008.
- Remove the unnecessary Backport Changes note from
CVE-2026-56403_p2.patch.

 .../expat/expat/CVE-2026-56403_p1.patch       | 83 +++++++++++++++++++
 .../expat/expat/CVE-2026-56403_p2.patch       | 40 +++++++++
 meta/recipes-core/expat/expat_2.7.5.bb        |  2 +
 3 files changed, 125 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
new file mode 100644
index 0000000000..4cf5c3bd54
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
@@ -0,0 +1,83 @@
+From 4a264be1794368a1acc08476058b6cf087686d11 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Wed, 20 May 2026 12:12:10 +0200
+Subject: [PATCH] lib: Protect function `storeAtts` from signed integer
+ overflow
+
+CVE: CVE-2026-56403
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/12dc6d8d3d65f79471a94d8565f6bf1cf245f648]
+
+Backport Changes:
+- Retain the Expat 2.7.5 binding URI reallocation and active tag pointer
+  updates while using the overflow-safe localPartLen calculation.
+
+(cherry picked from commit 12dc6d8d3d65f79471a94d8565f6bf1cf245f648)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 30 ++++++++++++++++++++----------
+ 1 file changed, 20 insertions(+), 10 deletions(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 0248b665..e441ff7f 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -4235,26 +4235,32 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+     return XML_ERROR_NONE;
+   prefixLen = 0;
+   if (parser->m_ns_triplets && binding->prefix->name) {
+-    while (binding->prefix->name[prefixLen++])
+-      ; /* prefixLen includes null terminator */
++    size_t candidateLen = 0;
++    while (binding->prefix->name[candidateLen++])
++      ; /* candidateLen includes null terminator */
++    /* Detect and prevent integer overflow */
++    if (candidateLen > INT_MAX)
++      return XML_ERROR_NO_MEMORY;
++    prefixLen = (int)candidateLen;
+   }
+   tagNamePtr->localPart = localPart;
+   tagNamePtr->uriLen = binding->uriLen;
+   tagNamePtr->prefix = binding->prefix->name;
+   tagNamePtr->prefixLen = prefixLen;
+-  for (i = 0; localPart[i++];)
+-    ; /* i includes null terminator */
++
++  size_t localPartLen = 0;
++  for (; localPart[localPartLen++];)
++    ; /* localPartLen includes null terminator */
+ 
+   /* Detect and prevent integer overflow */
+-  if (binding->uriLen > INT_MAX - prefixLen
+-      || i > INT_MAX - (binding->uriLen + prefixLen)) {
++  if (localPartLen > INT_MAX || binding->uriLen > INT_MAX - prefixLen
++      || localPartLen > (size_t)INT_MAX - (binding->uriLen + prefixLen)) {
+     return XML_ERROR_NO_MEMORY;
+   }
+ 
+-  n = i + binding->uriLen + prefixLen;
++  n = (int)localPartLen + binding->uriLen + prefixLen;
+   if (n > binding->uriAlloc) {
+     TAG *p;
+-
+     /* Detect and prevent integer overflow */
+     if (n > INT_MAX - EXPAND_SPARE) {
+       return XML_ERROR_NO_MEMORY;
+@@ -4282,10 +4288,14 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+   }
+   /* if m_namespaceSeparator != '\0' then uri includes it already */
+   uri = binding->uri + binding->uriLen;
+-  memcpy(uri, localPart, i * sizeof(XML_Char));
++  /* Detect and prevent integer overflow */
++  if (localPartLen > SIZE_MAX / sizeof(XML_Char)) {
++    return XML_ERROR_NO_MEMORY;
++  }
++  memcpy(uri, localPart, localPartLen * sizeof(XML_Char));
+   /* we always have a namespace separator between localPart and prefix */
+   if (prefixLen) {
+-    uri += i - 1;
++    uri += localPartLen - 1;
+     *uri = parser->m_namespaceSeparator; /* replace null terminator */
+     memcpy(uri + 1, binding->prefix->name, prefixLen * sizeof(XML_Char));
+   }
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
new file mode 100644
index 0000000000..62fdff79e3
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
@@ -0,0 +1,40 @@
+From e8100827a4f68c70d8cadf446bb82bec7cbebbac Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 22 May 2026 00:43:52 +0200
+Subject: [PATCH] xmlwf: Protect function `xcsdup` from signed integer overflow
+
+CVE: CVE-2026-56403
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c098370a8362aed47b15]
+
+(cherry picked from commit 147c8f36d6277d5c6011c098370a8362aed47b15)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlwf.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
+index 2d0c4f8e..934473ce 100644
+--- a/expat/xmlwf/xmlwf.c
++++ b/expat/xmlwf/xmlwf.c
+@@ -305,13 +305,18 @@ processingInstruction(void *userData, const XML_Char *target,
+ static XML_Char *
+ xcsdup(const XML_Char *s) {
+   XML_Char *result;
+-  int count = 0;
++  size_t count = 0;
+   size_t numBytes;
+ 
+   /* Get the length of the string, including terminator */
+   while (s[count++] != 0) {
+     /* Do nothing */
+   }
++
++  // Detect and prevent integer overflow
++  if (count > SIZE_MAX / sizeof(XML_Char))
++    return NULL;
++
+   numBytes = count * sizeof(XML_Char);
+   result = malloc(numBytes);
+   if (result == NULL)
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index ae90ec04e3..423219c726 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -19,6 +19,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-45186-07.patch \
            file://CVE-2026-41080-1.patch \
            file://CVE-2026-41080-2.patch \
+           file://CVE-2026-56403_p1.patch;striplevel=2 \
+           file://CVE-2026-56403_p2.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6

