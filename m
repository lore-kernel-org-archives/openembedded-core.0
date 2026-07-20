Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC9AC4452D
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 12:20:29 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7666.1784550020194847847
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 05:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=H7bIP9Uf;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5653; q=dns/txt;
  s=iport01; t=1784550020; x=1785759620;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ZXtFdwm42obegdcn7Ez4Gfs95ySMI/EawUp2n0nB2Hs=;
  b=H7bIP9UfyPhYgEyXHDH6v33Q29s8+TnuuYCLhgwB3tiWPDJM+zia6/Di
   hcPqbIUJPPStSkNgFQst5dHyBplk7dSdElWOB6qoxdpa/fJ45q7YaWt9P
   wqodvTrV/VY/MAs6CfRJQppZXbBvjZY+1CsndQ2NGiDkCX8GYRH/9eiTF
   x+r+CcJw6xV665t+eBM9wqRiC5EhZX7ByNQnu/zOyisb2gtTzSL5qN9y1
   xB8OfRABTqOMb/4pTUgANEhPY/a/BW5lVfHUtaOlVAHsMhLlmcfMAI7fh
   Ih8PjQ8SwoN6TbySjAIhQSTYGbSplmJvRHx/QsHF6lOWvRJkVHe4M7RVz
   A==;
X-CSE-ConnectionGUID: aBco4p6ITf+xI/HtPTt2zw==
X-CSE-MsgGUID: MBwKFl07RJ6n7mMByebKQQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgAfEl5q/4v/Ja1aHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?QOLZJI3gX4PAQEBD0QNBAEBhD9GAo1TAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFgQ4Thk8NhloBAgEDJwsBGAE9HAMBAi8gCyMIEQiDAgGCO?=
 =?us-ascii?q?gM3AxG8RRo3gXkzgQGDKAE/AkNQ2EkNglgBCxQBgTiFP4J9hSNcGAGEfCcbG?=
 =?us-ascii?q?4FygRWDaYEFgRpCAQGBQoZjBIIigQyBWh5Qjx5IgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQwbBwWBHYE6gQKEdCMfAzl/gS91SnctahIXgSaCEgKBO?=
 =?us-ascii?q?wIHAwsYDUgRLDcUGQQ+bgeNPCOCPgEBMF0BK3sKlDiSYqAhcQoog3WMIY8+h?=
 =?us-ascii?q?XwaM6psC5h9jgqECZJHhGmBaDyBKB8LB3AVgm4BMwlKGQ+OOINrgX/GRjw1A?=
 =?us-ascii?q?gkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:gH05U6CS8YSiYRVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDsj1mEBy
 jYaWziBbKyCZWCgL9olaN6//RlSu5LSmoRjOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD/g2YpWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEyt9lCx0uY6wk9KVnICZu6
 cQkNGofcUXW7w626OrTpuhEnM8vKozveYgYoHwllWufBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGE+BPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FEoiuS9aIqKJ7RmQ+1wtFm7i
 GaeoF7bXBdFMfm12DeP0UuV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KOpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:G7K7m6sEXCCwQxdMP8P9g8hP7skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:gxR/lGAasttqQrr6EyBN/0lIAp4ETnOe3FaXA1OANXozWqLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AYpyJ0A+90nTbV7ySfKWQHz+Qf+JC/IeADBhSq7d?=
 =?us-ascii?q?YvZaBEAZhNj2+tQ3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208";a="512480875"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 12:20:19 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id E78EE18000368
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:20:18 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 17F5CCC037D; Mon, 20 Jul 2026 17:50:17 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH v2 06/10] expat: fix CVE-2026-56406
Date: Mon, 20 Jul 2026 17:46:11 +0530
Message-Id: <20260720121615.2520859-7-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720121615.2520859-1-deeratho@cisco.com>
References: <20260710130809.2817559-1-deeratho@cisco.com>
 <20260720121615.2520859-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:20:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241382

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [3].
The prerequisite in [2] provides XML_INDEX_MAX for the Expat 2.7.5
backport.

[1] https://github.com/libexpat/libexpat/commit/99d8454fdf900a6d00c2a52748e6c0eeb507574d
[2] https://github.com/libexpat/libexpat/commit/252ff1a307b1490ce0f430632791e7e52d7e43fd
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-56406

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
- Changes from v1 to v2: Refresh the patch on top of
latest wrynose branch merged commits.
 .../expat/CVE-2026-56406-dependent.patch      | 58 +++++++++++++++++++
 .../expat/expat/CVE-2026-56406.patch          | 37 ++++++++++++
 meta/recipes-core/expat/expat_2.7.5.bb        |  2 +
 3 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch b/meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
new file mode 100644
index 0000000000..6ef7c42298
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
@@ -0,0 +1,58 @@
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
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56406.patch b/meta/recipes-core/expat/expat/CVE-2026-56406.patch
new file mode 100644
index 0000000000..4077b9946a
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56406.patch
@@ -0,0 +1,37 @@
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
+
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index 5c93b15484..f14e39c00b 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -26,6 +26,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56405.patch;striplevel=2 \
            file://CVE-2026-56410_p1.patch;striplevel=2 \
            file://CVE-2026-56410_p2.patch;striplevel=2 \
+           file://CVE-2026-56406-dependent.patch;striplevel=2 \
+           file://CVE-2026-56406.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


