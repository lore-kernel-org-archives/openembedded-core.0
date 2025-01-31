Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42930C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 12:35:31 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.18295.1738326925158645771
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 04:35:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lNo0jWvE;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54298ec925bso2086017e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 04:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738326923; x=1738931723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NY8EJD6WCo3hlgdv4EkAahCwW23BtTS1CILGGjTubgw=;
        b=lNo0jWvERDAm17cIRt4Gs/s8Uhge7LlmjZZJwbDqE+TaZJgcMZ/Om3zierc2RDxX43
         3AIWG2nT8x1eTTiIC0UrAgWn4fCeNGKSCAgI6myj3J61SE6jPXh07QKj7F2yjVDgUF0K
         HNAyh3okORSIJLwLgIkkEFHzS8ZOprkXsntlRNHqTGYssfvNRVTDFNz6VKlCpVGCTxZd
         Jav8T8/COICaSXx1mguRlQi5WXTpXRfH6VdMjAahmtSu7ho0OkW5ZV5U4sspJh5EZL4V
         z+6i2tCwcyOBdSxGpKUV1G4Fy61gAh9QOPWgdFWVVmeyCa607/ZAZyfDI/t0R5UHiY4L
         7f4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738326923; x=1738931723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NY8EJD6WCo3hlgdv4EkAahCwW23BtTS1CILGGjTubgw=;
        b=aj1Bul3x07sg+t+thNMq0ED91kOF+tuiUEmL1BW/yzzlx6eWXaQg0XFiLaAukTYbUE
         hlsiOw+EHcKnQHiBor7nuM8scGWRJNjW2qWuCAFJ9HtCE7jxuqKvDcLnuMB75Z1tx5Co
         KAtpRp6wvI6PhHP3ciIZ6VnVb9hTCINh5KrO4b/OZfifN+J5+kc/FD45vLWF/TH6yDRp
         Cgg3kBNXDKX7RFLnFRNsK0TWuqmrkJIhltWAE8wEBgI5yEUd8us0J9waUwIxrn+PjLy3
         fjbgbPBMhGUdd0oaGzUOM4JjzHiUnbUyUtgxTdzjBbRzFRQzBcNRrlgJW5Hlu7FBviyJ
         xp0Q==
X-Gm-Message-State: AOJu0Yzy4oWtpkqRxwS0NCm/+ehHQxK+s8tt2TF/W0wv1ub1ppZsmQ2B
	khYgePa3n8/JM4E64parTkMi/N8GLE0alI9ZIz/sgWAE/GawXGENxWl1sro7wH4h+AkmfAzFoE+
	GKYY=
X-Gm-Gg: ASbGnct+k7QLGaTgQoZYuwR7gi5tsq16Mfniq3SeSYkBw11mU3DKGUP8uNMV/w4vcVr
	a5SwyzMmCaA18VBCcjJn33Ddj/3YhbCKdIPocnOGRrEqpvQNRD+oEbpTB8I7lKcai61pvSe6qzD
	V7NOcp06WpTdpRA3Tb/2JHq1+zhXCcn0f7MYHmxlm/EUrSu/U78Y4FAPKF2/9MaGOGs07eFWrIx
	bjxJcgyiieBxch3bJuxCNchFj7CKZteBMW6r02ZXMomsHo3FSM5n5lj+52/3EI/1karhoWtKleC
	uNJks1yWgsSjwJLQJaYaJkEwpcWQ25w=
X-Google-Smtp-Source: AGHT+IG4DJLrl6NLUHTPzC+A9SJs0MLT71zaEgDqBEis/Tc6PKAXvFBSiU2C1+RQcBFOcBHhJAAp4g==
X-Received: by 2002:a05:6512:3183:b0:542:98bb:566f with SMTP id 2adb3069b0e04-543e4c3fda5mr3907113e87.52.1738326922632;
        Fri, 31 Jan 2025 04:35:22 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe103d1sm469429e87.59.2025.01.31.04.35.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 04:35:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa: upgrade 24.0.7 -> 24.3.4
