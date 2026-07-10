Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CDB7C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 13:10:20 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12314.1783689017776947249
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 06:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TUGvEd/9;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5187; q=dns/txt;
  s=iport01; t=1783689017; x=1784898617;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VA4NHcGfDOPgI7W5AH1ZibIQ7KRQNAL/Ltfxi1/+DKk=;
  b=TUGvEd/94sNrGg1D3IG2DEpfgMqppX8FsxAD4lDJc0JUcv4WRYm1FRa0
   ai4NdD1PpQer7fCaDaoxOwtTj6Y97uNsbG680p6CzJchw9Bp3D7Pr7k37
   ge0ksIeQnsUmoCh36tDVYZDzli4saFdVAQgcRHhB6dn1AXN28EnEGfTrr
   iUFQUMO6h//4Ae0DOM4SyubdVaar8CwbXJxElt92nzFXo0M8CaA16UIXd
   FD97qwc/sYVY4p6tS3qyfCaWn/9iaJbt9k7w6RE0+jlfKSZWfb0HMb5G7
   uN64q4WPzyg9PRCNTbuc0I1XYboKnCng6/KwUiAUAzpBCt5ptlofP068M
   A==;
X-CSE-ConnectionGUID: 9DnJ8i8IS5esSVQ3BGhAAA==
X-CSE-MsgGUID: hFw5ALUjThe5mIkqYRr2Uw==
X-IPAS-Result: =?us-ascii?q?A0BFAgBH7lBq/5L/Ja1aglmCV3RfQkmUKYIhi2eSN4F+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/jhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgEtCwEYAVkDAQJPCyMhgwIBgjoDNgIBEbk/GjeBeTOBAYMoA?=
 =?us-ascii?q?T8CQ1DYSQ2CWAELFAGBOIU/gnyFI1sYAYR8JxsbgXKBFYNpgQWBGkIBAYFCh?=
 =?us-ascii?q?mMEgiKBDIFaHlCEN4prSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMG?=
 =?us-ascii?q?wcFgR2BWYEChHkjHwM5f4EwdUp5LXMSHgqBUoIWVAMLGA1IESw3FBsEPm4Hj?=
 =?us-ascii?q?T4XD4I9AQEwXSx7CpQ4kmWgHnEKKIN1jCGPPoV8GjOqbAuYfY4KhAmSR4Rpg?=
 =?us-ascii?q?Wg8gSgfCwdwFYJuATMJShkPjjiDa4F/zFskNQIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:7tevMK8MHmCd7NCR1A6LDrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 WcbXD3SPqvba2D1eNp+PoS+pkMPuMWGnN9hHlZkrS1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsbTpEs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lnEYs6qucnIFoT+
 OcjFglWRD+DrsuflefTpulE3qzPLeHxN48Z/3UlxjbDALN+ENbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Mn1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3FbYKFIILbFZwP9qqej
 mLo4DnQJiwYCNySlD+k8WudvPWVoDyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjlCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:Cj/vG6uBcQVpmfbOeBPOoW7y7skDRtV00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBEDjexLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPIdurJBLK8gceVbSC09QYIcT1X
X-Talos-CUID: =?us-ascii?q?9a23=3AYRXM2muUxSQVrXom2RBgHDdY6It0Xnv/nHaAAnT?=
 =?us-ascii?q?lBH1SdoTOY3CQ0YpNxp8=3D?=
X-Talos-MUID: 9a23:xyV9lwZsTG/ObOBTtxHz2RhGCcVU46nzDWEOiKQ8oZO5Knkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="508269812"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jul 2026 13:10:16 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id B460B18000204
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:10:16 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 627C4CC2EC3; Fri, 10 Jul 2026 06:10:16 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 06/10] expat: fix CVE-2026-56406
Date: Fri, 10 Jul 2026 06:09:50 -0700
Message-ID: <20260710130950.2822099-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240646

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [3].
The prerequisite in [2] provides XML_INDEX_MAX for the Expat 2.7.5
backport.

[1] https://github.com/libexpat/libexpat/commit/99d8454fdf900a6d00c2a52748e6c0eeb507574d
[2] https://github.com/libexpat/libexpat/commit/252ff1a307b1490ce0f430632791e7e52d7e43fd
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-56406

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch b/meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
new file mode 100644
index 0000000000..c1303029e2
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
@@ -0,0 +1,57 @@
+From 4f828b7ee9d6efef618e8a99a0392acbb95e84f2 Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Wed, 27 May 2026 17:01:44 -0700
+Subject: [PATCH] lib: Make `XML_Index` overflow check more intuitive
+
+In fixing a bug, 7e5b71b748491b6e459e5c9a1d090820f94544d8 introduced a
+magic number `2` in this code that made it difficult to understand the
+rationale for this overflow check without reading the commit log. This
+change introduces some more readable constants to use in these
+situations.
+
+CVE: CVE-2026-56406
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/252ff1a307b1490ce0f430632791e7e52d7e43fd]
+
+(cherry picked from commit 252ff1a307b1490ce0f430632791e7e52d7e43fd)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 96127bf8..5ecea7a8 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -101,7 +101,7 @@
+ #include <stddef.h>
+ #include <string.h> /* memset(), memcpy() */
+ #include <assert.h>
+-#include <limits.h> /* INT_MAX, UINT_MAX */
++#include <limits.h> /* INT_MAX, LLONG_MAX, LONG_MAX, UINT_MAX */
+ #include <stdio.h>  /* fprintf */
+ #include <stdlib.h> /* getenv, rand_s */
+ #include <stdint.h> /* SIZE_MAX, uintptr_t */
+@@ -209,6 +209,12 @@ typedef char ICHAR;
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
+@@ -2395,7 +2401,7 @@ XML_Parse(XML_Parser parser, const char *s, int len, int isFinal) {
+     int nLeftOver;
+     enum XML_Status result;
+     /* Detect overflow (a+b > MAX <==> b > MAX-a) */
+-    if ((XML_Size)len > ((XML_Size)-1) / 2 - parser->m_parseEndByteIndex) {
++    if (len > XML_INDEX_MAX - parser->m_parseEndByteIndex) {
+       parser->m_errorCode = XML_ERROR_NO_MEMORY;
+       parser->m_eventPtr = parser->m_eventEndPtr = NULL;
+       parser->m_processor = errorProcessor;
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56406.patch b/meta/recipes-core/expat/expat/CVE-2026-56406.patch
new file mode 100644
index 0000000000..0305f05552
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56406.patch
@@ -0,0 +1,36 @@
+From 6e52f18aded0a76cf89f191d7810bc04287f5337 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 31 May 2026 15:18:58 +0200
+Subject: [PATCH] lib: Copy overflow check from `XML_Parse` to
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
+index 5ecea7a8..71fe2c79 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -2518,6 +2518,14 @@ XML_ParseBuffer(XML_Parser parser, int len, int isFinal) {
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
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index dcccc7597e..fa9a8bc100 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -17,6 +17,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56405.patch;striplevel=2 \
            file://CVE-2026-56410_p1.patch;striplevel=2 \
            file://CVE-2026-56410_p2.patch;striplevel=2 \
+           file://CVE-2026-56406-dependent.patch;striplevel=2 \
+           file://CVE-2026-56406.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


