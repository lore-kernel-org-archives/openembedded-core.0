Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74721D3B7E8
	for <webhook@archiver.kernel.org>; Sat,  6 Dec 2025 23:43:14 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17543.1765064588495137139
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Dec 2025 15:43:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=mIfC95qt;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20251206234304aea177b45b000207ca-l__5ii@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20251206234304aea177b45b000207ca
        for <openembedded-core@lists.openembedded.org>;
        Sun, 07 Dec 2025 00:43:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=il8pNN+0C5TEpqrVp0nZ9HHTealYvT5FOWXGQuukGnQ=;
 b=mIfC95qtcOs9GoDgysm9XCGW1boGDhqOh9tb7dyncuLY+kUbN9e7exnAA6mIEqaXx/Q5SE
 VX2yC0Y/u5RfkZxLf5ne434w8Dztb0ZA3JUtO8Pj9ZkI8N4E6u4X7M4eovDJMdCpfrav3gVh
 oJclpW/cIzfh97j3rl/R+t4DO8G+nObLkthtrx6iSS3OGI5BmJFh5rX1HN9LTTKCgHYo0zja
 fgAzZ68Nxkfz7WAakMPuiBoordSuLoj+VrId4jyxaOYJc9d76qJU5Uy2Kpj/Ygs/uYafw/Iq
 J8wiKprYeSH4tpljguM3Xh/T9Jq2wRNv6w0oOzLSZMnay8UKs+J+J6hg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] libpng: patch CVE-2025-66293
Date: Sun,  7 Dec 2025 00:42:31 +0100
Message-Id: <20251206234231.3948725-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Dec 2025 23:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227371

From: Peter Marko <peter.marko@siemens.com>

