Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF6EC282DE
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 15:59:14 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.16708.1741190345893471680
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 07:59:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zwS4GF5F;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223f4c06e9fso16589415ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 07:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741190345; x=1741795145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfhRfLsxYdBnmBQ7dcOmTDhQKiiCuIsJd38MmyhSFX0=;
        b=zwS4GF5FSWzr7U+d5KGWJjOw78kUqAulUWEfO8KGAMceQA1Jxb4McKil7NzP56f3jV
         7+VAvOxWAufUo/z+zifNKTri7vYoHd66lEbGyC1sOXvdPOFqRrcZX9ktfkkK73g3iA/c
         tLn+h2+pEYhIYybeDKGuLj4biX9K93H/eaMn0Nh7TaGj4BtFkOmWJe3sbKCB3zB8dKhj
         2o5xCSDtIxR7mLghSXnDA0Cy+PLsBUloFk06YT52gnXctDXQtY5y3HLc95V4edavspeE
         QnVvTpdBRE3cQXWR4OISeIrn9L5v6/9I7q8jrPJIqZ8sYPr187Pu6PziP3GvVTK/2Eis
         SzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190345; x=1741795145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfhRfLsxYdBnmBQ7dcOmTDhQKiiCuIsJd38MmyhSFX0=;
        b=oZwkxUzQFSw1rggAfi+BqyXFVxeUZpY+qTzDpi7owjjSin7X2uaIEXdY36YOXHveE/
         3xN9MLOYEthPpdknviH2gTvuLbZC3UcFZkZuszW46AdFvutBrW9nue7mmj0DzupEMUx2
         8VI/0gbbd9Zo5ukrDU+Aa/ooxUnpHjRy8fXJgHDnGhlLbWN3BOH9/qww0Rr8Pz+b2ofx
         5Cwu7aLnSmr/lx5Uu8XDtUga/qzZ6BORH4VnfFr4kKpyviEDNcsKXTB2/pOqFDZJkTWp
         iwIQxi/6gnNEY32TWvf6/2ee9L6Jx0HuErb5bK+qIqi6GNhDwbwq89bZ/mR3k9odaXn8
         cqxg==
X-Gm-Message-State: AOJu0YweWgnAid71X73QC3zHC6jcgzZ39jWJ7v38K/AjzRo9XgwFAsiR
	XIQ/F+jBe9wkQOvDv4YHjnR9rUDmHBshqjkv+nWnu802P7GEZsx+kWwcu+JYvuvBCMcxVGk6Ubx
	4
X-Gm-Gg: ASbGncuN4SSUyIz3uHpeQrusdR6wyl0XpTWx07WgmG9+6dZhZvNY5SvuB7DUdayTA2j
	eT6IM1a8/vGFat1pZtDMufgufOf/6AHA9gsOh2lXx6KD+9IHUMmp8eRoezp4xeRpjXL/F0HzzgE
	fimzEU/2Q+HzeKGyOAc+KospHr4TmkKK0RLSrv3aLAQhgoa0aARnPT5MBqItltipwVobVt+3iiY
	kCfR7pJavq9ouqPkrflnqLEMFOKrX/+FWc7780sCdnNOoS4EE0XBNI55jdvEfSXGmE5+V+ls2Oa
	vVyO3B0EomTjNifUY9fjIez0RbNo+6bHD4g=
X-Google-Smtp-Source: AGHT+IHRcH5J+iB1kwXvm35zEv6hIoSYSV3Jesj6ywzehHaCBvMLliBYWjtiFIf7e9b9jKeNqg9MUw==
X-Received: by 2002:a17:903:1252:b0:223:4d5e:76a6 with SMTP id d9443c01a7336-223f1d0198cmr57375735ad.1.1741190345025;
        Wed, 05 Mar 2025 07:59:05 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f97bfsm115411025ad.85.2025.03.05.07.59.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:59:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/16] xwayland: Fix CVE-2024-31083
Date: Wed,  5 Mar 2025 07:58:35 -0800
Message-ID: <1c4b1e7877210243707a91d6a9d37ed4546bc8a7.1741190221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741190221.git.steve@sakoman.com>
References: <cover.1741190221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 15:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212328

From: Vijay Anusuri <vanusuri@mvista.com>

The patches are copied from xserver-xorg recipe.
CVE reported for both and patches apply on both.

Upstream-Commit:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/bdca6c3d1f5057ee & https://gitlab.freedesktop.org/xorg/xserver/-/commit/337d8d48b618d4fc

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/CVE-2024-31083-0001.patch        | 118 ++++++++++++++++++
 .../xwayland/CVE-2024-31083-0002.patch        |  77 ++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |   2 +
 3 files changed, 197 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-31083-0001.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-31083-0002.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2024-31083-0001.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-31083-0001.patch
