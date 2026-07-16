Return-Path: <lianux.mm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53A5C4450A
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 07:51:54 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7684.1784188313921258187
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 00:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=huMFNlGC;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: lianux.mm@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e041ea211so3733130a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 00:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784188313; x=1784793113; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlpHJOk4XZz9/vpJZtv2hRIznAZZ2+eJ7XbztucmMuY=;
        b=huMFNlGCVgXav8F4Q7kEo4SyXsYUbCrWST5PkJsNQHYUWQL4jb76B67uj1QbfcTpOZ
         7mxYj4slaMNZX1Bf94nLvcHAoh48g08NLvJKcuyY+NXd2rlmFqf6zf0vmTfkbPbAxGzX
         w5HuUmdHctU7PGqK9ajZ+0WD6wLRQZCi6LdRYakNQQKJ+MsCJt1hN5EZxYuwLueLlnds
         30aOKVOe6sQoh2iezM1bgyTaHVpAI98EUm/DBWwOH8QEHCds0i1bd/BMsN3NdKTItsqb
         23Sr6hKny4fBkw37vlciBhw3+aqf7LiNofD2YQAgA2ItZnxzBatSFbPb1qWtUlju8Vnb
         0j+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784188313; x=1784793113;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rlpHJOk4XZz9/vpJZtv2hRIznAZZ2+eJ7XbztucmMuY=;
        b=NYutDjMs6QlZu12iqb+QLNTTfb+XA0ZYUWP5O/tvShMLBImqmYtPuhp2mu4SJyekJK
         AmA+pYD9IXx+oNPrptPHboxSFPdzM2zfbbAjNAZLQfci8uydnWzuugr6IUb4/ZFXwOvc
         cn2ZqzfO9+DNzIeSUivYma7lEGgYbcWFENQa75f2H0Wm67aCsUYtmzXuGm7elWLiRMpa
         Q9MDJcqSsd5q+wEOdI+KNBkm8MCdibsYg3u9bZ4yZT3yXB4ilYweDyV4ereJKTEKQAoU
         xiF7H+/atRjqznODlbBwtg2RurtrPPjcVcoMeCs574iK5XG+ZbL52/6yy3pYzwPjjR0T
         LQwA==
X-Gm-Message-State: AOJu0YzkJyZDWunqaoQA0LU/aqXFBKQgVzqIs1SG/YKgJhCf5C1I5z9U
	gNDqgd7tX/3KTWqwdLmH2b6KDVPRkP+Y+uIEJ3AqNZjBFp1JtBeEXHffsPoqEyDd8OU=
X-Gm-Gg: AfdE7cnuUweaUqwreUEvugrJ7BrdWIAsO1lNHKE8/qWgbpV4hozpB6/+713/2KUemOA
	JfwNawDSAsXmGlej221hvGt+f6S3HMZH66rg2B5L7NceHXFex2eolJS7Wn9nAECwP5bTyG6oHq4
	tXti7CE5PuZAxUUvwcD6J1ybkawwI1wdu70brdCBWFzlrETIDm7CEWrfN4GhkLSDSURdxbz64hH
	1Mpu5GjAHsSSYFKzM0fVml8SZ0Xkti1oNN2m1VPzdeMWyP6AWuOmQc7QaYT2csZ9FKLbjtPBCty
	U/h9kaUJTPsGj+IW8Q728eeviqdJ5Ai7gP4PKd0mWKG8hQpE57z9hwen4InBxuBCT81iapuC7w7
	GzYEVZo/oT8D2m31a6TNetQYhTU/lrIjuSNpt9tWdNjrXaHSqmLht1XCl0hoZG+HP+3kDrNDT4n
	nWdYEQg3xJcw==
X-Received: by 2002:a17:90b:5830:b0:387:e0bb:57f7 with SMTP id 98e67ed59e1d1-38e1af72937mr9453364a91.40.1784188311455;
        Thu, 16 Jul 2026 00:51:51 -0700 (PDT)
