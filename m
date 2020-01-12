Return-Path: <crg7475@mailbox.org>
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	by mail.openembedded.org (Postfix) with ESMTP id EFDCC7C377
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 14:00:18 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 47wddv4xX9zKmf6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 15:00:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1578837616; bh=oJEM/mn22bDclYI
	H0AWBIDr5xl2VF3FOaVBDrKQYpYA=; b=s2xGEHSPb1uKSJcBBGTzGyjg/nzz+7t
	GVndazYrtK998Y3Ma3mXgVRgRxW6dzItb/J7QYN8fxIrz/UEW/McBHG8OpZqrs0/
	FL0fAKjnMXgCUBfnhvcdIU0rxHaft+lJxz3Xdcb3pQdyRvyils7t9pLgJtrjHX1n
	Osp3I4Q9p+jYcEt9VzxT7ruw09SRcvOARRA2fHGBMvZpUWpEHZaGiDUh4dSzDq8Q
	KhQYO+WLpg0my6+SwwBlfpHtHpR8pnnQB+OeTOyUThlUFCXXDI/0bOaQHnUDB4Pl
	qp2yOvmc+6zhOWwFBrGN7st+Vg1RRasadfkkQTBEzAFg2WGZ1N7SViQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1578837619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=grCnE52jm7JItUFkLINzxxBbNZnPOFYbeNDwIBSsC38=;
	b=W+knAAGPTfaKPAOU48oGCicvMXkMhyA9cWYXW03R78Rm1iHMAR7MjLM30HugOFtiwZZraY
	Mj09W1BYUhwqTn2oweC5y0L4zwhgj0E8ixa6ByQ09CqRO4hJIcSznIJSLHpQryMoacIPlK
	Dq0JYRBeOJmXrUPNml/+WGRke42hnJ6ZqOXmFSncimfgSL4q1oEVFPWV0od7uWictaYz9y
	F1G4IKnS0Rb70tGbzrqWkTA13EErRbb5diukKtU0p40GLL92P5K2hZnKadmCo/F45lLqpy
	WYdTNdSXlPVHZPcn8nBvTECCXoo1fLAjO0AufNK9Oau4eMs3VMPUl8KCi48TOQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
	[80.241.56.117]) (amavisd-new, port 10030) with ESMTP id 0sYfKB_Gy0lz
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 15:00:16 +0100 (CET)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jan 2020 14:59:44 +0100
Message-Id: <20200112135954.23868-2-crg7475@mailbox.org>
In-Reply-To: <20200112135954.23868-1-crg7475@mailbox.org>
References: <20200112135954.23868-1-crg7475@mailbox.org>
Subject: [PATCH 02/12] gstreamer1.0: Transition to meson based builds
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
X-List-Received-Date: Sun, 12 Jan 2020 14:00:19 -0000

* Moved 0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
  from files/ to gstreamer1.0/ since it is gstreamer1.0 recipe specific.

* Removed M4 specific patches:
  - 0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
  - gtk-doc-tweaks.patch
  - add-a-target-to-compile-tests.patch

* Added patches:
  - 0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
    Backport for enabling GIR support in meson based cross compilation
  - 0002-meson-Add-valgrind-feature.patch
    Make valgrind support configurable to be able to control it through
    a "valgrind" packageconfig
  - 0003-meson-Add-option-for-installed-tests.patch
    Add support for installable tests and for generating .test and shell
    scripts which can be used with the gnome-desktop-testing suite runner

