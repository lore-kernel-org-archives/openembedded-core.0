Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4DBC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 13:08:20 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12173.1783688898544299257
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 06:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=aQSc2MU0;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6365; q=dns/txt;
  s=iport01; t=1783688898; x=1784898498;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=joMWqZW1qtelWgXTN5fvFQ/C8R3smYZnnzAs8JBNkNo=;
  b=aQSc2MU0GSQaiUqnl8T2yjhyXJvPrpydmWU1lnw7tYHI/u+hVHAFNQ0a
   i8ktEQWYoW7D6x8+q8qRY85G+s1xYWGZW7j7KJN/aozIF1H8cNgrL8b7G
   RbfpIvWWdpLI9ei2Lq98JuQdQRQj2wcSNROFae6QUhz99fCLtM8MTzUHM
   NCZPSgPsKiOMtMAFY5d7lBvkDeNBItxPRw4urfGYOcowMpDznwQPXURz3
   UvtNZRjSh/MWMKjGsGB8w2usmxUCHZJfIyEhgEraHSpOItf+AoBTwiGHD
   ttNvX/K7kfPHdz3MBxa4s4Rgnd+Ng24q85EbCv0V4o0L2AAdQaqpHYKC/
   A==;
X-CSE-ConnectionGUID: bJpk2i69SA2w4Ei3+eB8Iw==
X-CSE-MsgGUID: tBrV4Ar5Q+GwkaeRoGKENA==
X-IPAS-Result: =?us-ascii?q?A0BEAgDL7VBq/4z/Ja1aglmCV3RfQkmUKYIhgRadCIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/jhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgEtCwEYAVkDAQJaIyGDAgGCcwIBEblJGjeBeTOBAYMoAT8CQ?=
 =?us-ascii?q?1DbLgELFAGBOIU/iB9bGAGEfCcbG4FygRWCc3aBBYFcAQGBJ4Z+BIIigQyBW?=
 =?us-ascii?q?h6FB4prSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BWYECh?=
 =?us-ascii?q?HkjHwM5f4EwdUp5LXMSHgqBUoIWVAMLGA1IESw3FBsEPm4HjT4XD4I+gQ4sg?=
 =?us-ascii?q?UMRlBeQFoIhoQ8KKIN1jCGVOhozqmwLmH2OCpYDTYRpgWg8gSgfCwdwFYJuA?=
 =?us-ascii?q?TMJShkPji0LC4NggX/MWyQ1AgkyAQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-Data: A9a23:sxs4Z6s4x4j7++aB0ePAKRElp+fnVAdfMUV32f8akzHdYApBsoF/q
 tZmKWDQOvneNGWhKNl0YY6z9UID6MKByYVkTlQ+qig2RSgagMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/3b+Es21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw8MRvAjtPq
 60jAWoSMj2C3KG76uKaVbw57igjBJGD0II3oHpsy3TdSP0hW52GG/6M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtPYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUoHSG5ULwB7A/
 goq+UzlKAskaPWFlAPG3W2vj+L1mgzYdaQ7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YaLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:A2r7RKNTWX4sGcBcTvGjsMiBIKoaSvp037BN7TESdfU7SKKlfq
 yV8cjztiWE6wr5OktApTnoAsDpKhnhHPVOjrX5U43PYOCfgguVBbAny5f+yDv9HCC73Otc2a
 B8N5VaMrTLfD1HZQKQ2njeLz7mq+P3lJyVuQ==
X-Talos-CUID: 9a23:3WKE12zZknYmMeITgH7TBgUeONgmKHyDnUz5eVDkJGcyC7C/GX6PrfY=
X-Talos-MUID: 9a23:hX37nAuIvD1Fu0PQ6s2nmBt4CptB+fmXS28SkpwLgc6rFgFWEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="506866000"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jul 2026 13:08:17 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 9872618000610
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:08:17 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 4691ACC2EC3; Fri, 10 Jul 2026 06:08:17 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 01/10] expat: fix CVE-2026-56403
Date: Fri, 10 Jul 2026 06:08:09 -0700
Message-ID: <20260710130809.2817559-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:08:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240641

From: Deepak Rathore <deeratho@cisco.com>

These patches apply the upstream fixes shown in [1] and [2], as
referenced by [3].

[1] https://github.com/libexpat/libexpat/commit/12dc6d8d3d65f79471a94d8565f6bf1cf245f648
[2] https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c098370a8362aed47b15
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-56403

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

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
index 0000000000..a17e3a8b3a
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
@@ -0,0 +1,52 @@
+From e8100827a4f68c70d8cadf446bb82bec7cbebbac Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 22 May 2026 00:43:52 +0200
+Subject: [PATCH] xmlwf: Protect function `xcsdup` from signed integer overflow
+
+CVE: CVE-2026-56403
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c098370a8362aed47b15]
+
+Backport Changes:
+- Include stdint.h explicitly because Expat 2.7.5 does not expose SIZE_MAX
+  to xmlwf.c.
+
+(cherry picked from commit 147c8f36d6277d5c6011c098370a8362aed47b15)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlwf.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
+index 2d0c4f8e..934473ce 100644
+--- a/expat/xmlwf/xmlwf.c
++++ b/expat/xmlwf/xmlwf.c
+@@ -46,6 +46,7 @@
+ 
+ #include <assert.h>
+ #include <stdio.h>
++#include <stdint.h>
+ #include <stdlib.h>
+ #include <stddef.h>
+ #include <string.h>
+@@ -305,13 +306,18 @@ processingInstruction(void *userData, const XML_Char *target,
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
index 4f2578292d..a0c28d162c 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -10,6 +10,8 @@ VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://run-ptest \
+           file://CVE-2026-56403_p1.patch;striplevel=2 \
+           file://CVE-2026-56403_p2.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


