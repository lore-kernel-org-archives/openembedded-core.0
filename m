Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BAFF357A5
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:21 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21471.1771943110956718747
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nSGCFEts;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-483487335c2so50950915e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943109; x=1772547909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jbcsx3BADZMTu9SZChhWfEw/deZsTNOtCYBnzlS4wAI=;
        b=nSGCFEtsmJsGaNpffNtgI3PTfT0imIjvdqTJPYPuzgBcYnqsC5LRydLW93N+zqa32f
         8o3uUr0NoV8h9r9pjRtdt8a1T/4i2MgNnB0+ntSONSGOV5LaqkJf81ZttqPAaZwqFQpf
         eOG0yi65mNsVCFe8cnIt5kP3AzbBRbl4S9F0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943109; x=1772547909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jbcsx3BADZMTu9SZChhWfEw/deZsTNOtCYBnzlS4wAI=;
        b=pNDD/mOcZ3+lUOxLl8sRyXGGTpFxJTUHthmdRoSj5905T9tiODbclZKQdMBJpYCjue
         ZjJx9t6E/55latxt6akTfDzJV/7o9CVMJcbRpbZW/Q9CQrT+Ic5XkAn/dgniENSng8oD
         LxaVvG6zNxlMaOxT1SRFUnGjVSGhsYJZQZfhwHFfbbHmCr434/Lyt8KexPau4TA4AleD
         /ejiyPT85ys7qqjuh6KeX6cJkOqpzUl6d0yqowfPijvz/59FdpzG0FZ4R0HDTNHP61fh
         /BGVU6nUvYZhh/Tl2Ngq/gLHcdDIggkWfSDYUppknH/sDqP6VhzDq7o6segiLBg0GiUU
         LL/w==
X-Gm-Message-State: AOJu0YwnqpddqKm7u5ICcVkdKI327HwxIZuMWtEnt3K+gp+qB+s2MlGz
	h+bvte0tg+eYLF4GBfdB/7vLeSXLmAQMP/lghC6ITdqpBRDi3DRNo+lCy+gdPWXG80OJgRXP3WT
	Bss+0
X-Gm-Gg: AZuq6aJmt8HP4M9MMyA4trwgwd//WWVGf2Vkv1GSpdPlTy1PU+2QHB5wPiRo9LW6h9j
	XLRW7CxBTYmSURuw8lNbqtaZ99R/k05Tm4CcXiKBzOwMJEFH2Umwqiq42xmRzsdyuuxZZvGIW3m
	fKih50VSY8iHKx9dJi3gZLljJsTcbVXPovlmZvkXSGBfZn4tsGtqqHA4drdnwezbDRCRezsNFd2
	baYypV89HfI/SgX5TmT1AabFrAsWl5JEoRKmkrwXrnwjSyRFswuoN6RVnp9p2AbgONo82vdy/cu
	jbcBOXGD/JLEjxA4mPjhneNl1uR4VQIYVZqHY/FznUcHLpne7RHuxUuopfHqEq19Mibq9l0lo9u
	T59H9lAdWcbbrXoiYBN01s73I0BwYhcckNaCcb49Mv6xWvwIJ5tyRswYpv0RF+wc5UVxaw+3cxG
	lToJo/vOGX82IszBdKMxvuAEnBrkmvXyFc0Y1XscGxvIoIdJ6u1AbYLyXQ2jpPYd7Yd5M5Dgweh
	Uoj6n+y52ZGzF0ilTNCm7iePYe7HpZg1g==
X-Received: by 2002:a05:600c:3b17:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-483a95b15b6mr218659805e9.7.1771943108729;
        Tue, 24 Feb 2026 06:25:08 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:08 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/38] libpng: patch CVE-2026-22801
Date: Tue, 24 Feb 2026 15:24:11 +0100
Message-ID: <1f634bbd046a2443bd7e6d5c2fc0b0210012c8fe.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231785

