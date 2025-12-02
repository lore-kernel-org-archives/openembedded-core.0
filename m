Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73806D1267A
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 22:20:02 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.941.1764713996216314303
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 14:19:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2HaUNrZo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29555415c5fso71485845ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 14:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764713995; x=1765318795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0QsmtxetyE3GHSLz08eedZC0lKTCNYKFgZez3ryvdKs=;
        b=2HaUNrZoivsKHgt2aPV/B5vDeCQ2LcwBDNdAijfKbEcPC/NMdUvWteARc1p7UJtGDi
         42MgFsbr5Iisi9D/y7Y9B/7Xu/MKxrJjfTTzSdOsG22TDRDa6791WAPmGhm39clsRP1I
         u+Cugl3gtmajAGSmtxHDkXnysU/vquDKquji3ppPMmfJAgrujHAn936OfBfEXEEslL8K
         GgnUHiIeTu2AHfqU7oExTqgbBNgV+YkkjqbE4YJxvfs5hKLu7outq+kkmefWZGJsM9gy
         JfmE0zy0ZD5d1lMtS9hrt4kHoUKeKauoOZa+sbbMkqXwOcKmfWuyys4j9Z9jPAgbWf03
         lH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764713995; x=1765318795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0QsmtxetyE3GHSLz08eedZC0lKTCNYKFgZez3ryvdKs=;
        b=Vz4aBqOb2ff5wPaZK3lgxDZza8lx2pkxVfhxMLvkFQRVdvtBlJk+YiDyvwbiNlEVLZ
         9p1tgiDVcz3KsUgt7oOqZBM5+1kvcq0xa16IE19oULKhCLHjo9Dp3SgO0JNOipU4UEWM
         FqO1f3W6JdqfBNiCal8HNm43IjVWRzmHoLV3QkKAUMgITTseycKKGcB9sU0MYOJhpQB8
         qeF0i31fffyjNFAq5xFVkGrOhPxeibZ8Kjjo9ZmKqWTNZW6WwY9Z9HrsxSRCzW3SScxD
         k2jFg35EcEuM/s1hpPdGE4H8kSTb+aj85jrWJ3NXEU+40c94+dfHkiPOMBR3u5IseVtP
         l5NA==
X-Gm-Message-State: AOJu0YyKGjxnQCdX4xUsurgDBbbt5gzmqSSVwq24NoFoOdT2QRM0e5vt
	PnDmoj481VBZClpq3cQTFFCA7WBw4nySaJ519AzoWl1u4zUZo0yQaHAwuKIqRn+sclltpVW+gVj
	sRJD0
X-Gm-Gg: ASbGnctjwS+ezrOrZLuP/Wn4AzhVzfbvne1uzHjkUGGTN7jpPyehtNRA/lA3M4kJRa9
	kDD321WCA7l+LsXy07mt8QdHUt3NkYGqWorKX8xwTrAGCiX2O3ckAvL8/pPxxeqv7oRQ2w2KIF5
	cxtxKIv2pZlFzYmO0zDftUoGxCvLhjhcxjty6vl4MH60fg0NdhAQjpBtL9bPIYQmK8GpviaQ7ii
	wB70HpYQtDorPedVeqFz6IDfR113fkTwL6HrKj0A7gB2s04+e88iotZWvWzSpEHPmPom+HE0r5d
	WXndr9Y/mwJqPS5xjZPYUQKuQFA/SThdEuaGbActQbImc3nDgu6bqKJ1XDdxeskozCp2qfu0PhT
	VkqP+SD5z470Xtz3JFbCDWR3q3QVTLh8dcJ7glO7KW1SHuYrqkcrziMxnjfZSeJ70xZRj+8U8Ff
	5yCg==
X-Google-Smtp-Source: AGHT+IHwOFiohlkPLk7NZqildcuM9KwoyTy7TtDI1gaxeeEijPQCiidjTBI2gJcGmb9ly905bvwCxw==
X-Received: by 2002:a17:902:f645:b0:297:e3c4:b2b0 with SMTP id d9443c01a7336-29d683db2camr1325875ad.54.1764713995273;
        Tue, 02 Dec 2025 14:19:55 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:b8d9:92cd:3fd4:9b7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40acc7sm163700565ad.2.2025.12.02.14.19.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 14:19:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 7/8] libpng: patch CVE-2025-65018
Date: Tue,  2 Dec 2025 14:19:29 -0800
Message-ID: <28810b9d9cd546c42140b93bfaad59a062a229fb.1764713862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764713862.git.steve@sakoman.com>
References: <cover.1764713862.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 22:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227193

From: Peter Marko <peter.marko@siemens.com>

Pick commit per NVD report.
Add two patches to apply it cleanly.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libpng/files/CVE-2025-65018-01.patch      |  60 +++++++
 .../libpng/files/CVE-2025-65018-02.patch      | 163 ++++++++++++++++++
 .../libpng/libpng_1.6.42.bb                   |   2 +
 3 files changed, 225 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-65018-01.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-65018-02.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-65018-01.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-65018-01.patch
