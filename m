Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id F103C78916
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 22:35:11 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a20so486499wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 14:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=DL/aZn+64dOzarCxjExI69B3tThlrIVN3bKk5mntY6U=;
	b=xH21hZOa/DjwsMw2nk2nIZs7wp9shzaAXj71x36s2Uwj75SraSbE+8zWRgy0RvrxVe
	LeeLamkVreKUvYj9G37NM6AkzJOjd97TbPMGzPY4VUVcEGIzs55FNkNJM3QbPExuuhPF
	FaUcVsQr4bU+AqGEphoHa7m08O3crasuh6ryBvrS+P8gg6zmSNKd4UYi45NHmTgm6P5R
	TmTcE+rec1KEpYiPMzjhXzP/4J4ZKuh+A721Nb1mNDlS9nvt09JV8xxRt+FZUp9nD9IW
	qhPYHFe0OSwf+JdyXgQJNu0iOSrBvSAmwb6xBovu+MV/DStokECZYL20D3SfH4u72S4I
	w1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DL/aZn+64dOzarCxjExI69B3tThlrIVN3bKk5mntY6U=;
	b=EuubAGMcANAFMf6jJ+3F3qtFte2mETYTx3eNGY8mhxXc0Z/BbbduYdB2pDBnpk+iiB
	uXjC0p8OmJc4NPFO6KoZ178LrJf7qKY3AUNBtVu2tfQmtxW0O21tkgN8kjTMZ5Z2KZCi
	sx0VoiUPFwvq68eRuS6Devo2n5BfYAm4aoeoUCw519rhw37pvMohNleUpUou9c0h2XNq
	+g3rvpZA2liOGWMm5Lq/ONjt1Qrez20nHJYvCpC6/eOn2uyGhbJYc2FIxy6qRud2uTYM
	1gC6cGL6lTZuoJSnpHHm8CmAJ/UdnI0Qn8ewpx6sx3w17RBdKwuhaESFkW6RyfWp5dF5
	On2A==
X-Gm-Message-State: APf1xPBrJNUL6+ve9jgBSgEU5G81SPYbKdhkCci78mma+NOwdjqbD1QC
	8hxVgetl8xdgHCZB3g3d5t8bjl++
X-Google-Smtp-Source: AG47ELu9/3CM61JExa5H17YcgX0lsxn3Hz6on6H+x0INMNu2lEfUBHoXvGB+vVr5hmWwICcZcaV+Qg==
X-Received: by 10.28.144.82 with SMTP id s79mr2757252wmd.4.1519943712429;
	Thu, 01 Mar 2018 14:35:12 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id q9sm5399056wrf.11.2018.03.01.14.35.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 14:35:11 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 22:35:09 +0000
Message-Id: <20180301223509.5618-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libepoxy: improve musl patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2018 22:35:12 -0000

dlvsym() is used by the libepoxy test suite, but this is glibc-specific and
isn't present in musl.

Instead of adding an option to control whether dlvsym is available (which could
be detected by Meson), as we don't install the test suite simply add an option
to disable the entire test suite (and submit the patch upstream).

Also remove the build dependency on util-macros as that is a remnant of the
autotools build.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...sible-to-disable-the-use-of-dlvsym-needed.patch | 58 ----------------------
 .../libepoxy/libepoxy/no-tests.patch               | 33 ++++++++++++
 meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb   |  6 +--
 3 files changed, 35 insertions(+), 62 deletions(-)
 delete mode 100644 meta/recipes-graphics/libepoxy/libepoxy/0001-Make-it-possible-to-disable-the-use-of-dlvsym-needed.patch
 create mode 100644 meta/recipes-graphics/libepoxy/libepoxy/no-tests.patch

