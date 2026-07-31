Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17280C54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 05:57:03 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.704.1785477418606257626
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 22:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gZ0i9/ax;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5963; q=dns/txt;
  s=iport01; t=1785477418; x=1786687018;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=1SDLvWnsAbhH4Ct9TZBzeTP3jhR0Ga+PGwjhxo4aiPQ=;
  b=gZ0i9/axImuJWXlsQLSbILeFNRIKvAUwaBsWIqgUGo+KOUvfGbI8gKCl
   Jp275gFxDSPvCzrj4i3X/IFHLCUY1DBxQcU4RlYQ6nCIBND7rO2m6Vp4e
   DLuWEXcgPg4fVxmQaeYbfwsdZwTQCqnsie6p6lhPN+u/z1+Y228Z/IXsI
   LI5KAhhMARlTqcgl0wQhSerS+NQZyh27vOYinneQIRWIBbkwXBDNQNe9V
   uziW+78sQRaEd4VSMbtoEFJnBg1ZyOvLCKk7CSD4ZdU0ceqRAC/tloBCq
   GvKO+uT9z1dv8sQSMlXqT4PdwEJbnYr14KlL2j7DeYeWA5S1qa7Ac7tl5
   w==;
X-CSE-ConnectionGUID: wcL9SEVcSEaNAVgOyx9+Pw==
X-CSE-MsgGUID: 9yGfeskIQk6yRnKmWj51Fg==
X-IPAS-Result: =?us-ascii?q?A0AnAAD1N2xq/43/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ0X0JJjHKHN4IhA4tkkjeBfg8BAQEPRA0EAQGEP0YCjWYCJjQJDgECBAMCA?=
 =?us-ascii?q?wEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgECAQMnCwEYAT0cAwECL?=
 =?us-ascii?q?yALIwgRCIMCAYI6AzcDEbowGjeBeTOBAYMoAT8CQ1DYSQ2CWAELFAGBOAGFP?=
 =?us-ascii?q?oJ9hSNcGAGEfCcbG4FygRWDaYEFgRpCAQGBQoZjBIIigQyBWh5Qg1uMEkiBH?=
 =?us-ascii?q?gNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDRsHBYEdgSsvhFMjGTZ8gS91S?=
 =?us-ascii?q?nUtahIXgRqDMQKCXwMLGA1IESw3FBkEPm4HjWkggj4BATAMUQErewqUOJJio?=
 =?us-ascii?q?CFxCiiDdYwhjz6FfBozqmwLmH2OCoQJkkeEaYFoPIEoHwsHcBWCbgEzCUoZD?=
 =?us-ascii?q?444g2uBf8xDPDUCCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:ziDj7qI6W+u69c5GFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS32cGx
 mAcDTqAM63YYWehfN0gaYvn8EkOuZWAzdI2SlYd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGUsajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1xB2VnBqAm8d1aCEdny
 /M/OSBcLSic0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBUbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME2ojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjeGzYISEIoXSLSlTtheJi
 WzL5GfYOxJEJeaZ6j+68C/1qOCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1rfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:osztT6vy7UPvKitMafY7sRSM7skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AoIrTZ2iz+lO1pmhu3GQqNAkERTJubXb5nUz9HUS?=
 =?us-ascii?q?DJG9PYYOabk6AqeBcjJ87?=
X-Talos-MUID: 9a23:bCXZTwS/z4Q+dTh2RXS9lR5sOdxrwp2tVlE3l7YDhMvZbAJ/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,195,1779148800"; 
   d="scan'208";a="516869010"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Jul 2026 05:56:57 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 5EFA7180001B4
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:56:57 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 765D6CC037D; Fri, 31 Jul 2026 11:26:55 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 06/10] expat: fix CVE-2026-56406
Date: Fri, 31 Jul 2026 11:26:21 +0530
Message-Id: <20260731055625.4187716-7-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260731055625.4187716-1-deeratho@cisco.com>
References: <20260717060437.2910653-1-deeratho@cisco.com>
 <20260731055625.4187716-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242403

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [3].
The prerequisite in [2] provides XML_INDEX_MAX for the Scarthgap Expat
2.6.4 backport.

[1] https://github.com/libexpat/libexpat/commit/99d8454fdf900a6d00c2a52748e6c0eeb507574d
[2] https://github.com/libexpat/libexpat/commit/252ff1a307b1490ce0f430632791e7e52d7e43fd
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-56406

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes in v2:
- Rebased the recipe SRC_URI context on current Scarthgap after upstream
  added Expat CVE-2026-41080-* and CVE-2026-45186-* patch entries.
