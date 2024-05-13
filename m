Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7842EC25B79
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 12:18:29 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.58494.1715602701990650139
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 05:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RoJM73SF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e50a04c317so22271425ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 05:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715602701; x=1716207501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRFSOynMZXZsQQNt7BAW4VbYkJIH/6jY0ck+JPNbLwE=;
        b=RoJM73SF98Y2e4qXVPU4YrSxI+AUYn+teUGvJ7xsPtBOInOpkdhoj345SF2HHvNSpn
         Er/n3g+yuajQ2tgZuIMKayk8lNMFrd43lshAOOo859GBsLZxymCPWAR4xz7cZo8nhMdm
         +lLGCu6Q605+rdHOkQ7A+ZbqsdmZqPwoELkGoNNLRIot2t4pC4x1KMFH6QnBbJ0DPpZD
         97UzlAj9vHJHPzywW71iA7pmgw1H+5s21tbzL+5sHQdhv9NzMI73oO1nfLTa8KhkERSD
         Ih7onxTjV738F7SKLb1dNnnFhbn0tMGv7FX6IOwjY0DqkAWGN8yu+FW/Ee/NWRk5D41m
         2zkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715602701; x=1716207501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRFSOynMZXZsQQNt7BAW4VbYkJIH/6jY0ck+JPNbLwE=;
        b=bT6V2GfvV3TsuZti+cZvAIuumFu546xv72G/M8m6RLxecv+JpzT/HbvnZ1yMOHvvqt
         nD7O7sLpdTaI07W8wpaCDOXR9JVTvnq3Bd0sBlXGGuqi7nuh6CLy1GCHGIIsv8pei4PA
         MKpQc4RaRwJJtyH5UsWPYPHW0Ti7AFBKfuxG4iSGsDFTzUQeAi6wImQAc9+b/ZgPE8ix
         7L/rsTwYcPA+XiPADmpCvWGcn6ggW+LXm0ujXdJz/FIBJHQjGLm1hdYoIXSttgBLsvoB
         fuFv5ojR/XgO3zhQdUuFmWU0HKpAoOQt7cZX0X0TbrvbYwFKhV6sxqXgRmkF1ozXTVaE
         PdAg==
X-Gm-Message-State: AOJu0YzD2vhS0to6fC6AOgRfbpyTHXdWkiHWGI784RcbDC0YeqafHnW+
	UDxvlAJq5T+qP25VxGAKX5u3OilWQqgydm8RmvU9zJICyAb+SFZFlgQ/tlCuPvflUnrF3qR04/T
	UVok=
X-Google-Smtp-Source: AGHT+IFBBFEb9ndjADTHcB3SSUhpVefL8ZcNjVGYayYHQonDz4CdyNXy60BzJDxPmAJ64p6LAiXuww==
X-Received: by 2002:a17:903:1ce:b0:1e3:d4eb:a0f2 with SMTP id d9443c01a7336-1ef4404956emr109939085ad.51.1715602701052;
        Mon, 13 May 2024 05:18:21 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf30b85sm77599225ad.181.2024.05.13.05.18.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 05:18:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/6] xserver-xorg: fix CVE-2024-31083
Date: Mon, 13 May 2024 05:18:08 -0700
Message-Id: <cc2d9275203ad9489da43ff4e1f0983c00f235fd.1715602539.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715602539.git.steve@sakoman.com>
References: <cover.1715602539.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 12:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199234

From: Archana Polampalli <archana.polampalli@windriver.com>

FreeGlyph() function declared in render/glyphstr_priv.h, it is not present in
current recipe version and introduced in later versions, added this change to
render/glyphstr.h

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xserver-xorg/CVE-2024-31083-0001.patch    | 117 ++++++++++++++++++
 .../xserver-xorg/CVE-2024-31083-0002.patch    |  76 ++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |   2 +
 3 files changed, 195 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31083-0001.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31083-0002.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31083-0001.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31083-0001.patch
new file mode 100644
index 0000000000..1ef9d933ae
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31083-0001.patch
@@ -0,0 +1,117 @@
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31083-0002.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31083-0002.patch
new file mode 100644
index 0000000000..3cea29f001
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31083-0002.patch
@@ -0,0 +1,76 @@
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 0a8cb7d81a..fe577050d9 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -19,6 +19,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2024-31080.patch \
            file://CVE-2024-31081.patch \
            file://CVE-2024-31082.patch \
+           file://CVE-2024-31083-0001.patch \
+           file://CVE-2024-31083-0002.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.34.1


