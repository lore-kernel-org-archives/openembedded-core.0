Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7473CA5FE3
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 07:36:36 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6165.1790926590533135190
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 00:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PkRT+RTw;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CC9EA4E4110F
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 07:36:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A2705603DC
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 07:36:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2CC710328460;
	Fri,  2 Oct 2026 09:36:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790926588; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eLbs0a2MUxs5KsiELMyDQ05Q2ge4cJ5MbWLv5XeD1Rc=;
	b=PkRT+RTwWvzvkqkp/Dx4281+hmJENGHO26o4Igm9S4gdCLLlD3QQ5x2BefO92LaidXqXqJ
	ZJ8BDtaKnij/zZRz/e2EFeCAGwhrh2h1o23EtXJV35bEZlatSdOvcCKVLfiShSGFW34RBB
	xjmZj/VcTI5+d4DIiX/SIymdifzn0MPuO8xjyIFRrHKxdmtvf9mLYcqx0ELVFj+W4r0Dxz
	CWY9TDKOmADRCUI1T23BhiWYB7qPYKiz2fWPkujMMW6ypYw4DhZ9Zr5ffdvoZL2VAszlxH
	9vU9ZWFO+p1+GY3/FNaAJCcuzVkI8RkR7QLc6IeFVND+T9Yb9nBB7HzTyam/sg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 02 Oct 2026 09:36:08 +0200
Subject: [PATCH 5/9] harfbuzz: upgrade 14.5.0 -> 14.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-mathieu-2026-10-01-upgrades-v1-5-3fdeab391403@bootlin.com>
References: <20261002-mathieu-2026-10-01-upgrades-v1-0-3fdeab391403@bootlin.com>
In-Reply-To: <20261002-mathieu-2026-10-01-upgrades-v1-0-3fdeab391403@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790926581; l=2054;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=0aY7BW4JTkku3gWu3351W8yPSO1dLzTu+fZMlqxlTRE=;
 b=721WiQFOFaFaLL0TYjSd+tUGhmsb7LbCPUH5plCqBtg1YxIIqtmiPrJ4cl5H4Lu1T1fEGOZ0C
 caYt8pWLJz1BJy0XQ0VlJTkdDno7cESuiEVFMWW7F04oV9ar8193XAJ
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:36:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247078

Overview of changes leading to 14.5.1
Thursday, October 1, 2026
=====================================
- Map the `fonupa` (Uralic Phonetic Alphabet) BCP 47 variant to the `UPPH`
  OpenType language system tag.
- Produce smaller `cmap` subtables and drop no-op variation device tables when
  subsetting.
- Fix possible deadlock in `hb_font_destroy()` after `hb_ft_font_set_funcs()`,
  a regression from 14.5.0.
- Fix signed integer overflows when scaling glyph extents and applying
  synthetic slant and emboldening.
- Fix float-to-int overflow in `VARC` component axis coordinates with
  malformed fonts.
- Fix a memory leak in the experimental WebAssembly shaper when shaping with
  features.
- Fix accumulator overflows in the experimental raster library when rendering
  glyphs with very many overlapping edges.
- Fix heap buffer overflow in the experimental GPU library with malicious
  `COLR` fonts.
- Various build and CI fixes.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../harfbuzz/{harfbuzz_14.5.0.bb => harfbuzz_14.5.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.1.bb
similarity index 96%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_14.5.1.bb
index 438aa23133ce..d10f1bfa01b0 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b7132e148358a45185c9feafd049dbaf243649d3c44414b3534d9c95d18592b9"
+SRC_URI[sha256sum] = "7e2fa4e8c7c98e8d8140671f5772542afaaa6acccfbd746506886b6d85f7f8d6"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
 

-- 
2.47.3