* PTest support:
  By default, GStreamer does not allow for installing tests, and requires
  meson to run its unit tests. The 0003 patch fixes this by installing
  the binaries themselves and by generating accompanying .test and shell
  scripts. The scripts set up the required environment files and then
  call the test binaries. The .test file list the shell scripts as
  Exec= command line.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...der.c-when-env-var-is-set-do-not-fal.patch |   0
 ...even-when-cross-compiling-if-introsp.patch |  36 +++
 .../0003-meson-Add-valgrind-feature.patch     |  74 +++++
 ...meson-Add-option-for-installed-tests.patch | 257 ++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.16.1.bb          |  93 +++----
 5 files changed, 404 insertions(+), 56 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{files => gstreamer1.0}/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch (100%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-valgrind-feature.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Add-option-for-installed-tests.patch

diff --git a/meta/recipes-multimedia/gstreamer/files/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/files/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch
new file mode 100644
index 0000000000..1ed7198a5c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch
@@ -0,0 +1,36 @@
+From 35db4a2433fbdf8612cf98b5aab5b14aeb5372f8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
+Date: Thu, 17 Oct 2019 12:13:35 +0100
+Subject: [PATCH] meson: build gir even when cross-compiling if introspection
+ was enabled explicitly
+
+This can be made to work in certain circumstances when
+cross-compiling, so default to not building g-i stuff
+when cross-compiling, but allow it if introspection was
+enabled explicitly via -Dintrospection=enabled.
+
+Fixes #454 and #381.
+
+Upstream-Status: Backport [35db4a2433fbdf8612cf98b5aab5b14aeb5372f8]
+
+Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 90d98d8eb..a47e7f34e 100644
+--- a/meson.build
++++ b/meson.build
+@@ -466,7 +466,7 @@ rt_lib = cc.find_library('rt', required : false)
+ gir = find_program('g-ir-scanner', required : get_option('introspection'))
+ gnome = import('gnome')
+ 
+-build_gir = gir.found() and not meson.is_cross_build()
++build_gir = gir.found() and (not meson.is_cross_build() or get_option('introspection').enabled())
+ 
+ gir_init_section = [ '--add-init-section=extern void gst_init(gint*,gchar**);' + \
+     'g_setenv("GST_REGISTRY_DISABLE", "yes", TRUE);' + \
+-- 
+2.17.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-valgrind-feature.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-valgrind-feature.patch
new file mode 100644
index 0000000000..f553340f4d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-valgrind-feature.patch
@@ -0,0 +1,74 @@
+From f6c7973c03d9ba7dab60c496e768c5e6c4ee824c Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <crg7475@mailbox.org>
+Date: Sun, 20 Oct 2019 10:36:44 +0200
+Subject: [PATCH] meson: Add valgrind feature
+
+This allows for enabling/disabling Valgrind support. Since Valgrind is
+an external dependency, such a feature is needed by build environemnts
+such as Yocto to make sure builds are deterministic. These changes also
+add more Valgrind specific configure log output.
+
+Upstream-Status: Pending
+
+Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
+---
+ meson.build       | 23 ++++++++++++++++++++++-
+ meson_options.txt |  1 +
+ 2 files changed, 23 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index b55ecc5..4751761 100644
+--- a/meson.build
++++ b/meson.build
+@@ -199,7 +199,6 @@ check_headers = [
+   'sys/wait.h',
+   'ucontext.h',
+   'unistd.h',
+-  'valgrind/valgrind.h',
+   'sys/resource.h',
+ ]
+ 
+@@ -214,6 +213,28 @@ foreach h : check_headers
+   endif
+ endforeach
+ 
++valgrind_option = get_option('valgrind')
++if valgrind_option.disabled()
++  message('Valgrind support not requested; disabled.')
++else
++  valgrind_header = 'valgrind/valgrind.h'
++  has_valgrind_header = cc.has_header(valgrind_header)
++  if has_valgrind_header
++    message('Valgrind support requested, and header ' + valgrind_header + \
++        ' found. Enabled Valgrind support.')
++    define = 'HAVE_' + valgrind_header.underscorify().to_upper()
++    cdata.set(define, 1)
++  else
++    if valgrind_option.enabled()
++      error('Valgrind support requested and set as required, but header ' + \
++        valgrind_header + ' not found.')
++    else
++      message('Valgrind support requested, but header ' + valgrind_header + \
++        ' not found. Disabling Valgrind support.')
++    endif
++  endif
++endif
++
+ if cc.has_member('struct tm', 'tm_gmtoff', prefix : '#include <time.h>')
+   cdata.set('HAVE_TM_GMTOFF', 1)
+ endif
+diff --git a/meson_options.txt b/meson_options.txt
+index e7ff7ba..8afde39 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -19,6 +19,7 @@ option('memory-alignment', type: 'combo',
+ 
+ # Feature options
+ option('check', type : 'feature', value : 'auto', description : 'Build unit test libraries')
++option('valgrind', type : 'feature', value : 'auto', description : 'Enable Valgrind support')
+ option('libunwind', type : 'feature', value : 'auto', description : 'Use libunwind to generate backtraces')
+ option('libdw', type : 'feature', value : 'auto', description : 'Use libdw to generate better backtraces from libunwind')
+ option('dbghelp', type : 'feature', value : 'auto', description : 'Use dbghelp to generate backtraces')
+-- 
+2.17.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Add-option-for-installed-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Add-option-for-installed-tests.patch
new file mode 100644
index 0000000000..0e6c44ea32
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Add-option-for-installed-tests.patch
@@ -0,0 +1,257 @@
+From b843400284751968862751dfe93853f151551c64 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <crg7475@mailbox.org>
+Date: Fri, 25 Oct 2019 00:06:26 +0200
+Subject: [PATCH] meson: Add option for installed tests
+
+This adds an option for producing installed versions of the unit tests.
+These versions don't need meson to run (only a small shell script). This
+makes it easier to run cross compiled tests on a target machine.
+
+Upstream-Status: Pending
+
+Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
+---
+ build-aux/gen-installed-test-desc.py     | 18 ++++++
+ build-aux/gen-installed-test-shscript.py | 25 ++++++++
+ meson_options.txt                        |  2 +
+ tests/check/meson.build                  | 46 +++++++++++++-
+ tests/files/testfile                     | 80 ++++++++++++++++++++++++
+ 5 files changed, 170 insertions(+), 1 deletion(-)
+ create mode 100644 build-aux/gen-installed-test-desc.py
+ create mode 100644 build-aux/gen-installed-test-shscript.py
+ create mode 100644 tests/files/testfile
+
+diff --git a/build-aux/gen-installed-test-desc.py b/build-aux/gen-installed-test-desc.py
+new file mode 100644
+index 0000000..69e8a0f
+--- /dev/null
++++ b/build-aux/gen-installed-test-desc.py
+@@ -0,0 +1,18 @@
++import sys
++import os
++import argparse
++
++def write_template(filename, data):
++    with open(filename, 'w') as f:
++        f.write(data)
++
++def build_template(testdir, testname):
++    return "[Test]\nType=session\nExec={}\n".format(os.path.join(testdir, testname))
++
++argparser = argparse.ArgumentParser(description='Generate installed-test data.')
++argparser.add_argument('--test-execdir', metavar='dir', required=True, help='Installed test directory')
++argparser.add_argument('--testname', metavar='name', required=True, help='Installed test name')
++argparser.add_argument('--output', metavar='file', required=True, help='Output file')
++args = argparser.parse_args()
++
++write_template(args.output, build_template(args.test_execdir, args.testname))
+diff --git a/build-aux/gen-installed-test-shscript.py b/build-aux/gen-installed-test-shscript.py
+new file mode 100644
+index 0000000..5da86fb
+--- /dev/null
++++ b/build-aux/gen-installed-test-shscript.py
+@@ -0,0 +1,25 @@
++import sys
++import os
++import argparse
++
++def write_template(filename, data):
++    with open(filename, 'w') as f:
++        f.write(data)
++
++def build_template(testdir, testname):
++    return ''.join([
++        "#!/usr/bin/env sh\n",
++        "export GST_STATE_IGNORE_ELEMENTS=''\n",
++        "export CK_DEFAULT_TIMEOUT=20\n",
++        "export GST_PLUGIN_LOADING_WHITELIST='gstreamer'\n",
++        "{}\n".format(os.path.join(testdir, testname)),
++    ])
++
++argparser = argparse.ArgumentParser(description='Generate installed-test data.')
++argparser.add_argument('--test-execdir', metavar='dir', required=True, help='Installed test directory')
++argparser.add_argument('--testname', metavar='name', required=True, help='Installed test name')
++argparser.add_argument('--output', metavar='file', required=True, help='Output file')
++args = argparser.parse_args()
++
++write_template(args.output, build_template(args.test_execdir, args.testname))
++os.chmod(args.output, 0o755)
+diff --git a/meson_options.txt b/meson_options.txt
+index 8afde39..8884dcc 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -16,6 +16,8 @@ option('poisoning', type : 'boolean', value : false, description : 'Enable poiso
+ option('memory-alignment', type: 'combo',
+        choices : ['1', '2', '4', '8', '16', '32', '64', '128', '256', '512', '1024', '2048', '4096', '8192', 'malloc', 'pagesize'],
+        value: 'malloc')
++option('installed-tests', type : 'boolean', value : false, description : 'enable installed tests')
++option('test-files-path', type : 'string', description : 'Path where to find test files')
+ 
+ # Feature options
+ option('check', type : 'feature', value : 'auto', description : 'Build unit test libraries')
+diff --git a/tests/check/meson.build b/tests/check/meson.build
+index 04da83f..2db7f76 100644
+--- a/tests/check/meson.build
++++ b/tests/check/meson.build
+@@ -118,11 +118,17 @@ if add_languages('cpp', required : false)
+   ]
+ endif
+ 
++test_files_path = get_option('test-files-path')
++if test_files_path == ''
++  test_files_path = meson.current_source_dir() + '/../files'
++endif
++message('Using path "@0@" as the path to read test files from'.format(test_files_path))
++
+ test_defines = [
+   '-UG_DISABLE_ASSERT',
+   '-UG_DISABLE_CAST_CHECKS',
+   '-DGST_CHECK_TEST_ENVIRONMENT_BEACON="GST_STATE_IGNORE_ELEMENTS"',
+-  '-DTESTFILE="' + meson.current_source_dir() + '/meson.build"',
++  '-DTESTFILE="@0@"'.format(test_files_path + '/testfile'),
+   '-DGST_USE_UNSTABLE_API',
+   '-DGST_DISABLE_DEPRECATED',
+ ]
+@@ -137,6 +143,14 @@ endif
+ glib_deps = [gio_dep, gobject_dep, gmodule_dep, glib_dep]
+ gst_deps = [gst_dep, gst_base_dep, gst_check_dep, gst_net_dep, gst_controller_dep]
+ 
++installed_tests_datadir = join_paths(prefix, get_option('datadir'), 'installed-tests', 'gstreamer-1.0')
++installed_tests_execdir = join_paths(prefix, libexecdir, 'installed-tests', 'gstreamer-1.0')
++installed_tests_enabled = get_option('installed-tests')
++
++python = import('python').find_installation()
++gen_installed_test_desc = files('../../build-aux/gen-installed-test-desc.py')
++gen_installed_test_shscript = files('../../build-aux/gen-installed-test-shscript.py')
++
+ foreach t : core_tests
+   fname = t[0]
+   test_name = fname.split('.')[0].underscorify()
+@@ -150,8 +164,38 @@ foreach t : core_tests
+         include_directories : [configinc],
+         link_with : link_with_libs,
+         dependencies : test_deps + glib_deps + gst_deps,
++        install_dir: installed_tests_execdir,
++        install: installed_tests_enabled
+     )
+ 
++    if installed_tests_enabled
++      installed_test_shscript = test_name + '.sh'
++      shscript = custom_target (test_name + '_shscript',
++                                output: installed_test_shscript,
++                                command: [
++                                  python,
++                                  gen_installed_test_shscript,
++                                  '--test-execdir=@0@'.format(installed_tests_execdir),
++                                  '--testname=@0@'.format(test_name),
++                                  '--output=@0@'.format(join_paths('@OUTDIR@', installed_test_shscript)),
++                                ],
++                                install: true,
++                                install_dir: installed_tests_execdir)
++
++      installed_test_desc = test_name + '.test'
++      data = custom_target(test_name + '_desc',
++                           output: installed_test_desc,
++                           command: [
++                             python,
++                             gen_installed_test_desc,
++                             '--test-execdir=@0@'.format(installed_tests_execdir),
++                             '--testname=@0@'.format(installed_test_shscript),
++                             '--output=@0@'.format(join_paths('@OUTDIR@', installed_test_desc)),
++                           ],
++                           install: true,
++                           install_dir: installed_tests_datadir)
++    endif
++
+     env = environment()
+     env.set('GST_PLUGIN_PATH_1_0', meson.build_root())
+     env.set('GST_PLUGIN_SYSTEM_PATH_1_0', '')
+diff --git a/tests/files/testfile b/tests/files/testfile
+new file mode 100644
+index 0000000..89954e0
+--- /dev/null
++++ b/tests/files/testfile
+@@ -0,0 +1,80 @@
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
++................................................................................
+-- 
+2.17.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
index ff92f63bac..dc3e8ffafd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
@@ -8,11 +8,7 @@ LICENSE = "LGPLv2+"
 
 DEPENDS = "glib-2.0 glib-2.0-native libcap libxml2 bison-native flex-native"
 
-inherit autotools pkgconfig gettext upstream-version-is-even gobject-introspection gtk-doc ptest
-
-# This way common/m4/introspection.m4 will come first
-# (it has a custom INTROSPECTION_INIT macro, and so must be used instead of our common introspection.m4 file)
-acpaths = "-I ${S}/common/m4 -I ${S}/m4"
+inherit meson pkgconfig gettext upstream-version-is-even gobject-introspection gtk-doc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
@@ -21,71 +17,56 @@ S = "${WORKDIR}/gstreamer-${PV}"
 
 SRC_URI = " \
     https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
-    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
-    file://gtk-doc-tweaks.patch \
     file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
-    file://add-a-target-to-compile-tests.patch \
-    file://run-ptest \
+    file://0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch \
+    file://0003-meson-Add-valgrind-feature.patch \
+    file://0004-meson-Add-option-for-installed-tests.patch \
 "
 SRC_URI[md5sum] = "c505fb818b36988daaa846e9e63eabe8"
 SRC_URI[sha256sum] = "02211c3447c4daa55919c5c0f43a82a6fbb51740d57fc3af0639d46f1cf4377d"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
-                   "
-
-PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
-PACKAGECONFIG[tests] = "--enable-tests,--disable-tests"
-PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind,"
-PACKAGECONFIG[gst-tracer-hooks] = "--enable-gst-tracer-hooks,--disable-gst-tracer-hooks,"
-PACKAGECONFIG[unwind] = "--with-unwind,--without-unwind,libunwind"
-PACKAGECONFIG[dw] = "--with-dw,--without-dw,elfutils"
-
-EXTRA_OECONF = " \
-    --disable-examples \
+                   tools"
+
+PACKAGECONFIG[debug] = "-Dgst_debug=true,-Dgst_debug=false"
+PACKAGECONFIG[tracer-hooks] = "-Dtracer_hooks=true,-Dtracer_hooks=false"
+PACKAGECONFIG[tests] = "-Dcheck=enabled -Dtests=enabled -Dinstalled-tests=true,-Dcheck=disabled -Dtests=disabled -Dinstalled-tests=false"
+PACKAGECONFIG[valgrind] = "-Dvalgrind=enabled,-Dvalgrind=disabled,valgrind,"
+PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
+PACKAGECONFIG[dw] = "-Dlibdw=enabled,-Dlibdw=disabled,elfutils"
+PACKAGECONFIG[bash-completion] = "-Dbash-completion=enabled,-Dbash-completion=disabled,bash-completion"
+PACKAGECONFIG[tools] = "-Dtools=enabled,-Dtools=disabled"
+
+# TODO: put this in a gettext.bbclass patch
+def gettext_oemeson(d):
+    if d.getVar('USE_NLS') == 'no':
+        return '-Dnls=disabled'
+    # Remove the NLS bits if USE_NLS is no or INHIBIT_DEFAULT_DEPS is set
+    if d.getVar('INHIBIT_DEFAULT_DEPS') and not oe.utils.inherits(d, 'cross-canadian'):
+        return '-Dnls=disabled'
+    return '-Dnls=enabled'
+
+EXTRA_OEMESON += " \
+    -Dexamples=disabled \
+    -Ddbghelp=disabled \
+    ${@gettext_oemeson(d)} \
 "
 
-CACHED_CONFIGUREVARS += "ac_cv_header_valgrind_valgrind_h=no"
+GTKDOC_MESON_OPTION = "gtk_doc"
+GTKDOC_MESON_ENABLE_FLAG = "enabled"
+GTKDOC_MESON_DISABLE_FLAG = "disabled"
 
-# musl libc generates warnings if <sys/poll.h> is included directly
-CACHED_CONFIGUREVARS += "ac_cv_header_sys_poll_h=no"
+GIR_MESON_ENABLE_FLAG = "enabled"
+GIR_MESON_DISABLE_FLAG = "disabled"
 
 PACKAGES += "${PN}-bash-completion"
 
+# Add the core element plugins to the main package
 FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
-FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la ${libdir}/gstreamer-1.0/*.a ${libdir}/gstreamer-1.0/include"
+FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.a ${libdir}/gstreamer-1.0/include"
 FILES_${PN}-bash-completion += "${datadir}/bash-completion/completions/ ${datadir}/bash-completion/helpers/gst*"
 FILES_${PN}-dbg += "${datadir}/gdb ${datadir}/gstreamer-1.0/gdb"
 
-RDEPENDS_${PN}-ptest += "make"
-
-delete_pkg_m4_file() {
-        # This m4 file is out of date and is missing PKG_CONFIG_SYSROOT_PATH tweaks which we need for introspection
-        rm "${S}/common/m4/pkg.m4" || true
-        rm -f "${S}/common/m4/gtk-doc.m4"
-}
-
-do_configure[prefuncs] += "delete_pkg_m4_file"
-
-do_compile_prepend() {
-        export GIR_EXTRA_LIBS_PATH="${B}/gst/.libs:${B}/libs/gst/base/.libs"
-}
-
-do_compile_ptest() {
-        oe_runmake build-checks
-}
-
-do_install_ptest() {
-        oe_runmake -C tests/check DESTDIR=${D}${PTEST_PATH} install-ptest
-        install -m 644 ${B}/tests/check/Makefile ${D}${PTEST_PATH}
-        install -m 755 ${S}/test-driver ${D}${PTEST_PATH}
-        sed -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
-            -e 's|${DEBUG_PREFIX_MAP}||g' \
-            -e 's:${HOSTTOOLS_DIR}/::g' \
-            -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
-            -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \-e 's/^Makefile:/_Makefile:/' \
-            -e 's/^srcdir = \(.*\)/srcdir = ./' -e 's/^top_srcdir = \(.*\)/top_srcdir = ./' \
-            -e 's/^builddir = \(.*\)/builddir = ./' -e 's/^top_builddir = \(.*\)/top_builddir = ./' \
-            -i ${D}${PTEST_PATH}/Makefile
-}
-
 CVE_PRODUCT = "gstreamer"
+
+require gstreamer1.0-ptest.inc
-- 
2.17.1


