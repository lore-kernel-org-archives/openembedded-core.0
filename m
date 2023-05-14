Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212A7C7EE2A
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 16:31:57 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.70162.1684081909105383373
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 09:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=F829o5ow;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-64ab2a37812so14508693b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 09:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684081908; x=1686673908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=usZg2lti6oHlAO6MCS26LZatg+BVXjuIF18Mzu0ccNQ=;
        b=F829o5owhhAqmKFIY/45GOpFeYjBxixPADR2FLu/2+X/IZHVSg3L5rehr50uY35+ey
         pYsDRQX0g021B6/xXDENrZptHVOi4agxzS0yQKsH2w32h6djk7jM2zTorganRgBvYOYc
         IYCj6H2NYsqAv5bWv1owk1Nw+6JEsKJo/AN2GHzbEcScJ+9U+EfbrSUbtOgqVgfUVcoG
         1Aoy/uxvWDdnRInPMOyYSfAP8nJSxvInyvWW5LRxOtCkASZ20Qx9cR07zAH2AMI7sAe1
         Qor4h/rFXUhKTu7FmKvhU5PXf3GD7ULKDYsa9oa/ZO3YDy2WLTe0dnmVvwNMt1bgKlkQ
         b5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684081908; x=1686673908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usZg2lti6oHlAO6MCS26LZatg+BVXjuIF18Mzu0ccNQ=;
        b=HCo3NrcfeS2kfmzbopEkGsl7EoHok3xXXuStQgtpjAf8VoGCx4RydYfzpU5MTtzuHs
         96bHpBXE3uzLy+ZlpQZeSjCo62B2gMEdiKZ0txlrZrmkqVtilwhxcCb3pH+iGJqSYNyq
         BpRXeULS+hxqOjFBGGRc1bUi2kq8MwYsrLenr1Vk5a0Bm6SbCtTwG0Q+tqUAB3rXwwFN
         ErmQUIwXManX7TP1cDal6a0eg9bsVwL9oUVQ2b/n3OvhzZsXDtWfb5o/BZNIMmOaT9A/
         kqCmLvvbH02De15obFi4j9N2tgU71TJlSMURu3c1z9FAkCHHF+JuoHH6eyh5Y+AM6yiK
         v1jQ==
X-Gm-Message-State: AC+VfDybHLJjPjOrRgmykIlDVR3Drd4wStv5cCe1psDdeZuCVsDdaupC
	WQAwMXFDHpX+EHoQIw3DecrzK0G4CGE8MnhTyGg=
X-Google-Smtp-Source: ACHHUZ4Jf8TdyIfblyC+N2cpajuNzmXo6sq+VsIifZlJE+rijClo5ArMWajsnYZGIJJBFnp8lSse0A==
X-Received: by 2002:a05:6a21:788d:b0:ef:8de0:6a5 with SMTP id bf13-20020a056a21788d00b000ef8de006a5mr30162470pzc.3.1684081907847;
        Sun, 14 May 2023 09:31:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x14-20020aa784ce000000b006475f831838sm981877pfn.30.2023.05.14.09.31.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 09:31:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 01/15] waffle: upgrade 1.7.0 -> 1.7.2
Date: Sun, 14 May 2023 06:31:26 -1000
Message-Id: <e4ebfb5c7892488fc834d9837e9a5a4c28eb676f.1684081748.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684081748.git.steve@sakoman.com>
References: <cover.1684081748.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 16:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181202

From: Upgrade Helper <auh@yoctoproject.org>

The Waffle bugfix release 1.7.1 is now available.

What is new in this release:
  - cmake: pass deps' cflags to the build
  - gbm: fix crash when platform lacks modifier support
  - gitlab-ci: stabilise CI runs under X
  - gitlab-ci: add more warnings, make all warnings fatal
  - gitlab-ci: update to bullseye
  - meson: add override_* support, when using waffle as submodule
  - meson: skip installing bash completion when custom prefix is used
  - meson: silence deprecation warnings
  - meson: generate cmake files only on Windows
  - meson: find wayland.xml from wayland-scanner.pc
  - misc: zsh completion
  - misc: fix dozens of compiler warnings
  - misc: update website references
  - wayland: fix build against wayland 1.20

The Waffle bugfix release 1.7.2 is now available.

What is new in this release:
  - all: use format(gnu_printf), enable in mingw
  - meson: don't run TLS checks on mingw
  - wgl: remove unused dummy wgl_error.[ch]

Upstream now only generates CMake files on Windows, so remove all
references to CMake.

A zsh completion is now installed, remove this for now as we don't really
use zsh.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 94cf6ef11bba381ab6f65b03ed1ed14022438151)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...build-request-native-wayland-scanner.patch |  9 ++++----
 ...-make-core-protocol-into-the-library.patch | 23 ++++---------------
 .../{waffle_1.7.0.bb => waffle_1.7.2.bb}      |  8 +++----
 3 files changed, 13 insertions(+), 27 deletions(-)
 rename meta/recipes-graphics/waffle/{waffle_1.7.0.bb => waffle_1.7.2.bb} (92%)