Pick patches per nvd report [1] and github advisory [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-66293
[2] https://github.com/pnggroup/libpng/security/advisories/GHSA-9mpm-9pxh-mg4f

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpng/files/CVE-2025-66293-01.patch      |  60 +++++++++
 .../libpng/files/CVE-2025-66293-02.patch      | 125 ++++++++++++++++++
 .../libpng/libpng_1.6.42.bb                   |   2 +
 3 files changed, 187 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-66293-01.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-66293-02.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-66293-01.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-66293-01.patch
new file mode 100644
index 00000000000..0b958b9f1be
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2025-66293-01.patch
@@ -0,0 +1,60 @@
+From 788a624d7387a758ffd5c7ab010f1870dea753a1 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Sat, 29 Nov 2025 00:39:16 +0200
+Subject: [PATCH] Fix an out-of-bounds read in `png_image_read_composite`
+
+Add a defensive bounds check before calling PNG_sRGB_FROM_LINEAR to
+prevent reading up to 506 entries (1012 bytes) past `png_sRGB_base[]`.
+
+For palette images with gamma, `png_init_read_transformations`
+clears PNG_COMPOSE after compositing on the palette, but it leaves
+PNG_FLAG_OPTIMIZE_ALPHA set. The simplified API then calls
+`png_image_read_composite` with sRGB data (not linear premultiplied),
+causing the index to reach 1017. (The maximum valid index is 511.)
+
+NOTE:
+This is a defensive fix that addresses the security issue (out-of-bounds
+read) but *NOT* the correctness issue (wrong output). When the clamp
+triggers, the affected pixels are clamped to white instead of the
+correct composited color. Valid PNG images may render incorrectly with
+the simplified API.
+
+TODO:
+We already know the root cause is a flag synchronization error.
+For palette images with gamma, `png_init_read_transformations`
+clears PNG_COMPOSE but leaves PNG_FLAG_OPTIMIZE_ALPHA set, causing
+`png_image_read_composite` to misinterpret sRGB data as linear
+premultiplied. However, we have yet to implement an architectural fix
+that requires coordinating the simplified API with the transformation
+pipeline.
+
+Reported-by: flyfish101 <flyfish101@users.noreply.github.com>
+
+CVE: CVE-2025-66293
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/788a624d7387a758ffd5c7ab010f1870dea753a1]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ pngread.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/pngread.c b/pngread.c
+index 79917daaa..ab62edd9d 100644
+--- a/pngread.c
++++ b/pngread.c
+@@ -3406,9 +3406,14 @@ png_image_read_composite(png_voidp argument)
+                         component += (255-alpha)*png_sRGB_table[outrow[c]];
+ 
+                         /* So 'component' is scaled by 255*65535 and is
+-                         * therefore appropriate for the sRGB to linear
+-                         * conversion table.
++                         * therefore appropriate for the sRGB-to-linear
++                         * conversion table.  Clamp to the valid range
++                         * as a defensive measure against an internal
++                         * libpng bug where the data is sRGB rather than
++                         * linear premultiplied.
+                          */
++                        if (component > 255*65535)
++                           component = 255*65535;
+                         component = PNG_sRGB_FROM_LINEAR(component);
+                      }
+ 
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-66293-02.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-66293-02.patch
new file mode 100644
index 00000000000..ba563e1c5a5
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2025-66293-02.patch
@@ -0,0 +1,125 @@
+From a05a48b756de63e3234ea6b3b938b8f5f862484a Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Mon, 1 Dec 2025 22:31:54 +0200
+Subject: [PATCH] Finalize the fix for out-of-bounds read in
+ `png_image_read_composite`
+
+Following up on commit 788a624d7387a758ffd5c7ab010f1870dea753a1.
+
+The previous commit added a defensive bounds check to address the
+security issue (out-of-bounds read), but noted that the correctness
+issue remained: when the clamp triggered, the affected pixels were
+clamped to white instead of the correct composited color.
+
+This commit addresses the correctness issue by fixing the flag
+synchronization error identified in the previous commit's TODO:
+
+1. In `png_init_read_transformations`:
+   Clear PNG_FLAG_OPTIMIZE_ALPHA when clearing PNG_COMPOSE for palette
+   images. This correctly signals that the data is sRGB, not linear
+   premultiplied.
+
+2. In `png_image_read_composite`:
+   Check PNG_FLAG_OPTIMIZE_ALPHA and use the appropriate composition
+   formula. When set, use the existing linear composition. When cleared
+   (palette composition already done), use sRGB composition to match
+   what was done to the palette.
+
+Retain the previous clamp to the valid range as belt-and-suspenders
+protection against any other unforeseen cases.
+
+CVE: CVE-2025-66293
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/a05a48b756de63e3234ea6b3b938b8f5f862484a]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ pngread.c  | 56 ++++++++++++++++++++++++++++++++++++------------------
+ pngrtran.c |  1 +
+ 2 files changed, 39 insertions(+), 18 deletions(-)
+
+diff --git a/pngread.c b/pngread.c
+index ab62edd9d..f8ca2b7e3 100644
+--- a/pngread.c
++++ b/pngread.c
+@@ -3340,6 +3340,7 @@ png_image_read_composite(png_voidp argument)
+       ptrdiff_t    step_row = display->row_bytes;
+       unsigned int channels =
+           (image->format & PNG_FORMAT_FLAG_COLOR) != 0 ? 3 : 1;
++      int optimize_alpha = (png_ptr->flags & PNG_FLAG_OPTIMIZE_ALPHA) != 0;
+       int pass;
+ 
+       for (pass = 0; pass < passes; ++pass)
+@@ -3396,25 +3397,44 @@ png_image_read_composite(png_voidp argument)
+ 
+                      if (alpha < 255) /* else just use component */
+                      {
+-                        /* This is PNG_OPTIMIZED_ALPHA, the component value
+-                         * is a linear 8-bit value.  Combine this with the
+-                         * current outrow[c] value which is sRGB encoded.
+-                         * Arithmetic here is 16-bits to preserve the output
+-                         * values correctly.
+-                         */
+-                        component *= 257*255; /* =65535 */
+-                        component += (255-alpha)*png_sRGB_table[outrow[c]];
++                        if (optimize_alpha != 0)
++                        {
++                           /* This is PNG_OPTIMIZED_ALPHA, the component value
++                            * is a linear 8-bit value.  Combine this with the
++                            * current outrow[c] value which is sRGB encoded.
++                            * Arithmetic here is 16-bits to preserve the output
++                            * values correctly.
++                            */
++                           component *= 257*255; /* =65535 */
++                           component += (255-alpha)*png_sRGB_table[outrow[c]];
+ 
+-                        /* So 'component' is scaled by 255*65535 and is
+-                         * therefore appropriate for the sRGB-to-linear
+-                         * conversion table.  Clamp to the valid range
+-                         * as a defensive measure against an internal
+-                         * libpng bug where the data is sRGB rather than
+-                         * linear premultiplied.
+-                         */
+-                        if (component > 255*65535)
+-                           component = 255*65535;
+-                        component = PNG_sRGB_FROM_LINEAR(component);
++                           /* Clamp to the valid range to defend against
++                            * unforeseen cases where the data might be sRGB
++                            * instead of linear premultiplied.
++                            * (Belt-and-suspenders for GitHub Issue #764.)
++                            */
++                           if (component > 255*65535)
++                              component = 255*65535;
++
++                           /* So 'component' is scaled by 255*65535 and is
++                            * therefore appropriate for the sRGB-to-linear
++                            * conversion table.
++                            */
++                           component = PNG_sRGB_FROM_LINEAR(component);
++                        }
++                        else
++                        {
++                           /* Compositing was already done on the palette
++                            * entries.  The data is sRGB premultiplied on black.
++                            * Composite with the background in sRGB space.
++                            * This is not gamma-correct, but matches what was
++                            * done to the palette.
++                            */
++                           png_uint_32 background = outrow[c];
++                           component += ((255-alpha) * background + 127) / 255;
++                           if (component > 255)
++                              component = 255;
++                        }
+                      }
+ 
+                      outrow[c] = (png_byte)component;
+diff --git a/pngrtran.c b/pngrtran.c
+index 2f5202255..507d11381 100644
+--- a/pngrtran.c
++++ b/pngrtran.c
+@@ -1760,6 +1760,7 @@ png_init_read_transformations(png_structrp png_ptr)
+              * transformations elsewhere.
+              */
+             png_ptr->transformations &= ~(PNG_COMPOSE | PNG_GAMMA);
++            png_ptr->flags &= ~PNG_FLAG_OPTIMIZE_ALPHA;
+          } /* color_type == PNG_COLOR_TYPE_PALETTE */
+ 
+          /* if (png_ptr->background_gamma_type!=PNG_BACKGROUND_GAMMA_UNKNOWN) */
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index 2d5216cb655..6dc7ffe2722 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -19,6 +19,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz
            file://CVE-2025-64720.patch \
            file://CVE-2025-65018-01.patch \
            file://CVE-2025-65018-02.patch \
+           file://CVE-2025-66293-01.patch \
+           file://CVE-2025-66293-02.patch \
 "
 
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"

