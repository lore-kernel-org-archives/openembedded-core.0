Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366BBCD3443
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 16:58:53 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1043.1778000325685321965
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 09:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XYlbAKah;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso39278055e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778000324; x=1778605124; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0DxGtVrS6s6NwxRitpSqt3yFb/+CVLfvDpVAbubH0Y=;
        b=XYlbAKahdIpbQRltVXyL72yXoNR3JwCzYJoK3w5Pz/lxhudQXjwFgdeHTqqU88t89w
         e3vnsk9w1PTmyl8IZpLwakd1+tf13fd8zLWXRaOg7+pSU0FmvF7Rs/Ngmp1+bdqPBXds
         98Aickf08XFk+v9aXyAiYcKb48240y+FTAXAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000324; x=1778605124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n0DxGtVrS6s6NwxRitpSqt3yFb/+CVLfvDpVAbubH0Y=;
        b=qpWVT/tJTsJbrhi3zJ8BVfN9DpSXdocleMtxa0O8NukGNITnUVZIFPa4w8Q6SrCUo9
         FOlK/BiQoXgJx2N9a4RHYuK8Epy9eOY2jwjL6hCVeaGKmQcRS54Onka9mvn+vktvqNXR
         /CHheaa46kc9Pnu/nsW6xotfUpU8qGusw3RzE9bB3ZXhCCz1NnZOE6tJj8I2xvGfOzLI
         DPTYFS5OT4WnGH6961Pc8TDr0oErvsrdT5KHEtdWrwPxLHRrhC89DNHdc6R90EWwxmYo
         +g9INEFqJoFLqccIOKU2WdfK/L3ikgL6kgbjOo/V/Uc6yUdT5LzHaRFasinDGZfX+cGL
         yYsA==
X-Gm-Message-State: AOJu0YwQUf+tAY/WbMnhv1aDNQe8/WYCeCy8s5iYrpm0znJGU3oxg8y+
	bJVzko06hhHyNsseCOq3nMSJqP8YrxtXrZEBUHing3vSKe2F33BOvysGZgCX5MtiSWVuvyuOxXT
	TH5fRViY=
X-Gm-Gg: AeBDievkF5fiRoWX5X2Pplkml/TGK38eGsqo/aacLwnewIJIMWcvkO1LIeGf+GqWxwG
	OwSUAqBY+AVhXyMJnLtcIqoK4IBPwH4uBfpkKTxwkSATXCbPpe0vIBS3OzGlQ+DgJzrPNhc720R
	w2BWL1NGttHPJCf11nhWbWomR5f0XxcGneH9cfa1+rhvSWdz06p+0s+71W5b5OHPlzjncvfjN5I
	Lt3aHleXv0NyfprmeamhQWE3z0T3uCWZATmMYKUJlCJYZr5zUhCTyQMTilDXX0LNR4adKO8jqng
	6aL/VnrKn8EutuAVp/g+cjP05qSxqMQl0xFEutD6aKy7p6oCex6baVv3fBHVc4BurR4aSLOINRe
	k6epD1xOtwttb4MFwaFRwLs1r2WLUVXdsOf7vFm+KMzphikxJ6U7MToDg+dcZu2zb3DzDKptrcg
	UrGx+VpkOtLjku/o8v0dKR80t4NLkWNzIsshqPlayYVTd0gwaTUvWKzwPYy/X9/TjrSSA313vBb
	fkMW/oG3BkarOG4EsdfkWjMZg==
X-Received: by 2002:a05:600c:c4a3:b0:489:1cd2:610a with SMTP id 5b1f17b1804b1-48e51f258damr873135e9.9.1778000322184;
        Tue, 05 May 2026 09:58:42 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e51f6805fsm60025e9.2.2026.05.05.09.58.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:58:41 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/23] libpng: fix CVE-2026-33636
Date: Tue,  5 May 2026 18:57:18 +0200
Message-ID: <be55a3bdc140d4882fab933f311c4b80912c3a77.1777995876.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777995876.git.fabien.thomas@smile.fr>
References: <cover.1777995876.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 16:58:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236493

From: Sudhir Dumbhare <sudumbha@cisco.com>

Pick the patch [1] as mentioned in [2].

[1] https://github.com/pnggroup/libpng/commit/aba9f18eba870d14fb52c5ba5d73451349e339c3
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-33636

Reference:
https://security-tracker.debian.org/tracker/CVE-2026-33636
https://www.suse.com/security/cve/CVE-2026-33636.html

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../libpng/files/CVE-2026-33636.patch         | 99 +++++++++++++++++++
 .../libpng/libpng_1.6.42.bb                   |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33636.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-33636.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-33636.patch
