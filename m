Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3D6C44520
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 08:01:29 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1655.1784448083740094652
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 01:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CHiCRZGs;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954df200ddso8233865e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 01:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784448082; x=1785052882; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mUuu93/bRI7Fe9J5bkvuzVIFqZX2tQIn6bayVJyFVEs=;
        b=CHiCRZGsYLQqql54QwyaifdxJ4WQhHwd6HA1tEGnUJSBGihFBzuOZaZ9+CZSCEbCRj
         nEGVCMtvT7J/ALT7tBQOcPFA1/aXrZNxQz25hLsXjHETe/PBFzf8IzcvGGcvpoZAYE+3
         c7jNZAsPJQJqUpvMf3Uv6ktcFeCt0hn8NnPWm+rpGb0a3wzJRy871MkLwePTVEGALELF
         1ErXwvGh9cbdo7W4jNepgn2hLHVaAKTRNt7asPD7Lx4opYRFhmaD0lwdOvkzdwl4Ty6p
         kqjY/cjxlwUPonJzGl9DKx1k1Ispf0Dz6j6CanZxaCEa9nsbDF5zfqGKH3GRbe6teHQi
         yU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784448082; x=1785052882;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mUuu93/bRI7Fe9J5bkvuzVIFqZX2tQIn6bayVJyFVEs=;
        b=IaCMIHZiBKXOEToCKIC5cXBjGdOLtw8v+bPoc6cOYlcCHArjkt09cJJJE3uSHY/+qS
         ZXy0vvOnPw+J2J3WYRy4qzJ8UmQsX0Ox0pz60VuEgLFcwLC8h3KLc0bTnpOGfX3YUtIq
         4ldkFhx4vEHo+kgyycVBE8rmYLp56E4gZRGYulIj7RYlOO3JJGayDhlkkGhNpNcvBXrx
         z209+JtOzWFJ4DWNoWyjQTS40rPKsW2RW0p6D7r8XK01qlx1kXkVhhPPPWyInjwP0kPM
         DIukkYwNl3dpfdKrS+kd09NOpCzlo8Vf+dBa+r/weIqbxLEnANYSZPw+u7qFE8RXyYxd
         vUHA==
X-Gm-Message-State: AOJu0YxZQCRxqdw9zXUU4X1p3FLjG9lnYibHipu+Aeg4jN460rVFo9WL
	cZfFLb9z1acszo2vf4X3ostWmeUBu47M5NeCcZGJicket82wm0g4mzdpaJ313Q==
X-Gm-Gg: AfdE7cm4AGYqZCNAdZAkgM490QOiG1vgbYlubbyUzFJU4eQiazphcoYTCmjizsasJ7k
	0Uy/5o1q3/hN9Zx/tv99RxC5/xVfFxZEJIiBe0Mi1jlryHrLWB4gAYV0TM5WS/S+Wz0HdMTf6Tv
	IjdvUBK6ZBgzi5V3kt28jY+uQrmfH3PqJvkPME1VntEKzhxzOYDPM/A7h9zn7jaOSLoRG4idYja
	Cswirm9n8dSjqC8OIlDzpMKY9/FhNri/wXy2IZ7rSADw8RXRgIHVRkzHy821NJtObNr5SQEd1/n
	ixYQDOide6YAbdDuhRI9WgIgq6/TcjJgfMOrGoOhH1ouAZXjPeY84Y9ifumxl2jDD0CZXFbdd5U
	BnhNIjy4IQoY9fsOLsy0kxadzjci0QQy+0zrgXREyVS3/si6vOT6D7YIRWXf02ZsGFOGL6rEPlV
	VXSi+unEY8AspS
X-Received: by 2002:a05:600c:3586:b0:495:3f68:699b with SMTP id 5b1f17b1804b1-4954a3f3173mr98045265e9.9.1784448081505;
        Sun, 19 Jul 2026 01:01:21 -0700 (PDT)
