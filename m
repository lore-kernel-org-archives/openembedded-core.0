Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62414C54EED
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 08:38:02 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.69431.1674722278274410206
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 00:37:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cuSEEnX7;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so3552978wmq.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 00:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TFheZ4mEZAUPa1t6ZNozCZfJqIMrkiH9rbPYNGkWk5s=;
        b=cuSEEnX7OtocI8glEDOFCBqvQ30Wb4pD27K+lwFgTXKC5LCmLF7eyIo/QVCbdH+FyZ
         QhfGcAUXZoE4Aj1SX1fCzmfedAYr5pJLQJ+NfiBpMtMa7yDKtVPvMNerS4rwQKiQQuaL
         uYgPiCAXdSrPzyplRmruw5/7SQV7Lm0vSiRLqIg8WD4Z7th0x39Y4dOn0Y7XHNVCP0Bk
         HhBKB0aaBfd9uAko33X4gZhMQTTb4qkF60fEdUobiwe5PFb6xN3jBqzdv7OKtxF1gnvb
         d/EYi6HRswi6hEWY7Ra5xpaHScLdsEYwwJiNeam+gR+yTxjTBQo+0/cCodZHAxlohn1F
         DORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFheZ4mEZAUPa1t6ZNozCZfJqIMrkiH9rbPYNGkWk5s=;
        b=I0DlHA0tSccas17PKXyKwZppwOwGKkd4FyaCEh6uATdLio7y8kPQssT1SfcLkAFerW
         B0rShbTK6Y67kL6WeT3IKHNE3NLfyHApdSdXM3elb6r2x7V1Xtx5la7EefzWxk1R+afW
         IF1aMBqKp3nuep17Nc/MUHLnXADf3q8bXwe5LHb+S1EUHmRJeRFrFc/V+VTlrhfPsfl+
         sPW3prCHzlSXw3HQ53IM6vJW1kqv+2Z2LKhdd/3kMLMoSxdZYR+9IpyX66EhArrA76lH
         bCvTtM9PE+achDp3VlpZLgypR62V4OmBPYCg+O+BR74K/wbZrsIG71RSef4mmRh4WjT3
         3g8Q==
X-Gm-Message-State: AFqh2krv6LQlo5mT7qnoNyyJJvWNAkLakUFuI3FV5xLgI5KOoQQ7M5Qh
	Es6pm8exPhOtLkI60bu/TIF/JhP3rFU=
X-Google-Smtp-Source: AMrXdXuNDAOfXZDGcZNFwBw/lJ74Ra8huz0Wvr5fUOQOykudqLQuxmAsmqURjcYFG6tg0qfw6766mg==
X-Received: by 2002:a05:600c:1d12:b0:3da:ff82:f627 with SMTP id l18-20020a05600c1d1200b003daff82f627mr36162391wms.25.1674722276542;
        Thu, 26 Jan 2023 00:37:56 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id u32-20020a05600c4d2000b003db0659c454sm957721wmp.32.2023.01.26.00.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 00:37:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] gdk-pixbuf: remove ptest support
Date: Thu, 26 Jan 2023 09:37:51 +0100
Message-Id: <20230126083752.151940-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 08:38:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176386

Moving to x86-64-v3 instructions revealed that the recipe was doing an entirely
incorrect thing: running native gdk-pixbuf-query-loaders executable against the target set
of loader .so binaries. This worked, but only by coincidence, and no longer
works on build hosts that do not support v3 instructions.