Date: Fri, 31 Jan 2025 14:35:19 +0200
Message-Id: <20250131123519.461671-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 12:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210479

Upgrade the Mesa package, dropping applied and refreshing outstanding
patches. The dri3 config option is now gone, dependencies are merged
into X11 deps. The swrast gallium driver has been split into softpipe
and llvmpipe drivers.

Changelog:
     https://docs.mesa3d.org/relnotes/24.3.4.html

License-Update: license text cleared and clarified.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...-meson-do-not-pull-in-clc-for-clover.patch |  8 +--
 ...lude-missing-llvm-IR-header-Module.h.patch | 41 -------------
 .../0001-drisw-fix-build-without-dri3.patch   | 58 -------------------
 ...on-t-encode-build-path-into-binaries.patch | 46 ++++++++++++---
 ...on-t-try-zink-if-not-enabled-in-mesa.patch | 42 --------------
 meta/recipes-graphics/mesa/mesa.inc           | 31 +++++-----
 6 files changed, 57 insertions(+), 169 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-header-Module.h.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
index 1711e22585a7..926a1484c76e 100644
--- a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
+++ b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
@@ -26,14 +26,14 @@ index 2db6185..741b5d1 100644
    endif
  
 +  with_clc = true
-   with_gallium_opencl = true
+   with_gallium_clover = true
    with_opencl_icd = _opencl == 'icd'
  else
 @@ -837,7 +838,7 @@ if with_gallium_rusticl
- endif
+ with_clc = with_microsoft_clc or with_intel_clc or with_gallium_asahi or with_asahi_vk or with_gallium_rusticl or with_clover_spirv
  
  dep_clc = null_dep
--if with_gallium_opencl or with_clc
+-if with_gallium_clover or with_clc
 +if with_clc
    dep_clc = dependency('libclc')
  endif
@@ -47,7 +47,7 @@ index 8d73544..1dae56d 100644
  subdir('spirv')
  
 -if with_clc
-+if with_opencl_spirv
++if with_clover_spirv
    subdir('clc')
  endif
  if with_gallium