diff --git a/meta/recipes-graphics/waffle/waffle/0001-meson.build-request-native-wayland-scanner.patch b/meta/recipes-graphics/waffle/waffle/0001-meson.build-request-native-wayland-scanner.patch
index 1b62db92e9..4b3a0e7c4a 100644
--- a/meta/recipes-graphics/waffle/waffle/0001-meson.build-request-native-wayland-scanner.patch
+++ b/meta/recipes-graphics/waffle/waffle/0001-meson.build-request-native-wayland-scanner.patch
@@ -1,4 +1,4 @@
-From 2195cec1e5bc66128d72049c11ff381ca4516a4b Mon Sep 17 00:00:00 2001
+From 0961787d2bf0d359a3ead89e9cec642818b32dea Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 5 Jul 2022 11:51:39 +0200
 Subject: [PATCH] meson.build: request native wayland-scanner
@@ -8,15 +8,16 @@ try to use a cross-binary, and fail.
 
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/waffle/-/merge_requests/110]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
 ---
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 0bb6128..0b6da1f 100644
+index ca6a212..3177bde 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -108,7 +108,7 @@ else
+@@ -110,7 +110,7 @@ else
      'wayland-egl', version : '>= 9.1', required : get_option('wayland'),
    )
    dep_wayland_scanner = dependency(
@@ -24,4 +25,4 @@ index 0bb6128..0b6da1f 100644
 +    'wayland-scanner', version : '>= 1.15', required : get_option('wayland'), native: true,
    )
    if dep_wayland_scanner.found()
-     prog_wayland_scanner = find_program(dep_wayland_scanner.get_pkgconfig_variable('wayland_scanner'))
+     prog_wayland_scanner = find_program(dep_wayland_scanner.get_variable(pkgconfig: 'wayland_scanner'))
diff --git a/meta/recipes-graphics/waffle/waffle/0001-waffle-do-not-make-core-protocol-into-the-library.patch b/meta/recipes-graphics/waffle/waffle/0001-waffle-do-not-make-core-protocol-into-the-library.patch
index 24b2de5d9c..60e6318f7a 100644
--- a/meta/recipes-graphics/waffle/waffle/0001-waffle-do-not-make-core-protocol-into-the-library.patch
+++ b/meta/recipes-graphics/waffle/waffle/0001-waffle-do-not-make-core-protocol-into-the-library.patch
@@ -1,4 +1,4 @@
-From 7610ec4b572d3a54d30fca6798f0c406f3fd8a46 Mon Sep 17 00:00:00 2001
+From 71f9399d6cea1e2e885a98b98d82eb628832a86e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 26 Oct 2021 08:52:17 +0200
 Subject: [PATCH] waffle: do not make core protocol into the library
@@ -9,28 +9,13 @@ wayland.xml from the host.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
 ---
- meson.build            | 4 ----
  src/waffle/meson.build | 7 -------
- 2 files changed, 11 deletions(-)
+ 1 file changed, 7 deletions(-)
 
-diff --git a/meson.build b/meson.build
-index ffc02ff..0bb6128 100644
---- a/meson.build
-+++ b/meson.build
-@@ -104,10 +104,6 @@ else
-   dep_wayland_client = dependency(
-     'wayland-client', version : '>= 1.10', required : get_option('wayland'),
-   )
--  if dep_wayland_client.found()
--    wayland_core_xml = join_paths(dep_wayland_client.get_pkgconfig_variable('pkgdatadir'),
--    'wayland.xml')
--  endif
-   dep_wayland_egl = dependency(
-     'wayland-egl', version : '>= 9.1', required : get_option('wayland'),
-   )
 diff --git a/src/waffle/meson.build b/src/waffle/meson.build
-index 01898c8..6245868 100644
+index e2636c7..3ff5762 100644
 --- a/src/waffle/meson.build
 +++ b/src/waffle/meson.build
 @@ -88,12 +88,6 @@ if build_surfaceless
diff --git a/meta/recipes-graphics/waffle/waffle_1.7.0.bb b/meta/recipes-graphics/waffle/waffle_1.7.2.bb
similarity index 92%
rename from meta/recipes-graphics/waffle/waffle_1.7.0.bb
rename to meta/recipes-graphics/waffle/waffle_1.7.2.bb
index dc475908d0..cb917d8894 100644
--- a/meta/recipes-graphics/waffle/waffle_1.7.0.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.7.2.bb
@@ -9,16 +9,16 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
                     file://include/waffle-1/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
 
-SRC_URI = "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=https;branch=master \
+SRC_URI = "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=https;branch=maint-1.7 \
            file://0001-waffle-do-not-make-core-protocol-into-the-library.patch \
            file://0001-meson.build-request-native-wayland-scanner.patch \
            "
-SRCREV = "905c6c10f2483adf0cbfa024e2d3c2ed541fb300"
+SRCREV = "f3b42a7216105498842bc6ba77d8481b90d6f5f9"
 S = "${WORKDIR}/git"
 
 inherit meson features_check lib_package bash-completion pkgconfig
 
-DEPENDS:append = " python3 cmake-native"
+DEPENDS:append = " python3"
 
 # This should be overridden per-machine to reflect the capabilities of the GL
 # stack.
@@ -47,5 +47,5 @@ PACKAGECONFIG[surfaceless-egl] = "-Dsurfaceless_egl=enabled,-Dsurfaceless_egl=di
 # TODO: optionally build manpages and examples
 
 do_install:append() {
-    sed -i -e "s,${WORKDIR},,g" ${D}/${libdir}/cmake/Waffle/WaffleConfig.cmake
+    rm -rf ${D}${datadir}/zsh
 }
-- 
2.34.1


