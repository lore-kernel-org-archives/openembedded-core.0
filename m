Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24CAC4450F
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 06:05:57 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7693.1784268350177423536
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 23:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PH5fGKFo;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5738; q=dns/txt;
  s=iport01; t=1784268350; x=1785477950;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=YlcepQJH6pl3nD9/NvY/jlqjTMXpLI/HckGfShkO+CU=;
  b=PH5fGKFoR5CdIbS1nAX56CoNftoxE4vGEZwYhoIYSKJqhP6mxX3aMYtA
   9/hFGUItmHBYMzzt9P5F7oUZDdkJTyKMy/VJzRxxR3rOXhcxJjCjWkb5W
   BNjzAwxrCp9RgPv+PbZ8xcoFch5AvyThY+8O9umxXRToJLQmI1rOsdFzC
   0gRfQuGQLTuPQXDS/OImv3SXNzXquHU/9PMe0aNchN1bU7X9uFnbPpOd3
   hfVZ4Aqdk6vdswcCcDqjNth/oYUgB49wVOTEV014ZmBehLI0Z3Y4cXV83
   POsmd8LtGAvOR6MlpVVWXtUi6zptp9hf3h6CjVNnFik36xptMPCGl+1bL
   Q==;
X-CSE-ConnectionGUID: yUcTW9fFT96Kmbr/FqQdRw==
X-CSE-MsgGUID: pn2JU+C2SIqaPQbomtO50A==
X-IPAS-Result: =?us-ascii?q?A0BJAgBIxVlq/4z/Ja1aHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?QOLZJI3gX4PAQEBD0QNBAEBhD9GAo1SAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFgQ4Thk8NhloBAgEDJwsBGAE9HAMBAi8gCyMIEQiDAgGCO?=
 =?us-ascii?q?gM3AxG8eho3gXkzgQGDKAE/AkNQ2EkNglgBCxQBgTiFP4J9hSNcGAGEfCcbG?=
 =?us-ascii?q?4FygRWDaYEFgRpCAQGBQoZjBIIigQyBWh5QhCOLDkiBHgNZLAFVEw0KCwcFg?=
 =?us-ascii?q?WYDNRIqFW4yHYEjPheBDBsHBYEdgTqBAIR2Ix8DOX+BL3VKdy1qEheBToIUg?=
 =?us-ascii?q?T4DCxgNSBEsNxQbBD5uB41II4I+AQEwXQErewqUOJJioCFxCiiDdYwhjz6Ff?=
 =?us-ascii?q?BozqmwLmH2OCoQJkkeEaYFoPIEoHwsHcBWCbgEzCUoZD444g2uBf8xBPDUCC?=
 =?us-ascii?q?TIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:I0hCEKiezB5mYheEYEA7sLOJX161MREKZh0ujC45NGQN5FlHY01je
 htvUGjVMvnca2r3ftxyb4/l9xlUv5bRnYQ3TFZr/i4xECtjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMtPvd8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUJx+1LPjBA2
 8BJdhMIZArEqfuPzIikH7wEasQLdKEHPasFsX1miDWcBvE8TNWbGOPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg9/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9Jo3UFZUIzhrHz
 o7A13z/WDMnd/fF8huc+0qVjOjKgQSmAKtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmUHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:nxC21aoweAq0sJlNRu1knSUaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3Abz6HXGpAtCvc0nt+y2XFuOnmUdEYeUHinXn+Hx7?=
 =?us-ascii?q?mKmNjUvq7UGacwrwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AnoDj/g/+BUID4OE1hkDfuN6Qf99uuYaTS2tXqrQ?=
 =?us-ascii?q?fsvG9Pyt1JxDA1B3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="496885847"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 06:05:49 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 119AD180005AE
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:05:49 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 33439CC037D; Fri, 17 Jul 2026 11:35:47 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 06/10] expat: fix CVE-2026-56406
Date: Fri, 17 Jul 2026 11:34:33 +0530
Message-Id: <20260717060437.2910653-7-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260717060437.2910653-1-deeratho@cisco.com>
References: <20260717060437.2910653-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:05:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241145

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [3].
The prerequisite in [2] provides XML_INDEX_MAX for the Scarthgap Expat
2.6.4 backport.

[1] https://github.com/libexpat/libexpat/commit/99d8454fdf900a6d00c2a52748e6c0eeb507574d
[2] https://github.com/libexpat/libexpat/commit/252ff1a307b1490ce0f430632791e7e52d7e43fd
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-56406

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../expat/CVE-2026-56406-dependent.patch      | 59 +++++++++++++++++++
 .../expat/expat/CVE-2026-56406.patch          | 34 +++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  2 +
 3 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch b/meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
new file mode 100644
index 0000000000..89e5bdad1c
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
index 0000000000..4f19876548
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
index ee4a88c5f9..5b3d9c64f2 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -58,6 +58,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56405.patch;striplevel=2 \
            file://CVE-2026-56410_p1.patch;striplevel=2 \
            file://CVE-2026-56410_p2.patch;striplevel=2 \
+           file://CVE-2026-56406-dependent.patch;striplevel=2 \
+           file://CVE-2026-56406.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

