Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id BA7367D8D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 10:55:03 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j9so21303794wrn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WQrid5RZ0gQegsAMNljbtfAS3e4aMCka2Dn+Fgzj3KY=;
	b=l4BaJpcTUT87hzMboGPKyH9ek9XHxCMtv22OzDric8cRQbKZYE3xm/itS9rxdGkayT
	uKbq3OrmXSDoUz6UXGA7jk2ai04pG5Sjw2q08BZfuo5r2nIgH19V6FrrayspI0nnTahW
	46XIwEzieKI1uqOTJgJhswybwTBd40flcRrhErWN3LbXT9jjvGZk9+8qHJqNYO+Olylc
	zM3IQVvlYDJ3sgDRz8guK+/yLEjGqtqZMsrtBvm+joOLJ+kRFpmRzMdQRtzyaOzIokxG
	5NogpVYjJrBYx/nSXvodR4CNLDl+tF/CrvKPFnxKgKeoBKPZcEQyPq5yeHYGuqCWG/+j
	FahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WQrid5RZ0gQegsAMNljbtfAS3e4aMCka2Dn+Fgzj3KY=;
	b=ajLkMA9FJBmzrYO5N9WrAKiLCcZReSU+2I+WXiQ4i7BqDbQ9Xn1tPUO7isIQkIjIoW
	CxIEFA52ruTzN3fsfMVU8Mxao80nObtHS151M/jQRqyRZgG3ATsoI2TopLyMeaQW5Fr6
	g/mSzxOYx7RpB9ATDM9r3JIYfG7gFSlWiA1r4CpBTzFbTailsOXJ8U+LxrPLvinVbAYZ
	kLTFbzAZc2Z9CwB0daKzzOx9RlqU4nKtGJqu4/QThqLo+8vSKP/ATfsCZ6JwlDi0gvvC
	KRwVZEvxOOZeJUbKQG4SgAYloDfjIibt+0yjDH+h1M6/7NiZuyWWafQFDLFtDB0gRZWY
	rtsA==
X-Gm-Message-State: APjAAAUStN+oDsXS5AIsE1DzLBX170ab0qq/QveIrnfcfEg/pYYIQ1BR
	y1sPC8i0Si86Qm9QLox8m7/XTQuuuOM=
X-Google-Smtp-Source: APXvYqyW9z9ukwxlnv7trAA06KvC42V6AHWSpIE0W3G2dYBs/W9zuT6C5yGnnZpz8QBqI+G3bKsgjw==
X-Received: by 2002:adf:fac6:: with SMTP id a6mr9917843wrs.241.1555325703796; 
	Mon, 15 Apr 2019 03:55:03 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o10sm75468400wru.54.2019.04.15.03.55.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 03:55:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 12:54:39 +0200
Message-Id: <20190415105457.57067-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 01/19] gobject-introspection: update to 1.60.1
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
X-List-Received-Date: Mon, 15 Apr 2019 10:55:04 -0000

Drop upstreamed patches:
0010-meson-add-option-gir-dir-prefix.patch
0002-g-ir-tools-respect-gir_dir_prefix.patch
0001-configure.ac-make-GIR_DIR-configurable.patch

Rebase the rest.

Upstream has renamed the gir_dir_prefix option, adjust the recipe.

