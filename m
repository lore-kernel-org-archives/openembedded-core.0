Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B915CD98D9
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:26:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71815.1781274398938563800
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Sa54+V+3;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so10919415e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781274397; x=1781879197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baiDgtDLq5oPeEErJdBbeGnt2IRa6nMi8jR6aOLq8s0=;
        b=Sa54+V+3GO199G4OIB3fM0Kark8XB4Rhry27iHCZiR3iKdo1yHUstyOXK+3oPfnepM
         pPXKPR7n3F3LoF5uZpNUsA/rTvzKrMQZiP0UpBmeFHCvOt3ApGA4qF4F2QpYpJKoaCfv
         BUe+DTruqI8OMsP9Fxw2T33PYDQO5RDzu9NRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274397; x=1781879197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=baiDgtDLq5oPeEErJdBbeGnt2IRa6nMi8jR6aOLq8s0=;
        b=AlnaJoAba7MorAkuLNXqrRZhmMFKu+H4z9UyV9n2t33f3DKQKN5gwOeG1Ztr2F4td9
         cs4q3PRfFhR2Q2JZivgrNLhp77WOUBGyumDRVKzjE893hPpxsXZSK6HXKoLe2tslWcEo
         1nIrE/fWvD4BOP/VUu7pf5/mNe6ijQNl0Hd1AIWToot+xU2EMqOjsXXgcOWg1RlmrN3x
         l2sixD44gcUd96KXIxUyJUzRRq7Z9dmKdFGYrfLNGhnnhwZyAc36wL6hxyaejq7gjZ72
         YvI8shKtySOAxW16Y3PV5DFGxdDvWYC0vtTwLLYfZNnGjPeFbWIIeoVfgNm/GaodHu+r
         7fPg==
X-Gm-Message-State: AOJu0Yy0lD318OCsr5qYiFAkuRI0WzT37oH0FO6O8yyWxSBLPfUfQa2z
	mUvZ4jGK7ddB1bezCuZdrXBvw7l559eiCFVmTRJJZwT5VzofZjUq82rxkyoDG0r7HPFPC/efICJ
	0Tcu3hg==
X-Gm-Gg: Acq92OHhDL+2KNlFlENpUmez4xzkKj60AWH8B9I9DGorOUN17PpVhRSTRko2SLrwCs7
	k6KnDNKOm4hfonVb936kT5NxoX2Xwap9vSA4EoIgAx9NfhfN+U8UUp3vH1lq4gf+DhBIzVNbYIv
	gtpPveaByjG5PLcFuhigZqHj5fo4Gsrtavxet/JtpqUR7luqvdSMmaTL3nZsfYOgytfnPcBONRP
	ZzRozl7TIzvSCi3/9sYUfdGMDC19hUOQmi3t1i6GeNNipQHyqZ1AhXkHqwGwWaAKd81BB7ufj6g
	7CuWs9VpveL2ArVXkiGuhPSnYfqNkdcownEWL/SHhFFGqIRurB7CP2QBFkuOWDhMcKVaJxGEvWH
	YcoK0sRQLMwnpLlnNupHFaThyi/jZgn04qDvm6AWdgtn/45EcYnwwCcXJA+aapPlbKrOieSIj0D
	T65dzR+dKM+gKR5DPSWsJEZUM=
X-Received: by 2002:a05:600c:6612:b0:490:bb45:79ee with SMTP id 5b1f17b1804b1-490ec33d4cfmr40334835e9.0.1781274396982;
        Fri, 12 Jun 2026 07:26:36 -0700 (PDT)
Received: from Logrus.lan ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm6798747f8f.0.2026.06.12.07.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:26:36 -0700 (PDT)
From: Jeremy Rosen <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 01/21] libpng: Fix CVE-2026-33416
Date: Fri, 12 Jun 2026 16:25:51 +0200
Message-ID: <2bf388381ae3de76db288a859040c1130786d41b.1781270474.git.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781270474.git.jeremy.rosen@smile.fr>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238623

From: Zahir Hussain <mail2szahir@gmail.com>

Backport fixes for CVE-2026-33416

Backport patches from security debian tracker [1] also mentioned at NVD Report [2]

[1] https://security-tracker.debian.org/tracker/CVE-2026-33416
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-33416

Add below patches to fix the CVE:

CVE-2026-33416-01.patch
CVE-2026-33416-02.patch
CVE-2026-33416-03.patch
CVE-2026-33416-04.patch