From: Peter Marko <peter.marko@siemens.com>

Pick comit per [1].

[1] https://github.com/pnggroup/libpng/security/advisories/GHSA-vgjq-8cw5-ggw8

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpng/files/CVE-2026-22801.patch         | 164 ++++++++++++++++++
 .../libpng/libpng_1.6.39.bb                   |   1 +
 2 files changed, 165 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-22801.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-22801.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-22801.patch
new file mode 100644
index 00000000000..544134e1342
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2026-22801.patch
@@ -0,0 +1,164 @@
+From cf155de014fc6c5cb199dd681dd5c8fb70429072 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Sat, 10 Jan 2026 15:20:18 +0200
+Subject: [PATCH] fix: Remove incorrect truncation casts from
+ `png_write_image_*`
+
+The type of the row stride (`display->row_bytes`) is ptrdiff_t. Casting
+to png_uint_16 before division will truncate large strides, causing
+incorrect pointer arithmetic for images exceeding 65535 bytes per row.
+For bottom-up images (negative stride), the truncation also corrupts
+the sign, advancing the row pointer forward instead of backward.
+
+Remove the erroneous casts and let the compiler handle the pointer
+arithmetic correctly. Also replace `sizeof (png_uint_16)` with 2.
+
+Add regression test via `pngstest --stride-extra N` where N > 32767
+triggers the affected code paths.
+
+A NOTE ABOUT HISTORY:
+The original code in libpng 1.5.6 (2011) had no such casts. They were
+introduced in libpng 1.6.26 (2016), likely to silence compiler warnings
+on 16-bit systems where the cast would be a no-op. On 32/64-bit systems
+the cast truncates the strides above 65535 and corrupts the negative
+strides.
+
+CVE: CVE-2026-22801
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/cf155de014fc6c5cb199dd681dd5c8fb70429072]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ CMakeLists.txt              |  7 +++++++
+ contrib/libtests/pngstest.c | 29 ++++++++++++++++++++++++++++-
+ pngwrite.c                  | 10 +++++-----
+ tests/pngstest-large-stride |  8 ++++++++
+ 4 files changed, 48 insertions(+), 6 deletions(-)
+ create mode 100755 tests/pngstest-large-stride
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a8cd82402..a595ed91d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -804,6 +804,13 @@ if(PNG_TESTS AND PNG_SHARED)
+     endforeach()
+   endforeach()
+ 
++  # Regression test:
++  # Use stride_extra > 32767 to trigger row_bytes > 65535 for linear images.
++  png_add_test(NAME pngstest-large-stride
++               COMMAND pngstest
++               OPTIONS --stride-extra 33000 --tmpfile "large-stride-" --log
++               FILES "${CMAKE_CURRENT_SOURCE_DIR}/contrib/testpngs/rgb-alpha-16-linear.png")
++
+   add_executable(pngunknown ${pngunknown_sources})
+   target_link_libraries(pngunknown png)
+ 
+diff --git a/contrib/libtests/pngstest.c b/contrib/libtests/pngstest.c
+index ff4c2b24a..2f29afee2 100644
+--- a/contrib/libtests/pngstest.c
++++ b/contrib/libtests/pngstest.c
+@@ -1,7 +1,7 @@
+ 
+ /* pngstest.c
+  *
+- * Copyright (c) 2021 Cosmin Truta
++ * Copyright (c) 2021-2026 Cosmin Truta
+  * Copyright (c) 2013-2017 John Cunningham Bowler
+  *
+  * This code is released under the libpng license.
+@@ -3571,6 +3571,33 @@ main(int argc, char **argv)
+          opts |= NO_RESEED;
+       else if (strcmp(arg, "--fault-gbg-warning") == 0)
+          opts |= GBG_ERROR;
++      else if (strcmp(arg, "--stride-extra") == 0)
++      {
++         if (c+1 < argc)
++         {
++            char *ep;
++            unsigned long val = strtoul(argv[++c], &ep, 0);
++
++            if (ep > argv[c] && *ep == 0 && val <= 65535)
++               stride_extra = (int)val;
++
++            else
++            {
++               fflush(stdout);
++               fprintf(stderr, "%s: bad argument for --stride-extra: %s\n",
++                  argv[0], argv[c]);
++               exit(99);
++            }
++         }
++
++         else
++         {
++            fflush(stdout);
++            fprintf(stderr, "%s: missing argument for --stride-extra\n",
++               argv[0]);
++            exit(99);
++         }
++      }
+       else if (strcmp(arg, "--tmpfile") == 0)
+       {
+          if (c+1 < argc)
+diff --git a/pngwrite.c b/pngwrite.c
+index 08066bcc4..a95b846c8 100644
+--- a/pngwrite.c
++++ b/pngwrite.c
+@@ -1,7 +1,7 @@
+ 
+ /* pngwrite.c - general routines to write a PNG file
+  *
+- * Copyright (c) 2018-2022 Cosmin Truta
++ * Copyright (c) 2018-2026 Cosmin Truta
+  * Copyright (c) 1998-2002,2004,2006-2018 Glenn Randers-Pehrson
+  * Copyright (c) 1996-1997 Andreas Dilger
+  * Copyright (c) 1995-1996 Guy Eric Schalnat, Group 42, Inc.
+@@ -1632,7 +1632,7 @@ png_write_image_16bit(png_voidp argument)
+       }
+ 
+       png_write_row(png_ptr, png_voidcast(png_const_bytep, display->local_row));
+-      input_row += (png_uint_16)display->row_bytes/(sizeof (png_uint_16));
++      input_row += display->row_bytes / 2;
+    }
+ 
+    return 1;
+@@ -1758,7 +1758,7 @@ png_write_image_8bit(png_voidp argument)
+ 
+          png_write_row(png_ptr, png_voidcast(png_const_bytep,
+              display->local_row));
+-         input_row += (png_uint_16)display->row_bytes/(sizeof (png_uint_16));
++         input_row += display->row_bytes / 2;
+       } /* while y */
+    }
+ 
+@@ -1783,7 +1783,7 @@ png_write_image_8bit(png_voidp argument)
+          }
+ 
+          png_write_row(png_ptr, output_row);
+-         input_row += (png_uint_16)display->row_bytes/(sizeof (png_uint_16));
++         input_row += display->row_bytes / 2;
+       }
+    }
+ 
+@@ -2102,7 +2102,7 @@ png_image_write_main(png_voidp argument)
+       ptrdiff_t row_bytes = display->row_stride;
+ 
+       if (linear != 0)
+-         row_bytes *= (sizeof (png_uint_16));
++         row_bytes *= 2;
+ 
+       if (row_bytes < 0)
+          row += (image->height-1) * (-row_bytes);
+diff --git a/tests/pngstest-large-stride b/tests/pngstest-large-stride
+new file mode 100755
+index 000000000..7958c5b42
+--- /dev/null
++++ b/tests/pngstest-large-stride
+@@ -0,0 +1,8 @@
++#!/bin/sh
++
++# Regression test:
++# Use stride_extra > 32767 to trigger row_bytes > 65535 for linear images.
++exec ./pngstest \
++     --stride-extra 33000 \
++     --tmpfile "large-stride-" \
++     --log "${srcdir}/contrib/testpngs/rgb-alpha-16-linear.png"
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
index 9ca68d9b8bc..c4347a67151 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
@@ -23,6 +23,7 @@ SRC_URI = "\
            file://CVE-2025-66293-01.patch \
            file://CVE-2025-66293-02.patch \
            file://CVE-2026-22695.patch \
+           file://CVE-2026-22801.patch \
 "
 
 SRC_URI[sha256sum] = "1f4696ce70b4ee5f85f1e1623dc1229b210029fa4b7aee573df3e2ba7b036937"

