Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A28C3ABD8
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 16:10:35 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.32753.1747584626217278526
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 09:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout07.t-online.de (Postfix) with SMTP id EB2F1F9D
	for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 18:10:23 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.160.15]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uGgaj-1CsWhd0; Sun, 18 May 2025 18:10:21 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 1/2] mesa: update 25.0.5 -> 25.1.0
Date: Sun, 18 May 2025 18:10:09 +0200
Message-ID: <20250518161010.1879511-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1747584621-9DFF94CC-D8B11E96/10/3626336762 SUSPECT URL
X-TOI-MSGID: 1f439576-0bd4-4d29-b362-6c15be5ce110
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 16:10:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216779

- drop two merged patches
- clover frontend is always compiled, even if not enabled
  clover is deprecated and was removed in master branch
  add a patch to fix that
- install gbm_backend_abi.h

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-clover-Don-t-include-libclc-headers.patch | 143 ------------------
 .../0001-dont-build-clover-frontend.patch     |  29 ++++
 ...o-not-use-LLVM_LIBRARY_DIR-for-FALLB.patch |  34 -----
 ...option-to-force-inclusion-of-OpenCL-.patch |  57 -------
 meta/recipes-graphics/mesa/mesa.inc           |  10 +-
 5 files changed, 33 insertions(+), 240 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-clover-Don-t-in=
