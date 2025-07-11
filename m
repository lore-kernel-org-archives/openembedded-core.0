Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0225EC83F1B
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 15:51:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17379.1752249104476248936
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 08:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92EF016F8
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 08:51:33 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B26B73F6A8
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 08:51:43 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] lldb: add new recipe, split out of clang
Date: Fri, 11 Jul 2025 16:51:36 +0100
Message-ID: <20250711155136.2172651-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250711155136.2172651-1-ross.burton@arm.com>
References: <20250711155136.2172651-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 15:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220147

LLDB takes a reasonable amount of time to compile, but also isn't an
essential component of the LLVM suite.

Instead of always building it when we build clang, split it out into a
separate recipe.

On my build machine where clang takes 21 minutes to build with lldb, it
takes 19 minutes without lldb.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc |  1 +
 meta/recipes-devtools/clang/clang_git.bb | 54 +++---------------------
 meta/recipes-devtools/clang/lldb_git.bb  | 53 +++++++++++++++++++++++
 3 files changed, 61 insertions(+), 47 deletions(-)
 create mode 100644 meta/recipes-devtools/clang/lldb_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 331c438fd67..f49d7317ee9 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -479,6 +479,7 @@ RECIPE_MAINTAINER:pn-linux-yocto =3D "Bruce Ashfield =
<bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-dev =3D "Bruce Ashfield <bruce.ashfield=
@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-rt =3D "Bruce Ashfield <bruce.ashfield@=
gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-tiny =3D "Bruce Ashfield <bruce.ashfiel=
d@gmail.com>"
+RECIPE_MAINTAINER:pn-lldb =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-project-source-20.1.7 =3D "Khem Raj <raj.khem@=
gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D "Khem Raj <raj.khem@gmail.co=
m>"
 RECIPE_MAINTAINER:pn-logrotate =3D "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index 0f1b950cc63..be56b169c29 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -55,7 +55,7 @@ PACKAGECONFIG_CLANG_COMMON =3D "build-id eh libedit rtt=
i shared-libs libclang-pyth
                               ${@bb.utils.contains('TC_CXX_RUNTIME', 'll=
vm', 'compiler-rt libcplusplus libomp unwindlib', '', d)} \
                               "
=20
-PACKAGECONFIG ??=3D "lldb-wchar terminfo \
+PACKAGECONFIG ??=3D "terminfo \
                    ${PACKAGECONFIG_CLANG_COMMON} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'lto thin-lto',=
 d)} \
                    "
@@ -79,11 +79,9 @@ PACKAGECONFIG[clangd-dexp] =3D "-DCLANGD_BUILD_DEXP=3D=
ON,-DCLANGD_BUILD_DEXP=3DOFF,,"
 PACKAGECONFIG[compiler-rt] =3D "-DCLANG_DEFAULT_RTLIB=3Dcompiler-rt,,"
 PACKAGECONFIG[eh] =3D "-DLLVM_ENABLE_EH=3DON,-DLLVM_ENABLE_EH=3DOFF,,"
 PACKAGECONFIG[libcplusplus] =3D "-DCLANG_DEFAULT_CXX_STDLIB=3Dlibc++,,"
-PACKAGECONFIG[libedit] =3D "-DLLVM_ENABLE_LIBEDIT=3DON -DLLDB_ENABLE_LIB=
EDIT=3DON,-DLLVM_ENABLE_LIBEDIT=3DOFF -DLLDB_ENABLE_LIBEDIT=3DOFF,libedit=
 libedit-native"
+PACKAGECONFIG[libedit] =3D "-DLLVM_ENABLE_LIBEDIT=3DON,-DLLVM_ENABLE_LIB=
EDIT=3DOFF,libedit libedit-native"
 PACKAGECONFIG[libomp] =3D "-DCLANG_DEFAULT_OPENMP_RUNTIME=3Dlibomp,,"
 PACKAGECONFIG[lld] =3D "-DCLANG_DEFAULT_LINKER=3Dlld,,"
-PACKAGECONFIG[lldb-lua] =3D "-DLLDB_ENABLE_LUA=3DON,-DLLDB_ENABLE_LUA=3D=
OFF,lua"
-PACKAGECONFIG[lldb-wchar] =3D "-DLLDB_EDITLINE_USE_WCHAR=3D1,-DLLDB_EDIT=
LINE_USE_WCHAR=3D0,"
 PACKAGECONFIG[lto] =3D "-DLLVM_ENABLE_LTO=3DFull -DLLVM_BINUTILS_INCDIR=3D=
