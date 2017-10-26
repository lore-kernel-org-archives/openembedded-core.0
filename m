Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 002AC60766
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 20:25:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Oct 2017 13:25:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,301,1505804400"; 
   d="scan'208";a="1926428"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga002.jf.intel.com with ESMTP; 26 Oct 2017 13:25:36 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Oct 2017 13:25:29 -0700
Message-Id: <20171026202529.160820-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
MIME-Version: 1.0
Subject: [PATCH v2] qemu: upgrade to 2.10.1
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
X-List-Received-Date: Thu, 26 Oct 2017 20:25:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

All CVE patches and the glibc one removed because these are already integrated
into 2.10.1.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---

v2: removed the glibc-2.25.patch, already into 2.10.1. At v1, I hit [YOCTO #10450]
    where devtool upgrade complain in just one hunk, even thought the rest of the
    hunks were already present at code. In general, the default patch fuzz setting
    is to lenient/lax and  needs to be fix. As Patrick mentioned, double check is
    needed when using automatic tools.

 .../qemu/qemu/CVE-2017-13672.patch                 | 504 ---------------------
 .../qemu/qemu/CVE-2017-13673.patch                 |  53 ---
 .../qemu/qemu/CVE-2017-13711.patch                 |  87 ----
 .../qemu/qemu/CVE-2017-14167.patch                 |  70 ---
 meta/recipes-devtools/qemu/qemu/glibc-2.25.patch   |  88 ----
 .../qemu/{qemu_2.10.0.bb => qemu_2.10.1.bb}        |   9 +-
 6 files changed, 2 insertions(+), 809 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2017-13672.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2017-13673.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2017-13711.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2017-14167.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/glibc-2.25.patch
 rename meta/recipes-devtools/qemu/{qemu_2.10.0.bb => qemu_2.10.1.bb} (84%)

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2017-13672.patch b/meta/recipes-devtools/qemu/qemu/CVE-2017-13672.patch
deleted file mode 100644
index ce0b1ee3ed..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2017-13672.patch
+++ /dev/null
@@ -1,504 +0,0 @@
-From 3d90c6254863693a6b13d918d2b8682e08bbc681 Mon Sep 17 00:00:00 2001
-From: Gerd Hoffmann <kraxel@redhat.com>
-Date: Mon, 28 Aug 2017 14:29:06 +0200
-Subject: [PATCH] vga: stop passing pointers to vga_draw_line* functions
-
-Instead pass around the address (aka offset into vga memory).
-Add vga_read_* helper functions which apply vbe_size_mask to
-the address, to make sure the address stays within the valid
-range, similar to the cirrus blitter fixes (commits ffaf857778
-and 026aeffcb4).
-
-Impact:  DoS for privileged guest users.  qemu crashes with
-a segfault, when hitting the guard page after vga memory
-allocation, while reading vga memory for display updates.
-
-Fixes: CVE-2017-13672
-Cc: P J P <ppandit@redhat.com>
-Reported-by: David Buchanan <d@vidbuchanan.co.uk>
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Message-id: 20170828122906.18993-1-kraxel@redhat.com
-
-Upstream-Status: Backport
-[https://git.qemu.org/?p=qemu.git;a=commit;h=3d90c6254863693a6b13d918d2b8682e08bbc681]
-
-CVE: CVE-2017-13672
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- hw/display/vga-helpers.h | 202 ++++++++++++++++++++++++++---------------------
- hw/display/vga.c         |   5 +-
- hw/display/vga_int.h     |   1 +
- 3 files changed, 114 insertions(+), 94 deletions(-)
-
-diff --git a/hw/display/vga-helpers.h b/hw/display/vga-helpers.h
-index 94f6de2..5a752b3 100644
---- a/hw/display/vga-helpers.h
-+++ b/hw/display/vga-helpers.h
-@@ -95,20 +95,46 @@ static void vga_draw_glyph9(uint8_t *d, int linesize,
-     } while (--h);
- }
- 
-+static inline uint8_t vga_read_byte(VGACommonState *vga, uint32_t addr)
-+{
-+    return vga->vram_ptr[addr & vga->vbe_size_mask];
-+}
-+
-+static inline uint16_t vga_read_word_le(VGACommonState *vga, uint32_t addr)
-+{
-+    uint32_t offset = addr & vga->vbe_size_mask & ~1;
-+    uint16_t *ptr = (uint16_t *)(vga->vram_ptr + offset);
-+    return lduw_le_p(ptr);
-+}
-+
-+static inline uint16_t vga_read_word_be(VGACommonState *vga, uint32_t addr)
-+{
-+    uint32_t offset = addr & vga->vbe_size_mask & ~1;
-+    uint16_t *ptr = (uint16_t *)(vga->vram_ptr + offset);
-+    return lduw_be_p(ptr);
-+}
-+
-+static inline uint32_t vga_read_dword_le(VGACommonState *vga, uint32_t addr)
-+{
-+    uint32_t offset = addr & vga->vbe_size_mask & ~3;
-+    uint32_t *ptr = (uint32_t *)(vga->vram_ptr + offset);
-+    return ldl_le_p(ptr);
-+}
-+
- /*
-  * 4 color mode
-  */
--static void vga_draw_line2(VGACommonState *s1, uint8_t *d,
--                           const uint8_t *s, int width)
-+static void vga_draw_line2(VGACommonState *vga, uint8_t *d,
-+                           uint32_t addr, int width)
- {
-     uint32_t plane_mask, *palette, data, v;
-     int x;
- 
--    palette = s1->last_palette;
--    plane_mask = mask16[s1->ar[VGA_ATC_PLANE_ENABLE] & 0xf];
-+    palette = vga->last_palette;
-+    plane_mask = mask16[vga->ar[VGA_ATC_PLANE_ENABLE] & 0xf];
-     width >>= 3;
-     for(x = 0; x < width; x++) {
--        data = ((uint32_t *)s)[0];
-+        data = vga_read_dword_le(vga, addr);
-         data &= plane_mask;
-         v = expand2[GET_PLANE(data, 0)];
-         v |= expand2[GET_PLANE(data, 2)] << 2;
-@@ -124,7 +150,7 @@ static void vga_draw_line2(VGACommonState *s1, uint8_t *d,
-         ((uint32_t *)d)[6] = palette[(v >> 4) & 0xf];
-         ((uint32_t *)d)[7] = palette[(v >> 0) & 0xf];
-         d += 32;
--        s += 4;
-+        addr += 4;
-     }
- }
- 
-@@ -134,17 +160,17 @@ static void vga_draw_line2(VGACommonState *s1, uint8_t *d,
- /*
-  * 4 color mode, dup2 horizontal
-  */
--static void vga_draw_line2d2(VGACommonState *s1, uint8_t *d,
--                             const uint8_t *s, int width)
-+static void vga_draw_line2d2(VGACommonState *vga, uint8_t *d,
-+                             uint32_t addr, int width)
- {
-     uint32_t plane_mask, *palette, data, v;
-     int x;
- 
--    palette = s1->last_palette;
--    plane_mask = mask16[s1->ar[VGA_ATC_PLANE_ENABLE] & 0xf];
-+    palette = vga->last_palette;
-+    plane_mask = mask16[vga->ar[VGA_ATC_PLANE_ENABLE] & 0xf];
-     width >>= 3;
-     for(x = 0; x < width; x++) {
--        data = ((uint32_t *)s)[0];
-+        data = vga_read_dword_le(vga, addr);
-         data &= plane_mask;
-         v = expand2[GET_PLANE(data, 0)];
-         v |= expand2[GET_PLANE(data, 2)] << 2;
-@@ -160,24 +186,24 @@ static void vga_draw_line2d2(VGACommonState *s1, uint8_t *d,
-         PUT_PIXEL2(d, 6, palette[(v >> 4) & 0xf]);
-         PUT_PIXEL2(d, 7, palette[(v >> 0) & 0xf]);
-         d += 64;
--        s += 4;
-+        addr += 4;
-     }
- }
- 
- /*
-  * 16 color mode
-  */
--static void vga_draw_line4(VGACommonState *s1, uint8_t *d,
--                           const uint8_t *s, int width)
-+static void vga_draw_line4(VGACommonState *vga, uint8_t *d,
-+                           uint32_t addr, int width)
- {
-     uint32_t plane_mask, data, v, *palette;
-     int x;
- 
--    palette = s1->last_palette;
--    plane_mask = mask16[s1->ar[VGA_ATC_PLANE_ENABLE] & 0xf];
-+    palette = vga->last_palette;
-+    plane_mask = mask16[vga->ar[VGA_ATC_PLANE_ENABLE] & 0xf];
-     width >>= 3;
-     for(x = 0; x < width; x++) {
--        data = ((uint32_t *)s)[0];
-+        data = vga_read_dword_le(vga, addr);
-         data &= plane_mask;
-         v = expand4[GET_PLANE(data, 0)];
-         v |= expand4[GET_PLANE(data, 1)] << 1;
-@@ -192,24 +218,24 @@ static void vga_draw_line4(VGACommonState *s1, uint8_t *d,
-         ((uint32_t *)d)[6] = palette[(v >> 4) & 0xf];
-         ((uint32_t *)d)[7] = palette[(v >> 0) & 0xf];
-         d += 32;
--        s += 4;
-+        addr += 4;
-     }
- }
- 
- /*
-  * 16 color mode, dup2 horizontal
-  */
--static void vga_draw_line4d2(VGACommonState *s1, uint8_t *d,
--                             const uint8_t *s, int width)
-+static void vga_draw_line4d2(VGACommonState *vga, uint8_t *d,
-+                             uint32_t addr, int width)
- {
-     uint32_t plane_mask, data, v, *palette;
-     int x;
- 
--    palette = s1->last_palette;
--    plane_mask = mask16[s1->ar[VGA_ATC_PLANE_ENABLE] & 0xf];
-+    palette = vga->last_palette;
-+    plane_mask = mask16[vga->ar[VGA_ATC_PLANE_ENABLE] & 0xf];
-     width >>= 3;
-     for(x = 0; x < width; x++) {
--        data = ((uint32_t *)s)[0];
-+        data = vga_read_dword_le(vga, addr);
-         data &= plane_mask;
-         v = expand4[GET_PLANE(data, 0)];
-         v |= expand4[GET_PLANE(data, 1)] << 1;
-@@ -224,7 +250,7 @@ static void vga_draw_line4d2(VGACommonState *s1, uint8_t *d,
-         PUT_PIXEL2(d, 6, palette[(v >> 4) & 0xf]);
-         PUT_PIXEL2(d, 7, palette[(v >> 0) & 0xf]);
-         d += 64;
--        s += 4;
-+        addr += 4;
-     }
- }
- 
-@@ -233,21 +259,21 @@ static void vga_draw_line4d2(VGACommonState *s1, uint8_t *d,
-  *
-  * XXX: add plane_mask support (never used in standard VGA modes)
-  */
--static void vga_draw_line8d2(VGACommonState *s1, uint8_t *d,
--                             const uint8_t *s, int width)
-+static void vga_draw_line8d2(VGACommonState *vga, uint8_t *d,
-+                             uint32_t addr, int width)
- {
-     uint32_t *palette;
-     int x;
- 
--    palette = s1->last_palette;
-+    palette = vga->last_palette;
-     width >>= 3;
-     for(x = 0; x < width; x++) {
--        PUT_PIXEL2(d, 0, palette[s[0]]);
--        PUT_PIXEL2(d, 1, palette[s[1]]);
--        PUT_PIXEL2(d, 2, palette[s[2]]);
--        PUT_PIXEL2(d, 3, palette[s[3]]);
-+        PUT_PIXEL2(d, 0, palette[vga_read_byte(vga, addr + 0)]);
-+        PUT_PIXEL2(d, 1, palette[vga_read_byte(vga, addr + 1)]);
-+        PUT_PIXEL2(d, 2, palette[vga_read_byte(vga, addr + 2)]);
-+        PUT_PIXEL2(d, 3, palette[vga_read_byte(vga, addr + 3)]);
-         d += 32;
--        s += 4;
-+        addr += 4;
-     }
- }
- 
-@@ -256,63 +282,63 @@ static void vga_draw_line8d2(VGACommonState *s1, uint8_t *d,
-  *
-  * XXX: add plane_mask support (never used in standard VGA modes)
-  */
--static void vga_draw_line8(VGACommonState *s1, uint8_t *d,
--                           const uint8_t *s, int width)
-+static void vga_draw_line8(VGACommonState *vga, uint8_t *d,
-+                           uint32_t addr, int width)
- {
-     uint32_t *palette;
-     int x;
- 
--    palette = s1->last_palette;
-+    palette = vga->last_palette;
-     width >>= 3;
-     for(x = 0; x < width; x++) {
--        ((uint32_t *)d)[0] = palette[s[0]];
--        ((uint32_t *)d)[1] = palette[s[1]];
--        ((uint32_t *)d)[2] = palette[s[2]];
--        ((uint32_t *)d)[3] = palette[s[3]];
--        ((uint32_t *)d)[4] = palette[s[4]];
--        ((uint32_t *)d)[5] = palette[s[5]];
--        ((uint32_t *)d)[6] = palette[s[6]];
--        ((uint32_t *)d)[7] = palette[s[7]];
-+        ((uint32_t *)d)[0] = palette[vga_read_byte(vga, addr + 0)];
-+        ((uint32_t *)d)[1] = palette[vga_read_byte(vga, addr + 1)];
-+        ((uint32_t *)d)[2] = palette[vga_read_byte(vga, addr + 2)];
-+        ((uint32_t *)d)[3] = palette[vga_read_byte(vga, addr + 3)];
-+        ((uint32_t *)d)[4] = palette[vga_read_byte(vga, addr + 4)];
-+        ((uint32_t *)d)[5] = palette[vga_read_byte(vga, addr + 5)];
-+        ((uint32_t *)d)[6] = palette[vga_read_byte(vga, addr + 6)];
-+        ((uint32_t *)d)[7] = palette[vga_read_byte(vga, addr + 7)];
-         d += 32;
--        s += 8;
-+        addr += 8;
-     }
- }
- 
- /*
-  * 15 bit color
-  */
--static void vga_draw_line15_le(VGACommonState *s1, uint8_t *d,
--                               const uint8_t *s, int width)
-+static void vga_draw_line15_le(VGACommonState *vga, uint8_t *d,
-+                               uint32_t addr, int width)
- {
-     int w;
-     uint32_t v, r, g, b;
- 
-     w = width;
-     do {
--        v = lduw_le_p((void *)s);
-+        v = vga_read_word_le(vga, addr);
-         r = (v >> 7) & 0xf8;
-         g = (v >> 2) & 0xf8;
-         b = (v << 3) & 0xf8;
-         ((uint32_t *)d)[0] = rgb_to_pixel32(r, g, b);
--        s += 2;
-+        addr += 2;
-         d += 4;
-     } while (--w != 0);
- }
- 
--static void vga_draw_line15_be(VGACommonState *s1, uint8_t *d,
--                               const uint8_t *s, int width)
-+static void vga_draw_line15_be(VGACommonState *vga, uint8_t *d,
-+                               uint32_t addr, int width)
- {
-     int w;
-     uint32_t v, r, g, b;
- 
-     w = width;
-     do {
--        v = lduw_be_p((void *)s);
-+        v = vga_read_word_be(vga, addr);
-         r = (v >> 7) & 0xf8;
-         g = (v >> 2) & 0xf8;
-         b = (v << 3) & 0xf8;
-         ((uint32_t *)d)[0] = rgb_to_pixel32(r, g, b);
--        s += 2;
-+        addr += 2;
-         d += 4;
-     } while (--w != 0);
- }
-@@ -320,38 +346,38 @@ static void vga_draw_line15_be(VGACommonState *s1, uint8_t *d,
- /*
-  * 16 bit color
-  */
--static void vga_draw_line16_le(VGACommonState *s1, uint8_t *d,
--                               const uint8_t *s, int width)
-+static void vga_draw_line16_le(VGACommonState *vga, uint8_t *d,
-+                               uint32_t addr, int width)
- {
-     int w;
-     uint32_t v, r, g, b;
- 
-     w = width;
-     do {
--        v = lduw_le_p((void *)s);
-+        v = vga_read_word_le(vga, addr);
-         r = (v >> 8) & 0xf8;
-         g = (v >> 3) & 0xfc;
-         b = (v << 3) & 0xf8;
-         ((uint32_t *)d)[0] = rgb_to_pixel32(r, g, b);
--        s += 2;
-+        addr += 2;
-         d += 4;
-     } while (--w != 0);
- }
- 
--static void vga_draw_line16_be(VGACommonState *s1, uint8_t *d,
--                               const uint8_t *s, int width)
-+static void vga_draw_line16_be(VGACommonState *vga, uint8_t *d,
-+                               uint32_t addr, int width)
- {
-     int w;
-     uint32_t v, r, g, b;
- 
-     w = width;
-     do {
--        v = lduw_be_p((void *)s);
-+        v = vga_read_word_be(vga, addr);
-         r = (v >> 8) & 0xf8;
-         g = (v >> 3) & 0xfc;
-         b = (v << 3) & 0xf8;
-         ((uint32_t *)d)[0] = rgb_to_pixel32(r, g, b);
--        s += 2;
-+        addr += 2;
-         d += 4;
-     } while (--w != 0);
- }
-@@ -359,36 +385,36 @@ static void vga_draw_line16_be(VGACommonState *s1, uint8_t *d,
- /*
-  * 24 bit color
-  */
--static void vga_draw_line24_le(VGACommonState *s1, uint8_t *d,
--                               const uint8_t *s, int width)
-+static void vga_draw_line24_le(VGACommonState *vga, uint8_t *d,
-+                               uint32_t addr, int width)
- {
-     int w;
-     uint32_t r, g, b;
- 
-     w = width;
-     do {
--        b = s[0];
--        g = s[1];
--        r = s[2];
-+        b = vga_read_byte(vga, addr + 0);
-+        g = vga_read_byte(vga, addr + 1);
-+        r = vga_read_byte(vga, addr + 2);
-         ((uint32_t *)d)[0] = rgb_to_pixel32(r, g, b);
--        s += 3;
-+        addr += 3;
-         d += 4;
-     } while (--w != 0);
- }
- 
--static void vga_draw_line24_be(VGACommonState *s1, uint8_t *d,
--                               const uint8_t *s, int width)
-+static void vga_draw_line24_be(VGACommonState *vga, uint8_t *d,
-+                               uint32_t addr, int width)
- {
-     int w;
-     uint32_t r, g, b;
- 
-     w = width;
-     do {
--        r = s[0];
--        g = s[1];
--        b = s[2];
-+        r = vga_read_byte(vga, addr + 0);
-+        g = vga_read_byte(vga, addr + 1);
-+        b = vga_read_byte(vga, addr + 2);
-         ((uint32_t *)d)[0] = rgb_to_pixel32(r, g, b);
--        s += 3;
-+        addr += 3;
-         d += 4;
-     } while (--w != 0);
- }
-@@ -396,44 +422,36 @@ static void vga_draw_line24_be(VGACommonState *s1, uint8_t *d,
- /*
-  * 32 bit color
-  */
--static void vga_draw_line32_le(VGACommonState *s1, uint8_t *d,
--                               const uint8_t *s, int width)
-+static void vga_draw_line32_le(VGACommonState *vga, uint8_t *d,
-+                               uint32_t addr, int width)
- {
--#ifndef HOST_WORDS_BIGENDIAN
--    memcpy(d, s, width * 4);
--#else
-     int w;
-     uint32_t r, g, b;
- 
-     w = width;
-     do {
--        b = s[0];
--        g = s[1];
--        r = s[2];
-+        b = vga_read_byte(vga, addr + 0);
-+        g = vga_read_byte(vga, addr + 1);
-+        r = vga_read_byte(vga, addr + 2);
-         ((uint32_t *)d)[0] = rgb_to_pixel32(r, g, b);
--        s += 4;
-+        addr += 4;
-         d += 4;
-     } while (--w != 0);
--#endif
- }
- 
--static void vga_draw_line32_be(VGACommonState *s1, uint8_t *d,
--                               const uint8_t *s, int width)
-+static void vga_draw_line32_be(VGACommonState *vga, uint8_t *d,
-+                               uint32_t addr, int width)
- {
--#ifdef HOST_WORDS_BIGENDIAN
--    memcpy(d, s, width * 4);
--#else
-     int w;
-     uint32_t r, g, b;
- 
-     w = width;
-     do {
--        r = s[1];
--        g = s[2];
--        b = s[3];
-+        r = vga_read_byte(vga, addr + 1);
-+        g = vga_read_byte(vga, addr + 2);
-+        b = vga_read_byte(vga, addr + 3);
-         ((uint32_t *)d)[0] = rgb_to_pixel32(r, g, b);
--        s += 4;
-+        addr += 4;
-         d += 4;
-     } while (--w != 0);
--#endif
- }
-diff --git a/hw/display/vga.c b/hw/display/vga.c
-index ad7a465..6fc8c87 100644
---- a/hw/display/vga.c
-+++ b/hw/display/vga.c
-@@ -1005,7 +1005,7 @@ void vga_mem_writeb(VGACommonState *s, hwaddr addr, uint32_t val)
- }
- 
- typedef void vga_draw_line_func(VGACommonState *s1, uint8_t *d,
--                                const uint8_t *s, int width);
-+                                uint32_t srcaddr, int width);
- 
- #include "vga-helpers.h"
- 
-@@ -1666,7 +1666,7 @@ static void vga_draw_graphic(VGACommonState *s, int full_update)
-             if (y_start < 0)
-                 y_start = y;
-             if (!(is_buffer_shared(surface))) {
--                vga_draw_line(s, d, s->vram_ptr + addr, width);
-+                vga_draw_line(s, d, addr, width);
-                 if (s->cursor_draw_line)
-                     s->cursor_draw_line(s, d, y);
-             }
-@@ -2170,6 +2170,7 @@ void vga_common_init(VGACommonState *s, Object *obj, bool global_vmstate)
-     if (!s->vbe_size) {
-         s->vbe_size = s->vram_size;
-     }
-+    s->vbe_size_mask = s->vbe_size - 1;
- 
-     s->is_vbe_vmstate = 1;
-     memory_region_init_ram_nomigrate(&s->vram, obj, "vga.vram", s->vram_size,
-diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
-index dd6c958..ad34a1f 100644
---- a/hw/display/vga_int.h
-+++ b/hw/display/vga_int.h
-@@ -94,6 +94,7 @@ typedef struct VGACommonState {
-     uint32_t vram_size;
-     uint32_t vram_size_mb; /* property */
-     uint32_t vbe_size;
-+    uint32_t vbe_size_mask;
-     uint32_t latch;
-     bool has_chain4_alias;
-     MemoryRegion chain4_alias;
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2017-13673.patch b/meta/recipes-devtools/qemu/qemu/CVE-2017-13673.patch
deleted file mode 100644
index 3d0695fd66..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2017-13673.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From e65294157d4b69393b3f819c99f4f647452b48e3 Mon Sep 17 00:00:00 2001
-From: Gerd Hoffmann <kraxel@redhat.com>
-Date: Mon, 28 Aug 2017 14:33:07 +0200
-Subject: [PATCH] vga: fix display update region calculation (split screen)
-
-vga display update mis-calculated the region for the dirty bitmap
-snapshot in case split screen mode is used.  This can trigger an
-assert in cpu_physical_memory_snapshot_get_dirty().
-
-Impact:  DoS for privileged guest users.
-
-Fixes: CVE-2017-13673
-Fixes: fec5e8c92becad223df9d972770522f64aafdb72
-Cc: P J P <ppandit@redhat.com>
-Reported-by: David Buchanan <d@vidbuchanan.co.uk>
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Message-id: 20170828123307.15392-1-kraxel@redhat.com
-
-Upstream-Status: Backport
-[https://git.qemu.org/?p=qemu.git;a=commit;h=e65294157d4b69393b3f819c99f4f647452b48e3]
-
-CVE: CVE-2017-13673
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- hw/display/vga.c | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/hw/display/vga.c b/hw/display/vga.c
-index 3433102..ad7a465 100644
---- a/hw/display/vga.c
-+++ b/hw/display/vga.c
-@@ -1628,9 +1628,15 @@ static void vga_draw_graphic(VGACommonState *s, int full_update)
-     y1 = 0;
- 
-     if (!full_update) {
-+        ram_addr_t region_start = addr1;
-+        ram_addr_t region_end = addr1 + line_offset * height;
-         vga_sync_dirty_bitmap(s);
--        snap = memory_region_snapshot_and_clear_dirty(&s->vram, addr1,
--                                                      line_offset * height,
-+        if (s->line_compare < height) {
-+            /* split screen mode */
-+            region_start = 0;
-+        }
-+        snap = memory_region_snapshot_and_clear_dirty(&s->vram, region_start,
-+                                                      region_end - region_start,
-                                                       DIRTY_MEMORY_VGA);
-     }
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2017-13711.patch b/meta/recipes-devtools/qemu/qemu/CVE-2017-13711.patch
deleted file mode 100644
index 352f73f624..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2017-13711.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 1201d308519f1e915866d7583d5136d03cc1d384 Mon Sep 17 00:00:00 2001
-From: Samuel Thibault <samuel.thibault@ens-lyon.org>
-Date: Fri, 25 Aug 2017 01:35:53 +0200
-Subject: [PATCH] slirp: fix clearing ifq_so from pending packets
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The if_fastq and if_batchq contain not only packets, but queues of packets
-for the same socket. When sofree frees a socket, it thus has to clear ifq_so
-from all the packets from the queues, not only the first.
-
-Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
-Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
-Cc: qemu-stable@nongnu.org
-Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
-
-Upstream-Status: Backport
-[https://git.qemu.org/?p=qemu.git;a=commit;h=1201d308519f1e915866d7583d5136d03cc1d384]
-
-CVE: CVE-2017-13711
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- slirp/socket.c | 39 +++++++++++++++++++++++----------------
- 1 file changed, 23 insertions(+), 16 deletions(-)
-
-diff --git a/slirp/socket.c b/slirp/socket.c
-index ecec029..cb7b5b6 100644
---- a/slirp/socket.c
-+++ b/slirp/socket.c
-@@ -60,29 +60,36 @@ socreate(Slirp *slirp)
- }
- 
- /*
-+ * Remove references to so from the given message queue.
-+ */
-+static void
-+soqfree(struct socket *so, struct quehead *qh)
-+{
-+    struct mbuf *ifq;
-+
-+    for (ifq = (struct mbuf *) qh->qh_link;
-+             (struct quehead *) ifq != qh;
-+             ifq = ifq->ifq_next) {
-+        if (ifq->ifq_so == so) {
-+            struct mbuf *ifm;
-+            ifq->ifq_so = NULL;
-+            for (ifm = ifq->ifs_next; ifm != ifq; ifm = ifm->ifs_next) {
-+                ifm->ifq_so = NULL;
-+            }
-+        }
-+    }
-+}
-+
-+/*
-  * remque and free a socket, clobber cache
-  */
- void
- sofree(struct socket *so)
- {
-   Slirp *slirp = so->slirp;
--  struct mbuf *ifm;
- 
--  for (ifm = (struct mbuf *) slirp->if_fastq.qh_link;
--       (struct quehead *) ifm != &slirp->if_fastq;
--       ifm = ifm->ifq_next) {
--    if (ifm->ifq_so == so) {
--      ifm->ifq_so = NULL;
--    }
--  }
--
--  for (ifm = (struct mbuf *) slirp->if_batchq.qh_link;
--       (struct quehead *) ifm != &slirp->if_batchq;
--       ifm = ifm->ifq_next) {
--    if (ifm->ifq_so == so) {
--      ifm->ifq_so = NULL;
--    }
--  }
-+  soqfree(so, &slirp->if_fastq);
-+  soqfree(so, &slirp->if_batchq);
- 
-   if (so->so_emu==EMU_RSH && so->extra) {
- 	sofree(so->extra);
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2017-14167.patch b/meta/recipes-devtools/qemu/qemu/CVE-2017-14167.patch
deleted file mode 100644
index 969ad877d6..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2017-14167.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From ed4f86e8b6eff8e600c69adee68c7cd34dd2cccb Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Thu, 7 Sep 2017 12:02:56 +0530
-Subject: [PATCH] multiboot: validate multiboot header address values
-
-While loading kernel via multiboot-v1 image, (flags & 0x00010000)
-indicates that multiboot header contains valid addresses to load
-the kernel image. These addresses are used to compute kernel
-size and kernel text offset in the OS image. Validate these
-address values to avoid an OOB access issue.
-
-This is CVE-2017-14167.
-
-Reported-by: Thomas Garnier <thgarnie@google.com>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Message-Id: <20170907063256.7418-1-ppandit@redhat.com>
-Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
-
-Upstream-Status: Backport
-[https://git.qemu.org/?p=qemu.git;a=commit;h=ed4f86e8b6eff8e600c69adee68c7cd34dd2cccb]
-
-CVE: CVE-2017-14167
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- hw/i386/multiboot.c | 19 +++++++++++++++++++
- 1 file changed, 19 insertions(+)
-
-diff --git a/hw/i386/multiboot.c b/hw/i386/multiboot.c
-index 6001f4c..c7b70c9 100644
---- a/hw/i386/multiboot.c
-+++ b/hw/i386/multiboot.c
-@@ -221,15 +221,34 @@ int load_multiboot(FWCfgState *fw_cfg,
-         uint32_t mh_header_addr = ldl_p(header+i+12);
-         uint32_t mh_load_end_addr = ldl_p(header+i+20);
-         uint32_t mh_bss_end_addr = ldl_p(header+i+24);
-+
-         mh_load_addr = ldl_p(header+i+16);
-+        if (mh_header_addr < mh_load_addr) {
-+            fprintf(stderr, "invalid mh_load_addr address\n");
-+            exit(1);
-+        }
-+
-         uint32_t mb_kernel_text_offset = i - (mh_header_addr - mh_load_addr);
-         uint32_t mb_load_size = 0;
-         mh_entry_addr = ldl_p(header+i+28);
- 
-         if (mh_load_end_addr) {
-+            if (mh_bss_end_addr < mh_load_addr) {
-+                fprintf(stderr, "invalid mh_bss_end_addr address\n");
-+                exit(1);
-+            }
-             mb_kernel_size = mh_bss_end_addr - mh_load_addr;
-+
-+            if (mh_load_end_addr < mh_load_addr) {
-+                fprintf(stderr, "invalid mh_load_end_addr address\n");
-+                exit(1);
-+            }
-             mb_load_size = mh_load_end_addr - mh_load_addr;
-         } else {
-+            if (kernel_file_size < mb_kernel_text_offset) {
-+                fprintf(stderr, "invalid kernel_file_size\n");
-+                exit(1);
-+            }
-             mb_kernel_size = kernel_file_size - mb_kernel_text_offset;
-             mb_load_size = mb_kernel_size;
-         }
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/qemu/qemu/glibc-2.25.patch b/meta/recipes-devtools/qemu/qemu/glibc-2.25.patch
deleted file mode 100644
index a6908bdbf9..0000000000
--- a/meta/recipes-devtools/qemu/qemu/glibc-2.25.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From: Christopher Covington
-Date: Wed, 28 Dec 2016 15:04:33 -0500
-Subject: [Qemu-devel] [PATCH v3] build: include sys/sysmacros.h for major() and minor()a
-
-The definition of the major() and minor() macros are moving within glibc to
-<sys/sysmacros.h>. Include this header when it is available to avoid the
-following sorts of build-stopping messages:
-
-qga/commands-posix.c: In function ‘dev_major_minor’:
-qga/commands-posix.c:656:13: error: In the GNU C Library, "major" is defined
- by <sys/sysmacros.h>. For historical compatibility, it is
- currently defined by <sys/types.h> as well, but we plan to
- remove this soon. To use "major", include <sys/sysmacros.h>
- directly. If you did not intend to use a system-defined macro
- "major", you should undefine it after including <sys/types.h>. [-Werror]
-         *devmajor = major(st.st_rdev);
-             ^~~~~~~~~~~~~~~~~~~~~~~~~~
-
-qga/commands-posix.c:657:13: error: In the GNU C Library, "minor" is defined
- by <sys/sysmacros.h>. For historical compatibility, it is
- currently defined by <sys/types.h> as well, but we plan to
- remove this soon. To use "minor", include <sys/sysmacros.h>
- directly. If you did not intend to use a system-defined macro
- "minor", you should undefine it after including <sys/types.h>. [-Werror]
-         *devminor = minor(st.st_rdev);
-             ^~~~~~~~~~~~~~~~~~~~~~~~~~
-
-The additional include allows the build to complete on Fedora 26 (Rawhide)
-with glibc version 2.24.90.
-
-Signed-off-by: Christopher Covington <address@hidden>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Upstream-Status: Submitted https://lists.gnu.org/archive/html/qemu-devel/2016-12/msg03548.html
-
-diff -uNr qemu-2.8.0.orig/configure qemu-2.8.0/configure
---- qemu-2.8.0.orig/configure  2017-02-21 19:05:13.180094708 +0100
-+++ qemu-2.8.0/configure       2017-02-21 19:08:53.114087084 +0100
-@@ -4727,6 +4727,20 @@
- then
- fi
- 
- ##########################################
-+# check for sysmacros.h
-+
-+have_sysmacros=no
-+cat > $TMPC << EOF
-+#include <sys/sysmacros.h>
-+int main(void) {
-+    return makedev(0, 0);
-+}
-+EOF
-+if compile_prog "" "" ; then
-+    have_sysmacros=yes
-+fi
-+
-+##########################################
- # End of CC checks
- # After here, no more $cc or $ld runs
- 
-diff -uNr qemu-2.8.0.orig/configure qemu-2.8.0/configure
---- qemu-2.8.0.orig/configure  2017-02-21 19:05:13.180094708 +0100
-+++ qemu-2.8.0/configure       2017-02-21 19:08:53.114087084 +0100
-@@ -5695,6 +5709,10 @@
-   echo "CONFIG_AF_VSOCK=y" >> $config_host_mak
- fi
- 
-+if test "$have_sysmacros" = "yes" ; then
-+  echo "CONFIG_SYSMACROS=y" >> $config_host_mak
-+fi
-+
- # Hold two types of flag:
- #   CONFIG_THREAD_SETNAME_BYTHREAD  - we've got a way of setting the name on
- #                                     a thread we have a handle to
-diff -uNr qemu-2.8.0.orig/include/sysemu/os-posix.h qemu-2.8.0/include/sysemu/os-posix.h
---- qemu-2.8.0.orig/include/sysemu/os-posix.h	2016-12-20 21:16:48.000000000 +0100
-+++ qemu-2.8.0/include/sysemu/os-posix.h	2017-02-21 19:07:18.009090381 +0100
-@@ -34,6 +34,10 @@
- #include <netdb.h>
- #include <sys/un.h>
- 
-+#ifdef CONFIG_SYSMACROS
-+#include <sys/sysmacros.h>
-+#endif
-+
- void os_set_line_buffering(void);
- void os_set_proc_name(const char *s);
- void os_setup_signal_handling(void);
diff --git a/meta/recipes-devtools/qemu/qemu_2.10.0.bb b/meta/recipes-devtools/qemu/qemu_2.10.1.bb
similarity index 84%
rename from meta/recipes-devtools/qemu/qemu_2.10.0.bb
rename to meta/recipes-devtools/qemu/qemu_2.10.1.bb
index 75e2a259fa..80da04d96d 100644
--- a/meta/recipes-devtools/qemu/qemu_2.10.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.10.1.bb
@@ -18,16 +18,11 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://no-valgrind.patch \
            file://pathlimit.patch \
            file://qemu-2.5.0-cflags.patch \
-           file://glibc-2.25.patch \
            file://0001-Provide-support-for-the-CUSE-TPM.patch \
            file://0002-Introduce-condition-to-notify-waiters-of-completed-c.patch \
            file://0003-Introduce-condition-in-TPM-backend-for-notification.patch \
            file://0004-Add-support-for-VM-suspend-resume-for-TPM-TIS-v2.9.patch \
            file://apic-fixup-fallthrough-to-PIC.patch \
-           file://CVE-2017-13711.patch \
-           file://CVE-2017-13673.patch \
-           file://CVE-2017-13672.patch \
-           file://CVE-2017-14167.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
@@ -37,8 +32,8 @@ SRC_URI_append_class-native = " \
             file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
             "
 
-SRC_URI[md5sum] = "ca73441de73a9b52c6c49c97190d2185"
-SRC_URI[sha256sum] = "7e9f39e1306e6dcc595494e91c1464d4b03f55ddd2053183e0e1b69f7f776d48"
+SRC_URI[md5sum] = "b375373f688bea0cd8865b966dad15e3"
+SRC_URI[sha256sum] = "8e040bc7556401ebb3a347a8f7878e9d4028cf71b2744b1a1699f4e741966ba8"
 
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
-- 
2.12.3


