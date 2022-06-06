Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32835C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:01:44 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.30991.1654516902621180731
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o/kfvmUc;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id q7so19563313wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1rzHQHHCIIJDNozBEtgpix/4UpR8Nc7ppfB+YI9+Yus=;
        b=o/kfvmUcZPUF4dORaPLcdIFlpeyY7+d9IoLynWvku5jqNvp8oJWmA7yHC1wsf0/dWa
         LjtzpEhX4De8d1zCfyfpFp6QJrpBbYRFMQm1/8W8XYnE2olhFvxMbUNzO1vNnI22u7Ue
         t4iGpjG/6Tj/2xNfbBTJwJSI/e070vX1RnGLz5uVXDVS5haXklY21dKJgndmfDeIYIDa
         0LtKs41o5VXITmJMkvan8Qb8YKtfOKnd6Gc0zWJtHoiBxryNo3geQVsBrJkdWpJ+xZu3
         Vg1yj7sXpnDgFgbgSM4BTwOY9ZbCjTDlI6hLfdKhtiSOIGp+2SY2t0mkZyINe/jfBkUY
         d5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1rzHQHHCIIJDNozBEtgpix/4UpR8Nc7ppfB+YI9+Yus=;
        b=jFV1L59jVEXzZ0HSmeRxUTWEyqNNRRd3asp9xwadCZj+SJXItcxO4+ARAT4epXW77j
         m8xtDrLB1IvA3YXa+PhxCQHmm2ClXLA3DJzd52Khmx7TIkHBTelx+PVxUbhF5D2ZAFCE
         XQ1tFAu4BOti7fPDOUm8uCrE+Mpupk5kT3jE5/ij7oDA5RgrzTDLIzYSxB54NB84ENVs
         29/HjqzIMgE9DWDLWXncAqOz29NqnpO4nQCsMNTHvq/1Qew4YNZYKM4RM5yyN5eCyq63
         aNjPI+kvt1f22JA4Nt7NzHJR4Ix2CYEP/3ET++TPvgm2OlPTyXlPIxtRzW+F6g8x/It0
         zoGw==
X-Gm-Message-State: AOAM533aw1Db2nFTqBbJhrYC05jveDQ/SzI4yOj9+wexLuNOl5I08yjl
	mUtzP4UHKJF+MrutcF6pxmbE+uG7b8qAvg==
X-Google-Smtp-Source: 
 ABdhPJyh9h1vP1HW0lDjjEfJ/qVk+0r7LX3A6sHfeATw5VtnfdirHDYDZPZZudDyWeQiLtkQ/Rd2Yw==
X-Received: by 2002:a5d:66c7:0:b0:210:3385:1e44 with SMTP id
 k7-20020a5d66c7000000b0021033851e44mr21775181wrw.566.1654516900655;
        Mon, 06 Jun 2022 05:01:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002100316b126sm15526455wru.6.2022.06.06.05.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:01:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/21] pulseaudio: update 15.0 -> 16.0
Date: Mon,  6 Jun 2022 14:01:17 +0200
Message-Id: <20220606120126.3381438-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606120126.3381438-1-alex@linutronix.de>
References: <20220606120126.3381438-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:01:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166605

