Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8607C282D0
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 12:20:04 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.20487.1741090797066748924
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 04:19:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Xa0vGkaJ;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2238d965199so46712845ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 04:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741090796; x=1741695596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yb0bvoeCQLTs2EUz/x3NnUH0cz8/31761VtrtAhvjzM=;
        b=Xa0vGkaJ/eqsx1/aDggnNjqqf2Sb4jLywaa4zkTJJvWGiGcp0yYIFP8zcAk1w2zzU8
         0pyxf6gHBZ7NmxP3995gjMUKp88IksFfDGGX9A55le5bZCdVHxE6RAPkM6+/YvnRMUQ1
         llEedHLc50EzU+Y/zJ/oZKPHCtT+H/XdIXGPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741090796; x=1741695596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yb0bvoeCQLTs2EUz/x3NnUH0cz8/31761VtrtAhvjzM=;
        b=IJ0fsIcZaUtihwf9C2OesJt2hCZ8bF4CRx+bKJrm0QEoA9I8pYQw0kIKe0B3X+8eCw
         rTLIhV52/RUxOfv+xgq6tKQCZ70Xcgte8VQcqQpbyLnBKavujYo3n0jo9Q60fzy/6Spu
         kVQCAs6uQm7q/1QHaCqkVVKQw0J5RahEyhum6gNTrUN9xhQDBhZJlKYFL5T5dZtGNR5x
         dnTJ4UrJ2jFswiSUG/alSvkbVzA5b2oFjos1aYKrgzZ2bDk6lfjr/7Med7azLjPeINxp
         HuQ/nZk/awKcUzwlZpnKwc0PpiwzBKgy2aH3g4SXx7fw3tX07swpXohyiixaxxyeJGMa
         vWdA==
X-Gm-Message-State: AOJu0YznBy++/jOy7CYPX7X5QWoHeEJF7nmGB8+wAtb484sTCNEqgJYd
	CsgwjS/S0mG732Wxq/VYjiMpHgFrU4DZ9ReGbbuHqA2xacPAJhCtkTzT/QaaBT55lAt9HoQY0ji
	9oRQ=
X-Gm-Gg: ASbGncuhPm6L/QIDXxCMuLzZwKgfhKxen2KdzoGkNceLFwY95u1tl3CEpgPS8cdKErB
	rFvD6bUT0G6BXcp5EPge5JiQB8DxEb1sEf00H6ebPx9pL17rkou1jZ6fi6mZc4LHWijNmEdHNWZ
	4rgcYREbHUz9BPcb7NeqirfmFeZgdLuWC/CWL4+6JjWUrTyYebr3s0gi60WjURz4oYecJkow1eq
	MsS0IfCcZ0bJzi92bz06fP707dyiimZzwZ1dDnssbzX3eK4wpostje1D1tUesX5PGnN9naA0i+c
	fXETJJbwGYbeRNLa5CoTkYyiKsG6i9G+YcLnOjBUsxrZXfC8VI1Mpw==
X-Google-Smtp-Source: AGHT+IEgz61nTE+DHLVPvSyKMzf3S+JziQsYpsIOo/RBu1oqVab1bPQ/VVIaPR1LgYaVXY+mHB1sRQ==
X-Received: by 2002:a05:6a21:150a:b0:1f3:3771:d3c with SMTP id adf61e73a8af0-1f337710ebemr7591568637.24.1741090795660;
        Tue, 04 Mar 2025 04:19:55 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de1a488sm9859550a12.27.2025.03.04.04.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:19:55 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 05/14] xwayland: Fix CVE-2024-31083
Date: Tue,  4 Mar 2025 17:49:09 +0530
Message-Id: <20250304121918.147345-5-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304121918.147345-1-vanusuri@mvista.com>
References: <20250304121918.147345-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 12:20:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212270

From: Vijay Anusuri <vanusuri@mvista.com>

The patches are copied from xserver-xorg recipe.
CVE reported for both and patches apply on both.

Upstream-Commit:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/bdca6c3d1f5057ee & https://gitlab.freedesktop.org/xorg/xserver/-/commit/337d8d48b618d4fc

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


