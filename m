Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D0FD1267F
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 22:19:52 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.939.1764713990387438467
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 14:19:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GfWmMw82;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29586626fbeso74376615ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 14:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764713990; x=1765318790; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CK7k5eSjuQ0pk1rxz/k0Lw8gpXsUg7rYtQOJH4OllQ=;
        b=GfWmMw82nDQjy4ERfaVD6oeXzROeA9EFlrayR+oLI+S224oNz9lBNNl9JwjC4wSe0w
         LbMOcgLefWYdKV7tF20GxK8WGyWWJl/RRErIOk0pxUKq+WiFfVZVlA7EbB0eP2qPR+SI
         bobfmOKOyFHBfGpm7yVeDxeQmGML47MBq0QFaOJU9bUIvz2npEuz8SN9bhVZ3vQtPWaJ
         tNLblr0RUO+ShjvjnDXkPkTYbsgD7qG/BUyLTK5RNoXizW4ouplFN00+LkZKlvJ5aV+u
         ZeaTdAIQC7PnSsnlKSDOavof9iI/al1V/evxA3tlFK7KLsfn8F5cKOQ7Mu1HL/lfbJHz
         Dn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764713990; x=1765318790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/CK7k5eSjuQ0pk1rxz/k0Lw8gpXsUg7rYtQOJH4OllQ=;
        b=Crp3t53Z6BNDKDOOhRpTy3nMBNs+69VN7O4Ece7t/hPDkYbm0tBAagjsvy3peCPIB4
         lDe75ma3LAnqnJCwkA59sase4NymAqBCLGVWK1xAgd24KHnacEAR8QuoYR7B+kPV4FwT
         CSgDiogp5A3CBrD8C8CyOWTDfE7hi3b1P+GD2uOvpNsPVJjYn743mGCYRtAUIX7i0GMD
         y9/B/Mz1XNZhSEUsAgblSl693d1B+f3zjCk+TqnBZBuizSKWxjCEknUGgLI35nKc3g3f
         ZZ/VUohlHNdBZmKso0SAq+eDZ6KSt+9GbFZuP+YLUCHsu6xy9OF5SuBr9uL02sTGQNgP
         viGw==
X-Gm-Message-State: AOJu0YyGovYppkqPlhJIfxJnmsTFf5A6j+kvXVCGvsuR+icQj4FDrM1K
	PTdF5nRa8bCt5A7Wwh+ziy0L4NjkAJE+JTBTMWFLL+qepsHHiJ8GtTIoyODxIQV9bwU/PHJwE5N
	onIPc
X-Gm-Gg: ASbGnctb/o8rltSDlncI3qlaBflIQgUU7uWdeUK/SFH8P+e/PyaHs7C0o+fq0hRLTbd
	SEcipQj0jfo6O5T5BZ8Pv6rRqJ4h1UB7+kBqACr/Nv76Kgiurfg5KhvbyYKpJQkR+EeFoBL+h7P
	jg3FcIc3jTboq+rqHgin/qudTO/pvcLiAMU4bgY4yiSsbL/cNiWqOBGV6dxJZ8uaWEJp0V7turK
	K8QszZorF7/OX5Ax3ourFmQ0J1jp5qhMH1wyrBqCHOzTuFgvARjAq9w/Z9lGobeZpjFkAhMsaDA
	YNni1PfuEQjFmCeUxgpNv2AkplO57ANi6WGzNPsJO/4hI2Q6lD2Oo7dJoXjW8/ZIPRdQx+vBLsd
	FjylYgcoSjUJcGbM/3gOFuxffkzGAfclgV+vCtwkZwZIk4uUhU+4m70hfz+6ob7ZIVmzTGgH1fH
	Fnx16Nsmnn5Dnm
