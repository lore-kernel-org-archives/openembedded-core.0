Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.25233.1608480340850998391
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 08:05:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OM/6LAsU;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id b5so5045554pjk.2
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 08:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I9t5NUx7m91oObS5KaNjfWc9WjiXPl8Tip0Y/ZuphpU=;
        b=OM/6LAsUty0RJrtu7+DTkKWHOfu3g1JV1OOi+7ULDb+U/PZNkRveSlf/BGi0ysmDr+
         1FepoV4B1HopFYpl44K1LBb1P7DKsIaH3EZ3JFTRI9Ma8CPosQOM/+T3HGVTGQV7RAPr
         wBXxVAxXg6wDjsKqohYOEQRY54mVR8qsbvvJobG8ClL7EVbscPdl6lgNdWLjbsL0IPkA
         XpjjhlAqlc+1ZISTfXFzee67FzEAn6WFaEgv+A/ZB/mFVLvOs8KfusyvI/Y77gwBzmqn
         mZI0uHfr+tlsiWlF/9rUfGdizZb2eHBL7T6j2+ciB5GIecxliddLMtTIukCRCcsghcB/
         rMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I9t5NUx7m91oObS5KaNjfWc9WjiXPl8Tip0Y/ZuphpU=;
        b=LXhgBtFFITXIktVzM1ra4tnnzmdD6ybao75VoMqe01kPTh6z94LwkEwZjTkzqlrpkp
         SDNGTgNnio9WBdjIP7bYojqyqxadtZ8QfnGHvX09VxY0rLySugo4qZqcMwk8E+WivYcD
         ApWAoWEsUPhBE/M4wHhkOq02WSE5x3cnPlx7zd79nBWtZiDVqHm0b8plKpyXHPSRIoH5
         fSB4urHQVljjsRBMPErjrrlW9BC+J6IE3hcLbrZQ/DCpsnTicXtlfhErlG2k6trmpdOH
         4O1swORtuXuZysoM3W/g3HA9zDn+5FH9iXRijIPztD9oYDrAi1l3h3CF+1SuYNvQndaj
         xK5A==
X-Gm-Message-State: AOAM533t8hTtT1Qx2Ji7sBWefQyI4pQclDFYEyCXTeuJKgM0QYHD/MRx
	hDQX/D2E0KLJHkvRk93yAiwXE2ZDjZsCQg==
X-Google-Smtp-Source: ABdhPJxr3jWeQO9xLhsIjqeP9Gm7T7xgqoB2CyjpPzPm2Pfsv60DmquT0VS5mcEnCggVjSxD8BFOSw==
X-Received: by 2002:a17:90b:1a86:: with SMTP id ng6mr13610870pjb.12.1608480340012;
        Sun, 20 Dec 2020 08:05:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d89e])
        by smtp.gmail.com with ESMTPSA id r20sm6710608pgb.3.2020.12.20.08.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 08:05:39 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Tanu Kaskinen <tanuk@iki.fi>
Subject: [PATCH] pulseaudio: Fix build with clang for non-x86 target
Date: Sun, 20 Dec 2020 08:05:35 -0800
Message-Id: <20201220160535.746798-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Tanu Kaskinen <tanuk@iki.fi>
---
 .../0001-meson-Check-for-__get_cpuid.patch    | 82 +++++++++++++++++++
 .../pulseaudio/pulseaudio_14.0.bb             |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-meson-Check-for-__get_cpuid.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-meson-Check-for-__get_cpuid.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-meson-Check-for-__get_cpuid.patch
new file mode 100644
index 0000000000..c9d8abcbf2
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-meson-Check-for-__get_cpuid.patch
@@ -0,0 +1,82 @@
+From 9d0dc8aedd08d77797f90fa6075a59613f18bf0d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 20 Dec 2020 07:56:07 -0800
+Subject: [PATCH] meson: Check for __get_cpuid
+
+checking for presence of cpuid.h header alone is not sufficient in some case to use
+cpuid related functions. e.g. when using clang which is built for
+multiple targets will have cpuid.h header as part of compiler headers in
+distribution but one maybe compiling pulseaudion for non-x86 target. The
+current check in meson succeeds and then compile fails later because
+cpuid.h is x86-specific header. Therefore checking for symbol that is
+needed makes this robust, so even if header exist it will try to ensure
+the given symbol can be used
+
+Fixes
+src/pulsecore/core-util.c:113:
+| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/pulseaudio/14.0-r0/recipe-sysroot-native/usr/lib/clang/11.0.1/include/cpuid.h:11:2: error: this header is for x86 only
+| #error this header is for x86 only
+|  ^
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Tanu Kaskinen <tanuk@iki.fi>
+---
+ meson.build               | 5 ++++-
+ src/pulsecore/core-util.c | 2 +-
+ src/pulsecore/cpu-x86.c   | 2 +-
+ 3 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 2589627..5f5127e 100644
+--- a/meson.build
++++ b/meson.build
+@@ -185,7 +185,6 @@ endif
+ check_headers = [
+   'arpa/inet.h',
+   'byteswap.h',
+-  'cpuid.h',
+   'dlfcn.h',
+   'execinfo.h',
+   'grp.h',
+@@ -243,6 +242,10 @@ if cc.has_header_symbol('pthread.h', 'PTHREAD_PRIO_INHERIT')
+   cdata.set('HAVE_PTHREAD_PRIO_INHERIT', 1)
+ endif
+ 
++if cc.has_header_symbol('cpuid.h', '__get_cpuid')
++  cdata.set('HAVE_GET_CPUID', 1)
++endif
++
+ # Functions
+ 
+ check_functions = [
+diff --git a/src/pulsecore/core-util.c b/src/pulsecore/core-util.c
+index 601b1d1..6f34e7c 100644
+--- a/src/pulsecore/core-util.c
++++ b/src/pulsecore/core-util.c
+@@ -109,7 +109,7 @@
+ #include <sys/personality.h>
+ #endif
+ 
+-#ifdef HAVE_CPUID_H
++#ifdef HAVE_GET_CPUID
+ #include <cpuid.h>
+ #endif
+ 
+diff --git a/src/pulsecore/cpu-x86.c b/src/pulsecore/cpu-x86.c
+index 4e59e14..86595d4 100644
+--- a/src/pulsecore/cpu-x86.c
++++ b/src/pulsecore/cpu-x86.c
+@@ -24,7 +24,7 @@
+ 
+ #include <stdint.h>
+ 
+-#ifdef HAVE_CPUID_H
++#ifdef HAVE_GET_CPUID
+ #include <cpuid.h>
+ #endif
+ 
+-- 
+2.29.2
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb
index 63ef3a9c12..fccca1ba48 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb
@@ -4,6 +4,7 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
            file://0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch \
            file://0001-build-sys-Add-an-option-for-enabling-disabling-Valgr.patch \
+           file://0001-meson-Check-for-__get_cpuid.patch \
            file://volatiles.04_pulse \
            "
 SRC_URI[md5sum] = "84a7776e63dd55c40db8fbd7c7e2e18e"
-- 
2.29.2

