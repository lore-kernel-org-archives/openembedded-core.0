Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE4FC67871
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 14:34:50 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.25210.1673447683897472266
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 06:34:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=VclJgkSf;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 7so10661244pga.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 06:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=io659MHCbIfzMhYr63F089VKxJCacu4PIi5WSCUve+4=;
        b=VclJgkSfwfP/+fpjhZF9Bbkd4thbbPP0N4bJnysZ930sTqMo8pAhYHFbNH4W99pOqr
         D8OwNLIzlPKPY7ZxmsZhVWosSTMzGxxW0inutxdXf2avBDuAV8Vfx1D4MkFYyp3wfdI0
         E6GgdF9ijgep2afi9GsxwexWryK4Bppvdm/4bq2Zev8WhcfV/fpXVvb7s7c9DDP7Sf9k
         w3QTxZY0fpCnQu7isj/xOgKrfhRudmY5xOgCT0TQHtvU9zZUpkDgInMM6le0P+qvcoVa
         39guYncHR8IMl2FbUit7PMJvYK7JjwimXu8zeX44Lid/lKSUkFWDzKvEezWzaVacfq3U
         uWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=io659MHCbIfzMhYr63F089VKxJCacu4PIi5WSCUve+4=;
        b=3w1XN/rdbwQrVTkkyUrY1mB3fZXRsDKn+VcT5ynZLWoTZ8SYJDlEbZiB4+8hJq+LpL
         IAi4IlKKFNAckjgJmvqSGuYo5MQpojdyE8OQJvL+dS5Hb1AAsx6HwsUC0tESVrjdvwxZ
         X2l9VoCj1+wzWwXZCffekXeqbxG/QUDHQ2PaD6VUv+rmxvOh3Qd2/E3xBsPeWgW1t48m
         mNgoLo98gL6odSHLc3gGGCfuJH4tyB4vjn/47R8HONKHu2pDO79AkZ8SF3sLIkAsEXpy
         stT1UrpHH+Itfr4qfnUbPxoYYUt0TRbXKIIDl8iqYLDgPxwjtG6XsuO2IVlCglET0VtW
         hE9A==
X-Gm-Message-State: AFqh2kowN6cwIoDj3dpqHqDN50Zibw9thA/+ih7FIbchBgtd42bE83CB
	7yQMsahf+hSLmhsLodqFpurGeOyDD8aRtxn4hDQ=
X-Google-Smtp-Source: AMrXdXue3CLQ1B2VPocblj0YSe449rj1ZMivOFYER3umyrtozpEfQNqtPdQwUagD/cCQV3bmwvUC5Q==
X-Received: by 2002:a05:6a00:24c9:b0:57f:7bb4:8fce with SMTP id d9-20020a056a0024c900b0057f7bb48fcemr83165522pfv.32.1673447682718;
        Wed, 11 Jan 2023 06:34:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id y29-20020aa793dd000000b0056c2e497b02sm10381288pff.173.2023.01.11.06.34.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 06:34:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/8] grub2: Fix CVE-2022-2601 & CVE-2022-3775
Date: Wed, 11 Jan 2023 04:34:23 -1000
Message-Id: <6149febd53b32406dc4b07b1721b3dfbae70723e.1673447528.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673447528.git.steve@sakoman.com>
References: <cover.1673447528.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 14:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175742

From: Hitendra Prajapati <hprajapati@mvista.com>

Backport patch from upstream to solve CVE-2022-2601 CVE-2022-3775 dependency:

font: Fix size overflow in grub_font_get_glyph_internal()
Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/grub.git/commit/?id=9c76ec09ae08155df27cd237eaea150b4f02f532

CVE-2022-2601: font: Fix several integer overflows in grub_font_construct_glyph()
Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/grub.git/commit/?id=768e1ef2fc159f6e14e7246e4be09363708ac39e

