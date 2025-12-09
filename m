Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425B1D3B9AB
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 21:53:23 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2555.1765317199668106990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 13:53:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Dz/pOoVC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-297d4a56f97so77662035ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 13:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1765317199; x=1765921999; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqRj/LDZm6+6C1utY/qRR821TZhOx+AkCJ0vxl7Wh3M=;
        b=Dz/pOoVCo2iSV5laLDZaMTchy+Ve/7+kHll9VgMVtR94glb9QxcPf8OSeTQkHIif/4
         RZkKrCOu+CnuYBph+ivTMMsH8+7ia+my2bGwslPCM2T5VPNtm5y5qauIcMDmYRBW3qIW
         4LmhqN0KcwlFm0XMtlKC6K37wi8DhAwxKOfPfnZkX5s/+mhkm5zSW0abUt9XcSbrxTBA
         6OCRlc/rgaAucsF22sTkWjxFduI1qtc2gUw15Eul6rZbgJ7+bgrQABdVBry2IsvwK3zA
         mMIcqzBfTnCMB0zWTu/QcV3AL+qGsjDABsgACpS3aNTmMvWUvo5HSwH1qTXpU1dVtC/8
         KYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765317199; x=1765921999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KqRj/LDZm6+6C1utY/qRR821TZhOx+AkCJ0vxl7Wh3M=;
        b=Rm5O+yGgIs0Arj8uC+yq8inJM91AoK3eacyKaEoOXe9V/j1TygLQbIUy8UV1WOzMAw
         Axe6Hz7mVGaobCO07kIWf6BNO0/yaFVn5QOCSGX76FCtBZCVPJ+h962VN/Meg00vG06g
         7/UpExgXFma7a34Y0WDLya+wWG3WvBcTGUse5egbkDC3ZBXFIF2HAWCv0uY8J8jPiwFK
         YuvYHWhMkiViaUub0E9LcX/mNvBBm0KddAeYYJyT5+qwX+8xlerf+/9iT8VRitWWAT7n
         sMyYSlqHbWun9F9VmeYhtXBgS3+HaPuQLnWp2if3kK78wFR/Atp8PaL5zWqwNLLzXbne
         OSXA==
X-Gm-Message-State: AOJu0YylaMeiVUVEhB8KXN3ZOmRU7+thFkVRmQNKlWmuASrxYbK5RIaP
	chTE/R9wWp6mFI0l7wxGaiDG61UvuSo5jR477ZZFq4IZA1YnOPMLFbt+hMnBeXpX0xs/KUthYjG
	d0gHw
X-Gm-Gg: AY/fxX4FbgNiQoO8uYHNSjtFqK5kjHz3IzPyUtgUN+MqoRrtACv2g6arDuK7RKI8M49
	M9z+c21saYe8BTbS2RPdruHISzas37wsQKE4UJpHgUuBUKFEfb9DIHQLojQp1v5O1aaBzirFCs1
	IKC6ngp6+UMIpwzz9572Nwl0msBeHdYMXxKOVkLpVJKBwPePEOuiI98EY0+4tpYZC+DPDPEpbHU
	DQTrvS/EfAoeWro1eA4sPkYWpOpzFF+S2+INrbhsG6NcHgxRXIK+GT/e+5Q9X70Klx4lOUHKEC9
	cxdDXmdbrqwW8QR6j8jhcGq/F1OWWu54IOrqwegSG1s1I7shvD8TQLeidAQfaXriN5VtbtpshLi
	ENfWvfw/uD5atjzPT9tUmOl09Eh64wlSLUIgWZfQKJBMnIvjLEutVcBRqtACmu2Egl05DyEgGkk
	usMg==
X-Google-Smtp-Source: AGHT+IEjWjlGYYLcMU65iOLQuKrML0HI2tt2MT8qKmF3ylUY4fduymWl4oCfjeeY6th3BN9uGu9XYg==
X-Received: by 2002:a17:90b:2e10:b0:349:3fe8:e7de with SMTP id 98e67ed59e1d1-34a728d5ff7mr157880a91.28.1765317198662;
        Tue, 09 Dec 2025 13:53:18 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5aef:241f:68f0:d970])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a6ff012e6sm412296a91.2.2025.12.09.13.53.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 13:53:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/4] libpng: patch CVE-2025-66293
Date: Tue,  9 Dec 2025 13:53:05 -0800
Message-ID: <c33ebd0882288a962c089b423cc2468a7c84c2e7.1765317045.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765317045.git.steve@sakoman.com>
References: <cover.1765317045.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 21:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227449

From: Peter Marko <peter.marko@siemens.com>

Pick patches per nvd report [1] and github advisory [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-66293
[2] https://github.com/pnggroup/libpng/security/advisories/GHSA-9mpm-9pxh-mg4f

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libpng/files/CVE-2025-66293-01.patch      |  60 +++++++++
 .../libpng/files/CVE-2025-66293-02.patch      | 125 ++++++++++++++++++
 .../libpng/libpng_1.6.39.bb                   |   2 +
 3 files changed, 187 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-66293-01.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-66293-02.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-66293-01.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-66293-01.patch
new file mode 100644
index 0000000000..d3db455cdf
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
+@@ -3404,9 +3404,14 @@ png_image_read_composite(png_voidp argument)
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
index 0000000000..e725f1e0f2
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
+@@ -3338,6 +3338,7 @@ png_image_read_composite(png_voidp argument)
+       ptrdiff_t    step_row = display->row_bytes;
+       unsigned int channels =
+           (image->format & PNG_FORMAT_FLAG_COLOR) != 0 ? 3 : 1;
++      int optimize_alpha = (png_ptr->flags & PNG_FLAG_OPTIMIZE_ALPHA) != 0;
+       int pass;
+ 
+       for (pass = 0; pass < passes; ++pass)
+@@ -3394,25 +3395,44 @@ png_image_read_composite(png_voidp argument)
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
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
index 47b76a704b..70685b68e7 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
@@ -20,6 +20,8 @@ SRC_URI = "\
            file://CVE-2025-64720.patch \
            file://CVE-2025-65018-01.patch \
            file://CVE-2025-65018-02.patch \
+           file://CVE-2025-66293-01.patch \
+           file://CVE-2025-66293-02.patch \
 "
 
 SRC_URI[sha256sum] = "1f4696ce70b4ee5f85f1e1623dc1229b210029fa4b7aee573df3e2ba7b036937"
-- 
2.43.0


