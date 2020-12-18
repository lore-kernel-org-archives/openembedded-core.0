Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.5447.1608267171635299222
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 20:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LQqnsp+r;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: twoerner@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id p187so917361iod.4
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 20:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y0wycXuky8XwQRxF4iLOrfcFunvYZVR/tUYT3lH3SE8=;
        b=LQqnsp+rL+PoJbwu1LrupYdClGBAVlQfY0F5T7LXsgYqG+lgayy2e+YoyFmfWFJDpq
         rCsCUhZvb57Qd+Sr5ebBen5hcDmNDKoUKLCFMJnZrOPolkffDdAuCodHa+eIMRuRegDX
         D7PS/sFFMtQD+cHudjJc478kiAfPrbyaFHD90KKUctewBku1EEnnQAC4cBpsnEfyTkGT
         XtRHztReQGwZz5aQWnS4+SlcxkzGj9YVnIgMgY43UFAHyhSTsXn/GapNSmzeWLbHX0Mv
         COZO14nD8usZZQeqyyJWNRPqKj1Kgw9dxPcXPECb8lVEXP5Jni9qj3j2dPPRmL+JUVkx
         DmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y0wycXuky8XwQRxF4iLOrfcFunvYZVR/tUYT3lH3SE8=;
        b=ApKaWh/scEdtf+vohvnK2OCccvX+qKyyQOvLJdEp/xYa60fKrVKFLHz2C7BTjOpXD4
         kj41fj4kYDpECz/7GuS98UsL/hrh3PafUKvDVhnwvp9/lH23SRE+VfF4SX65M5485HQ0
         UTZZSKm/MKrU/IFNciWyEjUKbWK+FrmSrDtWQ09LFy4GUTrS9uGm9s55gOY9e7p+jQmn
         qEV0fq9IKLGGRjTbbeTAdWtgAEcvg6okotIVpiv56uDH2IUzAahWij2/KdSZMADY4ZPH
         ZbIZyOMgXLuGdiWJrjq3QlY0nRne1tLKjE9wiCLLY8e7NRm13fiHHFV+GQ8PONr1oJeV
         4epA==
X-Gm-Message-State: AOAM53335d4ZQD5BXVN665mOWMgD/2afqj2ifSskpZZUpGGa5TRijcX9
	iH0SOtEzraMYo3q6sgW9k2wTPnJ+oLWiMg==
X-Google-Smtp-Source: ABdhPJxLWruzvO5+rcq/Z4SpMSv08d0Vnlp8T8jsVP5ujfIFCfJLZrNXVFEYUBMFol5yZ40T3GBg7Q==
X-Received: by 2002:a5e:970d:: with SMTP id w13mr2260564ioj.166.1608267170551;
        Thu, 17 Dec 2020 20:52:50 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id b6sm4520865ilv.79.2020.12.17.20.52.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 20:52:49 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?W1BBVENIXSBtZXNhOiB1cGRhdGUgMjAuMi40IOKGkiAyMC4zLjE=?=
Date: Thu, 17 Dec 2020 23:52:45 -0500
Message-Id: <20201218045245.18876-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Two of the patches have been applied upstream:
	0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch
	0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch

The 'surfaceless' platform is now enabled by default, therefore it is no
longer a valid choice. The meson build system is intelligent enough now to
decide if 'drm' needs to be enabled based on whether or not gbm is available.
Therefore 'drm' also is no longer a valid platform choice:

	ERROR: Options "drm, surfaceless" are not in allowed choices: "auto, x11, wayland, haiku, android, windows"

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 ...xes-to-loader-when-using-x11-and-dri.patch | 36 -------------
 ...-for-formatted-output-of-timespec-me.patch | 51 -------------------
 meta/recipes-graphics/mesa/mesa.inc           |  8 +--
 .../mesa/{mesa_20.2.4.bb => mesa_20.3.1.bb}   |  0
 4 files changed, 2 insertions(+), 93 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch
 rename meta/recipes-graphics/mesa/{mesa_20.2.4.bb => mesa_20.3.1.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch b/meta/recipes-graphics/mesa/files/0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch
deleted file mode 100644
index 9ee72880a2..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From cf17d6251653f4a98e7c4f904ea2f0bc0ecedd5c Mon Sep 17 00:00:00 2001
-From: Duncan Hopkins <duncan@duncanhopkins.me.uk>
-Date: Thu, 15 Oct 2020 12:14:57 +0100
-Subject: [PATCH] meson: Add xcb-fixes to loader when using x11 and dri3. Fixes
- undefined symbol for xcb_xfixes_create_region in loader_dri3_helper.c
-
-loader_dr3_helper.c uses xcb_xfixes_create_region() that requires dep_xcb_xfixes to link. This is dependent on with_platform_x11 and with_dri3.
-But the source meson file does not set this up dependent on with_dri3.
-The build was initialsed using platforms=x11 and gallium-drivers=zink,swrast.
-
-Reviewed-by: Eric Anholt <eric@anholt.net>
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/7164>
-
-Upstream-Status: Backport [cf17d6251653f4a98e7c4f904ea2f0bc0ecedd5c]
-
----
- meson.build | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index cfe02fa6373..3cb3c904927 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1782,7 +1782,8 @@ if with_platform_x11
-       dep_xxf86vm = dependency('xxf86vm')
-     endif
-   endif
--  if (with_egl or (
-+  if (with_egl or 
-+      with_dri3 or (
-       with_gallium_vdpau or with_gallium_xvmc or with_gallium_xa or
-       with_gallium_omx != 'disabled'))
-     dep_xcb_xfixes = dependency('xcb-xfixes')
--- 
-2.17.1
-
diff --git a/meta/recipes-graphics/mesa/files/0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch b/meta/recipes-graphics/mesa/files/0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch
deleted file mode 100644
index dacb1ea1c8..0000000000
--- a/meta/recipes-graphics/mesa/files/0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 281a636353666bfdd373c62591e744087e750e89 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 4 Dec 2019 14:15:28 -0800
-Subject: [PATCH] vc4: use intmax_t for formatted output of timespec members
-
-32bit architectures which have 64bit time_t does not fit the assumption
-of time_t being same as system long int
-
-Fixes
-error: format specifies type 'long' but the argument has type 'time_t' (aka 'long long') [-Werror,-Wformat]
-                        time.tv_sec);
-                        ^~~~~~~~~~~
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/merge_requests/2966]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/gallium/drivers/v3d/v3d_bufmgr.c | 4 ++--
- src/gallium/drivers/vc4/vc4_bufmgr.c | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/gallium/drivers/v3d/v3d_bufmgr.c b/src/gallium/drivers/v3d/v3d_bufmgr.c
-index 31a0803..cc2e2af 100644
---- a/src/gallium/drivers/v3d/v3d_bufmgr.c
-+++ b/src/gallium/drivers/v3d/v3d_bufmgr.c
-@@ -80,8 +80,8 @@ v3d_bo_dump_stats(struct v3d_screen *screen)
- 
-                 struct timespec time;
-                 clock_gettime(CLOCK_MONOTONIC, &time);
--                fprintf(stderr, "  now:               %ld\n",
--                        (long)time.tv_sec);
-+                fprintf(stderr, "  now:               %jd\n",
-+                        (intmax_t)time.tv_sec);
-         }
- }
- 
-diff --git a/src/gallium/drivers/vc4/vc4_bufmgr.c b/src/gallium/drivers/vc4/vc4_bufmgr.c
-index a786e8e..975d49e 100644
---- a/src/gallium/drivers/vc4/vc4_bufmgr.c
-+++ b/src/gallium/drivers/vc4/vc4_bufmgr.c
-@@ -99,8 +99,8 @@ vc4_bo_dump_stats(struct vc4_screen *screen)
- 
-                 struct timespec time;
-                 clock_gettime(CLOCK_MONOTONIC, &time);
--                fprintf(stderr, "  now:               %ld\n",
--                        (long)time.tv_sec);
-+                fprintf(stderr, "  now:               %jd\n",
-+                        (intmax_t)time.tv_sec);
-         }
- }
- 
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index dba23f586f..2158c9eaf9 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,14 +17,12 @@ PE = "2"
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0002-meson.build-make-TLS-ELF-optional.patch \
-           file://0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            file://0001-anv-fix-a-build-race-between-generating-a-header-and.patch \
-           file://0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch \
            "
 
-SRC_URI[sha256sum] = "0572dc6015d2e1c50f67823edd16855ae9b6feded0a1470598404e75e64aa092"
+SRC_URI[sha256sum] = "af751b49bb2ab0264d58c31e73d869e80333de02b2d1becc93f1b28c67aa780f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
@@ -52,9 +50,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 ANY_OF_DISTRO_FEATURES_class-target = "opengl vulkan"
 
-PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)} \
-               ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'drm', '', d)} \
-               surfaceless"
+PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
 
 export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE}/llvm-config"
 export YOCTO_ALTERNATE_MULTILIB_NAME = "${base_libdir}"
diff --git a/meta/recipes-graphics/mesa/mesa_20.2.4.bb b/meta/recipes-graphics/mesa/mesa_20.3.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_20.2.4.bb
rename to meta/recipes-graphics/mesa/mesa_20.3.1.bb
-- 
2.30.0.rc0