- No change to the embedded upstream source patches.

 .../expat/CVE-2026-56406-dependent.patch      | 59 +++++++++++++++++++
 .../expat/expat/CVE-2026-56406.patch          | 34 +++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  2 +
 3 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch b/meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
new file mode 100644
index 0000000000..d749ef0608
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
@@ -0,0 +1,59 @@
+From 9aafa47798332618f08af046c3471de1f3a9e031 Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Wed, 27 May 2026 17:01:44 -0700
+Subject: [PATCH 08/17] lib: Make `XML_Index` overflow check more intuitive
+
+In fixing a bug, 7e5b71b748491b6e459e5c9a1d090820f94544d8 introduced a magic number `2` in this code that made it difficult to understand the rationale for this overflow check without reading the commit log. This change introduces some more readable constants to use in these situations.
+
+CVE: CVE-2026-56406
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/252ff1a307b1490ce0f430632791e7e52d7e43fd]
+
+Backport Changes:
+- Adapt include context for Scarthgap 2.6.4 and expose SIZE_MAX in
+  the existing stdint.h comment.
+
+(cherry picked from commit 252ff1a307b1490ce0f430632791e7e52d7e43fd)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 80ad0811..5bf706b0 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -97,10 +97,10 @@
+ #include <stddef.h>
+ #include <string.h> /* memset(), memcpy() */
+ #include <assert.h>
+-#include <limits.h> /* UINT_MAX */
++#include <limits.h> /* INT_MAX, LLONG_MAX, LONG_MAX, UINT_MAX */
+ #include <stdio.h>  /* fprintf */
+ #include <stdlib.h> /* getenv, rand_s */
+-#include <stdint.h> /* uintptr_t */
++#include <stdint.h> /* SIZE_MAX, uintptr_t */
+ #include <math.h>   /* isnan */
+ 
+ #ifdef _WIN32
+@@ -211,6 +211,12 @@ typedef char ICHAR;
+ 
+ #endif
+ 
++#ifdef XML_LARGE_SIZE
++#  define XML_INDEX_MAX LLONG_MAX
++#else
++#  define XML_INDEX_MAX LONG_MAX
++#endif
++
+ /* Round up n to be a multiple of sz, where sz is a power of 2. */
+ #define ROUND_UP(n, sz) (((n) + ((sz) - 1)) & ~((sz) - 1))
+ 
+@@ -2360,7 +2366,7 @@ XML_Parse(XML_Parser parser, const char *s, int len, int isFinal) {
+     int nLeftOver;
+     enum XML_Status result;
+     /* Detect overflow (a+b > MAX <==> b > MAX-a) */
+-    if ((XML_Size)len > ((XML_Size)-1) / 2 - parser->m_parseEndByteIndex) {
++    if (len > XML_INDEX_MAX - parser->m_parseEndByteIndex) {
+       parser->m_errorCode = XML_ERROR_NO_MEMORY;
+       parser->m_eventPtr = parser->m_eventEndPtr = NULL;
+       parser->m_processor = errorProcessor;
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56406.patch b/meta/recipes-core/expat/expat/CVE-2026-56406.patch
new file mode 100644
index 0000000000..56de9e4124
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56406.patch
@@ -0,0 +1,34 @@
+From 5db699faa6af1c66e96abec5dbd1908efd64ef70 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 31 May 2026 15:18:58 +0200
+Subject: [PATCH 09/17] lib: Copy overflow check from `XML_Parse` to
+ `XML_ParseBuffer`
+
+CVE: CVE-2026-56406
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/99d8454fdf900a6d00c2a52748e6c0eeb507574d]
+
+(cherry picked from commit 99d8454fdf900a6d00c2a52748e6c0eeb507574d)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 5bf706b0..9f07b860 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -2483,6 +2483,14 @@ XML_ParseBuffer(XML_Parser parser, int len, int isFinal) {
+     parser->m_parsingStatus.parsing = XML_PARSING;
+   }
+ 
++  // Detect and avoid integer overflow
++  if (len > XML_INDEX_MAX - parser->m_parseEndByteIndex) {
++    parser->m_errorCode = XML_ERROR_NO_MEMORY;
++    parser->m_eventPtr = parser->m_eventEndPtr = NULL;
++    parser->m_processor = errorProcessor;
++    return XML_STATUS_ERROR;
++  }
++
+   start = parser->m_bufferPtr;
+   parser->m_positionPtr = start;
+   parser->m_bufferEnd += len;
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 39e40befc4..aa2a4f8966 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -68,6 +68,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56405.patch;striplevel=2 \
            file://CVE-2026-56410_p1.patch;striplevel=2 \
            file://CVE-2026-56410_p2.patch;striplevel=2 \
+           file://CVE-2026-56406-dependent.patch;striplevel=2 \
+           file://CVE-2026-56406.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


