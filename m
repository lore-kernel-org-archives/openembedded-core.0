Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA3BC47E49
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 14:01:38 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.23023.1706104895519994309
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 06:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=p/zQ5VaP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6ddb129350cso245424b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 06:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706104894; x=1706709694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mSCjFHLLVJxroVznQUgO4AtMCcFBxm4X2OaLgiLgPOk=;
        b=p/zQ5VaPswZo1/QuuBcVzFCXLdsXO3IOkAqLrBcnE3G4zfKkrcTfd8s3/Zfin5GTnN
         UDN0BCdXYxnEOgq+lnXV1K+moZ0SJa4Iq5GKw2YIPpPHjdbIpHMmWT2WS+iy1LMm6a8h
         cQsqMzNM6e8OACazejMajzXPHx48oipYXbzjWvCEy+4Yv0psBWTFtXHRW371H0Q0Ydf8
         I1JpfsMIwfhgePUgJBVuMTHSu+fpKcYjTwOU3h6P72p4d5gEz3LcRcAWNd3/l1RYJ3OM
         JmU5KCMHktWaIstvpasZka2EIjB7Psh/yG1UGNSJ8aVaPpqEWKvFuGxmBzski+3VTNEc
         BEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706104894; x=1706709694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSCjFHLLVJxroVznQUgO4AtMCcFBxm4X2OaLgiLgPOk=;
        b=OLcq16Z/GAMWNQZlCzdD8SGlykybtVSR0idkoP1NAIKS5qg3R8ERGpxuB4yDhhXtQW
         2o8AqjVQ8uQScZvSUIwiSJ1b/PsCZj3mIyJx3xRucqk/LnT3nKjKZTIE2RJC3BkAV8iy
         SIKOgfaUMd6bFg8m4D1c5PG2mDGytFiybQAaJuXA61K/Geh9bKdmJ29rDgqbe+l1IRH+
         Mfml2lLrMSRHwzBVYJQO020rE7A+xxxEbfu3sgCUl8WQRM9yEWTLSvUkuJnB/wcwUgTl
         rxDFeL0uJcWacIcJJ9W/gRSkVSGI7bWki2rIir6FEXBuO4FBh9O7yl3pTfH45xZqdm7D
         ujxA==
X-Gm-Message-State: AOJu0Yx3O3X5qHOVayh8u9B7U5+nXpZJB71zg13aaFqqhcxMcqTevdc6
	yOIbbZl6R3fl1KBRI8AP5ZbVhMmXUoFtUfwxEScLEi5i1Rvi5wVPvBEm+n3kMsX7T2KlKlJ8jZx
	X7pE=
X-Google-Smtp-Source: AGHT+IFu08dXRCweEHuKDdrwjNPm19/tG9r4mE5wypM5UMIq/zvQ3Jy84ZyBBaBES4IospFv1XnwNQ==
X-Received: by 2002:a05:6a20:8423:b0:19c:66fa:3f00 with SMTP id c35-20020a056a20842300b0019c66fa3f00mr768232pzd.13.1706104893577;
        Wed, 24 Jan 2024 06:01:33 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 8-20020a631648000000b005ccf10e73b8sm11535739pgw.91.2024.01.24.06.01.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 06:01:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 05/12] glib-2.0: upgrade 2.78.1 -> 2.78.3
Date: Wed, 24 Jan 2024 04:01:08 -1000
Message-Id: <71696c0b89751c1a975025086da0c6f52de00cd8.1706104658.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706104658.git.steve@sakoman.com>
References: <cover.1706104658.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 14:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194281

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 419503d3d3402b683979696f248cd42f05c282b7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ot-write-bindir-into-pkg-config-files.patch |  4 ++--
 .../0001-Fix-DATADIRNAME-on-uclibc-Linux.patch |  3 +--
 ...l-gio-querymodules-as-libexec_PROGRAM.patch |  6 +++---
 ...ing-about-deprecated-paths-in-schemas.patch |  4 ++--
 ...e-correctly-when-building-with-mingw3.patch | 18 +++++++++---------
 ...rces.c-comment-out-a-build-host-only-.patch |  6 +++---
 ...son-Run-atomics-test-on-clang-as-well.patch |  6 +++---
 ...not-enable-pidfd-features-on-native-g.patch |  8 +++-----
 ...rdcode-python-path-into-various-tools.patch |  6 +++---
 .../glib-2.0/glib-2.0/relocate-modules.patch   |  2 +-
 .../{glib-2.0_2.78.1.bb => glib-2.0_2.78.3.bb} |  2 +-
 11 files changed, 31 insertions(+), 34 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.78.1.bb => glib-2.0_2.78.3.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