new file mode 100644
index 0000000000..754e03961a
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-31083-0001.patch
@@ -0,0 +1,118 @@
+From bdca6c3d1f5057eeb31609b1280fc93237b00c77 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Tue, 30 Jan 2024 13:13:35 +1000
+Subject: [PATCH] render: fix refcounting of glyphs during ProcRenderAddGlyphs
+
+Previously, AllocateGlyph would return a new glyph with refcount=0 and a
+re-used glyph would end up not changing the refcount at all. The
+resulting glyph_new array would thus have multiple entries pointing to
+the same non-refcounted glyphs.
+
+AddGlyph may free a glyph, resulting in a UAF when the same glyph
+pointer is then later used.
+
+Fix this by returning a refcount of 1 for a new glyph and always
+incrementing the refcount for a re-used glyph, followed by dropping that
+refcount back down again when we're done with it.
+
+CVE-2024-31083, ZDI-CAN-22880
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1463>
+
+CVE: CVE-2024-31083
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/bdca6c3d1f5057ee]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ render/glyph.c    |  5 +++--
+ render/glyphstr.h |  2 ++
+ render/render.c   | 15 +++++++++++----
+ 3 files changed, 16 insertions(+), 6 deletions(-)
+
+diff --git a/render/glyph.c b/render/glyph.c
+index f3ed9cf..d5fc5f3 100644
+--- a/render/glyph.c
++++ b/render/glyph.c
+@@ -245,10 +245,11 @@ FreeGlyphPicture(GlyphPtr glyph)
+     }
+ }
+
+-static void
++void
+ FreeGlyph(GlyphPtr glyph, int format)
+ {
+     CheckDuplicates(&globalGlyphs[format], "FreeGlyph");
++    BUG_RETURN(glyph->refcnt == 0);
+     if (--glyph->refcnt == 0) {
+         GlyphRefPtr gr;
+         int i;
+@@ -354,7 +355,7 @@ AllocateGlyph(xGlyphInfo * gi, int fdepth)
+     glyph = (GlyphPtr) malloc(size);
+     if (!glyph)
+         return 0;
+-    glyph->refcnt = 0;
++    glyph->refcnt = 1;
+     glyph->size = size + sizeof(xGlyphInfo);
+     glyph->info = *gi;
+     dixInitPrivates(glyph, (char *) glyph + head_size, PRIVATE_GLYPH);
+diff --git a/render/glyphstr.h b/render/glyphstr.h
+index 2f51bd2..68f8c9e 100644
+--- a/render/glyphstr.h
++++ b/render/glyphstr.h
+@@ -117,6 +117,8 @@ extern GlyphSetPtr AllocateGlyphSet(int fdepth, PictFormatPtr format);
+ extern int
+  FreeGlyphSet(void *value, XID gid);
+
++void FreeGlyph(GlyphPtr glyph, int format);
++
+ #define GLYPH_HAS_GLYPH_PICTURE_ACCESSOR 1 /* used for api compat */
+ extern _X_EXPORT PicturePtr
+  GetGlyphPicture(GlyphPtr glyph, ScreenPtr pScreen);
+diff --git a/render/render.c b/render/render.c
+index 456f156..5bc2a20 100644
+--- a/render/render.c
++++ b/render/render.c
+@@ -1076,6 +1076,7 @@ ProcRenderAddGlyphs(ClientPtr client)
+
+         if (glyph_new->glyph && glyph_new->glyph != DeletedGlyph) {
+             glyph_new->found = TRUE;
++            ++glyph_new->glyph->refcnt;
+         }
+         else {
+             GlyphPtr glyph;
+@@ -1168,8 +1169,10 @@ ProcRenderAddGlyphs(ClientPtr client)
+         err = BadAlloc;
+         goto bail;
+     }
+-    for (i = 0; i < nglyphs; i++)
++    for (i = 0; i < nglyphs; i++) {
+         AddGlyph(glyphSet, glyphs[i].glyph, glyphs[i].id);
++        FreeGlyph(glyphs[i].glyph, glyphSet->fdepth);
++    }
+
+     if (glyphsBase != glyphsLocal)
+         free(glyphsBase);
+@@ -1179,9 +1182,13 @@ ProcRenderAddGlyphs(ClientPtr client)
+         FreePicture((void *) pSrc, 0);
+     if (pSrcPix)
+         FreeScratchPixmapHeader(pSrcPix);
+-    for (i = 0; i < nglyphs; i++)
+-        if (glyphs[i].glyph && !glyphs[i].found)
+-            free(glyphs[i].glyph);
++    for (i = 0; i < nglyphs; i++) {
++        if (glyphs[i].glyph) {
++            --glyphs[i].glyph->refcnt;
++            if (!glyphs[i].found)
++                free(glyphs[i].glyph);
++        }
++    }
+     if (glyphsBase != glyphsLocal)
+         free(glyphsBase);
+     return err;
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2024-31083-0002.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-31083-0002.patch
new file mode 100644
index 0000000000..c597e9b575
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-31083-0002.patch
@@ -0,0 +1,77 @@
+From 337d8d48b618d4fc0168a7b978be4c3447650b04 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Fri, 5 Apr 2024 15:24:49 +0200
+Subject: [PATCH] render: Avoid possible double-free in ProcRenderAddGlyphs()
+ ProcRenderAddGlyphs() adds the glyph to the glyphset using AddGlyph() and
+ then frees it using FreeGlyph() to decrease the reference count, after
+ AddGlyph() has increased it.
+
+AddGlyph() however may chose to reuse an existing glyph if it's already
+in the glyphSet, and free the glyph that was given, in which case the
+caller function, ProcRenderAddGlyphs() will call FreeGlyph() on an
+already freed glyph, as reported by ASan:
+
+  READ of size 4 thread T0
+    #0 in FreeGlyph xserver/render/glyph.c:252
+    #1 in ProcRenderAddGlyphs xserver/render/render.c:1174
+    #2 in Dispatch xserver/dix/dispatch.c:546
+    #3 in dix_main xserver/dix/main.c:271
+    #4 in main xserver/dix/stubmain.c:34
+    #5 in __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58
+    #6 in __libc_start_main_impl ../csu/libc-start.c:360
+    #7  (/usr/bin/Xwayland+0x44fe4)
+  Address is located 0 bytes inside of 64-byte region
+  freed by thread T0 here:
+    #0 in __interceptor_free libsanitizer/asan/asan_malloc_linux.cpp:52
+    #1 in _dixFreeObjectWithPrivates xserver/dix/privates.c:538
+    #2 in AddGlyph xserver/render/glyph.c:295
+    #3 in ProcRenderAddGlyphs xserver/render/render.c:1173
+    #4 in Dispatch xserver/dix/dispatch.c:546
+    #5 in dix_main xserver/dix/main.c:271
+    #6 in main xserver/dix/stubmain.c:34
+    #7 in __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58
+  previously allocated by thread T0 here:
+    #0 in __interceptor_malloc libsanitizer/asan/asan_malloc_linux.cpp:69
+    #1 in AllocateGlyph xserver/render/glyph.c:355
+    #2 in ProcRenderAddGlyphs xserver/render/render.c:1085
+    #3 in Dispatch xserver/dix/dispatch.c:546
+    #4 in dix_main xserver/dix/main.c:271
+    #5 in main xserver/dix/stubmain.c:34
+    #6 in __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58
+  SUMMARY: AddressSanitizer: heap-use-after-free xserver/render/glyph.c:252 in FreeGlyph
+
+To avoid that, make sure not to free the given glyph in AddGlyph().
+
+v2: Simplify the test using the boolean returned from AddGlyph() (Michel)
+v3: Simplify even more by not freeing the glyph in AddGlyph() (Peter)
+
+Fixes: bdca6c3d1 - render: fix refcounting of glyphs during ProcRenderAddGlyphs
+Closes: https://gitlab.freedesktop.org/xorg/xserver/-/issues/1659
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1476>
+
+CVE: CVE-2024-31083
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/337d8d48b618d4fc]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ render/glyph.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/render/glyph.c b/render/glyph.c
+index d5fc5f3..f5069d4 100644
+--- a/render/glyph.c
++++ b/render/glyph.c
+@@ -291,8 +291,6 @@ AddGlyph(GlyphSetPtr glyphSet, GlyphPtr glyph, Glyph id)
+     gr = FindGlyphRef(&globalGlyphs[glyphSet->fdepth], signature,
+                       TRUE, glyph->sha1);
+     if (gr->glyph && gr->glyph != DeletedGlyph && gr->glyph != glyph) {
+-        FreeGlyphPicture(glyph);
+-        dixFreeObjectWithPrivates(glyph, PRIVATE_GLYPH);
+         glyph = gr->glyph;
+     }
+     else if (gr->glyph != glyph) {
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 5fa2402234..258a875697 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -26,6 +26,8 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2024-21886-2.patch \
            file://CVE-2024-31080.patch \
            file://CVE-2024-31081.patch \
+           file://CVE-2024-31083-0001.patch \
+           file://CVE-2024-31083-0002.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.43.0


