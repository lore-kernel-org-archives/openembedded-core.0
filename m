Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E10C87FC8
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 13:24:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.40627.1753104273800014302
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 06:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 584C51595
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 06:24:27 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CC5EC3F6A8
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 06:24:32 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 2/5] libclc: split out of clang
Date: Mon, 21 Jul 2025 14:24:23 +0100
Message-ID: <20250721132426.3321928-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250721132426.3321928-1-ross.burton@arm.com>
References: <20250721132426.3321928-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 13:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220688

Split the libclc subproject out of the clang recipe and into a dedicated
libclc recipe.

This is useful because libclc is the OpenCL runtime library and as such
isn't target-specific and needs a native clang to build, not a target
libllvm.

Verified that nothing is dropped by adding clang and libclc to an image
and verifying that the file list is the same before and after this
change.

We need to patch the libclc CMakeLists to allow it to use an out-of-tree
prepare_builtins binary, discussion is ongoing with upstream to resolve
this properly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 ...sting-prepare-builtins-in-standalone.patch | 57 +++++++++++++++++++
 meta/recipes-devtools/clang/clang_git.bb      | 17 ++----
 meta/recipes-devtools/clang/common.inc        |  1 +
 meta/recipes-devtools/clang/libclc_git.bb     | 43 ++++++++++++++
 5 files changed, 108 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-devtools/clang/clang/0001-libclc-allow-e=
xisting-prepare-builtins-in-standalone.patch
 create mode 100644 meta/recipes-devtools/clang/libclc_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 6bfc2efb162..927aac16d6d 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -328,6 +328,7 @@ RECIPE_MAINTAINER:pn-libcap-ng =3D "Yi Zhao <yi.zhao@=
windriver.com>"
 RECIPE_MAINTAINER:pn-libcap-ng-python =3D "Yi Zhao <yi.zhao@windriver.co=
m>"
 RECIPE_MAINTAINER:pn-libcgroup =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-libcheck =3D "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-libclc =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libcomps =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-libconvert-asn1-perl =3D "Tim Orling <tim.orling@ko=
nsulko.com>"
 RECIPE_MAINTAINER:pn-libcxx =3D "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-devtools/clang/clang/0001-libclc-allow-existing=
-prepare-builtins-in-standalone.patch b/meta/recipes-devtools/clang/clang=
/0001-libclc-allow-existing-prepare-builtins-in-standalone.patch
new file mode 100644
index 00000000000..46929798adb
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0001-libclc-allow-existing-prepar=
e-builtins-in-standalone.patch
@@ -0,0 +1,57 @@
+From 348f846b206780646430d6477c04b7793b669f34 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 16 Jul 2025 23:24:21 +0100
+Subject: [PATCH] allow external prepare_builtins
+
+In standalone cross builds, libclc can't build a native prepare_builtins=
.
+
+Hack the CMake to allow it to use an existing binary, which we build in =
the recipe.
+
+Upstream-Status: Inappropriate [discussion for a proper fix in https://g=
ithub.com/llvm/llvm-project/issues/149814]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ libclc/CMakeLists.txt | 23 +++++++++++++++++------
+ 1 file changed, 17 insertions(+), 6 deletions(-)
+
+diff --git a/libclc/CMakeLists.txt b/libclc/CMakeLists.txt
+index 43e213b385f5..d4a6d096169e 100644
+--- a/libclc/CMakeLists.txt
++++ b/libclc/CMakeLists.txt
+@@ -181,17 +181,28 @@ set(LLVM_LINK_COMPONENTS
+   IRReader
+   Support
+ )
++
+ if( LIBCLC_STANDALONE_BUILD )
+-  add_llvm_executable( prepare_builtins utils/prepare-builtins.cpp )
+-  set( prepare_builtins_exe prepare_builtins )
+-  set( prepare_builtins_target prepare_builtins )
++  message("cross ${CMAKE_CROSSCOMPILING}")
++  if(CMAKE_CROSSCOMPILING)
++    find_program(PREPARE_BUILTINS prepare_builtins REQUIRED)
++    message("found ${PREPARE_BUILTINS}")
++    set( prepare_builtins_exe ${PREPARE_BUILTINS} )
++  else()
++    add_llvm_executable( prepare_builtins utils/prepare-builtins.cpp )
++    set( prepare_builtins_exe prepare_builtins )
++    set( prepare_builtins_target prepare_builtins )
++    target_compile_definitions( prepare_builtins PRIVATE ${LLVM_VERSION=
_DEFINE} )
++    # These were not properly reported in early LLVM and we don't need =
them
++    target_compile_options( prepare_builtins PRIVATE -fno-rtti -fno-exc=
eptions )
++  endif()
+ else()
+   add_llvm_utility( prepare_builtins utils/prepare-builtins.cpp )
+   setup_host_tool( prepare_builtins PREPARE_BUILTINS prepare_builtins_e=
xe prepare_builtins_target )
++  target_compile_definitions( prepare_builtins PRIVATE ${LLVM_VERSION_D=
EFINE} )
++  # These were not properly reported in early LLVM and we don't need th=
em
++  target_compile_options( prepare_builtins PRIVATE -fno-rtti -fno-excep=
tions )
+ endif()
+-target_compile_definitions( prepare_builtins PRIVATE ${LLVM_VERSION_DEF=
INE} )
+-# These were not properly reported in early LLVM and we don't need them
+-target_compile_options( prepare_builtins PRIVATE -fno-rtti -fno-excepti=
ons )
+=20
+ # Setup arch devices
+ set( r600--_devices cedar cypress barts cayman )
+--=20
+2.43.0
+
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index ed6e2d7da7f..884398dcaa3 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -130,7 +130,7 @@ HF[vardepvalue] =3D "${HF}"
=20
 # Ensure that LLVM_PROJECTS does not contain compiler runtime components=
 e.g. libcxx etc
 # they are enabled via LLVM_ENABLE_RUNTIMES
