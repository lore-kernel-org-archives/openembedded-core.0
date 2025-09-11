Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C840CAC596
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 08:51:48 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.41412.1757580703990204033
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 01:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nYKc8NRy;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3e3aafe06a7so304915f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 01:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757580702; x=1758185502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQnS0KsVuXSHOWFxdDw2o6DCyM71qsdw8INANKUbahs=;
        b=nYKc8NRykmh9yRgoriYgSZW45sBQwLgIbt8aNLxxJFVjP1DsOIVqfoURf/OuwsBvEn
         liCc374nxcbzhlcPA2UZnv6oche3LCAUSbOyC87aPGbGG7UQ3BwNHQs7lNVknvnJY6+F
         SevqV3Cf+W5aEgA9hDGYnNLPh47U1NgFbm6peONyiDJ/y2UF3yU43x0JgRddCiH5pvh2
         BKBBG8YsbwhYYvEYm7pQaOZKlbLYD3aaBkIfQXC309LeuAUVIb1SEo/1ei6+O4t1IrKX
         uO8yOKexCHcPceBPbgZPofBq+NzNvv/bhQLxr28umPjc+de/I1ZkBhNplmW8UGhDmeCV
         fxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580702; x=1758185502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQnS0KsVuXSHOWFxdDw2o6DCyM71qsdw8INANKUbahs=;
        b=V6LMwZUmmBn9vmetz9NG4Nd7Su/6wrcBz5doM3rCpIFYYKgSJUDsj1oOkTggej0QEY
         fsx+K2AIhchA3STkVgJ9yA5aRZDSep9VRyHITeJrEWYooXte92mwkjCAwWyVIXb3NrgY
         ZT+xsg1iBAeqanLlKhSCMWQI3biHc01zitIMS2GIBb7wepU9e84CQrCpEqpB0szDG/3e
         2N90T2zBQdnMsZvAVzPNPXI65kRJJvdDVt7JBVmiT/jBPZRL7b/j05/rGIjjdWDsx2/l
         veBB1AccBqdsxqyHjMfJ0LIJPGPMlw99dtGWMpfDWsnDerJGaByINKwC4xXJ50oR81E4
         MMxw==
X-Gm-Message-State: AOJu0YyWANSa+XycjmIi1oTFQOP6PlAbOShY+fwCLa47QfBuYqKNwpnC
	uF5o0zEe5yYgHErIkN2JLdBmkXWiuMd9HS/vwhAXNAXGU50Yf2Y3M4XqMGXGEg==
X-Gm-Gg: ASbGncue9MbdJmP2pschhHciHz5Jy+Cu5koaIDiSXFJQr0/rymyc8CY5WAR8Jwmm7if
	gpFVOZBONkV7QbmQnS3dv2n1qiLXnR2YZFu95i9BdYJOfkJn+dFeasGWCEo+m2x2aN0VeJyClVJ
	NcJGvN/BBlXjSA6Og9tqP6OlCL8SdWa1ojydL52VzUtaxbsZDnjwZWGn9CiBJE6zS0Z6iDSvC5l
	yFAqf/p5kZ3jJKcOxIKLkZEhrxCiX6P79bN/yFhTzc5gWCY9PxUYVfgNQ1kP1kmzFOhmncmJ1P1
	9LBxYSpxi/aF8DwVP1ko0IoQr5jKb6XEA53rPK7IEhLWgO2VEUUtnu04QDIEfVQGFhP6KX9OGMw
	ILhIWLIabQZznuNjmDcjsmgOstiq80nwFO5hbQNDc7YpKXYa6yHyxmCB7UqrysTo06CK2FNXGG4
	ttQAk2OG8i2KMRfinHQy+CwecqnYa2s2dqdmkMx2G9/vtd6b7PSfAkaLPKYy7Aq4n4mQ3JFYN3i
	UV//Xk=
X-Google-Smtp-Source: AGHT+IGx8Dsi3LTSysQwahAnS1YePQ2bNB6tWRRTtx0ozFL0le0Jf2EgU2Ujo8MWywK636X/c9q/OA==
X-Received: by 2002:a5d:5848:0:b0:3e0:c28a:abe1 with SMTP id ffacd0b85a97d-3e641c4c826mr15887846f8f.14.1757580702192;
        Thu, 11 Sep 2025 01:51:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b2f4esm19382005e9.17.2025.09.11.01.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 01:51:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/16] fontconfig: update 2.15.0 -> 2.17.1
Date: Thu, 11 Sep 2025 10:51:19 +0200
Message-Id: <20250911085123.1551425-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911085123.1551425-1-alex.kanavin@gmail.com>
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 08:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223259

From: Alexander Kanavin <alex@linutronix.de>

Tarballs have relocated to gitlab.

Convert to meson.

License-update: trim the code, keep only the license
(there used to be a second copyright notice from a different author but
with mostly same MIT-ish content)

