Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web09.3889.1603919182801528083
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ael5IqDo;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id k9so957903edo.5
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BxAHynhEHKTaCUh0bZd/GFQaJWqq7db7u5ljG3YEuAQ=;
        b=ael5IqDojEy49SQbtNlj/mnjLhXznyWTUbJEzip0d1XMfOsbTr2jC1a4j8pChZp2sW
         JD5AVN+02tc61yS24s8BJsrbmqRktx32Z/YWpFfqXulSXjvgGVWnyYmyOxXOVPehAAaH
         l1ACYiifVNRXkTe7icWDuD9c+tD9XXzUOy5J8VEXfGU+WwM4ot9RU0rVBAtvrpFqsuCg
         wc8sbBREJqoV0afdpMbXOM/+JvhdIdNbrD2RGV2CIXr1YPh5/Y1PHE7Ioq4OdufWsClO
         anI2ES062F5i+eQElxBpAj92FLpyrOmy7SeNpO3p7txSfI+Ez/ySH8K8RhfYcZe9j6lE
         4nkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BxAHynhEHKTaCUh0bZd/GFQaJWqq7db7u5ljG3YEuAQ=;
        b=A/115zl2RzNd6XmlwQBYPCE3uPgK+1f2Da2l+Pe1R+OLv+ng+CUYbUdkOoOyb4gcXe
         O+QkIwFmNSGcztzUHNNK1ycTclbgW+9e6AlI2E8kW8JY553Jfj5XtIXI7bnsc4QJaGAN
         VvZpPcR+RTxfw8jjjK8/lPM83IEPXFfqOKre2tf8wbWRyBkB1UkYikoZdlmRSnVnD1on
         IDjcWAIEyilcfOfHq0kNT2ocT5IfHrQT7sR03KgHO6udgEcgaLygX6wfIXHjsRNdJEDA
         O6JIyz31bXoWOBO59Zih+uqyaWJ6BNPxGh1LodEKfTCZbdb7A7/U8RzUWPDtXHrBcUZ8
         REtw==
X-Gm-Message-State: AOAM532wcl+DxDkffkjEfEpum5ulcq66zucST8x/Nk09kPjYfqz+fLzh
	D0fAejbc3QmWZr1RpCQcGxuaNjXgWB7rsw==
X-Google-Smtp-Source: ABdhPJwenRgdK1peeI3jFn387T2JLDWqztuvePuC4AIdu+3GOBomh9tkkbbAHmWgfpeiH1bxRn5sKg==
X-Received: by 2002:a05:6402:744:: with SMTP id p4mr841951edy.190.1603919181004;
        Wed, 28 Oct 2020 14:06:21 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:20 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/33] mesa: update 20.1.8 -> 20.2.1
Date: Wed, 28 Oct 2020 22:05:42 +0100
Message-Id: <20201028210558.21070-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Build tweaks:
- drop separate dri option and the patch that adds it; just setting -Ddri-drivers='' is enough
- strip leading/trailing commas from drivers' lists, as upstream no longer allows blank entries if the list
is not empty (e.g. -Ddri-drivers=,driver1,driver2 is now producing an error).
- drop the long-obsolete llvm 3.3/3.2 logic

