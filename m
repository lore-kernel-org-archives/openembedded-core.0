Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7277CAC5B8
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 15:39:31 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.28580.1759246766020430547
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Sep 2025 08:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Jn9kLj8c;
 spf=pass (domain: mvista.com, ip: 209.85.210.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-781206cce18so17306b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 08:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1759246765; x=1759851565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NMTX3gtAO/Qrn3FAhKj/8/tc4+b1kI1A8YIGheFgHh8=;
        b=Jn9kLj8cRJLdjwJbTGDk9aV237RK4cWPpnf+NlmvPvHD0sFVp/EV9C7NXzQilfbHkp
         FYuc0+vomiNYuE4jkIWALI5mAhJwvxR+WWjG37BV+t0X96W8IkSHl3ksJAGT0w8Bwa+r
         xIqFAJX82fIfHMRHwICl3NtiY7MmjyGKT4AMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759246765; x=1759851565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMTX3gtAO/Qrn3FAhKj/8/tc4+b1kI1A8YIGheFgHh8=;
        b=aGStI0I2J2IlOFVGVLY46FiWXLEvHOfMJ/Ndu8E2ZF8642B7T0k3Xj4TN5EK3YdtRx
         EmlQguFcGBuTERHhUoB/QOOishbGZ8/XNiSKWC77B4Xpq/WJwuDWnF5bkteUfJ9uXscA
         hDR6VSO4tVl+hllXBDdfxBKeQGJAUHnO1NXwake3YOvp+xwMPXg/Xew4cJJZL1dXeYEM
         4WHLnw8IKosx2F28JFt5YTcS8JYh8o+RlBJshdxjQXRUDjn4gvHISzkFVIAgLj2xXwh2
         ZYEJ4TDb9FhQ5fmvDesHwO/yi76gscvil323ZGZ7qQf1KJvgNHg8IgGys4uFle1Aq+B2
         oXEg==
X-Gm-Message-State: AOJu0Yw3m4NoD6hN1u2ft1qej6RKSc7yJCzlsDd2fuDUlsMWNBf9uxyR
	1kBVTtcWhy6UC9cVpO+Y8AcgatTWt93LxWQmhrre6XC+QhEQB2Ui5y5tUhK9EN8Cm5G1RPEFH6V
	CSYx/1Ic=
X-Gm-Gg: ASbGncuOHQBkUG9Hkgb4wkZavh5fuIL9MgoEXg8OgVOoTyHPn/4oM4XJH436PlGqlxV
	A6dEP+0Hs/MvIUObsSq2pHMB8LZuSP8B49upukRtcHRSX7vCwzDtuMKltYcb6vQ2T1fGKrEzzLY
	v5/U2OEImr/JGbhU+xrhtZXdfBY86zR8FlbQHvJYT8etEs/SyU5/uf26DL+xQsQabuFGhezC/pu
	tTmMMPP05HUM9u08Xjf6Wl9SSXy5nJflp+Sy99qCA0Ibm7bEPMgoKHOoGQfmZsiVuHk2wfnKNCA
	4NAFEjluOAGznEJ4yQjXOmEEJoXexT4GHm4wVytT1EiFgkLeXfFBmxd+WwWxcqIJV5A9fZ1jBJK
	9qWEjf8GVZhPx8GVTcwcu8xQUUViwHN6iCB1RlfpYMOOXpgDwNuqdIxtB+MvBP1mp8c4oyiY=
X-Google-Smtp-Source: AGHT+IE+8om1gFkad0OqSxHdIw+AsmGNc/X8HL9O7vOLqG/ZkzU9h+rYFj2X8EqyaviJihsA7WysHw==
X-Received: by 2002:a05:6a21:3510:b0:2ce:67b2:3c41 with SMTP id adf61e73a8af0-3218b74ba56mr525616637.5.1759246764839;
        Tue, 30 Sep 2025 08:39:24 -0700 (PDT)
Received: from localhost.localdomain ([123.201.175.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c06b18sm14119106b3a.73.2025.09.30.08.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 08:39:24 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][PATCH v2] ghostscript: upgrade 10.05.1 -> 10.06.0
Date: Tue, 30 Sep 2025 21:09:01 +0530
Message-Id: <20250930153901.246829-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 15:39:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224191

From: Vijay Anusuri <vanusuri@mvista.com>

Dropped 0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch

Added 0001-Fix-32-bit-build.patch to fix 32-bit archs build

Added fPIC flag needed to prevent a linker error during the build process.

This upgrade addresses CVEs:
CVE-2025-59798, CVE-2025-59799, CVE-2025-59800, CVE-2025-59801

Changelog:
https://ghostscript.readthedocs.io/en/gs10.06.0/News.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...Fix-compatibility-with-C23-compilers.patch | 67 -------------------
 .../ghostscript/0001-Fix-32-bit-build.patch   | 63 +++++++++++++++++
 ...ript_10.05.1.bb => ghostscript_10.06.0.bb} |  6 +-
 3 files changed, 66 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-Fix-32-bit-build.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_10.05.1.bb => ghostscript_10.06.0.bb} (93%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch
deleted file mode 100644
index 78f3fc1c34..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From c595086bfe206776676e290df98cd09e91210e27 Mon Sep 17 00:00:00 2001
-From: Alex Cherepanov <alex@coscript.biz>
-Date: Thu, 3 Apr 2025 17:19:41 +0100
-Subject: [PATCH] Bug 708160: Fix compatibility with C23 compilers
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-* fixes:
-  http://errors.yoctoproject.org/Errors/Details/853021/
-
-In file included from ./base/genconf.c:18:
-./base/stdpre.h:348:13: error: ‘bool’ cannot be defined via ‘typedef’
-  348 | typedef int bool;
-      |             ^~~~
-./base/stdpre.h:348:13: note: ‘bool’ is a keyword with ‘-std=c23’ onwards
-./base/stdpre.h:348:1: warning: useless type name in empty declaration
-  348 | typedef int bool;
-      | ^~~~~~~
-
-Upstream-Status: Backport [Partial backport of https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/base/stdpre.h?id=ae940946473ceb8c5353bc6e7f04673c6e60502d]
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
- base/stdpre.h | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/base/stdpre.h b/base/stdpre.h
-index dda30b6..2f9c84e 100644
---- a/base/stdpre.h
-+++ b/base/stdpre.h
-@@ -1,4 +1,4 @@
--/* Copyright (C) 2001-2023 Artifex Software, Inc.
-+/* Copyright (C) 2001-2025 Artifex Software, Inc.
-    All Rights Reserved.
- 
-    This software is provided AS-IS with no warranty, either express or
-@@ -341,7 +341,9 @@ typedef signed char schar;
-  * and the MetroWerks C++ compiler insists that bool be equivalent to
-  * unsigned char.
-  */
--#ifndef __cplusplus
-+
-+/* C23 has bool as a builtin type. */
-+#if !defined(__cplusplus) && (!defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L)
- #ifdef __BEOS__
- typedef unsigned char bool;
- #else
-diff --git a/base/gp.h b/base/gp.h
-index ad5bb61..cf2c9cf 100644
---- a/base/gp.h
-+++ b/base/gp.h
-@@ -1,4 +1,4 @@
--/* Copyright (C) 2001-2023 Artifex Software, Inc.
-+/* Copyright (C) 2001-2025 Artifex Software, Inc.
-    All Rights Reserved.
- 
-    This software is provided AS-IS with no warranty, either express or
-@@ -646,7 +646,7 @@ int gp_fseek_impl(FILE *strm, gs_offset_t offset, int origin);
- /* Create a second open gp_file on the basis of a given one */
- FILE *gp_fdup_impl(FILE *f, const char *mode);
- 
--int gp_fseekable_impl(FILE *f);
-+bool gp_fseekable_impl(FILE *f);
- 
- /* Force given file into binary mode (no eol translations, etc) */
- /* if 2nd param true, text mode if 2nd param false */
diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-Fix-32-bit-build.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-Fix-32-bit-build.patch
new file mode 100644
index 0000000000..8d1e9d46e6
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/0001-Fix-32-bit-build.patch
@@ -0,0 +1,63 @@
+From 3c0be6e4fcffa63e4a5a1b0aec057cebc4d2562f Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Wed, 10 Sep 2025 08:55:30 +0100
+Subject: [PATCH] Fix 32-bit build
+
+Bug #708824 "ghostscript 10.06.0 compilation failure on 32-bit archs"
+
+nbytes shiouldn't be an intptr_t, it doesn't get used for pointer
+arithmetic. Previously it was a uint, should be a int64_t, to fit with
+all the other devices.
+
+Checked other warnings, and found a (very minor) one in gdevdbit.c, fix
+that while we're here (signed/unsigned mismatch, we don't really care).
+
+Upstream-Status: Backport [https://github.com/ArtifexSoftware/ghostpdl/commit/3c0be6e4fcffa63e4a5a1b0aec057cebc4d2562f]
+
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ base/gdevdbit.c | 2 +-
+ base/gdevmpla.c | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/base/gdevdbit.c b/base/gdevdbit.c
+index e07cc3f3b8..1b5c69325b 100644
+--- a/base/gdevdbit.c
++++ b/base/gdevdbit.c
+@@ -191,7 +191,7 @@ gx_default_copy_alpha_hl_color(gx_device * dev, const byte * data, int data_x,
+     fit_copy(dev, data, data_x, raster, id, x, y, width, height);
+     row_alpha = data;
+     out_raster = bitmap_raster(width * (size_t)byte_depth);
+-    if (check_64bit_multiply(out_raster, ncomps, &product) != 0)
++    if (check_64bit_multiply(out_raster, ncomps, (int64_t *) &product) != 0)
+         return gs_note_error(gs_error_undefinedresult);
+     gb_buff = gs_alloc_bytes(mem, product, "copy_alpha_hl_color(gb_buff)");
+     if (gb_buff == 0) {
+diff --git a/base/gdevmpla.c b/base/gdevmpla.c
+index 2f0d522561..ffc5ff42e6 100644
+--- a/base/gdevmpla.c
++++ b/base/gdevmpla.c
+@@ -1954,12 +1954,12 @@ mem_planar_strip_copy_rop2(gx_device * dev,
+         int i;
+         int j;
+         intptr_t chunky_sraster;
+-        intptr_t nbytes;
++        int64_t nbytes;
+         byte **line_ptrs;
+         byte *sbuf, *buf;
+ 
+         chunky_sraster = sraster * (intptr_t)mdev->num_planar_planes;
+-        if (check_64bit_multiply(height, chunky_sraster, (size_t *)&nbytes) != 0)
++        if (check_64bit_multiply(height, chunky_sraster, &nbytes) != 0)
+             return gs_note_error(gs_error_undefinedresult);
+         buf = gs_alloc_bytes(mdev->memory, nbytes, "mem_planar_strip_copy_rop(buf)");
+         if (buf == NULL) {
+@@ -2003,7 +2003,7 @@ mem_planar_strip_copy_rop2(gx_device * dev,
+         intptr_t i;
+         intptr_t chunky_t_raster;
+         int chunky_t_height;
+-        intptr_t nbytes;
++        int64_t nbytes;
+         byte **line_ptrs;
+         byte *tbuf, *buf;
+         gx_strip_bitmap newtex;
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
similarity index 93%
rename from meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
index 417bf52a99..4f6cb45412 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
@@ -24,10 +24,10 @@ def gs_verdir(v):
 SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
            file://ghostscript-9.16-Werror-return-type.patch \
            file://avoid-host-contamination.patch \
-           file://0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch \
+           file://0001-Fix-32-bit-build.patch \
            "
 
-SRC_URI[sha256sum] = "121861b6d29b2461dec6575c9f3cab665b810bd408d4ec02c86719fa708b0a49"
+SRC_URI[sha256sum] = "5bd6da34794928cc7e616f288e32bd0be7f9a5ca2d3c206a0af2c19a4e3a318f"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
@@ -47,7 +47,7 @@ EXTRA_OECONF:append:mipsarcho32 = " --with-large_color_index=0"
 EXTRA_OECONF:append:armv7a = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
 EXTRA_OECONF:append:armv7ve = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
 
-TARGET_CFLAGS += "-std=gnu17"
+TARGET_CFLAGS += "-std=gnu17 -fPIC"
 
 # Uses autoconf but not automake, can't do out-of-tree
 inherit autotools-brokensep pkgconfig
-- 
2.25.1