${STAGING_INCDIR},,binutils,"
 PACKAGECONFIG[pfm] =3D "-DLLVM_ENABLE_LIBPFM=3DON,-DLLVM_ENABLE_LIBPFM=3D=
OFF,libpfm,"
 PACKAGECONFIG[rtti] =3D "-DLLVM_ENABLE_RTTI=3DON,-DLLVM_ENABLE_RTTI=3DOF=
F,,"
@@ -107,9 +105,8 @@ LLVM_BINDINGS_LIST;LLVM_ENABLE_FFI;FFI_INCLUDE_DIR;LL=
VM_OPTIMIZED_TABLEGEN;\
 LLVM_ENABLE_RTTI;LLVM_ENABLE_EH;LLVM_BUILD_EXTERNAL_COMPILER_RT;CMAKE_SY=
STEM_NAME;\
 CMAKE_BUILD_TYPE;BUILD_SHARED_LIBS;LLVM_ENABLE_PROJECTS;LLVM_ENABLE_RUNT=
IMES;LLVM_BINUTILS_INCDIR;\
 LLVM_TARGETS_TO_BUILD;LLVM_EXPERIMENTAL_TARGETS_TO_BUILD;PYTHON_EXECUTAB=
LE;\
-PYTHON_LIBRARY;PYTHON_INCLUDE_DIR;LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN;L=
LDB_EDITLINE_USE_WCHAR;\
-LLVM_ENABLE_LIBEDIT;LLDB_ENABLE_LIBEDIT;LLDB_PYTHON_RELATIVE_PATH;LLDB_P=
YTHON_EXE_RELATIVE_PATH;\
-LLDB_PYTHON_EXT_SUFFIX;CMAKE_C_FLAGS_RELEASE;CMAKE_CXX_FLAGS_RELEASE;CMA=
KE_ASM_FLAGS_RELEASE;\
+PYTHON_LIBRARY;PYTHON_INCLUDE_DIR;LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN;\
+LLVM_ENABLE_LIBEDIT;CMAKE_C_FLAGS_RELEASE;CMAKE_CXX_FLAGS_RELEASE;CMAKE_=
ASM_FLAGS_RELEASE;\
 CLANG_DEFAULT_CXX_STDLIB;CLANG_DEFAULT_RTLIB;CLANG_DEFAULT_UNWINDLIB;\
 CLANG_DEFAULT_OPENMP_RUNTIME;LLVM_ENABLE_PER_TARGET_RUNTIME_DIR;\
 LLVM_BUILD_TOOLS;LLVM_USE_HOST_TOOLS;LLVM_CONFIG_PATH;LLVM_EXTERNAL_SPIR=
V_HEADERS_SOURCE_DIR;\
@@ -133,13 +130,7 @@ HF[vardepvalue] =3D "${HF}"
=20
 # Ensure that LLVM_PROJECTS does not contain compiler runtime components=
 e.g. libcxx etc
 # they are enabled via LLVM_ENABLE_RUNTIMES
-LLVM_PROJECTS ?=3D "clang;clang-tools-extra;libclc;lld${LLDB}"
-LLDB ?=3D ";lldb"
-# LLDB support for RISCV32/Mips32 does not work yet
-LLDB:riscv32 =3D ""
-LLDB:mips =3D ""
-LLDB:mipsel =3D ""
-LLDB:powerpc =3D ""
+LLVM_PROJECTS ?=3D "clang;clang-tools-extra;libclc;lld"
=20
 # linux hosts (.so) on Windows .pyd
 SOLIBSDEV:mingw32 =3D ".pyd"
@@ -172,10 +163,7 @@ EXTRA_OECMAKE:append:class-native =3D "\
                   -DPYTHON_EXECUTABLE=3D'${PYTHON}' \
 "
 EXTRA_OECMAKE:append:class-nativesdk =3D "\
-                  -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DLLDB_PYTHON_RELATI=
VE_PATH=3D${PYTHON_SITEPACKAGES_DIR} \
-                                                  -DLLDB_PYTHON_EXE_RELA=
TIVE_PATH=3D${PYTHON_PN} \
-                                                  -DLLDB_PYTHON_EXT_SUFF=
IX=3D${SOLIBSDEV} \
-                                                  -DCMAKE_TOOLCHAIN_FILE=
=3D${WORKDIR}/toolchain-native.cmake' \
+                  -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DCMAKE_TOOLCHAIN_FI=
LE=3D${WORKDIR}/toolchain-native.cmake' \
                   -DCMAKE_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_=
