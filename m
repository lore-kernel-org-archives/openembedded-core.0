Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Thycz-00007c-Q6
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 09:22:18 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 10 Dec 2012 00:07:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,250,1355126400"; d="scan'208";a="178804532"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Dec 2012 00:07:46 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Dec 2012 10:08:12 +0200
Message-Id: <325f04aea797fa646eacaf756b179aad33ca0ce8.1355126594.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1355126594.git.constantinx.musca@intel.com>
References: <cover.1355126594.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1355126594.git.constantinx.musca@intel.com>
References: <cover.1355126594.git.constantinx.musca@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] pixman: upgrade to 0.28.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Dec 2012 08:22:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Generic-C-implementation-of-pixman_blt-with-overlapp.patch:
    - adapted to the new version
* enable nativesdk variant

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 ...plementation-of-pixman_blt-with-overlapp.patch} | 131 ++++++++++-----------
 .../{pixman_0.27.2.bb => pixman_0.28.0.bb}         |  10 +-
 2 files changed, 69 insertions(+), 72 deletions(-)
 rename meta/recipes-graphics/xorg-lib/pixman/{0002-Generic-C-implementation-of-pixman_blt-with-overlapp.patch => Generic-C-implementation-of-pixman_blt-with-overlapp.patch} (45%)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.27.2.bb => pixman_0.28.0.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman/0002-Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/meta/recipes-graphics/xorg-lib/pixman/Generic-C-implementation-of-pixman_blt-with-overlapp.patch
similarity index 45%
rename from meta/recipes-graphics/xorg-lib/pixman/0002-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
rename to meta/recipes-graphics/xorg-lib/pixman/Generic-C-implementation-of-pixman_blt-with-overlapp.patch
index abd501a..5ac3228 100644
--- a/meta/recipes-graphics/xorg-lib/pixman/0002-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
+++ b/meta/recipes-graphics/xorg-lib/pixman/Generic-C-implementation-of-pixman_blt-with-overlapp.patch
@@ -1,11 +1,4 @@
-From 211b2bcdb19f86f3868a18520df7dcb4fd122f05 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Sun, 19 Aug 2012 14:48:00 +0200
-Subject: [PATCH 2/2] Generic C implementation of pixman_blt with overlapping
- support
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
+Generic C implementation of pixman_blt with overlapping support
 
 This was ported from meta-oe's patch [1]:
 Uses memcpy/memmove functions to copy pixels, can handle the
@@ -21,31 +14,39 @@ unrealistic case anyway).
 
 [1] http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
 
-Upstream-Status: Unknown - this patch is in meta-oe for a while
-
+Upstream-Status: Pending
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- pixman/pixman-general.c |   21 ++++++++++++++++++---
- pixman/pixman-private.h |   43 +++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 61 insertions(+), 3 deletions(-)
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
-diff --git a/pixman/pixman-general.c b/pixman/pixman-general.c
-index d4b2daa..a86b206 100644
---- a/pixman/pixman-general.c
-+++ b/pixman/pixman-general.c
-@@ -215,9 +215,24 @@ general_blt (pixman_implementation_t *imp,
-              int                      width,
-              int                      height)
- {
--    /* We can't blit unless we have sse2 or mmx */
--
--    return FALSE;
+Index: pixman-0.28.0/pixman/pixman-general.c
+===================================================================
+--- pixman-0.28.0.orig/pixman/pixman-general.c
++++ pixman-0.28.0/pixman/pixman-general.c
+@@ -214,6 +214,41 @@ static const pixman_fast_path_t general_
+     { PIXMAN_OP_NONE }
+ };
+ 
++static pixman_bool_t
++general_blt (pixman_implementation_t *imp,
++             uint32_t *               src_bits,
++             uint32_t *               dst_bits,
++             int                      src_stride,
++             int                      dst_stride,
++             int                      src_bpp,
++             int                      dst_bpp,
++             int                      src_x,
++             int                      src_y,
++             int                      dest_x,
++             int                      dest_y,
++             int                      width,
++             int                      height)
++{
 +    uint8_t *dst_bytes = (uint8_t *)dst_bits;
 +    uint8_t *src_bytes = (uint8_t *)src_bits;
 +    int bpp;
 +
 +    if (src_bpp != dst_bpp || src_bpp & 7)
-+	return FALSE;
++        return FALSE;
 +
 +    bpp = src_bpp >> 3;
 +    width *= bpp;
@@ -58,24 +59,26 @@ index d4b2daa..a86b206 100644
 +                       width,
 +                       height);
 +    return TRUE;
