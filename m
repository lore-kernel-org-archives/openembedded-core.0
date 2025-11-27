Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEDCAD116F3
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 18:03:43 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.700.1764266616896783941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 10:03:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=OzxrFKSx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20251127180334f26fec16e500020725-xqktiy@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20251127180334f26fec16e500020725
        for <openembedded-core@lists.openembedded.org>;
        Thu, 27 Nov 2025 19:03:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=+ZPf++wKhBveR8YzTc/qi16YEyFJ0/zBz7KuKhDMQGg=;
 b=OzxrFKSx0d9QenLD6kf0apWwRGPINv0/xOxUKDGM9lcHxrGr/D3ovkwx8NxEe9EhNUiZ3C
 jhuLWz29OciNYtM/C/u5I7579QOE1TGdUsN+l0g+TjBiyQecMzNIDzIoYTXZ8GFiRzPHWozI
 gNcb8ptXaFkB8EExqtVFWNmzcpnFpxQt9sUK9/TAOO6O2eBbf7kMPzq0HOu7SauqlvnyEAGq
 jJLaiPMHGAfsiBgP1wezRgWxZeCgy1lMouPN7vlYbHFRvbSOqRVQH3wZXYr4ve3//G3Unvjo
 RZvequgKVVQnMKuUCa5PPSwkkiO+DXh9HVGNPtS3rKhkDWWkzLIaIunA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 3/4] libpng: patch CVE-2025-64720
Date: Thu, 27 Nov 2025 19:03:24 +0100
Message-Id: <20251127180325.3347669-3-peter.marko@siemens.com>
In-Reply-To: <20251127180325.3347669-1-peter.marko@siemens.com>
References: <20251127180325.3347669-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 18:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226858

From: Peter Marko <peter.marko@siemens.com>

Pick commit per NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpng/files/CVE-2025-64720.patch         | 103 ++++++++++++++++++
 .../libpng/libpng_1.6.42.bb                   |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64720.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-64720.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-64720.patch
new file mode 100644
index 00000000000..08df7c32107
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2025-64720.patch
@@ -0,0 +1,103 @@
+From 08da33b4c88cfcd36e5a706558a8d7e0e4773643 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Wed, 12 Nov 2025 13:46:23 +0200
+Subject: [PATCH] Fix a buffer overflow in `png_init_read_transformations`
+
+The palette compositing code in `png_init_read_transformations` was
+incorrectly applying background compositing when PNG_FLAG_OPTIMIZE_ALPHA
+was set. This violated the premultiplied alpha invariant
+`component <= alpha` expected by `png_image_read_composite`, causing
+values that exceeded the valid range for the PNG_sRGB_FROM_LINEAR lookup
+tables.
+
+When PNG_ALPHA_OPTIMIZED is active, palette entries should contain pure
+premultiplied RGB values without background compositing. The background
+compositing must happen later in `png_image_read_composite` where the
+actual background color from the PNG file is available.
+
+The fix consists in introducing conditional behavior based on
+PNG_FLAG_OPTIMIZE_ALPHA: when set, the code performs only
+premultiplication using the formula `component * alpha + 127) / 255`
+with proper gamma correction. When not set, the original background
+compositing calculation based on the `png_composite` macro is preserved.
+
+This prevents buffer overflows in `png_image_read_composite` where
+out-of-range premultiplied values would cause out-of-bounds array access
+in `png_sRGB_base[]` and `png_sRGB_delta[]`.
+
+Reported-by: Samsung-PENTEST <Samsung-PENTEST@users.noreply.github.com>
+Analyzed-by: John Bowler <jbowler@acm.org>
+
+CVE: CVE-2025-64720
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/08da33b4c88cfcd36e5a706558a8d7e0e4773643]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ pngrtran.c | 52 ++++++++++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 42 insertions(+), 10 deletions(-)
+
+diff --git a/pngrtran.c b/pngrtran.c
+index 548780030..2f5202255 100644
+--- a/pngrtran.c
++++ b/pngrtran.c
+@@ -1698,19 +1698,51 @@ png_init_read_transformations(png_structrp png_ptr)
+                   }
+                   else /* if (png_ptr->trans_alpha[i] != 0xff) */
+                   {
+-                     png_byte v, w;
++                     if ((png_ptr->flags & PNG_FLAG_OPTIMIZE_ALPHA) != 0)
++                     {
++                        /* Premultiply only:
++                         * component = round((component * alpha) / 255)
++                         */
++                        png_uint_32 component;
+ 
+-                     v = png_ptr->gamma_to_1[palette[i].red];
+-                     png_composite(w, v, png_ptr->trans_alpha[i], back_1.red);
+-                     palette[i].red = png_ptr->gamma_from_1[w];
++                        component = png_ptr->gamma_to_1[palette[i].red];
++                        component =
++                            (component * png_ptr->trans_alpha[i] + 128) / 255;
++                        palette[i].red = png_ptr->gamma_from_1[component];
+ 
+-                     v = png_ptr->gamma_to_1[palette[i].green];
+-                     png_composite(w, v, png_ptr->trans_alpha[i], back_1.green);
+-                     palette[i].green = png_ptr->gamma_from_1[w];
++                        component = png_ptr->gamma_to_1[palette[i].green];
++                        component =
++                            (component * png_ptr->trans_alpha[i] + 128) / 255;
++                        palette[i].green = png_ptr->gamma_from_1[component];
+ 
+-                     v = png_ptr->gamma_to_1[palette[i].blue];
+-                     png_composite(w, v, png_ptr->trans_alpha[i], back_1.blue);
+-                     palette[i].blue = png_ptr->gamma_from_1[w];
++                        component = png_ptr->gamma_to_1[palette[i].blue];
++                        component =
++                            (component * png_ptr->trans_alpha[i] + 128) / 255;
++                        palette[i].blue = png_ptr->gamma_from_1[component];
++                     }
++                     else
++                     {
++                        /* Composite with background color:
++                         * component =
++                         *    alpha * component + (1 - alpha) * background
++                         */
++                        png_byte v, w;
++
++                        v = png_ptr->gamma_to_1[palette[i].red];
++                        png_composite(w, v,
++                            png_ptr->trans_alpha[i], back_1.red);
++                        palette[i].red = png_ptr->gamma_from_1[w];
++
++                        v = png_ptr->gamma_to_1[palette[i].green];
++                        png_composite(w, v,
++                            png_ptr->trans_alpha[i], back_1.green);
++                        palette[i].green = png_ptr->gamma_from_1[w];
++
++                        v = png_ptr->gamma_to_1[palette[i].blue];
++                        png_composite(w, v,
++                            png_ptr->trans_alpha[i], back_1.blue);
++                        palette[i].blue = png_ptr->gamma_from_1[w];
++                     }
+                   }
+                }
+                else
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index ab043e33384..6f5b69b7540 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -16,6 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz
            file://CVE-2025-64505-02.patch \
            file://CVE-2025-64505-03.patch \
            file://CVE-2025-64506.patch \
+           file://CVE-2025-64720.patch \
 "
 
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"

