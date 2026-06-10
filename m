Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E49CCD98CD
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:50:02 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16344.1781084985432073872
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 02:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jOpVO3CF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781084995; x=1812620995;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rqvkVezxRpzIbvyeR0Qf5fejzQl6OnWhrZhsJTx5UsE=;
  b=jOpVO3CFYMPSFxLbSwcOnqBdqhc44QorWebb5Ksu3c7p38qouLdekcF3
   2A9WEye1XX5DF4zH+jySEFS4rOc4VK/rTe2vs6VdWO4RvUfBJnJuix01B
   +caay9CGbJ9qLw1mFoSRPjcrtpZXeJn8FQ0w7S0HP+sOu+MES/pvZA23b
   sVKtxz7S9mrHyQb2GR2tXW/FgagEHmzHiPNk3a3ycqR5T+ReiImR8AN3x
   W1L14bDE3pySrDN3EYNC+exVPYRjyKP2tSb7mNMf3w2DEqgtdD++Zt0Bx
   DdEwDutd01J8sDaDqxxxI3H2GTZU/p1PNFL+wD+nCwhP7ZpAN2BXjLT0R
   w==;
X-CSE-ConnectionGUID: Dvb3JQ/pR+u+LUjsSQDAzw==
X-CSE-MsgGUID: GyOkAgWkSL2njS2AsW5IKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="243598908"
X-IronPort-AV: E=Sophos;i="6.24,197,1774278000"; 
   d="scan'208";a="243598908"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:49:54 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id C3C011C00092
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:53 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 7B4C5101B16B
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8DEE81400277;
	Wed, 10 Jun 2026 09:49:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/16] fastfloat: upgrade 8.2.5 -> 8.2.8
Date: Wed, 10 Jun 2026 17:49:22 +0800
Message-ID: <20260610094932.2264-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260610094932.2264-1-wangmy@fujitsu.com>
References: <20260610094932.2264-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238332

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Unroll the integer-part digit scan (straight-line for the common 1-5 digit case)
- Add a 4-digit SWAR follow-up to loop_parse_if_eight_digits (clang)
- Parallelize the exhaustive float32 sweeps across hardware threads (~75-88x)
- Fix spelling
- Fix compile error in clang<10: fails on pragma -Wc++20-extensions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fastfloat/{fastfloat_8.2.5.bb => fastfloat_8.2.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.2.5.bb => fastfloat_8.2.8.bb} (90%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.2.5.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.2.8.bb
similarity index 90%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.2.5.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.2.8.bb
index cbd7151f85..761bab84d7 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.2.5.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.2.8.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "05087a303dad9c98768b33c829d398223a649bc6"
+SRCREV = "e8ec8e8f34bd6142efdbf4c714734dcff51ea9ac"
 
 inherit cmake
-- 
2.43.0


