Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 401BF6C118
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 14:55:52 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id p86so21541773lfg.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 06:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AJuJSLnNg/exwvsSuN3A8U6DVvO9UjG79DMjDckUD6o=;
	b=rArqRs0AbIJ1t5Tm7rqgu0A1pBQdS7/VqPWwPj/ZZLqo92MYMo90qy+nh/yFrpHPRr
	+sEh3LK3JfIEtVBP8BHGtFTUdHCUp/Q2waGYAnVRoOKNrRgWiGQa4ZgG41MFfZpPAno7
	Lq3IIZ7T9NHiC8cux4a9CuEQIt9iLnon9z5dBYDxajXGDYbATSOeQ7bg9c6hXu4hLOlE
	GRrRnmIE7gEplWT3orkfRCZn9lCQQWesRUA9JQfExSJP9xjJgTaG1VdrP79G+entAIoM
	2uOpJL02fs5qCkY5aFCtYZSYwldh+pzUp+hrUVGA1C0jLyev5OTESepYJ4gW+qRz6nRC
	8gUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AJuJSLnNg/exwvsSuN3A8U6DVvO9UjG79DMjDckUD6o=;
	b=H9ETiwE/yX93Eja7djq0JRyw3CrCOGPRdpCv8RfIgR3bGDxhqyuMmN+qKFNtzSEAxf
	0MChDtz9qJ8GhvkzeDSmPQX8MtnguQjN92xd8po3ui1IFwz/IHE1YTzrB6szwufsDAb3
	DC98X+je9f+PuKbJoX0k1Nn1JDLn8zTFkgqWgL3RzmgOhz24oB/cJuZXogHg6zKGdg9b
	u1oi17400TdSYOFU5aY1Kdn7rRKvLXD3l3mNnF6klBJLb6LKfLgsce8rlBJ2cVVhdxR5
	DFYvv1PMuaQqCffB4R8v0Oashi1w3YsHsKkcA2R92x0w9DDdhpvXFEOQ/XNInfMxN0Xx
	aBGQ==
X-Gm-Message-State: AGRZ1gLZ0MDzUY34iKcmcM8T+m//UJwfGlqNJxqI37t4NpvOe6Cwbw1T
	73ee3k5IYqObQYBccRjc2I0oaPG7
X-Google-Smtp-Source: AJdET5cLnwXCypk3fohgpXhVb0QrgMUZ425WE3MYxVy9FAdxn9wWoQUoi8WAso9yYJflHJrOlyMzhQ==
X-Received: by 2002:a19:c70a:: with SMTP id x10mr10660009lff.88.1542639352375; 
	Mon, 19 Nov 2018 06:55:52 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id n16sm988393lfl.35.2018.11.19.06.55.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Nov 2018 06:55:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2018 15:55:42 +0100
Message-Id: <20181119145542.69051-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181119145542.69051-1-alex.kanavin@gmail.com>
References: <20181119145542.69051-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/2] gobject-introspection: port cross-compilation support to meson
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
X-List-Received-Date: Mon, 19 Nov 2018 14:55:52 -0000

Also add a missing libdl dependency to the native relocation patch,
which was not necessary with autotools.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...t-cross-compilation-support-to-meson.patch | 159 ++++++++++++++++++
 ...pository-directory-for-native-builds.patch |  18 +-
 .../gobject-introspection_1.58.0.bb           |  19 ++-
 3 files changed, 185 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch
new file mode 100644
index 00000000000..b0eee1ebe5b
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch
@@ -0,0 +1,159 @@
+From e8ce42c5cb54847517fe8fbe50bbaea452618218 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 15 Nov 2018 15:10:05 +0100
+Subject: [PATCH] Port cross-compilation support to meson
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gir/meson.build   | 59 ++++++++++++++++++++++++++++++++++-------------
+ meson.build       |  4 +++-
+ meson_options.txt | 20 ++++++++++++++++
+ 3 files changed, 66 insertions(+), 17 deletions(-)
+
+diff --git a/gir/meson.build b/gir/meson.build
+index 607bbc4..c0e221b 100644
+--- a/gir/meson.build
++++ b/gir/meson.build
+@@ -37,15 +37,27 @@ typelibdir = join_paths(get_option('libdir'), 'girepository-1.0')
+ girdir = join_paths(get_option('datadir'), 'gir-1.0')
+ install_data(gir_files, install_dir: girdir)
+ 
+-scanner_command = [
+-  python,
+-  girscanner,
+-  '--output=@OUTPUT@',
+-  '--no-libtool',
+-  '--reparse-validate',
+-  '--add-include-path', join_paths(meson.current_build_dir()),
+-  '--add-include-path', join_paths(meson.current_source_dir()),
+-]
++if get_option('enable-host-gi')
++    scanner_command = [
++      'g-ir-scanner',
++      '--output=@OUTPUT@',
++      '--no-libtool',
++      '--reparse-validate',
++      '--add-include-path', join_paths(meson.current_build_dir()),
++      '--add-include-path', join_paths(meson.current_source_dir()),
++    ]
++else
++    scanner_command = [
++      python,
++      girscanner,
++      '--output=@OUTPUT@',
++      '--no-libtool',
++      '--reparse-validate',
++      '--add-include-path', join_paths(meson.current_build_dir()),
++      '--add-include-path', join_paths(meson.current_source_dir()),
++    ]
++endif
++
+ 
+ dep_type = glib_dep.type_name()
+ if dep_type == 'internal'
+@@ -58,6 +70,12 @@ if dep_type == 'internal'
+                       '--extra-library=glib-2.0', '--extra-library=gobject-2.0']
+ endif
+ 
++if get_option('enable-gi-cross-wrapper') != ''
++  scanner_command += ['--use-binary-wrapper=' + get_option('enable-gi-cross-wrapper')]
++endif
++if get_option('enable-gi-ldd-wrapper') != ''
++  scanner_command += ['--use-ldd-wrapper=' + get_option('enable-gi-ldd-wrapper')]
++endif
+ # Take a glob and print to newlines
+ globber = '''
+ from glob import glob
+@@ -84,8 +102,8 @@ glib_command = scanner_command + [
+ 
+ if dep_type == 'pkgconfig'
+   glib_command += ['--external-library', '--pkg=glib-2.0']
+-  glib_libdir = glib_dep.get_pkgconfig_variable('libdir')
+-  glib_incdir = join_paths(glib_dep.get_pkgconfig_variable('includedir'), 'glib-2.0')
++  glib_libdir = get_option('pkgconfig-sysroot-path') + glib_dep.get_pkgconfig_variable('libdir')
++  glib_incdir = get_option('pkgconfig-sysroot-path') + join_paths(glib_dep.get_pkgconfig_variable('includedir'), 'glib-2.0')
+   glib_libincdir = join_paths(glib_libdir, 'glib-2.0', 'include')
+   glib_files += join_paths(glib_incdir, 'gobject', 'glib-types.h')
+   glib_files += join_paths(glib_libincdir, 'glibconfig.h')
+@@ -339,7 +357,7 @@ endforeach
+ if giounix_dep.found()
+   if dep_type == 'pkgconfig'
+     gio_command += ['--pkg=gio-unix-2.0']
+-    giounix_includedir = join_paths(giounix_dep.get_pkgconfig_variable('includedir'), 'gio-unix-2.0')
++    giounix_includedir = get_option('pkgconfig-sysroot-path') + join_paths(giounix_dep.get_pkgconfig_variable('includedir'), 'gio-unix-2.0')
+     # Get the installed gio-unix header list
+     ret = run_command(python, '-c', globber.format(join_paths(giounix_includedir, 'gio', '*.h')))
+     if ret.returncode() != 0
+@@ -417,15 +435,24 @@ gir_files += custom_target('gir-girepository',
+   ]
+ )
+ 
++if get_option('enable-gi-cross-wrapper') != ''
++    gircompiler_command = [get_option('enable-gi-cross-wrapper'), gircompiler.full_path(), '-o', '@OUTPUT@', '@INPUT@',
++              '--includedir', meson.current_build_dir(),
++              '--includedir', meson.current_source_dir(),
++    ]
++else
++    gircompiler_command = [gircompiler, '-o', '@OUTPUT@', '@INPUT@',
++              '--includedir', meson.current_build_dir(),
++              '--includedir', meson.current_source_dir(),
++    ]
++endif
++
+ foreach gir : gir_files
+   custom_target('generate-typelib-@0@'.format(gir).underscorify(),
+     input: gir,
+     output: '@BASENAME@.typelib',
+     depends: [gobject_gir, ],
+-    command: [gircompiler, '-o', '@OUTPUT@', '@INPUT@',
+-              '--includedir', meson.current_build_dir(),
+-              '--includedir', meson.current_source_dir(),
+-    ],
++    command: gircompiler_command,
+     install: true,
+     install_dir: typelibdir,
+   )
+diff --git a/meson.build b/meson.build
+index 7ec9532..9e20da5 100644
+--- a/meson.build
++++ b/meson.build
+@@ -76,7 +76,9 @@ libffi_dep = dependency('libffi',
+ subdir('girepository')
+ subdir('tools')
+ subdir('giscanner')
+-subdir('gir')
++if get_option('enable-introspection-data') == true
++    subdir('gir')
++endif
+ subdir('examples')
+ subdir('docs')
+ subdir('tests')
+diff --git a/meson_options.txt b/meson_options.txt
+index 49726be..3e17c78 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -21,3 +21,23 @@ option('cairo-libname', type: 'string',
+ option('python', type: 'string', value: 'python3',
+   description: 'Path or name of the Python interpreter to build for'
+ )
++
++option('enable-host-gi', type: 'boolean', value : false,
++  description: 'Use gobject introspection tools installed in the host system (useful when cross-compiling)'
++)
++
++option('enable-gi-cross-wrapper', type: 'string',
++  description: 'Use a wrapper to run gicompiler and binaries produced by giscanner (useful when cross-compiling)'
++)
++
++option('enable-gi-ldd-wrapper', type: 'string',
++  description: 'Use a ldd wrapper instead of system ldd command in giscanner (useful when cross-compiling)'
++)
++
++option('enable-introspection-data', type: 'boolean', value : false,
++  description: 'Build introspection data (.gir and .typelib files) in addition to library and tools'
++)
++
++option('pkgconfig-sysroot-path', type: 'string',
++  description: 'Specify a sysroot path to prepend to pkgconfig output (useful when cross-compiling)'
++)
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
index ba85c317f61..b9754a96c22 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -1,4 +1,4 @@
-From 4cf37d56fddcc22bcd818f6d470404f56d907f3c Mon Sep 17 00:00:00 2001
+From 2e2bf063ab79ddff1c284834aef8e22710db9350 Mon Sep 17 00:00:00 2001
 From: Sascha Silbe <x-yo17@se-silbe.de>
 Date: Fri, 8 Jun 2018 13:55:10 +0200
 Subject: [PATCH] Relocate the repository directory for native builds
@@ -17,7 +17,8 @@ Signed-off-by: Sascha Silbe <x-yo17@se-silbe.de>
 
 ---
  girepository/girepository.c | 15 +++++++++++++--
- 1 file changed, 13 insertions(+), 2 deletions(-)
+ girepository/meson.build    |  2 +-
+ 2 files changed, 14 insertions(+), 3 deletions(-)
 
 diff --git a/girepository/girepository.c b/girepository/girepository.c
 index c1fa3d3..efa557e 100644
@@ -60,3 +61,16 @@ index c1fa3d3..efa557e 100644
  
        typelib_search_path = g_slist_prepend (typelib_search_path, typelib_dir);
  
+diff --git a/girepository/meson.build b/girepository/meson.build
+index 6a8c5b5..8892f2a 100644
+--- a/girepository/meson.build
++++ b/girepository/meson.build
+@@ -27,7 +27,7 @@ girepo_internals_lib = static_library('girepository-internals',
+   ],
+   c_args: gi_hidden_visibility_cflags,
+   include_directories : configinc,
+-  dependencies: [girepo_gthash_dep, libffi_dep],
++  dependencies: [girepo_gthash_dep, libffi_dep, cc.find_library('dl')],
+ )
+ 
+ girepo_internals_dep = declare_dependency(
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb
index 55ca87ddaaa..c9a0d816f5e 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-$
            file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch \
            file://0001-configure.ac-make-GIR_DIR-configurable.patch \
            file://0002-g-ir-tools-respect-gir_dir_prefix.patch \
+           file://0001-Port-cross-compilation-support-to-meson.patch \
            "
 
 SRC_URI[md5sum] = "94fec875276262037bfcd51226db12fe"
@@ -26,7 +27,7 @@ SRC_URI[sha256sum] = "27c1590a32749de0a5481ce897772547043e94bccba4bc0a7edb3d8513
 
 SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even multilib_script
+inherit meson pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even multilib_script
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/g-ir-annotation-tool ${PN}:${bindir}/g-ir-scanner"
 
@@ -44,17 +45,17 @@ export STAGING_DIR_HOST
 export B
 
 PACKAGECONFIG ?= ""
-PACKAGECONFIG[doctool] = "--enable-doctool,--disable-doctool,python3-mako,"
+PACKAGECONFIG[doctool] = "-Ddoctool=true,-Ddoctool=false,python3-mako,"
 
 # Configure target build to use native tools of itself and to use a qemu wrapper
 # and optionally to generate introspection data
-EXTRA_OECONF_class-target = " \
-    --disable-static \
-    --enable-host-gi \
-    --enable-gi-cross-wrapper=${B}/g-ir-scanner-qemuwrapper \
-    --enable-gi-ldd-wrapper=${B}/g-ir-scanner-lddwrapper \
-    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection-data', '--disable-introspection-data', d)} \
-    ${@'--with-gir-dir-prefix=${libdir}' if d.getVar('MULTILIBS') else ''} \
+EXTRA_OEMESON_class-target = " \
+    -Denable-host-gi=true \
+    -Denable-gi-cross-wrapper=${B}/g-ir-scanner-qemuwrapper \
+    -Denable-gi-ldd-wrapper=${B}/g-ir-scanner-lddwrapper \
+    -Dpkgconfig-sysroot-path=${PKG_CONFIG_SYSROOT_DIR} \
+    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Denable-introspection-data=true', '-Denable-introspection-data=false', d)} \
+    ${@'-Dgir-dir-prefix=${libdir}' if d.getVar('MULTILIBS') else ''} \
 "
 
 # Need to ensure ld.so.conf exists so prelink-native works
-- 
2.17.1


