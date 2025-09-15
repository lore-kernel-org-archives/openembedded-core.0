Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09DA8CAC592
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 19:11:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1215.1757963479036205582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 12:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 798A21424
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 12:11:10 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5E06F3F694
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 12:11:18 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 6/8] clang: use llvm recipe
Date: Mon, 15 Sep 2025 20:11:07 +0100
Message-ID: <20250915191109.1117663-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915191109.1117663-1-ross.burton@arm.com>
References: <20250915191109.1117663-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 19:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223503

Change this recipe to build just clang and clang-tools-extra, using the
LLVM provided by the llvm recipe.

This adds an 'extra-tools' PACKAGECONFIG (enabled by default) that
controls whether to build the clang-tools-extra project. This includes
clang-tidy and clangd, but the compile time and size for these
components is not insignificant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 165 ++++-------------------
 1 file changed, 24 insertions(+), 141 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index 9a19cefc961..9e977379325 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -19,7 +19,7 @@ require common-source.inc
=20
 BPN =3D "clang"
=20
-CVE_PRODUCT +=3D "llvm:clang"
+CVE_PRODUCT =3D "llvm:clang"
=20
 INHIBIT_DEFAULT_DEPS:class-native =3D "1"
=20
@@ -28,72 +28,31 @@ LDFLAGS:append:class-target:mips =3D " -Wl,--no-as-ne=
eded -latomic -Wl,--as-needed
=20
 inherit cmake pkgconfig multilib_header python3-dir
=20
-PACKAGECONFIG_CLANG_COMMON =3D "build-id eh libedit rtti shared-libs lib=
clang-python \
-                              ${@bb.utils.contains('DISTRO_FEATURES', 'l=
d-is-lld', 'lld', '', d)} \
-                              ${@bb.utils.contains('TC_CXX_RUNTIME', 'll=
vm', 'compiler-rt libcplusplus libomp unwindlib', '', d)} \
-                              "
-
-PACKAGECONFIG ??=3D "${PACKAGECONFIG_CLANG_COMMON} \
+PACKAGECONFIG ??=3D "build-id extra-tools clangd libclang-python \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'lto thin-lto',=
 d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', =
'lld', '', d)} \
+                   ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compi=
ler-rt libcplusplus libomp unwindlib', '', d)} \
                    "
-PACKAGECONFIG:class-native =3D "clangd \
-                              ${PACKAGECONFIG_CLANG_COMMON} \
-                              "
-PACKAGECONFIG:class-nativesdk =3D "clangd \
-                                 ${PACKAGECONFIG_CLANG_COMMON} \
-                                 ${@bb.utils.filter('DISTRO_FEATURES', '=
lto thin-lto', d)} \
-                                 "
+PACKAGECONFIG:remove:class-native =3D "lto thin-lto"
=20
 PACKAGECONFIG[build-id] =3D "-DENABLE_LINKER_BUILD_ID=3DON,-DENABLE_LINK=
ER_BUILD_ID=3DOFF,,"
 PACKAGECONFIG[clangd] =3D "-DCLANG_ENABLE_CLANGD=3DON,-DCLANG_ENABLE_CLA=
NGD=3DOFF,,"
-
 # Activate to build the dexp tool in clangd
 # Disabled by default for -native since it is known to trigger compiler =
failure on Debian 11
 # See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15803
 PACKAGECONFIG[clangd-dexp] =3D "-DCLANGD_BUILD_DEXP=3DON,-DCLANGD_BUILD_=
DEXP=3DOFF,,"
-
 PACKAGECONFIG[compiler-rt] =3D "-DCLANG_DEFAULT_RTLIB=3Dcompiler-rt,,"
-PACKAGECONFIG[eh] =3D "-DLLVM_ENABLE_EH=3DON,-DLLVM_ENABLE_EH=3DOFF,,"
-PACKAGECONFIG[exegesis] =3D "-DLLVM_TOOL_LLVM_EXEGESIS_BUILD=3DON,-DLLVM=
_TOOL_LLVM_EXEGESIS_BUILD=3DOFF"
+PACKAGECONFIG[extra-tools] =3D "-DLLVM_EXTERNAL_CLANG_TOOLS_EXTRA_SOURCE=
_DIR=3D${S}/clang-tools-extra"
 PACKAGECONFIG[libcplusplus] =3D "-DCLANG_DEFAULT_CXX_STDLIB=3Dlibc++,,"