- }
++}
++
+ pixman_implementation_t *
+ _pixman_implementation_create_general (void)
+ {
+@@ -222,6 +257,7 @@ _pixman_implementation_create_general (v
+     _pixman_setup_combiner_functions_32 (imp);
+     _pixman_setup_combiner_functions_float (imp);
+ 
++    imp->blt = general_blt;
+     imp->src_iter_init = general_src_iter_init;
+     imp->dest_iter_init = general_dest_iter_init;
  
- static pixman_bool_t
-diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
-index d5e6a72..c77d256 100644
---- a/pixman/pixman-private.h
-+++ b/pixman/pixman-private.h
-@@ -24,6 +24,7 @@
+Index: pixman-0.28.0/pixman/pixman-private.h
+===================================================================
+--- pixman-0.28.0.orig/pixman/pixman-private.h
++++ pixman-0.28.0/pixman/pixman-private.h
+@@ -1109,6 +1109,45 @@ void pixman_timer_register (pixman_timer
  
- #include "pixman.h"
- #include <time.h>
-+#include <string.h>
- #include <assert.h>
- #include <stdio.h>
- #include <string.h>
-@@ -1096,6 +1097,48 @@ void pixman_timer_register (pixman_timer_t *timer);
- extern const uint8_t linear_to_srgb[4096];
- extern const uint16_t srgb_to_linear[256];
+ #endif /* PIXMAN_TIMERS */
  
 +/* a helper function, can blit 8-bit images with src/dst overlapping support */
 +static inline void
@@ -93,35 +96,29 @@ index d5e6a72..c77d256 100644
 +     * prefetch and perceived as having more tearing.
 +     */
 +    if (src_bytes < dst_bytes + width &&
-+	src_bytes + src_stride * height > dst_bytes)
-+    {
-+	src_bytes += src_stride * height - src_stride;
-+	dst_bytes += dst_stride * height - dst_stride;
-+	dst_stride = -dst_stride;
-+	src_stride = -src_stride;
-+	/* Horizontal scrolling to the left needs memmove */
-+	if (src_bytes + width > dst_bytes)
-+	{
-+	    while (--height >= 0)
-+	    {
-+		memmove (dst_bytes, src_bytes, width);
-+		dst_bytes += dst_stride;
-+		src_bytes += src_stride;
-+	    }
-+	    return;
-+	}
++        src_bytes + src_stride * height > dst_bytes) {
++        src_bytes += src_stride * height - src_stride;
++        dst_bytes += dst_stride * height - dst_stride;
++        dst_stride = -dst_stride;
++        src_stride = -src_stride;
++
++        /* Horizontal scrolling to the left needs memmove */
++        if (src_bytes + width > dst_bytes) {
++            while (--height >= 0) {
++                memmove (dst_bytes, src_bytes, width);
++                dst_bytes += dst_stride;
++                src_bytes += src_stride;
++            }
++            return;
++        }
 +    }
-+    while (--height >= 0)
-+    {
-+	memcpy (dst_bytes, src_bytes, width);
-+	dst_bytes += dst_stride;
-+	src_bytes += src_stride;
++    while (--height >= 0) {
++        memcpy (dst_bytes, src_bytes, width);
++        dst_bytes += dst_stride;
++        src_bytes += src_stride;
 +    }
 +}
 +
  #endif /* __ASSEMBLER__ */
  
  #endif /* PIXMAN_PRIVATE_H */
--- 
-1.7.4.4
-
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.28.0.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.28.0.bb
index 218808a..a3012f9 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.28.0.bb
@@ -13,9 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
                     file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \
                    "
 DEPENDS += "zlib libpng"
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
-PR = "r2"
+PR = "r0"
 
 PE = "1"
 
@@ -30,7 +30,7 @@ EXTRA_OECONF_class-native = "--disable-gtk"
 
 SRC_URI += "\
             file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
-            file://0002-Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
+            file://Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
 "
-SRC_URI[md5sum] = "dd67154b23d88e6a75ad3a83f3052198"
-SRC_URI[sha256sum] = "cae9dc13727a84f11beb150c88d3a06ba114f82c52d68073c663c027e099123b"
+SRC_URI[md5sum] = "703c3f62437b161c610056e076560570"
+SRC_URI[sha256sum] = "6056f9aa0e0578a0492e34fc2ce6dd7bfb181090ed687993c03b969c8cec4828"
-- 
1.7.11.7