new file mode 100644
index 0000000000..cdee6c76c0
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2025-65018-01.patch
@@ -0,0 +1,60 @@
+From 16b5e3823918840aae65c0a6da57c78a5a496a4d Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Mon, 17 Nov 2025 20:38:47 +0200
+Subject: [PATCH] Fix a buffer overflow in `png_image_finish_read`
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Reject bit-depth mismatches between IHDR and the requested output
+format. When a 16-bit PNG is processed with an 8-bit output format
+request, `png_combine_row` writes using the IHDR depth before
+transformation, causing writes beyond the buffer allocated via
+`PNG_IMAGE_SIZE(image)`.
+
+The validation establishes a safe API contract where
+`PNG_IMAGE_SIZE(image)` is guaranteed to be sufficient across the
+transformation pipeline.
+
+Example overflow (32×32 pixels, 16-bit RGB to 8-bit RGBA):
+- Input format: 16 bits/channel × 3 channels = 6144 bytes
+- Output buffer: 8 bits/channel × 4 channels = 4096 bytes
+- Overflow: 6144 bytes - 4096 bytes = 2048 bytes
+
+Larger images produce proportionally larger overflows. For example,
+for 256×256 pixels, the overflow is 131072 bytes.
+
+Reported-by: yosiimich <yosiimich@users.noreply.github.com>
+
+CVE: CVE-2025-65018
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/16b5e3823918840aae65c0a6da57c78a5a496a4d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ pngread.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/pngread.c b/pngread.c
+index 212afb7d2..92571ec33 100644
+--- a/pngread.c
++++ b/pngread.c
+@@ -4166,6 +4166,20 @@ png_image_finish_read(png_imagep image, png_const_colorp background,
+                   int result;
+                   png_image_read_control display;
+ 
++                  /* Reject bit depth mismatches to avoid buffer overflows. */
++                  png_uint_32 ihdr_bit_depth =
++                      image->opaque->png_ptr->bit_depth;
++                  int requested_linear =
++                      (image->format & PNG_FORMAT_FLAG_LINEAR) != 0;
++                  if (ihdr_bit_depth == 16 && !requested_linear)
++                     return png_image_error(image,
++                         "png_image_finish_read: "
++                         "16-bit PNG must use 16-bit output format");
++                  if (ihdr_bit_depth < 16 && requested_linear)
++                     return png_image_error(image,
++                         "png_image_finish_read: "
++                         "8-bit PNG must not use 16-bit output format");
++
+                   memset(&display, 0, (sizeof display));
+                   display.image = image;
+                   display.buffer = buffer;
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-65018-02.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-65018-02.patch
new file mode 100644
index 0000000000..891cd20c3f
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2025-65018-02.patch
@@ -0,0 +1,163 @@
+From 218612ddd6b17944e21eda56caf8b4bf7779d1ea Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Wed, 19 Nov 2025 21:45:13 +0200
+Subject: [PATCH] Rearchitect the fix to the buffer overflow in
+ `png_image_finish_read`
+
+Undo the fix from commit 16b5e3823918840aae65c0a6da57c78a5a496a4d.
+That fix turned out to be unnecessarily limiting. It rejected all
+16-to-8 bit transformations, although the vulnerability only affects
+interlaced PNGs where `png_combine_row` writes using IHDR bit-depth
+before the transformation completes.
+
+The proper solution is to add an intermediate `local_row` buffer,
+specifically for the slow but necessary step of 16-to-8 bit conversion
+of interlaced images. (The processing of non-interlaced images remains
+intact, using the fast path.) We added the flag `do_local_scale` and
+the function `png_image_read_direct_scaled`, following the pattern that
+involves `do_local_compose`.
+
+In conclusion:
+- The 16-to-8 bit transformations of interlaced images are now safe,
+  as they use an intermediate buffer.
+- The 16-to-8 bit transformations of non-interlaced images remain safe,
+  as the fast path remains unchanged.
+- All our regression tests are now passing.
+
+CVE: CVE-2025-65018
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/218612ddd6b17944e21eda56caf8b4bf7779d1ea]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ pngread.c | 89 ++++++++++++++++++++++++++++++++++++++++++++++---------
+ 1 file changed, 75 insertions(+), 14 deletions(-)
+
+diff --git a/pngread.c b/pngread.c
+index 92571ec33..79917daaa 100644
+--- a/pngread.c
++++ b/pngread.c
+@@ -3262,6 +3262,54 @@ png_image_read_colormapped(png_voidp argument)
+    }
+ }
+ 
++/* Row reading for interlaced 16-to-8 bit depth conversion with local buffer. */
++static int
++png_image_read_direct_scaled(png_voidp argument)
++{
++   png_image_read_control *display = png_voidcast(png_image_read_control*,
++       argument);
++   png_imagep image = display->image;
++   png_structrp png_ptr = image->opaque->png_ptr;
++   png_bytep local_row = png_voidcast(png_bytep, display->local_row);
++   png_bytep first_row = png_voidcast(png_bytep, display->first_row);
++   ptrdiff_t row_bytes = display->row_bytes;
++   int passes;
++
++   /* Handle interlacing. */
++   switch (png_ptr->interlaced)
++   {
++      case PNG_INTERLACE_NONE:
++         passes = 1;
++         break;
++
++      case PNG_INTERLACE_ADAM7:
++         passes = PNG_INTERLACE_ADAM7_PASSES;
++         break;
++
++      default:
++         png_error(png_ptr, "unknown interlace type");
++   }
++
++   /* Read each pass using local_row as intermediate buffer. */
++   while (--passes >= 0)
++   {
++      png_uint_32 y = image->height;
++      png_bytep output_row = first_row;
++
++      for (; y > 0; --y)
++      {
++         /* Read into local_row (gets transformed 8-bit data). */
++         png_read_row(png_ptr, local_row, NULL);
++
++         /* Copy from local_row to user buffer. */
++         memcpy(output_row, local_row, (size_t)row_bytes);
++         output_row += row_bytes;
++      }
++   }
++
++   return 1;
++}
++
+ /* Just the row reading part of png_image_read. */
+ static int
+ png_image_read_composite(png_voidp argument)
+@@ -3680,6 +3728,7 @@ png_image_read_direct(png_voidp argument)
+    int linear = (format & PNG_FORMAT_FLAG_LINEAR) != 0;
+    int do_local_compose = 0;
+    int do_local_background = 0; /* to avoid double gamma correction bug */
++   int do_local_scale = 0; /* for interlaced 16-to-8 bit conversion */
+    int passes = 0;
+ 
+    /* Add transforms to ensure the correct output format is produced then check
+@@ -3806,8 +3855,16 @@ png_image_read_direct(png_voidp argument)
+             png_set_expand_16(png_ptr);
+ 
+          else /* 8-bit output */
++         {
+             png_set_scale_16(png_ptr);
+ 
++            /* For interlaced images, use local_row buffer to avoid overflow
++             * in png_combine_row() which writes using IHDR bit-depth.
++             */
++            if (png_ptr->interlaced != 0)
++               do_local_scale = 1;
++         }
++
+          change &= ~PNG_FORMAT_FLAG_LINEAR;
+       }
+ 
+@@ -4083,6 +4140,24 @@ png_image_read_direct(png_voidp argument)
+       return result;
+    }
+ 
++   else if (do_local_scale != 0)
++   {
++      /* For interlaced 16-to-8 conversion, use an intermediate row buffer
++       * to avoid buffer overflows in png_combine_row. The local_row is sized
++       * for the transformed (8-bit) output, preventing the overflow that would
++       * occur if png_combine_row wrote 16-bit data directly to the user buffer.
++       */
++      int result;
++      png_voidp row = png_malloc(png_ptr, png_get_rowbytes(png_ptr, info_ptr));
++
++      display->local_row = row;
++      result = png_safe_execute(image, png_image_read_direct_scaled, display);
++      display->local_row = NULL;
++      png_free(png_ptr, row);
++
++      return result;
++   }
++
+    else
+    {
+       png_alloc_size_t row_bytes = (png_alloc_size_t)display->row_bytes;
+@@ -4166,20 +4241,6 @@ png_image_finish_read(png_imagep image, png_const_colorp background,
+                   int result;
+                   png_image_read_control display;
+ 
+-                  /* Reject bit depth mismatches to avoid buffer overflows. */
+-                  png_uint_32 ihdr_bit_depth =
+-                      image->opaque->png_ptr->bit_depth;
+-                  int requested_linear =
+-                      (image->format & PNG_FORMAT_FLAG_LINEAR) != 0;
+-                  if (ihdr_bit_depth == 16 && !requested_linear)
+-                     return png_image_error(image,
+-                         "png_image_finish_read: "
+-                         "16-bit PNG must use 16-bit output format");
+-                  if (ihdr_bit_depth < 16 && requested_linear)
+-                     return png_image_error(image,
+-                         "png_image_finish_read: "
+-                         "8-bit PNG must not use 16-bit output format");
+-
+                   memset(&display, 0, (sizeof display));
+                   display.image = image;
+                   display.buffer = buffer;
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index 6f5b69b754..2d5216cb65 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -17,6 +17,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz
            file://CVE-2025-64505-03.patch \
            file://CVE-2025-64506.patch \
            file://CVE-2025-64720.patch \
+           file://CVE-2025-65018-01.patch \
+           file://CVE-2025-65018-02.patch \
 "
 
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"
-- 
2.43.0


