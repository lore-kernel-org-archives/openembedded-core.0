Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB0AC83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 14:31:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10201.1752589903623446248
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 07:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7275712FC
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 07:31:34 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BDF383F694
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 07:31:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libclc: split out of clang
Date: Tue, 15 Jul 2025 15:31:38 +0100
Message-ID: <20250715143139.1829393-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 14:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220298

Split the libclc subproject out of the clang recipe and into a dedicated
libclc recipe.

Verified that nothing is dropped by adding clang and libclc to an image
and verifying that the file list is the same before and after this
change.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc  |  1 +
 meta/recipes-devtools/clang/clang_git.bb  | 17 +++----
 meta/recipes-devtools/clang/libclc_git.bb | 54 +++++++++++++++++++++++
 3 files changed, 61 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-devtools/clang/libclc_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index f49d7317ee9..67f392161c4 100644
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
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index 1daac48edaf..4cbe22f4546 100644
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
diff --git a/meta/recipes-devtools/clang/libclc_git.bb b/meta/recipes-dev=
tools/clang/libclc_git.bb
new file mode 100644
index 00000000000..da849ba6ce8
--- /dev/null
+++ b/meta/recipes-devtools/clang/libclc_git.bb
@@ -0,0 +1,54 @@
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
+TOOLCHAIN =3D "clang"
+
+# The clang dependency is actually just target LLVM
+DEPENDS +=3D "clang spirv-llvm-translator-native"
+
+OECMAKE_SOURCEPATH =3D "${S}/libclc"
+
+# Semicolon-separated list of targets to build
+LIBCLC_TARGETS ?=3D "all"
+
+EXTRA_OECMAKE =3D "\
+    -DLLVM_DIR=3D${STAGING_LIBDIR}/cmake/llvm/ \
+    -DLIBCLC_TARGETS_TO_BUILD=3D${LIBCLC_TARGETS} \
+"
+
+# Until the target LLVMConfig.cmake points to the correct native directo=
ry for
+# the binaries, we need to specify their location manually.
+EXTRA_OECMAKE:append:class-target =3D "\
+    -DLLVM_TOOL_clang=3D${STAGING_BINDIR_TOOLCHAIN}/${HOST_PREFIX}clang =
\
+    -DLLVM_TOOL_llvm-as=3D${STAGING_BINDIR_TOOLCHAIN}/${HOST_PREFIX}llvm=
-as \
+    -DLLVM_TOOL_llvm-link=3D${STAGING_BINDIR_NATIVE}/llvm-link \
+    -DLLVM_TOOL_opt=3D${STAGING_BINDIR_NATIVE}/opt \
+"
+
+# Need to build a native prepare_builtins binary in target builds. The e=
asiest
+# way to do this is with a second native cmake build tree.
+PATH .=3D ":${B}/native"
+
+do_build_prepare_builtins() {
+    cmake -G Ninja \
+        -S ${OECMAKE_SOURCEPATH} -B ${B}/native/ \
+        -DCMAKE_TOOLCHAIN_FILE:FILEPATH=3D${WORKDIR}/toolchain-native.cm=
ake \
+        -DLIBCLC_TARGETS_TO_BUILD=3D
+    cmake --build ${B}/native --target prepare_builtins
+}
+do_build_prepare_builtins:class-native() {
+    :
+}
+addtask build_prepare_builtins after do_configure before do_compile
+
+FILES:${PN} +=3D "${datadir}/clc"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