CVE-2022-3775: font: Fix an integer underflow in blit_comb()
Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/grub.git/commit/?id=992c06191babc1e109caf40d6a07ec6fdef427af

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2022-2601.patch            |  87 +++++++++++++
 .../grub/files/CVE-2022-3775.patch            |  97 +++++++++++++++
 ...erflow-in-grub_font_get_glyph_intern.patch | 117 ++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   3 +
 4 files changed, 304 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-2601.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-3775.patch
 create mode 100644 meta/recipes-bsp/grub/files/font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2022-2601.patch b/meta/recipes-bsp/grub/files/CVE-2022-2601.patch
new file mode 100644
index 0000000000..090f693be3
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2022-2601.patch
@@ -0,0 +1,87 @@
+From e8060722acf0bcca037982d7fb29472363ccdfd4 Mon Sep 17 00:00:00 2001
+From: Zhang Boyang <zhangboyang.id@gmail.com>
+Date: Fri, 5 Aug 2022 01:58:27 +0800
+Subject: [PATCH] font: Fix several integer overflows in
+ grub_font_construct_glyph()
+
+This patch fixes several integer overflows in grub_font_construct_glyph().
+Glyphs of invalid size, zero or leading to an overflow, are rejected.
+The inconsistency between "glyph" and "max_glyph_size" when grub_malloc()
+returns NULL is fixed too.
+
+Fixes: CVE-2022-2601
+
+Reported-by: Zhang Boyang <zhangboyang.id@gmail.com>
+Signed-off-by: Zhang Boyang <zhangboyang.id@gmail.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=768e1ef2fc159f6e14e7246e4be09363708ac39e]
+CVE: CVE-2022-2601
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/font/font.c | 29 +++++++++++++++++------------
+ 1 file changed, 17 insertions(+), 12 deletions(-)
+
+diff --git a/grub-core/font/font.c b/grub-core/font/font.c
+index df17dba..f110db9 100644
+--- a/grub-core/font/font.c
++++ b/grub-core/font/font.c
+@@ -1509,6 +1509,7 @@ grub_font_construct_glyph (grub_font_t hinted_font,
+   struct grub_video_signed_rect bounds;
+   static struct grub_font_glyph *glyph = 0;
+   static grub_size_t max_glyph_size = 0;
++  grub_size_t cur_glyph_size;
+ 
+   ensure_comb_space (glyph_id);
+ 
+@@ -1525,29 +1526,33 @@ grub_font_construct_glyph (grub_font_t hinted_font,
+   if (!glyph_id->ncomb && !glyph_id->attributes)
+     return main_glyph;
+ 
+-  if (max_glyph_size < sizeof (*glyph) + (bounds.width * bounds.height + GRUB_CHAR_BIT - 1) / GRUB_CHAR_BIT)
++  if (grub_video_bitmap_calc_1bpp_bufsz (bounds.width, bounds.height, &cur_glyph_size) ||
++      grub_add (sizeof (*glyph), cur_glyph_size, &cur_glyph_size))
++    return main_glyph;
++
++  if (max_glyph_size < cur_glyph_size)
+     {
+       grub_free (glyph);
+-      max_glyph_size = (sizeof (*glyph) + (bounds.width * bounds.height + GRUB_CHAR_BIT - 1) / GRUB_CHAR_BIT) * 2;
+-      if (max_glyph_size < 8)
+-	max_glyph_size = 8;
+-      glyph = grub_malloc (max_glyph_size);
++      if (grub_mul (cur_glyph_size, 2, &max_glyph_size))
++	max_glyph_size = 0;
++      glyph = max_glyph_size > 0 ? grub_malloc (max_glyph_size) : NULL;
+     }
+   if (!glyph)
+     {
++      max_glyph_size = 0;
+       grub_errno = GRUB_ERR_NONE;
+       return main_glyph;
+     }
+ 
+-  grub_memset (glyph, 0, sizeof (*glyph)
+-	       + (bounds.width * bounds.height
+-		  + GRUB_CHAR_BIT - 1) / GRUB_CHAR_BIT);
++  grub_memset (glyph, 0, cur_glyph_size);
+ 
+   glyph->font = main_glyph->font;
+-  glyph->width = bounds.width;
+-  glyph->height = bounds.height;
+-  glyph->offset_x = bounds.x;
+-  glyph->offset_y = bounds.y;
++  if (bounds.width == 0 || bounds.height == 0 ||
++      grub_cast (bounds.width, &glyph->width) ||
++      grub_cast (bounds.height, &glyph->height) ||
++      grub_cast (bounds.x, &glyph->offset_x) ||
++      grub_cast (bounds.y, &glyph->offset_y))
++    return main_glyph;
+ 
+   if (glyph_id->attributes & GRUB_UNICODE_GLYPH_ATTRIBUTE_MIRROR)
+     grub_font_blit_glyph_mirror (glyph, main_glyph,
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2022-3775.patch b/meta/recipes-bsp/grub/files/CVE-2022-3775.patch
new file mode 100644
index 0000000000..e2e3f35584
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2022-3775.patch
@@ -0,0 +1,97 @@
+From fdbe7209152ad6f09a1166f64f162017f2145ba3 Mon Sep 17 00:00:00 2001
+From: Zhang Boyang <zhangboyang.id@gmail.com>
+Date: Mon, 24 Oct 2022 08:05:35 +0800
+Subject: [PATCH] font: Fix an integer underflow in blit_comb()
+
+The expression (ctx.bounds.height - combining_glyphs[i]->height) / 2 may
+evaluate to a very big invalid value even if both ctx.bounds.height and
+combining_glyphs[i]->height are small integers. For example, if
+ctx.bounds.height is 10 and combining_glyphs[i]->height is 12, this
+expression evaluates to 2147483647 (expected -1). This is because
+coordinates are allowed to be negative but ctx.bounds.height is an
+unsigned int. So, the subtraction operates on unsigned ints and
+underflows to a very big value. The division makes things even worse.
+The quotient is still an invalid value even if converted back to int.
+
+This patch fixes the problem by casting ctx.bounds.height to int. As
+a result the subtraction will operate on int and grub_uint16_t which
+will be promoted to an int. So, the underflow will no longer happen. Other
+uses of ctx.bounds.height (and ctx.bounds.width) are also casted to int,
+to ensure coordinates are always calculated on signed integers.
+
+Fixes: CVE-2022-3775
+
+Reported-by: Daniel Axtens <dja@axtens.net>
+Signed-off-by: Zhang Boyang <zhangboyang.id@gmail.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=992c06191babc1e109caf40d6a07ec6fdef427af]
+CVE: CVE-2022-3775
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/font/font.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/grub-core/font/font.c b/grub-core/font/font.c
+index f110db9..3b76b22 100644
+--- a/grub-core/font/font.c
++++ b/grub-core/font/font.c
+@@ -1200,12 +1200,12 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
+   ctx.bounds.height = main_glyph->height;
+ 
+   above_rightx = main_glyph->offset_x + main_glyph->width;
+-  above_righty = ctx.bounds.y + ctx.bounds.height;
++  above_righty = ctx.bounds.y + (int) ctx.bounds.height;
+ 
+   above_leftx = main_glyph->offset_x;
+-  above_lefty = ctx.bounds.y + ctx.bounds.height;
++  above_lefty = ctx.bounds.y + (int) ctx.bounds.height;
+ 
+-  below_rightx = ctx.bounds.x + ctx.bounds.width;
++  below_rightx = ctx.bounds.x + (int) ctx.bounds.width;
+   below_righty = ctx.bounds.y;
+ 
+   comb = grub_unicode_get_comb (glyph_id);
+@@ -1218,7 +1218,7 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
+ 
+       if (!combining_glyphs[i])
+ 	continue;
+-      targetx = (ctx.bounds.width - combining_glyphs[i]->width) / 2 + ctx.bounds.x;
++      targetx = ((int) ctx.bounds.width - combining_glyphs[i]->width) / 2 + ctx.bounds.x;
+       /* CGJ is to avoid diacritics reordering. */
+       if (comb[i].code
+ 	  == GRUB_UNICODE_COMBINING_GRAPHEME_JOINER)
+@@ -1228,8 +1228,8 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
+ 	case GRUB_UNICODE_COMB_OVERLAY:
+ 	  do_blit (combining_glyphs[i],
+ 		   targetx,
+-		   (ctx.bounds.height - combining_glyphs[i]->height) / 2
+-		   - (ctx.bounds.height + ctx.bounds.y), &ctx);
++		   ((int) ctx.bounds.height - combining_glyphs[i]->height) / 2
++		   - ((int) ctx.bounds.height + ctx.bounds.y), &ctx);
+ 	  if (min_devwidth < combining_glyphs[i]->width)
+ 	    min_devwidth = combining_glyphs[i]->width;
+ 	  break;
+@@ -1302,7 +1302,7 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
+ 	  /* Fallthrough.  */
+ 	case GRUB_UNICODE_STACK_ATTACHED_ABOVE:
+ 	  do_blit (combining_glyphs[i], targetx,
+-		   -(ctx.bounds.height + ctx.bounds.y + space
++		   -((int) ctx.bounds.height + ctx.bounds.y + space
+ 		     + combining_glyphs[i]->height), &ctx);
+ 	  if (min_devwidth < combining_glyphs[i]->width)
+ 	    min_devwidth = combining_glyphs[i]->width;
+@@ -1310,7 +1310,7 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
+ 
+ 	case GRUB_UNICODE_COMB_HEBREW_DAGESH:
+ 	  do_blit (combining_glyphs[i], targetx,
+-		   -(ctx.bounds.height / 2 + ctx.bounds.y
++		   -((int) ctx.bounds.height / 2 + ctx.bounds.y
+ 		     + combining_glyphs[i]->height / 2), &ctx);
+ 	  if (min_devwidth < combining_glyphs[i]->width)
+ 	    min_devwidth = combining_glyphs[i]->width;
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/files/font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch b/meta/recipes-bsp/grub/files/font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
new file mode 100644
index 0000000000..d4ba3cafc5
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
@@ -0,0 +1,117 @@
+From 1f511ae054fe42dce7aedfbfe0f234fa1e0a7a3e Mon Sep 17 00:00:00 2001
+From: Zhang Boyang <zhangboyang.id@gmail.com>
+Date: Fri, 5 Aug 2022 00:51:20 +0800
+Subject: [PATCH] font: Fix size overflow in grub_font_get_glyph_internal()
+
+The length of memory allocation and file read may overflow. This patch
+fixes the problem by using safemath macros.
+
+There is a lot of code repetition like "(x * y + 7) / 8". It is unsafe
+if overflow happens. This patch introduces grub_video_bitmap_calc_1bpp_bufsz().
+It is safe replacement for such code. It has safemath-like prototype.
+
+This patch also introduces grub_cast(value, pointer), it casts value to
+typeof(*pointer) then store the value to *pointer. It returns true when
+overflow occurs or false if there is no overflow. The semantics of arguments
+and return value are designed to be consistent with other safemath macros.
+
+Signed-off-by: Zhang Boyang <zhangboyang.id@gmail.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=9c76ec09ae08155df27cd237eaea150b4f02f532]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/font/font.c   | 17 +++++++++++++----
+ include/grub/bitmap.h   | 18 ++++++++++++++++++
+ include/grub/safemath.h |  2 ++
+ 3 files changed, 33 insertions(+), 4 deletions(-)
+
+diff --git a/grub-core/font/font.c b/grub-core/font/font.c
+index 5edb477..df17dba 100644
+--- a/grub-core/font/font.c
++++ b/grub-core/font/font.c
+@@ -733,7 +733,8 @@ grub_font_get_glyph_internal (grub_font_t font, grub_uint32_t code)
+       grub_int16_t xoff;
+       grub_int16_t yoff;
+       grub_int16_t dwidth;
+-      int len;
++      grub_ssize_t len;
++      grub_size_t sz;
+ 
+       if (index_entry->glyph)
+ 	/* Return cached glyph.  */
+@@ -760,9 +761,17 @@ grub_font_get_glyph_internal (grub_font_t font, grub_uint32_t code)
+ 	  return 0;
+ 	}
+ 
+-      len = (width * height + 7) / 8;
+-      glyph = grub_malloc (sizeof (struct grub_font_glyph) + len);
+-      if (!glyph)
++      /* Calculate real struct size of current glyph. */
++      if (grub_video_bitmap_calc_1bpp_bufsz (width, height, &len) ||
++	  grub_add (sizeof (struct grub_font_glyph), len, &sz))
++	{
++	  remove_font (font);
++	  return 0;
++	}
++
++      /* Allocate and initialize the glyph struct. */
++      glyph = grub_malloc (sz);
++      if (glyph == NULL)
+ 	{
+ 	  remove_font (font);
+ 	  return 0;
+diff --git a/include/grub/bitmap.h b/include/grub/bitmap.h
+index 5728f8c..0d9603f 100644
+--- a/include/grub/bitmap.h
++++ b/include/grub/bitmap.h
+@@ -23,6 +23,7 @@
+ #include <grub/symbol.h>
+ #include <grub/types.h>
+ #include <grub/video.h>
++#include <grub/safemath.h>
+ 
+ struct grub_video_bitmap
+ {
+@@ -79,6 +80,23 @@ grub_video_bitmap_get_height (struct grub_video_bitmap *bitmap)
+   return bitmap->mode_info.height;
+ }
+ 
++/*
++ * Calculate and store the size of data buffer of 1bit bitmap in result.
++ * Equivalent to "*result = (width * height + 7) / 8" if no overflow occurs.
++ * Return true when overflow occurs or false if there is no overflow.
++ * This function is intentionally implemented as a macro instead of
++ * an inline function. Although a bit awkward, it preserves data types for
++ * safemath macros and reduces macro side effects as much as possible.
++ *
++ * XXX: Will report false overflow if width * height > UINT64_MAX.
++ */
++#define grub_video_bitmap_calc_1bpp_bufsz(width, height, result) \
++({ \
++  grub_uint64_t _bitmap_pixels; \
++  grub_mul ((width), (height), &_bitmap_pixels) ? 1 : \
++    grub_cast (_bitmap_pixels / GRUB_CHAR_BIT + !!(_bitmap_pixels % GRUB_CHAR_BIT), (result)); \
++})
++
+ void EXPORT_FUNC (grub_video_bitmap_get_mode_info) (struct grub_video_bitmap *bitmap,
+ 						    struct grub_video_mode_info *mode_info);
+ 
+diff --git a/include/grub/safemath.h b/include/grub/safemath.h
+index c17b89b..bb0f826 100644
+--- a/include/grub/safemath.h
++++ b/include/grub/safemath.h
+@@ -30,6 +30,8 @@
+ #define grub_sub(a, b, res)	__builtin_sub_overflow(a, b, res)
+ #define grub_mul(a, b, res)	__builtin_mul_overflow(a, b, res)
+ 
++#define grub_cast(a, res)	grub_add ((a), 0, (res))
++
+ #else
+ #error gcc 5.1 or newer or clang 3.8 or newer is required
+ #endif
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 777839d0b6..d09eecd8ac 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -103,6 +103,9 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2022-28734.patch \
            file://CVE-2022-28736.patch \
            file://CVE-2022-28735.patch \
+           file://font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch \
+           file://CVE-2022-2601.patch \
+           file://CVE-2022-3775.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


