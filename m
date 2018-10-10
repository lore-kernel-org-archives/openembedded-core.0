Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9BECD7477A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 15:45:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9AFi3IO031365
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Oct 2018 08:45:32 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 10 Oct 2018 08:44:59 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Oct 2018 23:03:00 +0800
Message-ID: <839dcb907591d7cd7c2515e1dc4f1d98ecff5de8.1539182705.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1539182705.git.kai.kang@windriver.com>
References: <cover.1539182705.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] gobject-introspection: fix multilib install file conflicts
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
X-List-Received-Date: Wed, 10 Oct 2018 15:45:51 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Fix multilib isntall file conflicts for gobject-introspection.
* use multilib_script.bbclass to handle ${bindir}/g-ir-annotation-tool
  and ${bindir}/g-ir-scanner
* add configure option to install .gir files to an alternative path and
  only set it when multilib is enabled

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...nfigure.ac-make-GIR_DIR-configurable.patch | 68 +++++++++++++++++
 ...02-g-ir-tools-respect-gir_dir_prefix.patch | 76 +++++++++++++++++++
 .../gobject-introspection_1.58.0.bb           | 11 ++-
 3 files changed, 152 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-configure.ac-make-GIR_DIR-configurable.patch
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-g-ir-tools-respect-gir_dir_prefix.patch

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-configure.ac-make-GIR_DIR-configurable.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-configure.ac-make-GIR_DIR-configurable.patch
new file mode 100644
index 0000000000..e0402f8f49
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-configure.ac-make-GIR_DIR-configurable.patch
@@ -0,0 +1,68 @@
+configure.ac: make GIR_DIR configurable
+
+Some .gir files such as GLib-2.0.gir are arch related which contain such
+as lengths of pointers that they are different for 64 and 32 bit target.
+It causes install file conflicts for multilib when intall
+gobject-introspection and lib32-gobject-introspection both.
+
+Add configure option 'with-gir-dir-prefix' for autotools to make .gir
+could be installed to a configured path such as ${libdir}. And update
+girdir in .pc files as well.
+
+Upstream-Status: Accepted [https://gitlab.gnome.org/GNOME/gobject-introspection/commit/3301c7e]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ configure.ac                              | 7 +++++--
+ gobject-introspection-1.0.pc.in           | 2 +-
+ gobject-introspection-no-export-1.0.pc.in | 2 +-
+ 3 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b4294c57..60506947 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -114,9 +114,12 @@ GIR_SUFFIX="gir-1.0"
+ AC_SUBST(GIR_SUFFIX)
+ AC_DEFINE_UNQUOTED(GIR_SUFFIX, "$GIR_SUFFIX", [Name of the gir directory])
+ 
+-GIR_DIR="$EXPANDED_DATADIR/$GIR_SUFFIX"
++AC_ARG_WITH([gir-dir-prefix],
++		[AS_HELP_STRING([--with-gir-dir-prefix], [Directory prefix for gir installation])],
++		[GIR_DIR_PREFIX="$withval"], [GIR_DIR_PREFIX="$EXPANDED_DATADIR"])
++GIR_DIR="$GIR_DIR_PREFIX/$GIR_SUFFIX"
+ AC_SUBST(GIR_DIR)
+-AC_DEFINE_UNQUOTED(GIR_DIR, "$GIR_DIR", [Director prefix for gir installation])
++AC_DEFINE_UNQUOTED(GIR_DIR, "$GIR_DIR", [Directory prefix for gir installation])
+ 
+ PKG_CHECK_MODULES(GLIB, [glib-2.0 >= 2.58.0])
+ 
+diff --git a/gobject-introspection-1.0.pc.in b/gobject-introspection-1.0.pc.in
+index a08b5d27..3409856c 100644
+--- a/gobject-introspection-1.0.pc.in
++++ b/gobject-introspection-1.0.pc.in
+@@ -10,7 +10,7 @@ g_ir_scanner=${bindir}/g-ir-scanner
+ g_ir_compiler=${bindir}/g-ir-compiler@EXEEXT@
+ g_ir_generate=${bindir}/g-ir-generate@EXEEXT@
+ gidatadir=${datadir}/gobject-introspection-1.0
+-girdir=${datadir}/gir-1.0
++girdir=@GIR_DIR@
+ typelibdir=${libdir}/girepository-1.0
+ 
+ Cflags: -I${includedir}/gobject-introspection-1.0 @FFI_PC_CFLAGS@
+diff --git a/gobject-introspection-no-export-1.0.pc.in b/gobject-introspection-no-export-1.0.pc.in
+index d214d22d..745aaade 100644
+--- a/gobject-introspection-no-export-1.0.pc.in
++++ b/gobject-introspection-no-export-1.0.pc.in
+@@ -9,7 +9,7 @@ includedir=@includedir@
+ g_ir_scanner=${bindir}/g-ir-scanner
+ g_ir_compiler=${bindir}/g-ir-compiler@EXEEXT@
+ g_ir_generate=${bindir}/g-ir-generate@EXEEXT@
+-girdir=${datadir}/gir-1.0
++girdir=@GIR_DIR@
+ typelibdir=${libdir}/girepository-1.0
+ 
+ Cflags: -I${includedir}/gobject-introspection-1.0 @FFI_PC_CFLAGS@
+-- 
+2.17.0
+
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-g-ir-tools-respect-gir_dir_prefix.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-g-ir-tools-respect-gir_dir_prefix.patch
new file mode 100644
index 0000000000..5e4176725c
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-g-ir-tools-respect-gir_dir_prefix.patch
@@ -0,0 +1,76 @@
+g-ir-tools: respect gir_dir_prefix
+
+Configure option gir_dir_prefix is used to configure install dir for
+.gir files, so add its value to include file search paths.
+
+Upstream-Status: Accepted [https://gitlab.gnome.org/GNOME/gobject-introspection/commit/3fe995a]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ Makefile-tools.am           |  2 +-
+ giscanner/transformer.py    |  1 +
+ tests/warn/warningtester.py |  1 +
+ tools/g-ir-tool-template.in | 10 ++++++++++
+ 6 files changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile-tools.am b/Makefile-tools.am
+index c70d9850..fcaf1e01 100644
+--- a/Makefile-tools.am
++++ b/Makefile-tools.am
+@@ -9,7 +9,7 @@ EXTRA_DIST += 				\
+ 	tools/g-ir-tool-template.in \
+ 	tools/meson.build
+ 
+-TOOL_SUBSTITUTIONS = -e s,@libdir\@,$(libdir), -e s,@datarootdir\@,$(datarootdir), -e s,@PYTHON_CMD\@,\/usr\/bin\/env\ $(PYTHON),
++TOOL_SUBSTITUTIONS = -e s,@libdir\@,$(libdir), -e s,@datarootdir\@,$(datarootdir), -e s,@PYTHON_CMD\@,\/usr\/bin\/env\ $(PYTHON), -e s,@GIR_DIR\@,$(GIR_DIR),g
+ 
+ g-ir-scanner: tools/g-ir-tool-template.in _giscanner.la Makefile
+ 	$(AM_V_GEN) sed $(TOOL_SUBSTITUTIONS) -e s,@TOOL_MODULE\@,scannermain, -e s,@TOOL_FUNCTION\@,scanner_main, $< > $@.tmp && mv $@.tmp $@
+diff --git a/giscanner/transformer.py b/giscanner/transformer.py
+index 335e229f..2c412339 100644
+--- a/giscanner/transformer.py
++++ b/giscanner/transformer.py
+@@ -184,6 +184,7 @@ None."""
+     def _get_gi_data_dirs(self):
+         data_dirs = utils.get_system_data_dirs()
+         data_dirs.append(DATADIR)
++        data_dirs.append(GIRDIR)
+         if os.name != 'nt':
+             # For backwards compatibility, was always unconditionally added to the list.
+             data_dirs.append('/usr/share')
+diff --git a/tests/warn/warningtester.py b/tests/warn/warningtester.py
+index f17c8889..be5aec13 100644
+--- a/tests/warn/warningtester.py
++++ b/tests/warn/warningtester.py
+@@ -18,6 +18,7 @@ sys.path.insert(0, path)
+ 
+ # Not correct, but enough to get the tests going uninstalled
+ builtins.__dict__['DATADIR'] = path
++builtins.__dict__['GIRDIR'] = ''
+ 
+ from giscanner.annotationparser import GtkDocCommentBlockParser
+ from giscanner.ast import Include, Namespace
+diff --git a/tools/g-ir-tool-template.in b/tools/g-ir-tool-template.in
+index ed33d16b..b9cf0911 100755
+--- a/tools/g-ir-tool-template.in
++++ b/tools/g-ir-tool-template.in
+@@ -60,6 +60,16 @@ if not os.path.isdir(os.path.join(datadir, 'gir-1.0')):
+ 
+ builtins.__dict__['DATADIR'] = datadir
+ 
++# Respect gir_dir_prefix for meson and autotools
++girdir = ''
++# for meson
++if '@gir_dir_prefix@' and not '@gir_dir_prefix@'.startswith('@'):
++    girdir = os.path.abspath(os.path.join(filedir, '..', '@gir_dir_prefix@'))
++# for autotools
++elif '@GIR_DIR@' and not '@GIR_DIR@'.startswith('@'):
++    girdir = os.path.dirname(os.path.abspath('@GIR_DIR@'))
++builtins.__dict__['GIRDIR'] = girdir
++
+ # Again, relative paths first so that the installation prefix is relocatable
+ pylibdir = os.path.abspath(os.path.join(filedir, '..', 'lib', 'gobject-introspection'))
+ 
+-- 
+2.17.0
+
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb
index a08ccf2970..65c446672b 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb
@@ -17,6 +17,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-$
            file://0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch \
            file://0001-giscanner-add-a-lib-dirs-envvar-option.patch \
            file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch \
+           file://0001-configure.ac-make-GIR_DIR-configurable.patch \
+           file://0002-g-ir-tools-respect-gir_dir_prefix.patch \
            "
 
 SRC_URI[md5sum] = "94fec875276262037bfcd51226db12fe"
@@ -24,7 +26,9 @@ SRC_URI[sha256sum] = "27c1590a32749de0a5481ce897772547043e94bccba4bc0a7edb3d8513
 
 SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even
+inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even multilib_script
+
+MULTILIB_SCRIPTS = "${PN}:${bindir}/g-ir-annotation-tool ${PN}:${bindir}/g-ir-scanner"
 
 DEPENDS_append = " libffi zlib glib-2.0 python3 flex-native bison-native autoconf-archive"
 
@@ -50,6 +54,7 @@ EXTRA_OECONF_class-target = " \
     --enable-gi-cross-wrapper=${B}/g-ir-scanner-qemuwrapper \
     --enable-gi-ldd-wrapper=${B}/g-ir-scanner-lddwrapper \
     ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection-data', '--disable-introspection-data', d)} \
+    ${@'--with-gir-dir-prefix=${libdir}' if d.getVar('MULTILIBS') else ''} \
 "
 
 # Need to ensure ld.so.conf exists so prelink-native works
@@ -94,7 +99,7 @@ EOF
 # This prevents g-ir-scanner from writing cache data to $HOME
 export GI_SCANNER_DISABLE_CACHE=1
 
-g-ir-scanner --lib-dirs-envvar=GIR_EXTRA_LIBS_PATH --use-binary-wrapper=${STAGING_BINDIR}/g-ir-scanner-qemuwrapper --use-ldd-wrapper=${STAGING_BINDIR}/g-ir-scanner-lddwrapper --add-include-path=${STAGING_DATADIR}/gir-1.0 "\$@"
+g-ir-scanner --lib-dirs-envvar=GIR_EXTRA_LIBS_PATH --use-binary-wrapper=${STAGING_BINDIR}/g-ir-scanner-qemuwrapper --use-ldd-wrapper=${STAGING_BINDIR}/g-ir-scanner-lddwrapper --add-include-path=${STAGING_DATADIR}/gir-1.0 --add-include-path=${STAGING_LIBDIR}/gir-1.0 "\$@"
 EOF
         chmod +x ${B}/g-ir-scanner-wrapper
 
@@ -178,7 +183,7 @@ FILES_${PN}_append = " ${libdir}/girepository-*/*.typelib"
 
 # .gir files go to dev package, as they're needed for developing (but not for running)
 # things that depends on introspection.
-FILES_${PN}-dev_append = " ${datadir}/gir-*/*.gir"
+FILES_${PN}-dev_append = " ${datadir}/gir-*/*.gir ${libdir}/gir-*/*.gir"
 FILES_${PN}-dev_append = " ${datadir}/gir-*/*.rnc"
 
 # These are used by gobject-based packages
-- 
2.18.0