PREFIX}llvm-ranlib \
                   -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREF=
IX}llvm-ar \
                   -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREF=
IX}llvm-nm \
@@ -183,9 +171,6 @@ EXTRA_OECMAKE:append:class-nativesdk =3D "\
                   -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
                   -DLLVM_HEADERS_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llv=
m-min-tblgen \
                   -DPYTHON_LIBRARY=3D${STAGING_LIBDIR}/lib${PYTHON_DIR}$=
{PYTHON_ABI}.so \
-                  -DLLDB_PYTHON_RELATIVE_PATH=3D${PYTHON_SITEPACKAGES_DI=
R} \
-                  -DLLDB_PYTHON_EXE_RELATIVE_PATH=3D${PYTHON_PN} \
-                  -DLLDB_PYTHON_EXT_SUFFIX=3D${SOLIBSDEV} \
                   -DPYTHON_INCLUDE_DIR=3D${STAGING_INCDIR}/${PYTHON_DIR}=
${PYTHON_ABI} \
                   -DPYTHON_EXECUTABLE=3D'${PYTHON}' \
 "
@@ -202,9 +187,6 @@ EXTRA_OECMAKE:append:class-target =3D "\
                   -DPYTHON_LIBRARY=3D${STAGING_LIBDIR}/lib${PYTHON_DIR}$=
{PYTHON_ABI}.so \
                   -DPYTHON_INCLUDE_DIR=3D${STAGING_INCDIR}/${PYTHON_DIR}=
${PYTHON_ABI} \
                   -DLLVM_LIBDIR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \
-                  -DLLDB_PYTHON_RELATIVE_PATH=3D${PYTHON_SITEPACKAGES_DI=
R} \
-                  -DLLDB_PYTHON_EXE_RELATIVE_PATH=3D${bindir} \
-                  -DLLDB_PYTHON_EXT_SUFFIX=3D${SOLIBSDEV} \
 "
=20
 DEPENDS =3D "binutils zlib zstd libffi libxml2 libxml2-native ninja-nati=
ve swig-native spirv-tools-native llvm-tblgen-native"
@@ -317,12 +299,10 @@ PROVIDES:append:class-target =3D " llvm libclc"
 PROVIDES:append:class-nativesdk =3D " nativesdk-llvm nativesdk-libclc"
=20
 PACKAGES =3D+ "${PN}-libllvm ${PN}-lldb-python ${PN}-libclang-python ${P=
N}-libclang-cpp ${PN}-tidy ${PN}-format ${PN}-tools ${PN}-clc \
-             libclang lldb lldb-server liblldb llvm-linker-tools"
+             libclang llvm-linker-tools"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-RDEPENDS:lldb +=3D "${PN}-lldb-python lldb-server"
-
 RDEPENDS:${PN}-tools +=3D "\
   perl-module-digest-md5 \
   perl-module-file-basename \
@@ -343,8 +323,6 @@ FILES:llvm-linker-tools =3D "${libdir}/LLVMgold* ${li=
bdir}/libLTO.so.* ${libdir}/L
=20
 FILES:${PN}-libclang-cpp =3D "${libdir}/libclang-cpp.so.*"
=20
-FILES:${PN}-lldb-python =3D "${libdir}/python*/site-packages/lldb/*"
-
 FILES:${PN}-libclang-python =3D "${PYTHON_SITEPACKAGES_DIR}/clang/*"
=20
 FILES:${PN}-tidy =3D "${bindir}/*clang-tidy*"
@@ -407,22 +385,6 @@ FILES:${PN} +=3D "\
=20
 FILES:${PN}-clc +=3D "${datadir}/clc"