diff --git a/meta/recipes-graphics/libepoxy/libepoxy/0001-Make-it-possible-to-disable-the-use-of-dlvsym-needed.patch b/meta/recipes-graphics/libepoxy/libepoxy/0001-Make-it-possible-to-disable-the-use-of-dlvsym-needed.patch
deleted file mode 100644
index bd49e36314f..00000000000
--- a/meta/recipes-graphics/libepoxy/libepoxy/0001-Make-it-possible-to-disable-the-use-of-dlvsym-needed.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 9c964427656ef71210e2c5b48b279857806574e9 Mon Sep 17 00:00:00 2001
-From: Francesco Giancane <francescogiancane8@gmail.com>
-Date: Wed, 28 Feb 2018 21:32:24 +0100
-Subject: [PATCH] Make it possible to disable the use of dlvsym() (needed for
- musl)
-
-Add a patch to work around absence of dlvsym() on musl
-(wasn't previously a problem as autotools weren't building tests by default)
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
-Signed-off-by: Francesco Giancane <francescogiancane8@gmail.com>
----
- meson_options.txt | 3 +++
- test/meson.build  | 6 +++---
- 2 files changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/meson_options.txt b/meson_options.txt
-index b5d7c98..aa849c2 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -1,6 +1,9 @@
- option('docs',
-        type: 'boolean', value: false,
-        description: 'Enable generating the Epoxy API reference (depends on Doxygen)')
-+option('has-dlvsym',
-+       type: 'boolean', value: true,
-+       description: 'Whether dlvsym() is available (it is not when using musl C library)')
- option('glx',
-        type: 'combo',
-        choices: [ 'auto', 'yes', 'no' ],
-diff --git a/test/meson.build b/test/meson.build
-index c5788b4..4c46ae6 100644
---- a/test/meson.build
-+++ b/test/meson.build
-@@ -92,8 +92,8 @@ if build_glx
-     [ 'glx_has_extension_nocontext', [ 'glx_has_extension_nocontext.c' ], [], [], true ],
-     [ 'glx_static', [ 'glx_static.c' ], [ '-DNEEDS_TO_BE_STATIC'], [ '-static' ], libtype == 'static' ],
-     [ 'glx_shared_znow', [ 'glx_static.c', ], [], [ '-Wl,-z,now' ], has_znow ],
--    [ 'glx_alias_prefer_same_name', [ 'glx_alias_prefer_same_name.c', 'dlwrap.c', 'dlwrap.h' ], [], [ '-rdynamic' ], not build_apple ],
--    [ 'glx_gles2', [ 'glx_gles2.c', 'dlwrap.c', 'dlwrap.h' ], [], [ '-rdynamic' ], not build_apple ],
-+    [ 'glx_alias_prefer_same_name', [ 'glx_alias_prefer_same_name.c', 'dlwrap.c', 'dlwrap.h' ], [], [ '-rdynamic' ], not build_apple and get_option('has-dlvsym') == true ],
-+    [ 'glx_gles2', [ 'glx_gles2.c', 'dlwrap.c', 'dlwrap.h' ], [], [ '-rdynamic' ], not build_apple and get_option('has-dlvsym') == true ],
-   ]
- 
-   foreach test: glx_tests
-@@ -114,7 +114,7 @@ if build_glx
-     endif
-   endforeach
- 
--  if not build_apple
-+  if not build_apple and get_option('has-dlvsym') == true
-     # GLX/EGL tests
-     if build_egl
-       glx_egl_sources = [
--- 
-2.14.3
-
diff --git a/meta/recipes-graphics/libepoxy/libepoxy/no-tests.patch b/meta/recipes-graphics/libepoxy/libepoxy/no-tests.patch
new file mode 100644
index 00000000000..d2b6c1a254c
--- /dev/null
+++ b/meta/recipes-graphics/libepoxy/libepoxy/no-tests.patch
@@ -0,0 +1,33 @@
+Add option to disable tests.
+
+Upstream-Status: Submitted (https://github.com/anholt/libepoxy/pull/158)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/meson.build b/meson.build
+index b2ebaef..9632c7a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -242,7 +242,10 @@ libepoxy_inc = [
+ 
+ subdir('include/epoxy')
+ subdir('src')
+-subdir('test')
++
++if get_option('tests')
++  subdir('test')
++endif
+ 
+ if get_option('docs')
+   doxygen = find_program('doxygen', required: false)
+diff --git a/meson_options.txt b/meson_options.txt
+index b5d7c98..dc30e68 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -15,3 +15,7 @@ option('x11',
+        type: 'boolean',
+        value: true,
+        description: 'Enable X11 support (GLX or EGL-X11)')
++option('tests',
++       type: 'boolean',
++       value: true,
++       description: 'Build the test suite')
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
index dfdd19248d7..5ca0868c22f 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 
 SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz \
-           file://0001-Make-it-possible-to-disable-the-use-of-dlvsym-needed.patch \
+           file://no-tests.patch \
            "
 SRC_URI[md5sum] = "63fe3847789258254dcd7e3fdb9e7f5e"
 SRC_URI[sha256sum] = "4c94995398a6ebf691600dda2e9685a0cac261414175c2adf4645cdfab42a5d5"
@@ -16,10 +16,8 @@ inherit meson pkgconfig distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-DEPENDS = "util-macros"
-
 PACKAGECONFIG[egl] = "-Degl=yes, -Degl=no, virtual/egl"
 PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no, virtual/libx11 virtual/libgl"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} egl"
 
-EXTRA_OEMESON_append_libc-musl = " -Dhas-dlvsym=false "
+EXTRA_OEMESON += "-Dtests=false"
-- 
2.11.0


