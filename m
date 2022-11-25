Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49C3C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 18:07:29 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.53096.1669399645824448319
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Nov 2022 10:07:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=uLduyZy4;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.53, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f53.google.com with SMTP id kt23so11928289ejc.7
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 10:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uhSU7vYxBSQUomPfCPyxpAgaYIblyC0bYW8NZDndWa4=;
        b=uLduyZy4V2fITjCgHC8WFxb1jUNYAzENl3FyEw3JkJ6lDPpyV72vek8HeJL353VZ3i
         uFu8fChux5ILZXprrjF1aN53vvUucHGwggl0Mr20YPQ1i5Fh6oTslcIDWBxGlZhliJX8
         bP7uzIOuc2rMBscOQYN8KQSFRH1qumJ8ylpwY6r5cbFS7j5NNXJ8xcJyFJ5WDAIxFVCh
         ZZjkhGoxR2Q+jeczkQyMTU0xyY7TuEETQ7KmaQ9MQf+XcP89kv9I5BCba1BJwrVVUu4p
         qxo8ynwtg78hRWNXkXNYdvhhYLnEQw4TBTmszcFpoiAx/diQ6kWcUjCFI+uZzUfsovyw
         B3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uhSU7vYxBSQUomPfCPyxpAgaYIblyC0bYW8NZDndWa4=;
        b=2DCiVzgrBViVSLgCtC66eGh/3Ld47ZUWl1x7QpTi5iTbzGVbdZPeLXNfHKG355ee0K
         CGzzTsYKejUdJc2H2Vyp77O8r6LL9EY2T8hcFfqGQjy1+wHneui7PlEgNckAVi+jbViY
         UAGuflmQoWZW+WhSjlCB8pKiY9i78bpgUwxoCa/pfW5qgpiPhQong4MRQLB/zsUrmrub
         mHqbb2tnxaxHAQEMjxvA//Rh5EXXaDueu3/BaqrMrgFBWMLgdaPmG7UEPONrP95pFAQI
         t4N/cj8JJyLMc6VJj4vufjgr4vYi5hR/At0Lo8BeXgkUytVMf685ehtm2rU9e4m1R++c
         +8Gg==
X-Gm-Message-State: ANoB5plpY5xWITzXKTmvT30qts3p+F/V2MF22xQ8ANxkH5AzPBhPq+mo
	Pr7h65LfrD8XMlhERxI0ozt36AfNJkU6P7tAkZ0QUilswqbLCVTlYuY=
X-Google-Smtp-Source: AA0mqf5l479Ue0bzOZFj8Eg8PmTAG0bx6ag4qi9TtBuE491uxQ29U73n7fkFXNAbGvg9PB1EgoCvQC5o/sKwvIZXDco=
X-Received: by 2002:a17:906:b78a:b0:7ad:ab0e:76aa with SMTP id
 dt10-20020a170906b78a00b007adab0e76aamr32518410ejb.435.1669399643934; Fri, 25
 Nov 2022 10:07:23 -0800 (PST)
MIME-Version: 1.0
References: <20221123060834.30727-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20221123060834.30727-1-xiangyu.chen@eng.windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 25 Nov 2022 08:07:12 -1000
Message-ID: <CAOSpxdba68LX2RWA7JdhSSKfvE1JotQwpr37aUnwS_kZR-wM9A@mail.gmail.com>
Subject: Re: [OE-Core][kirkstone][PATCH] grub2: backport patch to fix
 CVE-2022-2601 CVE-2022-3775
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 18:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173782

