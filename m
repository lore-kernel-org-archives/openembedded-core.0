Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A9B7478242
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 14:54:51 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Oct 2017 07:54:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,366,1503385200"; d="scan'208";a="322496230"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2017 07:54:52 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Oct 2017 17:51:10 +0300
Message-Id: <329e798aa8d5dd5db330d55d6c867ae4545651d5.1507819700.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507819700.git.alexander.kanavin@linux.intel.com>
References: <cover.1507819700.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 1/7] meson: add a recipe and class from meta-oe
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
X-List-Received-Date: Thu, 12 Oct 2017 14:54:51 -0000

The original recipe has been provided and improved by:

Ross Burton <ross.burton@intel.com>
Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Adam C. Foltzer <acfoltzer@galois.com>
Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Linus Svensson <linussn@axis.com>

I have added a couple patches to fix up gtk-doc and
gobject-introspection in cross-compilation environments.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/meson.bbclass                         | 103 +++++++++++++++++++
 ...ix-issues-that-arise-when-cross-compiling.patch | 113 +++++++++++++++++++++
 ...rospection-determine-g-ir-scanner-and-g-i.patch |  41 ++++++++
 meta/recipes-devtools/meson/meson_0.43.0.bb        |  19 ++++
 4 files changed, 276 insertions(+)
 create mode 100644 meta/classes/meson.bbclass
 create mode 100644 meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
 create mode 100644 meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
 create mode 100644 meta/recipes-devtools/meson/meson_0.43.0.bb

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
new file mode 100644
index 00000000000..f6cf24c33a7
--- /dev/null
+++ b/meta/classes/meson.bbclass
@@ -0,0 +1,103 @@
+inherit python3native
+
+DEPENDS_append = " meson-native ninja-native"
+
+# As Meson enforces out-of-tree builds we can just use cleandirs
+B = "${WORKDIR}/build"
+do_configure[cleandirs] = "${B}"
+
+# Where the meson.build build configuration is
+MESON_SOURCEPATH = "${S}"
+
+# These variables in the environment override meson's *native* tools settings.
+# We have to unset them, so that meson doesn't pick up the cross tools and
+# use them for native builds.
+unset CC
+unset CXX
+unset AR
+
+def noprefix(var, d):
+    return d.getVar(var, True).replace(d.getVar('prefix', True) + '/', '', 1)
+
+MESONOPTS = " --prefix ${prefix} \
+              --bindir ${@noprefix('bindir', d)} \
+              --sbindir ${@noprefix('sbindir', d)} \
+              --datadir ${@noprefix('datadir', d)} \
+              --libdir ${@noprefix('libdir', d)} \
+              --libexecdir ${@noprefix('libexecdir', d)} \
+              --includedir ${@noprefix('includedir', d)} \
+              --mandir ${@noprefix('mandir', d)} \
+              --infodir ${@noprefix('infodir', d)} \
+              --sysconfdir ${sysconfdir} \
+              --localstatedir ${localstatedir} \
+              --sharedstatedir ${sharedstatedir}"
+
+MESON_C_ARGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+MESON_LINK_ARGS = "${MESON_C_ARGS} ${LDFLAGS}"
+
+MESON_HOST_ENDIAN = "${@bb.utils.contains('SITEINFO_ENDIANNESS', 'be', 'big', 'little', d)}"
+MESON_TARGET_ENDIAN = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'big', 'little', d)}"
+
+EXTRA_OEMESON += "${PACKAGECONFIG_CONFARGS}"
+
+MESON_CROSS_FILE = ""
+MESON_CROSS_FILE_class-target = "--cross-file ${WORKDIR}/meson.cross"
+
+def meson_array(var, d):
+    return "', '".join(d.getVar(var, True).split()).join(("'", "'"))
+
+addtask write_config before do_configure
+do_write_config[vardeps] += "MESON_C_ARGS TOOLCHAIN_OPTIONS"
+do_write_config() {
+    # This needs to be Py to split the args into single-element lists
+    cat >${WORKDIR}/meson.cross <<EOF
+[binaries]
+c = '${HOST_PREFIX}gcc'
+cpp = '${HOST_PREFIX}g++'
+ar = '${HOST_PREFIX}ar'
+ld = '${HOST_PREFIX}ld'
+strip = '${HOST_PREFIX}strip'
+readelf = '${HOST_PREFIX}readelf'
+pkgconfig = 'pkg-config'
+
+[properties]
+needs_exe_wrapper = true
+c_args = [${@meson_array('MESON_C_ARGS', d)}]
+c_link_args = [${@meson_array('MESON_LINK_ARGS', d)}]
+cpp_args = [${@meson_array('MESON_C_ARGS', d)}]
+cpp_link_args = [${@meson_array('MESON_LINK_ARGS', d)}]
+gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
+
+[host_machine]
+system = '${HOST_OS}'
+cpu_family = '${HOST_ARCH}'
+cpu = '${HOST_ARCH}'
+endian = '${MESON_HOST_ENDIAN}'
+
+[target_machine]
+system = '${TARGET_OS}'
+cpu_family = '${TARGET_ARCH}'
+cpu = '${TARGET_ARCH}'
+endian = '${MESON_TARGET_ENDIAN}'
+EOF
+}
+
+CONFIGURE_FILES = "meson.build"
+
+meson_do_configure() {
+    if ! meson ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}" ${MESON_CROSS_FILE} ${EXTRA_OEMESON}; then
+        cat ${B}/meson-logs/meson-log.txt
+        bbfatal_log meson failed
+    fi
+}
+
+do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
+meson_do_compile() {
+    ninja ${PARALLEL_MAKE}
+}
+
+meson_do_install() {
+    DESTDIR='${D}' ninja ${PARALLEL_MAKEINST} install
+}
+
+EXPORT_FUNCTIONS do_configure do_compile do_install
diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
new file mode 100644
index 00000000000..ca3d7095066
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
@@ -0,0 +1,113 @@
+From 15e054dce6ff11d2cb219c8c09a31b26f0e58b62 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 4 Aug 2017 16:16:41 +0300
+Subject: [PATCH 1/3] gtkdoc: fix issues that arise when cross-compiling
+
+Specifically:
+1) Make it possible to specify a wrapper for executing binaries
+(usually, some kind of target hardware emulator, such as qemu)
+2) Explicitly provide CC and LD via command line, as otherwise gtk-doc will
+try to guess them, incorrectly.
+3) If things break down, print the full command with arguments,
+not just the binary name.
+4) Correctly determine the compiler/linker executables and cross-options when cross-compiling
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ mesonbuild/modules/gnome.py        | 18 +++++++++++++++---
+ mesonbuild/scripts/gtkdochelper.py |  9 +++++++--
+ 2 files changed, 22 insertions(+), 5 deletions(-)
+
+diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
+index 6ec7040..4cfaefd 100644
+--- a/mesonbuild/modules/gnome.py
++++ b/mesonbuild/modules/gnome.py
+@@ -713,6 +713,10 @@ class GnomeModule(ExtensionModule):
+                 '--mode=' + mode]
+         if namespace:
+             args.append('--namespace=' + namespace)
++        gtkdoc_exe_wrapper = state.environment.cross_info.config["properties"].get('gtkdoc_exe_wrapper', None)
++        if gtkdoc_exe_wrapper is not None:
++            args.append('--gtkdoc-exe-wrapper=' + gtkdoc_exe_wrapper)
++
+         args += self._unpack_args('--htmlargs=', 'html_args', kwargs)
+         args += self._unpack_args('--scanargs=', 'scan_args', kwargs)
+         args += self._unpack_args('--scanobjsargs=', 'scanobjs_args', kwargs)
+@@ -741,14 +745,22 @@ class GnomeModule(ExtensionModule):
+                 raise MesonException(
+                     'Gir include dirs should be include_directories().')
+         cflags.update(get_include_args(inc_dirs))
++
++        cross_c_args = " ".join(state.environment.cross_info.config["properties"].get('c_args', ""))
++        cross_link_args = " ".join(state.environment.cross_info.config["properties"].get('c_link_args', ""))
++
+         if cflags:
+-            args += ['--cflags=%s' % ' '.join(cflags)]
++            args += ['--cflags=%s %s' % (cross_c_args,' '.join(cflags))]
+         if ldflags:
+-            args += ['--ldflags=%s' % ' '.join(ldflags)]
++            args += ['--ldflags=%s %s' % (cross_link_args, ' '.join(ldflags))]
+         compiler = state.environment.coredata.compilers.get('c')
+-        if compiler:
++        cross_compiler = state.environment.coredata.cross_compilers.get('c')
++        if compiler and not state.environment.is_cross_build():
+             args += ['--cc=%s' % ' '.join(compiler.get_exelist())]
+             args += ['--ld=%s' % ' '.join(compiler.get_linker_exelist())]
++        elif cross_compiler and state.environment.is_cross_build():
++            args += ['--cc=%s' % ' '.join(cross_compiler.get_exelist())]
++            args += ['--ld=%s' % ' '.join(cross_compiler.get_linker_exelist())]
+ 
+         return args
+ 
+diff --git a/mesonbuild/scripts/gtkdochelper.py b/mesonbuild/scripts/gtkdochelper.py
+index a2cbf5a..19331bd 100644
+--- a/mesonbuild/scripts/gtkdochelper.py
++++ b/mesonbuild/scripts/gtkdochelper.py
+@@ -44,13 +44,14 @@ parser.add_argument('--ignore-headers', dest='ignore_headers', default='')
+ parser.add_argument('--namespace', dest='namespace', default='')
+ parser.add_argument('--mode', dest='mode', default='')
+ parser.add_argument('--installdir', dest='install_dir')
++parser.add_argument('--gtkdoc-exe-wrapper', dest='gtkdoc_exe_wrapper')
+ 
+ def gtkdoc_run_check(cmd, cwd):
+     # Put stderr into stdout since we want to print it out anyway.
+     # This preserves the order of messages.
+     p, out = Popen_safe(cmd, cwd=cwd, stderr=subprocess.STDOUT)[0:2]
+     if p.returncode != 0:
+-        err_msg = ["{!r} failed with status {:d}".format(cmd[0], p.returncode)]
++        err_msg = ["{!r} failed with status {:d}".format(cmd, p.returncode)]
+         if out:
+             err_msg.append(out)
+         raise MesonException('\n'.join(err_msg))
+@@ -58,7 +59,7 @@ def gtkdoc_run_check(cmd, cwd):
+ def build_gtkdoc(source_root, build_root, doc_subdir, src_subdirs,
+                  main_file, module,
+                  html_args, scan_args, fixxref_args, mkdb_args,
+-                 gobject_typesfile, scanobjs_args, ld, cc, ldflags, cflags,
++                 gobject_typesfile, scanobjs_args, gtkdoc_exe_wrapper, ld, cc, ldflags, cflags,
+                  html_assets, content_files, ignore_headers, namespace,
+                  expand_content_files, mode):
+     print("Building documentation for %s" % module)
+@@ -111,6 +112,9 @@ def build_gtkdoc(source_root, build_root, doc_subdir, src_subdirs,
+     if gobject_typesfile:
+         scanobjs_cmd = ['gtkdoc-scangobj'] + scanobjs_args + ['--types=' + gobject_typesfile,
+                                                               '--module=' + module,
++                                                              '--run=' + gtkdoc_exe_wrapper,
++                                                              '--cc=' + cc,
++                                                              '--ld=' + ld,
+                                                               '--cflags=' + cflags,
+                                                               '--ldflags=' + ldflags]
+ 
+@@ -206,6 +210,7 @@ def run(args):
+         mkdbargs,
+         options.gobject_typesfile,
+         scanobjsargs,
++        options.gtkdoc_exe_wrapper,
+         options.ld,
+         options.cc,
+         options.ldflags,
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch b/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
new file mode 100644
index 00000000000..f00b9b2a2d1
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
@@ -0,0 +1,41 @@
+From 84cb251a33190ec82faeaad321518af4b309c55e Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 4 Aug 2017 16:18:47 +0300
+Subject: [PATCH 2/2] gobject-introspection: determine g-ir-scanner and
+ g-ir-compiler paths from pkgconfig
+
+Do not hardcode the name of those binaries; gobject-introspection
+provides them via pkgconfig, and they can be set to something else
+(for example when cross-compiling).
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ mesonbuild/modules/gnome.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
+index ba7e4cd..00472af 100644
+--- a/mesonbuild/modules/gnome.py
++++ b/mesonbuild/modules/gnome.py
+@@ -380,8 +380,6 @@ class GnomeModule(ExtensionModule):
+             raise MesonException('Gir takes one argument')
+         if kwargs.get('install_dir'):
+             raise MesonException('install_dir is not supported with generate_gir(), see "install_dir_gir" and "install_dir_typelib"')
+-        giscanner = find_program('g-ir-scanner', 'Gir')
+-        gicompiler = find_program('g-ir-compiler', 'Gir')
+         girtarget = args[0]
+         while hasattr(girtarget, 'held_object'):
+             girtarget = girtarget.held_object
+@@ -392,6 +390,8 @@ class GnomeModule(ExtensionModule):
+                 self.gir_dep = PkgConfigDependency('gobject-introspection-1.0',
+                                                    state.environment,
+                                                    {'native': True})
++            giscanner = os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_scanner')
++            gicompiler = os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_compiler')
+             pkgargs = self.gir_dep.get_compile_args()
+         except Exception:
+             raise MesonException('gobject-introspection dependency was not found, gir cannot be generated.')
+-- 
+2.13.2
+
diff --git a/meta/recipes-devtools/meson/meson_0.43.0.bb b/meta/recipes-devtools/meson/meson_0.43.0.bb
new file mode 100644
index 00000000000..bbb48d9197c
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson_0.43.0.bb
@@ -0,0 +1,19 @@
+HOMEPAGE = "http://mesonbuild.com"
+SUMMARY = "A high performance build system"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/${BP}.tar.gz \
+           file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch \
+           file://0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch \
+           "
+SRC_URI[md5sum] = "b0d389cc5937928c2f5114656dc5a99a"
+SRC_URI[sha256sum] = "c513eca90e0d70bf14cd1eaafea2fa91cf40a73326a7ff61f08a005048057340"
+UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
+
+inherit setuptools3
+
+RDEPENDS_${PN} = "ninja python3-core python3-modules"
+
+BBCLASSEXTEND = "native"
-- 
2.14.1


