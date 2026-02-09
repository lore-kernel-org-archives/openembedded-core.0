Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E139EE78D7D
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:36 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43987.1770629367475874317
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=etJtlE8W;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43770c94dfaso661851f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629365; x=1771234165; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8YsZYwgbVIf0f3zFJ28+/KyAsSLKohSXRNHtZDNwisw=;
        b=etJtlE8W1t564PJ+6abbxd1riA3KuZPOxMEa8XL4w20VDCqvvwcdxs0IVSo0vkrr4a
         6Q0fk9LBbN/20CZBNY9NG4Acc703i+eQa472CKfQ9LcUg2WGVPsxNzWhavY5bPsQKWZz
         rYJX1qmYFuU1Asvzfl8fX13UinDuFIV5nxI4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629365; x=1771234165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8YsZYwgbVIf0f3zFJ28+/KyAsSLKohSXRNHtZDNwisw=;
        b=B+IeqcPAfbYarRQP44YVJBPGtWJgCQRp99rHiAW3TrtwZ6dczmHU13uFXVb15amUj7
         l+RWDPdodnCaSL32HD2MhiSyVZlWsPtmGcx05SXg/OHuqJK8xCY8HY5VtcM1JcPE6GYp
         z8b58zQpa2dk9UF186mtpKkBrZz8ZidJ7OFqy6PMUU5hn7is97PKFFqrSxTEodWt9dmW
         UMXw5i+bdr4mHCJBYYQYiWwx/3foObkFPd/LBRMvo1/M0+i2rIBx85cYEQ2TivQ6PzQ6
         s5ojbgJB6TyhTbTCQ3ATOusRkcxj+cGYKmB4cpOhXSYdivUyfUR23qOwu5K+qtOQqPYN
         czBA==
X-Gm-Message-State: AOJu0Yz8H5w/g0Gsu7snCex7E0daZI5RGkXMg0DraKn3CcB/jeRE0XUF
	4rNTSIa4CJqVK5h6tEVhShtziMVSPcJMmQAyRSsuWU8kzXY9QMphY2rXWluuLCkTxi3274whYLr
	bS5/m8Ic=
X-Gm-Gg: AZuq6aJDN7izVKT9qbl0p2UkjsVJJbzqywtvcX7TjgYfHOu6GlikK/Uoe4NtC6KGb9O
	44HMTmoi2zweIY2Kh8X5YHeRf3kSa/9CYQk2XE7F3+daWbQfuOJtJsuQSXOAYuzEVBLz7fmIrlC
	sq1nF+2njzXsiutYdC2Ej3aexe0lN0gzNDj7Egg7NQHNnQq32/Ppw16sjbQu1/ZVCxvOgIFaJtk
	aEZWJ0bHNZjcXkg9Ts8wNH+s6OdHuYLi787ZKEEzwvRMZvY/lyEr3qxVA1CCQQddHA+HrO88rmq
	dPIvZPlogWvxpIDEzmDDvfdLGqM1wBeNDT5pmTR0UxL7ugboOJJmj6mEln0KBEA7Rz2yxFQARup
	s75Cbrwtz0whQHWlR8T4QEJnAsLH1hY/0em3nvbwyVkUBmR91q9z00nBH8oIX4Oz56tymZMyJ7d
	FhjR1FUJQAUnrYosBZd6HhmcW3VPY8icPzHiK0Kyg9tbgGN3vuZM0pqsY2Zvz8WjLt0TPnfEOmX
	VgnrFXf7jWNj/M=
X-Received: by 2002:a05:6000:2505:b0:432:dfea:1fa8 with SMTP id ffacd0b85a97d-4362938b33amr18125464f8f.45.1770629365362;
        Mon, 09 Feb 2026 01:29:25 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:24 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/25] libpng: patch CVE-2026-22801
Date: Mon,  9 Feb 2026 10:28:51 +0100
Message-ID: <ba41eb18b7da3148f4da04c1c784d268ca6327c2.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230759

From: Peter Marko <peter.marko@siemens.com>

Pick comit per [1].

[1] https://github.com/pnggroup/libpng/security/advisories/GHSA-vgjq-8cw5-ggw8

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpng/files/CVE-2026-22801.patch         | 173 ++++++++++++++++++
 .../libpng/libpng_1.6.42.bb                   |   1 +
 2 files changed, 174 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-22801.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-22801.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-22801.patch
new file mode 100644
index 00000000000..8a611ac7494
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2026-22801.patch
@@ -0,0 +1,173 @@
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
+ CMakeLists.txt              |  9 ++++++++-
+ contrib/libtests/pngstest.c | 29 ++++++++++++++++++++++++++++-
+ pngwrite.c                  | 10 +++++-----
+ tests/pngstest-large-stride |  8 ++++++++
+ 4 files changed, 49 insertions(+), 7 deletions(-)
+ create mode 100755 tests/pngstest-large-stride
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a8cd82402..a595ed91d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ 
+ # CMakeLists.txt - CMake lists for libpng
+ #
+-# Copyright (c) 2018-2024 Cosmin Truta.
++# Copyright (c) 2018-2026 Cosmin Truta
+ # Copyright (c) 2007-2018 Glenn Randers-Pehrson.
+ # Originally written by Christian Ehrlicher, 2007.
+ #
+@@ -859,6 +859,13 @@ if(PNG_TESTS AND PNG_SHARED)
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
+   target_link_libraries(pngunknown PRIVATE png_shared)
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
+- * Copyright (c) 2018-2024 Cosmin Truta
++ * Copyright (c) 2018-2026 Cosmin Truta
+  * Copyright (c) 1998-2002,2004,2006-2018 Glenn Randers-Pehrson
+  * Copyright (c) 1996-1997 Andreas Dilger
+  * Copyright (c) 1995-1996 Guy Eric Schalnat, Group 42, Inc.
+@@ -1645,7 +1645,7 @@ png_write_image_16bit(png_voidp argument)
+       }
+ 
+       png_write_row(png_ptr, png_voidcast(png_const_bytep, display->local_row));
+-      input_row += (png_uint_16)display->row_bytes/(sizeof (png_uint_16));
++      input_row += display->row_bytes / 2;
+    }
+ 
+    return 1;
+@@ -1771,7 +1771,7 @@ png_write_image_8bit(png_voidp argument)
+ 
+          png_write_row(png_ptr, png_voidcast(png_const_bytep,
+              display->local_row));
+-         input_row += (png_uint_16)display->row_bytes/(sizeof (png_uint_16));
++         input_row += display->row_bytes / 2;
+       } /* while y */
+    }
+ 
+@@ -1796,7 +1796,7 @@ png_write_image_8bit(png_voidp argument)
+          }
+ 
+          png_write_row(png_ptr, output_row);
+-         input_row += (png_uint_16)display->row_bytes/(sizeof (png_uint_16));
++         input_row += display->row_bytes / 2;
+       }
+    }
+ 
+@@ -2115,7 +2115,7 @@ png_image_write_main(png_voidp argument)
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
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index fe99e5df092..0e375a0ce84 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -22,6 +22,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz
            file://CVE-2025-66293-01.patch \
            file://CVE-2025-66293-02.patch \
            file://CVE-2026-22695.patch \
+           file://CVE-2026-22801.patch \
 "
 
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"

