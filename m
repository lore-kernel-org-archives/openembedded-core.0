Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73127EC0495
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:09:57 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14968.1772532591968793491
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:09:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=U3q6K/sN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532592; x=1804068592;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UmhJ6gT0tOgTc1qvwhcdhRRCxYOuV1yqslpW9AtcXRE=;
  b=U3q6K/sNn8yxtdOitBU6M8awduoMEXdeV2MbTfmyFD6RZbMovol1qqYD
   MiLqYs+KlHn4UcYUwXB5rj6lqJos385b+rIs/YzQjDZhvUjWKl5joF0hp
   Dxpw/tkn/EojA5jm4CF+MtWq8MAS2M3jA5EesMMrAWXZvD0LJfTtq/4T9
   a6xthDmZZpMod70tN/TlvdizZUrR5Aw7yQtIWQklf8uxyMUTYOdO+vaOh
   0zHORlq9wJ5hI8yX7xexnA7dsnILy104sFOvAWF1FJPAudcFBtEP4e8lU
   j//979jXQCERnpqV0GDACYWceehkktnI9P8SWIblVIWq80NNtyEb6IASn
   g==;
X-CSE-ConnectionGUID: alNc5bOdRF6OWu28/MrFiQ==
X-CSE-MsgGUID: WGO8xt6kSdaHMRWcDmDFmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="232410379"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="232410379"
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 5810F1C000BB
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:09:50 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 012BE1C002AF
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:09:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 4B0CC1001CE3;
	Tue,  3 Mar 2026 10:09:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/23] fastfloat: upgrade 8.2.2 -> 8.2.3
Date: Tue,  3 Mar 2026 18:09:10 +0800
Message-ID: <20260303100929.1624-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260303100929.1624-1-wangmy@fujitsu.com>
References: <20260303100929.1624-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:09:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232281

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- add base check for uint8
- fix issue with s390x.
- optimize uint16 parsing
- optimize fastfloat_strncasecmp
- Bump the github-actions group across 1 directory with 4 updates
- fix early return error in fastfloat_strncasecmp
- Clarify behavior for underflow
- Fix overzealous build-time /permissive- propagating to compile-time (cross-compilation bug)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fastfloat/{fastfloat_8.2.2.bb => fastfloat_8.2.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.2.2.bb => fastfloat_8.2.3.bb} (90%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.2.2.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.2.3.bb
similarity index 90%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.2.2.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.2.3.bb
index 28d59ca09b..9ccf3dce0c 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.2.2.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.2.3.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "97b54ca9e75f5303507699d27c6b4f4efe4641a1"
+SRCREV = "01ce95dfe46abccf3264fbccf9f5139ea9016cd2"
 
 inherit cmake
-- 
2.43.0


