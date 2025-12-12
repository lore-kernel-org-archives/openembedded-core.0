Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E80D59D6B
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 15:40:16 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15356.1765554015138855671
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 07:40:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MTy6J9bu;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34c213f7690so209862a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 07:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1765554014; x=1766158814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7uu3iMTiclVBPf9HT8oF5LhP1jcfTDNfDz6OosPOxk=;
        b=MTy6J9bulTFbK8QsEIcTIujw0bxFnLHClVD8WoJ5AdkMmvFZ2tFnH+5vdqJBaS+RhL
         Zv4HY4jCGa9IHV5p5V3kz8jaEdewSxV2I2KOnX8AgFLlSWa9WMxQyioieEhbKDSsfCP9
         L9BQYOuwot03qkDqTZA1mbQf8lZUxgcOifcBO9stu6g56hI0ieB2vFVpWLHh1Rmbqkfo
         ROkoKM3oQbGnBnyktZiGzpzL1n1gapyhOwvWlJgBNPZaGLn1KKY3v7xuNuWLu4I7vVyL
         FhTA/rT46w6i96uyLnAb3Q7qMT/yUWD6YPs91LgCzhbp7pfgGQChKZwOnEMZqlzthT1d
         Eh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765554014; x=1766158814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f7uu3iMTiclVBPf9HT8oF5LhP1jcfTDNfDz6OosPOxk=;
        b=VyfnNbcX9ZvWYW/lg6JKQD136Gx7f5xYZg47BRTCUs3STDbs6jjyeRBf7uZ7dCRa3I
         OIhgGfTqH65JWtGzlBqF9DrxNYgSCxZdMnMn3BgZnsvIAsM3G89tQRsweNbvz7tbvgK8
         b/ElxQoDEuPBvNmLs1VNREttY+OVQSSTJq09AvzE6hAk9enLyJmhVfhfJx47Tck8LTfQ
         56KvYtTM5g8hrxQ+fahZsB4HajtZCn0n8DgjsaC/ZUhoeDyGSDM681Zs6vdO1nkJ36fh
         KYecnArWFdTNoV9/StfaKuKL53xdVEvcPPUgNtWW8KJ6fVYF0szWAk7Hk+F2M6reFIoR
         tJ5g==
X-Gm-Message-State: AOJu0Yyn3lY2xSuLS/m+MNIR3cg8VoICETk94gjqqPWJuoUQXyY47UzG
	cWq7auJ2TENomoMGeJfAq9fmMPi0aUstj99XgJ61gVCDARWw01tvEWqaMZ9Lz3nYp3cQrlOL/a3
	Bpbrt
X-Gm-Gg: AY/fxX68BIeSZl4FoupnYr0brTV2KLc+IjtaMjslYe3kvVetxN23wq1kRu1HvfgfYk8
	R6DWQ76S/0oXrm6m2/kkAFB/Wvx6gsSMpdViRPJy3Z1THvEYQRdFW8xLMykzYzHxChg6bSdgcBv
	Q31pxwBe4WIFaP3TR3WyIe/RSbhfnZ4oGaKIK0Z7JdqlO+PvaGim4p7Eu2Rp/ArB7+zt6UqLOGK
	4kXmyDFJEqA0dkvyW8t2THof5mt+T31DfdmVZ4dk3cyF9i3Yl3zWrYL8MQWAyTcX2wlOMyFClcn
	h3pOSl78dQg85GGZ/1U9DPInz+Ul3mNhAnWZCB5Aed72tYuuaEVo2ukY57W3Aqrr1F86jhhmmuU
	G62iOH2sMaUObIF434HRYFavms7DauwmUi4gID5/sNMwIyjgR/Dk1w1t6+OEG01YS0DCQiqjbup
	NCUw1251HK5W0B
X-Google-Smtp-Source: AGHT+IEuIEJ3cvIY1EuFrgrkc0LroX6bhHDj7d6r9tYTWHsszNtSW8FlN4pU8auVR2TKQaGgAi/7Rw==
X-Received: by 2002:a17:90b:4cc8:b0:340:a5b2:c305 with SMTP id 98e67ed59e1d1-34abd6c6991mr1929139a91.2.1765554014246;
        Fri, 12 Dec 2025 07:40:14 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe23edc4sm917549a91.1.2025.12.12.07.40.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:40:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/7] libpng: patch CVE-2025-66293
Date: Fri, 12 Dec 2025 07:39:55 -0800
Message-ID: <f5f0af82d8775180d76e6448a14f74cc70edf963.1765553842.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765553842.git.steve@sakoman.com>
References: <cover.1765553842.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 15:40:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227602

From: Peter Marko <peter.marko@siemens.com>

Pick patches per nvd report [1] and github advisory [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-66293
[2] https://github.com/pnggroup/libpng/security/advisories/GHSA-9mpm-9pxh-mg4f

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libpng/files/CVE-2025-66293-01.patch      |  60 +++++++++
 .../libpng/files/CVE-2025-66293-02.patch      | 125 ++++++++++++++++++
 .../libpng/libpng_1.6.42.bb                   |   2 +
 3 files changed, 187 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-66293-01.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-66293-02.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-66293-01.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-66293-01.patch
new file mode 100644
index 0000000000..0b958b9f1b
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
index 0000000000..ba563e1c5a
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
index 2d5216cb65..6dc7ffe272 100644
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
-- 
2.43.0


