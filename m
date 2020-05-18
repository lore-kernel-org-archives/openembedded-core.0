Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.36813.1589781049107597680
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2020 22:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: YL7vzlC7rWWFWCdYWF3YcuQ/iU4wn7idmqPX6QB03jzEW24Ovg0guWWktKTjydBv4VaA8aADJq
 aJr2oAPdwrIg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2020 22:50:48 -0700
IronPort-SDR: B21h3KdaScm4Pcpys5hgMYUwvSO1UChMHoP8pyY7xnVwi5IF4Hz20XP6ragaiKQPgx9FSwNAfq
 naA4r9A6hnGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,406,1583222400"; 
   d="scan'208";a="342689616"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga001.jf.intel.com with ESMTP; 17 May 2020 22:50:46 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: fix CVE-2020-11869
Date: Mon, 18 May 2020 13:50:45 +0800
Message-Id: <1589781045-54660-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |  1 +
 .../qemu/qemu/CVE-2020-11869.patch                 | 97 ++++++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-11869.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 7a1ccf2..126e7d4 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -37,6 +37,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2020-7211.patch \
 	   file://0001-qemu-Do-not-include-file-if-not-exists.patch \
            file://CVE-2020-11102.patch \
+	   file://CVE-2020-11869.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-11869.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-11869.patch
new file mode 100644
index 0000000..ca7ffed
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-11869.patch
@@ -0,0 +1,97 @@
+From ac2071c3791b67fc7af78b8ceb320c01ca1b5df7 Mon Sep 17 00:00:00 2001
+From: BALATON Zoltan <balaton@eik.bme.hu>
+Date: Mon, 6 Apr 2020 22:34:26 +0200
+Subject: [PATCH] ati-vga: Fix checks in ati_2d_blt() to avoid crash
+
+In some corner cases (that never happen during normal operation but a
+malicious guest could program wrong values) pixman functions were
+called with parameters that result in a crash. Fix this and add more
+checks to disallow such cases.
+
+Reported-by: Ziming Zhang <ezrakiez@gmail.com>
+Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
+Message-id: 20200406204029.19559747D5D@zero.eik.bme.hu
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=ac2071c3791b67fc7af78b8ceb320c01ca1b5df7]
+CVE: CVE-2020-11869
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ hw/display/ati_2d.c | 37 ++++++++++++++++++++++++++-----------
+ 1 file changed, 26 insertions(+), 11 deletions(-)
+
+diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
+index 42e8231..23a8ae0 100644
+--- a/hw/display/ati_2d.c
++++ b/hw/display/ati_2d.c
+@@ -53,12 +53,20 @@ void ati_2d_blt(ATIVGAState *s)
+             s->vga.vbe_start_addr, surface_data(ds), surface_stride(ds),
+             surface_bits_per_pixel(ds),
+             (s->regs.dp_mix & GMC_ROP3_MASK) >> 16);
+-    int dst_x = (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ?
+-                 s->regs.dst_x : s->regs.dst_x + 1 - s->regs.dst_width);
+-    int dst_y = (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ?
+-                 s->regs.dst_y : s->regs.dst_y + 1 - s->regs.dst_height);
++    unsigned dst_x = (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ?
++                      s->regs.dst_x : s->regs.dst_x + 1 - s->regs.dst_width);
++    unsigned dst_y = (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ?
++                      s->regs.dst_y : s->regs.dst_y + 1 - s->regs.dst_height);
+     int bpp = ati_bpp_from_datatype(s);
++    if (!bpp) {
++        qemu_log_mask(LOG_GUEST_ERROR, "Invalid bpp\n");
++        return;
++    }
+     int dst_stride = DEFAULT_CNTL ? s->regs.dst_pitch : s->regs.default_pitch;
++    if (!dst_stride) {
++        qemu_log_mask(LOG_GUEST_ERROR, "Zero dest pitch\n");
++        return;
++    }
+     uint8_t *dst_bits = s->vga.vram_ptr + (DEFAULT_CNTL ?
+                         s->regs.dst_offset : s->regs.default_offset);
+ 
+@@ -82,12 +90,16 @@ void ati_2d_blt(ATIVGAState *s)
+     switch (s->regs.dp_mix & GMC_ROP3_MASK) {
+     case ROP3_SRCCOPY:
+     {
+-        int src_x = (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ?
+-                     s->regs.src_x : s->regs.src_x + 1 - s->regs.dst_width);
+-        int src_y = (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ?
+-                     s->regs.src_y : s->regs.src_y + 1 - s->regs.dst_height);
++        unsigned src_x = (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ?
++                       s->regs.src_x : s->regs.src_x + 1 - s->regs.dst_width);
++        unsigned src_y = (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ?
++                       s->regs.src_y : s->regs.src_y + 1 - s->regs.dst_height);
+         int src_stride = DEFAULT_CNTL ?
+                          s->regs.src_pitch : s->regs.default_pitch;
++        if (!src_stride) {
++            qemu_log_mask(LOG_GUEST_ERROR, "Zero source pitch\n");
++            return;
++        }
+         uint8_t *src_bits = s->vga.vram_ptr + (DEFAULT_CNTL ?
+                             s->regs.src_offset : s->regs.default_offset);
+ 
+@@ -137,8 +149,10 @@ void ati_2d_blt(ATIVGAState *s)
+                                     dst_y * surface_stride(ds),
+                                     s->regs.dst_height * surface_stride(ds));
+         }
+-        s->regs.dst_x += s->regs.dst_width;
+-        s->regs.dst_y += s->regs.dst_height;
++        s->regs.dst_x = (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ?
++                         dst_x + s->regs.dst_width : dst_x);
++        s->regs.dst_y = (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ?
++                         dst_y + s->regs.dst_height : dst_y);
+         break;
+     }
+     case ROP3_PATCOPY:
+@@ -179,7 +193,8 @@ void ati_2d_blt(ATIVGAState *s)
+                                     dst_y * surface_stride(ds),
+                                     s->regs.dst_height * surface_stride(ds));
+         }
+-        s->regs.dst_y += s->regs.dst_height;
++        s->regs.dst_y = (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ?
++                         dst_y + s->regs.dst_height : dst_y);
+         break;
+     }
+     default:
+-- 
+1.8.3.1
-- 
2.7.4

