Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E68C54751
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:02 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.45972.1747040640194185324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=B2paFGhJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040640; x=1778576640;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xLPLvuz3Q1JwkELim+YwaZc4Xx21qI/pV3sMrTErMKk=;
  b=B2paFGhJ7oKajrOFMaICY6JavCyOhxH+g6zRFfX4nOFZAQlj+CPk3Rft
   joe+J4knR4h69XyatPVSIBhXoDpsujMXNtub3EvPLFHaB29D5ITdYPYtX
   c05qH2b8iJ6FTR8k4ZEnCwt1sDlCuxnmDlVxLJBA2sfiF9b7Eg5cOf5j7
   Ia5eoPTCANBBunQw09O0+lKSPoRvhpxNS/IeAqHQp+MuAu1nl/u4JAjWE
   10KolMvfWLBo/HQeVuksE2ScJhEjt5fAHT22omB//79wX/ZJhvFv0SjJT
   CyXhTEEwXX7mYjp99yotB7cKyOkzVAZ5hm0TmYtuO6JeP2nutoc9JIqpI
   g==;
X-CSE-ConnectionGUID: r8PxFqQKSdK0zyoFt3MkwQ==
X-CSE-MsgGUID: u+u0VpfxTFeil/7XcZC6EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="187121898"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="187121898"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:03:58 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 77C58D6EFA
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3AC48CFAB3
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:56 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EF2911A00A0;
	Mon, 12 May 2025 17:03:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/56] harfbuzz: upgrade 11.1.0 -> 11.2.0
Date: Mon, 12 May 2025 17:03:00 +0800
Message-Id: <1747040619-7566-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216314

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Painting of COLRv1 fonts without clip boxes is now about 10 times faster.
- Synthetic bold/slant of a sub font is now respected, instead of using the parent's.
- Glyph extents for fonts synthetic bold/slant are now accurately calculated.
- Various build fixes
- New API:
  +hb_font_is_synthetic()
  +hb_font_draw_glyph_or_fail_func_t
  +hb_font_paint_glyph_or_fail_func_t
  +hb_font_funcs_set_draw_glyph_or_fail_func()
  +hb_font_funcs_set_paint_glyph_or_fail_func()
  +hb_font_draw_glyph_or_fail()
  +hb_font_paint_glyph_or_fail()
- Deprecated API:
  -hb_font_draw_glyph_func_t
  -hb_font_paint_glyph_func_t
  -hb_font_funcs_set_draw_glyph_func()
  -hb_font_funcs_set_paint_glyph_func()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_11.1.0.bb => harfbuzz_11.2.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_11.1.0.bb => harfbuzz_11.2.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_11.2.0.bb
index 9eaacdaa5a..db5a04486c 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 SRC_URI += "file://0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch"
-SRC_URI[sha256sum] = "477f0d48c34dc32093b45304178eb9733361ca1832b5159879c99e6d40227969"
+SRC_URI[sha256sum] = "50f7d0a208367e606dbf6eecc5cfbecc01a47be6ee837ae7aff2787e24b09b45"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.43.0


