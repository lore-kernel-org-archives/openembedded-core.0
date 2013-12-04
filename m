Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 865B26DF3E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 15:35:53 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id x13so15179173wgg.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 07:35:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=+H/U0hgrJgJpz8SD2jsv94TSvhUtWtl8JcyK98CeA7c=;
	b=JG9Wu91TwfHqUBU+ISMA3wT5OvEB1Su8sbzDLgul2u0eGulUXWaJQ5dXIvQxfe8diR
	ocvZ/RiHlEeMlk+teeYfUhMBfkCh7FzTwE+EcS/VXoBMcsxRFsqmTOehG6iHpIsFC4KJ
	LzXWk8bIxpvlYg0VfhdExTzKpz4bSKXtt8FTBcjqSRWxbjGLq+VQpbJp3u4lEnrUozZD
	XH9HkgG4A4VOkMSiGpJY6Ix5InJvYUQ2+lIkhnIF93bNdOBhJQH1lK/P7y+DhJEr1Gve
	IW4EUgG5vg2Ba2RhdowOVjuZTPdVxAXRsjhBA8cSxeZfIGFAKUUGZsyoMBD91roejOom
	ms2Q==
X-Gm-Message-State: ALoCoQmSipOOonflRsStuM3i8n+sOtTfjW97OxneOJpvdFkUs72dN2rGw1as4lspkjeJIwoK2Qna
X-Received: by 10.194.23.201 with SMTP id o9mr8047516wjf.67.1386171352492;
	Wed, 04 Dec 2013 07:35:52 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id f11sm7982684wic.4.2013.12.04.07.35.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 07:35:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 15:35:41 +0000