Re-enabling installed tests in a cross compile scenario requires a complete
re-think (against the need to run gdk-pixbuf executables to produce the tests),
and is best done upstream, so sadly the cross-testing has to be dropped
for now.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../distro/include/ptest-packagelists.inc     |   1 -
 .../0001-Add-use_prebuilt_tools-option.patch  | 173 ------------------
 .../gdk-pixbuf/gdk-pixbuf_2.42.10.bb          |  30 +--
 3 files changed, 3 insertions(+), 201 deletions(-)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 48dec07577..32c341a9bc 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -20,7 +20,6 @@ PTESTS_FAST = "\
     flex-ptest \
     gawk-ptest \
     gdbm-ptest \
-    gdk-pixbuf-ptest \
     glib-networking-ptest \
     gzip-ptest \
     json-c-ptest \
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch
deleted file mode 100644
index 02cc9a2a70..0000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-From f81b60ebcbbfd9548c8aa1e388662c429068d1e3 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Sat, 8 May 2021 21:58:54 +0200
-Subject: [PATCH] Add use_prebuilt_tools option
-
-This allows using the gdk-pixbuf tools from the host to
-build and install tests in a cross-compile scenarion.
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/merge_requests/119]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- gdk-pixbuf/meson.build  | 11 +++++++++--
- meson.build             |  6 +++---
- meson_options.txt       |  4 ++++
- tests/meson.build       | 16 ++++++++--------
- thumbnailer/meson.build | 24 ++++++++++++++++++------
- 5 files changed, 42 insertions(+), 19 deletions(-)
-
-diff --git a/gdk-pixbuf/meson.build b/gdk-pixbuf/meson.build
-index 54ff9dd..2e321cf 100644
---- a/gdk-pixbuf/meson.build
-+++ b/gdk-pixbuf/meson.build
-@@ -342,13 +342,20 @@ foreach bin: gdkpixbuf_bin
-                    include_directories: [ root_inc, gdk_pixbuf_inc ],
-                    c_args: common_cflags + gdk_pixbuf_cflags,
-                    install: true)
--  meson.override_find_program(bin_name, bin)
-+  if not get_option('use_prebuilt_tools')
-+      meson.override_find_program(bin_name, bin)
-+  endif
- 
-   # Used in tests
-   set_variable(bin_name.underscorify(), bin)
- endforeach
- 
--if not meson.is_cross_build()
-+if get_option('use_prebuilt_tools')
-+    gdk_pixbuf_query_loaders = find_program('gdk-pixbuf-query-loaders', required: true)
-+    gdk_pixbuf_pixdata = find_program('gdk-pixbuf-pixdata', required: true)
-+endif
-+
-+if not meson.is_cross_build() or get_option('use_prebuilt_tools')
-   # The 'loaders.cache' used for testing, so we don't accidentally
-   # load the installed cache; we always build it by default
-   loaders_cache = custom_target('loaders.cache',
-diff --git a/meson.build b/meson.build
-index 813bd43..a93e6f7 100644
---- a/meson.build
-+++ b/meson.build
-@@ -369,18 +369,18 @@ subdir('gdk-pixbuf')
- # i18n
- subdir('po')
- 
--if not meson.is_cross_build()
-+if not meson.is_cross_build() or get_option('use_prebuilt_tools')
-   if get_option('tests')
-     subdir('tests')
-   endif
--  subdir('thumbnailer')
- endif
-+subdir('thumbnailer')
- 
- # Documentation
- build_docs = get_option('gtk_doc') or get_option('docs')
- subdir('docs')
- 
--if not meson.is_cross_build()
-+if not meson.is_cross_build() or get_option('use_prebuilt_tools')
-   meson.add_install_script('build-aux/post-install.py',
-     gdk_pixbuf_bindir,
-     gdk_pixbuf_libdir,
-diff --git a/meson_options.txt b/meson_options.txt
-index d198d99..1c899e9 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -53,4 +53,8 @@ option('gio_sniffing',
-        description: 'Perform file type detection using GIO (Unused on MacOS and Windows)',
-        type: 'boolean',
-        value: true)
-+option('use_prebuilt_tools',
-+       description: 'Use prebuilt gdk-pixbuf tools from the host for cross-compilation',
-+       type: 'boolean',
-+       value: false)
- 
-diff --git a/tests/meson.build b/tests/meson.build
-index 28c2525..d97c02d 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -5,6 +5,12 @@
- # $PATH. Ideally we should use gnome.compile_resources() and let Meson deal with
- # this problem: See https://github.com/mesonbuild/meson/issues/8266.
- if enabled_loaders.contains('png') and host_system != 'windows'
-+
-+  resources_deps = [loaders_cache,]
-+  if not get_option('use_prebuilt_tools')
-+    resources_deps += [gdk_pixbuf_pixdata,]
-+  endif
-+
-   # Resources; we cannot use gnome.compile_resources() here, because we need to
-   # override the environment in order to use the utilities we just built instead
-   # of the system ones
-@@ -21,10 +27,7 @@ if enabled_loaders.contains('png') and host_system != 'windows'
-       '@INPUT@',
-       '@OUTPUT@',
-     ],
--    depends: [
--      gdk_pixbuf_pixdata,
--      loaders_cache,
--    ],
-+    depends: resources_deps,
-   )
- 
-   resources_h = custom_target('resources.h',
-@@ -40,10 +43,7 @@ if enabled_loaders.contains('png') and host_system != 'windows'
-       '@INPUT@',
-       '@OUTPUT@',
-     ],
--    depends: [
--      gdk_pixbuf_pixdata,
--      loaders_cache,
--    ],
-+    depends: resources_deps,
-   )
-   no_resources = false
- else
-diff --git a/thumbnailer/meson.build b/thumbnailer/meson.build
-index b6a206d..9336c21 100644
---- a/thumbnailer/meson.build
-+++ b/thumbnailer/meson.build
-@@ -6,13 +6,29 @@ bin = executable('gdk-pixbuf-thumbnailer',
-            ],
-            dependencies: gdk_pixbuf_deps + [ gdkpixbuf_dep ],
-            install: true)
--meson.override_find_program('gdk-pixbuf-thumbnailer', bin)
-+if not get_option('use_prebuilt_tools')
-+    meson.override_find_program('gdk-pixbuf-thumbnailer', bin)
-+endif
- 
- gdk_pixbuf_print_mime_types = executable('gdk-pixbuf-print-mime-types',
-                                          'gdk-pixbuf-print-mime-types.c',
-+                                         install: true,
-                                          c_args: common_cflags,
-                                          dependencies: gdk_pixbuf_deps + [ gdkpixbuf_dep ])
- 
-+if get_option('use_prebuilt_tools')
-+    gdk_pixbuf_print_mime_types = find_program('gdk-pixbuf-print-mime-types', required: true)
-+endif
-+
-+thumbnailer_deps = [loaders_cache,]
-+
-+if not get_option('use_prebuilt_tools')
-+    thumbnailer_deps += [
-+        gdk_pixbuf_print_mime_types,
-+        gdk_pixbuf_pixdata,
-+    ]
-+endif
-+
- custom_target('thumbnailer',
-               input: 'gdk-pixbuf-thumbnailer.thumbnailer.in',
-               output: 'gdk-pixbuf-thumbnailer.thumbnailer',
-@@ -25,10 +41,6 @@ custom_target('thumbnailer',
-                 '@INPUT@',
-                 '@OUTPUT@',
-               ],
--              depends: [
--                gdk_pixbuf_print_mime_types,
--                gdk_pixbuf_pixdata,
--                loaders_cache,
--              ],
-+              depends: thumbnailer_deps,
-               install: true,
-               install_dir: join_paths(gdk_pixbuf_datadir, 'thumbnailers'))
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
index aa44515fbb..9f1114c7d0 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
@@ -12,20 +12,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SECTION = "libs"
 