-LLVM_PROJECTS ?=3D "clang;clang-tools-extra;libclc;lld"
+LLVM_PROJECTS ?=3D "clang;clang-tools-extra;lld"
=20
 # linux hosts (.so) on Windows .pyd
 SOLIBSDEV:mingw32 =3D ".pyd"
@@ -191,7 +191,7 @@ EXTRA_OECMAKE:append:class-target =3D "\
=20
 DEPENDS =3D "binutils zlib zstd libffi libxml2 libxml2-native ninja-nati=
ve swig-native spirv-tools-native llvm-tblgen-native"
 DEPENDS:append:class-nativesdk =3D " clang-crosssdk-${SDK_SYS} virtual/n=
ativesdk-cross-binutils nativesdk-python3"
-DEPENDS:append:class-target =3D " clang-cross-${TARGET_ARCH} python3 ${@=
bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}=
 spirv-llvm-translator-native"
+DEPENDS:append:class-target =3D " clang-cross-${TARGET_ARCH} python3 ${@=
bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}=
"
=20
 RRECOMMENDS:${PN} =3D "binutils"
 RRECOMMENDS:${PN}:append:class-target =3D "${@bb.utils.contains('TC_CXX_=
RUNTIME', 'llvm', ' libcxx-dev', '', d)}"
@@ -258,7 +258,6 @@ do_install:append:class-native () {
         install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}${b=
indir}/clangd-indexer
     fi
     install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-char=
s-gen ${D}${bindir}/clang-tidy-confusable-chars-gen
-    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/prepare_builtins ${D}${bin=
dir}/prepare_builtins
=20
     for f in `find ${D}${bindir} -executable -type f -not -type l`; do
         test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
@@ -294,11 +293,11 @@ do_install:append:class-nativesdk () {
     fi
 }
=20
-PROVIDES:append:class-native =3D " llvm-native libclc-native"
-PROVIDES:append:class-target =3D " llvm libclc"
-PROVIDES:append:class-nativesdk =3D " nativesdk-llvm nativesdk-libclc"
+PROVIDES:append:class-native =3D " llvm-native"
+PROVIDES:append:class-target =3D " llvm"
+PROVIDES:append:class-nativesdk =3D " nativesdk-llvm"
=20
-PACKAGES =3D+ "${PN}-libllvm ${PN}-libclang-python ${PN}-libclang-cpp ${=
PN}-tidy ${PN}-format ${PN}-tools ${PN}-clc \
+PACKAGES =3D+ "${PN}-libllvm ${PN}-libclang-python ${PN}-libclang-cpp ${=
PN}-tidy ${PN}-format ${PN}-tools \
              libclang llvm-linker-tools"
