Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E48CFD2F6
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 18:03:13 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.703.1764266591985233790
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 10:03:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ne4UmsZK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20251127180308049a279d1c00020706-olompo@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20251127180308049a279d1c00020706
        for <openembedded-core@lists.openembedded.org>;
        Thu, 27 Nov 2025 19:03:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Te5jNkSZeC9mpqo2DE1K06zBXOcN1d8gzjPsTjpAqiw=;
 b=ne4UmsZK6jpOG26nzz5GmC6ZZuR6r6oRyhgfWNZE25v67+CgwWM3ot6GgtRh7Hsw2PWxXm
 F+ruk9ZEJCDVqWxZsH4lZ6QGjp7DDHdiPFQv/98L2aCa7wM/0Tzz1KTeBVDrk6AJhLkxEspo
 1WV9x3hVVYic7E0QIMtmXZwhgvKzP8/hNalSxEa7sBQxQ+zXHdj9SKampYXYCSrqqKHskcIp
 mTlcPY5QmO4kNd2MEp13gnacn9PMXLANjF0iSkrh4tkXF3mMoV5coNuibKVvPk4A4LYH18J4
 /VeULKZtB4I0ap7fj2IRd8er2X10tJRgyaSlSI3MmH0RRlgC67ZIHhPA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] libpng: upgrade 1.6.50 -> 1.6.51
Date: Thu, 27 Nov 2025 19:02:59 +0100
Message-Id: <20251127180259.3347636-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 18:03:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226855

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2025-64505, CVE-2025-64506, CVE-2025-64720 and CVE-2025-65018

Relase notes [1]:
Version 1.6.51 [November 21, 2025]
  Fixed CVE-2025-64505 (moderate severity):
    Heap buffer overflow in `png_do_quantize` via malformed palette index.
    (Reported by Samsung; analyzed by Fabio Gritti.)
  Fixed CVE-2025-64506 (moderate severity):
    Heap buffer over-read in `png_write_image_8bit` with 8-bit input and
    `convert_to_8bit` enabled.
    (Reported by Samsung and <weijinjinnihao@users.noreply.github.com>;
    analyzed by Fabio Gritti.)
  Fixed CVE-2025-64720 (high severity):
    Buffer overflow in `png_image_read_composite` via incorrect palette
    premultiplication.
    (Reported by Samsung; analyzed by John Bowler.)
  Fixed CVE-2025-65018 (high severity):
    Heap buffer overflow in `png_combine_row` triggered via
    `png_image_finish_read`.
    (Reported by <yosiimich@users.noreply.github.com>.)
  Fixed a memory leak in `png_set_quantize`.
    (Reported by Samsung; analyzed by Fabio Gritti.)
  Removed the experimental and incomplete ERROR_NUMBERS code.
    (Contributed by Tobias Stoeckmann.)
  Improved the RISC-V vector extension support; required RVV 1.0 or newer.
    (Contributed by Filip Wasil.)
  Added GitHub Actions workflows for automated testing.
  Performed various refactorings and cleanups.

[1] https://github.com/pnggroup/libpng/blob/v1.6.51/CHANGES#L6281C1-L6305C47

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpng/{libpng_1.6.50.bb => libpng_1.6.51.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.50.bb => libpng_1.6.51.bb} (89%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.50.bb b/meta/recipes-multimedia/libpng/libpng_1.6.51.bb
similarity index 89%
rename from meta/recipes-multimedia/libpng/libpng_1.6.50.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.51.bb
index aa2dc99f10..8cfb914917 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.50.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.51.bb
@@ -10,13 +10,13 @@ DEPENDS = "zlib"
 
 LIBV = "16"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "4df396518620a7aa3651443e87d1b2862e4e88cad135a8b93423e01706232307"
+SRC_URI[sha256sum] = "a050a892d3b4a7bb010c3a95c7301e49656d72a64f1fc709a90b8aded192bed2"
 
-MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
+MIRRORS += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
 UPSTREAM_CHECK_URI = "http://libpng.org/pub/png/libpng.html"
 

