Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.175.1620939402061457824
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 13:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lBXAA5Ew;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id di13so32453479edb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 13:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e6xpOs4dgdA5WX9R/4SqoRGGUppVrmzPUT+mm46EI8o=;
        b=lBXAA5EwcKDJA0dy5r6o7zLpStxmuGpZ2Z01XZ/REwAcMOnVOdRZlFz3bn7GzdTAQB
         duxNV7Z1TC0VSwcpnrUZETY4G+lw7ZRwGrHTLleFdKmU5KyC+TSqn6aKXSC3pW+X+kVH
         Ki6RMtUrEa1jHlTbKR9q6I9PRVX5WOW6frhtbQDHqqPyf7SSCQu5luKY2xkztHQAiU9K
         wFOKQX7rZ0g3SPEHvtEo2ep3X61eFOdoUu9hzW+XwmAbzHQw91gTTJe8hwVsytxjxmyP
         g4NAjN53BzVezFU8Z9FK8Ox0sG6zcI8gUTxiVCIdfd9gPr8cT0vQD76uCranUXgCXFE9
         sLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e6xpOs4dgdA5WX9R/4SqoRGGUppVrmzPUT+mm46EI8o=;
        b=tB0EOniTF+60TD2DhrqF/DJC4TL6yW63XlftXezdSQi2jo5zJgypi0KJzT34r35EXG
         +aWXcy24cw/RkhOImr0ckCtdbiqU2iyzFQJ7u8uKDQsXAEDMAUUa7CkFiaW0ZPSNI662
         Rc5S4THUBXlhnG2/a8w9BbyAnfDWPrX9QnHSIXGBAAxyrY4Xpuhzby6d97dvhzispmLi
         czwLLRBYodBtxL6QCwQ7uxwFLMq9gDdcHgutnqjExVUAdCjI+5P0YoPjUNV1oPMy5oLq
         yLacy1jDi5lZbWSE4wq5KtSvU5nlH6jzoQlcakwlJ+r9lI4MX+71KBN1HRE94J5C8OV5
         a5rA==
X-Gm-Message-State: AOAM530Eijk8tOM0RXn7sCYaWWXUj3x+fbL0DRwNMoVwhMTwRB5I6XNp
	ZOm0zfq4W9BRBwSAx7vXZVju67bSgts=
X-Google-Smtp-Source: ABdhPJwedCFa/F0cvbl+BVeORm+zHWxN9c2psVpuEPZxjUXIbF/6vkduTFlGylmFMsbf6kbO0HwSCw==
X-Received: by 2002:a05:6402:1c0b:: with SMTP id ck11mr52407455edb.264.1620939400512;
        Thu, 13 May 2021 13:56:40 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm2934768edd.91.2021.05.13.13.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 13:56:39 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/8] gdk-pixbuf: rewrite the cross-build support for tests