Drop patch as issue fixed upstream:
https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/commit/1b96b49f65744930050b927a548a3d2e771c7310

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../pulseaudio/pulseaudio.inc                 |  2 +-
 .../0001-meson-Check-for-__get_cpuid.patch    | 82 -------------------
 ...{pulseaudio_15.0.bb => pulseaudio_16.0.bb} |  3 +-
 3 files changed, 2 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-meson-Check-for-__get_cpuid.patch
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_15.0.bb => pulseaudio_16.0.bb} (75%)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 821ce7d1df..602d7263ce 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -213,7 +213,7 @@ pkg_postinst:${PN}-server() {
 }
 
 python populate_packages:prepend() {
-    plugindir = d.expand('${libdir}/pulse-${PV}/modules/')
+    plugindir = d.expand('${libdir}/pulseaudio/modules/')
     do_split_packages(d, plugindir, r'^module-(.*)\.so$', '${PN}-module-%s', 'PulseAudio module for %s', extra_depends='', prepend=True)
     do_split_packages(d, plugindir, r'^lib(.*)\.so$', '${PN}-lib-%s', 'PulseAudio library for %s', extra_depends='', prepend=True)
 }
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-meson-Check-for-__get_cpuid.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-meson-Check-for-__get_cpuid.patch
deleted file mode 100644
index c9d8abcbf2..0000000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-meson-Check-for-__get_cpuid.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 9d0dc8aedd08d77797f90fa6075a59613f18bf0d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 20 Dec 2020 07:56:07 -0800
-Subject: [PATCH] meson: Check for __get_cpuid
-
-checking for presence of cpuid.h header alone is not sufficient in some case to use
-cpuid related functions. e.g. when using clang which is built for
-multiple targets will have cpuid.h header as part of compiler headers in
-distribution but one maybe compiling pulseaudion for non-x86 target. The
-current check in meson succeeds and then compile fails later because
-cpuid.h is x86-specific header. Therefore checking for symbol that is
-needed makes this robust, so even if header exist it will try to ensure
-the given symbol can be used
-
-Fixes
-src/pulsecore/core-util.c:113:
-| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/pulseaudio/14.0-r0/recipe-sysroot-native/usr/lib/clang/11.0.1/include/cpuid.h:11:2: error: this header is for x86 only
-| #error this header is for x86 only
-|  ^
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Tanu Kaskinen <tanuk@iki.fi>
----
- meson.build               | 5 ++++-
- src/pulsecore/core-util.c | 2 +-
- src/pulsecore/cpu-x86.c   | 2 +-
- 3 files changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 2589627..5f5127e 100644
---- a/meson.build
-+++ b/meson.build
-@@ -185,7 +185,6 @@ endif
- check_headers = [
-   'arpa/inet.h',
-   'byteswap.h',
--  'cpuid.h',
-   'dlfcn.h',
-   'execinfo.h',
-   'grp.h',
-@@ -243,6 +242,10 @@ if cc.has_header_symbol('pthread.h', 'PTHREAD_PRIO_INHERIT')
-   cdata.set('HAVE_PTHREAD_PRIO_INHERIT', 1)
- endif
- 
-+if cc.has_header_symbol('cpuid.h', '__get_cpuid')
-+  cdata.set('HAVE_GET_CPUID', 1)
-+endif
-+
- # Functions
- 
- check_functions = [
-diff --git a/src/pulsecore/core-util.c b/src/pulsecore/core-util.c
-index 601b1d1..6f34e7c 100644
---- a/src/pulsecore/core-util.c
-+++ b/src/pulsecore/core-util.c
-@@ -109,7 +109,7 @@
- #include <sys/personality.h>
- #endif
- 
--#ifdef HAVE_CPUID_H
-+#ifdef HAVE_GET_CPUID
- #include <cpuid.h>
- #endif
- 
-diff --git a/src/pulsecore/cpu-x86.c b/src/pulsecore/cpu-x86.c
-index 4e59e14..86595d4 100644
---- a/src/pulsecore/cpu-x86.c
-+++ b/src/pulsecore/cpu-x86.c
-@@ -24,7 +24,7 @@
- 
- #include <stdint.h>
- 
--#ifdef HAVE_CPUID_H
-+#ifdef HAVE_GET_CPUID
- #include <cpuid.h>
- #endif
- 
--- 
-2.29.2
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_15.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb
similarity index 75%
rename from meta/recipes-multimedia/pulseaudio/pulseaudio_15.0.bb
rename to meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb
index 239d31810b..f9940d4c85 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_15.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb
@@ -3,9 +3,8 @@ require pulseaudio.inc
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
            file://0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch \
-           file://0001-meson-Check-for-__get_cpuid.patch \
            file://volatiles.04_pulse \
            file://0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch \
            "
-SRC_URI[sha256sum] = "a40b887a3ba98cc26976eb11bdb6613988f145b19024d1b6555c6a03c9cba1a0"
+SRC_URI[sha256sum] = "b4ec6271910a1a86803f165056547f700dfabaf8d5c6c69736f706b5bb889f47"
 UPSTREAM_CHECK_REGEX = "pulseaudio-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
-- 
2.30.2


