Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T36WU-0001BZ-CC
	for openembedded-core@lists.openembedded.org;
	Sun, 19 Aug 2012 16:30:38 +0200
Received: by wibhm2 with SMTP id hm2so2548612wib.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2012 07:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=+dSxeVrwNrAcAn53CFdluUWX6LHilcLi2lhStGvVbr8=;
	b=LqpSnn/2V54IDymDdjahJSJO4kmFm3lypdiEHSH3GeYYMQS6Z5mkNif2F599ENjTxY
	tz7+d5bk9SA07WGU6h/BZE53MxJtnYsO1uEi8quhRfB+lv1Txxlb4kSvOYN9X7eXcKhg
	Tos88sWAi1LhC4EMPrTgekzemVkSUttP0x97usAibA8+pod80O5R33Vx303BS6nf6LZq
	gQ89shHrBrt+3yGuh0SHRRpgxbTlNBUJkoAVBwZsgAgXTXiap8wK0Jm/8BSul8xZG4rA
	zgRgHGwqnOz32EV2mdfcTx5krsGjXWVpHlKbXxB0LYQURxk5i2AIaNKQUB0zrw5PEvGn
	cbog==
Received: by 10.180.84.1 with SMTP id u1mr20757350wiy.15.1345385916746;
	Sun, 19 Aug 2012 07:18:36 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2BC0.dip.t-dialin.net.
	[91.10.43.192])
	by mx.google.com with ESMTPS id o2sm33297397wiz.11.2012.08.19.07.18.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 19 Aug 2012 07:18:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Aug 2012 16:25:35 +0200
Message-Id: <1345386335-18430-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [PATCH] pixman: merge meta-oe append into oe-core
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
X-List-Received-Date: Sun, 19 Aug 2012 14:30:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* neon configuration settings included
* patches were aligned to 0.27.2.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...lated-workarounds-in-cpu-features-detecti.patch |  145 ++++++++++++++++++++
 ...mplementation-of-pixman_blt-with-overlapp.patch |  127 +++++++++++++++++
 meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb    |   11 ++-
 3 files changed, 281 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0002-Generic-C-implementation-of-pixman_blt-with-overlapp.patch

diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch b/meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
new file mode 100644
index 0000000..8a1c524
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
@@ -0,0 +1,145 @@
+From d140e69c1d76ed61d1feb53b79820951707ee5a6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sun, 19 Aug 2012 15:15:45 +0200
+Subject: [PATCH 1/2] ARM: qemu related workarounds in cpu features detection
+ code
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This was ported from meta-oe's patch [1]
+
+[1] http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
+
+Upstream-Status: Inappropriate [other] qemu fix
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ pixman/pixman-arm.c |   74 +++++++++++++++++++++++++++++++++++++++++++++++---
+ 1 files changed, 69 insertions(+), 5 deletions(-)
+
+diff --git a/pixman/pixman-arm.c b/pixman/pixman-arm.c
+index 23374e4..d0771fd 100644
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
+@@ -147,22 +166,23 @@ detect_cpu_features (void)
+ 	{
+ 	    if (aux.a_type == AT_HWCAP)
+ 	    {
+-		uint32_t hwcap = aux.a_un.a_val;
++		hwcap = aux.a_un.a_val;
+ 
+ 		/* hardcode these values to avoid depending on specific
+ 		 * versions of the hwcap header, e.g. HWCAP_NEON
+ 		 */
+-		if ((hwcap & 64) != 0)
++		if ((hwcap & ARM_HWCAP_VFP) != 0)
+ 		    features |= ARM_VFP;
+-		if ((hwcap & 512) != 0)
++		if ((hwcap & ARM_HWCAP_IWMMXT) != 0)
+ 		    features |= ARM_IWMMXT;
+ 		/* this flag is only present on kernel 2.6.29 */
+-		if ((hwcap & 4096) != 0)
++		if ((hwcap & ARM_HWCAP_NEON) != 0)
+ 		    features |= ARM_NEON;
+ 	    }
+ 	    else if (aux.a_type == AT_PLATFORM)
+ 	    {
+-		const char *plat = (const char*) aux.a_un.a_val;
++		plat = (const char*) aux.a_un.a_val;
++		plat_cnt++;
+ 
+ 		if (strncmp (plat, "v7l", 3) == 0)
+ 		    features |= (ARM_V7 | ARM_V6);
+@@ -171,8 +191,52 @@ detect_cpu_features (void)
+ 	    }
+ 	}
+ 	close (fd);
++
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
++		    features |= (ARM_V7 | ARM_V6);
++		    hwcap |= ARM_HWCAP_VFP;  /* qemu is supposed to emulate vfp */
++		    hwcap |= ARM_HWCAP_NEON; /* qemu is supposed to emulate neon */
++		}
++		else if (strcmp (u.machine, "armv6l") == 0)
++		{
++		    features |= ARM_V6;
++		    hwcap |= ARM_HWCAP_VFP;  /* qemu is supposed to emulate vfp */
++		}
++	    }
++	}
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
++    if ((hwcap & ARM_HWCAP_NEON) != 0)
++        features |= ARM_NEON;
++
+     return features;
+ }
+ 
+-- 
+1.7.4.4
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
1.7.4.4



