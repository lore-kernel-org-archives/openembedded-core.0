Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.41067.1590446264817406043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 15:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=X63X4TNv;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 124so2926520pgi.9
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 15:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=eeQYGZ1v2DzGcYxGEFfGpg0sxhX1cEDnHsPmDtXJqe4=;
        b=X63X4TNvOkQC+zh60Jxdb4MPpkeq5ql7EnxUqB+HFfZF038QvQWYKfeFbwVgy+UiX8
         wBYdsI23Vfs4uVHjFeHjnJKBd2uHoQaNZzQSK2O51L+W9Liw0qMDo21Fg3d9s7l/eXbH
         7L6WaiZKDcA0s7RBjMpQ359COelCu14M0xTEqq0EL7ybeCKmXtpX6MQlqO55AmHKqkmx
         vuVRXleaIGk4UUBf6lMR74Ba8mbBiS8Fpl6RweASsW/7jOPs+zxPfgnHluMVYmUetX9m
         wcEnBvqwVlOcAU4saD2onpwJRqLledXpoIsBzObLnfVJL7oLxqlW8mDCK2mwguVmkWWG
         C0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=eeQYGZ1v2DzGcYxGEFfGpg0sxhX1cEDnHsPmDtXJqe4=;
        b=ujSYcNSpeCspsHU71CwKzuArioA1z39yEjU/oSfxCl05dojxZY8wdIn0GgjJF4ZSJ2
         y/AMRj33ZUfkG46dHsJFYeB8fG3U7a64mTe3yLL3yo6paH0itCu1oYqLxL2kW0U9eQzI
         bNC1oadCCPVmC/UNa5E5jyBUdQB888WvW0ncdevyGqYWDCa/HoFrx7/Al9GordrAOR9a
         PmiE9K3zus3Pb+E3+PlBsaLNKH+5H0Mb4JAsgyEtVgkbSCIDeCadeSUp+3Jor3DK4dGS
         FEDXfLcWLFtJApf3Tuj2g1cU6g+meez56QVghnGzSaEDxnUd9i9d0TFVpbpNxBSXMEIN
         DvuQ==
X-Gm-Message-State: AOAM531uMnbjXK1lUB+CwNwU0YA4XrW3Mvhn3tNF9mhuAE85Y+ZYLiC/
	qiQ5jeAtF3cECHTHxzO82peSdHt0GRk=
X-Google-Smtp-Source: ABdhPJxt157KRgpyzkbv2/LmNr1dxx6qCWHdjNlXSSz0BQ83Q+WouShEsmnJbN1IK1La52gEfIPNpg==
X-Received: by 2002:aa7:82d5:: with SMTP id f21mr7702812pfn.154.1590446263837;
        Mon, 25 May 2020 15:37:43 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y23sm1990432pje.3.2020.05.25.15.37.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 15:37:43 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/17] qemu: fix CVE-2020-11869
Date: Mon, 25 May 2020 12:36:56 -1000
Message-Id: <1af607d9e635e7cf2f6cf3e4c6d05f1e2cb6acc9.1590445868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590445868.git.steve@sakoman.com>
References: <cover.1590445868.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 5f01d45266bbc0d0f1a32d10c0841326193cc9c1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-11869.patch            | 97 +++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-11869.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 7a1ccf2115..126e7d442c 100644
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
index 0000000000..ca7ffed934
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
2.17.1