Add a patch to disable tests in cross builds, as previously meson
build system didn't actually build them.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...t-cross-compilation-support-to-meson.patch | 37 ++++-----
 ...pository-directory-for-native-builds.patch | 12 +--
 ...lete-upstream-attempt-at-cross-compi.patch |  8 +-
 ...nfigure.ac-make-GIR_DIR-configurable.patch | 68 -----------------
 ...scanner-add-a-lib-dirs-envvar-option.patch | 16 ++--
 ...-error-return-codes-from-ldd-wrapper.patch |  7 +-
 ...d-disable-tests-when-cross-compiling.patch | 26 +++++++
 ...-host-gi-gi-cross-wrapper-gi-ldd-wra.patch | 10 +--
 ...02-g-ir-tools-respect-gir_dir_prefix.patch | 76 -------------------
 ...canner-add-use-binary-wrapper-option.patch |  8 +-
 ...scanner-add-a-use-ldd-wrapper-option.patch | 10 +--
 ...g-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch | 10 +--
 ...0010-meson-add-option-gir-dir-prefix.patch | 66 ----------------
 ...8.3.bb => gobject-introspection_1.60.1.bb} | 10 +--
 14 files changed, 91 insertions(+), 273 deletions(-)
 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-configure.ac-make-GIR_DIR-configurable.patch
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-meson.build-disable-tests-when-cross-compiling.patch
 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-g-ir-tools-respect-gir_dir_prefix.patch
 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0010-meson-add-option-gir-dir-prefix.patch
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.58.3.bb => gobject-introspection_1.60.1.bb} (96%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch
index 80c9e71ad57..5747d61c192 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch
@@ -1,4 +1,4 @@
-From ea25a5a755bc839d5b504aac207f860ae68109bc Mon Sep 17 00:00:00 2001
+From 2b3bce1526b538dc2c7fa223eaf9808858aa1b06 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 15 Nov 2018 15:10:05 +0100
 Subject: [PATCH] Port cross-compilation support to meson
@@ -7,16 +7,16 @@ Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- gir/meson.build   | 59 ++++++++++++++++++++++++++++++++++-------------
- meson.build       |  4 +++-
- meson_options.txt | 20 ++++++++++++++++
- 3 files changed, 66 insertions(+), 17 deletions(-)
+ gir/meson.build   | 62 ++++++++++++++++++++++++++++++++++-------------
+ meson.build       |  4 ++-
+ meson_options.txt | 20 +++++++++++++++
+ 3 files changed, 68 insertions(+), 18 deletions(-)
 
 diff --git a/gir/meson.build b/gir/meson.build
-index 1cb514a..f873068 100644
+index 85ae575..327c134 100644
 --- a/gir/meson.build
 +++ b/gir/meson.build
-@@ -36,15 +36,27 @@ gir_files = [
+@@ -36,16 +36,29 @@ gir_files = [
  typelibdir = join_paths(get_option('libdir'), 'girepository-1.0')
  install_data(gir_files, install_dir: girdir)
  
@@ -25,6 +25,7 @@ index 1cb514a..f873068 100644
 -  girscanner,
 -  '--output=@OUTPUT@',
 -  '--no-libtool',
+-  '--quiet',
 -  '--reparse-validate',
 -  '--add-include-path', join_paths(meson.current_build_dir()),
 -  '--add-include-path', join_paths(meson.current_source_dir()),
@@ -34,6 +35,7 @@ index 1cb514a..f873068 100644
 +      'g-ir-scanner',
 +      '--output=@OUTPUT@',
 +      '--no-libtool',
++      '--quiet',
 +      '--reparse-validate',
 +      '--add-include-path', join_paths(meson.current_build_dir()),
 +      '--add-include-path', join_paths(meson.current_source_dir()),
@@ -44,6 +46,7 @@ index 1cb514a..f873068 100644
 +      girscanner,
 +      '--output=@OUTPUT@',
 +      '--no-libtool',
++      '--quiet',
 +      '--reparse-validate',
 +      '--add-include-path', join_paths(meson.current_build_dir()),
 +      '--add-include-path', join_paths(meson.current_source_dir()),
@@ -53,7 +56,7 @@ index 1cb514a..f873068 100644
  
  dep_type = glib_dep.type_name()
  if dep_type == 'internal'
-@@ -57,6 +69,12 @@ if dep_type == 'internal'
+@@ -58,6 +71,12 @@ if dep_type == 'internal'
                        '--extra-library=glib-2.0', '--extra-library=gobject-2.0']
  endif
  
@@ -66,7 +69,7 @@ index 1cb514a..f873068 100644
  # Take a glob and print to newlines
  globber = '''
  from glob import glob
-@@ -83,8 +101,8 @@ glib_command = scanner_command + [
+@@ -84,8 +103,8 @@ glib_command = scanner_command + [
  
  if dep_type == 'pkgconfig'
    glib_command += ['--external-library', '--pkg=glib-2.0']
@@ -77,7 +80,7 @@ index 1cb514a..f873068 100644
    glib_libincdir = join_paths(glib_libdir, 'glib-2.0', 'include')
    glib_files += join_paths(glib_incdir, 'gobject', 'glib-types.h')
    glib_files += join_paths(glib_libincdir, 'glibconfig.h')
-@@ -338,7 +356,7 @@ endforeach
+@@ -339,7 +358,7 @@ endforeach
  if giounix_dep.found()
    if dep_type == 'pkgconfig'
      gio_command += ['--pkg=gio-unix-2.0']
@@ -86,10 +89,10 @@ index 1cb514a..f873068 100644
      # Get the installed gio-unix header list
      ret = run_command(python, '-c', globber.format(join_paths(giounix_includedir, 'gio', '*.h')))
      if ret.returncode() != 0
-@@ -416,15 +434,24 @@ gir_files += custom_target('gir-girepository',
-   ]
+@@ -422,15 +441,24 @@ gir_files += custom_target('gir-girepository',
  )
  
+ typelibs = []
 +if get_option('enable-gi-cross-wrapper') != ''
 +    gircompiler_command = [get_option('enable-gi-cross-wrapper'), gircompiler.full_path(), '-o', '@OUTPUT@', '@INPUT@',
 +              '--includedir', meson.current_build_dir(),
@@ -103,7 +106,7 @@ index 1cb514a..f873068 100644
 +endif
 +
  foreach gir : gir_files
-   custom_target('generate-typelib-@0@'.format(gir).underscorify(),
+   typelibs += custom_target('generate-typelib-@0@'.format(gir).underscorify(),
      input: gir,
      output: '@BASENAME@.typelib',
      depends: [gobject_gir, ],
@@ -116,10 +119,10 @@ index 1cb514a..f873068 100644
      install_dir: typelibdir,
    )
 diff --git a/meson.build b/meson.build
-index 17acd82..e0bb495 100644
+index 95bbd2b..f7baefd 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -81,7 +81,9 @@ libffi_dep = dependency('libffi',
+@@ -163,7 +163,9 @@ endif
  subdir('girepository')
  subdir('tools')
  subdir('giscanner')
@@ -131,11 +134,11 @@ index 17acd82..e0bb495 100644
  subdir('docs')
  subdir('tests')
 diff --git a/meson_options.txt b/meson_options.txt
-index ee6958d..b168142 100644
+index 445a68a..a325511 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -25,3 +25,23 @@ option('python', type: 'string', value: 'python3',
- option('gir-dir-prefix', type: 'string',
+ option('gir_dir_prefix', type: 'string',
    description: 'Intermediate prefix for gir installation under ${prefix}'
  )
 +
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
index a91d22afa7c..a4f45a142dd 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -1,4 +1,4 @@
-From 7ea8c83d84a05f686128e652a5447fb5f6fb68be Mon Sep 17 00:00:00 2001
+From 8f01066e935a7323ff6e53f27ed1b5fb74fa11eb Mon Sep 17 00:00:00 2001
 From: Sascha Silbe <x-yo17@se-silbe.de>
 Date: Fri, 8 Jun 2018 13:55:10 +0200
 Subject: [PATCH] Relocate the repository directory for native builds
@@ -21,7 +21,7 @@ Signed-off-by: Sascha Silbe <x-yo17@se-silbe.de>
  2 files changed, 14 insertions(+), 3 deletions(-)
 
 diff --git a/girepository/girepository.c b/girepository/girepository.c
-index c1fa3d3..efa557e 100644
+index ca5dc2b..7a4d17f 100644
 --- a/girepository/girepository.c
 +++ b/girepository/girepository.c
 @@ -21,6 +21,8 @@
@@ -42,7 +42,7 @@ index c1fa3d3..efa557e 100644
  /**
   * SECTION:girepository
   * @short_description: GObject Introspection repository manager
-@@ -188,9 +192,16 @@ init_globals (void)
+@@ -212,9 +216,16 @@ init_globals (void)
            g_free (custom_dirs);
          }
  
@@ -62,12 +62,12 @@ index c1fa3d3..efa557e 100644
        typelib_search_path = g_slist_prepend (typelib_search_path, typelib_dir);
  
 diff --git a/girepository/meson.build b/girepository/meson.build
-index 6a8c5b5..8892f2a 100644
+index 0261e1a..4cb646f 100644
 --- a/girepository/meson.build
 +++ b/girepository/meson.build
-@@ -27,7 +27,7 @@ girepo_internals_lib = static_library('girepository-internals',
+@@ -36,7 +36,7 @@ girepo_internals_lib = static_library('girepository-internals',
    ],
-   c_args: gi_hidden_visibility_cflags,
+   c_args: gi_hidden_visibility_cflags + custom_c_args,
    include_directories : configinc,
 -  dependencies: [girepo_gthash_dep, libffi_dep],
 +  dependencies: [girepo_gthash_dep, libffi_dep, cc.find_library('dl')],
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
index 86cd4ead2a0..d1fdc068c08 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
@@ -1,4 +1,4 @@
-From ca0fb17e268c176ac89df081b1efa4a42989f014 Mon Sep 17 00:00:00 2001
+From 8a57aa0ac6c2f00b9b7a7fc177431f7643399e70 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 Mar 2016 17:07:28 +0200
 Subject: [PATCH] Revert an incomplete upstream attempt at cross-compile
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 10 deletions(-)
 
 diff --git a/common.mk b/common.mk
-index b778f7a..e26c637 100644
+index 64fb02f..77e819d 100644
 --- a/common.mk
 +++ b/common.mk
 @@ -24,12 +24,8 @@ INTROSPECTION_SCANNER_ARGS = \
@@ -30,10 +30,10 @@ index b778f7a..e26c637 100644
  
  INTROSPECTION_COMPILER_ARGS = \
 diff --git a/giscanner/gdumpparser.py b/giscanner/gdumpparser.py
-index cd9d94d..b41772c 100644
+index 1730fee..26bab84 100644
 --- a/giscanner/gdumpparser.py
 +++ b/giscanner/gdumpparser.py
-@@ -161,12 +161,6 @@ blob containing data gleaned from GObject's primitive introspection."""
+@@ -156,12 +156,6 @@ blob containing data gleaned from GObject's primitive introspection."""
          out_path = os.path.join(self._binary.tmpdir, 'dump.xml')
  
          args = []
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-configure.ac-make-GIR_DIR-configurable.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-configure.ac-make-GIR_DIR-configurable.patch
deleted file mode 100644
index e0402f8f493..00000000000
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-configure.ac-make-GIR_DIR-configurable.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-configure.ac: make GIR_DIR configurable
-
-Some .gir files such as GLib-2.0.gir are arch related which contain such
-as lengths of pointers that they are different for 64 and 32 bit target.
-It causes install file conflicts for multilib when intall
-gobject-introspection and lib32-gobject-introspection both.
-
-Add configure option 'with-gir-dir-prefix' for autotools to make .gir
-could be installed to a configured path such as ${libdir}. And update
-girdir in .pc files as well.
-
-Upstream-Status: Accepted [https://gitlab.gnome.org/GNOME/gobject-introspection/commit/3301c7e]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- configure.ac                              | 7 +++++--
- gobject-introspection-1.0.pc.in           | 2 +-
- gobject-introspection-no-export-1.0.pc.in | 2 +-
- 3 files changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index b4294c57..60506947 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -114,9 +114,12 @@ GIR_SUFFIX="gir-1.0"
- AC_SUBST(GIR_SUFFIX)
- AC_DEFINE_UNQUOTED(GIR_SUFFIX, "$GIR_SUFFIX", [Name of the gir directory])
- 
--GIR_DIR="$EXPANDED_DATADIR/$GIR_SUFFIX"
-+AC_ARG_WITH([gir-dir-prefix],
-+		[AS_HELP_STRING([--with-gir-dir-prefix], [Directory prefix for gir installation])],
-+		[GIR_DIR_PREFIX="$withval"], [GIR_DIR_PREFIX="$EXPANDED_DATADIR"])
-+GIR_DIR="$GIR_DIR_PREFIX/$GIR_SUFFIX"
- AC_SUBST(GIR_DIR)
--AC_DEFINE_UNQUOTED(GIR_DIR, "$GIR_DIR", [Director prefix for gir installation])
-+AC_DEFINE_UNQUOTED(GIR_DIR, "$GIR_DIR", [Directory prefix for gir installation])
- 
- PKG_CHECK_MODULES(GLIB, [glib-2.0 >= 2.58.0])
- 
-diff --git a/gobject-introspection-1.0.pc.in b/gobject-introspection-1.0.pc.in
-index a08b5d27..3409856c 100644
---- a/gobject-introspection-1.0.pc.in
-+++ b/gobject-introspection-1.0.pc.in
-@@ -10,7 +10,7 @@ g_ir_scanner=${bindir}/g-ir-scanner
- g_ir_compiler=${bindir}/g-ir-compiler@EXEEXT@
- g_ir_generate=${bindir}/g-ir-generate@EXEEXT@
- gidatadir=${datadir}/gobject-introspection-1.0
--girdir=${datadir}/gir-1.0
-+girdir=@GIR_DIR@
- typelibdir=${libdir}/girepository-1.0
- 
- Cflags: -I${includedir}/gobject-introspection-1.0 @FFI_PC_CFLAGS@
-diff --git a/gobject-introspection-no-export-1.0.pc.in b/gobject-introspection-no-export-1.0.pc.in
-index d214d22d..745aaade 100644
---- a/gobject-introspection-no-export-1.0.pc.in
-+++ b/gobject-introspection-no-export-1.0.pc.in
-@@ -9,7 +9,7 @@ includedir=@includedir@
- g_ir_scanner=${bindir}/g-ir-scanner
- g_ir_compiler=${bindir}/g-ir-compiler@EXEEXT@
- g_ir_generate=${bindir}/g-ir-generate@EXEEXT@
--girdir=${datadir}/gir-1.0
-+girdir=@GIR_DIR@
- typelibdir=${libdir}/girepository-1.0
- 
- Cflags: -I${includedir}/gobject-introspection-1.0 @FFI_PC_CFLAGS@
--- 
-2.17.0
-
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch
index e9338e92e29..ddd955354de 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch
@@ -1,4 +1,4 @@
-From 3fea5e83803f4cfef21b2e06e37a6ba56f2bb914 Mon Sep 17 00:00:00 2001
+From 6653c28f0b76aad86e26c512b03efcec6d9d9e95 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 3 Jan 2018 17:02:01 +0200
 Subject: [PATCH] giscanner: add a --lib-dirs-envvar option
@@ -19,10 +19,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
-index c003828..8a8ba2b 100644
+index 32c9296..3fb262b 100644
 --- a/giscanner/ccompiler.py
 +++ b/giscanner/ccompiler.py
-@@ -109,7 +109,7 @@ class CCompiler(object):
+@@ -174,7 +174,7 @@ class CCompiler(object):
  
              self._cflags_no_deprecation_warnings = "-Wno-deprecated-declarations"
  
@@ -31,7 +31,7 @@ index c003828..8a8ba2b 100644
          # An "internal" link is where the library to be introspected
          # is being built in the current directory.
  
-@@ -119,7 +119,7 @@ class CCompiler(object):
+@@ -184,7 +184,7 @@ class CCompiler(object):
          if os.name == 'nt':
              runtime_path_envvar = ['LIB', 'PATH']
          else:
@@ -41,10 +41,10 @@ index c003828..8a8ba2b 100644
              # (This flag is not supported nor needed for Visual C++)
              args.append('-L.')
 diff --git a/giscanner/dumper.py b/giscanner/dumper.py
-index 2c668f5..2e515a0 100644
+index 2b851a5..10a7c39 100644
 --- a/giscanner/dumper.py
 +++ b/giscanner/dumper.py
-@@ -249,7 +249,8 @@ class DumpCompiler(object):
+@@ -244,7 +244,8 @@ class DumpCompiler(object):
                                                     libtool,
                                                     self._options.libraries,
                                                     self._options.extra_libraries,
@@ -55,10 +55,10 @@ index 2c668f5..2e515a0 100644
  
          else:
 diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
-index 5cb793e..87227e2 100644
+index 9013562..9c9fe12 100644
 --- a/giscanner/scannermain.py
 +++ b/giscanner/scannermain.py
-@@ -132,6 +132,9 @@ def _get_option_parser():
+@@ -126,6 +126,9 @@ def _get_option_parser():
      parser.add_option("", "--use-ldd-wrapper",
                        action="store", dest="ldd_wrapper", default=None,
                        help="wrapper to use instead of ldd (useful when cross-compiling)")
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
index 9167f042e5b..b484b5e9e6e 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
@@ -1,4 +1,4 @@
-From f128cbeead687bfc6532cc1f2cc3e2dc5a2b5b30 Mon Sep 17 00:00:00 2001
+From f742da8b3913f4818d3f419117076afe62f4dbf4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 5 Sep 2018 16:46:52 +0200
 Subject: [PATCH] giscanner: ignore error return codes from ldd-wrapper
@@ -8,15 +8,16 @@ It is not an error per se, but it breaks subprocess.check_output().
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  giscanner/shlibs.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py
-index 01d21a3..3bd3250 100644
+index d67df95..80352a6 100644
 --- a/giscanner/shlibs.py
 +++ b/giscanner/shlibs.py
-@@ -108,7 +108,7 @@ def _resolve_non_libtool(options, binary, libraries):
+@@ -102,7 +102,7 @@ def _resolve_non_libtool(options, binary, libraries):
              args.extend(['otool', '-L', binary.args[0]])
          else:
              args.extend(['ldd', binary.args[0]])
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-meson.build-disable-tests-when-cross-compiling.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-meson.build-disable-tests-when-cross-compiling.patch
new file mode 100644
index 00000000000..c4951b22bb3
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-meson.build-disable-tests-when-cross-compiling.patch
@@ -0,0 +1,26 @@
+From 2c384187cc22113c0c9b1cd233948118f7c085ef Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 25 Mar 2019 13:28:48 +0100
+Subject: [PATCH] meson.build: disable tests when cross-compiling
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gobject-introspection/merge_requests/64]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ meson.build | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 2544ff3..4c16fe5 100644
+--- a/meson.build
++++ b/meson.build
+@@ -168,7 +168,9 @@ if get_option('enable-introspection-data') == true
+ endif
+ subdir('examples')
+ subdir('docs')
+-subdir('tests')
++if not meson.is_cross_build()
++    subdir('tests')
++endif
+ 
+ install_data('Makefile.introspection', install_dir: join_paths(get_option('datadir'), 'gobject-introspection-1.0'))
+ install_data('m4/introspection.m4', install_dir: join_paths(get_option('datadir'), 'aclocal'))
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
index 03ef2b00590..e4fffcf6133 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
@@ -1,4 +1,4 @@
-From a28cc8413b68bec5b4cf2ee5f37b40a8965490a5 Mon Sep 17 00:00:00 2001
+From 2335d22e4c64db3d5dfc16ac65468b9dd66db8ac Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Oct 2015 18:29:21 +0300
 Subject: [PATCH] configure.ac: add host-gi, gi-cross-wrapper, gi-ldd-wrapper
@@ -34,7 +34,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  4 files changed, 87 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 44ed115..2a1fa56 100644
+index 952bf71..797a3bd 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -21,7 +21,9 @@ include Makefile-cmph.am
@@ -48,7 +48,7 @@ index 44ed115..2a1fa56 100644
  
  ## Process this file with automake to produce Makefile.in
 diff --git a/common.mk b/common.mk
-index e26c637..9f3a65f 100644
+index 77e819d..379ab53 100644
 --- a/common.mk
 +++ b/common.mk
 @@ -6,6 +6,15 @@
@@ -132,10 +132,10 @@ index e26c637..9f3a65f 100644
  INTROSPECTION_DOCTOOL_ARGS = \
      --add-include-path=$(srcdir) \
 diff --git a/configure.ac b/configure.ac
-index d48e6c3..ed5f8a2 100644
+index 885da70..cd8108b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -367,6 +367,48 @@ dnl
+@@ -383,6 +383,48 @@ dnl
  AM_CONDITIONAL(MSVC_BASE_NO_TOOLSET_SET, [test x$MSVC_BASE_TOOLSET = x])
  AM_CONDITIONAL(MSVC_NO_TOOLSET_SET, [test x$MSVC_TOOLSET = x])
  
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-g-ir-tools-respect-gir_dir_prefix.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-g-ir-tools-respect-gir_dir_prefix.patch
deleted file mode 100644
index 5e4176725c3..00000000000
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-g-ir-tools-respect-gir_dir_prefix.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-g-ir-tools: respect gir_dir_prefix
-
-Configure option gir_dir_prefix is used to configure install dir for
-.gir files, so add its value to include file search paths.
-
-Upstream-Status: Accepted [https://gitlab.gnome.org/GNOME/gobject-introspection/commit/3fe995a]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- Makefile-tools.am           |  2 +-
- giscanner/transformer.py    |  1 +
- tests/warn/warningtester.py |  1 +
- tools/g-ir-tool-template.in | 10 ++++++++++
- 6 files changed, 15 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile-tools.am b/Makefile-tools.am
-index c70d9850..fcaf1e01 100644
---- a/Makefile-tools.am
-+++ b/Makefile-tools.am
-@@ -9,7 +9,7 @@ EXTRA_DIST += 				\
- 	tools/g-ir-tool-template.in \
- 	tools/meson.build
- 
--TOOL_SUBSTITUTIONS = -e s,@libdir\@,$(libdir), -e s,@datarootdir\@,$(datarootdir), -e s,@PYTHON_CMD\@,\/usr\/bin\/env\ $(PYTHON),
-+TOOL_SUBSTITUTIONS = -e s,@libdir\@,$(libdir), -e s,@datarootdir\@,$(datarootdir), -e s,@PYTHON_CMD\@,\/usr\/bin\/env\ $(PYTHON), -e s,@GIR_DIR\@,$(GIR_DIR),g
- 
- g-ir-scanner: tools/g-ir-tool-template.in _giscanner.la Makefile
- 	$(AM_V_GEN) sed $(TOOL_SUBSTITUTIONS) -e s,@TOOL_MODULE\@,scannermain, -e s,@TOOL_FUNCTION\@,scanner_main, $< > $@.tmp && mv $@.tmp $@
-diff --git a/giscanner/transformer.py b/giscanner/transformer.py
-index 335e229f..2c412339 100644
---- a/giscanner/transformer.py
-+++ b/giscanner/transformer.py
-@@ -184,6 +184,7 @@ None."""
-     def _get_gi_data_dirs(self):
-         data_dirs = utils.get_system_data_dirs()
-         data_dirs.append(DATADIR)
-+        data_dirs.append(GIRDIR)
-         if os.name != 'nt':
-             # For backwards compatibility, was always unconditionally added to the list.
-             data_dirs.append('/usr/share')
-diff --git a/tests/warn/warningtester.py b/tests/warn/warningtester.py
-index f17c8889..be5aec13 100644
---- a/tests/warn/warningtester.py
-+++ b/tests/warn/warningtester.py
-@@ -18,6 +18,7 @@ sys.path.insert(0, path)
- 
- # Not correct, but enough to get the tests going uninstalled
- builtins.__dict__['DATADIR'] = path
-+builtins.__dict__['GIRDIR'] = ''
- 
- from giscanner.annotationparser import GtkDocCommentBlockParser
- from giscanner.ast import Include, Namespace
-diff --git a/tools/g-ir-tool-template.in b/tools/g-ir-tool-template.in
-index ed33d16b..b9cf0911 100755
---- a/tools/g-ir-tool-template.in
-+++ b/tools/g-ir-tool-template.in
-@@ -60,6 +60,16 @@ if not os.path.isdir(os.path.join(datadir, 'gir-1.0')):
- 
- builtins.__dict__['DATADIR'] = datadir
- 
-+# Respect gir_dir_prefix for meson and autotools
-+girdir = ''
-+# for meson
-+if '@gir_dir_prefix@' and not '@gir_dir_prefix@'.startswith('@'):
-+    girdir = os.path.abspath(os.path.join(filedir, '..', '@gir_dir_prefix@'))
-+# for autotools
-+elif '@GIR_DIR@' and not '@GIR_DIR@'.startswith('@'):
-+    girdir = os.path.dirname(os.path.abspath('@GIR_DIR@'))
-+builtins.__dict__['GIRDIR'] = girdir
-+
- # Again, relative paths first so that the installation prefix is relocatable
- pylibdir = os.path.abspath(os.path.join(filedir, '..', 'lib', 'gobject-introspection'))
- 
--- 
-2.17.0
-
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch
index 45fe27ad61f..b954dcebd84 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch
@@ -1,4 +1,4 @@
-From 46dbe963aa6435591c87e788cdb54bc0daeac42e Mon Sep 17 00:00:00 2001
+From 5f985fd8a24764ccb38af6335d4584d7e33fc3a1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Oct 2015 18:26:40 +0300
 Subject: [PATCH] giscanner: add --use-binary-wrapper option
@@ -16,10 +16,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 14 insertions(+)
 
 diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
-index ccb14e9..061def0 100644
+index c004fb1..0b6a2d2 100644
 --- a/giscanner/scannermain.py
 +++ b/giscanner/scannermain.py
-@@ -126,6 +126,9 @@ def _get_option_parser():
+@@ -120,6 +120,9 @@ def _get_option_parser():
      parser.add_option("", "--program",
                        action="store", dest="program", default=None,
                        help="program to execute")
@@ -29,7 +29,7 @@ index ccb14e9..061def0 100644
      parser.add_option("", "--program-arg",
                        action="append", dest="program_args", default=[],
                        help="extra arguments to program")
-@@ -418,6 +421,17 @@ def create_binary(transformer, options, args):
+@@ -417,6 +420,17 @@ def create_binary(transformer, options, args):
                                                gdump_parser.get_error_quark_functions())
  
      shlibs = resolve_shlibs(options, binary, options.libraries)
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0004-giscanner-add-a-use-ldd-wrapper-option.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0004-giscanner-add-a-use-ldd-wrapper-option.patch
index 2e36b64bab7..79264ed0865 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0004-giscanner-add-a-use-ldd-wrapper-option.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0004-giscanner-add-a-use-ldd-wrapper-option.patch
@@ -1,4 +1,4 @@
-From eba2b999e81d81b5f43bb1f0ab33881786bebdec Mon Sep 17 00:00:00 2001
+From cba7807888a4a1f1d630d16c51c89859209334b3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Oct 2015 16:28:46 +0200
 Subject: [PATCH] giscanner: add a --use-ldd-wrapper option
@@ -15,10 +15,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
-index 061def0..5cb793e 100644
+index 0b6a2d2..9013562 100644
 --- a/giscanner/scannermain.py
 +++ b/giscanner/scannermain.py
-@@ -129,6 +129,9 @@ def _get_option_parser():
+@@ -123,6 +123,9 @@ def _get_option_parser():
      parser.add_option("", "--use-binary-wrapper",
                        action="store", dest="wrapper", default=None,
                        help="wrapper to use for running programs (useful when cross-compiling)")
@@ -29,10 +29,10 @@ index 061def0..5cb793e 100644
                        action="append", dest="program_args", default=[],
                        help="extra arguments to program")
 diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py
-index 7b7b2d0..01d21a3 100644
+index 2c61f2f..d67df95 100644
 --- a/giscanner/shlibs.py
 +++ b/giscanner/shlibs.py
-@@ -102,7 +102,9 @@ def _resolve_non_libtool(options, binary, libraries):
+@@ -96,7 +96,9 @@ def _resolve_non_libtool(options, binary, libraries):
              args.extend(libtool)
              args.append('--mode=execute')
          platform_system = platform.system()
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
index 2a31117b138..74622680d6d 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
@@ -1,4 +1,4 @@
-From a97d060933932e478c03f1de9513b69bc459eefc Mon Sep 17 00:00:00 2001
+From 74dab0fb6104ab6b715a24b783f8e8dfa5f83617 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 8 Oct 2015 18:30:35 +0300
 Subject: [PATCH] Prefix pkg-config paths with PKG_CONFIG_SYSROOT_DIR
@@ -16,7 +16,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 13 insertions(+), 13 deletions(-)
 
 diff --git a/Makefile-gir.am b/Makefile-gir.am
-index 2cd7358..eaf0afd 100644
+index b59b0a6..24a50c2 100644
 --- a/Makefile-gir.am
 +++ b/Makefile-gir.am
 @@ -58,8 +58,8 @@ else
@@ -41,7 +41,7 @@ index 2cd7358..eaf0afd 100644
  
  GOBJECT_LIBRARY=gobject-2.0
  
-@@ -123,8 +123,8 @@ GObject_2_0_gir_FILES = \
+@@ -124,8 +124,8 @@ GObject_2_0_gir_FILES = \
  BUILT_GIRSOURCES += GObject-2.0.gir
  
  # gmodule
@@ -52,7 +52,7 @@ index 2cd7358..eaf0afd 100644
  
  GMODULE_LIBRARY=gmodule-2.0
  
-@@ -149,13 +149,13 @@ GModule_2_0_gir_FILES = $(GLIB_INCLUDEDIR)/gmodule.h \
+@@ -150,13 +150,13 @@ GModule_2_0_gir_FILES = $(GLIB_INCLUDEDIR)/gmodule.h \
  BUILT_GIRSOURCES += GModule-2.0.gir
  
  # gio
@@ -66,7 +66,7 @@ index 2cd7358..eaf0afd 100644
  if HAVE_GIO_UNIX
 -GIO_UNIX_INCLUDEDIR = $(shell "${PKG_CONFIG}" --variable=includedir gio-unix-2.0)/gio-unix-2.0
 +GIO_UNIX_INCLUDEDIR = $(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=includedir gio-unix-2.0)/gio-unix-2.0
- GIO_UNIX_HDRS = $(GIO_UNIX_INCLUDEDIR)/gio/*.h
+ GIO_UNIX_HDRS = $(wildcard $(GIO_UNIX_INCLUDEDIR)/gio/*.h)
  GIO_UNIX_PACKAGES = gio-unix-2.0
  else
 diff --git a/m4/introspection.m4 b/m4/introspection.m4
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0010-meson-add-option-gir-dir-prefix.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0010-meson-add-option-gir-dir-prefix.patch
deleted file mode 100644
index 8eec5f867ee..00000000000
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0010-meson-add-option-gir-dir-prefix.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From bbc34f00fd30a13eafc607a956de60d822260355 Mon Sep 17 00:00:00 2001
-From: Kai Kang <kai.kang@windriver.com>
-Date: Fri, 14 Sep 2018 01:26:38 -0700
-Subject: [PATCH] meson: add option 'gir-dir-prefix'
-
-Add option 'gir-dir-prefix' for meson to make the installation path of
-.gir files could be configured which has been done for autoconf.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gobject-introspection/commit/3938b86f5289c2b28a5ec42965b8da4b509445c4]
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- gir/meson.build   | 1 -
- meson.build       | 8 +++++++-
- meson_options.txt | 4 ++++
- 3 files changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/gir/meson.build b/gir/meson.build
-index 607bbc4..1cb514a 100644
---- a/gir/meson.build
-+++ b/gir/meson.build
-@@ -34,7 +34,6 @@ gir_files = [
- ]
- 
- typelibdir = join_paths(get_option('libdir'), 'girepository-1.0')
--girdir = join_paths(get_option('datadir'), 'gir-1.0')
- install_data(gir_files, install_dir: girdir)
- 
- scanner_command = [
-diff --git a/meson.build b/meson.build
-index a1432f7..17acd82 100644
---- a/meson.build
-+++ b/meson.build
-@@ -18,7 +18,12 @@ python = pymod.find_installation(get_option('python'))
- cc = meson.get_compiler('c')
- config = configuration_data()
- config.set_quoted('GIR_SUFFIX', 'gir-1.0')
--config.set_quoted('GIR_DIR', join_paths(get_option('prefix'), get_option('datadir'), 'gir-1.0'))
-+gir_dir_prefix = get_option('gir-dir-prefix')
-+if gir_dir_prefix == ''
-+    gir_dir_prefix = get_option('datadir')
-+endif
-+girdir = join_paths(get_option('prefix'), gir_dir_prefix, 'gir-1.0')
-+config.set_quoted('GIR_DIR', girdir)
- config.set_quoted('GOBJECT_INTROSPECTION_LIBDIR', join_paths(get_option('prefix'), get_option('libdir')))
- 
- foreach type : ['char', 'short', 'int', 'long']
-@@ -93,6 +98,7 @@ pkgconfig_conf.set('libdir', join_paths('${prefix}', get_option('libdir')))
- pkgconfig_conf.set('datarootdir', join_paths('${prefix}', get_option('datadir')))
- pkgconfig_conf.set('datadir', '${datarootdir}')
- pkgconfig_conf.set('includedir', join_paths('${prefix}', get_option('includedir')))
-+pkgconfig_conf.set('GIR_DIR', join_paths('${prefix}', gir_dir_prefix, 'gir-1.0'))
- if host_system == 'windows' or host_system == 'cygwin'
-   pkgconfig_conf.set('EXEEXT', '.exe')
- else
-diff --git a/meson_options.txt b/meson_options.txt
-index 49726be..ee6958d 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -21,3 +21,7 @@ option('cairo-libname', type: 'string',
- option('python', type: 'string', value: 'python3',
-   description: 'Path or name of the Python interpreter to build for'
- )
-+
-+option('gir-dir-prefix', type: 'string',
-+  description: 'Intermediate prefix for gir installation under ${prefix}'
-+)
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.3.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60.1.bb
similarity index 96%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.3.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60.1.bb
index 4ff9b7bf4bc..f87597f190c 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.3.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60.1.bb
@@ -17,14 +17,12 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-$
            file://0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch \
            file://0001-giscanner-add-a-lib-dirs-envvar-option.patch \
            file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch \
-           file://0001-configure.ac-make-GIR_DIR-configurable.patch \
-           file://0002-g-ir-tools-respect-gir_dir_prefix.patch \
-           file://0010-meson-add-option-gir-dir-prefix.patch \
            file://0001-Port-cross-compilation-support-to-meson.patch \
+           file://0001-meson.build-disable-tests-when-cross-compiling.patch \
            "
 
-SRC_URI[md5sum] = "182432c1f33886be8f4da073218b597d"
-SRC_URI[sha256sum] = "025b632bbd944dcf11fc50d19a0ca086b83baf92b3e34936d008180d28cdc3c8"
+SRC_URI[md5sum] = "46fc8a98f6563e64947ac3d574632525"
+SRC_URI[sha256sum] = "d844d1499ecd36f3ec8a3573616186d36626ec0c9a7981939e99aa02e9c824b3"
 
 SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
@@ -56,7 +54,7 @@ EXTRA_OEMESON_class-target = " \
     -Denable-gi-ldd-wrapper=${B}/g-ir-scanner-lddwrapper \
     -Dpkgconfig-sysroot-path=${PKG_CONFIG_SYSROOT_DIR} \
     ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Denable-introspection-data=true', '-Denable-introspection-data=false', d)} \
-    ${@'-Dgir-dir-prefix=${libdir}' if d.getVar('MULTILIBS') else ''} \
+    ${@'-Dgir_dir_prefix=${libdir}' if d.getVar('MULTILIBS') else ''} \
 "
 
 # Need to ensure ld.so.conf exists so prelink-native works
-- 
2.17.1


