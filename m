Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99567C44507
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 06:05:07 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7798.1784268305661217742
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 23:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YACieeXN;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7056; q=dns/txt;
  s=iport01; t=1784268305; x=1785477905;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=QPPwrUJNUshigUs7L3OB+ggi/HDsU1kgw0MpqMn1jGs=;
  b=YACieeXNp7ofTLR+C0Eu4OogtdsZmSh5SBcZ4E0yS1otmA0ZdXXig7/0
   Tkz+dv3q0b6ezXljTgf0jaDuWkeDbB2H7KRd+J1EwxWxoLlcUzuHtSQ5w
   /X5mEjnX//s0QZiocsV/Uxu6b7HC97MbFfuqR1V2OE0KBfRyudSkLA/ZH
   iCYdcF+YIAxMxl7CQd7qVcz/mQUEl5PErnrBc2e5mcAEyJEJ5eAe0w6db
   FMjUpOBSbJQe/xqzPFAChmGA1KLBUxYMl0KSQT+fwrAsKXjo9I6Dn2+8o
   bV8qt5BD4mnDdIYKoSQrHYrXzzeS59IaAOfqrumO164HaBIKbLobFd6Kl
   w==;
X-CSE-ConnectionGUID: ixfVjCAXQJ6FInRhSlctow==
X-CSE-MsgGUID: Ww8D8qE3Q/yIKCozC4xDhA==
X-IPAS-Result: =?us-ascii?q?A0BJAgBWw1lq/5D/Ja1aglmCV3RfQkmUKYIhA4ETnQiBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjVICJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GWgECAQMnCwEYAT0cAwECLysjCBEIgwIBgnQDEbx6GjeBe?=
 =?us-ascii?q?TOBAYMoAT8CQ1DbLgELFAGBOIU/iCBcGAGEfCcbG4FygRWCc3aBBYFcAQGIJ?=
 =?us-ascii?q?QSCIoEMgVoehHOLDkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHB?=
 =?us-ascii?q?YEdgTqBAIR2Ix8DOX+BL3VKdy1qEheBToIUgT4DCxgNSBEsNxQbBD5uB41II?=
 =?us-ascii?q?4I/gQ4BK4FDEZQXkBaCHqESCiiDdYwhlToaM6psC5h9jgqWAFCEaYFoPIEoH?=
 =?us-ascii?q?wsHcBWCbgEzCUoZD44tCwuDYIF/zEE8NQIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:Uf1XMKKAUFx4c2mPFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS0DQDx
 jZMCmCAb62Na2v9L40gbN6z/UgCuZbVn4NqSQsd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGcqajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1vHE8IP6Yxyt9VX09v8
 8YYEzQGchec0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBUrAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEiojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjeG1a4aNJYDRLSlTtnmH9
 k6W5kmiO1YLFf+0ziiurmKAhsaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1nfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:TX8oS6qtjGigl6dowlQTIlUaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:jSvrz2wJS3+VTofxWwo5BgUVCs4bcFb0/E7yfWGZD1xpc7meVViPrfY=
X-Talos-MUID: 9a23:VMNlzwuWKg9w5ss0uc2nuy4yGJdxzv+XT1Essr4BqeLYJQBwEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="510340743"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 06:05:04 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 6CF3E180003F2
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:05:04 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 8CF68CC037D; Fri, 17 Jul 2026 11:35:02 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 01/10] expat: fix CVE-2026-56403
Date: Fri, 17 Jul 2026 11:34:28 +0530
Message-Id: <20260717060437.2910653-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260717060437.2910653-1-deeratho@cisco.com>
References: <20260717060437.2910653-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:05:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241140

From: Deepak Rathore <deeratho@cisco.com>

These patches apply the upstream fixes shown in [1] and [2], as
referenced by [3].

Upstream pull request mentioned in [4] contains both the storeAtts fix
and the related xcsdup overflow hardening so adding both source patches
explicit, even though the published advisory description names storeAtts
specifically.

[1] https://github.com/libexpat/libexpat/commit/12dc6d8d3d65f79471a94d8565f6bf1cf245f648
[2] https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c098370a8362aed47b15
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-56403
[4] https://github.com/libexpat/libexpat/pull/1232

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../expat/expat/CVE-2026-56403_p1.patch       | 81 +++++++++++++++++++
 .../expat/expat/CVE-2026-56403_p2.patch       | 52 ++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  2 +
 3 files changed, 135 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
new file mode 100644
index 0000000000..f5e55eb6e3
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
@@ -0,0 +1,81 @@
+From b689559597116ee75a633453e2f7177c8541b04e Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Wed, 20 May 2026 12:12:10 +0200
+Subject: [PATCH 01/17] lib: Protect function `storeAtts` from signed integer
+ overflow
+
+CVE: CVE-2026-56403
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/12dc6d8d3d65f79471a94d8565f6bf1cf245f648]
+
+Backport Changes:
+- Adapt storeAtts to the Scarthgap 2.6.4 loop and URI allocation
+  logic while preserving the upstream overflow checks.
+
+(cherry picked from commit 12dc6d8d3d65f79471a94d8565f6bf1cf245f648)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 30 ++++++++++++++++++++----------
+ 1 file changed, 20 insertions(+), 10 deletions(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 9bc67f38..df92a3ca 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -4226,26 +4226,32 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+     return XML_ERROR_NONE;
+   prefixLen = 0;
+   if (parser->m_ns_triplets && binding->prefix->name) {
+-    for (; binding->prefix->name[prefixLen++];)
+-      ; /* prefixLen includes null terminator */
++    size_t candidateLen = 0;
++    for (; binding->prefix->name[candidateLen++];)
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
+@@ -4273,10 +4279,14 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
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
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
new file mode 100644
index 0000000000..b578cb60cc
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
@@ -0,0 +1,52 @@
+From 2855ce68a1ce9732267c06734427930364ab66c1 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 22 May 2026 00:43:52 +0200
+Subject: [PATCH 02/17] xmlwf: Protect function `xcsdup` from signed integer
+ overflow
+
+CVE: CVE-2026-56403
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c098370a8362aed47b15]
+
+Backport Changes:
+- Add stdint.h and convert count and numBytes to size_t because
+  Scarthgap 2.6.4 lacks these upstream prerequisites.
+
+(cherry picked from commit 147c8f36d6277d5c6011c098370a8362aed47b15)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlwf.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
+index fd4fc3f8..7bbdb303 100644
+--- a/expat/xmlwf/xmlwf.c
++++ b/expat/xmlwf/xmlwf.c
+@@ -45,6 +45,7 @@
+ 
+ #include <assert.h>
+ #include <stdio.h>
++#include <stdint.h>
+ #include <stdlib.h>
+ #include <stddef.h>
+ #include <string.h>
+@@ -304,13 +305,18 @@ processingInstruction(void *userData, const XML_Char *target,
+ static XML_Char *
+ xcsdup(const XML_Char *s) {
+   XML_Char *result;
+-  int count = 0;
+-  int numBytes;
++  size_t count = 0;
++  size_t numBytes;
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
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 151720a9e3..dba4b2c81d 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -51,6 +51,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-32777-02.patch \
            file://CVE-2026-32778-01.patch \
            file://CVE-2026-32778-02.patch \
+           file://CVE-2026-56403_p1.patch;striplevel=2 \
+           file://CVE-2026-56403_p2.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