=20
 BBCLASSEXTEND =3D "native nativesdk"
@@ -315,8 +314,6 @@ RDEPENDS:${PN}-tools +=3D "\
   perl-module-term-ansicolor \
 "
=20
-RPROVIDES:${PN}-clc =3D "${MLPREFIX}libclc"
-
 RRECOMMENDS:${PN}-tidy +=3D "${PN}-tools"
=20
 FILES:llvm-linker-tools =3D "${libdir}/LLVMgold* ${libdir}/libLTO.so.* $=
{libdir}/LLVMPolly*"
@@ -383,8 +380,6 @@ FILES:${PN} +=3D "\
   ${nonarch_libdir}/${BPN}/*/include/ \
 "
=20
-FILES:${PN}-clc +=3D "${datadir}/clc"
-
 FILES:${PN}-libllvm =3D+ "\
   ${libdir}/libLLVM.so.${MAJOR_VER}.${MINOR_VER} \
   ${libdir}/libLLVM-${MAJOR_VER}.so \
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtoo=
ls/clang/common.inc
index d66f9059b2e..d6280c2fbe3 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -59,6 +59,7 @@ SRC_URI =3D "\
     file://0036-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch =
\
     file://0037-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.pat=
ch \
     file://0038-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.pat=
ch \
+    file://0001-libclc-allow-existing-prepare-builtins-in-standalone.pat=
ch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??=3D ""
diff --git a/meta/recipes-devtools/clang/libclc_git.bb b/meta/recipes-dev=
tools/clang/libclc_git.bb
new file mode 100644
index 00000000000..ed31de503ae
--- /dev/null
+++ b/meta/recipes-devtools/clang/libclc_git.bb
@@ -0,0 +1,43 @@
+SUMMARY =3D "Implementation of the library requirements of the OpenCL C =
programming language."
+HOMEPAGE =3D "https://libclc.llvm.org"
+SECTION =3D "devel"
+
+require common-clang.inc
+require common-source.inc
+
+LIC_FILES_CHKSUM =3D "file://libclc/LICENSE.TXT;md5=3D7cc795f6cbb2d801d8=
4336b83c8017db"
+
+inherit cmake pkgconfig
+
+# Depend explicitly on clang-native instead of using TOOLCHAIN as the bu=
ild
+# objects from this recipe are build explicitly using clang for GPU targ=
ets.
+# We could INHIBIT_DEFAULT_DEPS to avoid any other toolchain but then we=
 need
+# to wrestle CMake to configure without a toolchain.
+DEPENDS +=3D "clang-native spirv-llvm-translator-native"
+
+OECMAKE_SOURCEPATH =3D "${S}/libclc"
+B_NATIVE =3D "${B}-native"
+
+# Semicolon-separated list of targets to build
+LIBCLC_TARGETS ?=3D "all"
+
+EXTRA_OECMAKE =3D "-DLIBCLC_TARGETS_TO_BUILD=3D${LIBCLC_TARGETS} \
+                 -DPREPARE_BUILTINS=3D${B_NATIVE}/prepare_builtins"
+
+# Need to build a native prepare_builtins binary in target builds. The e=
asiest
+# way to do this is with a second native cmake build tree.
+do_build_prepare_builtins() {
+    cmake --fresh -G Ninja \
+        -S ${OECMAKE_SOURCEPATH} -B ${B_NATIVE} \
+        -DCMAKE_TOOLCHAIN_FILE:FILEPATH=3D${WORKDIR}/toolchain-native.cm=
ake \
+        -DLIBCLC_TARGETS_TO_BUILD=3D
+    cmake --build ${B_NATIVE} --target prepare_builtins
+}
+do_build_prepare_builtins:class-native() {
+    :
+}
+do_configure[prefuncs] +=3D "do_build_prepare_builtins"
+
+FILES:${PN} +=3D "${datadir}/clc"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