index 0d44ddf299..0e5f371cb5 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 9ec4eedeb3f67db0bff09f5d859318d05ff47964 Mon Sep 17 00:00:00 2001
+From cf7df91cc8c3b4811235ef8aec144c5f0cf90bdb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not write $bindir into pkg-config files
@@ -16,7 +16,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 11 insertions(+), 11 deletions(-)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index a320c0f..86ce7c4 100644
+index 5f91586..1a95f4f 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
 @@ -884,14 +884,14 @@ pkg.generate(libgio,
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index 16f2d31496..1254466063 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From c94e669de98a3892c699bd8d0d2b5164b2de747e Mon Sep 17 00:00:00 2001
+From b907a6681c4c24e5d3745538d9fcd471cf1c4c4a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
@@ -9,7 +9,6 @@ based systems therefore lets set DATADIRNAME to "share".
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
-
 ---
  m4macros/glib-gettext.m4 | 4 ++++
  1 file changed, 4 insertions(+)
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 597864d9ac..50d369c24e 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 0015db45cd1bfefc04959dffab5dabeead93136f Mon Sep 17 00:00:00 2001
+From 6e2ddcb5465d10618345b12e0b4471ead0f14304 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [OE specific]
  1 file changed, 1 insertion(+)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 2ef60ed..532b086 100644
+index f9fdf6e..5f91586 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -936,6 +936,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
+@@ -1005,6 +1005,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
    c_args : gio_c_args,
    # intl.lib is not compatible with SAFESEH
    link_args : noseh_link_args,
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index 6fd93526ce..f810574d97 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From 4f47b8a8d650d185aa61aec2f56a283522a723c4 Mon Sep 17 00:00:00 2001
+From c8c223045821cac97f798cfa63f19853621a8a2a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
@@ -15,7 +15,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 13 deletions(-)
 
 diff --git a/gio/glib-compile-schemas.c b/gio/glib-compile-schemas.c
-index 7888120..7acbd5b 100644
+index 04ef404..e791ce2 100644
 --- a/gio/glib-compile-schemas.c
 +++ b/gio/glib-compile-schemas.c
 @@ -1232,19 +1232,6 @@ parse_state_start_schema (ParseState  *state,
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
index 2e1e2313e8..e1d2fb0e54 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
@@ -1,4 +1,4 @@
-From ba1728bc27c88597164957d000b70ec4be6edf28 Mon Sep 17 00:00:00 2001
+From bafde4eedc0a22b45e73ee6183b9a11393a1e400 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 13 Feb 2019 15:32:05 +0100
 Subject: [PATCH] Set host_machine correctly when building with mingw32
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 8 insertions(+), 5 deletions(-)
 
 diff --git a/gio/tests/meson.build b/gio/tests/meson.build
-index f644aa2..64a8684 100644
+index 4ef3343..e498e7e 100644
 --- a/gio/tests/meson.build
 +++ b/gio/tests/meson.build
 @@ -29,7 +29,7 @@ endif
@@ -25,7 +25,7 @@ index f644aa2..64a8684 100644
    common_gio_tests_deps += [iphlpapi_dep, winsock2, cc.find_library ('secur32')]
  endif
  
-@@ -210,7 +210,7 @@ if have_dbus_daemon
+@@ -230,7 +230,7 @@ if have_dbus_daemon
  endif
  
  #  Test programs buildable on UNIX only
@@ -34,7 +34,7 @@ index f644aa2..64a8684 100644
    gio_tests += {
      'file' : {},
      'gdbus-peer-object-manager' : {},
-@@ -462,7 +462,7 @@ if host_machine.system() != 'windows'
+@@ -562,7 +562,7 @@ if host_machine.system() != 'windows'
  endif # unix
  
  #  Test programs buildable on Windows only
@@ -43,7 +43,7 @@ index f644aa2..64a8684 100644
    gio_tests += {'win32-streams' : {}}
  endif
  
-@@ -532,7 +532,7 @@ if cc.get_id() != 'msvc' and cc.get_id() != 'clang-cl'
+@@ -632,7 +632,7 @@ if cc.get_id() != 'msvc' and cc.get_id() != 'clang-cl'
    }
  endif
  
@@ -53,10 +53,10 @@ index f644aa2..64a8684 100644
      'gdbus-example-unix-fd-client' : {
        'install' : false,
 diff --git a/glib/tests/meson.build b/glib/tests/meson.build
-index db01b54..6950817 100644
+index d80c86e..5329cda 100644
 --- a/glib/tests/meson.build
 +++ b/glib/tests/meson.build
-@@ -188,7 +188,7 @@ if glib_conf.has('HAVE_EVENTFD')
+@@ -216,7 +216,7 @@ if glib_conf.has('HAVE_EVENTFD')
    }
  endif
  
@@ -66,10 +66,10 @@ index db01b54..6950817 100644
      glib_tests += {
        'gpoll' : {
 diff --git a/meson.build b/meson.build
-index 43bb468..5f9b59c 100644
+index f7e936e..122f8b5 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -43,6 +43,9 @@ else
+@@ -54,6 +54,9 @@ else
  endif
  
  host_system = host_machine.system()
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index d33fdd4d8b..e4c2f77459 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 92de6c7eb30b961b24a2dce812d5276487b7d23d Mon Sep 17 00:00:00 2001
+From 3f05b9418c88bbb83c08b57cc5529b006f26fff4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gio/tests/resources.c b/gio/tests/resources.c
-index c44d214..e289a01 100644
+index f567914..b21b616 100644
 --- a/gio/tests/resources.c
 +++ b/gio/tests/resources.c
-@@ -993,7 +993,7 @@ main (int   argc,
+@@ -1068,7 +1068,7 @@ main (int   argc,
    g_test_add_func ("/resource/automatic", test_resource_automatic);
    /* This only uses automatic resources too, so it tests the constructors and destructors */
    g_test_add_func ("/resource/module", test_resource_module);
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch
index 44482dd2b7..071e4a7c4d 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From 4b97f457b7b44117e27d2a218c4b68e7fe3fe4ce Mon Sep 17 00:00:00 2001
+From 17d718640ae6f953e5eea714c1bd64eeb6e4799f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -15,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index afb6eaa..6aa70f5 100644
+index 122f8b5..f055079 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1692,7 +1692,7 @@ atomicdefine = '''
+@@ -1938,7 +1938,7 @@ atomicdefine = '''
  # We know that we can always use real ("lock free") atomic operations with MSVC
  if cc.get_id() == 'msvc' or cc.get_id() == 'clang-cl' or cc.links(atomictest, name : 'atomic ops')
    have_atomic_lock_free = true
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index 788f420d11..e03f9a3c84 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From 9aa9574861fad39d0679025e35fe1e188345f685 Mon Sep 17 00:00:00 2001
+From 7865d698b5d392aac3a3d32e9ebd5fea45017d15 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -9,12 +9,13 @@ where these features are not implemented.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
 ---
  meson.build | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 1c36993..bbf97fc 100644
+index f055079..77d78aa 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -981,7 +981,8 @@ if cc.links('''#include <sys/syscall.h>
@@ -27,6 +28,3 @@ index 1c36993..bbf97fc 100644
  endif
  
  # Check for __uint128_t (gcc) by checking for 128-bit division
--- 
-2.30.2
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
index 1c645f3a9a..4b75167da6 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From 79ce7e545dd3a93f77d2146d50b6fa061fbceed9 Mon Sep 17 00:00:00 2001
+From 53bcd4b6cd3fe3fe4246914462e6724761eecf51 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
@@ -23,7 +23,7 @@ index 67d3675..4e92a7a 100755
  # GDBus - GLib D-Bus Library
  #
 diff --git a/gobject/glib-genmarshal.in b/gobject/glib-genmarshal.in
-index 7380f24..c8abeaa 100755
+index aa5af43..56e8e2e 100755
 --- a/gobject/glib-genmarshal.in
 +++ b/gobject/glib-genmarshal.in
 @@ -1,4 +1,4 @@
@@ -33,7 +33,7 @@ index 7380f24..c8abeaa 100755
  # pylint: disable=too-many-lines, missing-docstring, invalid-name
  
 diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
-index 91ad779..3ebef62 100755
+index 353e53a..8ed6c39 100755
 --- a/gobject/glib-mkenums.in
 +++ b/gobject/glib-mkenums.in
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 841fedef8a..95a73298d8 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From b90d13900dd2777c2ab90c5b0be1a872c10a17da Mon Sep 17 00:00:00 2001
+From 03a069cb8066d3e8ef72a43f7b1db5c9625e9cc2 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
index a490262112..13d4b38e22 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "915bc3d0f8507d650ead3832e2f8fb670fce59aac4d7754a7dab6f1e6fed78b2"
+SRC_URI[sha256sum] = "609801dd373796e515972bf95fc0b2daa44545481ee2f465c4f204d224b2bc21"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.34.1


