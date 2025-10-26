Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A41CCF9EC
	for <webhook@archiver.kernel.org>; Sun, 26 Oct 2025 18:07:57 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.15355.1761502071981864988
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Oct 2025 11:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DyXYIKpM;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-290d14e5c9aso53622835ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Oct 2025 11:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761502071; x=1762106871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sa/++JriStaHdZKFPZSNmgHSAXn3uWvGQL74Lh+P/7U=;
        b=DyXYIKpMKEcPkODoX4DOjgg1KHlAP0oCke3Uyw3M2aXj4T0j5HXHUy/wrF/RGFPdx4
         5xgUPvqu4tj1HZ1rLJ5UwYAsEqs/vn9S9oJ/aLESN8UJ9tM+YaLzFBRFBUs8fsTk+xJ1
         wPXStMoVg6hFEum/jlSP5CotQYqSwsB24lzVe0eBcPBSEaFq7yG/7EoY4iiX7KlSYlhn
         5Ktvv0rAcIDQhEj3xcTo6CbxC21AWRHjWRQRFGdostL4oBeFZJ2XJn9K2FTk7vi09DMB
         jV1zSgOm3AL39ZLrU1LF+ycoVEqTLn62aWJbCV8VMVWjMY5yqCutchbFaSpIf/XmsT1r
         JEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761502071; x=1762106871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sa/++JriStaHdZKFPZSNmgHSAXn3uWvGQL74Lh+P/7U=;
        b=spEFPFxbFES17o8CCKFq7lvdvcXV71KxwtIdAuqVZcLrMbyUJB94PnS20m3MguAWsW
         /wDUGkz3wP1tSaPJH3YK2n2VU8nacBwA3EPPlkilex8+UimE3xnldK39rRc/+ehkJSYB
         8aWQIdSllh9KiqzZGflsQzgjZ8bAOC5VbKiUPZ9zrtrz9DgyasHpqhB+/ZT+Gea+ps2p
         c4snt3fYYmKMV0P6/KC2p5v4/JjpcFTQH8DlDhegiHpOwZwiTGJP3f83t801SNvPUvNl
         0ceE/eQgHFlnfpROA4twQf5EV23KD6G0ib7+BOViwY0SDAgglWMQLSYBQJl9wkZWb/+G
         z87g==
X-Gm-Message-State: AOJu0Yz+UPwNnM6z/RQNQRfI6NUucEAq1H84V+ZXl8lG4uMdX72CIvue
	jHTIrpYg0bEVm6UG6B82D2BMCZlsNGtYRQOGf1V78kPsZcX8arJmRfTlPVnhMBVB
X-Gm-Gg: ASbGncvvbUhHIlTRbJcsnj0Pwp51bpo6YXSOmEYW7/OQFu+KAPEkc3I/bB0OEYrnLYt
	KAr5kz8MtKhmXcz0zXr3oo79hApZbhPEAkCNIV9bXHj2xbv1TBbAM/DIzOjtfyb9IZpaPaojW/5
	7wNglm67rFIIOSXfWcVfKsLb4jDIbWEO0DTv3rTcNn5L5Qtno8AqOdvjWjot0qZeFqp8EyAmYPr
	eX/RbxBV3f26baMMJ2N/ld/A+qBTcbZ4EdTGP4v+iGIH8uM275gKYwsy68bE7NRXLEs9EqMZB3t
	byk1g8VmiP5UBPbOMgH/QIFjS1g0SUsqiJ1HHodLhn1Saa7sU6TObC/gVj9TlbE3wlrrP4y6kyz
	dXVDmFTMRUV8fmktmUaHr72JhsJx3xZE07fOR/FETNxOOiT7DFKABQN4bj1Dc5wngp1gp7Js71j
	hd+JyZGB5MW4ULw57kVCRV9iFkPHTANGo/UJi1drKv3ZygezNUav3HjvgeBUmoCw==
X-Google-Smtp-Source: AGHT+IGJHMsuhU/lvzz5zU08+X4DqSvPQyjEMD2h+GgiGG6iRIfPxxAfL1/y3ViguJTNbGpKrsV9oQ==
X-Received: by 2002:a17:902:ccd2:b0:24c:e6fa:2a38 with SMTP id d9443c01a7336-290c9cf2cadmr430168935ad.25.1761502070954;
        Sun, 26 Oct 2025 11:07:50 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::9dbe])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e4113fsm54871745ad.90.2025.10.26.11.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 11:07:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/2] pkgconfig: Fix bundled glib build with clang
Date: Sun, 26 Oct 2025 11:07:47 -0700
Message-ID: <20251026180748.2624488-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Oct 2025 18:07:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225316