Signed-off-by: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>
Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
---
 .../libpng/files/CVE-2026-33416-01.patch      | 143 +++++++++++++++
 .../libpng/files/CVE-2026-33416-02.patch      |  53 ++++++
 .../libpng/files/CVE-2026-33416-03.patch      | 163 ++++++++++++++++++
 .../libpng/files/CVE-2026-33416-04.patch      |  53 ++++++
 .../libpng/libpng_1.6.42.bb                   |   4 +
 5 files changed, 416 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416-01.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416-02.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416-03.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416-04.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-33416-01.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-33416-01.patch
new file mode 100644
index 0000000000..a60a8d6b5b
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2026-33416-01.patch
@@ -0,0 +1,143 @@
+From 23019269764e35ed8458e517f1897bd3c54820eb Mon Sep 17 00:00:00 2001
+From: Oblivionsage <cookieandcream560@gmail.com>
+Date: Sun, 15 Mar 2026 10:35:29 +0100
+Subject: [PATCH] fix: Resolve use-after-free on `png_ptr->trans_alpha`
+
+The function `png_set_tRNS` sets `png_ptr->trans_alpha` to point at
+`info_ptr->trans_alpha` directly, so both structs share the same heap
+buffer. If the application calls `png_free_data(PNG_FREE_TRNS)`, or if
+`png_set_tRNS` is called a second time, the buffer is freed through
+`info_ptr` while `png_ptr` still holds a dangling reference. Any
+subsequent row read that hits the function `png_do_expand_palette` will
+dereference freed memory.
+
+The fix gives `png_struct` its own allocation instead of aliasing the
+`info_ptr` pointer. This was already flagged with a TODO in
+`png_handle_tRNS` ("horrible side effect ... Fix this.") but it was
+never addressed.
+
+Verified with AddressSanitizer. All 34 existing tests pass without
+regressions.
+
+CVE: CVE-2026-33416
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/23019269764e35ed8458e517f1897bd3c54820eb]
+Comment: Refreshed hunk to match latest scarthgap
+
+Reviewed-by: Cosmin Truta <ctruta@gmail.com>
+Signed-off-by: Cosmin Truta <ctruta@gmail.com>
+Signed-off-by: Sourav Kumar Pramanik <Souravkumar.Pramanik@bmwtechworks.in>
+Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
+---
+ pngread.c  | 11 +++++------
+ pngrutil.c |  4 ----
+ pngset.c   | 31 +++++++++++++++++++------------
+ pngwrite.c |  6 ++++++
+ 4 files changed, 30 insertions(+), 22 deletions(-)
+
+diff --git a/pngread.c b/pngread.c
+index 01b731d8eb..0086edf6cf 100644
+--- a/pngread.c
++++ b/pngread.c
+@@ -968,12 +968,11 @@ png_read_destroy(png_structrp png_ptr)
+ 
+ #if defined(PNG_tRNS_SUPPORTED) || \
+     defined(PNG_READ_EXPAND_SUPPORTED) || defined(PNG_READ_BACKGROUND_SUPPORTED)
+-   if ((png_ptr->free_me & PNG_FREE_TRNS) != 0)
+-   {
+-      png_free(png_ptr, png_ptr->trans_alpha);
+-      png_ptr->trans_alpha = NULL;
+-   }
+-   png_ptr->free_me &= ~PNG_FREE_TRNS;
++   /* png_ptr->trans_alpha is always independently allocated (not aliased
++    * with info_ptr->trans_alpha), so free it unconditionally.
++    */
++   png_free(png_ptr, png_ptr->trans_alpha);
++   png_ptr->trans_alpha = NULL;
+ #endif
+ 
+    inflateEnd(&png_ptr->zstream);
+diff --git a/pngrutil.c b/pngrutil.c
+index 366379b991..a19507bf1b 100644
+--- a/pngrutil.c
++++ b/pngrutil.c
+@@ -1905,10 +1905,6 @@ png_handle_tRNS(png_structrp png_ptr, pn
+       return;
+    }
+ 
+-   /* TODO: this is a horrible side effect in the palette case because the
+-    * png_struct ends up with a pointer to the tRNS buffer owned by the
+-    * png_info.  Fix this.
+-    */
+    png_set_tRNS(png_ptr, info_ptr, readbuf, png_ptr->num_trans,
+        &(png_ptr->trans_color));
+ }
+diff --git a/pngset.c b/pngset.c
+index 4b78b8960c..47883684e4 100644
+--- a/pngset.c
++++ b/pngset.c
+@@ -990,28 +990,36 @@ png_set_tRNS(png_structrp png_ptr, png_i
+ 
+    if (trans_alpha != NULL)
+    {
+-       /* It may not actually be necessary to set png_ptr->trans_alpha here;
+-        * we do it for backward compatibility with the way the png_handle_tRNS
+-        * function used to do the allocation.
+-        *
+-        * 1.6.0: The above statement is incorrect; png_handle_tRNS effectively
+-        * relies on png_set_tRNS storing the information in png_struct
+-        * (otherwise it won't be there for the code in pngrtran.c).
+-        */
+-
+        png_free_data(png_ptr, info_ptr, PNG_FREE_TRNS, 0);
+ 
+        if (num_trans > 0 && num_trans <= PNG_MAX_PALETTE_LENGTH)
+        {
+-         /* Changed from num_trans to PNG_MAX_PALETTE_LENGTH in version 1.2.1 */
++          /* Allocate info_ptr's copy of the transparency data. */
+           info_ptr->trans_alpha = png_voidcast(png_bytep,
+               png_malloc(png_ptr, PNG_MAX_PALETTE_LENGTH));
+           memcpy(info_ptr->trans_alpha, trans_alpha, (size_t)num_trans);
+-
+           info_ptr->free_me |= PNG_FREE_TRNS;
+           info_ptr->valid |= PNG_INFO_tRNS;
++
++
++          /* Allocate an independent copy for png_struct, so that the
++           * lifetime of png_ptr->trans_alpha is decoupled from the
++           * lifetime of info_ptr->trans_alpha.  Previously these two
++           * pointers were aliased, which caused a use-after-free if
++           * png_free_data freed info_ptr->trans_alpha while
++           * png_ptr->trans_alpha was still in use by the row transform
++           * functions (e.g. png_do_expand_palette).
++           */
++          png_free(png_ptr, png_ptr->trans_alpha);
++          png_ptr->trans_alpha = png_voidcast(png_bytep,
++              png_malloc(png_ptr, PNG_MAX_PALETTE_LENGTH));
++          memcpy(png_ptr->trans_alpha, trans_alpha, (size_t)num_trans);
++       }
++       else
++       {
++          png_free(png_ptr, png_ptr->trans_alpha);
++          png_ptr->trans_alpha = NULL;
+        }
+-       png_ptr->trans_alpha = info_ptr->trans_alpha;
+    }
+ 
+    if (trans_color != NULL)
+diff --git a/pngwrite.c b/pngwrite.c
+index 5fc77d91f7..84af1e73fb 100644
+--- a/pngwrite.c
++++ b/pngwrite.c
+@@ -977,6 +977,12 @@ png_write_destroy(png_structrp png_ptr)
+    png_ptr->chunk_list = NULL;
+ #endif
+ 
++#if defined(PNG_tRNS_SUPPORTED)
++   /* Free the independent copy of trans_alpha owned by png_struct. */
++   png_free(png_ptr, png_ptr->trans_alpha);
++   png_ptr->trans_alpha = NULL;
++#endif
++
+    /* The error handling and memory handling information is left intact at this
+     * point: the jmp_buf may still have to be freed.  See png_destroy_png_struct
+     * for how this happens.
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-33416-02.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-33416-02.patch
new file mode 100644
index 0000000000..e746293bf2
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2026-33416-02.patch
@@ -0,0 +1,53 @@
+From a3a21443ed12bfa1ef46fa0d4fb2b74a0fa34a25 Mon Sep 17 00:00:00 2001
+From: Oblivionsage <cookieandcream560@gmail.com>
+Date: Tue, 17 Mar 2026 08:55:18 +0100
+Subject: [PATCH] fix: Initialize tail bytes in `trans_alpha` buffers
+
+Although the arrays `info_ptr->trans_alpha` and `png_ptr->trans_alpha`
+are allocated 256 bytes, only `num_trans` bytes are copied.
+The remaining entries were left uninitialized. Set them to 0xff (fully
+opaque) before copying, which matches the conventional treatment of
+entries beyond `num_trans`.
+
+This is a follow-up to the previous use-after-free fix.
+
+CVE: CVE-2026-33416
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/a3a21443ed12bfa1ef46fa0d4fb2b74a0fa34a25]
+Comment: Refreshed hunk to match latest scarthgap
+
+Reported-by: Cosmin Truta <ctruta@gmail.com>
+Reviewed-by: Cosmin Truta <ctruta@gmail.com>
+Signed-off-by: Cosmin Truta <ctruta@gmail.com>
+Signed-off-by: Sourav Kumar Pramanik <Souravkumar.Pramanik@bmwtechworks.in>
+Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
+---
+ pngset.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/pngset.c b/pngset.c
+index 47883684e4..dccc6498d7 100644
+--- a/pngset.c
++++ b/pngset.c
+@@ -994,9 +994,13 @@ png_set_tRNS(png_structrp png_ptr, png_i
+ 
+        if (num_trans > 0 && num_trans <= PNG_MAX_PALETTE_LENGTH)
+        {
+-          /* Allocate info_ptr's copy of the transparency data. */
++	       /* Allocate info_ptr's copy of the transparency data.
++           * Initialize all entries to fully opaque (0xff), then overwrite
++           * the first num_trans entries with the actual values.
++           */
+           info_ptr->trans_alpha = png_voidcast(png_bytep,
+               png_malloc(png_ptr, PNG_MAX_PALETTE_LENGTH));
++	       memset(info_ptr->trans_alpha, 0xff, PNG_MAX_PALETTE_LENGTH);
+           memcpy(info_ptr->trans_alpha, trans_alpha, (size_t)num_trans);
+           info_ptr->free_me |= PNG_FREE_TRNS;
+           info_ptr->valid |= PNG_INFO_tRNS;
+@@ -1013,6 +1017,7 @@ png_set_tRNS(png_structrp png_ptr, png_i
+           png_free(png_ptr, png_ptr->trans_alpha);
+           png_ptr->trans_alpha = png_voidcast(png_bytep,
+               png_malloc(png_ptr, PNG_MAX_PALETTE_LENGTH));
++	       memset(png_ptr->trans_alpha, 0xff, PNG_MAX_PALETTE_LENGTH);
+           memcpy(png_ptr->trans_alpha, trans_alpha, (size_t)num_trans);
+        }
+        else
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-33416-03.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-33416-03.patch
new file mode 100644
index 0000000000..21ce35dcd1
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2026-33416-03.patch
@@ -0,0 +1,163 @@
+From 7ea9eea884a2328cc7fdcb3c0c00246a50d90667 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Fri, 20 Mar 2026 17:37:22 +0200
+Subject: [PATCH] fix: Resolve use-after-free on `png_ptr->palette`
+
+Give `png_struct` its own independently-allocated copy of the palette
+buffer, decoupling it from `info_struct`'s palette. Allocate both
+copies with `png_calloc` to zero-fill, because the ARM NEON palette
+riffle reads all 256 entries unconditionally.
+
+In function `png_set_PLTE`, `png_ptr->palette` was aliased directly to
+`info_ptr->palette`: a single heap buffer shared across two structs
+with independent lifetimes. If the buffer was freed through `info_ptr`
+(via `png_free_data(PNG_FREE_PLTE)` or a second call to `png_set_PLTE`),
+`png_ptr->palette` became a dangling pointer. Subsequent row reads,
+performed in `png_do_expand_palette` and in other transform functions,
+dereferenced (and in the bit-shift path, wrote to) freed memory.
+
+Also fix `png_set_quantize` to allocate an owned copy of the caller's
+palette rather than aliasing the user pointer, so that the unconditional
+free in `png_read_destroy` does not free unmanaged memory.
+
+CVE: CVE-2026-33416
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/7ea9eea884a2328cc7fdcb3c0c00246a50d90667]
+Comment: Refreshed hunk to match latest scarthgap
+
+Signed-off-by: Sourav Kumar Pramanik <Souravkumar.Pramanik@bmwtechworks.in>
+Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
+---
+ pngread.c  | 11 +++++------
+ pngrtran.c |  8 +++++++-
+ pngrutil.c | 13 -------------
+ pngset.c   | 28 +++++++++++++++++++---------
+ pngwrite.c |  4 ++++
+ 5 files changed, 35 insertions(+), 29 deletions(-)
+
+diff --git a/pngread.c b/pngread.c
+index 0086edf6cf..e1d38d578a 100644
+--- a/pngread.c
++++ b/pngread.c
+@@ -959,12 +959,11 @@ png_read_destroy(png_structrp png_ptr)
+    png_ptr->quantize_index = NULL;
+ #endif
+ 
+-   if ((png_ptr->free_me & PNG_FREE_PLTE) != 0)
+-   {
+-      png_zfree(png_ptr, png_ptr->palette);
+-      png_ptr->palette = NULL;
+-   }
+-   png_ptr->free_me &= ~PNG_FREE_PLTE;
++   /* png_ptr->palette is always independently allocated (not aliased
++    * with info_ptr->palette), so free it unconditionally.
++    */
++   png_free(png_ptr, png_ptr->palette);
++   png_ptr->palette = NULL;
+ 
+ #if defined(PNG_tRNS_SUPPORTED) || \
+     defined(PNG_READ_EXPAND_SUPPORTED) || defined(PNG_READ_BACKGROUND_SUPPORTED)
+diff --git a/pngrtran.c b/pngrtran.c
+index bfb7d423b7..fd736ab672 100644
+--- a/pngrtran.c
++++ b/pngrtran.c
+@@ -750,7 +750,13 @@ png_set_quantize(png_structrp png_ptr, p
+    }
+    if (png_ptr->palette == NULL)
+    {
+-      png_ptr->palette = palette;
++      /* Allocate an owned copy rather than aliasing the caller's pointer,
++       * so that png_read_destroy can free png_ptr->palette unconditionally.
++       */
++      png_ptr->palette = png_voidcast(png_colorp, png_calloc(png_ptr,
++          PNG_MAX_PALETTE_LENGTH * (sizeof (png_color))));
++      memcpy(png_ptr->palette, palette, (unsigned int)num_palette *
++          (sizeof (png_color)));
+    }
+    png_ptr->num_palette = (png_uint_16)num_palette;
+
+diff --git a/pngrutil.c b/pngrutil.c
+index a19507bf1b..3a35fe9de2 100644
+--- a/pngrutil.c
++++ b/pngrutil.c
+@@ -1047,14 +1047,6 @@ png_handle_PLTE(png_structrp png_ptr, pn
+    }
+ #endif
+ 
+-   /* TODO: png_set_PLTE has the side effect of setting png_ptr->palette to its
+-    * own copy of the palette.  This has the side effect that when png_start_row
+-    * is called (this happens after any call to png_read_update_info) the
+-    * info_ptr palette gets changed.  This is extremely unexpected and
+-    * confusing.
+-    *
+-    * Fix this by not sharing the palette in this way.
+-    */
+    png_set_PLTE(png_ptr, info_ptr, palette, num);
+ 
+    /* The three chunks, bKGD, hIST and tRNS *must* appear after PLTE and before
+diff --git a/pngset.c b/pngset.c
+index dccc6498d7..b9ccb7fb15 100644
+--- a/pngset.c
++++ b/pngset.c
+@@ -595,28 +595,38 @@ png_set_PLTE(png_structrp png_ptr, png_i
+       png_error(png_ptr, "Invalid palette");
+    }
+ 
+-   /* It may not actually be necessary to set png_ptr->palette here;
+-    * we do it for backward compatibility with the way the png_handle_tRNS
+-    * function used to do the allocation.
+-    *
+-    * 1.6.0: the above statement appears to be incorrect; something has to set
+-    * the palette inside png_struct on read.
+-    */
+    png_free_data(png_ptr, info_ptr, PNG_FREE_PLTE, 0);
+ 
+    /* Changed in libpng-1.2.1 to allocate PNG_MAX_PALETTE_LENGTH instead
+     * of num_palette entries, in case of an invalid PNG file or incorrect
+     * call to png_set_PLTE() with too-large sample values.
++    *
++    * Allocate independent buffers for info_ptr and png_ptr so that the
++    * lifetime of png_ptr->palette is decoupled from the lifetime of
++    * info_ptr->palette.  Previously, these two pointers were aliased,
++    * which caused a use-after-free vulnerability if png_free_data freed
++    * info_ptr->palette while png_ptr->palette was still in use by the
++    * row transform functions (e.g. png_do_expand_palette).
++    *
++    * Both buffers are allocated with png_calloc to zero-fill, because
++    * the ARM NEON palette riffle reads all 256 entries unconditionally,
++    * regardless of num_palette.
+     */
++   png_free(png_ptr, png_ptr->palette);
+    png_ptr->palette = png_voidcast(png_colorp, png_calloc(png_ptr,
+        PNG_MAX_PALETTE_LENGTH * (sizeof (png_color))));
++   info_ptr->palette = png_voidcast(png_colorp, png_calloc(png_ptr,
++       PNG_MAX_PALETTE_LENGTH * (sizeof (png_color))));
++   png_ptr->num_palette = info_ptr->num_palette = (png_uint_16)num_palette;
+ 
+    if (num_palette > 0)
++      {
++      memcpy(info_ptr->palette, palette, (unsigned int)num_palette *
++          (sizeof (png_color)));
+       memcpy(png_ptr->palette, palette, (unsigned int)num_palette *
+           (sizeof (png_color)));
++      }
+ 
+-   info_ptr->palette = png_ptr->palette;
+-   info_ptr->num_palette = png_ptr->num_palette = (png_uint_16)num_palette;
+    info_ptr->free_me |= PNG_FREE_PLTE;
+    info_ptr->valid |= PNG_INFO_PLTE;
+ }
+diff --git a/pngwrite.c b/pngwrite.c
+index 84af1e73fb..348763e940 100644
+--- a/pngwrite.c
++++ b/pngwrite.c
+@@ -982,6 +982,10 @@ png_write_destroy(png_structrp png_ptr)
+    png_free(png_ptr, png_ptr->trans_alpha);
+    png_ptr->trans_alpha = NULL;
+ #endif
++   
++   /* Free the independent copy of the palette owned by png_struct. */
++   png_free(png_ptr, png_ptr->palette);
++   png_ptr->palette = NULL;
+ 
+    /* The error handling and memory handling information is left intact at this
+     * point: the jmp_buf may still have to be freed.  See png_destroy_png_struct
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-33416-04.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-33416-04.patch
new file mode 100644
index 0000000000..ff7db53c81
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2026-33416-04.patch
@@ -0,0 +1,53 @@
+From c1b0318b393c90679e6fa5bc1d329fd5d5012ec1 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Fri, 20 Mar 2026 21:25:12 +0200
+Subject: [PATCH] fix: Sync `info_ptr->palette` after in-place transforms
+
+Copy `png_ptr->palette` into `info_ptr->palette` upon entering
+the function that runs immediately after the in-place transforms.
+
+The palette decoupling in the previous commit gave `png_struct`
+and `png_info` independently-allocated palette buffers, fixing a
+use-after-free vulnerability. However, `png_init_read_transformations`
+modifies `png_ptr->palette` in place (e.g. for gamma correction or
+background compositing), and the old aliasing made those modifications
+visible through `png_get_PLTE`. With independent buffers,
+`info_ptr->palette` retained the original values, causing our tests to
+fail on indexed-colour background compositing.
+
+CVE: CVE-2026-33416
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/c1b0318b393c90679e6fa5bc1d329fd5d5012ec1]
+Comment: Refreshed hunk to match latest scarthgap
+
+Signed-off-by: Sourav Kumar Pramanik <Souravkumar.Pramanik@bmwtechworks.in>
+Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
+---
+ pngrtran.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/pngrtran.c b/pngrtran.c
+index fd736ab672..978dac5888 100644
+--- a/pngrtran.c
++++ b/pngrtran.c
+@@ -1984,6 +1984,21 @@ png_read_transform_info(png_structrp png
+ {
+    png_debug(1, "in png_read_transform_info");
+ 
++   if (png_ptr->transformations != 0)
++   {
++      if (info_ptr->color_type == PNG_COLOR_TYPE_PALETTE &&
++          info_ptr->palette != NULL && png_ptr->palette != NULL)
++      {
++         /* Sync info_ptr->palette with png_ptr->palette.
++          * The function png_init_read_transformations may have modified
++          * png_ptr->palette in place (e.g. for gamma correction or for
++          * background compositing).
++          */
++         memcpy(info_ptr->palette, png_ptr->palette,
++             PNG_MAX_PALETTE_LENGTH * (sizeof (png_color)));
++      }
++   }
++
+ #ifdef PNG_READ_EXPAND_SUPPORTED
+    if ((png_ptr->transformations & PNG_EXPAND) != 0)
+    {
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index 923ed79896..e4cc63686e 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -25,6 +25,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz
            file://CVE-2026-22801.patch \
            file://CVE-2026-25646.patch \
            file://CVE-2026-33636.patch \
+           file://CVE-2026-33416-01.patch \
+           file://CVE-2026-33416-02.patch \
+           file://CVE-2026-33416-03.patch \
+           file://CVE-2026-33416-04.patch \
 "
 
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"
-- 
2.53.0