Add a backport to fix musl builds.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../fontconfig/fontconfig/musl-fix.patch      | 66 +++++++++++++++++++
 ...tconfig_2.15.0.bb => fontconfig_2.17.1.bb} | 15 +++--
 2 files changed, 74 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-graphics/fontconfig/fontconfig/musl-fix.patch
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.15.0.bb => fontconfig_2.17.1.bb} (75%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig/musl-fix.patch b/meta/recipes-graphics/fontconfig/fontconfig/musl-fix.patch
new file mode 100644
index 00000000000..c4508bd15a0
--- /dev/null
+++ b/meta/recipes-graphics/fontconfig/fontconfig/musl-fix.patch
@@ -0,0 +1,66 @@
+From 75cc3e6ef0e451f42d3464ed4d639304ad9a4f58 Mon Sep 17 00:00:00 2001
+From: Akira TAGOH <akira@tagoh.org>
+Date: Thu, 3 Jul 2025 03:31:49 +0900
+Subject: [PATCH] test: Fix a build issue with musl libc
+
+Fixes https://gitlab.freedesktop.org/fontconfig/fontconfig/-/issues/484
+
+Changelog: fixed
+Upstream-Status: Backport [https://gitlab.freedesktop.org/fontconfig/fontconfig/-/commit/75cc3e6ef0e451f42d3464ed4d639304ad9a4f58]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ test/test-mt-fccfg.c | 22 ++++++++++++++++++++--
+ 1 file changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/test/test-mt-fccfg.c b/test/test-mt-fccfg.c
+index 24ad7583..3b7d843d 100644
+--- a/test/test-mt-fccfg.c
++++ b/test/test-mt-fccfg.c
+@@ -1,9 +1,12 @@
+ /* Copyright (C) 2025 fontconfig Authors */
+ /* SPDX-License-Identifier: HPND */
++#ifdef HAVE_CONFIG_H
++#  include "config.h"
++#endif
++
+ #include <fontconfig/fontconfig.h>
+ 
+ #include <stdio.h>
+-#define __USE_XOPEN
+ #include <pthread.h>
+ #include <stdlib.h>
+ 
+@@ -13,6 +16,21 @@ struct thr_arg_s {
+     int thr_num;
+ };
+ 
++#ifdef _WIN32
++int
++setenv (const char *name, const char *value, int o)
++{
++    size_t len = strlen (name) + strlen (value) + 1;
++    char  *s = malloc (len + 1);
++    int    ret;
++
++    snprintf (s, len, "%s=%s", name, value);
++    ret = _putenv (s);
++    free (s);
++    return ret;
++}
++#endif
++
+ static void *
+ run_test_in_thread (void *arg)
+ {
+@@ -61,7 +79,7 @@ test (void)
+     if (c1 == c2)
+ 	return 1;
+     /* To make visible if we have any references */
+-    putenv ("FC_DEBUG=16");
++    setenv ("FC_DEBUG", "16", 1);
+     FcFini();
+ 
+     return 0;
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
similarity index 75%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
index b737447e472..17d2f87dd6f 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
@@ -13,20 +13,21 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=fontconfig"
 
 LICENSE = "MIT & MIT & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=00252fd272bf2e722925613ad74cb6c7 \
-                    file://src/fcfreetype.c;endline=45;md5=ef8702fbf3dc506715be8a9d69cb0252 \
+                    file://src/fcfreetype.c;endline=23;md5=f7c0140c1b0387cf4cf45420b059847c \
                     "
 
 SECTION = "libs"
 
 DEPENDS = "expat freetype zlib gperf-native util-linux"
 
-SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
+SRC_URI = "https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/${PV}/fontconfig-${PV}.tar.xz \
            file://revert-static-pkgconfig.patch \
+           file://musl-fix.patch \
            "
+SRC_URI[sha256sum] = "9f5cae93f4fffc1fbc05ae99cdfc708cd60dfd6612ffc0512827025c026fa541"
 
-SRC_URI[sha256sum] = "f5f359d6332861bd497570848fcb42520964a9e83d5e3abe397b6b6db9bcaaf4"
-
-UPSTREAM_CHECK_REGEX = "fontconfig-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
+UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/fontconfig/fontconfig/-/tags"
+UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
 
 do_configure:prepend() {
     # work around https://bugs.freedesktop.org/show_bug.cgi?id=101280
@@ -56,7 +57,7 @@ RREPLACES:fontconfig-utils = "libfontconfig-utils"
 RCONFLICTS:fontconfig-utils = "libfontconfig-utils"
 DEBIAN_NOAUTONAME:fontconfig-utils = "1"
 
-inherit autotools pkgconfig relative_symlinks gettext
+inherit meson pkgconfig relative_symlinks gettext
 
 FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
 
@@ -64,6 +65,6 @@ FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
 # /usr/share/fonts is already included by default (you can change it with --with-default-fonts)
 FONTCONFIG_FONT_DIRS ?= "no"
 
-EXTRA_OECONF = " --disable-docs --with-default-fonts=${datadir}/fonts --with-cache-dir=${FONTCONFIG_CACHE_DIR} --with-add-fonts=${FONTCONFIG_FONT_DIRS}"
+EXTRA_OEMESON = " -Ddoc=disabled -Ddefault-fonts-dirs=${datadir}/fonts -Dcache-dir=${FONTCONFIG_CACHE_DIR} -Dadditional-fonts-dirs=${FONTCONFIG_FONT_DIRS}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


