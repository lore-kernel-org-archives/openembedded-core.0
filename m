Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48ECBE937E4
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 15:04:47 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.246404.1776006282945581779
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 08:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Mh6ylemd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202604121504402e8775cf07000207b4-uq1hcn@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202604121504402e8775cf07000207b4
        for <openembedded-core@lists.openembedded.org>;
        Sun, 12 Apr 2026 17:04:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=IIaglLkSqtUC6aFN+optmKRSBNlshDjA4OJ29H80shs=;
 b=Mh6ylemdpClK3khn++0akf7pUR2Hk8Mk76qzvL6tWusFZsQugsBZjGcWO8W3X2r5wQoftN
 tnVmdb1wL+rjwRV4bdrFvWhDb0myCGvpwKTJNsWDIheO1YkBOLpMd66zQ5RrwQKOuJU1UVbk
 oaS5RUFBu/K51vGT8Kxwe5D2yYM2ejGXUZtFGCG6SfyW8wvkJ9yYlPE9IvztBHun4iXqNDbp
 2GlBntXUc21VonXYHv0dnJgwz5ZSrDKKbIbsMXN7Ywe/zSx1WknwS1jSt+JGnzpdbXNAD3sg
 cOPjSetuJPfn/j1+kKvkopzfXNXNrloBo6W6fkZcwpxgAnxtq88WtO9w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [whinlatter][PATCH] libpng: upgrade 1.6.55 -> 1.6.56
Date: Sun, 12 Apr 2026 17:03:47 +0200
Message-ID: <20260412150347.2510660-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 15:04:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235069

From: Peter Marko <peter.marko@siemens.com>

Release notes [1]:
 * Fixed CVE-2026-33416 (high severity):
   Use-after-free via pointer aliasing in `png_set_tRNS` and `png_set_PLTE`.
   (Reported by Halil Oktay and Ryo Shimada;
   fixed by Halil Oktay and Cosmin Truta.)
 * Fixed CVE-2026-33636 (high severity):
   Out-of-bounds read/write in the palette expansion on ARM Neon.
   (Reported by Taegu Ha; fixed by Taegu Ha and Cosmin Truta.)
 * Fixed uninitialized reads beyond `num_trans` in `trans_alpha` buffers.
   (Contributed by Halil Oktay.)
 * Fixed stale `info_ptr->palette` after in-place gamma and background
   transforms.
 * Fixed wrong channel indices in `png_image_read_and_map` RGB_ALPHA path.
   (Contributed by Yuelin Wang.)
 * Fixed wrong background color in colormap read.
   (Contributed by Yuelin Wang.)
 * Fixed dead loop in sPLT write.
   (Contributed by Yuelin Wang.)
 * Added missing null pointer checks in four public API functions.
   (Contributed by Yuelin Wang.)
 * Validated shift bit depths in `png_set_shift` to prevent infinite loop.
   (Contributed by Yuelin Wang.)
 * Avoided undefined behavior in library and tests.
 * Deprecated the hardly-ever-tested POINTER_INDEXING config option.
 * Added negative-stride test coverage for the simplified API.
 * Fixed memory leaks and API misuse in oss-fuzz.
   (Contributed by Owen Sanzas.)
 * Implemented various fixes and improvements in oss-fuzz.
   (Contributed by Bob Friesenhahn and Philippe Antoine.)
 * Performed various refactorings and cleanups.

[1] https://github.com/pnggroup/libpng/blob/v1.6.56/ANNOUNCE

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpng/{libpng_1.6.55.bb => libpng_1.6.56.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.55.bb => libpng_1.6.56.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.55.bb b/meta/recipes-multimedia/libpng/libpng_1.6.56.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.55.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.56.bb
index 18ecc9d855..6ae500ca92 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.55.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.56.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "d925722864837ad5ae2a82070d4b2e0603dc72af44bd457c3962298258b8e82d"
+SRC_URI[sha256sum] = "f7d8bf1601b7804f583a254ab343a6549ca6cf27d255c302c47af2d9d36a6f18"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 