Received: from localhost.localdomain ([2605:a141:2231:7698::1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e3a0d7a5bsm879524a91.9.2026.07.16.00.51.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 00:51:51 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
X-Google-Original-From: Lian Wang <lianux.wang@processmission.com>
To: openembedded-core@lists.openembedded.org
Cc: Lian Wang <lianux.wang@processmission.com>
Subject: [PATCH] libpng: upgrade 1.6.42 -> 1.6.58
Date: Thu, 16 Jul 2026 15:51:37 +0800
Message-ID: <20260716075137.18584-1-lianux.wang@processmission.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 07:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241066

- Drop 17 CVE patches fixed upstream in 1.6.54 through 1.6.58
- Update LICENSE checksum (copyright year updated)
- All CVE-2025-64505, CVE-2025-64506, CVE-2025-64720,
  CVE-2025-65018, CVE-2025-66293, CVE-2026-22695,
  CVE-2026-22801, CVE-2026-25646, CVE-2026-33416,
  CVE-2026-33636 resolved in this release

Signed-off-by: Lian Wang <lianux.wang@processmission.com>
---
 .../libpng/files/CVE-2025-64505-01.patch      | 111 -----------
 .../libpng/files/CVE-2025-64505-02.patch      | 163 -----------------
 .../libpng/files/CVE-2025-64505-03.patch      |  52 ------
 .../libpng/files/CVE-2025-64506.patch         |  57 ------
 .../libpng/files/CVE-2025-64720.patch         | 103 -----------
 .../libpng/files/CVE-2025-65018-01.patch      |  60 ------
 .../libpng/files/CVE-2025-65018-02.patch      | 163 -----------------
 .../libpng/files/CVE-2025-66293-01.patch      |  60 ------
 .../libpng/files/CVE-2025-66293-02.patch      | 125 -------------
 .../libpng/files/CVE-2026-22695.patch         |  77 --------
 .../libpng/files/CVE-2026-22801.patch         | 173 ------------------
 .../libpng/files/CVE-2026-25646.patch         |  61 ------
 .../libpng/files/CVE-2026-33416-01.patch      | 143 ---------------
 .../libpng/files/CVE-2026-33416-02.patch      |  53 ------
 .../libpng/files/CVE-2026-33416-03.patch      | 163 -----------------
 .../libpng/files/CVE-2026-33416-04.patch      |  53 ------
 .../libpng/files/CVE-2026-33636.patch         |  99 ----------
 .../{libpng_1.6.42.bb => libpng_1.6.58.bb}    |  21 +--
 18 files changed, 2 insertions(+), 1735 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64505-01.patch
 delete mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64505-02.patch
 delete mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64505-03.patch
 delete mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64506.patch
 delete mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64720.patch
 delete mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-65018-01.patch
 delete mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-65018-02.patch
 delete mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-66293-01.patch
 delete mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-66293-02.patch
 delete mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch
 delete mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-22801.patch
 delete mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-25646.patch
 delete mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416-01.patch
 delete mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416-02.patch
 delete mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416-03.patch
 delete mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416-04.patch
 delete mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33636.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.6.42.bb => libpng_1.6.58.bb} (77%)

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-64505-01.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-64505-01.patch
deleted file mode 100644
index 1e7d122..0000000
--- a/meta/recipes-multimedia/libpng/files/CVE-2025-64505-01.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-From 0fa3c0f698c2ca618a0fa44e10a822678df85373 Mon Sep 17 00:00:00 2001
-From: Cosmin Truta <ctruta@gmail.com>
-Date: Thu, 15 Feb 2024 21:53:24 +0200
-Subject: [PATCH] chore: Clean up the spurious uses of `sizeof(png_byte)`; fix
- the manual
-
-By definition, `sizeof(png_byte)` is 1.
-
-Remove all the occurences of `sizeof(png_byte)` from the code, and fix
-a related typo in the libpng manual.
-
-Also update the main .editorconfig file to reflect the fixing expected
-by a FIXME note.
-
-CVE: CVE-2025-64505
-Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/0fa3c0f698c2ca618a0fa44e10a822678df85373]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- libpng-manual.txt |  4 ++--
- libpng.3          |  4 ++--
- pngrtran.c        | 17 +++++++----------
- 3 files changed, 11 insertions(+), 14 deletions(-)
-
-diff --git a/libpng-manual.txt b/libpng-manual.txt
-index eb24ef483..d2918ce31 100644
---- a/libpng-manual.txt
-+++ b/libpng-manual.txt
-@@ -1178,11 +1178,11 @@ where row_pointers is an array of pointers to the pixel data for each row:
- If you know your image size and pixel size ahead of time, you can allocate
- row_pointers prior to calling png_read_png() with
- 
--   if (height > PNG_UINT_32_MAX/(sizeof (png_byte)))
-+   if (height > PNG_UINT_32_MAX / (sizeof (png_bytep)))
-       png_error(png_ptr,
-           "Image is too tall to process in memory");
- 
--   if (width > PNG_UINT_32_MAX/pixel_size)
-+   if (width > PNG_UINT_32_MAX / pixel_size)
-       png_error(png_ptr,
-           "Image is too wide to process in memory");
- 
-diff --git a/libpng.3 b/libpng.3
-index 57d06f2db..8875b219a 100644
---- a/libpng.3
-+++ b/libpng.3
-@@ -1697,11 +1697,11 @@ where row_pointers is an array of pointers to the pixel data for each row:
- If you know your image size and pixel size ahead of time, you can allocate
- row_pointers prior to calling png_read_png() with
- 
--   if (height > PNG_UINT_32_MAX/(sizeof (png_byte)))
-+   if (height > PNG_UINT_32_MAX / (sizeof (png_bytep)))
-       png_error(png_ptr,
-           "Image is too tall to process in memory");
- 
--   if (width > PNG_UINT_32_MAX/pixel_size)
-+   if (width > PNG_UINT_32_MAX / pixel_size)
-       png_error(png_ptr,
-           "Image is too wide to process in memory");
- 
-diff --git a/pngrtran.c b/pngrtran.c
-index 74cca476b..041f9306c 100644
---- a/pngrtran.c
-+++ b/pngrtran.c
-@@ -441,7 +441,7 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
-       int i;
- 
-       png_ptr->quantize_index = (png_bytep)png_malloc(png_ptr,
--          (png_alloc_size_t)((png_uint_32)num_palette * (sizeof (png_byte))));
-+          (png_alloc_size_t)num_palette);
-       for (i = 0; i < num_palette; i++)
-          png_ptr->quantize_index[i] = (png_byte)i;
-    }
-@@ -458,7 +458,7 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
- 
-          /* Initialize an array to sort colors */
-          png_ptr->quantize_sort = (png_bytep)png_malloc(png_ptr,
--             (png_alloc_size_t)((png_uint_32)num_palette * (sizeof (png_byte))));
-+             (png_alloc_size_t)num_palette);
- 
-          /* Initialize the quantize_sort array */
-          for (i = 0; i < num_palette; i++)
-@@ -592,11 +592,9 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
- 
-          /* Initialize palette index arrays */
-          png_ptr->index_to_palette = (png_bytep)png_malloc(png_ptr,
--             (png_alloc_size_t)((png_uint_32)num_palette *
--             (sizeof (png_byte))));
-+             (png_alloc_size_t)num_palette);
-          png_ptr->palette_to_index = (png_bytep)png_malloc(png_ptr,
--             (png_alloc_size_t)((png_uint_32)num_palette *
--             (sizeof (png_byte))));
-+             (png_alloc_size_t)num_palette);
- 
-          /* Initialize the sort array */
-          for (i = 0; i < num_palette; i++)
-@@ -761,12 +759,11 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
-       size_t num_entries = ((size_t)1 << total_bits);
- 
-       png_ptr->palette_lookup = (png_bytep)png_calloc(png_ptr,
--          (png_alloc_size_t)(num_entries * (sizeof (png_byte))));
-+          (png_alloc_size_t)(num_entries));
- 
--      distance = (png_bytep)png_malloc(png_ptr, (png_alloc_size_t)(num_entries *
--          (sizeof (png_byte))));
-+      distance = (png_bytep)png_malloc(png_ptr, (png_alloc_size_t)num_entries);
- 
--      memset(distance, 0xff, num_entries * (sizeof (png_byte)));
-+      memset(distance, 0xff, num_entries);
- 
-       for (i = 0; i < num_palette; i++)
-       {
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-64505-02.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-64505-02.patch
deleted file mode 100644
index 5a3e50b..0000000
--- a/meta/recipes-multimedia/libpng/files/CVE-2025-64505-02.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-From ea094764f3436e3c6524622724c2d342a3eff235 Mon Sep 17 00:00:00 2001
-From: Cosmin Truta <ctruta@gmail.com>
-Date: Sat, 8 Nov 2025 17:16:59 +0200
-Subject: [PATCH] Fix a memory leak in function `png_set_quantize`; refactor
-
-Release the previously-allocated array `quantize_index` before
-reallocating it. This avoids leaking memory when the function
-`png_set_quantize` is called multiple times on the same `png_struct`.
-
-This function assumed single-call usage, but fuzzing revealed that
-repeated calls would overwrite the pointers without freeing the
-original allocations, leaking 256 bytes per call for `quantize_index`
-and additional memory for `quantize_sort` when histogram-based
-quantization is used.
-
-Also remove the array `quantize_sort` from the list of `png_struct`
-members and make it a local variable. This array is initialized,
-used and released exclusively inside the function `png_set_quantize`.
-
-Reported-by: Samsung-PENTEST <Samsung-PENTEST@users.noreply.github.com>
-Analyzed-by: degrigis <degrigis@users.noreply.github.com>
-Reviewed-by: John Bowler <jbowler@acm.org>
-
-CVE: CVE-2025-64505
-Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/ea094764f3436e3c6524622724c2d342a3eff235]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- pngrtran.c  | 43 +++++++++++++++++++++++--------------------
- pngstruct.h |  1 -
- 2 files changed, 23 insertions(+), 21 deletions(-)
-
-diff --git a/pngrtran.c b/pngrtran.c
-index 1809db704..4632dd521 100644
---- a/pngrtran.c
-+++ b/pngrtran.c
-@@ -440,6 +440,12 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
-    {
-       int i;
- 
-+      /* Initialize the array to index colors.
-+       *
-+       * Be careful to avoid leaking memory. Applications are allowed to call
-+       * this function more than once per png_struct.
-+       */
-+      png_free(png_ptr, png_ptr->quantize_index);
-       png_ptr->quantize_index = (png_bytep)png_malloc(png_ptr,
-           (png_alloc_size_t)num_palette);
-       for (i = 0; i < num_palette; i++)
-@@ -454,15 +460,14 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
-           * Perhaps not the best solution, but good enough.
-           */
- 
--         int i;
-+         png_bytep quantize_sort;
-+         int i, j;
- 
--         /* Initialize an array to sort colors */
--         png_ptr->quantize_sort = (png_bytep)png_malloc(png_ptr,
-+         /* Initialize the local array to sort colors. */
-+         quantize_sort = (png_bytep)png_malloc(png_ptr,
-              (png_alloc_size_t)num_palette);
--
--         /* Initialize the quantize_sort array */
-          for (i = 0; i < num_palette; i++)
--            png_ptr->quantize_sort[i] = (png_byte)i;
-+            quantize_sort[i] = (png_byte)i;
- 
-          /* Find the least used palette entries by starting a
-           * bubble sort, and running it until we have sorted
-@@ -474,19 +479,18 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
-          for (i = num_palette - 1; i >= maximum_colors; i--)
-          {
-             int done; /* To stop early if the list is pre-sorted */
--            int j;
- 
-             done = 1;
-             for (j = 0; j < i; j++)
-             {
--               if (histogram[png_ptr->quantize_sort[j]]
--                   < histogram[png_ptr->quantize_sort[j + 1]])
-+               if (histogram[quantize_sort[j]]
-+                   < histogram[quantize_sort[j + 1]])
-                {
-                   png_byte t;
- 
--                  t = png_ptr->quantize_sort[j];
--                  png_ptr->quantize_sort[j] = png_ptr->quantize_sort[j + 1];
--                  png_ptr->quantize_sort[j + 1] = t;
-+                  t = quantize_sort[j];
-+                  quantize_sort[j] = quantize_sort[j + 1];
-+                  quantize_sort[j + 1] = t;
-                   done = 0;
-                }
-             }
-@@ -498,18 +502,18 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
-          /* Swap the palette around, and set up a table, if necessary */
-          if (full_quantize != 0)
-          {
--            int j = num_palette;
-+            j = num_palette;
- 
-             /* Put all the useful colors within the max, but don't
-              * move the others.
-              */
-             for (i = 0; i < maximum_colors; i++)
-             {
--               if ((int)png_ptr->quantize_sort[i] >= maximum_colors)
-+               if ((int)quantize_sort[i] >= maximum_colors)
-                {
-                   do
-                      j--;
--                  while ((int)png_ptr->quantize_sort[j] >= maximum_colors);
-+                  while ((int)quantize_sort[j] >= maximum_colors);
- 
-                   palette[i] = palette[j];
-                }
-@@ -517,7 +521,7 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
-          }
-          else
-          {
--            int j = num_palette;
-+            j = num_palette;
- 
-             /* Move all the used colors inside the max limit, and
-              * develop a translation table.
-@@ -525,13 +529,13 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
-             for (i = 0; i < maximum_colors; i++)
-             {
-                /* Only move the colors we need to */
--               if ((int)png_ptr->quantize_sort[i] >= maximum_colors)
-+               if ((int)quantize_sort[i] >= maximum_colors)
-                {
-                   png_color tmp_color;
- 
-                   do
-                      j--;
--                  while ((int)png_ptr->quantize_sort[j] >= maximum_colors);
-+                  while ((int)quantize_sort[j] >= maximum_colors);
- 
-                   tmp_color = palette[j];
-                   palette[j] = palette[i];
-@@ -569,8 +573,7 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
-                }
-             }
-          }
--         png_free(png_ptr, png_ptr->quantize_sort);
--         png_ptr->quantize_sort = NULL;
-+         png_free(png_ptr, quantize_sort);
-       }
-       else
-       {
-diff --git a/pngstruct.h b/pngstruct.h
-index 084422bc1..fe5fa0415 100644
---- a/pngstruct.h
-+++ b/pngstruct.h
-@@ -413,7 +413,6 @@ struct png_struct_def
- 
- #ifdef PNG_READ_QUANTIZE_SUPPORTED
- /* The following three members were added at version 1.0.14 and 1.2.4 */
--   png_bytep quantize_sort;          /* working sort array */
-    png_bytep index_to_palette;       /* where the original index currently is
-                                         in the palette */
-    png_bytep palette_to_index;       /* which original index points to this
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-64505-03.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-64505-03.patch
deleted file mode 100644
index ddda867..0000000
--- a/meta/recipes-multimedia/libpng/files/CVE-2025-64505-03.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 6a528eb5fd0dd7f6de1c39d30de0e41473431c37 Mon Sep 17 00:00:00 2001
-From: Cosmin Truta <ctruta@gmail.com>
-Date: Sat, 8 Nov 2025 23:58:26 +0200
-Subject: [PATCH] Fix a buffer overflow in `png_do_quantize`
-
-Allocate the quantize_index array to PNG_MAX_PALETTE_LENGTH (256 bytes)
-instead of num_palette bytes. This approach matches the allocation
-pattern for `palette[]`, `trans_alpha[]` and `riffled_palette[]` which
-were similarly oversized in libpng 1.2.1 to prevent buffer overflows
-from malformed PNG files with out-of-range palette indices.
-
-Out-of-range palette indices `index >= num_palette` will now read
-identity-mapped values from the `quantize_index` array (where index N
-maps to palette entry N). This prevents undefined behavior while
-avoiding runtime bounds checking overhead in the performance-critical
-pixel processing loop.
-
-Reported-by: Samsung-PENTEST <Samsung-PENTEST@users.noreply.github.com>
-Analyzed-by: degrigis <degrigis@users.noreply.github.com>
-
-CVE: CVE-2025-64505
-Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/6a528eb5fd0dd7f6de1c39d30de0e41473431c37]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- pngrtran.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/pngrtran.c b/pngrtran.c
-index 4632dd521..9c2475fde 100644
---- a/pngrtran.c
-+++ b/pngrtran.c
-@@ -441,14 +441,18 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
-       int i;
- 
-       /* Initialize the array to index colors.
-+       *
-+       * Ensure quantize_index can fit 256 elements (PNG_MAX_PALETTE_LENGTH)
-+       * rather than num_palette elements. This is to prevent buffer overflows
-+       * caused by malformed PNG files with out-of-range palette indices.
-        *
-        * Be careful to avoid leaking memory. Applications are allowed to call
-        * this function more than once per png_struct.
-        */
-       png_free(png_ptr, png_ptr->quantize_index);
-       png_ptr->quantize_index = (png_bytep)png_malloc(png_ptr,
--          (png_alloc_size_t)num_palette);
--      for (i = 0; i < num_palette; i++)
-+          PNG_MAX_PALETTE_LENGTH);
-+      for (i = 0; i < PNG_MAX_PALETTE_LENGTH; i++)
-          png_ptr->quantize_index[i] = (png_byte)i;
-    }
- 
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-64506.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-64506.patch
deleted file mode 100644
index dc7fe00..0000000
--- a/meta/recipes-multimedia/libpng/files/CVE-2025-64506.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 2bd84c019c300b78e811743fbcddb67c9d9bf821 Mon Sep 17 00:00:00 2001
-From: Cosmin Truta <ctruta@gmail.com>
-Date: Fri, 7 Nov 2025 22:40:05 +0200
-Subject: [PATCH] Fix a heap buffer overflow in `png_write_image_8bit`
-
-The condition guarding the pre-transform path incorrectly allowed 8-bit
-input data to enter `png_write_image_8bit` which expects 16-bit input.
-This caused out-of-bounds reads when processing 8-bit grayscale+alpha
-images (GitHub #688), or 8-bit RGB or RGB+alpha images (GitHub #746),
-with the `convert_to_8bit` flag set (an invalid combination that should
-bypass the pre-transform path).
-
-The second part of the condition, i.e.
-
-    colormap == 0 && convert_to_8bit != 0
-
-failed to verify that input was 16-bit, i.e.
-
-    linear != 0
-
-contradicting the comment "This only applies when the input is 16-bit".
-
-The fix consists in restructuring the condition to ensure both the
-`alpha` path and the `convert_to_8bit` path require linear (16-bit)
-input. The corrected condition, i.e.
-
-    linear != 0 && (alpha != 0 || display->convert_to_8bit != 0)
-
-matches the expectation of the `png_write_image_8bit` function and
-prevents treating 8-bit buffers as 16-bit data.
-
-Reported-by: Samsung-PENTEST <Samsung-PENTEST@users.noreply.github.com>
-Reported-by: weijinjinnihao <weijinjinnihao@users.noreply.github.com>
-Analyzed-by: degrigis <degrigis@users.noreply.github.com>
-Reviewed-by: John Bowler <jbowler@acm.org>
-
-CVE: CVE-2025-64506
-Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/2bd84c019c300b78e811743fbcddb67c9d9bf821]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- pngwrite.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/pngwrite.c b/pngwrite.c
-index 35a5d17b6..83148960e 100644
---- a/pngwrite.c
-+++ b/pngwrite.c
-@@ -2142,8 +2142,7 @@ png_image_write_main(png_voidp argument)
-     * before it is written.  This only applies when the input is 16-bit and
-     * either there is an alpha channel or it is converted to 8-bit.
-     */
--   if ((linear != 0 && alpha != 0 ) ||
--       (colormap == 0 && display->convert_to_8bit != 0))
-+   if (linear != 0 && (alpha != 0 || display->convert_to_8bit != 0))
-    {
-       png_bytep row = png_voidcast(png_bytep, png_malloc(png_ptr,
-           png_get_rowbytes(png_ptr, info_ptr)));
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-64720.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-64720.patch
deleted file mode 100644
index 08df7c3..0000000
--- a/meta/recipes-multimedia/libpng/files/CVE-2025-64720.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 08da33b4c88cfcd36e5a706558a8d7e0e4773643 Mon Sep 17 00:00:00 2001
-From: Cosmin Truta <ctruta@gmail.com>
-Date: Wed, 12 Nov 2025 13:46:23 +0200
-Subject: [PATCH] Fix a buffer overflow in `png_init_read_transformations`
-
-The palette compositing code in `png_init_read_transformations` was
-incorrectly applying background compositing when PNG_FLAG_OPTIMIZE_ALPHA
-was set. This violated the premultiplied alpha invariant
-`component <= alpha` expected by `png_image_read_composite`, causing
-values that exceeded the valid range for the PNG_sRGB_FROM_LINEAR lookup
-tables.
-
-When PNG_ALPHA_OPTIMIZED is active, palette entries should contain pure
-premultiplied RGB values without background compositing. The background
-compositing must happen later in `png_image_read_composite` where the
-actual background color from the PNG file is available.
-
-The fix consists in introducing conditional behavior based on
-PNG_FLAG_OPTIMIZE_ALPHA: when set, the code performs only
-premultiplication using the formula `component * alpha + 127) / 255`
-with proper gamma correction. When not set, the original background
-compositing calculation based on the `png_composite` macro is preserved.
-
-This prevents buffer overflows in `png_image_read_composite` where
-out-of-range premultiplied values would cause out-of-bounds array access
-in `png_sRGB_base[]` and `png_sRGB_delta[]`.
-
-Reported-by: Samsung-PENTEST <Samsung-PENTEST@users.noreply.github.com>
-Analyzed-by: John Bowler <jbowler@acm.org>
-
-CVE: CVE-2025-64720
-Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/08da33b4c88cfcd36e5a706558a8d7e0e4773643]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- pngrtran.c | 52 ++++++++++++++++++++++++++++++++++++++++++----------
- 1 file changed, 42 insertions(+), 10 deletions(-)
-
-diff --git a/pngrtran.c b/pngrtran.c
-index 548780030..2f5202255 100644
---- a/pngrtran.c
-+++ b/pngrtran.c
-@@ -1698,19 +1698,51 @@ png_init_read_transformations(png_structrp png_ptr)
-                   }
-                   else /* if (png_ptr->trans_alpha[i] != 0xff) */
-                   {
--                     png_byte v, w;
-+                     if ((png_ptr->flags & PNG_FLAG_OPTIMIZE_ALPHA) != 0)
-+                     {
-+                        /* Premultiply only:
-+                         * component = round((component * alpha) / 255)
-+                         */
-+                        png_uint_32 component;
- 
--                     v = png_ptr->gamma_to_1[palette[i].red];
--                     png_composite(w, v, png_ptr->trans_alpha[i], back_1.red);
--                     palette[i].red = png_ptr->gamma_from_1[w];
-+                        component = png_ptr->gamma_to_1[palette[i].red];
-+                        component =
-+                            (component * png_ptr->trans_alpha[i] + 128) / 255;
-+                        palette[i].red = png_ptr->gamma_from_1[component];
- 
--                     v = png_ptr->gamma_to_1[palette[i].green];
--                     png_composite(w, v, png_ptr->trans_alpha[i], back_1.green);
--                     palette[i].green = png_ptr->gamma_from_1[w];
-+                        component = png_ptr->gamma_to_1[palette[i].green];
-+                        component =
-+                            (component * png_ptr->trans_alpha[i] + 128) / 255;
-+                        palette[i].green = png_ptr->gamma_from_1[component];
- 
--                     v = png_ptr->gamma_to_1[palette[i].blue];
--                     png_composite(w, v, png_ptr->trans_alpha[i], back_1.blue);
--                     palette[i].blue = png_ptr->gamma_from_1[w];
-+                        component = png_ptr->gamma_to_1[palette[i].blue];
-+                        component =
-+                            (component * png_ptr->trans_alpha[i] + 128) / 255;
-+                        palette[i].blue = png_ptr->gamma_from_1[component];
-+                     }
-+                     else
-+                     {
-+                        /* Composite with background color:
-+                         * component =
-+                         *    alpha * component + (1 - alpha) * background
-+                         */
-+                        png_byte v, w;
-+
-+                        v = png_ptr->gamma_to_1[palette[i].red];
-+                        png_composite(w, v,
-+                            png_ptr->trans_alpha[i], back_1.red);
-+                        palette[i].red = png_ptr->gamma_from_1[w];
-+
-+                        v = png_ptr->gamma_to_1[palette[i].green];
-+                        png_composite(w, v,
-+                            png_ptr->trans_alpha[i], back_1.green);
-+                        palette[i].green = png_ptr->gamma_from_1[w];
-+
-+                        v = png_ptr->gamma_to_1[palette[i].blue];
-+                        png_composite(w, v,
-+                            png_ptr->trans_alpha[i], back_1.blue);
-+                        palette[i].blue = png_ptr->gamma_from_1[w];
-+                     }
-                   }
-                }
-                else
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-65018-01.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-65018-01.patch
deleted file mode 100644
index cdee6c7..0000000
--- a/meta/recipes-multimedia/libpng/files/CVE-2025-65018-01.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 16b5e3823918840aae65c0a6da57c78a5a496a4d Mon Sep 17 00:00:00 2001
-From: Cosmin Truta <ctruta@gmail.com>
-Date: Mon, 17 Nov 2025 20:38:47 +0200
-Subject: [PATCH] Fix a buffer overflow in `png_image_finish_read`
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Reject bit-depth mismatches between IHDR and the requested output
-format. When a 16-bit PNG is processed with an 8-bit output format
-request, `png_combine_row` writes using the IHDR depth before
-transformation, causing writes beyond the buffer allocated via
-`PNG_IMAGE_SIZE(image)`.
-
-The validation establishes a safe API contract where
-`PNG_IMAGE_SIZE(image)` is guaranteed to be sufficient across the
-transformation pipeline.
-
-Example overflow (32×32 pixels, 16-bit RGB to 8-bit RGBA):
-- Input format: 16 bits/channel × 3 channels = 6144 bytes
-- Output buffer: 8 bits/channel × 4 channels = 4096 bytes
-- Overflow: 6144 bytes - 4096 bytes = 2048 bytes
-
-Larger images produce proportionally larger overflows. For example,
-for 256×256 pixels, the overflow is 131072 bytes.
-
-Reported-by: yosiimich <yosiimich@users.noreply.github.com>
-
-CVE: CVE-2025-65018
-Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/16b5e3823918840aae65c0a6da57c78a5a496a4d]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- pngread.c | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/pngread.c b/pngread.c
-index 212afb7d2..92571ec33 100644
---- a/pngread.c
-+++ b/pngread.c
-@@ -4166,6 +4166,20 @@ png_image_finish_read(png_imagep image, png_const_colorp background,
-                   int result;
-                   png_image_read_control display;
- 
-+                  /* Reject bit depth mismatches to avoid buffer overflows. */
-+                  png_uint_32 ihdr_bit_depth =
-+                      image->opaque->png_ptr->bit_depth;
-+                  int requested_linear =
-+                      (image->format & PNG_FORMAT_FLAG_LINEAR) != 0;
-+                  if (ihdr_bit_depth == 16 && !requested_linear)
-+                     return png_image_error(image,
-+                         "png_image_finish_read: "
-+                         "16-bit PNG must use 16-bit output format");
-+                  if (ihdr_bit_depth < 16 && requested_linear)
-+                     return png_image_error(image,
-+                         "png_image_finish_read: "
-+                         "8-bit PNG must not use 16-bit output format");
-+
-                   memset(&display, 0, (sizeof display));
-                   display.image = image;
-                   display.buffer = buffer;
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-65018-02.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-65018-02.patch
deleted file mode 100644
index 891cd20..0000000
--- a/meta/recipes-multimedia/libpng/files/CVE-2025-65018-02.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-From 218612ddd6b17944e21eda56caf8b4bf7779d1ea Mon Sep 17 00:00:00 2001
-From: Cosmin Truta <ctruta@gmail.com>
-Date: Wed, 19 Nov 2025 21:45:13 +0200
-Subject: [PATCH] Rearchitect the fix to the buffer overflow in
- `png_image_finish_read`
-
-Undo the fix from commit 16b5e3823918840aae65c0a6da57c78a5a496a4d.
-That fix turned out to be unnecessarily limiting. It rejected all
-16-to-8 bit transformations, although the vulnerability only affects
-interlaced PNGs where `png_combine_row` writes using IHDR bit-depth
-before the transformation completes.
-
-The proper solution is to add an intermediate `local_row` buffer,
-specifically for the slow but necessary step of 16-to-8 bit conversion
-of interlaced images. (The processing of non-interlaced images remains
-intact, using the fast path.) We added the flag `do_local_scale` and
-the function `png_image_read_direct_scaled`, following the pattern that
-involves `do_local_compose`.
-
-In conclusion:
-- The 16-to-8 bit transformations of interlaced images are now safe,
-  as they use an intermediate buffer.
-- The 16-to-8 bit transformations of non-interlaced images remain safe,
-  as the fast path remains unchanged.
-- All our regression tests are now passing.
-
-CVE: CVE-2025-65018
-Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/218612ddd6b17944e21eda56caf8b4bf7779d1ea]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- pngread.c | 89 ++++++++++++++++++++++++++++++++++++++++++++++---------
- 1 file changed, 75 insertions(+), 14 deletions(-)
-
-diff --git a/pngread.c b/pngread.c
-index 92571ec33..79917daaa 100644
---- a/pngread.c
-+++ b/pngread.c
-@@ -3262,6 +3262,54 @@ png_image_read_colormapped(png_voidp argument)
-    }
- }
- 
-+/* Row reading for interlaced 16-to-8 bit depth conversion with local buffer. */
-+static int
-+png_image_read_direct_scaled(png_voidp argument)
-+{
-+   png_image_read_control *display = png_voidcast(png_image_read_control*,
-+       argument);
-+   png_imagep image = display->image;
-+   png_structrp png_ptr = image->opaque->png_ptr;
-+   png_bytep local_row = png_voidcast(png_bytep, display->local_row);
-+   png_bytep first_row = png_voidcast(png_bytep, display->first_row);
-+   ptrdiff_t row_bytes = display->row_bytes;
-+   int passes;
-+
-+   /* Handle interlacing. */
-+   switch (png_ptr->interlaced)
-+   {
-+      case PNG_INTERLACE_NONE:
-+         passes = 1;
-+         break;
-+
-+      case PNG_INTERLACE_ADAM7:
-+         passes = PNG_INTERLACE_ADAM7_PASSES;
-+         break;
-+
-+      default:
-+         png_error(png_ptr, "unknown interlace type");
-+   }
-+
-+   /* Read each pass using local_row as intermediate buffer. */
-+   while (--passes >= 0)
-+   {
-+      png_uint_32 y = image->height;
-+      png_bytep output_row = first_row;
-+
-+      for (; y > 0; --y)
-+      {
-+         /* Read into local_row (gets transformed 8-bit data). */
-+         png_read_row(png_ptr, local_row, NULL);
-+
-+         /* Copy from local_row to user buffer. */
-+         memcpy(output_row, local_row, (size_t)row_bytes);
-+         output_row += row_bytes;
-+      }
-+   }
-+
-+   return 1;
-+}
-+
- /* Just the row reading part of png_image_read. */
- static int
- png_image_read_composite(png_voidp argument)
-@@ -3680,6 +3728,7 @@ png_image_read_direct(png_voidp argument)
-    int linear = (format & PNG_FORMAT_FLAG_LINEAR) != 0;
-    int do_local_compose = 0;
-    int do_local_background = 0; /* to avoid double gamma correction bug */
-+   int do_local_scale = 0; /* for interlaced 16-to-8 bit conversion */
-    int passes = 0;
- 
-    /* Add transforms to ensure the correct output format is produced then check
-@@ -3806,8 +3855,16 @@ png_image_read_direct(png_voidp argument)
-             png_set_expand_16(png_ptr);
- 
-          else /* 8-bit output */
-+         {
-             png_set_scale_16(png_ptr);
- 
-+            /* For interlaced images, use local_row buffer to avoid overflow
-+             * in png_combine_row() which writes using IHDR bit-depth.
-+             */
-+            if (png_ptr->interlaced != 0)
-+               do_local_scale = 1;
-+         }
-+
-          change &= ~PNG_FORMAT_FLAG_LINEAR;
-       }
- 
-@@ -4083,6 +4140,24 @@ png_image_read_direct(png_voidp argument)
-       return result;
-    }
- 
-+   else if (do_local_scale != 0)
-+   {
-+      /* For interlaced 16-to-8 conversion, use an intermediate row buffer
-+       * to avoid buffer overflows in png_combine_row. The local_row is sized
-+       * for the transformed (8-bit) output, preventing the overflow that would
-+       * occur if png_combine_row wrote 16-bit data directly to the user buffer.
-+       */
-+      int result;
-+      png_voidp row = png_malloc(png_ptr, png_get_rowbytes(png_ptr, info_ptr));
-+
-+      display->local_row = row;
-+      result = png_safe_execute(image, png_image_read_direct_scaled, display);
-+      display->local_row = NULL;
-+      png_free(png_ptr, row);
-+
-+      return result;
-+   }
-+
-    else
-    {
-       png_alloc_size_t row_bytes = (png_alloc_size_t)display->row_bytes;
-@@ -4166,20 +4241,6 @@ png_image_finish_read(png_imagep image, png_const_colorp background,
-                   int result;
-                   png_image_read_control display;
- 
--                  /* Reject bit depth mismatches to avoid buffer overflows. */
--                  png_uint_32 ihdr_bit_depth =
--                      image->opaque->png_ptr->bit_depth;
--                  int requested_linear =
--                      (image->format & PNG_FORMAT_FLAG_LINEAR) != 0;
--                  if (ihdr_bit_depth == 16 && !requested_linear)
--                     return png_image_error(image,
--                         "png_image_finish_read: "
--                         "16-bit PNG must use 16-bit output format");
--                  if (ihdr_bit_depth < 16 && requested_linear)
--                     return png_image_error(image,
--                         "png_image_finish_read: "
--                         "8-bit PNG must not use 16-bit output format");
--
-                   memset(&display, 0, (sizeof display));
-                   display.image = image;
-                   display.buffer = buffer;
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-66293-01.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-66293-01.patch
deleted file mode 100644
index 0b958b9..0000000
--- a/meta/recipes-multimedia/libpng/files/CVE-2025-66293-01.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 788a624d7387a758ffd5c7ab010f1870dea753a1 Mon Sep 17 00:00:00 2001
-From: Cosmin Truta <ctruta@gmail.com>
-Date: Sat, 29 Nov 2025 00:39:16 +0200
-Subject: [PATCH] Fix an out-of-bounds read in `png_image_read_composite`
-
-Add a defensive bounds check before calling PNG_sRGB_FROM_LINEAR to
-prevent reading up to 506 entries (1012 bytes) past `png_sRGB_base[]`.
-
-For palette images with gamma, `png_init_read_transformations`
-clears PNG_COMPOSE after compositing on the palette, but it leaves
-PNG_FLAG_OPTIMIZE_ALPHA set. The simplified API then calls
-`png_image_read_composite` with sRGB data (not linear premultiplied),
-causing the index to reach 1017. (The maximum valid index is 511.)
-
-NOTE:
-This is a defensive fix that addresses the security issue (out-of-bounds
-read) but *NOT* the correctness issue (wrong output). When the clamp
-triggers, the affected pixels are clamped to white instead of the
-correct composited color. Valid PNG images may render incorrectly with
-the simplified API.
-
-TODO:
-We already know the root cause is a flag synchronization error.
-For palette images with gamma, `png_init_read_transformations`
-clears PNG_COMPOSE but leaves PNG_FLAG_OPTIMIZE_ALPHA set, causing
-`png_image_read_composite` to misinterpret sRGB data as linear
-premultiplied. However, we have yet to implement an architectural fix
-that requires coordinating the simplified API with the transformation
-pipeline.
-
-Reported-by: flyfish101 <flyfish101@users.noreply.github.com>
-
-CVE: CVE-2025-66293
-Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/788a624d7387a758ffd5c7ab010f1870dea753a1]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- pngread.c | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/pngread.c b/pngread.c
-index 79917daaa..ab62edd9d 100644
---- a/pngread.c
-+++ b/pngread.c
-@@ -3406,9 +3406,14 @@ png_image_read_composite(png_voidp argument)
-                         component += (255-alpha)*png_sRGB_table[outrow[c]];
- 
-                         /* So 'component' is scaled by 255*65535 and is
--                         * therefore appropriate for the sRGB to linear
--                         * conversion table.
-+                         * therefore appropriate for the sRGB-to-linear
-+                         * conversion table.  Clamp to the valid range
-+                         * as a defensive measure against an internal
-+                         * libpng bug where the data is sRGB rather than
-+                         * linear premultiplied.
-                          */
-+                        if (component > 255*65535)
-+                           component = 255*65535;
-                         component = PNG_sRGB_FROM_LINEAR(component);
-                      }
- 
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-66293-02.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-66293-02.patch
deleted file mode 100644
index ba563e1..0000000
--- a/meta/recipes-multimedia/libpng/files/CVE-2025-66293-02.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-From a05a48b756de63e3234ea6b3b938b8f5f862484a Mon Sep 17 00:00:00 2001
-From: Cosmin Truta <ctruta@gmail.com>
-Date: Mon, 1 Dec 2025 22:31:54 +0200
-Subject: [PATCH] Finalize the fix for out-of-bounds read in
- `png_image_read_composite`
-
-Following up on commit 788a624d7387a758ffd5c7ab010f1870dea753a1.
-
-The previous commit added a defensive bounds check to address the
-security issue (out-of-bounds read), but noted that the correctness
-issue remained: when the clamp triggered, the affected pixels were
-clamped to white instead of the correct composited color.
-
-This commit addresses the correctness issue by fixing the flag
-synchronization error identified in the previous commit's TODO:
-
-1. In `png_init_read_transformations`:
-   Clear PNG_FLAG_OPTIMIZE_ALPHA when clearing PNG_COMPOSE for palette
-   images. This correctly signals that the data is sRGB, not linear
-   premultiplied.
-
-2. In `png_image_read_composite`:
-   Check PNG_FLAG_OPTIMIZE_ALPHA and use the appropriate composition
-   formula. When set, use the existing linear composition. When cleared
-   (palette composition already done), use sRGB composition to match
-   what was done to the palette.
-
-Retain the previous clamp to the valid range as belt-and-suspenders
-protection against any other unforeseen cases.
-
-CVE: CVE-2025-66293
-Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/a05a48b756de63e3234ea6b3b938b8f5f862484a]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- pngread.c  | 56 ++++++++++++++++++++++++++++++++++++------------------
- pngrtran.c |  1 +
- 2 files changed, 39 insertions(+), 18 deletions(-)
-
-diff --git a/pngread.c b/pngread.c
-index ab62edd9d..f8ca2b7e3 100644
---- a/pngread.c
-+++ b/pngread.c
-@@ -3340,6 +3340,7 @@ png_image_read_composite(png_voidp argument)
-       ptrdiff_t    step_row = display->row_bytes;
-       unsigned int channels =
-           (image->format & PNG_FORMAT_FLAG_COLOR) != 0 ? 3 : 1;
-+      int optimize_alpha = (png_ptr->flags & PNG_FLAG_OPTIMIZE_ALPHA) != 0;
-       int pass;
- 
-       for (pass = 0; pass < passes; ++pass)
-@@ -3396,25 +3397,44 @@ png_image_read_composite(png_voidp argument)
- 
-                      if (alpha < 255) /* else just use component */
-                      {
--                        /* This is PNG_OPTIMIZED_ALPHA, the component value
--                         * is a linear 8-bit value.  Combine this with the
--                         * current outrow[c] value which is sRGB encoded.
--                         * Arithmetic here is 16-bits to preserve the output
--                         * values correctly.
--                         */
--                        component *= 257*255; /* =65535 */
--                        component += (255-alpha)*png_sRGB_table[outrow[c]];
-+                        if (optimize_alpha != 0)
-+                        {
-+                           /* This is PNG_OPTIMIZED_ALPHA, the component value
-+                            * is a linear 8-bit value.  Combine this with the
-+                            * current outrow[c] value which is sRGB encoded.
-+                            * Arithmetic here is 16-bits to preserve the output
-+                            * values correctly.
-+                            */
-+                           component *= 257*255; /* =65535 */
-+                           component += (255-alpha)*png_sRGB_table[outrow[c]];
- 
--                        /* So 'component' is scaled by 255*65535 and is
--                         * therefore appropriate for the sRGB-to-linear
--                         * conversion table.  Clamp to the valid range
--                         * as a defensive measure against an internal
--                         * libpng bug where the data is sRGB rather than
--                         * linear premultiplied.
--                         */
--                        if (component > 255*65535)
--                           component = 255*65535;
--                        component = PNG_sRGB_FROM_LINEAR(component);
-+                           /* Clamp to the valid range to defend against
-+                            * unforeseen cases where the data might be sRGB
-+                            * instead of linear premultiplied.
-+                            * (Belt-and-suspenders for GitHub Issue #764.)
-+                            */
-+                           if (component > 255*65535)
-+                              component = 255*65535;
-+
-+                           /* So 'component' is scaled by 255*65535 and is
-+                            * therefore appropriate for the sRGB-to-linear
-+                            * conversion table.
-+                            */
-+                           component = PNG_sRGB_FROM_LINEAR(component);
-+                        }
-+                        else
-+                        {
-+                           /* Compositing was already done on the palette
-+                            * entries.  The data is sRGB premultiplied on black.
-+                            * Composite with the background in sRGB space.
-+                            * This is not gamma-correct, but matches what was
-+                            * done to the palette.
-+                            */
-+                           png_uint_32 background = outrow[c];
-+                           component += ((255-alpha) * background + 127) / 255;
-+                           if (component > 255)
-+                              component = 255;
-+                        }
-                      }
- 
-                      outrow[c] = (png_byte)component;
-diff --git a/pngrtran.c b/pngrtran.c
-index 2f5202255..507d11381 100644
---- a/pngrtran.c
-+++ b/pngrtran.c
-@@ -1760,6 +1760,7 @@ png_init_read_transformations(png_structrp png_ptr)
-              * transformations elsewhere.
-              */
-             png_ptr->transformations &= ~(PNG_COMPOSE | PNG_GAMMA);
-+            png_ptr->flags &= ~PNG_FLAG_OPTIMIZE_ALPHA;
-          } /* color_type == PNG_COLOR_TYPE_PALETTE */
- 
-          /* if (png_ptr->background_gamma_type!=PNG_BACKGROUND_GAMMA_UNKNOWN) */
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch
deleted file mode 100644
index 6456b6c..0000000
--- a/meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From e4f7ad4ea2a471776c81dda4846b7691925d9786 Mon Sep 17 00:00:00 2001
-From: Cosmin Truta <ctruta@gmail.com>
-Date: Fri, 9 Jan 2026 20:51:53 +0200
-Subject: [PATCH] Fix a heap buffer over-read in `png_image_read_direct_scaled`
-
-Fix a regression from commit 218612ddd6b17944e21eda56caf8b4bf7779d1ea.
-
-The function `png_image_read_direct_scaled`, introduced by the fix for
-CVE-2025-65018, copies transformed row data from an intermediate buffer
-(`local_row`) to the user's output buffer. The copy incorrectly used
-`row_bytes` (the caller's stride) as the size parameter to memcpy, even
-though `local_row` is only `png_get_rowbytes()` bytes long.
-
-This causes a heap buffer over-read when:
-
-1. The caller provides a padded stride (e.g., for memory alignment):
-   memcpy reads past the end of `local_row` by `stride - row_width`
-   bytes.
-
-2. The caller provides a negative stride (for bottom-up layouts):
-   casting ptrdiff_t to size_t produces ~2^64, causing memcpy to
-   attempt reading exabytes, resulting in an immediate crash.
-
-The fix consists in using the size of the row buffer for the copy and
-using the stride for pointer advancement only.
-
-Reported-by: Petr Simecek <simecek@users.noreply.github.com>
-Analyzed-by: Stanislav Fort
-Analyzed-by: Pavel Kohout
-Co-authored-by: Petr Simecek <simecek@users.noreply.github.com>
-Signed-off-by: Cosmin Truta <ctruta@gmail.com>
-
-CVE: CVE-2026-22695
-Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/e4f7ad4ea2a471776c81dda4846b7691925d9786]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- AUTHORS   | 1 +
- pngread.c | 4 +++-
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/AUTHORS b/AUTHORS
-index 26b7bb50f..b9c0fffcf 100644
---- a/AUTHORS
-+++ b/AUTHORS
-@@ -23,6 +23,7 @@ Authors, for copyright and licensing purposes.
-  * Mike Klein
-  * Pascal Massimino
-  * Paul Schmidt
-+ * Petr Simecek
-  * Philippe Antoine
-  * Qiang Zhou
-  * Sam Bushell
-diff --git a/pngread.c b/pngread.c
-index e3426292b..9d86b01dc 100644
---- a/pngread.c
-+++ b/pngread.c
-@@ -3270,9 +3270,11 @@ png_image_read_direct_scaled(png_voidp argument)
-        argument);
-    png_imagep image = display->image;
-    png_structrp png_ptr = image->opaque->png_ptr;
-+   png_inforp info_ptr = image->opaque->info_ptr;
-    png_bytep local_row = png_voidcast(png_bytep, display->local_row);
-    png_bytep first_row = png_voidcast(png_bytep, display->first_row);
-    ptrdiff_t row_bytes = display->row_bytes;
-+   size_t copy_bytes = png_get_rowbytes(png_ptr, info_ptr);
-    int passes;
- 
-    /* Handle interlacing. */
-@@ -3302,7 +3304,7 @@ png_image_read_direct_scaled(png_voidp argument)
-          png_read_row(png_ptr, local_row, NULL);
- 
-          /* Copy from local_row to user buffer. */
--         memcpy(output_row, local_row, (size_t)row_bytes);
-+         memcpy(output_row, local_row, copy_bytes);
-          output_row += row_bytes;
-       }
-    }
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-22801.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-22801.patch
deleted file mode 100644
index 8a611ac..0000000
--- a/meta/recipes-multimedia/libpng/files/CVE-2026-22801.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-From cf155de014fc6c5cb199dd681dd5c8fb70429072 Mon Sep 17 00:00:00 2001
-From: Cosmin Truta <ctruta@gmail.com>
-Date: Sat, 10 Jan 2026 15:20:18 +0200
-Subject: [PATCH] fix: Remove incorrect truncation casts from
- `png_write_image_*`
-
-The type of the row stride (`display->row_bytes`) is ptrdiff_t. Casting
-to png_uint_16 before division will truncate large strides, causing
-incorrect pointer arithmetic for images exceeding 65535 bytes per row.
-For bottom-up images (negative stride), the truncation also corrupts
-the sign, advancing the row pointer forward instead of backward.
-
-Remove the erroneous casts and let the compiler handle the pointer
-arithmetic correctly. Also replace `sizeof (png_uint_16)` with 2.
-
-Add regression test via `pngstest --stride-extra N` where N > 32767
-triggers the affected code paths.
-
-A NOTE ABOUT HISTORY:
-The original code in libpng 1.5.6 (2011) had no such casts. They were
-introduced in libpng 1.6.26 (2016), likely to silence compiler warnings
-on 16-bit systems where the cast would be a no-op. On 32/64-bit systems
-the cast truncates the strides above 65535 and corrupts the negative
-strides.
-
-CVE: CVE-2026-22801
-Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/cf155de014fc6c5cb199dd681dd5c8fb70429072]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- CMakeLists.txt              |  9 ++++++++-
- contrib/libtests/pngstest.c | 29 ++++++++++++++++++++++++++++-
- pngwrite.c                  | 10 +++++-----
- tests/pngstest-large-stride |  8 ++++++++
- 4 files changed, 49 insertions(+), 7 deletions(-)
- create mode 100755 tests/pngstest-large-stride
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a8cd82402..a595ed91d 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,7 +1,7 @@
- 
- # CMakeLists.txt - CMake lists for libpng
- #
--# Copyright (c) 2018-2024 Cosmin Truta.
-+# Copyright (c) 2018-2026 Cosmin Truta
- # Copyright (c) 2007-2018 Glenn Randers-Pehrson.
- # Originally written by Christian Ehrlicher, 2007.
- #
-@@ -859,6 +859,13 @@ if(PNG_TESTS AND PNG_SHARED)
-     endforeach()
-   endforeach()
- 
-+  # Regression test:
-+  # Use stride_extra > 32767 to trigger row_bytes > 65535 for linear images.
-+  png_add_test(NAME pngstest-large-stride
-+               COMMAND pngstest
-+               OPTIONS --stride-extra 33000 --tmpfile "large-stride-" --log
-+               FILES "${CMAKE_CURRENT_SOURCE_DIR}/contrib/testpngs/rgb-alpha-16-linear.png")
-+
-   add_executable(pngunknown ${pngunknown_sources})
-   target_link_libraries(pngunknown PRIVATE png_shared)
- 
-diff --git a/contrib/libtests/pngstest.c b/contrib/libtests/pngstest.c
-index ff4c2b24a..2f29afee2 100644
---- a/contrib/libtests/pngstest.c
-+++ b/contrib/libtests/pngstest.c
-@@ -1,7 +1,7 @@
- 
- /* pngstest.c
-  *
-- * Copyright (c) 2021 Cosmin Truta
-+ * Copyright (c) 2021-2026 Cosmin Truta
-  * Copyright (c) 2013-2017 John Cunningham Bowler
-  *
-  * This code is released under the libpng license.
-@@ -3571,6 +3571,33 @@ main(int argc, char **argv)
-          opts |= NO_RESEED;
-       else if (strcmp(arg, "--fault-gbg-warning") == 0)
-          opts |= GBG_ERROR;
-+      else if (strcmp(arg, "--stride-extra") == 0)
-+      {
-+         if (c+1 < argc)
-+         {
-+            char *ep;
-+            unsigned long val = strtoul(argv[++c], &ep, 0);
-+
-+            if (ep > argv[c] && *ep == 0 && val <= 65535)
-+               stride_extra = (int)val;
-+
-+            else
-+            {
-+               fflush(stdout);
-+               fprintf(stderr, "%s: bad argument for --stride-extra: %s\n",
-+                  argv[0], argv[c]);
-+               exit(99);
-+            }
-+         }
-+
-+         else
-+         {
-+            fflush(stdout);
-+            fprintf(stderr, "%s: missing argument for --stride-extra\n",
-+               argv[0]);
-+            exit(99);
-+         }
-+      }
-       else if (strcmp(arg, "--tmpfile") == 0)
-       {
-          if (c+1 < argc)
-diff --git a/pngwrite.c b/pngwrite.c
-index 08066bcc4..a95b846c8 100644
---- a/pngwrite.c
-+++ b/pngwrite.c
-@@ -1,7 +1,7 @@
- 
- /* pngwrite.c - general routines to write a PNG file
-  *
-- * Copyright (c) 2018-2024 Cosmin Truta
-+ * Copyright (c) 2018-2026 Cosmin Truta
-  * Copyright (c) 1998-2002,2004,2006-2018 Glenn Randers-Pehrson
-  * Copyright (c) 1996-1997 Andreas Dilger
-  * Copyright (c) 1995-1996 Guy Eric Schalnat, Group 42, Inc.
-@@ -1645,7 +1645,7 @@ png_write_image_16bit(png_voidp argument)
-       }
- 
-       png_write_row(png_ptr, png_voidcast(png_const_bytep, display->local_row));
--      input_row += (png_uint_16)display->row_bytes/(sizeof (png_uint_16));
-+      input_row += display->row_bytes / 2;
-    }
- 
-    return 1;
-@@ -1771,7 +1771,7 @@ png_write_image_8bit(png_voidp argument)
- 
-          png_write_row(png_ptr, png_voidcast(png_const_bytep,
-              display->local_row));
--         input_row += (png_uint_16)display->row_bytes/(sizeof (png_uint_16));
-+         input_row += display->row_bytes / 2;
-       } /* while y */
-    }
- 
-@@ -1796,7 +1796,7 @@ png_write_image_8bit(png_voidp argument)
-          }
- 
-          png_write_row(png_ptr, output_row);
--         input_row += (png_uint_16)display->row_bytes/(sizeof (png_uint_16));
-+         input_row += display->row_bytes / 2;
-       }
-    }
- 
-@@ -2115,7 +2115,7 @@ png_image_write_main(png_voidp argument)
-       ptrdiff_t row_bytes = display->row_stride;
- 
-       if (linear != 0)
--         row_bytes *= (sizeof (png_uint_16));
-+         row_bytes *= 2;
- 
-       if (row_bytes < 0)
-          row += (image->height-1) * (-row_bytes);
-diff --git a/tests/pngstest-large-stride b/tests/pngstest-large-stride
-new file mode 100755
-index 000000000..7958c5b42
---- /dev/null
-+++ b/tests/pngstest-large-stride
-@@ -0,0 +1,8 @@
-+#!/bin/sh
-+
-+# Regression test:
-+# Use stride_extra > 32767 to trigger row_bytes > 65535 for linear images.
-+exec ./pngstest \
-+     --stride-extra 33000 \
-+     --tmpfile "large-stride-" \
-+     --log "${srcdir}/contrib/testpngs/rgb-alpha-16-linear.png"
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-25646.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-25646.patch
deleted file mode 100644
index 5fbf5eb..0000000
--- a/meta/recipes-multimedia/libpng/files/CVE-2026-25646.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 01d03b8453eb30ade759cd45c707e5a1c7277d88 Mon Sep 17 00:00:00 2001
-From: Cosmin Truta <ctruta@gmail.com>
-Date: Fri, 6 Feb 2026 19:11:54 +0200
-Subject: [PATCH] Fix a heap buffer overflow in `png_set_quantize`
-
-The color distance hash table stored the current palette indices, but
-the color-pruning loop assumed the original indices. When colors were
-eliminated and indices changed, the stored indices became stale. This
-caused the loop bound `max_d` to grow past the 769-element hash array.
-
-The fix consists in storing the original indices via `palette_to_index`
-to match the pruning loop's expectations.
-
-Reported-by: Joshua Inscoe <pwnalone@users.noreply.github.com>
-Co-authored-by: Joshua Inscoe <pwnalone@users.noreply.github.com>
-Signed-off-by: Cosmin Truta <ctruta@gmail.com>
-
-CVE: CVE-2026-25646
-Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/01d03b8453eb30ade759cd45c707e5a1c7277d88]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- AUTHORS    | 1 +
- pngrtran.c | 6 +++---
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/AUTHORS b/AUTHORS
-index b9c0fffcf..4094f4a57 100644
---- a/AUTHORS
-+++ b/AUTHORS
-@@ -15,6 +15,7 @@ Authors, for copyright and licensing purposes.
-  * Guy Eric Schalnat
-  * James Yu
-  * John Bowler
-+ * Joshua Inscoe
-  * Kevin Bracey
-  * Magnus Holmgren
-  * Mandar Sahastrabuddhe
-diff --git a/pngrtran.c b/pngrtran.c
-index fe8f9d32c..1fce9af12 100644
---- a/pngrtran.c
-+++ b/pngrtran.c
-@@ -1,7 +1,7 @@
- 
- /* pngrtran.c - transforms the data in a row for PNG readers
-  *
-- * Copyright (c) 2018-2024 Cosmin Truta
-+ * Copyright (c) 2018-2026 Cosmin Truta
-  * Copyright (c) 1998-2002,2004,2006-2018 Glenn Randers-Pehrson
-  * Copyright (c) 1996-1997 Andreas Dilger
-  * Copyright (c) 1995-1996 Guy Eric Schalnat, Group 42, Inc.
-@@ -647,8 +647,8 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
-                          break;
- 
-                      t->next = hash[d];
--                     t->left = (png_byte)i;
--                     t->right = (png_byte)j;
-+                     t->left = png_ptr->palette_to_index[i];
-+                     t->right = png_ptr->palette_to_index[j];
-                      hash[d] = t;
-                   }
-                }
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-33416-01.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-33416-01.patch
deleted file mode 100644
index a60a8d6..0000000
--- a/meta/recipes-multimedia/libpng/files/CVE-2026-33416-01.patch
+++ /dev/null
@@ -1,143 +0,0 @@
-From 23019269764e35ed8458e517f1897bd3c54820eb Mon Sep 17 00:00:00 2001
-From: Oblivionsage <cookieandcream560@gmail.com>
-Date: Sun, 15 Mar 2026 10:35:29 +0100
-Subject: [PATCH] fix: Resolve use-after-free on `png_ptr->trans_alpha`
-
-The function `png_set_tRNS` sets `png_ptr->trans_alpha` to point at
-`info_ptr->trans_alpha` directly, so both structs share the same heap
-buffer. If the application calls `png_free_data(PNG_FREE_TRNS)`, or if
-`png_set_tRNS` is called a second time, the buffer is freed through
-`info_ptr` while `png_ptr` still holds a dangling reference. Any
-subsequent row read that hits the function `png_do_expand_palette` will
-dereference freed memory.
-
-The fix gives `png_struct` its own allocation instead of aliasing the
-`info_ptr` pointer. This was already flagged with a TODO in
-`png_handle_tRNS` ("horrible side effect ... Fix this.") but it was
-never addressed.
-
-Verified with AddressSanitizer. All 34 existing tests pass without
-regressions.
-
-CVE: CVE-2026-33416
-Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/23019269764e35ed8458e517f1897bd3c54820eb]
-Comment: Refreshed hunk to match latest scarthgap
-
-Reviewed-by: Cosmin Truta <ctruta@gmail.com>
-Signed-off-by: Cosmin Truta <ctruta@gmail.com>
-Signed-off-by: Sourav Kumar Pramanik <Souravkumar.Pramanik@bmwtechworks.in>
-Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
----
- pngread.c  | 11 +++++------
- pngrutil.c |  4 ----
- pngset.c   | 31 +++++++++++++++++++------------
- pngwrite.c |  6 ++++++
- 4 files changed, 30 insertions(+), 22 deletions(-)
-
-diff --git a/pngread.c b/pngread.c
-index 01b731d8eb..0086edf6cf 100644
---- a/pngread.c
-+++ b/pngread.c
-@@ -968,12 +968,11 @@ png_read_destroy(png_structrp png_ptr)
- 
- #if defined(PNG_tRNS_SUPPORTED) || \
-     defined(PNG_READ_EXPAND_SUPPORTED) || defined(PNG_READ_BACKGROUND_SUPPORTED)
--   if ((png_ptr->free_me & PNG_FREE_TRNS) != 0)
--   {
--      png_free(png_ptr, png_ptr->trans_alpha);
--      png_ptr->trans_alpha = NULL;
--   }
--   png_ptr->free_me &= ~PNG_FREE_TRNS;
-+   /* png_ptr->trans_alpha is always independently allocated (not aliased
-+    * with info_ptr->trans_alpha), so free it unconditionally.
-+    */
-+   png_free(png_ptr, png_ptr->trans_alpha);
-+   png_ptr->trans_alpha = NULL;
- #endif
- 
-    inflateEnd(&png_ptr->zstream);
-diff --git a/pngrutil.c b/pngrutil.c
-index 366379b991..a19507bf1b 100644
---- a/pngrutil.c
-+++ b/pngrutil.c
-@@ -1905,10 +1905,6 @@ png_handle_tRNS(png_structrp png_ptr, pn
-       return;
-    }
- 
--   /* TODO: this is a horrible side effect in the palette case because the
--    * png_struct ends up with a pointer to the tRNS buffer owned by the
--    * png_info.  Fix this.
--    */
-    png_set_tRNS(png_ptr, info_ptr, readbuf, png_ptr->num_trans,
-        &(png_ptr->trans_color));
- }
-diff --git a/pngset.c b/pngset.c
-index 4b78b8960c..47883684e4 100644
---- a/pngset.c
-+++ b/pngset.c
-@@ -990,28 +990,36 @@ png_set_tRNS(png_structrp png_ptr, png_i
- 
-    if (trans_alpha != NULL)
-    {
--       /* It may not actually be necessary to set png_ptr->trans_alpha here;
--        * we do it for backward compatibility with the way the png_handle_tRNS
--        * function used to do the allocation.
--        *
--        * 1.6.0: The above statement is incorrect; png_handle_tRNS effectively
--        * relies on png_set_tRNS storing the information in png_struct
--        * (otherwise it won't be there for the code in pngrtran.c).
--        */
--
-        png_free_data(png_ptr, info_ptr, PNG_FREE_TRNS, 0);
- 
-        if (num_trans > 0 && num_trans <= PNG_MAX_PALETTE_LENGTH)
-        {
--         /* Changed from num_trans to PNG_MAX_PALETTE_LENGTH in version 1.2.1 */
-+          /* Allocate info_ptr's copy of the transparency data. */
-           info_ptr->trans_alpha = png_voidcast(png_bytep,
-               png_malloc(png_ptr, PNG_MAX_PALETTE_LENGTH));
-           memcpy(info_ptr->trans_alpha, trans_alpha, (size_t)num_trans);
--
-           info_ptr->free_me |= PNG_FREE_TRNS;
-           info_ptr->valid |= PNG_INFO_tRNS;
-+
-+
-+          /* Allocate an independent copy for png_struct, so that the
-+           * lifetime of png_ptr->trans_alpha is decoupled from the
-+           * lifetime of info_ptr->trans_alpha.  Previously these two
-+           * pointers were aliased, which caused a use-after-free if
-+           * png_free_data freed info_ptr->trans_alpha while
-+           * png_ptr->trans_alpha was still in use by the row transform
-+           * functions (e.g. png_do_expand_palette).
-+           */
-+          png_free(png_ptr, png_ptr->trans_alpha);
-+          png_ptr->trans_alpha = png_voidcast(png_bytep,
-+              png_malloc(png_ptr, PNG_MAX_PALETTE_LENGTH));
-+          memcpy(png_ptr->trans_alpha, trans_alpha, (size_t)num_trans);
-+       }
-+       else
-+       {
-+          png_free(png_ptr, png_ptr->trans_alpha);
-+          png_ptr->trans_alpha = NULL;
-        }
--       png_ptr->trans_alpha = info_ptr->trans_alpha;
-    }
- 
-    if (trans_color != NULL)
-diff --git a/pngwrite.c b/pngwrite.c
-index 5fc77d91f7..84af1e73fb 100644
---- a/pngwrite.c
-+++ b/pngwrite.c
-@@ -977,6 +977,12 @@ png_write_destroy(png_structrp png_ptr)
-    png_ptr->chunk_list = NULL;
- #endif
- 
-+#if defined(PNG_tRNS_SUPPORTED)
-+   /* Free the independent copy of trans_alpha owned by png_struct. */
-+   png_free(png_ptr, png_ptr->trans_alpha);
-+   png_ptr->trans_alpha = NULL;
-+#endif
-+
-    /* The error handling and memory handling information is left intact at this
-     * point: the jmp_buf may still have to be freed.  See png_destroy_png_struct
-     * for how this happens.
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-33416-02.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-33416-02.patch
deleted file mode 100644
index e746293..0000000
--- a/meta/recipes-multimedia/libpng/files/CVE-2026-33416-02.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From a3a21443ed12bfa1ef46fa0d4fb2b74a0fa34a25 Mon Sep 17 00:00:00 2001
-From: Oblivionsage <cookieandcream560@gmail.com>
-Date: Tue, 17 Mar 2026 08:55:18 +0100
-Subject: [PATCH] fix: Initialize tail bytes in `trans_alpha` buffers
-
-Although the arrays `info_ptr->trans_alpha` and `png_ptr->trans_alpha`
-are allocated 256 bytes, only `num_trans` bytes are copied.
-The remaining entries were left uninitialized. Set them to 0xff (fully
-opaque) before copying, which matches the conventional treatment of
-entries beyond `num_trans`.
-
-This is a follow-up to the previous use-after-free fix.
-
-CVE: CVE-2026-33416
-Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/a3a21443ed12bfa1ef46fa0d4fb2b74a0fa34a25]
-Comment: Refreshed hunk to match latest scarthgap
-
-Reported-by: Cosmin Truta <ctruta@gmail.com>
-Reviewed-by: Cosmin Truta <ctruta@gmail.com>
-Signed-off-by: Cosmin Truta <ctruta@gmail.com>
-Signed-off-by: Sourav Kumar Pramanik <Souravkumar.Pramanik@bmwtechworks.in>
-Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
----
- pngset.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/pngset.c b/pngset.c
-index 47883684e4..dccc6498d7 100644
---- a/pngset.c
-+++ b/pngset.c
-@@ -994,9 +994,13 @@ png_set_tRNS(png_structrp png_ptr, png_i
- 
-        if (num_trans > 0 && num_trans <= PNG_MAX_PALETTE_LENGTH)
-        {
--          /* Allocate info_ptr's copy of the transparency data. */
-+	       /* Allocate info_ptr's copy of the transparency data.
-+           * Initialize all entries to fully opaque (0xff), then overwrite
-+           * the first num_trans entries with the actual values.
-+           */
-           info_ptr->trans_alpha = png_voidcast(png_bytep,
-               png_malloc(png_ptr, PNG_MAX_PALETTE_LENGTH));
-+	       memset(info_ptr->trans_alpha, 0xff, PNG_MAX_PALETTE_LENGTH);
-           memcpy(info_ptr->trans_alpha, trans_alpha, (size_t)num_trans);
-           info_ptr->free_me |= PNG_FREE_TRNS;
-           info_ptr->valid |= PNG_INFO_tRNS;
-@@ -1013,6 +1017,7 @@ png_set_tRNS(png_structrp png_ptr, png_i
-           png_free(png_ptr, png_ptr->trans_alpha);
-           png_ptr->trans_alpha = png_voidcast(png_bytep,
-               png_malloc(png_ptr, PNG_MAX_PALETTE_LENGTH));
-+	       memset(png_ptr->trans_alpha, 0xff, PNG_MAX_PALETTE_LENGTH);
-           memcpy(png_ptr->trans_alpha, trans_alpha, (size_t)num_trans);
-        }
-        else
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-33416-03.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-33416-03.patch
deleted file mode 100644
index 21ce35d..0000000
--- a/meta/recipes-multimedia/libpng/files/CVE-2026-33416-03.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-From 7ea9eea884a2328cc7fdcb3c0c00246a50d90667 Mon Sep 17 00:00:00 2001
-From: Cosmin Truta <ctruta@gmail.com>
-Date: Fri, 20 Mar 2026 17:37:22 +0200
-Subject: [PATCH] fix: Resolve use-after-free on `png_ptr->palette`
-
-Give `png_struct` its own independently-allocated copy of the palette
-buffer, decoupling it from `info_struct`'s palette. Allocate both
-copies with `png_calloc` to zero-fill, because the ARM NEON palette
-riffle reads all 256 entries unconditionally.
-
-In function `png_set_PLTE`, `png_ptr->palette` was aliased directly to
-`info_ptr->palette`: a single heap buffer shared across two structs
-with independent lifetimes. If the buffer was freed through `info_ptr`
-(via `png_free_data(PNG_FREE_PLTE)` or a second call to `png_set_PLTE`),
-`png_ptr->palette` became a dangling pointer. Subsequent row reads,
-performed in `png_do_expand_palette` and in other transform functions,
-dereferenced (and in the bit-shift path, wrote to) freed memory.
-
-Also fix `png_set_quantize` to allocate an owned copy of the caller's
-palette rather than aliasing the user pointer, so that the unconditional
-free in `png_read_destroy` does not free unmanaged memory.
-
-CVE: CVE-2026-33416
-Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/7ea9eea884a2328cc7fdcb3c0c00246a50d90667]
-Comment: Refreshed hunk to match latest scarthgap
-
-Signed-off-by: Sourav Kumar Pramanik <Souravkumar.Pramanik@bmwtechworks.in>
-Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
----
- pngread.c  | 11 +++++------
- pngrtran.c |  8 +++++++-
- pngrutil.c | 13 -------------
- pngset.c   | 28 +++++++++++++++++++---------
- pngwrite.c |  4 ++++
- 5 files changed, 35 insertions(+), 29 deletions(-)
-
-diff --git a/pngread.c b/pngread.c
-index 0086edf6cf..e1d38d578a 100644
---- a/pngread.c
-+++ b/pngread.c
-@@ -959,12 +959,11 @@ png_read_destroy(png_structrp png_ptr)
-    png_ptr->quantize_index = NULL;
- #endif
- 
--   if ((png_ptr->free_me & PNG_FREE_PLTE) != 0)
--   {
--      png_zfree(png_ptr, png_ptr->palette);
--      png_ptr->palette = NULL;
--   }
--   png_ptr->free_me &= ~PNG_FREE_PLTE;
-+   /* png_ptr->palette is always independently allocated (not aliased
-+    * with info_ptr->palette), so free it unconditionally.
-+    */
-+   png_free(png_ptr, png_ptr->palette);
-+   png_ptr->palette = NULL;
- 
- #if defined(PNG_tRNS_SUPPORTED) || \
-     defined(PNG_READ_EXPAND_SUPPORTED) || defined(PNG_READ_BACKGROUND_SUPPORTED)
-diff --git a/pngrtran.c b/pngrtran.c
-index bfb7d423b7..fd736ab672 100644
---- a/pngrtran.c
-+++ b/pngrtran.c
-@@ -750,7 +750,13 @@ png_set_quantize(png_structrp png_ptr, p
-    }
-    if (png_ptr->palette == NULL)
-    {
--      png_ptr->palette = palette;
-+      /* Allocate an owned copy rather than aliasing the caller's pointer,
-+       * so that png_read_destroy can free png_ptr->palette unconditionally.
-+       */
-+      png_ptr->palette = png_voidcast(png_colorp, png_calloc(png_ptr,
-+          PNG_MAX_PALETTE_LENGTH * (sizeof (png_color))));
-+      memcpy(png_ptr->palette, palette, (unsigned int)num_palette *
-+          (sizeof (png_color)));
-    }
-    png_ptr->num_palette = (png_uint_16)num_palette;
-
-diff --git a/pngrutil.c b/pngrutil.c
-index a19507bf1b..3a35fe9de2 100644
---- a/pngrutil.c
-+++ b/pngrutil.c
-@@ -1047,14 +1047,6 @@ png_handle_PLTE(png_structrp png_ptr, pn
-    }
- #endif
- 
--   /* TODO: png_set_PLTE has the side effect of setting png_ptr->palette to its
--    * own copy of the palette.  This has the side effect that when png_start_row
--    * is called (this happens after any call to png_read_update_info) the
--    * info_ptr palette gets changed.  This is extremely unexpected and
--    * confusing.
--    *
--    * Fix this by not sharing the palette in this way.
--    */
-    png_set_PLTE(png_ptr, info_ptr, palette, num);
- 
-    /* The three chunks, bKGD, hIST and tRNS *must* appear after PLTE and before
-diff --git a/pngset.c b/pngset.c
-index dccc6498d7..b9ccb7fb15 100644
---- a/pngset.c
-+++ b/pngset.c
-@@ -595,28 +595,38 @@ png_set_PLTE(png_structrp png_ptr, png_i
-       png_error(png_ptr, "Invalid palette");
-    }
- 
--   /* It may not actually be necessary to set png_ptr->palette here;
--    * we do it for backward compatibility with the way the png_handle_tRNS
--    * function used to do the allocation.
--    *
--    * 1.6.0: the above statement appears to be incorrect; something has to set
--    * the palette inside png_struct on read.
--    */
-    png_free_data(png_ptr, info_ptr, PNG_FREE_PLTE, 0);
- 
-    /* Changed in libpng-1.2.1 to allocate PNG_MAX_PALETTE_LENGTH instead
-     * of num_palette entries, in case of an invalid PNG file or incorrect
-     * call to png_set_PLTE() with too-large sample values.
-+    *
-+    * Allocate independent buffers for info_ptr and png_ptr so that the
-+    * lifetime of png_ptr->palette is decoupled from the lifetime of
-+    * info_ptr->palette.  Previously, these two pointers were aliased,
-+    * which caused a use-after-free vulnerability if png_free_data freed
-+    * info_ptr->palette while png_ptr->palette was still in use by the
-+    * row transform functions (e.g. png_do_expand_palette).
-+    *
-+    * Both buffers are allocated with png_calloc to zero-fill, because
-+    * the ARM NEON palette riffle reads all 256 entries unconditionally,
-+    * regardless of num_palette.
-     */
-+   png_free(png_ptr, png_ptr->palette);
-    png_ptr->palette = png_voidcast(png_colorp, png_calloc(png_ptr,
-        PNG_MAX_PALETTE_LENGTH * (sizeof (png_color))));
-+   info_ptr->palette = png_voidcast(png_colorp, png_calloc(png_ptr,
-+       PNG_MAX_PALETTE_LENGTH * (sizeof (png_color))));
-+   png_ptr->num_palette = info_ptr->num_palette = (png_uint_16)num_palette;
- 
-    if (num_palette > 0)
-+      {
-+      memcpy(info_ptr->palette, palette, (unsigned int)num_palette *
-+          (sizeof (png_color)));
-       memcpy(png_ptr->palette, palette, (unsigned int)num_palette *
-           (sizeof (png_color)));
-+      }
- 
--   info_ptr->palette = png_ptr->palette;
--   info_ptr->num_palette = png_ptr->num_palette = (png_uint_16)num_palette;
-    info_ptr->free_me |= PNG_FREE_PLTE;
-    info_ptr->valid |= PNG_INFO_PLTE;
- }
-diff --git a/pngwrite.c b/pngwrite.c
-index 84af1e73fb..348763e940 100644
---- a/pngwrite.c
-+++ b/pngwrite.c
-@@ -982,6 +982,10 @@ png_write_destroy(png_structrp png_ptr)
-    png_free(png_ptr, png_ptr->trans_alpha);
-    png_ptr->trans_alpha = NULL;
- #endif
-+   
-+   /* Free the independent copy of the palette owned by png_struct. */
-+   png_free(png_ptr, png_ptr->palette);
-+   png_ptr->palette = NULL;
- 
-    /* The error handling and memory handling information is left intact at this
-     * point: the jmp_buf may still have to be freed.  See png_destroy_png_struct
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-33416-04.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-33416-04.patch
deleted file mode 100644
index ff7db53..0000000
--- a/meta/recipes-multimedia/libpng/files/CVE-2026-33416-04.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From c1b0318b393c90679e6fa5bc1d329fd5d5012ec1 Mon Sep 17 00:00:00 2001
-From: Cosmin Truta <ctruta@gmail.com>
-Date: Fri, 20 Mar 2026 21:25:12 +0200
-Subject: [PATCH] fix: Sync `info_ptr->palette` after in-place transforms
-
-Copy `png_ptr->palette` into `info_ptr->palette` upon entering
-the function that runs immediately after the in-place transforms.
-
-The palette decoupling in the previous commit gave `png_struct`
-and `png_info` independently-allocated palette buffers, fixing a
-use-after-free vulnerability. However, `png_init_read_transformations`
-modifies `png_ptr->palette` in place (e.g. for gamma correction or
-background compositing), and the old aliasing made those modifications
-visible through `png_get_PLTE`. With independent buffers,
-`info_ptr->palette` retained the original values, causing our tests to
-fail on indexed-colour background compositing.
-
-CVE: CVE-2026-33416
-Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/c1b0318b393c90679e6fa5bc1d329fd5d5012ec1]
-Comment: Refreshed hunk to match latest scarthgap
-
-Signed-off-by: Sourav Kumar Pramanik <Souravkumar.Pramanik@bmwtechworks.in>
-Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
----
- pngrtran.c | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/pngrtran.c b/pngrtran.c
-index fd736ab672..978dac5888 100644
---- a/pngrtran.c
-+++ b/pngrtran.c
-@@ -1984,6 +1984,21 @@ png_read_transform_info(png_structrp png
- {
-    png_debug(1, "in png_read_transform_info");
- 
-+   if (png_ptr->transformations != 0)
-+   {
-+      if (info_ptr->color_type == PNG_COLOR_TYPE_PALETTE &&
-+          info_ptr->palette != NULL && png_ptr->palette != NULL)
-+      {
-+         /* Sync info_ptr->palette with png_ptr->palette.
-+          * The function png_init_read_transformations may have modified
-+          * png_ptr->palette in place (e.g. for gamma correction or for
-+          * background compositing).
-+          */
-+         memcpy(info_ptr->palette, png_ptr->palette,
-+             PNG_MAX_PALETTE_LENGTH * (sizeof (png_color)));
-+      }
-+   }
-+
- #ifdef PNG_READ_EXPAND_SUPPORTED
-    if ((png_ptr->transformations & PNG_EXPAND) != 0)
-    {
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-33636.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-33636.patch
deleted file mode 100644
index 3bd6aae..0000000
--- a/meta/recipes-multimedia/libpng/files/CVE-2026-33636.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 9ff847dfcbb54f6dee3fd4e408150ae944278391 Mon Sep 17 00:00:00 2001
-From: Cosmin Truta <ctruta@gmail.com>
-Date: Sat, 21 Mar 2026 23:48:49 +0200
-Subject: [PATCH] fix(arm): Resolve out-of-bounds read/write in NEON palette
- expansion
-
-Both `png_do_expand_palette_rgba8_neon` and
-`png_do_expand_palette_rgb8_neon` advanced in fixed-size chunks without
-guarding the final iteration, allowing out-of-bounds reads and writes
-when the row width is not a multiple of the chunk size.
-
-Restrict the NEON loop to full chunks only, remove the now-unnecessary
-post-loop adjustment, and undo the `*ddp` pre-adjustment before the
-pointer handoff to the scalar fallback.
-
-CVE: CVE-2026-33636
-Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/aba9f18eba870d14fb52c5ba5d73451349e339c3]
-
-Reported-by: Amemoyoi <Amemoyoi@users.noreply.github.com>
-Co-authored-by: Amemoyoi <Amemoyoi@users.noreply.github.com>
-Signed-off-by: Cosmin Truta <ctruta@gmail.com>
-(cherry picked from commit aba9f18eba870d14fb52c5ba5d73451349e339c3)
-Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
----
- arm/palette_neon_intrinsics.c | 29 +++++++++++++----------------
- 1 file changed, 13 insertions(+), 16 deletions(-)
-
-diff --git a/arm/palette_neon_intrinsics.c b/arm/palette_neon_intrinsics.c
-index 92c7d6f9f..bdd15849d 100644
---- a/arm/palette_neon_intrinsics.c
-+++ b/arm/palette_neon_intrinsics.c
-@@ -1,7 +1,7 @@
- 
- /* palette_neon_intrinsics.c - NEON optimised palette expansion functions
-  *
-- * Copyright (c) 2018-2019 Cosmin Truta
-+ * Copyright (c) 2018-2026 Cosmin Truta
-  * Copyright (c) 2017-2018 Arm Holdings. All rights reserved.
-  * Written by Richard Townsend <Richard.Townsend@arm.com>, February 2017.
-  *
-@@ -80,7 +80,7 @@ png_do_expand_palette_rgba8_neon(png_structrp png_ptr, png_row_infop row_info,
-     */
-    *ddp = *ddp - ((pixels_per_chunk * sizeof(png_uint_32)) - 1);
- 
--   for (i = 0; i < row_width; i += pixels_per_chunk)
-+   for (i = 0; i + pixels_per_chunk <= row_width; i += pixels_per_chunk)
-    {
-       uint32x4_t cur;
-       png_bytep sp = *ssp - i, dp = *ddp - (i << 2);
-@@ -90,13 +90,12 @@ png_do_expand_palette_rgba8_neon(png_structrp png_ptr, png_row_infop row_info,
-       cur = vld1q_lane_u32(riffled_palette + *(sp - 0), cur, 3);
-       vst1q_u32((void *)dp, cur);
-    }
--   if (i != row_width)
--   {
--      /* Remove the amount that wasn't processed. */
--      i -= pixels_per_chunk;
--   }
- 
--   /* Decrement output pointers. */
-+   /* Undo the pre-adjustment of *ddp before the pointer handoff,
-+    * so the scalar fallback in pngrtran.c receives a dp that points
-+    * to the correct position.
-+    */
-+   *ddp = *ddp + (pixels_per_chunk * 4 - 1);
-    *ssp = *ssp - i;
-    *ddp = *ddp - (i << 2);
-    return i;
-@@ -121,7 +120,7 @@ png_do_expand_palette_rgb8_neon(png_structrp png_ptr, png_row_infop row_info,
-    /* Seeking this back by 8 pixels x 3 bytes. */
-    *ddp = *ddp - ((pixels_per_chunk * sizeof(png_color)) - 1);
- 
--   for (i = 0; i < row_width; i += pixels_per_chunk)
-+   for (i = 0; i + pixels_per_chunk <= row_width; i += pixels_per_chunk)
-    {
-       uint8x8x3_t cur;
-       png_bytep sp = *ssp - i, dp = *ddp - ((i << 1) + i);
-@@ -136,13 +135,11 @@ png_do_expand_palette_rgb8_neon(png_structrp png_ptr, png_row_infop row_info,
-       vst3_u8((void *)dp, cur);
-    }
- 
--   if (i != row_width)
--   {
--      /* Remove the amount that wasn't processed. */
--      i -= pixels_per_chunk;
--   }
--
--   /* Decrement output pointers. */
-+   /* Undo the pre-adjustment of *ddp before the pointer handoff,
-+    * so the scalar fallback in pngrtran.c receives a dp that points
-+    * to the correct position.
-+    */
-+   *ddp = *ddp + (pixels_per_chunk * 3 - 1);
-    *ssp = *ssp - i;
-    *ddp = *ddp - ((i << 1) + i);
-    return i;
--- 
-2.44.4
-
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
similarity index 77%
rename from meta/recipes-multimedia/libpng/libpng_1.6.42.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.58.bb
index e4cc636..9e6a991 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
@@ -5,33 +5,16 @@ library for use in applications that read, create, and manipulate PNG \
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0fdbfbe10fc294a6fca24dc76134222a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9dc350edbbbee660c7d9af79487168f2"
 DEPENDS = "zlib"
 
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz \
            file://run-ptest \
-           file://CVE-2025-64505-01.patch \
-           file://CVE-2025-64505-02.patch \
-           file://CVE-2025-64505-03.patch \
-           file://CVE-2025-64506.patch \
-           file://CVE-2025-64720.patch \
-           file://CVE-2025-65018-01.patch \
-           file://CVE-2025-65018-02.patch \
-           file://CVE-2025-66293-01.patch \
-           file://CVE-2025-66293-02.patch \
-           file://CVE-2026-22695.patch \
-           file://CVE-2026-22801.patch \
-           file://CVE-2026-25646.patch \
-           file://CVE-2026-33636.patch \
-           file://CVE-2026-33416-01.patch \
-           file://CVE-2026-33416-02.patch \
-           file://CVE-2026-33416-03.patch \
-           file://CVE-2026-33416-04.patch \
 "
 
-SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"
+SRC_URI[sha256sum] = "28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.55.0


