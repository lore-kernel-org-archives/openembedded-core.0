Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6718CAC5B8
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 19:52:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.466.1758916329296720107
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 12:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C134F168F
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 12:52:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 813C23F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 12:52:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meson: upgrade to 1.9.1
Date: Fri, 26 Sep 2025 20:52:04 +0100
Message-ID: <20250926195204.2323521-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 19:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224091

Changes in this release:

751b09390 Bump versions to 1.9.1 for release
d0abb2133 Boost python must have a library component.
e6732c220 Check for header only Boost libraries.
08429813b get_llvm_tool_names: add llvm 21
f3b383217 docs: fix pre-1.8 order for per-subproject options
a2d395498 Revert "test cases: do not pass global option on command line"
d0f82544e Revert "tests: skip test common/223 in the -Ddefault_library=3D=
... jobs"
2abdb2f0b options: put back in place 1.7 ordering of opt=3Dvalue vs subp:=
opt=3Dvalue
83cbc65c2 Fix not passing user option args to scan-build build
e746db0b4 Document internal dep support in pkgconfig.generate `requires` =
arg
f6ab732b7 msetup: not-found subprojects do not have known options
5d21e653a utils: make .wraplock optional
d1e219cb8 Fix Cygwin test failure.
0fc77e2d7 coredata: do not write None to cmd_line.txt
533ba5cb3 options: do not raise exception for unknown options in -U comma=
nd
ae822d1d4 test cases/common/32 has header: disable undef with libcxx
c58f0d951 rustdoc: skip --crate-type option
b8e0e9d3d fix transient failure on rust/12 bindgen
75cf757b7 coredata: check for per-subproject compiler and linker argument=
s
a747c4ea8 coredata: check for per-subproject compiler options

Drop the two backported patches.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...heck-for-header-only-Boost-libraries.patch |  58 -------
 .../0001-Make-CPU-family-warnings-fatal.patch |   6 +-
 ...-not-manipulate-the-environment-when.patch |   8 +-
 ...python-must-have-a-library-component.patch |  34 ----
 ...pport-building-allarch-recipes-again.patch |   2 +-
 meta/recipes-devtools/meson/meson_1.9.0.bb    | 161 ------------------
 6 files changed, 8 insertions(+), 261 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/0001-Check-for-head=
er-only-Boost-libraries.patch
 delete mode 100644 meta/recipes-devtools/meson/meson/0002-Boost-python-m=
ust-have-a-library-component.patch
 delete mode 100644 meta/recipes-devtools/meson/meson_1.9.0.bb