On Tue, Nov 22, 2022 at 8:08 PM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> Backport patch from upstream to solve CVE-2022-2601 CVE-2022-3775 dependency:
> font: Fix size overflow in grub_font_get_glyph_internal()
> (https://git.savannah.gnu.org/cgit/grub.git/commit/?id=9c76ec09ae08155df27cd237eaea150b4f02f532)
>
> Backport patch from upstream to fix following CVEs:
> CVE-2022-2601: font: Fix several integer overflows in grub_font_construct_glyph()
> (https://git.savannah.gnu.org/cgit/grub.git/commit/?id=768e1ef2fc159f6e14e7246e4be09363708ac39e)
> CVE-2022-3775: font: Fix an integer underflow in blit_comb()
> (https://git.savannah.gnu.org/cgit/grub.git/commit/?id=992c06191babc1e109caf40d6a07ec6fdef427af)
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  ...erflow-in-grub_font_get_glyph_intern.patch | 117 ++++++++++++++++++

This patch doesn't apply cleanly, please submit a V2

WARNING: grub-2.06-r0 do_patch: Fuzz detected:

Applying patch 0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
patching file grub-core/font/font.c
Hunk #2 succeeded at 767 (offset -2 lines).
patching file include/grub/bitmap.h
Hunk #1 succeeded at 23 with fuzz 2.
Hunk #2 succeeded at 80 (offset -2 lines).
patching file include/grub/safemath.h
Hunk #1 succeeded at 30 with fuzz 2.


The context lines in the patches can be updated with devtool:

    devtool modify grub
    devtool finish --force-patch-refresh grub <layer_path>

Don't forget to review changes done by devtool!

WARNING: grub-2.06-r0 do_patch: QA Issue: Patch log indicates that
patches do not apply cleanly. [patch-fuzz]

Steve

>  .../grub/files/CVE-2022-2601.patch            |  87 +++++++++++++
>  .../grub/files/CVE-2022-3775.patch            |  97 +++++++++++++++
>  meta/recipes-bsp/grub/grub2.inc               |   3 +
>  4 files changed, 304 insertions(+)
>  create mode 100644 meta/recipes-bsp/grub/files/0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-2601.patch
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-3775.patch
>
> diff --git a/meta/recipes-bsp/grub/files/0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch b/meta/recipes-bsp/grub/files/0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
> new file mode 100644
> index 0000000000..db0fff94d2
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
> @@ -0,0 +1,117 @@
> +From 9c76ec09ae08155df27cd237eaea150b4f02f532 Mon Sep 17 00:00:00 2001
> +From: Zhang Boyang <zhangboyang.id@gmail.com>
> +Date: Fri, 5 Aug 2022 00:51:20 +0800
> +Subject: [PATCH] font: Fix size overflow in grub_font_get_glyph_internal()
> +
> +The length of memory allocation and file read may overflow. This patch
> +fixes the problem by using safemath macros.
> +
> +There is a lot of code repetition like "(x * y + 7) / 8". It is unsafe
> +if overflow happens. This patch introduces grub_video_bitmap_calc_1bpp_bufsz().
> +It is safe replacement for such code. It has safemath-like prototype.
> +
> +This patch also introduces grub_cast(value, pointer), it casts value to
> +typeof(*pointer) then store the value to *pointer. It returns true when
> +overflow occurs or false if there is no overflow. The semantics of arguments
> +and return value are designed to be consistent with other safemath macros.
> +
> +Signed-off-by: Zhang Boyang <zhangboyang.id@gmail.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Upstream-Status: Backport from
> +[https://git.savannah.gnu.org/cgit/grub.git/commit/?id=9c76ec09ae08155df27cd237eaea150b4f02f532]
> +
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> +---
> + grub-core/font/font.c   | 17 +++++++++++++----
> + include/grub/bitmap.h   | 18 ++++++++++++++++++
> + include/grub/safemath.h |  2 ++
> + 3 files changed, 33 insertions(+), 4 deletions(-)
> +
> +diff --git a/grub-core/font/font.c b/grub-core/font/font.c
> +index 756ca0abf..e781521a7 100644
> +--- a/grub-core/font/font.c
> ++++ b/grub-core/font/font.c
> +@@ -739,7 +739,8 @@ grub_font_get_glyph_internal (grub_font_t font, grub_uint32_t code)
> +       grub_int16_t xoff;
> +       grub_int16_t yoff;
> +       grub_int16_t dwidth;
> +-      int len;
> ++      grub_ssize_t len;
> ++      grub_size_t sz;
> +
> +       if (index_entry->glyph)
> +       /* Return cached glyph.  */
> +@@ -768,9 +769,17 @@ grub_font_get_glyph_internal (grub_font_t font, grub_uint32_t code)
> +         return 0;
> +       }
> +
> +-      len = (width * height + 7) / 8;
> +-      glyph = grub_malloc (sizeof (struct grub_font_glyph) + len);
> +-      if (!glyph)
> ++      /* Calculate real struct size of current glyph. */
> ++      if (grub_video_bitmap_calc_1bpp_bufsz (width, height, &len) ||
> ++        grub_add (sizeof (struct grub_font_glyph), len, &sz))
> ++      {
> ++        remove_font (font);
> ++        return 0;
> ++      }
> ++
> ++      /* Allocate and initialize the glyph struct. */
> ++      glyph = grub_malloc (sz);
> ++      if (glyph == NULL)
> +       {
> +         remove_font (font);
> +         return 0;
> +diff --git a/include/grub/bitmap.h b/include/grub/bitmap.h
> +index 149d37bfe..431048936 100644
> +--- a/include/grub/bitmap.h
> ++++ b/include/grub/bitmap.h
> +@@ -23,6 +23,7 @@
> + #include <grub/symbol.h>
> + #include <grub/types.h>
> + #include <grub/video.h>
> ++#include <grub/safemath.h>
> +
> + #define IMAGE_HW_MAX_PX               16384
> +
> +@@ -81,6 +82,23 @@ grub_video_bitmap_get_height (struct grub_video_bitmap *bitmap)
> +   return bitmap->mode_info.height;
> + }
> +
> ++/*
> ++ * Calculate and store the size of data buffer of 1bit bitmap in result.
> ++ * Equivalent to "*result = (width * height + 7) / 8" if no overflow occurs.
> ++ * Return true when overflow occurs or false if there is no overflow.
> ++ * This function is intentionally implemented as a macro instead of
> ++ * an inline function. Although a bit awkward, it preserves data types for
> ++ * safemath macros and reduces macro side effects as much as possible.
> ++ *
> ++ * XXX: Will report false overflow if width * height > UINT64_MAX.
> ++ */
> ++#define grub_video_bitmap_calc_1bpp_bufsz(width, height, result) \
> ++({ \
> ++  grub_uint64_t _bitmap_pixels; \
> ++  grub_mul ((width), (height), &_bitmap_pixels) ? 1 : \
> ++    grub_cast (_bitmap_pixels / GRUB_CHAR_BIT + !!(_bitmap_pixels % GRUB_CHAR_BIT), (result)); \
> ++})
> ++
> + void EXPORT_FUNC (grub_video_bitmap_get_mode_info) (struct grub_video_bitmap *bitmap,
> +                                                   struct grub_video_mode_info *mode_info);
> +
> +diff --git a/include/grub/safemath.h b/include/grub/safemath.h
> +index 51290d355..fbd9b5925 100644
> +--- a/include/grub/safemath.h
> ++++ b/include/grub/safemath.h
> +@@ -30,6 +30,8 @@
> + #define grub_sub(a, b, res)   __builtin_sub_overflow(a, b, res)
> + #define grub_mul(a, b, res)   __builtin_mul_overflow(a, b, res)
> +
> ++#define grub_cast(a, res)     grub_add ((a), 0, (res))
> ++
> + #else
> + #error gcc 5.1 or newer or clang 8.0 or newer is required
> + #endif
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-bsp/grub/files/CVE-2022-2601.patch b/meta/recipes-bsp/grub/files/CVE-2022-2601.patch
> new file mode 100644
> index 0000000000..7c140f7153
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/CVE-2022-2601.patch
> @@ -0,0 +1,87 @@
> +From 768e1ef2fc159f6e14e7246e4be09363708ac39e Mon Sep 17 00:00:00 2001
> +From: Zhang Boyang <zhangboyang.id@gmail.com>
> +Date: Fri, 5 Aug 2022 01:58:27 +0800
> +Subject: [PATCH] font: Fix several integer overflows in
> + grub_font_construct_glyph()
> +
> +This patch fixes several integer overflows in grub_font_construct_glyph().
> +Glyphs of invalid size, zero or leading to an overflow, are rejected.
> +The inconsistency between "glyph" and "max_glyph_size" when grub_malloc()
> +returns NULL is fixed too.
> +
> +Fixes: CVE-2022-2601
> +
> +Reported-by: Zhang Boyang <zhangboyang.id@gmail.com>
> +Signed-off-by: Zhang Boyang <zhangboyang.id@gmail.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Upstream-Status: Backport from
> +[https://git.savannah.gnu.org/cgit/grub.git/commit/?id=768e1ef2fc159f6e14e7246e4be09363708ac39e]
> +CVE: CVE-2022-2601
> +
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> +---
> + grub-core/font/font.c | 29 +++++++++++++++++------------
> + 1 file changed, 17 insertions(+), 12 deletions(-)
> +
> +diff --git a/grub-core/font/font.c b/grub-core/font/font.c
> +index e781521a7..e6548892f 100644
> +--- a/grub-core/font/font.c
> ++++ b/grub-core/font/font.c
> +@@ -1517,6 +1517,7 @@ grub_font_construct_glyph (grub_font_t hinted_font,
> +   struct grub_video_signed_rect bounds;
> +   static struct grub_font_glyph *glyph = 0;
> +   static grub_size_t max_glyph_size = 0;
> ++  grub_size_t cur_glyph_size;
> +
> +   ensure_comb_space (glyph_id);
> +
> +@@ -1533,29 +1534,33 @@ grub_font_construct_glyph (grub_font_t hinted_font,
> +   if (!glyph_id->ncomb && !glyph_id->attributes)
> +     return main_glyph;
> +
> +-  if (max_glyph_size < sizeof (*glyph) + (bounds.width * bounds.height + GRUB_CHAR_BIT - 1) / GRUB_CHAR_BIT)
> ++  if (grub_video_bitmap_calc_1bpp_bufsz (bounds.width, bounds.height, &cur_glyph_size) ||
> ++      grub_add (sizeof (*glyph), cur_glyph_size, &cur_glyph_size))
> ++    return main_glyph;
> ++
> ++  if (max_glyph_size < cur_glyph_size)
> +     {
> +       grub_free (glyph);
> +-      max_glyph_size = (sizeof (*glyph) + (bounds.width * bounds.height + GRUB_CHAR_BIT - 1) / GRUB_CHAR_BIT) * 2;
> +-      if (max_glyph_size < 8)
> +-      max_glyph_size = 8;
> +-      glyph = grub_malloc (max_glyph_size);
> ++      if (grub_mul (cur_glyph_size, 2, &max_glyph_size))
> ++      max_glyph_size = 0;
> ++      glyph = max_glyph_size > 0 ? grub_malloc (max_glyph_size) : NULL;
> +     }
> +   if (!glyph)
> +     {
> ++      max_glyph_size = 0;
> +       grub_errno = GRUB_ERR_NONE;
> +       return main_glyph;
> +     }
> +
> +-  grub_memset (glyph, 0, sizeof (*glyph)
> +-             + (bounds.width * bounds.height
> +-                + GRUB_CHAR_BIT - 1) / GRUB_CHAR_BIT);
> ++  grub_memset (glyph, 0, cur_glyph_size);
> +
> +   glyph->font = main_glyph->font;
> +-  glyph->width = bounds.width;
> +-  glyph->height = bounds.height;
> +-  glyph->offset_x = bounds.x;
> +-  glyph->offset_y = bounds.y;
> ++  if (bounds.width == 0 || bounds.height == 0 ||
> ++      grub_cast (bounds.width, &glyph->width) ||
> ++      grub_cast (bounds.height, &glyph->height) ||
> ++      grub_cast (bounds.x, &glyph->offset_x) ||
> ++      grub_cast (bounds.y, &glyph->offset_y))
> ++    return main_glyph;
> +
> +   if (glyph_id->attributes & GRUB_UNICODE_GLYPH_ATTRIBUTE_MIRROR)
> +     grub_font_blit_glyph_mirror (glyph, main_glyph,
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-bsp/grub/files/CVE-2022-3775.patch b/meta/recipes-bsp/grub/files/CVE-2022-3775.patch
> new file mode 100644
> index 0000000000..7b5512daaf
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/CVE-2022-3775.patch
> @@ -0,0 +1,97 @@
> +From 992c06191babc1e109caf40d6a07ec6fdef427af Mon Sep 17 00:00:00 2001
> +From: Zhang Boyang <zhangboyang.id@gmail.com>
> +Date: Mon, 24 Oct 2022 08:05:35 +0800
> +Subject: [PATCH] font: Fix an integer underflow in blit_comb()
> +
> +The expression (ctx.bounds.height - combining_glyphs[i]->height) / 2 may
> +evaluate to a very big invalid value even if both ctx.bounds.height and
> +combining_glyphs[i]->height are small integers. For example, if
> +ctx.bounds.height is 10 and combining_glyphs[i]->height is 12, this
> +expression evaluates to 2147483647 (expected -1). This is because
> +coordinates are allowed to be negative but ctx.bounds.height is an
> +unsigned int. So, the subtraction operates on unsigned ints and
> +underflows to a very big value. The division makes things even worse.
> +The quotient is still an invalid value even if converted back to int.
> +
> +This patch fixes the problem by casting ctx.bounds.height to int. As
> +a result the subtraction will operate on int and grub_uint16_t which
> +will be promoted to an int. So, the underflow will no longer happen. Other
> +uses of ctx.bounds.height (and ctx.bounds.width) are also casted to int,
> +to ensure coordinates are always calculated on signed integers.
> +
> +Fixes: CVE-2022-3775
> +
> +Reported-by: Daniel Axtens <dja@axtens.net>
> +Signed-off-by: Zhang Boyang <zhangboyang.id@gmail.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Upstream-Status: Backport from
> +[https://git.savannah.gnu.org/cgit/grub.git/commit/?id=992c06191babc1e109caf40d6a07ec6fdef427af]
> +CVE: CVE-2022-3775
> +
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> +---
> + grub-core/font/font.c | 16 ++++++++--------
> + 1 file changed, 8 insertions(+), 8 deletions(-)
> +
> +diff --git a/grub-core/font/font.c b/grub-core/font/font.c
> +index abd412a5e..3d3d803e8 100644
> +--- a/grub-core/font/font.c
> ++++ b/grub-core/font/font.c
> +@@ -1203,12 +1203,12 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
> +   ctx.bounds.height = main_glyph->height;
> +
> +   above_rightx = main_glyph->offset_x + main_glyph->width;
> +-  above_righty = ctx.bounds.y + ctx.bounds.height;
> ++  above_righty = ctx.bounds.y + (int) ctx.bounds.height;
> +
> +   above_leftx = main_glyph->offset_x;
> +-  above_lefty = ctx.bounds.y + ctx.bounds.height;
> ++  above_lefty = ctx.bounds.y + (int) ctx.bounds.height;
> +
> +-  below_rightx = ctx.bounds.x + ctx.bounds.width;
> ++  below_rightx = ctx.bounds.x + (int) ctx.bounds.width;
> +   below_righty = ctx.bounds.y;
> +
> +   comb = grub_unicode_get_comb (glyph_id);
> +@@ -1221,7 +1221,7 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
> +
> +       if (!combining_glyphs[i])
> +       continue;
> +-      targetx = (ctx.bounds.width - combining_glyphs[i]->width) / 2 + ctx.bounds.x;
> ++      targetx = ((int) ctx.bounds.width - combining_glyphs[i]->width) / 2 + ctx.bounds.x;
> +       /* CGJ is to avoid diacritics reordering. */
> +       if (comb[i].code
> +         == GRUB_UNICODE_COMBINING_GRAPHEME_JOINER)
> +@@ -1231,8 +1231,8 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
> +       case GRUB_UNICODE_COMB_OVERLAY:
> +         do_blit (combining_glyphs[i],
> +                  targetx,
> +-                 (ctx.bounds.height - combining_glyphs[i]->height) / 2
> +-                 - (ctx.bounds.height + ctx.bounds.y), &ctx);
> ++                 ((int) ctx.bounds.height - combining_glyphs[i]->height) / 2
> ++                 - ((int) ctx.bounds.height + ctx.bounds.y), &ctx);
> +         if (min_devwidth < combining_glyphs[i]->width)
> +           min_devwidth = combining_glyphs[i]->width;
> +         break;
> +@@ -1305,7 +1305,7 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
> +         /* Fallthrough.  */
> +       case GRUB_UNICODE_STACK_ATTACHED_ABOVE:
> +         do_blit (combining_glyphs[i], targetx,
> +-                 -(ctx.bounds.height + ctx.bounds.y + space
> ++                 -((int) ctx.bounds.height + ctx.bounds.y + space
> +                    + combining_glyphs[i]->height), &ctx);
> +         if (min_devwidth < combining_glyphs[i]->width)
> +           min_devwidth = combining_glyphs[i]->width;
> +@@ -1313,7 +1313,7 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
> +
> +       case GRUB_UNICODE_COMB_HEBREW_DAGESH:
> +         do_blit (combining_glyphs[i], targetx,
> +-                 -(ctx.bounds.height / 2 + ctx.bounds.y
> ++                 -((int) ctx.bounds.height / 2 + ctx.bounds.y
> +                    + combining_glyphs[i]->height / 2), &ctx);
> +         if (min_devwidth < combining_glyphs[i]->width)
> +           min_devwidth = combining_glyphs[i]->width;
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
> index 47ea561002..270efd30ef 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -32,6 +32,9 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
>             file://CVE-2022-28734-net-http-Fix-OOB-write-for-split-http-headers.patch \
>             file://CVE-2022-28734-net-http-Error-out-on-headers-with-LF-without-CR.patch \
>             file://CVE-2022-28735-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch \
> +           file://0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch \
> +           file://CVE-2022-2601.patch \
> +           file://CVE-2022-3775.patch \
>  "
>
>  SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173708): https://lists.openembedded.org/g/openembedded-core/message/173708
> Mute This Topic: https://lists.openembedded.org/mt/95213124/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