Date: Thu, 13 May 2021 22:56:15 +0200
Message-Id: <20210513205622.60879-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was scattered over four different patches, and wasn't guarded
by a configuration option. Hopefully the new patch is acceptable
to upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-Add-use_prebuilt_tools-option.patch  | 171 ++++++++++++++++++
 ...f-decisions-around-cross-compilation.patch |  38 ----
 ...bnailer-and-pixdata-cross-compile-fa.patch |  95 ----------
 ...nd-thumbnailer-cross-compile-failure.patch |  28 ---
 ...ailer-and-tests-also-in-cross-builds.patch |  29 ---
 .../gdk-pixbuf/gdk-pixbuf_2.42.6.bb           |   9 +-
 6 files changed, 176 insertions(+), 194 deletions(-)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-a-couple-of-decisions-around-cross-compilation.patch
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-and-pixdata-cross-compile-fa.patch
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-cross-compile-failure.patch
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch
new file mode 100644
index 0000000000..dc8d6ce724
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch
@@ -0,0 +1,171 @@
+From ba73bb0f3d2023839bc3b681c49b7ec1192cceb4 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Sat, 8 May 2021 21:58:54 +0200
+Subject: [PATCH] Add use_prebuilt_tools option
+
+This allows using the gdk-pixbuf tools from the host to
+build and install tests in a cross-compile scenarion.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ gdk-pixbuf/meson.build  | 11 +++++++++--
+ meson.build             |  6 +++---
+ meson_options.txt       |  4 ++++
+ tests/meson.build       | 16 ++++++++--------
+ thumbnailer/meson.build | 24 ++++++++++++++++++------
+ 5 files changed, 42 insertions(+), 19 deletions(-)
+
+diff --git a/gdk-pixbuf/meson.build b/gdk-pixbuf/meson.build
+index 8b0590b..7331491 100644
+--- a/gdk-pixbuf/meson.build
++++ b/gdk-pixbuf/meson.build
+@@ -342,13 +342,20 @@ foreach bin: gdkpixbuf_bin
+                    include_directories: [ root_inc, gdk_pixbuf_inc ],
+                    c_args: common_cflags + gdk_pixbuf_cflags,
+                    install: true)
+-  meson.override_find_program(bin_name, bin)
++  if not get_option('use_prebuilt_tools')
++      meson.override_find_program(bin_name, bin)
++  endif
+ 
+   # Used in tests
+   set_variable(bin_name.underscorify(), bin)
+ endforeach
+ 
+-if not meson.is_cross_build()
++if get_option('use_prebuilt_tools')
++    gdk_pixbuf_query_loaders = find_program('gdk-pixbuf-query-loaders', required: true)
++    gdk_pixbuf_pixdata = find_program('gdk-pixbuf-pixdata', required: true)
++endif
++
++if not meson.is_cross_build() or get_option('use_prebuilt_tools')
+   # The 'loaders.cache' used for testing, so we don't accidentally
+   # load the installed cache; we always build it by default
+   loaders_cache = custom_target('loaders.cache',
+diff --git a/meson.build b/meson.build
+index 7a1409b..0bc73eb 100644
+--- a/meson.build
++++ b/meson.build
+@@ -403,16 +403,16 @@ subdir('gdk-pixbuf')
+ # i18n
+ subdir('po')
+ 
+-if not meson.is_cross_build()
++if not meson.is_cross_build() or get_option('use_prebuilt_tools')
+   subdir('tests')
+-  subdir('thumbnailer')
+ endif
++subdir('thumbnailer')
+ 
+ # Documentation
+ build_docs = get_option('gtk_doc') or get_option('docs')
+ subdir('docs')
+ 
+-if not meson.is_cross_build()
++if not meson.is_cross_build() or get_option('use_prebuilt_tools')
+   meson.add_install_script('build-aux/post-install.py',
+     gdk_pixbuf_bindir,
+     gdk_pixbuf_libdir,
+diff --git a/meson_options.txt b/meson_options.txt
+index 0ee6718..cc29855 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -49,4 +49,8 @@ option('gio_sniffing',
+        description: 'Perform file type detection using GIO (Unused on MacOS and Windows)',
+        type: 'boolean',
+        value: true)
++option('use_prebuilt_tools',
++       description: 'Use prebuilt gdk-pixbuf tools from the host for cross-compilation',
++       type: 'boolean',
++       value: false)
+ 
+diff --git a/tests/meson.build b/tests/meson.build
+index 7c6cb11..1029e6a 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -5,6 +5,12 @@
+ # $PATH. Ideally we should use gnome.compile_resources() and let Meson deal with
+ # this problem: See https://github.com/mesonbuild/meson/issues/8266.
+ if enabled_loaders.contains('png') and host_system != 'windows'
++
++  resources_deps = [loaders_cache,]
++  if not get_option('use_prebuilt_tools')
++    resources_deps += [gdk_pixbuf_pixdata,]
++  endif
++
+   # Resources; we cannot use gnome.compile_resources() here, because we need to
+   # override the environment in order to use the utilities we just built instead
+   # of the system ones
+@@ -21,10 +27,7 @@ if enabled_loaders.contains('png') and host_system != 'windows'
+       '@INPUT@',
+       '@OUTPUT@',
+     ],
+-    depends: [
+-      gdk_pixbuf_pixdata,
+-      loaders_cache,
+-    ],
++    depends: resources_deps,
+   )
+ 
+   resources_h = custom_target('resources.h',
+@@ -40,10 +43,7 @@ if enabled_loaders.contains('png') and host_system != 'windows'
+       '@INPUT@',
+       '@OUTPUT@',
+     ],
+-    depends: [
+-      gdk_pixbuf_pixdata,
+-      loaders_cache,
+-    ],
++    depends: resources_deps,
+   )
+   no_resources = false
+ else
+diff --git a/thumbnailer/meson.build b/thumbnailer/meson.build
+index b6a206d..9336c21 100644
+--- a/thumbnailer/meson.build
++++ b/thumbnailer/meson.build
+@@ -6,13 +6,29 @@ bin = executable('gdk-pixbuf-thumbnailer',
+            ],
+            dependencies: gdk_pixbuf_deps + [ gdkpixbuf_dep ],
+            install: true)
+-meson.override_find_program('gdk-pixbuf-thumbnailer', bin)
++if not get_option('use_prebuilt_tools')
++    meson.override_find_program('gdk-pixbuf-thumbnailer', bin)
++endif
+ 
+ gdk_pixbuf_print_mime_types = executable('gdk-pixbuf-print-mime-types',
+                                          'gdk-pixbuf-print-mime-types.c',
++                                         install: true,
+                                          c_args: common_cflags,
+                                          dependencies: gdk_pixbuf_deps + [ gdkpixbuf_dep ])
+ 
++if get_option('use_prebuilt_tools')
++    gdk_pixbuf_print_mime_types = find_program('gdk-pixbuf-print-mime-types', required: true)
++endif
++
++thumbnailer_deps = [loaders_cache,]
++
++if not get_option('use_prebuilt_tools')
++    thumbnailer_deps += [
++        gdk_pixbuf_print_mime_types,
++        gdk_pixbuf_pixdata,
++    ]
++endif
++
+ custom_target('thumbnailer',
+               input: 'gdk-pixbuf-thumbnailer.thumbnailer.in',
+               output: 'gdk-pixbuf-thumbnailer.thumbnailer',
+@@ -25,10 +41,6 @@ custom_target('thumbnailer',
+                 '@INPUT@',
+                 '@OUTPUT@',
+               ],
+-              depends: [
+-                gdk_pixbuf_print_mime_types,
+-                gdk_pixbuf_pixdata,
+-                loaders_cache,
+-              ],
++              depends: thumbnailer_deps,
+               install: true,
+               install_dir: join_paths(gdk_pixbuf_datadir, 'thumbnailers'))
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-a-couple-of-decisions-around-cross-compilation.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-a-couple-of-decisions-around-cross-compilation.patch
deleted file mode 100644
index e461404918..0000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-a-couple-of-decisions-around-cross-compilation.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From be8a47e0c21e5577d4f5669d339dfec6299b25be Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 14 Feb 2019 18:06:25 +0100
-Subject: [PATCH] Generate loaders.cache using a native tool when
- cross-compiling
-
-Otherwise meson would attempt to run a target binary.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- gdk-pixbuf/meson.build | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/gdk-pixbuf/meson.build b/gdk-pixbuf/meson.build
-index 5cddbec..78c8bd3 100644
---- a/gdk-pixbuf/meson.build
-+++ b/gdk-pixbuf/meson.build
-@@ -324,8 +324,16 @@ if not meson.is_cross_build()
-                                 build_by_default: true)
-   loaders_dep = declare_dependency(sources: [ loaders_cache ])
- else
--  loaders_cache = []
--  loaders_dep = declare_dependency()
-+  loaders_cache = custom_target('loaders.cache',
-+                                output: 'loaders.cache',
-+                                capture: true,
-+                                command: [
-+                                  'gdk-pixbuf-query-loaders',
-+                                  dynamic_loaders,
-+                                ],
-+                                depends: dynamic_loaders_dep,
-+                                build_by_default: true)
-+  loaders_dep = declare_dependency(sources: [ loaders_cache ])
- endif
- 
- pkgconfig = import('pkgconfig')
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-and-pixdata-cross-compile-fa.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-and-pixdata-cross-compile-fa.patch
deleted file mode 100644
index 2aa9164750..0000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-and-pixdata-cross-compile-fa.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From dcaf3106e2cca27f728a8bd26127430500a1136e Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 22 Feb 2019 13:22:06 +0100
-Subject: [PATCH] Work-around thumbnailer and pixdata cross-compile failure
-
-Use native gdk-pixbuf-print-mime-types and gdk-pixbuf-pixdata
-when generating the thumbnail metadata and resources.
-
-This works but the mime types will come from native
-loader.cache (which will only contain in-tree loaders), not from the
-target loader.cache.
-
-The upstream issue is https://bugzilla.gnome.org/show_bug.cgi?id=779057
-
-Upstream-Status: Inappropriate [workaround]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- tests/meson.build       | 11 +++++++++--
- thumbnailer/meson.build | 23 ++++++++++++++++++++++-
- 2 files changed, 31 insertions(+), 3 deletions(-)
-
-diff --git a/tests/meson.build b/tests/meson.build
-index 7c6cb11..07121f1 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -8,13 +8,20 @@ if enabled_loaders.contains('png') and host_system != 'windows'
-   # Resources; we cannot use gnome.compile_resources() here, because we need to
-   # override the environment in order to use the utilities we just built instead
-   # of the system ones
-+
-+  if not meson.is_cross_build()
-+  pixdata_binary = gdk_pixbuf_pixdata.full_path()
-+  else
-+  pixdata_binary = 'gdk-pixbuf-pixdata'
-+  endif
-+
-   resources_c = custom_target('resources.c',
-     input: 'resources.gresource.xml',
-     output: 'resources.c',
-     command: [
-       gen_resources,
-       '--glib-compile-resources=@0@'.format(glib_compile_resources.full_path()),
--      '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
-+      '--pixdata=@0@'.format(pixdata_binary),
-       '--loaders=@0@'.format(loaders_cache.full_path()),
-       '--sourcedir=@0@'.format(meson.current_source_dir()),
-       '--source',
-@@ -33,7 +40,7 @@ if enabled_loaders.contains('png') and host_system != 'windows'
-     command: [
-       gen_resources,
-       '--glib-compile-resources=@0@'.format(glib_compile_resources.full_path()),
--      '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
-+      '--pixdata=@0@'.format(pixdata_binary),
-       '--loaders=@0@'.format(loaders_cache.full_path()),
-       '--sourcedir=@0@'.format(meson.current_source_dir()),
-       '--header',
-diff --git a/thumbnailer/meson.build b/thumbnailer/meson.build
-index 8c741e0..5a3b52a 100644
---- a/thumbnailer/meson.build
-+++ b/thumbnailer/meson.build
-@@ -14,7 +14,27 @@ gdk_pixbuf_print_mime_types = executable('gdk-pixbuf-print-mime-types',
-                                          install: true,
-                                          dependencies: gdk_pixbuf_deps + [ gdkpixbuf_dep ])
- 
--custom_target('thumbnailer',
-+if meson.is_cross_build()
-+    custom_target('thumbnailer',
-+              input: 'gdk-pixbuf-thumbnailer.thumbnailer.in',
-+              output: 'gdk-pixbuf-thumbnailer.thumbnailer',
-+              command: [
-+                gen_thumbnailer,
-+                '--printer=gdk-pixbuf-print-mime-types',
-+                '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
-+                '--loaders=@0@'.format(loaders_cache.full_path()),
-+                '--bindir=@0@'.format(gdk_pixbuf_bindir),
-+                '@INPUT@',
-+                '@OUTPUT@',
-+              ],
-+              depends: [
-+                gdk_pixbuf_print_mime_types,
-+                gdk_pixbuf_pixdata,
-+              ],
-+              install: true,
-+              install_dir: join_paths(gdk_pixbuf_datadir, 'thumbnailers'))
-+else
-+    custom_target('thumbnailer',
-               input: 'gdk-pixbuf-thumbnailer.thumbnailer.in',
-               output: 'gdk-pixbuf-thumbnailer.thumbnailer',
-               command: [
-@@ -33,3 +53,4 @@ custom_target('thumbnailer',
-               ],
-               install: true,
-               install_dir: join_paths(gdk_pixbuf_datadir, 'thumbnailers'))
-+endif
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-cross-compile-failure.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-cross-compile-failure.patch
deleted file mode 100644
index 110b32a490..0000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-cross-compile-failure.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 8c7ced988def52654946458a3779e383b27f14f7 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 14 Feb 2019 17:56:10 +0100
-Subject: [PATCH] Work-around thumbnailer cross-compile failure
-
-Install gdk-pixbuf-print-mime-types that's needed for thumbnail
-metadata generation.
-
-The upstream issue is https://bugzilla.gnome.org/show_bug.cgi?id=779057
-
-Upstream-Status: Inappropriate [workaround]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- thumbnailer/meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/thumbnailer/meson.build b/thumbnailer/meson.build
-index e801144..aaafec8 100644
---- a/thumbnailer/meson.build
-+++ b/thumbnailer/meson.build
-@@ -10,6 +10,7 @@ executable('gdk-pixbuf-thumbnailer',
- gdk_pixbuf_print_mime_types = executable('gdk-pixbuf-print-mime-types',
-                                          'gdk-pixbuf-print-mime-types.c',
-                                          c_args: common_cflags,
-+                                         install: true,
-                                          dependencies: gdk_pixbuf_deps + [ gdkpixbuf_dep ])
- 
- custom_target('thumbnailer',
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch
deleted file mode 100644
index cd9f88befc..0000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From d02a8e202d2fe5caf3449683e0ccdf84a482a325 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 5 Jun 2019 14:17:55 +0200
-Subject: [PATCH] Build thumbnailer and tests also in cross builds.
-
-Upstream-Status: Inappropriate [relies on oe-core specific hacks]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- meson.build | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 73034d1..d114016 100644
---- a/meson.build
-+++ b/meson.build
-@@ -378,10 +378,8 @@ subdir('gdk-pixbuf')
- # i18n
- subdir('po')
- 
--if not meson.is_cross_build()
--  subdir('tests')
--  subdir('thumbnailer')
--endif
-+subdir('tests')
-+subdir('thumbnailer')
- 
- # Documentation
- build_docs = get_option('gtk_doc') or get_option('docs')
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
index e28423efd9..f171464f4d 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
@@ -20,10 +20,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://fatal-loader.patch \
-           file://0001-Work-around-thumbnailer-cross-compile-failure.patch \
-           file://0001-Fix-a-couple-of-decisions-around-cross-compilation.patch \
-           file://0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch \
-           file://0001-Work-around-thumbnailer-and-pixdata-cross-compile-fa.patch \
+           file://0001-Add-use_prebuilt_tools-option.patch \
            "
 
 SRC_URI[sha256sum] = "c4a6b75b7ed8f58ca48da830b9fa00ed96d668d3ab4b1f723dcf902f78bde77f"
@@ -47,6 +44,10 @@ PACKAGECONFIG[jpeg] = "-Djpeg=true,-Djpeg=false,jpeg"
 PACKAGECONFIG[tiff] = "-Dtiff=true,-Dtiff=false,tiff"
 PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false"
 
+EXTRA_OEMESON_class-target = " \
+    -Duse_prebuilt_tools=true \
+"
+
 PACKAGES =+ "${PN}-xlib"
 
 # For GIO image type sniffing
-- 
2.31.1