License-Update: reformatted into rst
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...02-meson.build-make-TLS-ELF-optional.patch | 18 ++++----
 ...Allow-enable-DRI-without-DRI-drivers.patch | 46 -------------------
 ...le-asm-unconditionally-now-that-gen_.patch | 16 +++----
 .../{mesa-gl_20.1.8.bb => mesa-gl_20.2.1.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           | 23 +++++-----
 .../mesa/{mesa_20.1.8.bb => mesa_20.2.1.bb}   |  0
 6 files changed, 29 insertions(+), 74 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_20.1.8.bb => mesa-gl_20.2.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_20.1.8.bb => mesa_20.2.1.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
index ee171ad1c8..74f7fe5c2d 100644
--- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
+++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
@@ -1,4 +1,4 @@
-From 65857eaee12a21a631750ffcd9e64e0afbbc3af0 Mon Sep 17 00:00:00 2001
+From ce57ce220d9c377beabf4914f33c43118f672ffe Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 13:08:31 -0800
 Subject: [PATCH] meson.build: make TLS ELF optional
@@ -15,23 +15,23 @@ Signed-off-by: Alistair Francis <alistair@alistair23.me>
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index c51dde9..c16f78f 100644
+index c5136ea..185270d 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -392,7 +392,7 @@ if with_egl and not (with_platform_drm or with_platform_surfaceless or with_plat
- endif
+@@ -424,7 +424,7 @@ endif
  
  # Android uses emutls for versions <= P/28. For USE_ELF_TLS we need ELF TLS.
--if not ['windows', 'freebsd'].contains(host_machine.system()) and (not with_platform_android or get_option('platform-sdk-version') >= 29)
-+if not ['windows', 'freebsd'].contains(host_machine.system()) and (not with_platform_android or get_option('platform-sdk-version') >= 29) and get_option('elf-tls')
+ use_elf_tls = false
+-if not ['windows', 'freebsd', 'openbsd'].contains(host_machine.system()) and (not with_platform_android or get_option('platform-sdk-version') >= 29)
++if not ['windows', 'freebsd', 'openbsd'].contains(host_machine.system()) and (not with_platform_android or get_option('platform-sdk-version') >= 29) and get_option('elf-tls')
    pre_args += '-DUSE_ELF_TLS'
+   use_elf_tls = true
  endif
- 
 diff --git a/meson_options.txt b/meson_options.txt
-index ab43150..d7b1555 100644
+index 2d39d13..72006eb 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -355,6 +355,12 @@ option(
+@@ -368,6 +368,12 @@ option(
    value : true,
    description : 'Enable direct rendering in GLX and EGL for DRI',
  )
diff --git a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
deleted file mode 100644
index a0536c87ac..0000000000
--- a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 7eaa21a79ce6d6e92f6bf98c28b68e3fcb4d7874 Mon Sep 17 00:00:00 2001
-From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Wed, 12 Jun 2019 14:18:31 -0300
-Subject: [PATCH] Allow enable DRI without DRI drivers
-
-Upstream-Status: Pending
-
-Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-
----
- meson.build       | 2 +-
- meson_options.txt | 6 ++++++
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index a954118..62864c6 100644
---- a/meson.build
-+++ b/meson.build
-@@ -154,7 +154,7 @@ with_dri_r200 = dri_drivers.contains('r200')
- with_dri_nouveau = dri_drivers.contains('nouveau')
- with_dri_swrast = dri_drivers.contains('swrast')
- 
--with_dri = dri_drivers.length() != 0 and dri_drivers != ['']
-+with_dri = get_option('dri') or (dri_drivers.length() != 0 and dri_drivers != [''])
- 
- gallium_drivers = get_option('gallium-drivers')
- if gallium_drivers.contains('auto')
-diff --git a/meson_options.txt b/meson_options.txt
-index 637ff14..700c34c 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -35,6 +35,12 @@ option(
-   choices : ['auto', 'true', 'false'],
-   description : 'enable support for dri3'
- )
-+option(
-+  'dri',
-+  type : 'boolean',
-+  value : false,
-+  description : 'enable support for dri'
-+)
- option(
-   'dri-drivers',
-   type : 'array',
diff --git a/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch b/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch
index 8d614e571a..833742359f 100644
--- a/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch
+++ b/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch
@@ -1,4 +1,4 @@
-From 41cd8836d785c79381764e7de59319f87959a5cf Mon Sep 17 00:00:00 2001
+From 43d9e40db7357f27e91002b2bb7688b6775ebb43 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 09:06:02 -0800
 Subject: [PATCH] Revert "mesa: Enable asm unconditionally, now that
@@ -15,18 +15,18 @@ Signed-off-by: Alistair Francis <alistair@alistair23.me>
  2 files changed, 67 insertions(+), 33 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 62864c6..b53be8d 100644
+index e7dc599..e2fc934 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -49,6 +49,7 @@ with_vulkan_icd_dir = get_option('vulkan-icd-dir')
+@@ -52,6 +52,7 @@ pre_args = [
+ with_vulkan_icd_dir = get_option('vulkan-icd-dir')
  with_tests = get_option('build-tests')
- with_valgrind = get_option('valgrind')
- with_libunwind = get_option('libunwind')
+ with_aco_tests = get_option('build-aco-tests')
 +with_asm = get_option('asm')
  with_glx_read_only_text = get_option('glx-read-only-text')
  with_glx_direct = get_option('glx-direct')
  with_osmesa = get_option('osmesa')
-@@ -1093,41 +1094,68 @@ dep_ws2_32 = cc.find_library('ws2_32', required : with_platform_windows)
+@@ -1154,41 +1155,68 @@ dep_ws2_32 = cc.find_library('ws2_32', required : with_platform_windows)
  
  # TODO: shared/static? Is this even worth doing?
  
@@ -129,10 +129,10 @@ index 62864c6..b53be8d 100644
  endif
  
 diff --git a/meson_options.txt b/meson_options.txt
-index 700c34c..62e8472 100644
+index 147cccb..562b059 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -241,6 +241,12 @@ option(
+@@ -254,6 +254,12 @@ option(
    value : false,
    description : 'Enable GLVND support.'
  )
diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.1.8.bb b/meta/recipes-graphics/mesa/mesa-gl_20.2.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_20.1.8.bb
rename to meta/recipes-graphics/mesa/mesa-gl_20.2.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9fc62e95e1..15f54c5acd 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -10,21 +10,20 @@ HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=c1843d93c460bbf778d6037ce324f9f7"
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=9aa1bc48c9826ad9fdb16661f6930496"
 
 PE = "2"
 
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0002-meson.build-make-TLS-ELF-optional.patch \
-           file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
            file://0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch \
            file://0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            "
 
-SRC_URI[sha256sum] = "df21351494f7caaec5a3ccc16f14f15512e98d2ecde178bba1d134edc899b961"
+SRC_URI[sha256sum] = "d1a46d9a3f291bc0e0374600bdcb59844fa3eafaa50398e472a36fc65fd0244a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
@@ -88,6 +87,9 @@ EXTRA_OEMESON = " \
     -Dplatforms='${@",".join("${PLATFORMS}".split())}' \
 "
 
+def strip_comma(s):
+    return s.strip(',')
+
 PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri gallium virgl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
@@ -114,16 +116,16 @@ DRIDRIVERS_class-nativesdk = "swrast"
 DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965,i915"
 DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965,i915"
 # "dri" requires "opengl"
-PACKAGECONFIG[dri] = "-Ddri=true -Ddri-drivers=${DRIDRIVERS}, -Ddri=false -Ddri-drivers='', xorgproto libdrm"
+PACKAGECONFIG[dri] = "-Ddri-drivers=${@strip_comma('${DRIDRIVERS}')}, -Ddri-drivers='', xorgproto libdrm"
 PACKAGECONFIG[dri3] = "-Ddri3=true, -Ddri3=false, xorgproto libxshmfence"
 
 # Vulkan drivers need dri3 enabled
-# radeon could be enabled as well but requires gallium-llvm with llvm >= 3.9
+# amd could be enabled as well but requires gallium-llvm with llvm >= 3.9
 VULKAN_DRIVERS = ""
 VULKAN_DRIVERS_append_x86_class-target = ",intel"
 VULKAN_DRIVERS_append_x86-64_class-target = ",intel"
 VULKAN_DRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
-PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${VULKAN_DRIVERS}, -Dvulkan-drivers='',"
+PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',"
 
 PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
 
@@ -150,9 +152,8 @@ GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '',
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
 
 # radeonsi requires LLVM
-GALLIUMDRIVERS_LLVM33 = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
-GALLIUMDRIVERS_LLVM33_ENABLED = "${@oe.utils.version_less_or_equal('MESA_LLVM_RELEASE', '3.2', False, len('${GALLIUMDRIVERS_LLVM33}') > 0, d)}"
-GALLIUMDRIVERS_LLVM = "r300,svga,nouveau${@',${GALLIUMDRIVERS_LLVM33}' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
+GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
+GALLIUMDRIVERS_LLVM = "r300,svga,nouveau${GALLIUMDRIVERS_RADEONSI}"
 
 PACKAGECONFIG[r600] = ""
 PACKAGECONFIG[virgl] = ""
@@ -161,9 +162,9 @@ GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '
 GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600', '', d)}"
 GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
 
-PACKAGECONFIG[gallium] = "-Dgallium-drivers=${GALLIUMDRIVERS}, -Dgallium-drivers=''"
+PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers=''"
 PACKAGECONFIG[gallium-llvm] = "-Dllvm=true -Dshared-llvm=true, -Dllvm=false, llvm${MESA_LLVM_RELEASE} llvm-native \
-                               ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
+                               elfutils"
 PACKAGECONFIG[xa]  = "-Dgallium-xa=true, -Dgallium-xa=false"
 PACKAGECONFIG[va] = "-Dgallium-va=true,-Dgallium-va=false,libva-initial"
 
diff --git a/meta/recipes-graphics/mesa/mesa_20.1.8.bb b/meta/recipes-graphics/mesa/mesa_20.2.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_20.1.8.bb
rename to meta/recipes-graphics/mesa/mesa_20.2.1.bb
-- 
2.29.0