Message-Id: <1386171342-7213-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386171342-7213-1-git-send-email-ross.burton@intel.com>
References: <1386171342-7213-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] pixman: upgrade to 0.32.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Dec 2013 15:35:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop the generic C implementation of pixman_blt patch, upstream refuses to
accept generic implementations as the policy is that the caller provides generic
paths, and this patch was only used in conjunction with a matching patch in
xserver-xorg which we don't carry anymore.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...mplementation-of-pixman_blt-with-overlapp.patch |  124 --------------------
 .../{pixman_0.30.2.bb => pixman_0.32.4.bb}         |    5 +-
 2 files changed, 2 insertions(+), 127 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/Generic-C-implementation-of-pixman_blt-with-overlapp.patch
 rename meta/recipes-graphics/xorg-lib/{pixman_0.30.2.bb => pixman_0.32.4.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman/Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/meta/recipes-graphics/xorg-lib/pixman/Generic-C-implementation-of-pixman_blt-with-overlapp.patch
deleted file mode 100644
index 5ac3228..0000000
--- a/meta/recipes-graphics/xorg-lib/pixman/Generic-C-implementation-of-pixman_blt-with-overlapp.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-Generic C implementation of pixman_blt with overlapping support
-
-This was ported from meta-oe's patch [1]:
-Uses memcpy/memmove functions to copy pixels, can handle the
-case when both source and destination areas are in the same
-image (this is useful for scrolling).
-
-It is assumed that copying direction is only important when
-using the same image for both source and destination (and
-src_stride == dst_stride). Copying direction is undefined
-for the images with different source and destination stride
-which happen to be in the overlapped areas (but this is an
-unrealistic case anyway).
-
-[1] http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
-
-Upstream-Status: Pending
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-
-Index: pixman-0.28.0/pixman/pixman-general.c
-===================================================================
---- pixman-0.28.0.orig/pixman/pixman-general.c
-+++ pixman-0.28.0/pixman/pixman-general.c
-@@ -214,6 +214,41 @@ static const pixman_fast_path_t general_
-     { PIXMAN_OP_NONE }
- };
- 
-+static pixman_bool_t
-+general_blt (pixman_implementation_t *imp,
-+             uint32_t *               src_bits,
-+             uint32_t *               dst_bits,
-+             int                      src_stride,
-+             int                      dst_stride,
-+             int                      src_bpp,
-+             int                      dst_bpp,
-+             int                      src_x,
-+             int                      src_y,
-+             int                      dest_x,
-+             int                      dest_y,
-+             int                      width,
-+             int                      height)
-+{
-+    uint8_t *dst_bytes = (uint8_t *)dst_bits;
-+    uint8_t *src_bytes = (uint8_t *)src_bits;
-+    int bpp;
-+
-+    if (src_bpp != dst_bpp || src_bpp & 7)
-+        return FALSE;
-+
-+    bpp = src_bpp >> 3;
-+    width *= bpp;
-+    src_stride *= 4;
-+    dst_stride *= 4;
-+    pixman_blt_helper (src_bytes + src_y * src_stride + src_x * bpp,
-+                       dst_bytes + dest_y * dst_stride + dest_x * bpp,
-+                       src_stride,
-+                       dst_stride,
-+                       width,
-+                       height);
-+    return TRUE;
-+}
-+
- pixman_implementation_t *
- _pixman_implementation_create_general (void)
- {
-@@ -222,6 +257,7 @@ _pixman_implementation_create_general (v
-     _pixman_setup_combiner_functions_32 (imp);
-     _pixman_setup_combiner_functions_float (imp);
- 
-+    imp->blt = general_blt;
-     imp->src_iter_init = general_src_iter_init;
-     imp->dest_iter_init = general_dest_iter_init;
- 
-Index: pixman-0.28.0/pixman/pixman-private.h
-===================================================================
---- pixman-0.28.0.orig/pixman/pixman-private.h
-+++ pixman-0.28.0/pixman/pixman-private.h
-@@ -1109,6 +1109,45 @@ void pixman_timer_register (pixman_timer
- 
- #endif /* PIXMAN_TIMERS */
- 
-+/* a helper function, can blit 8-bit images with src/dst overlapping support */
-+static inline void
-+pixman_blt_helper (uint8_t *src_bytes,
-+                   uint8_t *dst_bytes,
-+                   int      src_stride,
-+                   int      dst_stride,
-+                   int      width,
-+                   int      height)
-+{
-+    /*
-+     * The second part of this check is not strictly needed, but it prevents
-+     * unnecessary upside-down processing of areas which belong to different
-+     * images. Upside-down processing can be slower with fixed-distance-ahead
-+     * prefetch and perceived as having more tearing.
-+     */
-+    if (src_bytes < dst_bytes + width &&
-+        src_bytes + src_stride * height > dst_bytes) {
-+        src_bytes += src_stride * height - src_stride;
-+        dst_bytes += dst_stride * height - dst_stride;
-+        dst_stride = -dst_stride;
-+        src_stride = -src_stride;
-+
-+        /* Horizontal scrolling to the left needs memmove */
-+        if (src_bytes + width > dst_bytes) {
-+            while (--height >= 0) {
-+                memmove (dst_bytes, src_bytes, width);
-+                dst_bytes += dst_stride;
-+                src_bytes += src_stride;
-+            }
-+            return;
-+        }
-+    }
-+    while (--height >= 0) {
-+        memcpy (dst_bytes, src_bytes, width);
-+        dst_bytes += dst_stride;
-+        src_bytes += src_stride;
-+    }
-+}
-+
- #endif /* __ASSEMBLER__ */
- 
- #endif /* PIXMAN_PRIVATE_H */
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.30.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.32.4.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-lib/pixman_0.30.2.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.32.4.bb
index 36d9b2d..d1f3df7 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.30.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.32.4.bb
@@ -29,8 +29,7 @@ EXTRA_OECONF_class-native = "--disable-gtk"
 
 SRC_URI += "\
             file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
-            file://Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
 "
 
-SRC_URI[md5sum] = "2d0588e20dc1308b29b2fca68dad9a9c"
-SRC_URI[sha256sum] = "4fbb51788fe7cbd8abb5f80aed95ec878704e57a06328f7bebe0306e3822c96c"
+SRC_URI[md5sum] = "cdb566504fe9daf6728c7b03cc7ea228"
+SRC_URI[sha256sum] = "ae2bd664057e330d41b40336ed296d3512318ce7f2401cc42601f2613d371e4c"
-- 
1.7.10.4