clude-libclc-headers.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0001-dont-build-clov=
er-frontend.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-gallium-clover-=
Do-not-use-LLVM_LIBRARY_DIR-for-FALLB.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-mesa-clc-add-an=
-option-to-force-inclusion-of-OpenCL-.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-clover-Don-t-include-l=
ibclc-headers.patch b/meta/recipes-graphics/mesa/files/0001-clover-Don-t-=
include-libclc-headers.patch
deleted file mode 100644
index 0f9a01d823..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-clover-Don-t-include-libclc-h=
eaders.patch
+++ /dev/null
@@ -1,143 +0,0 @@
-From e94da9ccbc099468df752227716880efef66411b Mon Sep 17 00:00:00 2001
-From: Nikita Popov <npopov@redhat.com>
-Date: Thu, 27 Feb 2025 15:44:27 +0100
-Subject: [PATCH] clover: Don't include libclc headers
-
-Per https://github.com/llvm/llvm-project/issues/119967 these
-headers are internal implementation details of libclc and were
-never supposed to be installed. They are not available anymore
-since LLVM 20. Instead opencl-c.h should be used.
-
-There already ise a code path for including opencl-c.h, so always
-use it.
-
-This didn't work for me out of the box, because the build system
-currently hardcodes the clang resource directory, which is incorrect
-for Fedora at least. Fix this by using GetResourcePath +
-CLANG_RESOURCE_DIR provided by clang instead. This is basically
-the same as what is done in clc_helper.c
-
-I've still retained the old behavior as a fallback just in case
-(e.g. if clang is linked statically?)
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/33805/]
-Reviewed-by: Karol Herbst <kherbst@redhat.com>
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3380=
5>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../frontends/clover/llvm/invocation.cpp      | 53 +++++++++++++------
- src/gallium/frontends/clover/meson.build      |  5 +-
- 2 files changed, 39 insertions(+), 19 deletions(-)
-
-diff --git a/src/gallium/frontends/clover/llvm/invocation.cpp b/src/gall=
ium/frontends/clover/llvm/invocation.cpp
-index 3cbb05b..ca030b4 100644
---- a/src/gallium/frontends/clover/llvm/invocation.cpp
-+++ b/src/gallium/frontends/clover/llvm/invocation.cpp
-@@ -24,6 +24,8 @@
- // OTHER DEALINGS IN THE SOFTWARE.
- //
-=20
-+#include <dlfcn.h>
-+
- #include <llvm/IR/DiagnosticPrinter.h>
- #include <llvm/IR/DiagnosticInfo.h>
- #include <llvm/IR/LLVMContext.h>
-@@ -39,6 +41,8 @@
- #include <clang/Frontend/TextDiagnosticBuffer.h>
- #include <clang/Frontend/TextDiagnosticPrinter.h>
- #include <clang/Basic/TargetInfo.h>
-+#include <clang/Config/config.h>
-+#include <clang/Driver/Driver.h>
-=20
- #if LLVM_VERSION_MAJOR >=3D 20
- #include <llvm/Support/VirtualFileSystem.h>
-@@ -323,6 +327,30 @@ namespace {
-       return c;
-    }
-=20
-+   std::string getResourceDirectory() {
-+      Dl_info info;
-+      if (dladdr((void *)clang::CompilerInvocation::CreateFromArgs, &in=
fo) =3D=3D 0) {
-+         return FALLBACK_CLANG_RESOURCE_DIR;
-+      }
-+
-+      char *libclang_path =3D realpath(info.dli_fname, NULL);
-+      if (libclang_path =3D=3D nullptr) {
-+         return FALLBACK_CLANG_RESOURCE_DIR;
-+      }
-+
-+      // GetResourcePath is a way to retrieve the actual libclang resou=
rce dir based on a given
-+      // binary or library.
-+      std::string clang_resource_dir =3D
-+#if LLVM_VERSION_MAJOR >=3D 20
-+         clang::driver::Driver::GetResourcesPath(std::string(libclang_p=
ath));
-+#else
-+         clang::driver::Driver::GetResourcesPath(std::string(libclang_p=
ath), CLANG_RESOURCE_DIR);
-+#endif
-+      free(libclang_path);
-+
-+      return clang_resource_dir;
-+   }
-+
-    std::unique_ptr<Module>
-    compile(LLVMContext &ctx, clang::CompilerInstance &c,
-            const std::string &name, const std::string &source,
-@@ -331,25 +359,18 @@ namespace {
-       c.getFrontendOpts().ProgramAction =3D clang::frontend::EmitLLVMOn=
ly;
-       c.getHeaderSearchOpts().UseBuiltinIncludes =3D true;
-       c.getHeaderSearchOpts().UseStandardSystemIncludes =3D true;
--      c.getHeaderSearchOpts().ResourceDir =3D CLANG_RESOURCE_DIR;
-=20
--      if (use_libclc) {
--         // Add libclc generic search path
--         c.getHeaderSearchOpts().AddPath(LIBCLC_INCLUDEDIR,
--                                         clang::frontend::Angled,
--                                         false, false);
-+      std::string clang_resource_dir =3D getResourceDirectory();
-+      c.getHeaderSearchOpts().ResourceDir =3D clang_resource_dir;
-=20
--         // Add libclc include
--         c.getPreprocessorOpts().Includes.push_back("clc/clc.h");
--      } else {
--         // Add opencl-c generic search path
--         c.getHeaderSearchOpts().AddPath(CLANG_RESOURCE_DIR,
--                                         clang::frontend::Angled,
--                                         false, false);
-+      // Add opencl-c generic search path
-+      std::string clang_include_path =3D clang_resource_dir + "/include=
";
-+      c.getHeaderSearchOpts().AddPath(clang_include_path,
-+                                      clang::frontend::Angled,
-+                                      false, false);
-=20
--         // Add opencl include
--         c.getPreprocessorOpts().Includes.push_back("opencl-c.h");
--      }
-+      // Add opencl include
-+      c.getPreprocessorOpts().Includes.push_back("opencl-c.h");
-=20
-       // Add definition for the OpenCL version
-       const auto dev_version =3D dev.device_version();
-diff --git a/src/gallium/frontends/clover/meson.build b/src/gallium/fron=
tends/clover/meson.build
-index e569b86..56a9894 100644
---- a/src/gallium/frontends/clover/meson.build
-+++ b/src/gallium/frontends/clover/meson.build
-@@ -10,7 +10,6 @@ clover_opencl_cpp_args =3D [
-   '-DCL_USE_DEPRECATED_OPENCL_2_0_APIS',
-   '-DCL_USE_DEPRECATED_OPENCL_2_1_APIS',
-   '-DCL_USE_DEPRECATED_OPENCL_2_2_APIS',
--  '-DLIBCLC_INCLUDEDIR=3D"@0@/"'.format(dep_clc.get_variable(pkgconfig =
: 'includedir')),
-   '-DLIBCLC_LIBEXECDIR=3D"@0@/"'.format(dep_clc.get_variable(pkgconfig =
: 'libexecdir'))
- ]
- clover_incs =3D [inc_include, inc_src, inc_gallium, inc_gallium_aux]
-@@ -43,9 +42,9 @@ libclllvm =3D static_library(
-   cpp_args : [
-     clover_cpp_args,
-     clover_opencl_cpp_args,
--    '-DCLANG_RESOURCE_DIR=3D"@0@"'.format(join_paths(
-+    '-DFALLBACK_CLANG_RESOURCE_DIR=3D"@0@"'.format(join_paths(
-       dep_llvm.get_variable(cmake : 'LLVM_LIBRARY_DIR', configtool: 'li=
bdir'), 'clang',
--      dep_llvm.version(), 'include',
-+      dep_llvm.version()
-     )),
-   ],
-   gnu_symbol_visibility : 'hidden',
diff --git a/meta/recipes-graphics/mesa/files/0001-dont-build-clover-fron=
tend.patch b/meta/recipes-graphics/mesa/files/0001-dont-build-clover-fron=
tend.patch
new file mode 100644
index 0000000000..5f45f94fea
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-dont-build-clover-frontend.pa=
tch
@@ -0,0 +1,29 @@
+From: Markus Volk <f_l_k@t-online.de>
+Date: Sun, 19 Mai 2025 15:34:46 +0100
+Subject: [PATCH] dont build clover frontend
+
+The clover frontend is deprecated and is always built with opencl, even =
if
+using rusticl. Additionally it adds a reproducibility issue.
+
+Upstream-Status: Inappropriate [oe-specific]
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+--- a/src/gallium/meson.build	2025-05-07 18:35:10.000000000 +0200
++++ b/src/gallium/meson.build	2025-05-18 17:05:23.677694272 +0200
+@@ -195,15 +195,11 @@
+ else
+   driver_d3d12 =3D declare_dependency()
+ endif
+-if with_gallium_clover or with_tests
++if with_tests
+   # At the moment, clover and gallium/tests are the only two consumers
+   # for pipe-loader
+   subdir('targets/pipe-loader')
+ endif
+-if with_gallium_clover
+-  subdir('frontends/clover')
+-  subdir('targets/opencl')
+-endif
+ if with_gallium_rusticl
+   subdir('frontends/rusticl')
+   subdir('targets/rusticl')
diff --git a/meta/recipes-graphics/mesa/files/0001-gallium-clover-Do-not-=
use-LLVM_LIBRARY_DIR-for-FALLB.patch b/meta/recipes-graphics/mesa/files/0=
001-gallium-clover-Do-not-use-LLVM_LIBRARY_DIR-for-FALLB.patch
deleted file mode 100644
index 8b2ce2f63b..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-gallium-clover-Do-not-use-LLV=
M_LIBRARY_DIR-for-FALLB.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 5ea5c5d48e049d7b10b7ffb814e84e3ddef7fff9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 25 Apr 2025 19:00:14 -0700
-Subject: [PATCH] gallium/clover: Do not use LLVM_LIBRARY_DIR for
- FALLBACK_CLANG_RESOURCE_DIR
-
-This option -DFALLBACK_CLANG_RESOURCE_DIR is synthesized by meson from
-LLVM_LIBRARY_DIR which is resolved to absolute path under <recipe_sysroo=
t>
-and its used in clover front-end as string in .c files, which encodes it
-into binary as string and shows up in yocto QA error.
-
-ERROR: mesa-2_25.0.2-r0 do_package_qa: QA Issue: File /usr/lib/libMesaOp=
enCL.so.1.0.0 in package libopencl-mesa contains reference to TMPDIR [bui=
ldpaths]
-ERROR: mesa-2_25.0.2-r0 do_package_qa: Fatal QA errors were found, faili=
ng task.
-ERROR: Logfile of failure stored in: /mnt/b/yoe/master/sources/poky/buil=
d/tmp/work/cortexa57-poky-linux/mesa/25.0.2/temp/log.do_package_qa.974870
-
-Upstream-Status: Inappropriate [OE-Specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/gallium/frontends/clover/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/gallium/frontends/clover/meson.build b/src/gallium/fron=
tends/clover/meson.build
-index 56a9894..32c21d6 100644
---- a/src/gallium/frontends/clover/meson.build
-+++ b/src/gallium/frontends/clover/meson.build
-@@ -43,7 +43,7 @@ libclllvm =3D static_library(
-     clover_cpp_args,
-     clover_opencl_cpp_args,
-     '-DFALLBACK_CLANG_RESOURCE_DIR=3D"@0@"'.format(join_paths(
--      dep_llvm.get_variable(cmake : 'LLVM_LIBRARY_DIR', configtool: 'li=
bdir'), 'clang',
-+     '/usr/lib/clang',
-       dep_llvm.version()
-     )),
-   ],
diff --git a/meta/recipes-graphics/mesa/files/0001-mesa-clc-add-an-option=
-to-force-inclusion-of-OpenCL-.patch b/meta/recipes-graphics/mesa/files/0=
001-mesa-clc-add-an-option-to-force-inclusion-of-OpenCL-.patch
deleted file mode 100644
index d65ba574d2..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-mesa-clc-add-an-option-to-for=
ce-inclusion-of-OpenCL-.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From f9b6175e7c446a82c568ff1a214885d707c95f49 Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Date: Wed, 16 Apr 2025 14:35:37 +0300
-Subject: [PATCH] mesa-clc: add an option to force inclusion of OpenCL he=
aders
-
-Currently mesa-clc bundles OpenCL headers from Clang only if the static
-LLVM is used (which means Clang / LLVM are not present on the target
-system). In some cases (e.g. when building in OpenEmbedded environemnt)
-it is desirable to have shared LLVM library, but skip installing the
-whole Clang runtime just to compile shaders. Add an option that forces
-OpenCL headers to be bundled with the mesa-clc binary.
-
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/34551]
----
- meson_options.txt                | 10 ++++++++++
- src/compiler/clc/meson.build |  3 ++-
- 2 files changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/meson_options.txt b/meson_options.txt
-index 18da31eff507..addd274ecef7 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -797,6 +797,16 @@ option(
-   description : 'Install the mesa-clc compiler (if needed for cross bui=
lds).'
- )
-=20
-+option(
-+  'mesa-clc-bundle-headers',
-+  type : 'combo',
-+  value : 'auto',
-+  choices : [
-+    'enabled', 'auto'
-+  ],
-+  description : 'Bundle the OpenCL headers into the mesa-clc binary (de=
fault to bundle if static LLVM is used). Note, it might require rebuildin=
g mesa-clc if opencl-c.h or opencl-c-base.h are changed (e.g. on Clang up=
grades).'
-+)
-+
- option(
-   'precomp-compiler',
-   type : 'combo',
-diff --git a/src/compiler/clc/meson.build b/src/compiler/clc/meson.build
-index 263eba527191..9ff61440f0da 100644
---- a/src/compiler/clc/meson.build
-+++ b/src/compiler/clc/meson.build
-@@ -11,7 +11,8 @@ _libmesaclc_c_args =3D []
- _libmesaclc_cpp_args =3D ['-DLLVM_LIB_DIR=3D"@0@"'.format(llvm_libdir)]
- _libmesaclc_sources =3D []
-=20
--if not _shared_llvm
-+if not _shared_llvm or \
-+    get_option('mesa-clc-bundle-headers') =3D=3D 'enabled'
-   # LLVM 16 moved clang header path from using full version to only maj=
or version
-   if dep_llvm.version().version_compare('< 16')
-     # Prior to LLVM 16, this path used a full version
---=20
-2.47.2
-
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 288027bbb9..47edf0d512 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,13 +17,11 @@ PE =3D "2"
 SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.p=
atch \
-           file://0001-mesa-clc-add-an-option-to-force-inclusion-of-Open=
CL-.patch \
-           file://0001-clover-Don-t-include-libclc-headers.patch \
-           file://0001-gallium-clover-Do-not-use-LLVM_LIBRARY_DIR-for-FA=
LLB.patch \
+           file://0001-dont-build-clover-frontend.patch \
 "
=20
-SRC_URI[sha256sum] =3D "c0d245dea0aa4b49f74b3d474b16542e4a8799791cd33d67=
6c69f650ad4378d0"
-PV =3D "25.0.5"
+SRC_URI[sha256sum] =3D "b1c45888969ee5df997e2542654f735ab1b772924b442f30=
16d2293414c99c14"
+PV =3D "25.1.0"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
=20
@@ -343,7 +341,7 @@ FILES:mesa-megadriver =3D "${libdir}/dri/* ${datadir}=
/drirc.d"
 FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so ${libdir}/libpow=
ervr_rogue.so ${datadir}/vulkan"
 FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
 FILES:libegl-mesa =3D "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendo=
r.d"
-FILES:libgbm =3D "${libdir}/libgbm.so.* ${libdir}/gbm/*_gbm.so"
+FILES:libgbm =3D "${libdir}/libgbm.so.* ${libdir}/gbm/*_gbm.so ${include=
dir}/gbm_backend_abi.h"
 FILES:libgallium =3D "${libdir}/libgallium-*.so"
 FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
--=20
2.49.0