X-Google-Smtp-Source: AGHT+IFq+3dPcYkN/TJeo0os9j3Dtg7g04h5t8nGa3lwqnptvTAZ+3wDL2njYsXuE3wd1YgvYaeWQA==
X-Received: by 2002:a17:903:40cb:b0:271:479d:3de2 with SMTP id d9443c01a7336-29d682f1202mr1372915ad.13.1764713989312;
        Tue, 02 Dec 2025 14:19:49 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:b8d9:92cd:3fd4:9b7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40acc7sm163700565ad.2.2025.12.02.14.19.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 14:19:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/8] libpng: patch CVE-2025-64505
Date: Tue,  2 Dec 2025 14:19:26 -0800
Message-ID: <2cca119f4da3c75bfb22063ff93e78ef4c206205.1764713862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764713862.git.steve@sakoman.com>
References: <cover.1764713862.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 22:19:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227190

From: Peter Marko <peter.marko@siemens.com>

Pick commit per NVD report.
Add two patches to apply it cleanly.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libpng/files/CVE-2025-64505-01.patch      | 111 ++++++++++++
 .../libpng/files/CVE-2025-64505-02.patch      | 163 ++++++++++++++++++
 .../libpng/files/CVE-2025-64505-03.patch      |  52 ++++++
 .../libpng/libpng_1.6.42.bb                   |   3 +
 4 files changed, 329 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64505-01.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64505-02.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64505-03.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-64505-01.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-64505-01.patch
