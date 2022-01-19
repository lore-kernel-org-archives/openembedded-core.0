Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Subject: [PATCH 03/39] meson: update 0.60.3 -> 0.61.1
Date: Wed, 19 Jan 2022 11:40:41 +0100
Message-Id: <20220119104117.2120127-3-alex@linutronix.de>
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>, Alexander Kanavin <alex.kanavin@gmail.com>

Backport patches to epiphany/gcr/g-i to address failures with new meson.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...sues-that-arise-when-cross-compiling.patch |  39 ----
 .../{meson_0.60.3.bb => meson_0.61.1.bb}      |   8 +-
 meta/recipes-gnome/epiphany/epiphany_41.3.bb  |   1 +
 ...5f7bab38301d8a4a444173acdae8d9692146.patch |  35 +++
 ...1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch |  61 +++++
 meta/recipes-gnome/gcr/gcr_3.40.0.bb          |   3 +-
 ...01-build-Avoid-the-doctemplates-hack.patch | 219 ++++++++++++++++++
 .../gobject-introspection_1.70.0.bb           |   1 +
 8 files changed, 322 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
 rename meta/recipes-devtools/meson/{meson_0.60.3.bb => meson_0.61.1.bb} (94%)
 create mode 100644 meta/recipes-gnome/epiphany/files/bfbb5f7bab38301d8a4a444173acdae8d9692146.patch
 create mode 100644 meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-build-Avoid-the-doctemplates-hack.patch

diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
deleted file mode 100644
index b098c4a123..0000000000
--- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From bbdd6679e49bcba5ec022b240ac234a87b451e41 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 4 Aug 2017 16:16:41 +0300
-Subject: [PATCH] gtkdoc: add support for a binary wrapper
-
-Make it possible to specify a wrapper for executing binaries
-in cross-compiling scenarios.
-(usually, some kind of target hardware emulator, such as qemu)
-
-Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/9627]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- mesonbuild/modules/gnome.py | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
-index 1c6952d..5a6ff94 100644
---- a/mesonbuild/modules/gnome.py
-+++ b/mesonbuild/modules/gnome.py
-@@ -35,7 +35,7 @@ from ..mesonlib import (
- from ..dependencies import Dependency, PkgConfigDependency, InternalDependency
- from ..interpreterbase import noPosargs, noKwargs, permittedKwargs, FeatureNew, FeatureNewKwargs, FeatureDeprecatedKwargs, FeatureDeprecated
- from ..interpreterbase import typed_kwargs, KwargInfo, ContainerTypeInfo
--from ..programs import ExternalProgram, OverrideProgram
-+from ..programs import ExternalProgram, OverrideProgram, EmptyExternalProgram
- from ..build import CustomTarget, CustomTargetIndex, GeneratedList
- 
- if T.TYPE_CHECKING:
-@@ -1103,6 +1103,9 @@ class GnomeModule(ExtensionModule):
-             args.append(f'--{program_name}={path}')
-         if namespace:
-             args.append('--namespace=' + namespace)
-+        if state.environment.need_exe_wrapper() and not isinstance(state.environment.get_exe_wrapper(), EmptyExternalProgram):
-+            args.append('--run=' + ' '.join(state.environment.get_exe_wrapper().get_command()))
-+
-         args += self._unpack_args('--htmlargs=', 'html_args', kwargs)
-         args += self._unpack_args('--scanargs=', 'scan_args', kwargs)
-         args += self._unpack_args('--scanobjsargs=', 'scanobjs_args', kwargs)
diff --git a/meta/recipes-devtools/meson/meson_0.60.3.bb b/meta/recipes-devtools/meson/meson_0.61.1.bb
similarity index 94%
rename from meta/recipes-devtools/meson/meson_0.60.3.bb
rename to meta/recipes-devtools/meson/meson_0.61.1.bb
index 62ca09465b..32b1240012 100644
--- a/meta/recipes-devtools/meson/meson_0.60.3.bb
+++ b/meta/recipes-devtools/meson/meson_0.61.1.bb
@@ -8,14 +8,15 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${PV}.tar.gz \
-           file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch \
+           file://meson-setup.py \
+           file://meson-wrapper \
            file://0001-python-module-do-not-manipulate-the-environment-when.patch \
            file://disable-rpath-handling.patch \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            file://0001-is_debianlike-always-return-False.patch \
            "
-SRC_URI[sha256sum] = "87ca5fa9358a01864529392bd64e027158eb94afca7c7766b1866ef27eccb98e"
+SRC_URI[sha256sum] = "feb2cefb325b437dbf36146df7c6b87688ddff0b0205caa31dc64055c6da410c"
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
@@ -40,9 +41,6 @@ BBCLASSEXTEND = "native nativesdk"
 
 inherit meson-routines
 
-SRC_URI:append:class-nativesdk = " file://meson-setup.py \
-                                     file://meson-wrapper"
-
 # The cross file logic is similar but not identical to that in meson.bbclass,
 # since it's generating for an SDK rather than a cross-compile. Important
 # differences are:
diff --git a/meta/recipes-gnome/epiphany/epiphany_41.3.bb b/meta/recipes-gnome/epiphany/epiphany_41.3.bb
index 634ba8a1b9..befd817165 100644
--- a/meta/recipes-gnome/epiphany/epiphany_41.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_41.3.bb
@@ -24,6 +24,7 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
+           file://bfbb5f7bab38301d8a4a444173acdae8d9692146.patch \
            file://migrator.patch \
            file://distributor.patch \
            "
diff --git a/meta/recipes-gnome/epiphany/files/bfbb5f7bab38301d8a4a444173acdae8d9692146.patch b/meta/recipes-gnome/epiphany/files/bfbb5f7bab38301d8a4a444173acdae8d9692146.patch
new file mode 100644
index 0000000000..f20975c3bd
--- /dev/null
+++ b/meta/recipes-gnome/epiphany/files/bfbb5f7bab38301d8a4a444173acdae8d9692146.patch
@@ -0,0 +1,35 @@
+From bfbb5f7bab38301d8a4a444173acdae8d9692146 Mon Sep 17 00:00:00 2001
+From: rvalue <i@rvalue.moe>
+Date: Wed, 24 Nov 2021 04:52:42 +0000
+Subject: [PATCH] Remove incorrect args for i18n.merge_file
+
+Part-of: <https://gitlab.gnome.org/GNOME/epiphany/-/merge_requests/1031>
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ data/meson.build | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/data/meson.build b/data/meson.build
+index 46df3fd80..eac6b8224 100644
+--- a/data/meson.build
++++ b/data/meson.build
+@@ -16,7 +16,6 @@ install_data(
+ desktop_conf = configuration_data()
+ desktop_conf.set('icon', application_id)
+ desktop = i18n.merge_file(
+-  'desktop',
+   input: configure_file(
+     input: files('org.gnome.Epiphany.desktop.in.in'),
+     output: 'org.gnome.Epiphany.desktop.in',
+@@ -32,7 +31,6 @@ desktop = i18n.merge_file(
+ appdata_conf = configuration_data()
+ appdata_conf.set('appid', application_id)
+ appdata = i18n.merge_file(
+-  'appdata',
+   input: configure_file(
+     input: files('org.gnome.Epiphany.appdata.xml.in.in'),
+     output: 'org.gnome.Epiphany.appdata.xml.in',
+-- 
+GitLab
+
diff --git a/meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch b/meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
new file mode 100644
index 0000000000..ae4e2ac1eb
--- /dev/null
+++ b/meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
@@ -0,0 +1,61 @@
+From b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8 Mon Sep 17 00:00:00 2001
+From: Jakub Jirutka <jakub@jirutka.cz>
+Date: Wed, 12 Jan 2022 00:24:20 +0100
+Subject: [PATCH] meson: Fix unknown kw argument in gnome.generate_gir
+
+This argument has been removed in Meson 0.61.0:
+
+    gck/meson.build:130:2: ERROR: gnome.generate_gir got unknown keyword arguments "packages"
+
+https://github.com/mesonbuild/meson/commit/f8fc5cb860465718fe7c79a1bf1fe00659f138de:
+
+> The packages argument to gnome.generate_gir was allowed, but never did anything, so stop passing it.
+
+Fixes #89
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gck/meson.build | 1 -
+ gcr/meson.build | 1 -
+ ui/meson.build  | 1 -
+ 3 files changed, 3 deletions(-)
+
+diff --git a/gck/meson.build b/gck/meson.build
+index 756b486..a21a1e9 100644
+--- a/gck/meson.build
++++ b/gck/meson.build
+@@ -131,7 +131,6 @@ if get_option('introspection')
+     sources: gck_gir_sources,
+     namespace: 'Gck',
+     nsversion: '@0@'.format(gck_major_version),
+-    packages: gck_deps,
+     export_packages: 'gck-@0@'.format(gck_major_version),
+     includes: [ 'GObject-2.0', 'Gio-2.0' ],
+     header: 'gck/gck.h',
+diff --git a/gcr/meson.build b/gcr/meson.build
+index 2233a44..c83641b 100644
+--- a/gcr/meson.build
++++ b/gcr/meson.build
+@@ -190,7 +190,6 @@ if get_option('introspection')
+     sources: [ gcr_base_public_sources, gcr_base_headers ],
+     namespace: 'Gcr',
+     nsversion: '@0@'.format(gcr_major_version),
+-    packages: gcr_base_deps,
+     export_packages: 'gcr-base-@0@'.format(gcr_major_version),
+     includes: [
+       'GObject-2.0',
+diff --git a/ui/meson.build b/ui/meson.build
+index e656ea2..32ee057 100644
+--- a/ui/meson.build
++++ b/ui/meson.build
+@@ -152,7 +152,6 @@ if get_option('introspection')
+     export_packages: 'gcr-ui-@0@'.format(gcr_major_version),
+     identifier_prefix: 'Gcr',
+     symbol_prefix: 'gcr',
+-    packages: gcr_ui_deps,
+     includes: [
+       'GObject-2.0',
+       'Gio-2.0',
+-- 
+GitLab
+
diff --git a/meta/recipes-gnome/gcr/gcr_3.40.0.bb b/meta/recipes-gnome/gcr/gcr_3.40.0.bb
index a05e753ee9..d617454058 100644
--- a/meta/recipes-gnome/gcr/gcr_3.40.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.40.0.bb
@@ -17,7 +17,8 @@ GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk_doc"
 inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
 
-SRC_URI += "file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch"
+SRC_URI += "file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch \ 
+            file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch"
 
 SRC_URI[archive.sha256sum] = "b9d3645a5fd953a54285cc64d4fc046736463dbd4dcc25caf5c7b59bed3027f5"
 
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-build-Avoid-the-doctemplates-hack.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-build-Avoid-the-doctemplates-hack.patch
new file mode 100644
index 0000000000..b7d31ccfb0
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-build-Avoid-the-doctemplates-hack.patch
@@ -0,0 +1,219 @@
+From effb1e09dee263cdac4ec593e8caf316e6f01fe2 Mon Sep 17 00:00:00 2001
+From: Emmanuele Bassi <ebassi@gnome.org>
+Date: Tue, 11 Jan 2022 15:51:10 +0000
+Subject: [PATCH] build: Avoid the doctemplates hack
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The hack that copies the doctemplates directory into the build
+directory has stopped working with newer versions of Meson; while it's
+possible to copy files, custom_target() cannot depend on a directory.
+Additionally, the dependency has always been broken.
+
+Instead, we enumerate the template files—after all, it's not like they
+change a lot—and then we list them as dependencies for the test targets.
+
+Fixes: #414
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ giscanner/doctemplates/devdocs/meson.build | 19 +++++++
+ giscanner/doctemplates/mallard/meson.build | 63 ++++++++++++++++++++++
+ giscanner/meson.build                      | 14 ++---
+ tests/scanner/meson.build                  | 24 +++++----
+ 4 files changed, 98 insertions(+), 22 deletions(-)
+ create mode 100644 giscanner/doctemplates/devdocs/meson.build
+ create mode 100644 giscanner/doctemplates/mallard/meson.build
+
+diff --git a/giscanner/doctemplates/devdocs/meson.build b/giscanner/doctemplates/devdocs/meson.build
+new file mode 100644
+index 00000000..2037182a
+--- /dev/null
++++ b/giscanner/doctemplates/devdocs/meson.build
+@@ -0,0 +1,19 @@
++doc_templates += files([
++  'Gjs/_doc.tmpl',
++  'Gjs/_index.tmpl',
++  'Gjs/_method.tmpl',
++  'Gjs/_methods.tmpl',
++  'Gjs/_properties.tmpl',
++  'Gjs/_signals.tmpl',
++  'Gjs/_staticmethods.tmpl',
++  'Gjs/_vfuncs.tmpl',
++  'Gjs/base.tmpl',
++  'Gjs/callback.tmpl',
++  'Gjs/class.tmpl',
++  'Gjs/default.tmpl',
++  'Gjs/enum.tmpl',
++  'Gjs/function.tmpl',
++  'Gjs/interface.tmpl',
++  'Gjs/method.tmpl',
++  'Gjs/namespace.tmpl',
++])
+diff --git a/giscanner/doctemplates/mallard/meson.build b/giscanner/doctemplates/mallard/meson.build
+new file mode 100644
+index 00000000..5fe4e2af
+--- /dev/null
++++ b/giscanner/doctemplates/mallard/meson.build
+@@ -0,0 +1,63 @@
++base_templates = files([
++  'base.tmpl',
++  'class.tmpl',
++  'namespace.tmpl',
++])
++
++c_templates = files([
++  'C/callback.tmpl',
++  'C/class.tmpl',
++  'C/constructor.tmpl',
++  'C/default.tmpl',
++  'C/enum.tmpl',
++  'C/field.tmpl',
++  'C/function.tmpl',
++  'C/interface.tmpl',
++  'C/method.tmpl',
++  'C/namespace.tmpl',
++  'C/property.tmpl',
++  'C/record.tmpl',
++  'C/signal.tmpl',
++  'C/vfunc.tmpl',
++])
++
++gjs_templates = files([
++  'Gjs/callback.tmpl',
++  'Gjs/class.tmpl',
++  'Gjs/constructor.tmpl',
++  'Gjs/default.tmpl',
++  'Gjs/enum.tmpl',
++  'Gjs/field.tmpl',
++  'Gjs/function.tmpl',
++  'Gjs/interface.tmpl',
++  'Gjs/method.tmpl',
++  'Gjs/namespace.tmpl',
++  'Gjs/property.tmpl',
++  'Gjs/record.tmpl',
++  'Gjs/signal.tmpl',
++  'Gjs/vfunc.tmpl',
++])
++
++py_templates = files([
++  'Python/callback.tmpl',
++  'Python/class.tmpl',
++  'Python/constructor.tmpl',
++  'Python/default.tmpl',
++  'Python/enum.tmpl',
++  'Python/field.tmpl',
++  'Python/function.tmpl',
++  'Python/interface.tmpl',
++  'Python/method.tmpl',
++  'Python/namespace.tmpl',
++  'Python/property.tmpl',
++  'Python/record.tmpl',
++  'Python/signal.tmpl',
++  'Python/vfunc.tmpl',
++])
++
++doc_templates += [
++  base_templates,
++  c_templates,
++  gjs_templates,
++  py_templates,
++]
+diff --git a/giscanner/meson.build b/giscanner/meson.build
+index 41edcd44..3d7dc678 100644
+--- a/giscanner/meson.build
++++ b/giscanner/meson.build
+@@ -53,17 +53,9 @@ configure_file(input : '../girepository/gdump.c',
+ 
+ install_subdir('doctemplates', install_dir: giscannerdir)
+ 
+-# XXX: this doesn't track the input, but there is nothing to copy many files
+-# in meson.
+-doc_templates = custom_target('copy-templates',
+-  input : 'doctemplates',
+-  output : 'doctemplates',
+-  command : [
+-    python, '-c',
+-      'import sys, shutil;' +
+-      'shutil.rmtree(sys.argv[2], ignore_errors=True);' +
+-      'shutil.copytree(sys.argv[1], sys.argv[2])',
+-    '@INPUT@', '@OUTPUT@'])
++doc_templates = []
++subdir('doctemplates/devdocs')
++subdir('doctemplates/mallard')
+ 
+ flex = find_program('flex', 'win_flex')
+ bison = find_program('bison', 'win_bison')
+diff --git a/tests/scanner/meson.build b/tests/scanner/meson.build
+index 5176b957..b81b3fd5 100644
+--- a/tests/scanner/meson.build
++++ b/tests/scanner/meson.build
+@@ -525,19 +525,26 @@ foreach gir : test_girs
+ endforeach
+ 
+ if has_girdoctool and glib_dep.type_name() == 'pkgconfig'
++  doctool_env = environment()
++  doctool_env.set('srcdir', meson.current_source_dir())
++  doctool_env.set('builddir', meson.current_build_dir())
++
+   foreach language : ['C', 'Python', 'Gjs']
+     regress_docs = custom_target(
+       'generate-docs-' + language,
+       input: regress_gir,
+-      depends: [doc_templates],
++      depend_files: doc_templates,
+       build_by_default: not cairo_deps_found,
++      env: doctool_env,
+       output: 'Regress-1.0-' + language,
+       command: [
+         python, girdoctool,
+         '--add-include-path=' + join_paths(build_root, 'gir'),
+         '--add-include-path=' + meson.current_build_dir(),
+         '--language', language,
+-        '@INPUT@', '-o', '@OUTPUT@'],
++        '--templates-dir=' + join_paths(meson.current_source_dir(), '../../giscanner/doctemplates'),
++        '@INPUT@', '-o', '@OUTPUT@',
++      ],
+     )
+ 
+     if cairo_deps_found
+@@ -546,10 +553,7 @@ if has_girdoctool and glib_dep.type_name() == 'pkgconfig'
+         python,
+         args: [gi_tester, 'Regress-1.0-' + language],
+         depends: [regress_docs],
+-        env: [
+-          'srcdir=' + meson.current_source_dir(),
+-          'builddir=' + meson.current_build_dir(),
+-        ],
++        env: doctool_env,
+       )
+     endif
+   endforeach
+@@ -557,9 +561,10 @@ if has_girdoctool and glib_dep.type_name() == 'pkgconfig'
+   regress_sections = custom_target(
+     'generate-docs-sections',
+     input: regress_gir,
+-    depends: [doc_templates],
++    depend_files: [doc_templates],
+     build_by_default: not cairo_deps_found,
+     output: 'Regress-1.0-sections.txt',
++    env: doctool_env,
+     command: [
+       python, girdoctool,
+       '--add-include-path=' + join_paths(build_root, 'gir'),
+@@ -574,10 +579,7 @@ if has_girdoctool and glib_dep.type_name() == 'pkgconfig'
+       python,
+       args: [gi_tester, 'Regress-1.0-sections.txt'],
+       depends: [regress_sections],
+-      env: [
+-        'srcdir=' + meson.current_source_dir(),
+-        'builddir=' + meson.current_build_dir(),
+-      ],
++      env: doctool_env,
+     )
+   endif
+ endif
+-- 
+2.20.1
+
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb
index d96caf08d8..d4ee03d33c 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
            file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch \
+           file://0001-build-Avoid-the-doctemplates-hack.patch \
            "
 
 SRC_URI[sha256sum] = "902b4906e3102d17aa2fcb6dad1c19971c70f2a82a159ddc4a94df73a3cafc4a"
-- 
2.20.1