Received: from term011.lan (BC24447B.dsl.pool.telekom.hu. [188.36.68.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49500sm19221644f8f.2.2026.07.19.01.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 01:01:21 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 3/3] mesa, mesa-tools-native: Use mesa-libclc
Date: Sun, 19 Jul 2026 10:01:08 +0200
Message-ID: <20260719080108.1290998-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260719080108.1290998-1-zboszor@gmail.com>
References: <20260719080108.1290998-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 08:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241278

Backport two patches from
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43020
to use mesa-libclc, which makes Rusticl's OpenCL C more correct.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...-optional-for-configs-not-needing-it.patch | 123 ++++++++++++++++++
 ...lc-use-our-downstream-fork-of-libclc.patch |  43 ++++++
 .../mesa/mesa-tools-native.bb                 |   2 +-
 meta/recipes-graphics/mesa/mesa.inc           |   6 +-
 4 files changed, 171 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-clc-make-libclc-optional-for-configs-not-needing-it.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0002-clc-use-our-downstream-fork-of-libclc.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-clc-make-libclc-optional-for-configs-not-needing-it.patch b/meta/recipes-graphics/mesa/files/0001-clc-make-libclc-optional-for-configs-not-needing-it.patch
new file mode 100644
index 0000000000..a52931dbf5
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-clc-make-libclc-optional-for-configs-not-needing-it.patch
@@ -0,0 +1,123 @@
+From 5df2fb59c32fd6e3ad53bdaf98afccfddbdd14fc Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Fri, 17 Jul 2026 17:45:45 +0200
+Subject: [PATCH 1/2] clc: make libclc optional for configs not needing it
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43020]
+---
+ meson.build                  |  2 +-
+ src/compiler/clc/meson.build | 73 +++++++++++++++++++-----------------
+ 2 files changed, 39 insertions(+), 36 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 1eca91fc940..68bbb942b99 100644
+--- a/meson.build
++++ b/meson.build
+@@ -949,7 +949,7 @@ with_poly = [
+ ].contains(true)
+ 
+ dep_clc = null_dep
+-if with_clc
++if with_gallium_rusticl or with_microsoft_clc
+   dep_clc = dependency('libclc')
+ endif
+ 
+diff --git a/src/compiler/clc/meson.build b/src/compiler/clc/meson.build
+index 9ff61440f0d..249fd31f478 100644
+--- a/src/compiler/clc/meson.build
++++ b/src/compiler/clc/meson.build
+@@ -4,7 +4,6 @@
+ files_libmesaclc = files(
+   'clc.c',
+   'clc_helpers.cpp',
+-  'nir_load_libclc.c',
+ )
+ 
+ _libmesaclc_c_args = []
+@@ -41,45 +40,49 @@ if not _shared_llvm or \
+   _libmesaclc_cpp_args += ['-DUSE_STATIC_OPENCL_C_H=1']
+ endif
+ 
+-_basedir = dep_clc.get_variable(pkgconfig : 'libexecdir')
++if dep_clc.found()
++  files_libmesaclc += 'nir_load_libclc.c'
+ 
+-_static_libclc = get_option('static-libclc')
+-if _static_libclc.length() > 0
+-  if _static_libclc.contains('all')
+-    _static_libclc = ['spirv', 'spirv64']
+-  endif
+-  prog_zstd = find_program('zstd', required : false, native : true)
+-  _zstd_static_libclc = dep_zstd.found() and prog_zstd.found()
+-  if _zstd_static_libclc
+-    _libmesaclc_c_args += '-DHAVE_STATIC_LIBCLC_ZSTD'
+-  endif
+-  foreach s : _static_libclc
+-    _libmesaclc_c_args += '-DHAVE_STATIC_LIBCLC_@0@'.format(s.to_upper())
+-    f = '@0@-mesa3d-.spv'.format(s)
+-    _libclc_file = _basedir / f
++  _basedir = dep_clc.get_variable(pkgconfig : 'libexecdir')
++
++  _static_libclc = get_option('static-libclc')
++  if _static_libclc.length() > 0
++    if _static_libclc.contains('all')
++      _static_libclc = ['spirv', 'spirv64']
++    endif
++    prog_zstd = find_program('zstd', required : false, native : true)
++    _zstd_static_libclc = dep_zstd.found() and prog_zstd.found()
+     if _zstd_static_libclc
+-      _libclc_file = custom_target(
+-        '@0@.zstd'.format(f),
+-        command : [prog_zstd, '-f', '@INPUT@', '-o', '@OUTPUT@'],
++      _libmesaclc_c_args += '-DHAVE_STATIC_LIBCLC_ZSTD'
++    endif
++    foreach s : _static_libclc
++      _libmesaclc_c_args += '-DHAVE_STATIC_LIBCLC_@0@'.format(s.to_upper())
++      f = '@0@-mesa3d-.spv'.format(s)
++      _libclc_file = _basedir / f
++      if _zstd_static_libclc
++        _libclc_file = custom_target(
++          '@0@.zstd'.format(f),
++          command : [prog_zstd, '-f', '@INPUT@', '-o', '@OUTPUT@'],
++          input : [_libclc_file],
++          output : '@0@.zstd'.format(f),
++        )
++      endif
++      files_libmesaclc += custom_target(
++        '@0@.h'.format(f),
++        command : [
++          prog_python, files_xxd, '-b', '@INPUT@', '@OUTPUT@',
++          '-n', 'libclc_@0@_mesa3d_spv'.format(s),
++        ],
+         input : [_libclc_file],
+-        output : '@0@.zstd'.format(f),
++        output : '@0@.h'.format(f),
++        depend_files : files_xxd,
+       )
++    endforeach
++  else
++    _libmesaclc_c_args += ['-DDYNAMIC_LIBCLC_PATH="@0@/"'.format(_basedir)]
++    if not cc.has_function('mmap')
++      error('mmap required for dynamic libCLC loading')
+     endif
+-    files_libmesaclc += custom_target(
+-      '@0@.h'.format(f),
+-      command : [
+-        prog_python, files_xxd, '-b', '@INPUT@', '@OUTPUT@',
+-        '-n', 'libclc_@0@_mesa3d_spv'.format(s),
+-      ],
+-      input : [_libclc_file],
+-      output : '@0@.h'.format(f),
+-      depend_files : files_xxd,
+-    )
+-  endforeach
+-else
+-  _libmesaclc_c_args += ['-DDYNAMIC_LIBCLC_PATH="@0@/"'.format(_basedir)]
+-  if not cc.has_function('mmap')
+-    error('mmap required for dynamic libCLC loading')
+   endif
+ endif
+ 
+-- 
+2.55.0
+
diff --git a/meta/recipes-graphics/mesa/files/0002-clc-use-our-downstream-fork-of-libclc.patch b/meta/recipes-graphics/mesa/files/0002-clc-use-our-downstream-fork-of-libclc.patch
new file mode 100644
index 0000000000..39e120b036
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0002-clc-use-our-downstream-fork-of-libclc.patch
@@ -0,0 +1,43 @@
+From 8bda7974958e5ba56b0eec25a7876c004b6b743b Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Thu, 16 Jul 2026 21:20:52 +0200
+Subject: [PATCH 2/2] clc: use our downstream fork of libclc
+
+There are a couple of issues with the upstream versions and release
+schedules and overall experience makes it dificult for us to rely on
+users using a proper functional implementation.
+
+And we want to ship a conformant OpenCL implementation here and that's
+difficult if users run untested libclc versions or libclc with known bugs
+that aren't going to get fixed upstream because the release is already
+EoL.
+
+Backport-to: *
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43020]
+---
+ meson.build | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 68bbb942b99..6e2590cc2c6 100644
+--- a/meson.build
++++ b/meson.build
+@@ -950,7 +950,14 @@ with_poly = [
+ 
+ dep_clc = null_dep
+ if with_gallium_rusticl or with_microsoft_clc
+-  dep_clc = dependency('libclc')
++  dep_clc = dependency('mesa-libclc', required : false,
++    not_found_message :
++    'mesa-libclc not found. Build will fall back to upstream libclc, however ' +
++    'certain versions are known to contain bugs that make OpenCL builtins ' +
++    'return incorrect results.')
++  if not dep_clc.found()
++    dep_clc = dependency('libclc')
++  endif
+ endif
+ 
+ gl_pkgconfig_c_flags = []
+-- 
+2.55.0
+
diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb b/meta/recipes-graphics/mesa/mesa-tools-native.bb
index 20207450bf..c495d2e8a8 100644
--- a/meta/recipes-graphics/mesa/mesa-tools-native.bb
+++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
@@ -11,7 +11,7 @@ PACKAGECONFIG += "gallium-llvm"
 # to PACKAGECONFIG like in mesa.inc
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)}"
 