-PACKAGECONFIG[libedit] =3D "-DLLVM_ENABLE_LIBEDIT=3DON,-DLLVM_ENABLE_LIB=
EDIT=3DOFF,libedit libedit-native"
 PACKAGECONFIG[libomp] =3D "-DCLANG_DEFAULT_OPENMP_RUNTIME=3Dlibomp,,"
 PACKAGECONFIG[lld] =3D "-DCLANG_DEFAULT_LINKER=3Dlld,,,"
 PACKAGECONFIG[lto] =3D "-DLLVM_ENABLE_LTO=3DFull -DLLVM_BINUTILS_INCDIR=3D=
${STAGING_INCDIR},,binutils,"
-PACKAGECONFIG[opt-viewer] =3D "-DLLVM_TOOL_OPT_VIEWER_BUILD=3DON,-DLLVM_=
TOOL_OPT_VIEWER_BUILD=3DOFF, \
-                             python3-pyyaml-native python3-pygments-nati=
ve python3-pyyaml python3-pygments, \
-                             python3-pyyaml python3-pygments,"
-PACKAGECONFIG[pfm] =3D "-DLLVM_ENABLE_LIBPFM=3DON,-DLLVM_ENABLE_LIBPFM=3D=
OFF,libpfm,"
-PACKAGECONFIG[rtti] =3D "-DLLVM_ENABLE_RTTI=3DON,-DLLVM_ENABLE_RTTI=3DOF=
F,,"
-PACKAGECONFIG[shared-libs] =3D "-DLLVM_BUILD_LLVM_DYLIB=3DON -DLLVM_LINK=
_LLVM_DYLIB=3DON,,,"
-PACKAGECONFIG[split-dwarf] =3D "-DLLVM_USE_SPLIT_DWARF=3DON,-DLLVM_USE_S=
PLIT_DWARF=3DOFF,,"
 PACKAGECONFIG[thin-lto] =3D "-DLLVM_ENABLE_LTO=3DThin -DLLVM_BINUTILS_IN=
CDIR=3D${STAGING_INCDIR},,binutils,"
 PACKAGECONFIG[unwindlib] =3D "-DCLANG_DEFAULT_UNWINDLIB=3Dlibunwind,-DCL=
ANG_DEFAULT_UNWINDLIB=3Dlibgcc,,"
 PACKAGECONFIG[libclang-python] =3D "-DCLANG_PYTHON_BINDINGS_VERSIONS=3D$=
{PYTHON_BASEVERSION},,"
=20
-OECMAKE_SOURCEPATH =3D "${S}/llvm"
+OECMAKE_SOURCEPATH =3D "${S}/clang"
=20
-# By default we build all the supported CPU architectures, and the GPU t=
argets
-# if the opengl or vulkan DISTRO_FEATURES are enabled.
-#
-# For target builds we default to building that specific architecture, B=
PF, and the GPU targets if required.
-#
-# The available target list can be seen in the source code
-# in the LLVM_ALL_TARGETS assignment:
-# https://github.com/llvm/llvm-project/blob/main/llvm/CMakeLists.txt
-LLVM_TARGETS_GPU ?=3D "${@bb.utils.contains_any('DISTRO_FEATURES', 'open=
gl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
-LLVM_TARGETS_TO_BUILD ?=3D "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;Loong=
Arch;${LLVM_TARGETS_GPU}"
-LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_arch(bb, d)};=
BPF;${LLVM_TARGETS_GPU}"
-
-LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?=3D ""
-
-HF =3D ""
-HF:class-target =3D "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard',=
 'hf', '', d)}"
-HF[vardepvalue] =3D "${HF}"
-
-# Ensure that LLVM_PROJECTS does not contain compiler runtime components=
 e.g. libcxx etc
-# they are enabled via LLVM_ENABLE_RUNTIMES
-LLVM_PROJECTS ?=3D "clang;clang-tools-extra"
=20
 # linux hosts (.so) on Windows .pyd
 SOLIBSDEV:mingw32 =3D ".pyd"
