Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66D3C19F2C
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 15:24:38 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web08.506.1659108274699100891
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 08:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=w6P9VDPI;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id e132so4269906pgc.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 08:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=n+7nvP+18rz7hujGRV7Zq5MJJohzc9aIL5TikuPDitY=;
        b=w6P9VDPI/YxZJi1HKeEdyx6MiaekFZvMTeDw4uFTVilMfmb99c+nG2OvbJCeBv8TO4
         xMuzGa2MUp7vmYCVpV+ahv4osT5/eGrpX8NzGz+lR4MHVS1OhZ1l2iOfpscvTCKtvo9X
         f8L/olAGdsPlp3faZDY8l/mYES8krQZTlUnKAZ24UP3vnPihZDLNhGoJgHpO21BxZYSy
         p+UixkFpWiJygyJtQBgoidbn4Ysrdy7XXo9wE5JDScDC2/q5zxw5buJvFO+7aXEv17o9
         kCmOsuiacPEeBxQJaSbzPtTz3EjggLoREGQ5zBwvSLZL/VBHPqnA7wn1XrrNvzyULIsY
         8rig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n+7nvP+18rz7hujGRV7Zq5MJJohzc9aIL5TikuPDitY=;
        b=4YmHLD4avA6A4irSFvljbkZuLB70rRo/2vkEiPYT90OcjHcVtFw1083Ub22gp1UlMc
         UTkfp+F2skRU+ckKkbEANSR/K0FSb7jZgDiOtqP7wMT6CVGFjxbz2dSzmeZYRHLLdROZ
         h4/Vk2XDK3fUrt2iCODVmMs9s2UeAhYBckl0Ur8EfRkOZ81iGXKlX0Jhb72W81uWNFij
         pY+iguR+VGI1Ik9/VDTxURFaomybQ1tpc9/ViqjX3/woXBTeCREaYPadAzisdsmkzQjC
         0Xgdl3iK5RzkKsFhxxUcyE/K8vzAjbBzO8++Eg/j3vzUHG5RwsrtKKZpf+vegyASt/W3
         WL/g==
X-Gm-Message-State: AJIora97ATiZIAssNO7HW6YlLz46Mdrc8sWe0AUkl6FvcT3bRG8hwyBA
	/ndfhY1m0Y+rik4+QIbNG6+iDl8BkmVlO0BT
X-Google-Smtp-Source: 
 AGRyM1soGwE8Xp7VZqKi1eRD1otJC0MPalkE0PNmnm0R1+7WKmhbuTTj2Y2U4TtKSo6y45TSZgiehQ==
X-Received: by 2002:a05:6a00:989:b0:52b:1d96:a8da with SMTP id
 u9-20020a056a00098900b0052b1d96a8damr4013820pfg.86.1659108273479;
        Fri, 29 Jul 2022 08:24:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q16-20020a17090311d000b0016be6a554b5sm3889808plh.233.2022.07.29.08.24.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 08:24:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/7] libjpeg-turbo: Fix CVE-2021-46822
Date: Fri, 29 Jul 2022 05:24:06 -1000
Message-Id: 
 <80d14a9aaff273daca68c2e860701d51fee45851.1659108121.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659108121.git.steve@sakoman.com>
References: <cover.1659108121.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 15:24:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168667

From: "Sana.Kazi" <Sana.Kazi@kpit.com>

Add patch to fix CVE-2021-46822
Link: https://github.com/libjpeg-turbo/libjpeg-turbo/commit/f35fd27ec641c42d6b115bfa595e483ec58188d2.patch

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../jpeg/files/CVE-2021-46822.patch           | 133 ++++++++++++++++++
 .../jpeg/libjpeg-turbo_2.0.4.bb               |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2021-46822.patch

