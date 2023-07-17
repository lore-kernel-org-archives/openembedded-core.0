Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D46EB64DD
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 03:29:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.820.1689564590803842706
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jul 2023 20:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=O2uYgAY4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6562c762eb=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36H3Mbn0001648
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 20:29:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=iJwB6
	4qQeHR6hT8ePgVBtH6llSEk5pJk34+3dYvgn2M=; b=O2uYgAY4gv+9+l+WS/VMC
	XFcovDYuv+zNKQwdwP5B2ECK85T/ijg3YqblSmZHgSN9kPrly8npiXXwANaAyhMI
	yuniEZgCTQZ/RvK7zD8xAh5aXTRLTXYxqgBkZD3Q23XyqPmzUnYw+gM4lGFnVZwu
	N82lV0OtyjsmBi0iWUXkRFXwDyK3mSkFfEPvzzvvErJH1vMXLvYmJVj9IX5pWoMH
	b2rnYl918kJJQa6t4KhyC1QIqTyQAOT+2rt2schKs/UkrwEAY8Om47afxwPVVOee
	Yo/BBW006XjdkO4IBuhkC77eMl1PeCnElpWuhKgEpAF7FjrDrBVWuTUggAf34HP3
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rupqy97jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 20:29:50 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 16 Jul 2023 20:29:49 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Sun, 16 Jul 2023 20:29:47 -0700
From: Soumya <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>, Soumya <soumya.sambu@windriver.com>
Subject: [OE-core][kirkstone][PATCH 1/1] libwebp: Fix CVE-2023-1999
Date: Mon, 17 Jul 2023 03:29:31 +0000
Message-ID: <20230717032931.1522814-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: c4Pue7WSgjJwL9r-CFQT9zXjNGtPz7AB
X-Proofpoint-ORIG-GUID: c4Pue7WSgjJwL9r-CFQT9zXjNGtPz7AB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_02,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 bulkscore=0 mlxlogscore=519
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307170031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 03:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184426

There exists a use after free/double free in libwebp. An attacker can
use the ApplyFiltersAndEncode() function and loop through to free
best.bw and assign best = trial pointer. The second loop will then
return 0 because of an Out of memory error in VP8 encoder, the pointer
is still assigned to trial and the AddressSanitizer will attempt a double free.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-1999

Upstream patch:
https://github.com/webmproject/libwebp/commit/a486d800b60d0af4cc0836bf7ed8f21e12974129

Signed-off-by: Soumya <soumya.sambu@windriver.com>
---
 .../webp/files/CVE-2023-1999.patch            | 60 +++++++++++++++++++
 meta/recipes-multimedia/webp/libwebp_1.2.4.bb |  4 +-
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-1999.patch

diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-1999.patch b/meta/recipes-multimedia/webp/files/CVE-2023-1999.patch
new file mode 100644
index 0000000000..895d01ea7d
--- /dev/null
+++ b/meta/recipes-multimedia/webp/files/CVE-2023-1999.patch
@@ -0,0 +1,60 @@
+From a486d800b60d0af4cc0836bf7ed8f21e12974129 Mon Sep 17 00:00:00 2001
+From: James Zern <jzern@google.com>
+Date: Wed, 22 Feb 2023 22:15:47 -0800
+Subject: [PATCH] EncodeAlphaInternal: clear result->bw on error
+
+This avoids a double free should the function fail prior to
+VP8BitWriterInit() and a previous trial result's buffer carried over.
+Previously in ApplyFiltersAndEncode() trial.bw (with a previous
+iteration's buffer) would be freed, followed by best.bw pointing to the
+same buffer.
+
+Since:
+187d379d add a fallback to ALPHA_NO_COMPRESSION
+
+In addition, check the return value of VP8BitWriterInit() in this
+function.
+
+Bug: webp:603
+Change-Id: Ic258381ee26c8c16bc211d157c8153831c8c6910
+
+CVE: CVE-2023-1999
+
+Upstream-Status: Backport [https://github.com/webmproject/libwebp/commit/a486d800b60d0af4cc0836bf7ed8f21e12974129]
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+ src/enc/alpha_enc.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/enc/alpha_enc.c b/src/enc/alpha_enc.c
+index f7c0269..7d20558 100644
+--- a/src/enc/alpha_enc.c
++++ b/src/enc/alpha_enc.c
+@@ -13,6 +13,7 @@
+
+ #include <assert.h>
+ #include <stdlib.h>
++#include <string.h>
+
+ #include "src/enc/vp8i_enc.h"
+ #include "src/dsp/dsp.h"
+@@ -148,6 +149,7 @@ static int EncodeAlphaInternal(const uint8_t* const data, int width, int height,
+       }
+     } else {
+       VP8LBitWriterWipeOut(&tmp_bw);
++      memset(&result->bw, 0, sizeof(result->bw));
+       return 0;
+     }
+   }
+@@ -162,7 +164,7 @@ static int EncodeAlphaInternal(const uint8_t* const data, int width, int height,
+   header = method | (filter << 2);
+   if (reduce_levels) header |= ALPHA_PREPROCESSED_LEVELS << 4;
+
+-  VP8BitWriterInit(&result->bw, ALPHA_HEADER_LEN + output_size);
++  if (!VP8BitWriterInit(&result->bw, ALPHA_HEADER_LEN + output_size)) ok = 0;
+   ok = ok && VP8BitWriterAppend(&result->bw, &header, ALPHA_HEADER_LEN);
+   ok = ok && VP8BitWriterAppend(&result->bw, output, output_size);
+
+--
+2.40.0
diff --git a/meta/recipes-multimedia/webp/libwebp_1.2.4.bb b/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
index 263589846a..5d868b3b96 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
@@ -13,7 +13,9 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
-SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
+SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz \
+           file://CVE-2023-1999.patch \
+           "
 SRC_URI[sha256sum] = "7bf5a8a28cc69bcfa8cb214f2c3095703c6b73ac5fba4d5480c205331d9494df"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
-- 
2.40.0