diff --git a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-header-Module.h.patch b/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-header-Module.h.patch
deleted file mode 100644
index 82ad88a079c1..000000000000
--- a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-header-Module.h.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 777d69cf15b80ab1f109a4936d6e4801c4b0e0f3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 1 Jul 2024 23:09:29 -0700
-Subject: [PATCH] amd: Include missing llvm IR header Module.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-With LLVM-19, Module.h header is not being pulled, which results in
-compile errors e.g.
-
-src/amd/llvm/ac_llvm_helper.cpp:102:10: error: no matching function for call to ‘unwrap(LLVMOpaqueModule*&)’
-  102 |    unwrap(module)->setTargetTriple(TM->getTargetTriple().getTriple());
-      |    ~~~~~~^~~~~~~~
-In file included from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/Type.h:18,
-                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/DerivedTypes.h:23,
-                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/InstrTypes.h:26,
-                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-sysroot-native/usr/include/llvm/Analysis/TargetLibraryInfo.h:14,
-                 from ../mesa-24.0.7/src/amd/llvm/ac_llvm_helper.cpp:8:
-
-Its getting the definition from llvm/IR/Type.h instead of Module.h and caused
-confusion to compiler
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29993]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/amd/llvm/ac_llvm_helper.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/amd/llvm/ac_llvm_helper.cpp b/src/amd/llvm/ac_llvm_helper.cpp
-index 5d065279ad1..af4a50f8409 100644
---- a/src/amd/llvm/ac_llvm_helper.cpp
-+++ b/src/amd/llvm/ac_llvm_helper.cpp
-@@ -8,6 +8,7 @@
- #include <llvm/Analysis/TargetLibraryInfo.h>
- #include <llvm/IR/IRBuilder.h>
- #include <llvm/IR/LegacyPassManager.h>
-+#include <llvm/IR/Module.h>
- #include <llvm/IR/Verifier.h>
- #include <llvm/Target/TargetMachine.h>
- #include <llvm/MC/MCSubtargetInfo.h>
diff --git a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
deleted file mode 100644
index ab1615209063..000000000000
--- a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Tue, 6 Feb 2024 09:47:09 +0100
-Subject: [PATCH 1/2] drisw: fix build without dri3
-
-commit 1887368df41 ("glx/sw: check for modifier support in the kopper path")
-added dri3_priv.h header and dri3_check_multibuffer() function in drisw that
-can be build without dri3.
-
-  i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a.p/drisw_glx.c.o: in function `driswCreateScreenDriver':
-  drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined reference to `dri3_check_multibuffer'
-  collect2: error: ld returned 1 exit status
-
-Add HAVE_DRI3 guard around dri3_priv.h header and the zink code using
-dri3_check_multibuffer().
-
-Fixes: 1887368df41 ("glx/sw: check for modifier support in the kopper path")
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/glx/drisw_glx.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/glx/drisw_glx.c b/src/glx/drisw_glx.c
-index 3d3f752..4b19e2d 100644
---- a/src/glx/drisw_glx.c
-+++ b/src/glx/drisw_glx.c
-@@ -32,7 +32,9 @@
- #include <dlfcn.h>
- #include "dri_common.h"
- #include "drisw_priv.h"
-+#ifdef HAVE_DRI3
- #include "dri3_priv.h"
-+#endif
- #include <X11/extensions/shmproto.h>
- #include <assert.h>
- #include <vulkan/vulkan_core.h>
-@@ -995,6 +997,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
-        goto handle_error;
-    }
- 
-+#ifdef HAVE_DRI3
-    if (pdpyp->zink) {
-       bool err;
-       psc->has_multibuffer = dri3_check_multibuffer(priv->dpy, &err);
-@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
-          goto handle_error;
-       }
-    }
-+#endif
- 
-    glx_config_destroy_list(psc->base.configs);
-    psc->base.configs = configs;
--- 
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index 5975ab4472ec..953a724dc092 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -22,18 +22,29 @@ diff --git a/src/freedreno/afuc/meson.build b/src/freedreno/afuc/meson.build
 index bb7cebf5a748..351cc31ef2de 100644
 --- a/src/freedreno/afuc/meson.build
 +++ b/src/freedreno/afuc/meson.build