=20
-FILES:lldb =3D "\
-  ${bindir}/lldb \
-  ${bindir}/lldb-argdumper \
-  ${bindir}/lldb-instr \
-  ${bindir}/lldb-vscode \
-"
-
-FILES:lldb-server =3D "\
-  ${bindir}/lldb-server \
-"
-
-FILES:liblldb =3D "\
-  ${libdir}/liblldbIntelFeatures.so.* \
-  ${libdir}/liblldb.so.* \
-"
-
 FILES:${PN}-libllvm =3D+ "\
   ${libdir}/libLLVM.so.${MAJOR_VER}.${MINOR_VER} \
   ${libdir}/libLLVM-${MAJOR_VER}.so \
@@ -449,8 +411,6 @@ FILES:${PN}:remove =3D "${libdir}/${BPN}/*"
=20
 INSANE_SKIP:${PN} +=3D "already-stripped"
 #INSANE_SKIP:${PN}-dev +=3D "dev-elf"
-INSANE_SKIP:${PN}-lldb-python +=3D "dev-so dev-deps"
-INSANE_SKIP:${MLPREFIX}liblldb =3D "dev-so"
 INSANE_SKIP:${PN}-libllvm =3D "dev-so"
=20
 #Avoid SSTATE_SCAN_COMMAND running sed over llvm-config.
diff --git a/meta/recipes-devtools/clang/lldb_git.bb b/meta/recipes-devto=
ols/clang/lldb_git.bb
new file mode 100644
index 00000000000..a07be0e3d4c
--- /dev/null
+++ b/meta/recipes-devtools/clang/lldb_git.bb
@@ -0,0 +1,53 @@
+SUMMARY =3D "LLDB"
+DESCRIPTION =3D "LLDB is a next generation, high-performance debugger."
+HOMEPAGE =3D "https://lldb.llvm.org"
+SECTION =3D "devel"
+
+require common-clang.inc
+require common-source.inc
+
+COMPATIBLE_HOST =3D "(x86_64|i.86|arm|aarch64|powerpc64).*-linux"
+
+LIC_FILES_CHKSUM =3D "file://lldb/LICENSE.TXT;md5=3D2e0d44968471fcde9800=
34dbb826bea9"
+
+inherit cmake pkgconfig python3native python3targetconfig
+
+# This actually just depends on LLVM but right now llvm and clang are bu=
ilt together
+DEPENDS =3D "llvm-tblgen-native clang"
+
+OECMAKE_SOURCEPATH =3D "${S}/lldb"
+
+EXTRA_OECMAKE =3D "-DLLDB_INCLUDE_TESTS=3DOFF \
+                 -DLLDB_ENABLE_LUA=3DOFF \
+                 -DLLDB_PYTHON_RELATIVE_PATH=3D${PYTHON_SITEPACKAGES_DIR=
} \
+                 -DLLDB_PYTHON_EXE_RELATIVE_PATH=3D${PYTHON_PN} \
+                 -DLLDB_PYTHON_EXT_SUFFIX=3D${SOLIBSDEV} \
+                 -DLLVM_DIR=3D${STAGING_LIBDIR}/cmake/llvm/ \
+                 -DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-tblgen =
\
+                 -DLLDB_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/lldb-tbl=
gen \
+"
+
+PACKAGECONFIG ??=3D "libedit libxml2 lzma"
+PACKAGECONFIG[libedit] =3D "-DLLDB_ENABLE_LIBEDIT=3DON,-DLLDB_ENABLE_LIB=
EDIT=3DOFF,libedit"
+PACKAGECONFIG[libxml2] =3D "-DLLDB_ENABLE_LIBXML2=3DON,-DLLDB_ENABLE_LIB=
XML2=3DOFF,libxml2"
+PACKAGECONFIG[lzma] =3D "-DLLDB_ENABLE_LLDB_ENABLE_LZMA=3DON,-DLLDB_ENAB=
LE_LLDB_ENABLE_LZMA=3DOFF,xz"
+PACKAGECONFIG[python] =3D "-DLLDB_ENABLE_PYTHON=3DON,-DLLDB_ENABLE_PYTHO=
N=3DOFF,swig-native"
+
+do_install:append() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', =
d)}; then
+        # Fix a bad symlink that points to the -dev .so
+        rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/lldb/_lldb.so
+        ln -s ${libdir}/liblldb.so.${MAJOR_VER}.${MINOR_VER} ${D}${PYTHO=
N_SITEPACKAGES_DIR}/lldb/_lldb.so
+    fi
+}
+
+PACKAGES =3D+ "${PN}-python ${PN}-server"
+
+FILES:${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}"
+RDEPENDS:${PN}-python =3D "${PN}"
+# This has a symlink to the lldb library
+INSANE_SKIP:${PN}-python =3D "dev-so"
+
+FILES:${PN}-server =3D "${bindir}/lldb-server"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


