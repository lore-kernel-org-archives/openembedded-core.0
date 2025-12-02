Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F21AD11702
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 15:09:51 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9663.1764688191360257942
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 07:09:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LoeIBaZB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7c66822dd6dso3504007b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 07:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764688190; x=1765292990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OrTeKnFWHKFFWOm4SRDqyYNp2nBiWmVJcgqkXR84ITM=;
        b=LoeIBaZBkwgW9PXbNlrZ5xwVG422t0x3W1P0U1lxYRpMwixCSZG31lA8OqZel26yZ6
         4f3iTkTJ5xRrVUO8NILUthnZrTSMwdz+e77AnTVrxl+QCrjsRcSe8AY63I/WdULJ+5kx
         1PNmneD209gcr3iB+xjYYYh6F4tk55VjEbQvbyxqE0hQwPtxOxP1nCEkFqVA80N1ZemA
         HrKYrc7cdQJ5nbxxkG3UDtkWi93c1zIgREGbtfY9daATgiM8xnbRh4eDkofX9ovb5rJH
         t36ougqjgq/iqaBkb0462+31ZF2PozLgIF9bO2cdzFqa+4KCcrkFvldsONksvqBuArbH
         GwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764688190; x=1765292990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OrTeKnFWHKFFWOm4SRDqyYNp2nBiWmVJcgqkXR84ITM=;
        b=gebzq6HV88zdLrfy4C/e2ST52BipkYF2L4sUaY3eeI4onseGRFP2kNqT1etNEfjLiO
         Agg58onlxTpBJ2g4VRKBgjhjorbe0KDZZgkM2nRbKgucVR0/69np72rmNyCDyEHZxYtU
         oz/j3oYyKZ9ox+TF6i5fvLZVLE5+X3eAyW/rFAPjwBeteEEqU1a1F/uRxDHoQH8eeMjI
         PutHJu5ykWZwKHLpdnl+xFWY1Ha36idy/k5xLQ0h6N/74Rglbfq7O3hd3/114QuRus4g
         1P/hMCtHPngjKNAdNJHcm1DA4pAAxwHjhwst00sWpsPM34EfpNGxax89IYlXz1byDMxM
         SV5Q==
X-Gm-Message-State: AOJu0YxRB+2/91XxqYiQBZQib4KnrD8KpFzg4Nba4LgwMUPq+VfPu8Fe
	aBf9GVyp3cpNy8tFJidI0E+0QAydjHzpItRGfQ7BLoReER+tZUfH2KCQyCRjpraJxAlAuIUUfVQ
	IJS1G
X-Gm-Gg: ASbGncvvII/vJdp/L8czr1V/3mGQrXu3o46uHOnwZxCiG+ZEAfQDL5Aotvg4UxsSKT1
	VufEtWMTi+CtW85N+pv7z/oYVCwOvQhbt1qJOrOd46BLJbSQVluNacHmGrVds7h7kxMh/Ta+PLN
	S/vIVV26vHcS7IG/Y90pwekfiq9uD17PFGeJbELZYlQGDypp+f6CgHPXFiEuD4p6v0j6FUAQd66
	1OqDDyNd8s/JkqWlTARWLiZwQybXiiwuLhYCay/g/sN05SIAWjmdStsOlWEjmAXIqn9ffEqFiGe
	bzLisXVqGagFGotQFPjQUgBE6OrRhBH8N0vXd611QI1Ix8hwPag5dV5i048KkiVoNvn3IwF3Hms
	L4ZJ9w2Ej/1qtLhtQJvARYBtlfaEKUzTUXujeTkVlnhjRkvO2OrnwWxUtCUoK35OFgZB7fsMQCC
	54qQ==
X-Google-Smtp-Source: AGHT+IHcxrKSWSHjKKXeN8xdZ2sWOoQcjPdLETTLZxF9LIy5iYret4Pe1N7xxwCsV7FGeX45zTJshA==
X-Received: by 2002:a05:6a20:3d92:b0:334:b280:b12 with SMTP id adf61e73a8af0-363e8c79fe4mr3163132637.1.1764688190182;
        Tue, 02 Dec 2025 07:09:50 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:b8d9:92cd:3fd4:9b7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1516f6621sm17175182b3a.16.2025.12.02.07.09.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 07:09:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/10] libpng: patch CVE-2025-65018
Date: Tue,  2 Dec 2025 07:09:28 -0800
Message-ID: <c46f841cdc8f7c1b0cce7da8fb587f65320a2163.1764688054.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764688053.git.steve@sakoman.com>
References: <cover.1764688053.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 15:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227164

From: Peter Marko <peter.marko@siemens.com>

Pick commits per NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libpng/files/CVE-2025-65018-01.patch      |  60 +++++++
 .../libpng/files/CVE-2025-65018-02.patch      | 163 ++++++++++++++++++
 .../libpng/libpng_1.6.39.bb                   |   2 +
 3 files changed, 225 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-65018-01.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-65018-02.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-65018-01.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-65018-01.patch
new file mode 100644
index 0000000000..a3e31ea6ac
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
+@@ -4164,6 +4164,20 @@ png_image_finish_read(png_imagep image, png_const_colorp background,
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
index 0000000000..b64a45e9f3
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
+@@ -3260,6 +3260,54 @@ png_image_read_colormapped(png_voidp argument)
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
+@@ -3678,6 +3726,7 @@ png_image_read_direct(png_voidp argument)
+    int linear = (format & PNG_FORMAT_FLAG_LINEAR) != 0;
+    int do_local_compose = 0;
+    int do_local_background = 0; /* to avoid double gamma correction bug */
++   int do_local_scale = 0; /* for interlaced 16-to-8 bit conversion */
+    int passes = 0;
+ 
+    /* Add transforms to ensure the correct output format is produced then check
+@@ -3804,8 +3853,16 @@ png_image_read_direct(png_voidp argument)
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
+@@ -4081,6 +4138,24 @@ png_image_read_direct(png_voidp argument)
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
+@@ -4164,20 +4239,6 @@ png_image_finish_read(png_imagep image, png_const_colorp background,
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
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
index efb8eba372..47b76a704b 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
@@ -18,6 +18,8 @@ SRC_URI = "\
            file://CVE-2025-64505-03.patch \
            file://CVE-2025-64506.patch \
            file://CVE-2025-64720.patch \
+           file://CVE-2025-65018-01.patch \
+           file://CVE-2025-65018-02.patch \
 "
 
 SRC_URI[sha256sum] = "1f4696ce70b4ee5f85f1e1623dc1229b210029fa4b7aee573df3e2ba7b036937"
-- 
2.43.0


