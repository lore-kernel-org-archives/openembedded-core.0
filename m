Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFA6F588F0
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:22 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20381.1776765375556297005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Rq273N8Z;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765380; x=1808301380;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/IzxBLaHFeJ9zLE5uLm3NEw/0o28+8RGSBAb5+KMbho=;
  b=Rq273N8ZUaAEMbo1CRZ4Rf96IcQ6nZQO0u1TFKT0EpI66Y2OXgqsnckF
   xXWOG2uXdEffjLMnpdg21DdXsY7h2BOUqCuXXfTG3dG6X5H9CQpelc1kA
   hQI0+f5Ius/LooM2EUFGi9W6tbQXvVS2355ESHZvztCebaOJpyoUnUldt
   Jh4JIkGRTjN2+qs1GHFuHwhbA1/5y3cw+43aW2bogoBgxuVpERRWWy+Jk
   Bl0KQbs03DnJe52Lc9zSUrOcO7t2zYdczPNxOElgrd4ngYl3aaQrxQDzI
   ArpWus1WlgWdSzk88Un+GI1q/KnePthrjenQlP553mfvf/jJvskve24yR
   Q==;
X-CSE-ConnectionGUID: 1xcByMu5QIixUNFQdQWYyA==
X-CSE-MsgGUID: U4TjwOKuRma/Rj/s04QOGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="237674543"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="237674543"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:20 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E4A6F1000348
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:19 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 971AA1004152
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 116E314000E6;
	Tue, 21 Apr 2026 09:56:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/49] fastfloat: upgrade 8.2.4 -> 8.2.5
Date: Tue, 21 Apr 2026 17:55:18 +0800
Message-ID: <20260421095559.1856-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235616

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix Bazel build with bzlmod
- Replace std::min with ternary operators to avoid dependency

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fastfloat/{fastfloat_8.2.4.bb => fastfloat_8.2.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.2.4.bb => fastfloat_8.2.5.bb} (90%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.2.4.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.2.5.bb
similarity index 90%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.2.4.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.2.5.bb
index a5b48d259b..cbd7151f85 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.2.4.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.2.5.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "eb9ab42c0aa86d3cc41871ba7306527d95077b3b"
+SRCREV = "05087a303dad9c98768b33c829d398223a649bc6"
 
 inherit cmake
-- 
2.43.0