@@ -102,25 +61,18 @@ SOLIBSDEV:mingw32 =3D ".pyd"
=20
 EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
                   -DLLVM_APPEND_VC_REV=3DOFF \
-                  -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=3DOFF \
+                  -DLLVM_BUILD_LLVM_DYLIB=3DON \
+                  -DLLVM_LINK_LLVM_DYLIB=3DON \
                   -DLLVM_ENABLE_EXPENSIVE_CHECKS=3DOFF \
                   -DLLVM_ENABLE_PIC=3DON \
                   -DCLANG_DEFAULT_PIE_ON_LINUX=3DON \
-                  -DLLVM_BINDINGS_LIST=3D'' \
-                  -DLLVM_ENABLE_FFI=3DON \
-                  -DLLVM_ENABLE_ZSTD=3DON \
                   -DFFI_INCLUDE_DIR=3D$(pkg-config --variable=3Dincluded=
ir libffi) \
                   -DLLVM_BUILD_EXTERNAL_COMPILER_RT=3DON \
                   -DCMAKE_SYSTEM_NAME=3DLinux \
                   -DCMAKE_BUILD_TYPE=3DRelease \
                   -DLLVM_ENABLE_PROJECTS=3D'${LLVM_PROJECTS}' \
-                  -DLLVM_BINUTILS_INCDIR=3D${STAGING_INCDIR} \
                   -DLLVM_VERSION_SUFFIX=3D'${VER_SUFFIX}' \
-                  -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=3DON \
-                  -DLLVM_TARGETS_TO_BUILD=3D'${LLVM_TARGETS_TO_BUILD}' \
-                  -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=3D'${LLVM_EXPERIM=
ENTAL_TARGETS_TO_BUILD}' \
-                  -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
-                  -DLLVM_HEADERS_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llv=
m-min-tblgen \
+                  -DLLVM_CMAKE_DIR=3D${STAGING_LIBDIR}/cmake/llvm \
                   -DLLVM_INCLUDE_TESTS=3DOFF \
 "
=20
@@ -132,58 +84,27 @@ EXTRA_OECMAKE:append:class-nativesdk =3D "\
                   -DCMAKE_STRIP=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_P=
REFIX}llvm-strip \
 "
 EXTRA_OECMAKE:append:class-target =3D "\
+                  -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
+                  -DLLVM_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llvm-tb=
lgen \
                   -DCMAKE_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_=
PREFIX}llvm-ranlib \
                   -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREF=
IX}llvm-ar \
                   -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREF=
IX}llvm-nm \
                   -DCMAKE_STRIP=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_P=
REFIX}llvm-strip \
-                  -DLLVM_TARGET_ARCH=3D${HOST_ARCH} \
-                  -DLLVM_DEFAULT_TARGET_TRIPLE=3D${TARGET_SYS}${HF} \
-                  -DLLVM_HOST_TRIPLE=3D${TARGET_SYS}${HF} \
                   -DLLVM_LIBDIR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \
 "
=20
-DEPENDS =3D "binutils zlib zstd libffi libxml2 libxml2-native llvm-tblge=
n-native"
+DEPENDS =3D "llvm-tblgen-native llvm binutils zlib zstd libffi libxml2 l=
ibxml2-native"
 DEPENDS:append:class-nativesdk =3D " clang-crosssdk-${SDK_SYS} virtual/n=
ativesdk-cross-binutils"
 DEPENDS:append:class-target =3D " ${MLPREFIX}clang-cross-${TARGET_ARCH} =
${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', =
d)}"
=20
 RDEPENDS:${PN}:append:class-target =3D "${@bb.utils.contains('DISTRO_FEA=
TURES', 'ld-is-lld', ' lld', '', d)}"
 RRECOMMENDS:${PN}:append:class-target =3D "binutils ${@bb.utils.contains=