-DEPENDS = "glib-2.0 gdk-pixbuf-native shared-mime-info"
+DEPENDS = "glib-2.0 shared-mime-info"
 DEPENDS:remove:class-native = "gdk-pixbuf-native"
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
-           file://run-ptest \
            file://fatal-loader.patch \
-           file://0001-Add-use_prebuilt_tools-option.patch \
            "
 
 SRC_URI[sha256sum] = "ee9b6c75d13ba096907a2e3c6b27b61bcd17f5c7ebeab5a5b439d2f2e39fe44b"
 
-inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package
+inherit meson pkgconfig gettext pixbufcache upstream-version-is-even gobject-introspection gi-docgen lib_package
 
 GIR_MESON_OPTION = 'introspection'
 GIR_MESON_ENABLE_FLAG = "enabled"
@@ -36,7 +34,7 @@ LIBV = "2.10.0"
 GDK_PIXBUF_LOADERS ?= "png jpeg"
 
 PACKAGECONFIG = "${GDK_PIXBUF_LOADERS} \
-                 ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
+                "
 PACKAGECONFIG:class-native = "${GDK_PIXBUF_LOADERS}"
 
 PACKAGECONFIG[png] = "-Dpng=enabled,-Dpng=disabled,libpng"
@@ -46,14 +44,6 @@ PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false"
 
 EXTRA_OEMESON = "-Dman=false"
 
-EXTRA_OEMESON:append:class-target = " \
-    -Duse_prebuilt_tools=true \
-"
-
-EXTRA_OEMESON:append:class-nativesdk = " \
-    -Duse_prebuilt_tools=true \
-"
-
 PACKAGES =+ "${PN}-xlib"
 
 # For GIO image type sniffing
@@ -85,9 +75,6 @@ python populate_packages:prepend () {
     packages = ' '.join(do_split_packages(d, loaders_root, r'^libpixbufloader-(.*)\.so$', 'gdk-pixbuf-loader-%s', 'GDK pixbuf loader for %s'))
     d.setVar('PIXBUF_PACKAGES', packages)
 
-    # The test suite exercises all the loaders, so ensure they are all
-    # dependencies of the ptest package.
-    d.appendVar("RDEPENDS:%s-ptest" % d.getVar('PN'), " " + packages)
 }
 
 do_install:append() {
@@ -97,13 +84,6 @@ do_install:append() {
 
 }
 
-do_install_ptest() {
-        # Remove a bad fuzzing attempt that sporadically fails without a way to reproduce
-	rm ${D}/${datadir}/installed-tests/gdk-pixbuf/pixbuf-randomly-modified.test
-        # https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/issues/215
-	rm ${D}/${datadir}/installed-tests/gdk-pixbuf/pixbuf-jpeg.test
-}
-
 do_install:append:class-native() {
 	find ${D}${libdir} -name "libpixbufloader-*.la" -exec rm \{\} \;
 
@@ -115,10 +95,6 @@ do_install:append:class-native() {
 		XDG_DATA_DIRS=${STAGING_DATADIR} \
 		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
 
-	create_wrapper ${D}/${bindir}/gdk-pixbuf-print-mime-types \
-		XDG_DATA_DIRS=${STAGING_DATADIR} \
-		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
-
 	create_wrapper ${D}/${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
 		XDG_DATA_DIRS=${STAGING_DATADIR} \
 		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache \
-- 
2.30.2