This snapshot needs some backports from upstreamed adapted to it
this patch is also submitted to pkgconfig mailing lists already

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use a patch instead of enforcing gcc for host compiler

 ...e-g-u-intptr-atomics-in-builtin-glib.patch | 157 ++++++++++++++++++
 .../pkgconfig/pkgconfig_git.bb                |   1 +
 2 files changed, 158 insertions(+)
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-Backport-g-s-size-g-u-intptr-atomics-in-builtin-glib.patch

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-Backport-g-s-size-g-u-intptr-atomics-in-builtin-glib.patch b/meta/recipes-devtools/pkgconfig/pkgconfig/0001-Backport-g-s-size-g-u-intptr-atomics-in-builtin-glib.patch
new file mode 100644
index 00000000000..8c5e24247b0
--- /dev/null
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/0001-Backport-g-s-size-g-u-intptr-atomics-in-builtin-glib.patch
@@ -0,0 +1,157 @@
+From 5fb4ae80ae13ae134a33804b1938af0e9f27a222 Mon Sep 17 00:00:00 2001
+From: Dan Fuhry <dan@fuhry.com>
+Date: Sun, 26 Oct 2025 09:09:07 -0700
+Subject: [PATCH] Backport g(s)size -> g(u)intptr atomics in builtin glib for
+ gcc14 and clang15
+
+pkg-config 0.29.2 doesn't build on clang 15 and up and
+gcc 14 and up, due to -Wint-conversion now defaulting to being an error in
+both compilers. The old version of glib 2.36 bundled with pkg-config uses
+gssize/gssize as the return type of the g_atomic_pointer_* functions, which
+newer versions of gcc and clang complain (rightly) is not portable (as
+these are aliased to long and ulong, respectively).
+
+This was previously addressed in glib upstream commit c762d511 [1] by Alex
+Richardson on Dec 14, 2022. The attached patch backports Alex's change to
+glib 2.36 bundled with pkg-config, and also switches to the newer
+__atomic_* intrinsics from commit 2eb37622 [2] (Philip Withnall).
+
+This patch has been tested on clang 17 and only clang 17.
+
+[1]
+https://gitlab.gnome.org/GNOME/glib/-/commit/c762d511346d3cb84cea3557a246ccf8873b4a1c
+[2]
+https://gitlab.gnome.org/GNOME/glib/-/commit/2eb37622418a5c9f31a9d728a99bc621d3157ab0
+
+Upstream-Status: Submitted [https://lists.freedesktop.org/archives/pkg-config/2024-May/001122.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ glib/glib/gatomic.c | 14 +++++++-------
+ glib/glib/gatomic.h | 34 ++++++++++++++++++++--------------
+ 2 files changed, 27 insertions(+), 21 deletions(-)
+
+diff --git a/glib/glib/gatomic.c b/glib/glib/gatomic.c
+index eb2fe46..c0609eb 100644
+--- a/glib/glib/gatomic.c
++++ b/glib/glib/gatomic.c
+@@ -385,7 +385,7 @@ gboolean
+  *
+  * Since: 2.30
+  **/
+-gssize
++gintptr
+ (g_atomic_pointer_add) (volatile void *atomic,
+                         gssize         val)
+ {
+@@ -409,11 +409,11 @@ gssize
+  *
+  * Since: 2.30
+  **/
+-gsize
++guintptr
+ (g_atomic_pointer_and) (volatile void *atomic,
+                         gsize          val)
+ {
+-  return g_atomic_pointer_and ((volatile gpointer *) atomic, val);
++  return g_atomic_pointer_and ((gpointer *) atomic, val);
+ }
+
+ /**
+@@ -433,11 +433,11 @@ gsize
+  *
+  * Since: 2.30
+  **/
+-gsize
++guintptr
+ (g_atomic_pointer_or) (volatile void *atomic,
+                        gsize          val)
+ {
+-  return g_atomic_pointer_or ((volatile gpointer *) atomic, val);
++  return g_atomic_pointer_or ((gpointer *) atomic, val);
+ }
+
+ /**
+@@ -457,11 +457,11 @@ gsize
+  *
+  * Since: 2.30
+  **/
+-gsize
++guintptr
+ (g_atomic_pointer_xor) (volatile void *atomic,
+                         gsize          val)
+ {
+-  return g_atomic_pointer_xor ((volatile gpointer *) atomic, val);
++  return g_atomic_pointer_xor ((gpointer *) atomic, val);
+ }
+
+ #elif defined (G_PLATFORM_WIN32)
+diff --git a/glib/glib/gatomic.h b/glib/glib/gatomic.h
+index e7fd1f2..124a3dd 100644
+--- a/glib/glib/gatomic.h
++++ b/glib/glib/gatomic.h
+@@ -66,16 +66,16 @@ gboolean                g_atomic_pointer_compare_and_exchange (volatile void  *a
+                                                                gpointer        oldval,
+                                                                gpointer        newval);
+ GLIB_AVAILABLE_IN_ALL
+-gssize                  g_atomic_pointer_add                  (volatile void  *atomic,
++gintptr                 g_atomic_pointer_add                  (volatile void  *atomic,
+                                                                gssize          val);
+ GLIB_AVAILABLE_IN_2_30
+-gsize                   g_atomic_pointer_and                  (volatile void  *atomic,
++guintptr                g_atomic_pointer_and                  (volatile void  *atomic,
+                                                                gsize           val);
+ GLIB_AVAILABLE_IN_2_30
+-gsize                   g_atomic_pointer_or                   (volatile void  *atomic,
++guintptr                g_atomic_pointer_or                   (volatile void  *atomic,
+                                                                gsize           val);
+ GLIB_AVAILABLE_IN_ALL
+-gsize                   g_atomic_pointer_xor                  (volatile void  *atomic,
++guintptr                g_atomic_pointer_xor                  (volatile void  *atomic,
+                                                                gsize           val);
+
+ GLIB_DEPRECATED_IN_2_30_FOR(g_atomic_add)
+@@ -167,28 +167,34 @@ G_END_DECLS
+     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gpointer));                 \
+     (void) (0 ? (gpointer) *(atomic) : 0);                                   \
+     (void) (0 ? (val) ^ (val) : 0);                                          \
+-    (gssize) __sync_fetch_and_add ((atomic), (val));                         \
++    (guintptr) __atomic_fetch_add ((atomic), (val), __ATOMIC_SEQ_CST);        \
+   }))
+ #define g_atomic_pointer_and(atomic, val) \
+   (G_GNUC_EXTENSION ({                                                          \
++    guintptr *gapa_atomic = (guintptr *) atomic;                             \
+     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gpointer));                 \
+-    (void) (0 ? (gpointer) *(atomic) : 0);                                   \
+-    (void) (0 ? (val) ^ (val) : 0);                                          \
+-    (gsize) __sync_fetch_and_and ((atomic), (val));                          \
++    G_STATIC_ASSERT (sizeof *(atomic) == sizeof (guintptr));                 \
++    (void) (0 ? (gpointer) *(atomic) : NULL);                                   \
++    (void) (0 ? (val) ^ (val) : 1);                                          \
++    (guintptr) __atomic_fetch_and (gapa_atomic, (val), __ATOMIC_SEQ_CST);        \
+   }))
+ #define g_atomic_pointer_or(atomic, val) \
+   (G_GNUC_EXTENSION ({                                                          \
++    guintptr *gapa_atomic = (guintptr *) atomic;                             \
+     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gpointer));                 \
+-    (void) (0 ? (gpointer) *(atomic) : 0);                                   \
+-    (void) (0 ? (val) ^ (val) : 0);                                          \
+-    (gsize) __sync_fetch_and_or ((atomic), (val));                           \
++    G_STATIC_ASSERT (sizeof *(atomic) == sizeof (guintptr));                 \
++    (void) (0 ? (gpointer) *(atomic) : NULL);                                   \
++    (void) (0 ? (val) ^ (val) : 1);                                          \
++    (guintptr) __atomic_fetch_or (gapa_atomic, (val), __ATOMIC_SEQ_CST);        \
+   }))
+ #define g_atomic_pointer_xor(atomic, val) \
+   (G_GNUC_EXTENSION ({                                                          \
++    guintptr *gapa_atomic = (guintptr *) atomic;                             \
+     G_STATIC_ASSERT (sizeof *(atomic) == sizeof (gpointer));                 \
+-    (void) (0 ? (gpointer) *(atomic) : 0);                                   \
+-    (void) (0 ? (val) ^ (val) : 0);                                          \
+-    (gsize) __sync_fetch_and_xor ((atomic), (val));                          \
++    G_STATIC_ASSERT (sizeof *(atomic) == sizeof (guintptr));                 \
++    (void) (0 ? (gpointer) *(atomic) : NULL);                                   \
++    (void) (0 ? (val) ^ (val) : 1);                                          \
++    (guintptr) __atomic_fetch_xor (gapa_atomic, (val), __ATOMIC_SEQ_CST);        \
+   }))
+
+ #else /* defined(G_ATOMIC_LOCK_FREE) && defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4) */
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index f537c635ef2..19b9b6bc9de 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://gitlab.freedesktop.org/pkg-config/pkg-config.git;branch=master;
            file://pkg-config-native.in \
            file://0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch \
            file://0001-Do-not-use-bool-as-a-field-name.patch \
+		   file://0001-Backport-g-s-size-g-u-intptr-atomics-in-builtin-glib.patch \
            "

 inherit autotools