diff --git a/meta/recipes-devtools/meson/meson/0001-Check-for-header-only=
-Boost-libraries.patch b/meta/recipes-devtools/meson/meson/0001-Check-for=
-header-only-Boost-libraries.patch
deleted file mode 100644
index 3d2810aff92..00000000000
--- a/meta/recipes-devtools/meson/meson/0001-Check-for-header-only-Boost-=
libraries.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From f16897135c394d36656da0078613864076300e07 Mon Sep 17 00:00:00 2001
-From: Jussi Pakkanen <jussi.pakkanen@mailbox.org>
-Date: Fri, 29 Aug 2025 14:57:06 +0300
-Subject: [PATCH] Check for header only Boost libraries.
-
-Upstream-Status: Backport [https://github.com/mesonbuild/meson/commit/6a=
9a81619c139d0f6ae3d265f7366e61615d92a1]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- mesonbuild/dependencies/boost.py | 22 ++++++++++++++++++++--
- 1 file changed, 20 insertions(+), 2 deletions(-)
-
-diff --git a/mesonbuild/dependencies/boost.py b/mesonbuild/dependencies/=
boost.py
-index 662f985..e153e8f 100644
---- a/mesonbuild/dependencies/boost.py
-+++ b/mesonbuild/dependencies/boost.py
-@@ -452,6 +452,10 @@ class BoostDependency(SystemDependency):
-                 break
-         libs =3D sorted(set(libs))
-=20
-+        any_libs_found =3D len(libs) > 0
-+        if not any_libs_found:
-+            return False
-+
-         modules =3D ['boost_' + x for x in self.modules]
-         for inc in inc_dirs:
-             mlog.debug(f'  - found boost {inc.version} include dir: {in=
c.path}')
-@@ -462,7 +466,7 @@ class BoostDependency(SystemDependency):
-                 mlog.debug(f'    - {j}')
-=20
-             #   3. Select the libraries matching the requested modules
--            not_found: T.List[str] =3D []
-+            not_found_as_libs: T.List[str] =3D []
-             selected_modules: T.List[BoostLibraryFile] =3D []
-             for mod in modules:
-                 found =3D False
-@@ -472,7 +476,21 @@ class BoostDependency(SystemDependency):
-                         found =3D True
-                         break
-                 if not found:
--                    not_found +=3D [mod]
-+                    not_found_as_libs +=3D [mod]
-+
-+            # If a lib is not found, but an include directory exists,
-+            # assume it is a header only module.
-+            not_found: T.List[str] =3D []
-+            for boost_modulename in not_found_as_libs:
-+                assert boost_modulename.startswith('boost_')
-+                include_subdir =3D boost_modulename.replace('boost_', '=
boost/', 1)
-+                headerdir_found =3D False
-+                for inc_dir in inc_dirs:
-+                    if (inc_dir.path / include_subdir).is_dir():
-+                        headerdir_found =3D True
-+                        break
-+                if not headerdir_found:
-+                    not_found.append(boost_modulename)
-=20
-             # log the result
-             mlog.debug('  - found:')
diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warni=
ngs-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-=
warnings-fatal.patch
index 98ca08c2ca9..46754bf5084 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fat=
al.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fat=
al.patch
@@ -1,4 +1,4 @@
-From c01e5e29953e0302988f2d60adc50ebfa0e5d670 Mon Sep 17 00:00:00 2001
+From 9854e557b77612afb095e9868bb7cba12bc1b1cb Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -26,10 +26,10 @@ index 43fad0c..27be871 100644
          endian =3D literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 2a9cf16..6b2bd6b 100644
+index 489ef50..1567efa 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -436,10 +436,8 @@ def detect_cpu_family(compilers: CompilersDict) -> =
str:
+@@ -438,10 +438,8 @@ def detect_cpu_family(compilers: CompilersDict) -> =
str:
          if compilers and not any_compiler_has_define(compilers, '__mips=
64'):
              trial =3D 'mips'
 =20
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-=
manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson=
/0001-python-module-do-not-manipulate-the-environment-when.patch
index f6544470132..c1b82935931 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipul=
ate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipul=
ate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From 6c3734f533ee7ad493188c8fc17bb1c65b65f0bd Mon Sep 17 00:00:00 2001
+From c0ffc404415a52bfa3358e32ecd17f064a241b38 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when c=
alling
@@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
  1 file changed, 1 insertion(+), 5 deletions(-)
=20
 diff --git a/mesonbuild/dependencies/python.py b/mesonbuild/dependencies=
/python.py
-index ab040b5..a34b271 100644
+index b028d9f..3d7cd9b 100644
 --- a/mesonbuild/dependencies/python.py
 +++ b/mesonbuild/dependencies/python.py
-@@ -412,9 +412,6 @@ def python_factory(env: 'Environment', for_machine: =
'MachineChoice',
+@@ -418,9 +418,6 @@ def python_factory(env: 'Environment', for_machine: =
'MachineChoice',
                      empty.name =3D 'python'
                      return empty
 =20
@@ -25,7 +25,7 @@ index ab040b5..a34b271 100644
                  try:
                      return PythonPkgConfigDependency(name, env, kwargs,=
 installation, True)
                  finally:
-@@ -423,8 +420,7 @@ def python_factory(env: 'Environment', for_machine: =
'MachineChoice',
+@@ -429,8 +426,7 @@ def python_factory(env: 'Environment', for_machine: =
'MachineChoice',
                              os.environ[name] =3D value
                          elif name in os.environ:
                              del os.environ[name]
diff --git a/meta/recipes-devtools/meson/meson/0002-Boost-python-must-hav=
e-a-library-component.patch b/meta/recipes-devtools/meson/meson/0002-Boos=
t-python-must-have-a-library-component.patch
deleted file mode 100644
index c03c47534e9..00000000000
--- a/meta/recipes-devtools/meson/meson/0002-Boost-python-must-have-a-lib=
rary-component.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d0644d543f4df39cf2ba14337000ee019cb20b6d Mon Sep 17 00:00:00 2001
-From: Jussi Pakkanen <jussi.pakkanen@mailbox.org>
-Date: Fri, 29 Aug 2025 22:51:48 +0300
-Subject: [PATCH] Boost python must have a library component.
-
-Upstream-Status: Backport [https://github.com/mesonbuild/meson/commit/80=
917ca8c1a5af499cc6e004ad5d5a050da9045e]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- mesonbuild/dependencies/boost.py | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/mesonbuild/dependencies/boost.py b/mesonbuild/dependencies/=
boost.py
-index e153e8f..fdb35d4 100644
---- a/mesonbuild/dependencies/boost.py
-+++ b/mesonbuild/dependencies/boost.py
-@@ -440,6 +440,8 @@ class BoostDependency(SystemDependency):
-         mlog.debug('  - potential library dirs: {}'.format([x.as_posix(=
) for x in lib_dirs]))
-         mlog.debug('  - potential include dirs: {}'.format([x.path.as_p=
osix() for x in inc_dirs]))
-=20
-+        must_have_library =3D ['boost_python']
-+
-         #   2. Find all boost libraries
-         libs: T.List[BoostLibraryFile] =3D []
-         for i in lib_dirs:
-@@ -483,6 +485,9 @@ class BoostDependency(SystemDependency):
-             not_found: T.List[str] =3D []
-             for boost_modulename in not_found_as_libs:
-                 assert boost_modulename.startswith('boost_')
-+                if boost_modulename in must_have_library:
-+                    not_found.append(boost_modulename)
-+                    continue
-                 include_subdir =3D boost_modulename.replace('boost_', '=
boost/', 1)
-                 headerdir_found =3D False
-                 for inc_dir in inc_dirs:
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-alla=
rch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-=
building-allarch-recipes-again.patch
index ed35498c306..2e294b5b7f2 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-rec=
ipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-rec=
ipes-again.patch
@@ -1,4 +1,4 @@
-From e123195e5990c3071385defd96dfab1211e98c08 Mon Sep 17 00:00:00 2001
+From fac479734d7f6e04eba71c8193623465d9eb0228 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
diff --git a/meta/recipes-devtools/meson/meson_1.9.0.bb b/meta/recipes-de=
vtools/meson/meson_1.9.0.bb
deleted file mode 100644
index 10ac7d9697e..00000000000
--- a/meta/recipes-devtools/meson/meson_1.9.0.bb
+++ /dev/null
@@ -1,161 +0,0 @@
-HOMEPAGE =3D "http://mesonbuild.com"
-SUMMARY =3D "A high performance build system"
-DESCRIPTION =3D "Meson is a build system designed to increase programmer=
 \
-productivity. It does this by providing a fast, simple and easy to use \
-interface for modern software development tools and practices."
-
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
-
-GITHUB_BASE_URI =3D "https://github.com/mesonbuild/meson/releases/"
-SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
-           file://meson-setup.py \
-           file://meson-wrapper \
-           file://0001-python-module-do-not-manipulate-the-environment-w=
hen.patch \
-           file://0001-Make-CPU-family-warnings-fatal.patch \
-           file://0002-Support-building-allarch-recipes-again.patch \
-           file://0001-Check-for-header-only-Boost-libraries.patch \
-           file://0002-Boost-python-must-have-a-library-component.patch =
\
-           "
-SRC_URI[sha256sum] =3D "cd27277649b5ed50d19875031de516e270b22e890d9db65e=
d9af57d18ebc498d"
-UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)$"
-
-inherit python_setuptools_build_meta github-releases
-
-RDEPENDS:${PN} =3D "ninja python3-modules python3-pkg-resources"
-
-FILES:${PN} +=3D "${datadir}/polkit-1"
-
-BBCLASSEXTEND =3D "native nativesdk"
-
-inherit meson-routines
-
-# The cross file logic is similar but not identical to that in meson.bbc=
lass,
-# since it's generating for an SDK rather than a cross-compile. Importan=
t
-# differences are:
-# - We can't set vars like CC, CXX, etc. yet because they will be filled=
 in with
-#   real paths by meson-setup.sh when the SDK is extracted.
-# - Some overrides aren't needed, since the SDK injects paths that take =
care of
-#   them.
-def var_list2str(var, d):
-    items =3D d.getVar(var).split()
-    return repr(items[0]) if len(items) =3D=3D 1 else ', '.join(repr(s) =
for s in items)
-
-def generate_native_link_template(d):
-    val =3D ['-L@{OECORE_NATIVE_SYSROOT}${libdir_native}',
-           '-L@{OECORE_NATIVE_SYSROOT}${base_libdir_native}',
-           '-Wl,-rpath-link,@{OECORE_NATIVE_SYSROOT}${libdir_native}',
-           '-Wl,-rpath-link,@{OECORE_NATIVE_SYSROOT}${base_libdir_native=
}',
-           '-Wl,--allow-shlib-undefined'
-        ]
-    build_arch =3D d.getVar('BUILD_ARCH')
-    if 'x86_64' in build_arch:
-        loader =3D 'ld-linux-x86-64.so.2'
-    elif 'i686' in build_arch:
-        loader =3D 'ld-linux.so.2'
-    elif 'aarch64' in build_arch:
-        loader =3D 'ld-linux-aarch64.so.1'
-    elif 'ppc64le' in build_arch:
-        loader =3D 'ld64.so.2'
-    elif 'loongarch64' in build_arch:
-        loader =3D 'ld-linux-loongarch-lp64d.so.1'
-    elif 'riscv64' in build_arch:
-        loader =3D 'ld-linux-riscv64-lp64d.so.1'
-
-    if loader:
-        val +=3D ['-Wl,--dynamic-linker=3D@{OECORE_NATIVE_SYSROOT}${base=
_libdir_native}/' + loader]
-
-    return repr(val)
-
-install_native_template() {
-    install -d ${D}${datadir}/meson
-
-    cat >${D}${datadir}/meson/meson.native.template <<EOF
-[binaries]
-c =3D ${@meson_array('BUILD_CC', d)}
-cpp =3D ${@meson_array('BUILD_CXX', d)}
-ar =3D ${@meson_array('BUILD_AR', d)}
-nm =3D ${@meson_array('BUILD_NM', d)}
-strip =3D ${@meson_array('BUILD_STRIP', d)}
-readelf =3D ${@meson_array('BUILD_READELF', d)}
-pkg-config =3D 'pkg-config-native'
-
-[built-in options]
-c_args =3D ['-isystem@{OECORE_NATIVE_SYSROOT}${includedir_native}' , ${@=
var_list2str('BUILD_OPTIMIZATION', d)}]
-c_link_args =3D ${@generate_native_link_template(d)}
-cpp_args =3D ['-isystem@{OECORE_NATIVE_SYSROOT}${includedir_native}' , $=
{@var_list2str('BUILD_OPTIMIZATION', d)}]
-cpp_link_args =3D ${@generate_native_link_template(d)}
-EOF
-}
-
-install_nativesdk_template() {
-    install -d ${D}${datadir}/meson
-
-    cat >${D}${datadir}/meson/meson.native.template <<EOF
-[binaries]
-pkg-config =3D 'pkg-config-native'
-
-[built-in options]
-c_args =3D ['-isystem@{OECORE_NATIVE_SYSROOT}${includedir_native}']
-c_link_args =3D ['-L@{OECORE_NATIVE_SYSROOT}${libdir_native}', '-L@{OECO=
RE_NATIVE_SYSROOT}${base_libdir_native}',]
-cpp_args =3D ['-isystem@{OECORE_NATIVE_SYSROOT}${includedir_native}']
-cpp_link_args =3D ['-L@{OECORE_NATIVE_SYSROOT}${libdir_native}', '-L@{OE=
CORE_NATIVE_SYSROOT}${base_libdir_native}',]
-EOF
-}
-
-install_cross_template() {
-    install -d ${D}${datadir}/meson
-
-    cat >${D}${datadir}/meson/meson.cross.template <<EOF
-[binaries]
-c =3D @CC
-cpp =3D @CXX
-ar =3D @AR
-nm =3D @NM
-strip =3D @STRIP
-pkg-config =3D 'pkg-config'
-
-[built-in options]
-c_args =3D @CFLAGS
-c_link_args =3D @LDFLAGS
-cpp_args =3D @CPPFLAGS
-cpp_link_args =3D @LDFLAGS
-
-[properties]
-needs_exe_wrapper =3D true
-sys_root =3D @OECORE_TARGET_SYSROOT
-
-[host_machine]
-system =3D @OECORE_MESON_HOST_SYSTEM
-cpu_family =3D @OECORE_MESON_HOST_CPU_FAMILY
-cpu =3D @OECORE_MESON_HOST_CPU
-endian =3D @OECORE_MESON_HOST_ENDIAN
-EOF
-}
-
-do_install:append:class-nativesdk() {
-    install_nativesdk_template
-    install_cross_template
-
-    install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
-    install -m 0755 ${UNPACKDIR}/meson-setup.py ${D}${SDKPATHNATIVE}/pos=
t-relocate-setup.d/
-
-    # We need to wrap the real meson with a thin env setup wrapper.
-    mv ${D}${bindir}/meson ${D}${bindir}/meson.real
-    install -m 0755 ${UNPACKDIR}/meson-wrapper ${D}${bindir}/meson
-}
-
-FILES:${PN}:append:class-nativesdk =3D "${datadir}/meson ${SDKPATHNATIVE=
}"
-
-do_install:append:class-native() {
-    install_native_template
-    install_cross_template
-
-    install -d ${D}${datadir}/post-relocate-setup.d
-    install -m 0755 ${UNPACKDIR}/meson-setup.py ${D}${datadir}/post-relo=
cate-setup.d/
-
-    # We need to wrap the real meson with a thin wrapper that substitues=
 native/cross files
-    # when running in a direct SDK environment.
-    mv ${D}${bindir}/meson ${D}${bindir}/meson.real
-    install -m 0755 ${UNPACKDIR}/meson-wrapper ${D}${bindir}/meson
-}
--=20
2.43.0


