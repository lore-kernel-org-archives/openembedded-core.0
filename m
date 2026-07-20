Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3DEC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 12:20:08 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7634.1784550004566348391
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 05:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HvhiNW4q;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2888; q=dns/txt;
  s=iport01; t=1784550004; x=1785759604;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=wk7UhjCH8fcr7F/OdsF8U2R5AUTgy/+/28tUk5erHRU=;
  b=HvhiNW4qg1CBncIPW8SwWBdtBr31LGca48+ZKMBbk8fEaJSkld2iP8Ix
   6ZuEx4TZGqcFg7DwIwYY7nfjfpF2hbG7l2SHA9ZfGxT7tM/5U6x9gCAxC
   AW2zRR0QHx/gjsmC68QEkOS1ZxmTvsQfskS0lGi+jAuo7PdqM7b82M99d
   8z5D1v34lDO/BoWmtS1Y+4ouL3MEH9FFy+A2hGMbJfQ+rfXXsFsCgcDiW
   SGPh29wiPXXUrbwDxri9LBEIquLnjQ3lzKwZOGBnctpBNz7bjbETIA+WY
   AB/bfMOIYagL4GyhD5bHiJXa+14xjsDdtdhogcQzh80qGT3br+0QJnAMx
   A==;
X-CSE-ConnectionGUID: skltaMhoRRmTidxtYS7EhA==
X-CSE-MsgGUID: hyadqoBWSM2YKBkVHAsUKA==
X-IPAS-Result: =?us-ascii?q?A0BIAgAfEl5q/5D/Ja1aglmCV3RfQkmUKYIhA54bgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo1TAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEDMgEYAT0cAwECLysjCBEIgwIBgnQDEbxFGjeCLIEBg?=
 =?us-ascii?q?ygBPwJDUNsuAQsUAYE4hT+IIFwYAYR8JxsbgXKBFYNpgQWBXAEBgi2FeASCI?=
 =?us-ascii?q?oEMgVoej25IgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBHYE6g?=
 =?us-ascii?q?QKEdCMfAzl/gS91SnctahIXgSaCEgKBOwIHAwsYDUgRLDcUGQQ+bgeNPCOCP?=
 =?us-ascii?q?zFdASuBQ0GmG6ESCiiDdYwhlToaM6psC5h9jgqWUIRpgWg8gSgBGgQLB3AVg?=
 =?us-ascii?q?m4BMwlKGQ+OOINrgX/GRjw1AgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:aEPNqa6Cx434trt0SWK1HQxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mEdC2/UbquPM2ryfttyYdyyoUtQucTXnIAxSgI9rC82Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1Os/rewP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eJo4c5u9SAWZ0z
 /kkKTwdciG42M+26efuIgVsrpxLwMjDJogTvDRkiDreF/tjGc+FSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkETUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGIeMIITVGJ8PwC50o
 ErG7m31GxYwC+e6kwum2HGSpsbUoADSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBbCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3uv8Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:StOlc60cjqA32faWd+YHEwqjBJ4kLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:MeUgkWyz8IVNIDSxhs9FBgUPGcQ5e1jdy03qJnO5BXZ1eYbKZF+5rfY=
X-Talos-MUID: 9a23:2KAIWAj3n14wCMCO0EcO78MpNNZh772pIn82tM83mOOHCwxZIAq+pWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208";a="512075226"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 12:20:03 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 7BF35180003C9
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:20:03 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 8B254CC037D; Mon, 20 Jul 2026 17:50:01 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH v2 02/10] expat: fix CVE-2026-56408
Date: Mon, 20 Jul 2026 17:46:07 +0530
Message-Id: <20260720121615.2520859-3-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720121615.2520859-1-deeratho@cisco.com>
References: <20260710130809.2817559-1-deeratho@cisco.com>
 <20260720121615.2520859-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241379

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].
The fix is adapted to the existing Expat 2.7.5 copyString implementation.

[1] https://github.com/libexpat/libexpat/commit/16e2efd867ea8567ffa012210b52ef5918e20817
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56408

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
- Changes from v1 to v2: Refresh the patch on top of
latest wrynose branch merged commits.
 .../expat/expat/CVE-2026-56408.patch          | 36 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.7.5.bb        |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56408.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56408.patch b/meta/recipes-core/expat/expat/CVE-2026-56408.patch
new file mode 100644
index 0000000000..b8c43636cc
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56408.patch
@@ -0,0 +1,36 @@
+From b0cf9e9b0f5dfdd938148931a4605a0fd6b917a7 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 23 Apr 2026 10:31:45 +0200
+Subject: [PATCH] lib: Waterproof `copyString` from integer overflow
+
+CVE: CVE-2026-56408
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/16e2efd867ea8567ffa012210b52ef5918e20817]
+
+Backport Changes:
+- Adapt the fix to Expat 2.7.5, which calculates charsRequired using
+  an existing loop instead of xcslen. The upstream string helper
+  refactoring is not required for the overflow guard.
+
+(cherry picked from commit 16e2efd867ea8567ffa012210b52ef5918e20817)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index e441ff7f..4ff5e33b 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -8505,6 +8505,10 @@ copyString(const XML_Char *s, XML_Parser parser) {
+   /* Include the terminator */
+   charsRequired++;
+ 
++  /* Detect and prevent integer overflow */
++  if (charsRequired > SIZE_MAX / sizeof(XML_Char))
++    return NULL;
++
+   /* Now allocate space for the copy */
+   result = MALLOC(parser, charsRequired * sizeof(XML_Char));
+   if (result == NULL)
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index 423219c726..934cde4b1a 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-41080-2.patch \
            file://CVE-2026-56403_p1.patch;striplevel=2 \
            file://CVE-2026-56403_p2.patch;striplevel=2 \
+           file://CVE-2026-56408.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