-@@ -56,6 +56,7 @@ if with_tests
+@@ -56,10 +56,12 @@ if with_tests
    asm_fw = custom_target('afuc_test.fw',
      output: 'afuc_test.fw',
-     command: [asm, '-g', '6', files('../.gitlab-ci/traces/afuc_test.asm'), '@OUTPUT@'],
+     command: [asm, files('../.gitlab-ci/traces/afuc_test.asm'), '@OUTPUT@'],
++    env: {'RNN_PATH': rnn_src_path},
+   )
+   asm_fw_a7xx = custom_target('afuc_test_a7xx.fw',
+     output: 'afuc_test_a7xx.fw',
+     command: [asm, files('../.gitlab-ci/traces/afuc_test_a7xx.asm'), '@OUTPUT@'],
 +    env: {'RNN_PATH': rnn_src_path},
    )
    test('afuc-asm',
      diff,
-@@ -120,6 +122,7 @@ if cc.sizeof('size_t') > 4
+@@ -120,11 +122,13 @@ if cc.sizeof('size_t') > 4
      disasm_fw = custom_target('afuc_test.asm',
        output: 'afuc_test.asm',
-       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test.fw'), '-g', '630'],
+       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test.fw')],
++      env: {'RNN_PATH': rnn_src_path},
+       capture: true
+     )
+     disasm_fw_a7xx = custom_target('afuc_test_a7xx.asm',
+       output: 'afuc_test_a7xx.asm',
+       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test_a7xx.fw')],
 +      env: {'RNN_PATH': rnn_src_path},
        capture: true
      )
@@ -71,8 +82,29 @@ index 98e49b8fcf0e..145e72597eb9 100644
 -rnn_path = rnn_src_path + ':' + get_option('prefix') + '/' + rnn_install_path
 +rnn_path = get_option('prefix') + '/' + rnn_install_path
  
- dep_lua = dependency('lua54', 'lua53', 'lua52', 'lua', required: false,
-                      allow_fallback: true, version: '>=5.2')
--- 
+ dep_libarchive = dependency('libarchive', allow_fallback: true, required: false)
+ dep_libxml2 = dependency('libxml-2.0', allow_fallback: true, required: false)
+diff --git a/src/freedreno/registers/gen_header.py b/src/freedreno/registers/gen_header.py
+--- a/src/freedreno/registers/gen_header.py
++++ b/src/freedreno/registers/gen_header.py
+@@ -885,13 +885,14 @@ The rules-ng-ng source files this header
+ """)
+ 	maxlen = 0
+ 	for filepath in p.xml_files:
+-		maxlen = max(maxlen, len(filepath))
++		maxlen = max(maxlen, len(os.path.basename(filepath)))
+ 	for filepath in p.xml_files:
+-		pad = " " * (maxlen - len(filepath))
++		filename = os.path.basename(filepath)
++		pad = " " * (maxlen - len(filename))
+ 		filesize = str(os.path.getsize(filepath))
+ 		filesize = " " * (7 - len(filesize)) + filesize
+ 		filetime = time.ctime(os.path.getmtime(filepath))
+-		print("- " + filepath + pad + " (" + filesize + " bytes, from " + filetime + ")")
++		print("- " + filename + pad + " (" + filesize + " bytes, from " + filetime + ")")
+ 	if p.copyright_year:
+ 		current_year = str(datetime.date.today().year)
+ 		print()
+---
 2.39.2
 
diff --git a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch b/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
deleted file mode 100644
index 036a0b494539..000000000000
--- a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Tue, 6 Feb 2024 09:47:10 +0100
-Subject: [PATCH 2/2] glxext: don't try zink if not enabled in mesa
-
-Commit 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
-added an automatic zink fallback even when the zink gallium is not
-enabled at build time.
-
-It leads to unexpected error log while loading drisw driver and
-zink is not installed on the rootfs:
-
-  MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so
-
-Fixes: 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/glx/glxext.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/glx/glxext.c b/src/glx/glxext.c
-index 05c825a..7a06aa9 100644
---- a/src/glx/glxext.c
-+++ b/src/glx/glxext.c
-@@ -908,9 +908,11 @@ __glXInitialize(Display * dpy)
- #endif /* HAVE_DRI3 */
-       if (!debug_get_bool_option("LIBGL_DRI2_DISABLE", false))
-          dpyPriv->dri2Display = dri2CreateDisplay(dpy);
-+#if defined(HAVE_ZINK)
-       if (!dpyPriv->dri3Display && !dpyPriv->dri2Display)
-          try_zink = !debug_get_bool_option("LIBGL_KOPPER_DISABLE", false) &&
-                     !getenv("GALLIUM_DRIVER");
-+#endif /* HAVE_ZINK */
-    }
- #endif /* GLX_USE_DRM */
-    if (glx_direct)
--- 
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b3c595b76716..50ff6bfaa030 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -10,21 +10,18 @@ HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/license.rst;md5=63779ec98d78d823a9dc533a0735ef10"
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=ffe678546d4337b732cfd12262e6af11"
 
 PE = "2"
 
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
-           file://0001-drisw-fix-build-without-dri3.patch \
-           file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
            file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
-           file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch\
 "
 
-SRC_URI[sha256sum] = "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"
-PV = "24.0.7"
+SRC_URI[sha256sum] = "e641ae27191d387599219694560d221b7feaa91c900bcec46bf444218ed66025"
+PV = "24.3.4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
@@ -38,7 +35,7 @@ do_install:append() {
   fi
 }
 
-DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native"
+DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
 DEPENDS:append:class-target = " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'mesa-native', '', d)}"
 EXTRANATIVEPATH += "chrpath-native"
 PROVIDES = " \
@@ -88,8 +85,6 @@ PACKAGECONFIG = " \
 	video-codecs \
 	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm virgl', '', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'dri3', '', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
 "
 
@@ -98,14 +93,11 @@ PACKAGECONFIG:append:class-native = " gallium-llvm r600"
 # "gbm" requires "opengl"
 PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
 
-X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr"
+X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr xorgproto libxshmfence"
 # "x11" requires "opengl"
 PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
 PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 
-PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, xorgproto libxshmfence"
-
-# Vulkan drivers need dri3 enabled
 # amd could be enabled as well but requires gallium-llvm with llvm >= 3.9
 VULKAN_DRIVERS = ""
 VULKAN_DRIVERS:append:x86 = ",intel,amd"
@@ -137,7 +129,7 @@ PACKAGECONFIG[freedreno-fdperf] = ",,libconfig"
 PACKAGECONFIG[tools] = "-Dtools=${@strip_comma('${TOOLS}')}, -Dtools='', ${TOOLS_DEPS}"
 
 PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
-PACKAGECONFIG[glvnd] = "-Dglvnd=true, -Dglvnd=false, libglvnd"
+PACKAGECONFIG[glvnd] = "-Dglvnd=true, -Dglvnd=disabled, libglvnd"
 
 # "gles" requires "opengl"
 PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2=disabled"
@@ -157,7 +149,7 @@ PACKAGECONFIG[vc4] = ""
 PACKAGECONFIG[v3d] = ""
 PACKAGECONFIG[zink] = ""
 
-GALLIUMDRIVERS = "swrast"
+GALLIUMDRIVERS = "softpipe"
 # gallium swrast was found to crash Xorg on startup in x32 qemu
 GALLIUMDRIVERS:x86-x32 = ""
 GALLIUMDRIVERS:append:x86 = ",i915,iris,crocus"
@@ -174,7 +166,7 @@ GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '
 
 # radeonsi requires LLVM
 GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
-GALLIUMDRIVERS_LLVM = ",r300,nouveau${GALLIUMDRIVERS_RADEONSI}"
+GALLIUMDRIVERS_LLVM = ",llvmpipe,r300,nouveau${GALLIUMDRIVERS_RADEONSI}"
 GALLIUMDRIVERS_LLVM:append:x86 = ",svga"
 GALLIUMDRIVERS_LLVM:append:x86-64 = ",svga"
 # i686 is a 32 bit override for mesa-native
@@ -242,6 +234,7 @@ RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'lib
 
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
+             libgallium \
              libgl-mesa libgl-mesa-dev \
              libglx-mesa libglx-mesa-dev \
              libglapi libglapi-dev \
@@ -344,7 +337,8 @@ FILES:mesa-megadriver = "${libdir}/dri/* ${datadir}/drirc.d"
 FILES:mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${libdir}/libpowervr_rogue.so ${datadir}/vulkan"
 FILES:${PN}-vdpau-drivers = "${libdir}/vdpau/*.so.*"
 FILES:libegl-mesa = "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendor.d"
-FILES:libgbm = "${libdir}/libgbm.so.*"
+FILES:libgbm = "${libdir}/libgbm.so.* ${libdir}/gbm/*_gbm.so"
+FILES:libgallium = "${libdir}/libgallium-*.so"
 FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
 FILES:libgl-mesa = "${libdir}/libGL.so.*"
@@ -372,6 +366,9 @@ FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
 FILES:${PN}-tools = "${bindir} ${datadir}"
 ALLOW_EMPTY:${PN}-tools = "1"
 
+# All DRI drivers are symlinks to libdril_dri.so
+INSANE_SKIP:mesa-megadriver += "dev-so"
+
 # Fix upgrade path from mesa to mesa-megadriver
 RREPLACES:mesa-megadriver = "mesa"
 RCONFLICTS:mesa-megadriver = "mesa"
-- 
2.39.5