new file mode 100644
index 0000000000..1e7d122803
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2025-64505-01.patch
@@ -0,0 +1,111 @@
+From 0fa3c0f698c2ca618a0fa44e10a822678df85373 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Thu, 15 Feb 2024 21:53:24 +0200
+Subject: [PATCH] chore: Clean up the spurious uses of `sizeof(png_byte)`; fix
+ the manual
+
+By definition, `sizeof(png_byte)` is 1.
+
+Remove all the occurences of `sizeof(png_byte)` from the code, and fix
+a related typo in the libpng manual.
+
+Also update the main .editorconfig file to reflect the fixing expected
+by a FIXME note.
+
+CVE: CVE-2025-64505
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/0fa3c0f698c2ca618a0fa44e10a822678df85373]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libpng-manual.txt |  4 ++--
+ libpng.3          |  4 ++--
+ pngrtran.c        | 17 +++++++----------
+ 3 files changed, 11 insertions(+), 14 deletions(-)
+
+diff --git a/libpng-manual.txt b/libpng-manual.txt
+index eb24ef483..d2918ce31 100644
+--- a/libpng-manual.txt
++++ b/libpng-manual.txt
+@@ -1178,11 +1178,11 @@ where row_pointers is an array of pointers to the pixel data for each row:
+ If you know your image size and pixel size ahead of time, you can allocate
+ row_pointers prior to calling png_read_png() with
+ 
+-   if (height > PNG_UINT_32_MAX/(sizeof (png_byte)))
++   if (height > PNG_UINT_32_MAX / (sizeof (png_bytep)))
+       png_error(png_ptr,
+           "Image is too tall to process in memory");
+ 
+-   if (width > PNG_UINT_32_MAX/pixel_size)
++   if (width > PNG_UINT_32_MAX / pixel_size)
+       png_error(png_ptr,
+           "Image is too wide to process in memory");
+ 
+diff --git a/libpng.3 b/libpng.3
+index 57d06f2db..8875b219a 100644
+--- a/libpng.3
++++ b/libpng.3
+@@ -1697,11 +1697,11 @@ where row_pointers is an array of pointers to the pixel data for each row:
+ If you know your image size and pixel size ahead of time, you can allocate
+ row_pointers prior to calling png_read_png() with
+ 
+-   if (height > PNG_UINT_32_MAX/(sizeof (png_byte)))
++   if (height > PNG_UINT_32_MAX / (sizeof (png_bytep)))
+       png_error(png_ptr,
+           "Image is too tall to process in memory");
+ 
+-   if (width > PNG_UINT_32_MAX/pixel_size)
++   if (width > PNG_UINT_32_MAX / pixel_size)
+       png_error(png_ptr,
+           "Image is too wide to process in memory");
+ 
+diff --git a/pngrtran.c b/pngrtran.c
+index 74cca476b..041f9306c 100644
+--- a/pngrtran.c
++++ b/pngrtran.c
+@@ -441,7 +441,7 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
+       int i;
+ 
+       png_ptr->quantize_index = (png_bytep)png_malloc(png_ptr,
+-          (png_alloc_size_t)((png_uint_32)num_palette * (sizeof (png_byte))));
++          (png_alloc_size_t)num_palette);
+       for (i = 0; i < num_palette; i++)
+          png_ptr->quantize_index[i] = (png_byte)i;
+    }
+@@ -458,7 +458,7 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
+ 
+          /* Initialize an array to sort colors */
+          png_ptr->quantize_sort = (png_bytep)png_malloc(png_ptr,
+-             (png_alloc_size_t)((png_uint_32)num_palette * (sizeof (png_byte))));
++             (png_alloc_size_t)num_palette);
+ 
+          /* Initialize the quantize_sort array */
+          for (i = 0; i < num_palette; i++)
+@@ -592,11 +592,9 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
+ 
+          /* Initialize palette index arrays */
+          png_ptr->index_to_palette = (png_bytep)png_malloc(png_ptr,
+-             (png_alloc_size_t)((png_uint_32)num_palette *
+-             (sizeof (png_byte))));
++             (png_alloc_size_t)num_palette);
+          png_ptr->palette_to_index = (png_bytep)png_malloc(png_ptr,
+-             (png_alloc_size_t)((png_uint_32)num_palette *
+-             (sizeof (png_byte))));
++             (png_alloc_size_t)num_palette);
+ 
+          /* Initialize the sort array */
+          for (i = 0; i < num_palette; i++)
+@@ -761,12 +759,11 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
+       size_t num_entries = ((size_t)1 << total_bits);
+ 
+       png_ptr->palette_lookup = (png_bytep)png_calloc(png_ptr,
+-          (png_alloc_size_t)(num_entries * (sizeof (png_byte))));
++          (png_alloc_size_t)(num_entries));
+ 
+-      distance = (png_bytep)png_malloc(png_ptr, (png_alloc_size_t)(num_entries *
+-          (sizeof (png_byte))));
++      distance = (png_bytep)png_malloc(png_ptr, (png_alloc_size_t)num_entries);
+ 
+-      memset(distance, 0xff, num_entries * (sizeof (png_byte)));
++      memset(distance, 0xff, num_entries);
+ 
+       for (i = 0; i < num_palette; i++)
+       {
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-64505-02.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-64505-02.patch
new file mode 100644
index 0000000000..5a3e50b642
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2025-64505-02.patch
@@ -0,0 +1,163 @@
+From ea094764f3436e3c6524622724c2d342a3eff235 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Sat, 8 Nov 2025 17:16:59 +0200
+Subject: [PATCH] Fix a memory leak in function `png_set_quantize`; refactor
+
+Release the previously-allocated array `quantize_index` before
+reallocating it. This avoids leaking memory when the function
+`png_set_quantize` is called multiple times on the same `png_struct`.
+
+This function assumed single-call usage, but fuzzing revealed that
+repeated calls would overwrite the pointers without freeing the
+original allocations, leaking 256 bytes per call for `quantize_index`
+and additional memory for `quantize_sort` when histogram-based
+quantization is used.
+
+Also remove the array `quantize_sort` from the list of `png_struct`
+members and make it a local variable. This array is initialized,
+used and released exclusively inside the function `png_set_quantize`.
+
+Reported-by: Samsung-PENTEST <Samsung-PENTEST@users.noreply.github.com>
+Analyzed-by: degrigis <degrigis@users.noreply.github.com>
+Reviewed-by: John Bowler <jbowler@acm.org>
+
+CVE: CVE-2025-64505
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/ea094764f3436e3c6524622724c2d342a3eff235]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ pngrtran.c  | 43 +++++++++++++++++++++++--------------------
+ pngstruct.h |  1 -
+ 2 files changed, 23 insertions(+), 21 deletions(-)
+
+diff --git a/pngrtran.c b/pngrtran.c
+index 1809db704..4632dd521 100644
+--- a/pngrtran.c
++++ b/pngrtran.c
+@@ -440,6 +440,12 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
+    {
+       int i;
+ 
++      /* Initialize the array to index colors.
++       *
++       * Be careful to avoid leaking memory. Applications are allowed to call
++       * this function more than once per png_struct.
++       */
++      png_free(png_ptr, png_ptr->quantize_index);
+       png_ptr->quantize_index = (png_bytep)png_malloc(png_ptr,
+           (png_alloc_size_t)num_palette);
+       for (i = 0; i < num_palette; i++)
+@@ -454,15 +460,14 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
+           * Perhaps not the best solution, but good enough.
+           */
+ 
+-         int i;
++         png_bytep quantize_sort;
++         int i, j;
+ 
+-         /* Initialize an array to sort colors */
+-         png_ptr->quantize_sort = (png_bytep)png_malloc(png_ptr,
++         /* Initialize the local array to sort colors. */
++         quantize_sort = (png_bytep)png_malloc(png_ptr,
+              (png_alloc_size_t)num_palette);
+-
+-         /* Initialize the quantize_sort array */
+          for (i = 0; i < num_palette; i++)
+-            png_ptr->quantize_sort[i] = (png_byte)i;
++            quantize_sort[i] = (png_byte)i;
+ 
+          /* Find the least used palette entries by starting a
+           * bubble sort, and running it until we have sorted
+@@ -474,19 +479,18 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
+          for (i = num_palette - 1; i >= maximum_colors; i--)
+          {
+             int done; /* To stop early if the list is pre-sorted */
+-            int j;
+ 
+             done = 1;
+             for (j = 0; j < i; j++)
+             {
+-               if (histogram[png_ptr->quantize_sort[j]]
+-                   < histogram[png_ptr->quantize_sort[j + 1]])
++               if (histogram[quantize_sort[j]]
++                   < histogram[quantize_sort[j + 1]])
+                {
+                   png_byte t;
+ 
+-                  t = png_ptr->quantize_sort[j];
+-                  png_ptr->quantize_sort[j] = png_ptr->quantize_sort[j + 1];
+-                  png_ptr->quantize_sort[j + 1] = t;
++                  t = quantize_sort[j];
++                  quantize_sort[j] = quantize_sort[j + 1];
++                  quantize_sort[j + 1] = t;
+                   done = 0;
+                }
+             }
+@@ -498,18 +502,18 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
+          /* Swap the palette around, and set up a table, if necessary */
+          if (full_quantize != 0)
+          {
+-            int j = num_palette;
++            j = num_palette;
+ 
+             /* Put all the useful colors within the max, but don't
+              * move the others.
+              */
+             for (i = 0; i < maximum_colors; i++)
+             {
+-               if ((int)png_ptr->quantize_sort[i] >= maximum_colors)
++               if ((int)quantize_sort[i] >= maximum_colors)
+                {
+                   do
+                      j--;
+-                  while ((int)png_ptr->quantize_sort[j] >= maximum_colors);
++                  while ((int)quantize_sort[j] >= maximum_colors);
+ 
+                   palette[i] = palette[j];
+                }
+@@ -517,7 +521,7 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
+          }
+          else
+          {
+-            int j = num_palette;
++            j = num_palette;
+ 
+             /* Move all the used colors inside the max limit, and
+              * develop a translation table.
+@@ -525,13 +529,13 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
+             for (i = 0; i < maximum_colors; i++)
+             {
+                /* Only move the colors we need to */
+-               if ((int)png_ptr->quantize_sort[i] >= maximum_colors)
++               if ((int)quantize_sort[i] >= maximum_colors)
+                {
+                   png_color tmp_color;
+ 
+                   do
+                      j--;
+-                  while ((int)png_ptr->quantize_sort[j] >= maximum_colors);
++                  while ((int)quantize_sort[j] >= maximum_colors);
+ 
+                   tmp_color = palette[j];
+                   palette[j] = palette[i];
+@@ -569,8 +573,7 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
+                }
+             }
+          }
+-         png_free(png_ptr, png_ptr->quantize_sort);
+-         png_ptr->quantize_sort = NULL;
++         png_free(png_ptr, quantize_sort);
+       }
+       else
+       {
+diff --git a/pngstruct.h b/pngstruct.h
+index 084422bc1..fe5fa0415 100644
+--- a/pngstruct.h
++++ b/pngstruct.h
+@@ -413,7 +413,6 @@ struct png_struct_def
+ 
+ #ifdef PNG_READ_QUANTIZE_SUPPORTED
+ /* The following three members were added at version 1.0.14 and 1.2.4 */
+-   png_bytep quantize_sort;          /* working sort array */
+    png_bytep index_to_palette;       /* where the original index currently is
+                                         in the palette */
+    png_bytep palette_to_index;       /* which original index points to this
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-64505-03.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-64505-03.patch
new file mode 100644
index 0000000000..ddda8678ce
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2025-64505-03.patch
@@ -0,0 +1,52 @@
+From 6a528eb5fd0dd7f6de1c39d30de0e41473431c37 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Sat, 8 Nov 2025 23:58:26 +0200
+Subject: [PATCH] Fix a buffer overflow in `png_do_quantize`
+
+Allocate the quantize_index array to PNG_MAX_PALETTE_LENGTH (256 bytes)
+instead of num_palette bytes. This approach matches the allocation
+pattern for `palette[]`, `trans_alpha[]` and `riffled_palette[]` which
+were similarly oversized in libpng 1.2.1 to prevent buffer overflows
+from malformed PNG files with out-of-range palette indices.
+
+Out-of-range palette indices `index >= num_palette` will now read
+identity-mapped values from the `quantize_index` array (where index N
+maps to palette entry N). This prevents undefined behavior while
+avoiding runtime bounds checking overhead in the performance-critical
+pixel processing loop.
+
+Reported-by: Samsung-PENTEST <Samsung-PENTEST@users.noreply.github.com>
+Analyzed-by: degrigis <degrigis@users.noreply.github.com>
+
+CVE: CVE-2025-64505
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/6a528eb5fd0dd7f6de1c39d30de0e41473431c37]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ pngrtran.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/pngrtran.c b/pngrtran.c
+index 4632dd521..9c2475fde 100644
+--- a/pngrtran.c
++++ b/pngrtran.c
+@@ -441,14 +441,18 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
+       int i;
+ 
+       /* Initialize the array to index colors.
++       *
++       * Ensure quantize_index can fit 256 elements (PNG_MAX_PALETTE_LENGTH)
++       * rather than num_palette elements. This is to prevent buffer overflows
++       * caused by malformed PNG files with out-of-range palette indices.
+        *
+        * Be careful to avoid leaking memory. Applications are allowed to call
+        * this function more than once per png_struct.
+        */
+       png_free(png_ptr, png_ptr->quantize_index);
+       png_ptr->quantize_index = (png_bytep)png_malloc(png_ptr,
+-          (png_alloc_size_t)num_palette);
+-      for (i = 0; i < num_palette; i++)
++          PNG_MAX_PALETTE_LENGTH);
++      for (i = 0; i < PNG_MAX_PALETTE_LENGTH; i++)
+          png_ptr->quantize_index[i] = (png_byte)i;
+    }
+ 
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index 4c21e8d597..dec78e568c 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -12,6 +12,9 @@ LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz \
            file://run-ptest \
+           file://CVE-2025-64505-01.patch \
+           file://CVE-2025-64505-02.patch \
+           file://CVE-2025-64505-03.patch \
 "
 
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"
-- 
2.43.0