new file mode 100644
index 0000000000..3bd6aae2a4
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2026-33636.patch
@@ -0,0 +1,99 @@
+From 9ff847dfcbb54f6dee3fd4e408150ae944278391 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Sat, 21 Mar 2026 23:48:49 +0200
+Subject: [PATCH] fix(arm): Resolve out-of-bounds read/write in NEON palette
+ expansion
+
+Both `png_do_expand_palette_rgba8_neon` and
+`png_do_expand_palette_rgb8_neon` advanced in fixed-size chunks without
+guarding the final iteration, allowing out-of-bounds reads and writes
+when the row width is not a multiple of the chunk size.
+
+Restrict the NEON loop to full chunks only, remove the now-unnecessary
+post-loop adjustment, and undo the `*ddp` pre-adjustment before the
+pointer handoff to the scalar fallback.
+
+CVE: CVE-2026-33636
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/aba9f18eba870d14fb52c5ba5d73451349e339c3]
+
+Reported-by: Amemoyoi <Amemoyoi@users.noreply.github.com>
+Co-authored-by: Amemoyoi <Amemoyoi@users.noreply.github.com>
+Signed-off-by: Cosmin Truta <ctruta@gmail.com>
+(cherry picked from commit aba9f18eba870d14fb52c5ba5d73451349e339c3)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ arm/palette_neon_intrinsics.c | 29 +++++++++++++----------------
+ 1 file changed, 13 insertions(+), 16 deletions(-)
+
+diff --git a/arm/palette_neon_intrinsics.c b/arm/palette_neon_intrinsics.c
+index 92c7d6f9f..bdd15849d 100644
+--- a/arm/palette_neon_intrinsics.c
++++ b/arm/palette_neon_intrinsics.c
+@@ -1,7 +1,7 @@
+ 
+ /* palette_neon_intrinsics.c - NEON optimised palette expansion functions
+  *
+- * Copyright (c) 2018-2019 Cosmin Truta
++ * Copyright (c) 2018-2026 Cosmin Truta
+  * Copyright (c) 2017-2018 Arm Holdings. All rights reserved.
+  * Written by Richard Townsend <Richard.Townsend@arm.com>, February 2017.
+  *
+@@ -80,7 +80,7 @@ png_do_expand_palette_rgba8_neon(png_structrp png_ptr, png_row_infop row_info,
+     */
+    *ddp = *ddp - ((pixels_per_chunk * sizeof(png_uint_32)) - 1);
+ 
+-   for (i = 0; i < row_width; i += pixels_per_chunk)
++   for (i = 0; i + pixels_per_chunk <= row_width; i += pixels_per_chunk)
+    {
+       uint32x4_t cur;
+       png_bytep sp = *ssp - i, dp = *ddp - (i << 2);
+@@ -90,13 +90,12 @@ png_do_expand_palette_rgba8_neon(png_structrp png_ptr, png_row_infop row_info,
+       cur = vld1q_lane_u32(riffled_palette + *(sp - 0), cur, 3);
+       vst1q_u32((void *)dp, cur);
+    }
+-   if (i != row_width)
+-   {
+-      /* Remove the amount that wasn't processed. */
+-      i -= pixels_per_chunk;
+-   }
+ 
+-   /* Decrement output pointers. */
++   /* Undo the pre-adjustment of *ddp before the pointer handoff,
++    * so the scalar fallback in pngrtran.c receives a dp that points
++    * to the correct position.
++    */
++   *ddp = *ddp + (pixels_per_chunk * 4 - 1);
+    *ssp = *ssp - i;
+    *ddp = *ddp - (i << 2);
+    return i;
+@@ -121,7 +120,7 @@ png_do_expand_palette_rgb8_neon(png_structrp png_ptr, png_row_infop row_info,
+    /* Seeking this back by 8 pixels x 3 bytes. */
+    *ddp = *ddp - ((pixels_per_chunk * sizeof(png_color)) - 1);
+ 
+-   for (i = 0; i < row_width; i += pixels_per_chunk)
++   for (i = 0; i + pixels_per_chunk <= row_width; i += pixels_per_chunk)
+    {
+       uint8x8x3_t cur;
+       png_bytep sp = *ssp - i, dp = *ddp - ((i << 1) + i);
+@@ -136,13 +135,11 @@ png_do_expand_palette_rgb8_neon(png_structrp png_ptr, png_row_infop row_info,
+       vst3_u8((void *)dp, cur);
+    }
+ 
+-   if (i != row_width)
+-   {
+-      /* Remove the amount that wasn't processed. */
+-      i -= pixels_per_chunk;
+-   }
+-
+-   /* Decrement output pointers. */
++   /* Undo the pre-adjustment of *ddp before the pointer handoff,
++    * so the scalar fallback in pngrtran.c receives a dp that points
++    * to the correct position.
++    */
++   *ddp = *ddp + (pixels_per_chunk * 3 - 1);
+    *ssp = *ssp - i;
+    *ddp = *ddp - ((i << 1) + i);
+    return i;
+-- 
+2.44.4
+
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index 7471315fdd..923ed79896 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -24,6 +24,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz
            file://CVE-2026-22695.patch \
            file://CVE-2026-22801.patch \
            file://CVE-2026-25646.patch \
+           file://CVE-2026-33636.patch \
 "
 
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"