('TC_CXX_RUNTIME', 'llvm', ' libcxx-dev', '', d)}"
=20
-# patch out build host paths for reproducibility
-reproducible_build_variables() {
-    sed -i -e "s,${DEBUG_PREFIX_MAP},,g" \
-        -e "s,--sysroot=3D${RECIPE_SYSROOT},,g" \
-        -e "s,${STAGING_DIR_HOST},,g" \
-        -e "s,${S}/llvm,,g"  \
-        -e "s,${B},,g" \
-        ${B}/tools/llvm-config/BuildVariables.inc
-}
-
-do_configure:append:class-target() {
-    reproducible_build_variables
-}
-
-do_configure:append:class-nativesdk() {
-    reproducible_build_variables
-}
-
 do_install:append() {
-    oe_multilib_header llvm/Config/llvm-config.h
     oe_multilib_header clang/Config/config.h
 }
=20
 do_install:append:class-target () {
-    # Allow bin path to change based on YOCTO_ALTERNATE_EXE_PATH
-    sed -i 's;${_IMPORT_PREFIX}/bin;${_IMPORT_PREFIX_BIN};g' ${D}${libdi=
r}/cmake/llvm/LLVMExports-release.cmake
-
-    # Insert function to populate Import Variables
-    sed -i "4i\
-if(DEFINED ENV{YOCTO_ALTERNATE_EXE_PATH})\n\
-  execute_process(COMMAND \"llvm-config\" \"--bindir\" OUTPUT_VARIABLE _=
IMPORT_PREFIX_BIN OUTPUT_STRIP_TRAILING_WHITESPACE)\n\
-else()\n\
-  set(_IMPORT_PREFIX_BIN \"\${_IMPORT_PREFIX}/bin\")\n\
-endif()\n" ${D}${libdir}/cmake/llvm/LLVMExports-release.cmake
-
     if [ -n "${LLVM_LIBDIR_SUFFIX}" ]; then
         mkdir -p ${D}${nonarch_libdir}
         mv ${D}${libdir}/clang ${D}${nonarch_libdir}/clang
@@ -194,44 +115,18 @@ endif()\n" ${D}${libdir}/cmake/llvm/LLVMExports-rel=
ease.cmake
         llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov; do
         ln -sf $t ${D}${bindir}/${TARGET_PREFIX}$t
     done
-
-    # reproducibility
-    sed -i -e 's,${B},,g' ${D}${libdir}/cmake/llvm/LLVMConfig.cmake
 }
