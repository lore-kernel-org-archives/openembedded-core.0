Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T94FS-00025K-3c
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 03:17:42 +0200
Received: by weyr6 with SMTP id r6so4553953wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2012 18:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=DgM5xrskm/94mFxc4jopthnJ32G6aemGlJxR1kkdxOw=;
	b=m+nMg3cA4eBJBCJbAeGMXNWeFtszpOjJ19qh9Cgc4GCdD7QgdUX+zXSG4Mvd4mbUR+
	yrh4vWZTjnbp2AR9z561vhsTUvcfCjqQ9/yQPvvOYmNI8u5Gom/f3+0Wor6ANKuzaRzu
	iuhqGyENmmQIZRlfgswYMfkVnYODDR8UYGOqSeVg7bLu0AxwCprSYwW9tUXlCg3H8X0U
	TNsn9VjtDXN0J3yOOQt0B3X2V7YhGwU5lLebOWJ+EXTHrzNjHyNfBspBwODWvCPQtJAr
	Hq8MapcH10Qp2NBGp2nCXsNGeWw6WvBkwrc9XF63JutZLk9n2hSatiEdv6RmM9dT1lwW
	6I5A==
Received: by 10.216.134.20 with SMTP id r20mr1180wei.61.1346807119700;
	Tue, 04 Sep 2012 18:05:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r9sm41195136wia.2.2012.09.04.18.05.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 18:05:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2012 03:05:36 +0200
Message-Id: <1346807137-4231-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
MIME-Version: 1.0
Subject: [PATCH 1/2] pixman: merge meta-oe append into oe-core
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
X-List-Received-Date: Wed, 05 Sep 2012 01:17:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

* neon configuration settings included
* patches were aligned to 0.27.2.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...lated-workarounds-in-cpu-features-detecti.patch | 144 +++++++++++++++++++++
 ...mplementation-of-pixman_blt-with-overlapp.patch | 127 ++++++++++++++++++
 meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb    |  11 +-
 3 files changed, 280 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0002-Generic-C-implementation-of-pixman_blt-with-overlapp.patch

diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch b/meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
new file mode 100644
index 0000000..4569dca
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
@@ -0,0 +1,144 @@
+From a0f53e1dbb3851bb0f0efcfdbd565b05e4be9cac Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 23 Aug 2012 18:10:57 +0200
+Subject: [PATCH 1/2] ARM: qemu related workarounds in cpu features detection
+ code
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This was ported from meta-oe's patch [1]. The original pixman patch is found
+at [2].
+
+[1] http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
+[2] http://lists.freedesktop.org/archives/pixman/2011-January/000906.html
+
+Upstream-Status: Inappropriate [other] qemu fix
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ pixman/pixman-arm.c |   82 ++++++++++++++++++++++++++++++++++++++++----------
+ 1 files changed, 65 insertions(+), 17 deletions(-)
+
+diff --git a/pixman/pixman-arm.c b/pixman/pixman-arm.c
+index 23374e4..d98bda6 100644
+--- a/pixman/pixman-arm.c
++++ b/pixman/pixman-arm.c
+@@ -129,16 +129,35 @@ detect_cpu_features (void)
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/mman.h>
++#include <sys/utsname.h>
+ #include <fcntl.h>
+ #include <string.h>
+ #include <elf.h>
+ 
++/*
++ * The whole CPU capabilities detection is a bit ugly: when running in
++ * userspace qemu, we see /proc/self/auxv from the host system. To make
++ * everything even worse, the size of each value is 64-bit when running
++ * on a 64-bit host system. So the data is totally bogus because we expect
++ * 32-bit values. As AT_PLATFORM value is used as a pointer, it may cause
++ * segfault (null pointer dereference on x86-64 host). So in order to be
++ * on a safe side, we require that AT_PLATFORM value is found only once,
++ * and it has non-zero value (this is still not totally reliable for a big
++ * endian 64-bit host system running qemu and may theoretically fail).
++ */
++#define ARM_HWCAP_VFP 64
++#define ARM_HWCAP_IWMMXT 512
++#define ARM_HWCAP_NEON 4096
++
+ static arm_cpu_features_t
+ detect_cpu_features (void)
+ {
+     arm_cpu_features_t features = 0;
+     Elf32_auxv_t aux;
+     int fd;
++    uint32_t hwcap = 0;
++    const char *plat = NULL;
++    int plat_cnt = 0;
+ 
+     fd = open ("/proc/self/auxv", O_RDONLY);
+     if (fd >= 0)
+@@ -147,32 +166,61 @@ detect_cpu_features (void)
+ 	{
+ 	    if (aux.a_type == AT_HWCAP)
+ 	    {
+-		uint32_t hwcap = aux.a_un.a_val;
+-
+-		/* hardcode these values to avoid depending on specific
+-		 * versions of the hwcap header, e.g. HWCAP_NEON
+-		 */
+-		if ((hwcap & 64) != 0)
+-		    features |= ARM_VFP;
+-		if ((hwcap & 512) != 0)
+-		    features |= ARM_IWMMXT;
+-		/* this flag is only present on kernel 2.6.29 */
+-		if ((hwcap & 4096) != 0)
+-		    features |= ARM_NEON;
++		hwcap = aux.a_un.a_val;
+ 	    }
+ 	    else if (aux.a_type == AT_PLATFORM)
+ 	    {
+-		const char *plat = (const char*) aux.a_un.a_val;
+-
+-		if (strncmp (plat, "v7l", 3) == 0)
++		plat = (const char*) aux.a_un.a_val;
++		plat_cnt++;
++	    }
++	}
++	close (fd);
++	if (plat == NULL || plat_cnt != 1 || *plat != 'v')
++	{
++	    /*
++	     * Something seems to be really wrong, most likely we are
++	     * running under qemu. Let's use machine type from "uname" for
++	     * CPU capabilities detection:
++	     * http://www.mail-archive.com/qemu-devel at nongnu.org/msg22212.html
++	     */
++	    struct utsname u;
++	    hwcap = 0; /* clear hwcap, because it is bogus */
++	    if (uname (&u) == 0)
++	    {
++		if (strcmp (u.machine, "armv7l") == 0)
++		{
+ 		    features |= (ARM_V7 | ARM_V6);
+-		else if (strncmp (plat, "v6l", 3) == 0)
++		    hwcap |= ARM_HWCAP_VFP;  /* qemu is supposed to emulate vfp */
++		    hwcap |= ARM_HWCAP_NEON; /* qemu is supposed to emulate neon */
++		}
++		else if (strcmp (u.machine, "armv6l") == 0)
++		{
+ 		    features |= ARM_V6;
++		    hwcap |= ARM_HWCAP_VFP;  /* qemu is supposed to emulate vfp */
++		}
+ 	    }
+ 	}
+-	close (fd);
++	else if (strncmp (plat, "v7l", 3) == 0)
++	{
++	    features |= (ARM_V7 | ARM_V6);
++	}
++	else if (strncmp (plat, "v6l", 3) == 0)
++	{
++	    features |= ARM_V6;
++	}
+     }
+ 
++    /* hardcode these values to avoid depending on specific
++     * versions of the hwcap header, e.g. HWCAP_NEON
++     */
++    if ((hwcap & ARM_HWCAP_VFP) != 0)
++        features |= ARM_VFP;
++    if ((hwcap & ARM_HWCAP_IWMMXT) != 0)
++        features |= ARM_IWMMXT;
++    /* this flag is only present on kernel 2.6.29 */
++    if ((hwcap & ARM_HWCAP_NEON) != 0)
++        features |= ARM_NEON;
++
+     return features;
+ }
+ 
+-- 
+1.7.6.5
+
diff --git a/meta/recipes-graphics/xorg-lib/pixman/0002-Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/meta/recipes-graphics/xorg-lib/pixman/0002-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
new file mode 100644
index 0000000..abd501a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/pixman/0002-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
@@ -0,0 +1,127 @@
+From 211b2bcdb19f86f3868a18520df7dcb4fd122f05 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sun, 19 Aug 2012 14:48:00 +0200
+Subject: [PATCH 2/2] Generic C implementation of pixman_blt with overlapping
+ support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This was ported from meta-oe's patch [1]:
+Uses memcpy/memmove functions to copy pixels, can handle the
+case when both source and destination areas are in the same
+image (this is useful for scrolling).
+
+It is assumed that copying direction is only important when
+using the same image for both source and destination (and
+src_stride == dst_stride). Copying direction is undefined
+for the images with different source and destination stride
+which happen to be in the overlapped areas (but this is an
+unrealistic case anyway).
+
+[1] http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
+
+Upstream-Status: Unknown - this patch is in meta-oe for a while
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ pixman/pixman-general.c |   21 ++++++++++++++++++---
+ pixman/pixman-private.h |   43 +++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 61 insertions(+), 3 deletions(-)
+
+diff --git a/pixman/pixman-general.c b/pixman/pixman-general.c
+index d4b2daa..a86b206 100644
+--- a/pixman/pixman-general.c
++++ b/pixman/pixman-general.c
+@@ -215,9 +215,24 @@ general_blt (pixman_implementation_t *imp,
+              int                      width,
+              int                      height)
+ {
+-    /* We can't blit unless we have sse2 or mmx */
+-
+-    return FALSE;
++    uint8_t *dst_bytes = (uint8_t *)dst_bits;
++    uint8_t *src_bytes = (uint8_t *)src_bits;
++    int bpp;
++
++    if (src_bpp != dst_bpp || src_bpp & 7)
++	return FALSE;
++
++    bpp = src_bpp >> 3;
++    width *= bpp;
++    src_stride *= 4;
++    dst_stride *= 4;
++    pixman_blt_helper (src_bytes + src_y * src_stride + src_x * bpp,
++                       dst_bytes + dest_y * dst_stride + dest_x * bpp,
++                       src_stride,
++                       dst_stride,
++                       width,
++                       height);
++    return TRUE;
+ }
+ 
+ static pixman_bool_t
+diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
+index d5e6a72..c77d256 100644
+--- a/pixman/pixman-private.h
++++ b/pixman/pixman-private.h
+@@ -24,6 +24,7 @@
+ 
+ #include "pixman.h"
+ #include <time.h>
++#include <string.h>
+ #include <assert.h>
+ #include <stdio.h>
+ #include <string.h>
+@@ -1096,6 +1097,48 @@ void pixman_timer_register (pixman_timer_t *timer);
+ extern const uint8_t linear_to_srgb[4096];
+ extern const uint16_t srgb_to_linear[256];
+ 
++/* a helper function, can blit 8-bit images with src/dst overlapping support */
++static inline void
++pixman_blt_helper (uint8_t *src_bytes,
++                   uint8_t *dst_bytes,
++                   int      src_stride,
++                   int      dst_stride,
++                   int      width,
++                   int      height)
++{
++    /*
++     * The second part of this check is not strictly needed, but it prevents
++     * unnecessary upside-down processing of areas which belong to different
++     * images. Upside-down processing can be slower with fixed-distance-ahead
++     * prefetch and perceived as having more tearing.
++     */
++    if (src_bytes < dst_bytes + width &&
++	src_bytes + src_stride * height > dst_bytes)
++    {
++	src_bytes += src_stride * height - src_stride;
++	dst_bytes += dst_stride * height - dst_stride;
++	dst_stride = -dst_stride;
++	src_stride = -src_stride;
++	/* Horizontal scrolling to the left needs memmove */
++	if (src_bytes + width > dst_bytes)
++	{
++	    while (--height >= 0)
++	    {
++		memmove (dst_bytes, src_bytes, width);
++		dst_bytes += dst_stride;
++		src_bytes += src_stride;
++	    }
++	    return;
++	}
++    }
++    while (--height >= 0)
++    {
++	memcpy (dst_bytes, src_bytes, width);
++	dst_bytes += dst_stride;
++	src_bytes += src_stride;
++    }
++}
++
+ #endif /* __ASSEMBLER__ */
+ 
+ #endif /* PIXMAN_PRIVATE_H */
+-- 
+1.7.4.4
+
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb
index e55276e..35a2def 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb
@@ -15,14 +15,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
 DEPENDS += "zlib libpng"
 BBCLASSEXTEND = "native"
 
-PR = "r0"
+PR = "r1"
 
 PE = "1"
 
 IWMMXT = "--disable-arm-iwmmxt"
 LOONGSON_MMI = "--disable-loongson-mmi"
+NEON = " --disable-arm-neon "
+NEON_armv7a = " "
+NEON_armv7a-vfp-neon = " "
 
-EXTRA_OECONF="--disable-gtk ${IWMMXT} ${LOONGSON_MMI}"
+EXTRA_OECONF="--disable-gtk ${IWMMXT} ${LOONGSON_MMI} ${NEON}"
 
+SRC_URI += "\
+            file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
+            file://0002-Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
+"
 SRC_URI[md5sum] = "dd67154b23d88e6a75ad3a83f3052198"
 SRC_URI[sha256sum] = "cae9dc13727a84f11beb150c88d3a06ba114f82c52d68073c663c027e099123b"
-- 
1.7.12