diff --git a/meta/recipes-graphics/jpeg/files/CVE-2021-46822.patch b/meta/recipes-graphics/jpeg/files/CVE-2021-46822.patch
new file mode 100644
index 0000000000..68cf89e628
--- /dev/null
+++ b/meta/recipes-graphics/jpeg/files/CVE-2021-46822.patch
@@ -0,0 +1,133 @@
+From f35fd27ec641c42d6b115bfa595e483ec58188d2 Mon Sep 17 00:00:00 2001
+From: DRC <information@libjpeg-turbo.org>
+Date: Tue, 6 Apr 2021 12:51:03 -0500
+Subject: [PATCH] tjLoadImage: Fix issues w/loading 16-bit PPMs/PGMs
+
+- The PPM reader now throws an error rather than segfaulting (due to a
+  buffer overrun) if an application attempts to load a 16-bit PPM file
+  into a grayscale uncompressed image buffer.  No known applications
+  allowed that (not even the test applications in libjpeg-turbo),
+  because that mode of operation was never expected to work and did not
+  work under any circumstances.  (In fact, it was necessary to modify
+  TJBench in order to reproduce the issue outside of a fuzzing
+  environment.)  This was purely a matter of making the library bow out
+  gracefully rather than crash if an application tries to do something
+  really stupid.
+
+- The PPM reader now throws an error rather than generating incorrect
+  pixels if an application attempts to load a 16-bit PGM file into an
+  RGB uncompressed image buffer.
+
+- The PPM reader now correctly loads 16-bit PPM files into extended
+  RGB uncompressed image buffers.  (Previously it generated incorrect
+  pixels unless the input colorspace was JCS_RGB or JCS_EXT_RGB.)
+
+The only way that users could have potentially encountered these issues
+was through the tjLoadImage() function.  cjpeg and TJBench were
+unaffected.
+
+CVE: CVE-2021-46822
+Upstream-Status: Backport [https://github.com/libjpeg-turbo/libjpeg-turbo/commit/f35fd27ec641c42d6b115bfa595e483ec58188d2.patch]
+Comment: Refreshed hunks from ChangeLog.md
+         Refreshed hunks from rdppm.c
+
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+
+---
+ ChangeLog.md | 10 ++++++++++
+ rdppm.c      | 26 ++++++++++++++++++++------
+ 2 files changed, 30 insertions(+), 6 deletions(-)
+
+diff --git a/ChangeLog.md b/ChangeLog.md
+index 968969c6b..12e730a0e 100644
+--- a/ChangeLog.md
++++ b/ChangeLog.md
+@@ -44,6 +44,15 @@
+ that maximum value was less than 255.  libjpeg-turbo 1.5.0 already included a
+ similar fix for binary PPM/PGM files with maximum values greater than 255.
+
++7. The PPM reader now throws an error, rather than segfaulting (due to a buffer
++overrun) or generating incorrect pixels, if an application attempts to use the
++`tjLoadImage()` function to load a 16-bit binary PPM file (a binary PPM file
++with a maximum value greater than 255) into a grayscale image buffer or to load
++a 16-bit binary PGM file into an RGB image buffer.
++
++8. Fixed an issue in the PPM reader that caused incorrect pixels to be
++generated when using the `tjLoadImage()` function to load a 16-bit binary PPM
++file into an extended RGB image buffer.
+
+ 2.0.3
+ =====
+diff --git a/rdppm.c b/rdppm.c
+index c4c937e8a..6ac8fdbf7 100644
+--- a/rdppm.c
++++ b/rdppm.c
+@@ -5,7 +5,7 @@
+  * Copyright (C) 1991-1997, Thomas G. Lane.
+  * Modified 2009 by Bill Allombert, Guido Vollbeding.
+  * libjpeg-turbo Modifications:
+- * Copyright (C) 2015-2017, 2020, D. R. Commander.
++ * Copyright (C) 2015-2017, 2020-2021, D. R. Commander.
+  * For conditions of distribution and use, see the accompanying README.ijg
+  * file.
+  *
+@@ -516,6 +516,11 @@ get_word_rgb_row(j_compress_ptr cinfo, cjpeg_source_ptr sinfo)
+   register JSAMPLE *rescale = source->rescale;
+   JDIMENSION col;
+   unsigned int maxval = source->maxval;
++  register int rindex = rgb_red[cinfo->in_color_space];
++  register int gindex = rgb_green[cinfo->in_color_space];
++  register int bindex = rgb_blue[cinfo->in_color_space];
++  register int aindex = alpha_index[cinfo->in_color_space];
++  register int ps = rgb_pixelsize[cinfo->in_color_space];
+
+   if (!ReadOK(source->pub.input_file, source->iobuffer, source->buffer_width))
+     ERREXIT(cinfo, JERR_INPUT_EOF);
+@@ -527,17 +532,20 @@ get_word_rgb_row(j_compress_ptr cinfo, cjpeg_source_ptr sinfo)
+     temp |= UCH(*bufferptr++);
+     if (temp > maxval)
+       ERREXIT(cinfo, JERR_PPM_OUTOFRANGE);
+-    *ptr++ = rescale[temp];
++    ptr[rindex] = rescale[temp];
+     temp  = UCH(*bufferptr++) << 8;
+     temp |= UCH(*bufferptr++);
+     if (temp > maxval)
+       ERREXIT(cinfo, JERR_PPM_OUTOFRANGE);
+-    *ptr++ = rescale[temp];
++    ptr[gindex] = rescale[temp];
+     temp  = UCH(*bufferptr++) << 8;
+     temp |= UCH(*bufferptr++);
+     if (temp > maxval)
+       ERREXIT(cinfo, JERR_PPM_OUTOFRANGE);
+-    *ptr++ = rescale[temp];
++    ptr[bindex] = rescale[temp];
++    if (aindex >= 0)
++      ptr[aindex] = 0xFF;
++    ptr += ps;
+   }
+   return 1;
+ }
+@@ -624,7 +632,10 @@ start_input_ppm(j_compress_ptr cinfo, cjpeg_source_ptr sinfo)
+       cinfo->in_color_space = JCS_GRAYSCALE;
+     TRACEMS2(cinfo, 1, JTRC_PGM, w, h);
+     if (maxval > 255) {
+-      source->pub.get_pixel_rows = get_word_gray_row;
++      if (cinfo->in_color_space == JCS_GRAYSCALE)
++        source->pub.get_pixel_rows = get_word_gray_row;
++      else
++        ERREXIT(cinfo, JERR_BAD_IN_COLORSPACE);
+     } else if (maxval == MAXJSAMPLE && sizeof(JSAMPLE) == sizeof(U_CHAR) &&
+                cinfo->in_color_space == JCS_GRAYSCALE) {
+       source->pub.get_pixel_rows = get_raw_row;
+@@ -657,7 +657,10 @@
+       cinfo->in_color_space = JCS_EXT_RGB;
+     TRACEMS2(cinfo, 1, JTRC_PPM, w, h);
+     if (maxval > 255) {
+-      source->pub.get_pixel_rows = get_word_rgb_row;
++      if (IsExtRGB(cinfo->in_color_space))
++              source->pub.get_pixel_rows = get_word_rgb_row;
++              else
++              ERREXIT(cinfo, JERR_BAD_IN_COLORSPACE);
+     } else if (maxval == MAXJSAMPLE && sizeof(JSAMPLE) == sizeof(U_CHAR) &&
+                (cinfo->in_color_space == JCS_EXT_RGB
+ #if RGB_RED == 0 && RGB_GREEN == 1 && RGB_BLUE == 2 && RGB_PIXELSIZE == 3
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
index 3005a8a789..6575582b0c 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
@@ -13,6 +13,7 @@ DEPENDS_append_x86_class-target    = " nasm-native"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
            file://CVE-2020-13790.patch \
+           file://CVE-2021-46822.patch \
            "
 
 SRC_URI[md5sum] = "d01d9e0c28c27bc0de9f4e2e8ff49855"
-- 
2.25.1