=20
 do_install:append:class-native () {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'clangd', 'true', 'false', =
d)}; then
-        install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}${b=
indir}/clangd-indexer
+    if ${@bb.utils.contains('PACKAGECONFIG', 'extra-tools', 'true', 'fal=
se', d)}; then
+        install -Dm 0755 ${B}/bin/clang-tidy-confusable-chars-gen ${D}${=
bindir}/clang-tidy-confusable-chars-gen
     fi
-    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-char=
s-gen ${D}${bindir}/clang-tidy-confusable-chars-gen
-
-    for f in `find ${D}${bindir} -executable -type f -not -type l`; do
-        test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
-        echo "stripped $f"
-    done
-    ln -sf llvm-config ${D}${bindir}/llvm-config${PV}
-
-    # These are provided by llvm-tblgen-native
-    rm ${D}${bindir}/*-tblgen
 }
=20
 do_install:append:class-nativesdk () {
     if [ -e ${D}${libdir}/cmake/llvm/LLVMConfig.cmake ] ; then
         sed -i -e "s|${B}/./bin/||g" ${D}${libdir}/cmake/llvm/LLVMConfig=
.cmake
     fi
-    if ${@bb.utils.contains('PACKAGECONFIG', 'clangd', 'true', 'false', =
d)}; then
-        install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}${b=
indir}/clangd-indexer
-    fi
-    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tblgen ${D}${bindir}=
/clang-tblgen
-    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-char=
s-gen ${D}${bindir}/clang-tidy-confusable-chars-gen
-    for f in `find ${D}${bindir} -executable -type f -not -type l`; do
-        test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
-    done
-    ln -sf clang-tblgen ${D}${bindir}/clang-tblgen${PV}
-    ln -sf llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
-    ln -sf llvm-config ${D}${bindir}/llvm-config${PV}
-    rm -rf ${D}${datadir}/llvm/cmake
-    rm -rf ${D}${datadir}/llvm
=20
     #reproducibility
     if [ -e ${D}${libdir}/cmake/llvm/LLVMConfig.cmake ] ; then
@@ -239,12 +134,7 @@ do_install:append:class-nativesdk () {
     fi
 }
=20
-PROVIDES:append:class-native =3D " llvm-native"
-PROVIDES:append:class-target =3D " llvm"
-PROVIDES:append:class-nativesdk =3D " nativesdk-llvm"
-
-PACKAGES =3D+ "${PN}-libllvm ${PN}-libclang-python ${PN}-libclang-cpp ${=
PN}-tidy ${PN}-format ${PN}-tools \
-             libclang llvm-linker-tools"
+PACKAGES =3D+ "${PN}-libclang-python ${PN}-libclang-cpp ${PN}-tidy ${PN}=
-format ${PN}-tools libclang"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
@@ -262,8 +152,6 @@ RDEPENDS:${PN}-tools +=3D "\
=20
 RRECOMMENDS:${PN}-tidy +=3D "${PN}-tools"
=20
-FILES:llvm-linker-tools =3D "${libdir}/LLVMgold* ${libdir}/libLTO.so.* $=
{libdir}/LLVMPolly*"
-
 FILES:${PN}-libclang-cpp =3D "${libdir}/libclang-cpp.so.*"
=20
 FILES:${PN}-libclang-python =3D "${PYTHON_SITEPACKAGES_DIR}/clang/*"
@@ -326,12 +214,6 @@ FILES:${PN} +=3D "\
   ${nonarch_libdir}/${BPN}/*/include/ \
 "
=20
-FILES:${PN}-libllvm =3D+ "\
-  ${libdir}/libLLVM.so.${MAJOR_VER}.${MINOR_VER} \
-  ${libdir}/libLLVM-${MAJOR_VER}.so \
-  ${libdir}/libRemarks.so.* \
-"
-
 FILES:libclang =3D "\
   ${libdir}/libclang.so.* \
 "
@@ -352,7 +234,6 @@ FILES:${PN}:remove =3D "${libdir}/${BPN}/*"
=20
 INSANE_SKIP:${PN} +=3D "already-stripped"
 #INSANE_SKIP:${PN}-dev +=3D "dev-elf"
-INSANE_SKIP:${PN}-libllvm =3D "dev-so"
=20
 #Avoid SSTATE_SCAN_COMMAND running sed over llvm-config.
 SSTATE_SCAN_FILES:remove =3D "*-config"
@@ -366,15 +247,17 @@ SYSROOT_PREPROCESS_FUNCS:append:class-target =3D " =
clang_sysroot_preprocess"
 SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk =3D " clang_sysroot_prep=
rocess"
=20
 clang_sysroot_preprocess() {
-	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-	install -m 0755 ${S}/llvm/tools/llvm-config/llvm-config ${SYSROOT_DESTD=
IR}${bindir_crossscripts}/
-	ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config=
${PV}
+	install -d ${SYSROOT_DESTDIR}${bindir}/
=20
 	binaries=3D"diagtool clang-${MAJOR_VER} clang-format clang-offload-pack=
ager
 	                clang-offload-bundler clang-scan-deps clang-repl
-	                clang-refactor clang-check clang-extdef-mapping clang-a=
pply-replacements
-	                clang-reorder-fields clang-tidy clang-change-namespace =
clang-doc clang-include-fixer
-	                find-all-symbols clang-move clang-query pp-trace modula=
rize"
+	                clang-refactor clang-check clang-extdef-mapping"
+
+	if ${@bb.utils.contains('PACKAGECONFIG', 'extra-tools', 'true', 'false'=
, d)}; then
+	        binaries=3D"${binaries} clang-apply-replacements clang-reorder-=
fields
+                    clang-tidy clang-change-namespace clang-doc clang-in=
clude-fixer
+                    find-all-symbols clang-move clang-query pp-trace mod=
ularize"
+	fi
=20
 	if ${@bb.utils.contains('PACKAGECONFIG', 'clangd', 'true', 'false', d)}=
; then
 	        binaries=3D"${binaries} clangd"
--=20
2.43.0