-DEPENDS += "libclc-native spirv-tools-native spirv-llvm-translator-native"
+DEPENDS += "mesa-libclc-native spirv-tools-native spirv-llvm-translator-native"
 
 EXTRA_OEMESON += " \
     -Dmesa-clc=enabled -Dinstall-mesa-clc=true -Dmesa-clc-bundle-headers=enabled \
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 15d56c804d..dea7a8295f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,6 +21,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch \
            file://0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch \
            file://0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch \
+           file://0001-clc-make-libclc-optional-for-configs-not-needing-it.patch \
+           file://0002-clc-use-our-downstream-fork-of-libclc.patch \
            "
 
 SRC_URI[sha256sum] = "79e421c7ce18cd9e790b8375920325779f10798630bf30e0b22f1a21c8617122"
@@ -110,7 +112,7 @@ PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
 
 # "opencl" also requires libclc and gallium-llvm to be present in PACKAGECONFIG!
 # Be sure to enable them both for the target and for the native build.
-PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true -Dmesa-clc-bundle-headers=enabled, -Dgallium-rusticl=false, bindgen-cli-native clang libclc spirv-tools spirv-llvm-translator"
+PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true -Dmesa-clc-bundle-headers=enabled, -Dgallium-rusticl=false, bindgen-cli-native clang mesa-libclc spirv-tools spirv-llvm-translator"
 
 X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr xorgproto libxshmfence"
 # "x11" requires "opengl"
@@ -254,7 +256,7 @@ RPROVIDES:libopencl-mesa += "virtual-opencl-icd"
 RPROVIDES:libgles2-mesa += "libgles3-mesa"
 RPROVIDES:libgles2-mesa-dev += "libgles3-mesa-dev"
 
-RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc', '', d)}"
+RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'mesa-libclc', '', d)}"
 
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgallium \
-- 
2.55.0


