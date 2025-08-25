Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D8F1CA0FE1
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 03:51:35 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.31262.1756093889098033038
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 20:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qCugWW0K;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756093889; x=1787629889;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8WmRDHNcYWQoyWlMrG6AOWusOOyBaCA9Zd+vgttxs7Y=;
  b=qCugWW0K9Y0t6cpHCgBijdgi8CY9ltjBhFARkkhxNSgpTMKlncz8Isqm
   wf8Mg/b8Yt6DNxUzHvjPDKi0XVqliy+rFeMolZkBM6VYR1or5tgwcNDqe
   7QZnhQv/UpC4/9w0OCptaEAuif1mqiSupKEdOUsOWJCZKJMb/dT+wABtu
   tt2xE9Iik/G/IEdhuBTdMhjjX4VMSAlcQnLCWQV0DLjKp4rmdcon9dS4X
   WPEpRM5E2qt6zrWyyAPAivZU59wQdieSX9kjTpSWMLVoVO81erkFRcuVL
   DmFkJEdvJ6p2Iy5HBFmZioTPXsN1zx4XHACbDDThEbVFdY0sqtGyab+ek
   A==;
X-CSE-ConnectionGUID: +yYfebEoQvOTC+DdfuPsMg==
X-CSE-MsgGUID: IMr2A4wxTd6GNjcF+2ooxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="197870811"
X-IronPort-AV: E=Sophos;i="6.17,312,1747666800"; 
   d="scan'208";a="197870811"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 12:51:27 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 6EBD842A309
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:27 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 272B6C00FDC
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:27 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id 0A8224045DB
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:25 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 130961A0074;
	Mon, 25 Aug 2025 11:51:22 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 01/10] harfbuzz: upgrade 11.2.1 -> 11.4.1
Date: Mon, 25 Aug 2025 11:51:00 +0800
Message-ID: <20250825035109.797-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222396

Changelog:
=============
- Speed up handling fonts with very large number of variations:
  - Drawing by up to 40%.
  - Calculating glyph extents by up to 15%.
  - Getting horizontal glyph advances by up to 45%.
  - Speed up getting horizontal and vertical glyph advances by up to 24%.
- Significantly speed up vertical text shaping.
- Various documentation improvements.
- Various build improvements.
- Various subsetting improvements.
- Various improvements to Rust font functions (fontations integration) and shaper (HarfRust integration).
- Rename harfruzz option and shaper to harfrust following upstream rename.
- Implement hb_face_reference_blob() for DirectWrite font functions.
- New API:
  +hb_font_get_glyph_origins_func_t
  +hb_font_get_glyph_h_origins_func_t
  +hb_font_get_glyph_v_origins_func_t
  +hb_font_funcs_set_glyph_h_origins_func()
  +hb_font_funcs_set_glyph_v_origins_func()
  +hb_font_get_glyph_h_origins()
  +hb_font_get_glyph_v_origins()
- Fix crasher in the glyph_v_origin function introduced in 11.3.0
- Fix build with non-compliant C++11 compilers that don't recognize the "and" keyword
- Fix bug in vertical shaping of fonts without the vmtx table
- General shaping and subsetting speedups.
- Fix in Graphite shaping backend when glyph advances became negative.
- Subsetting improvements, pruning empty mark-attachment lookups.
- Don't use the macro name _S, which is reserved by system liberaries.
- Build fixes and speedup.
- Add a kbts shaping backend that calls into the kb_text_shape
  single-header shaping library.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_11.2.1.bb => harfbuzz_11.4.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_11.2.1.bb => harfbuzz_11.4.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_11.4.1.bb
index 2c8a1363d0..a43d88fd89 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "093714c8548a285094685f0bdc999e202d666b59eeb3df2ff921ab68b8336a49"
+SRC_URI[sha256sum] = "7aafab93115eb56cdc9a931ab7d19ff60d7f2937b599d140f17236f374e32698"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.43.0


