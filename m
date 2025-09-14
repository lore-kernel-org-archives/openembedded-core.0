Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D605CAC598
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 13:33:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9606.1757856785653688205
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 06:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0760A168F
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 06:32:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E3CD23F63F
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 06:33:04 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 5/6] llvm: add recipe for just the LLVM libraries
Date: Sun, 14 Sep 2025 14:32:57 +0100
Message-ID: <20250914133258.2625735-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914133258.2625735-1-ross.burton@arm.com>
References: <20250914133258.2625735-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 13:33:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223355

Whilst it's convenient to build all of the LLVM project in one big
recipe, that's not ideal when we may just need LLVM on target and not
the rest.

Bring back a LLVM recipe that can be used by both clang (shortly) and
Rust (in the future)

Set the build type to MinSizeRel and DEBUG_LEVELFLAG to -g1 (instead of
the default, -g): the LLVM debug symbols are very large (several
gigabytes) and this reduces them to hundreds of megabytes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc |   1 +
 meta/recipes-devtools/clang/llvm_git.bb  | 132 +++++++++++++++++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/llvm_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 6cfa76e2a3d..9c1d38c7350 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -483,6 +483,7 @@ RECIPE_MAINTAINER:pn-lld =3D "Khem Raj <raj.khem@gmai=
l.com>"
 RECIPE_MAINTAINER:pn-lldb =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-project-source-21.1.0 =3D "Khem Raj <raj.khem@=
gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D "Khem Raj <raj.khem@gmail.co=
m>"
+RECIPE_MAINTAINER:pn-llvm =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-log4cplus =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-lrzsz =3D "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devto=
ols/clang/llvm_git.bb
new file mode 100644
index 00000000000..913fff48082
--- /dev/null
+++ b/meta/recipes-devtools/clang/llvm_git.bb
@@ -0,0 +1,132 @@
+# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY =3D "The LLVM Compiler Infrastructure"
+HOMEPAGE =3D "http://llvm.org"
+LICENSE =3D "Apache-2.0-with-LLVM-exception"
+SECTION =3D "devel"
+
+require common-clang.inc
+require common-source.inc
+
+LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D8a15a0759ef07f2682d2ba4b8=
93c9afe"
+
+DEPENDS =3D "llvm-tblgen-native libffi libxml2 zlib zstd"
+
+inherit cmake pkgconfig lib_package
+
+OECMAKE_SOURCEPATH =3D "${S}/llvm"
+
+# By default we build all the supported CPU architectures, and the GPU t=
argets
+# if the opengl or vulkan DISTRO_FEATURES are enabled.
+#
+# For target builds we default to building that specific architecture, B=
PF, and the GPU targets if required.
+#
+# The available target list can be seen in the source code
+# in the LLVM_ALL_TARGETS assignment:
+# https://github.com/llvm/llvm-project/blob/main/llvm/CMakeLists.txt
+LLVM_TARGETS_GPU ?=3D "${@bb.utils.contains_any('DISTRO_FEATURES', 'open=
gl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
+LLVM_TARGETS_TO_BUILD ?=3D "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;Loong=
Arch;${LLVM_TARGETS_GPU}"
+LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_arch(bb, d)};=
BPF;${LLVM_TARGETS_GPU}"
+
+LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?=3D ""
+
+HF =3D ""
+HF:class-target =3D "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard',=
 'hf', '', d)}"
+HF[vardepvalue] =3D "${HF}"
+
+EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DMinSizeRel \
+                  -DLLVM_ENABLE_ASSERTIONS=3DOFF \
+                  -DLLVM_ENABLE_EXPENSIVE_CHECKS=3DOFF \
+                  -DLLVM_ENABLE_PIC=3DON \
+                  -DLLVM_ENABLE_BINDINGS=3DOFF \
+                  -DLLVM_ENABLE_FFI=3DON \
+                  -DLLVM_ENABLE_RTTI=3DON \
+                  -DLLVM_TARGETS_TO_BUILD=3D'${LLVM_TARGETS_TO_BUILD}' \
+                  -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=3D'${LLVM_EXPERIM=
ENTAL_TARGETS_TO_BUILD}' \
+                  -DLLVM_LIBDIR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \
+                  -DLLVM_VERSION_SUFFIX=3D'${VER_SUFFIX}' \
+                  -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=3DON \
+                  -DLLVM_INCLUDE_TESTS=3DOFF \
+                  -DLLVM_INCLUDE_EXAMPLES=3DOFF \
+                  -DLLVM_TOOL_OBJ2YAML_BUILD=3DOFF \
+                  -DLLVM_TOOL_YAML2OBJ_BUILD=3DOFF \
+                  -DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-tblgen=
 \
+                 "
+
+EXTRA_OECMAKE:append:class-target =3D "\
+                  -DLLVM_DEFAULT_TARGET_TRIPLE=3D${TARGET_SYS}${HF} \
+                  -DLLVM_TARGET_ARCH=3D${HOST_ARCH} \
+                  -DLLVM_HOST_TRIPLE=3D${TARGET_SYS}${HF} \
+                  -DLLVM_CONFIG_PATH=3D${STAGING_BINDIR_NATIVE}/llvm-con=
fig \
+                  -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
+                 "
+
+EXTRA_OECMAKE:append:class-nativesdk =3D "\
+                  -DLLVM_HOST_TRIPLE=3D${SDK_SYS} \
+                  -DLLVM_CONFIG_PATH=3D${STAGING_BINDIR_NATIVE}/llvm-con=
fig \
+                  -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
+                 "
+
+PACKAGECONFIG ??=3D "eh rtti shared-libs ${@bb.utils.filter('DISTRO_FEAT=
URES', 'lto thin-lto', d)}"
+PACKAGECONFIG:remove:class-native =3D "lto thin-lto"
+
+PACKAGECONFIG[eh] =3D "-DLLVM_ENABLE_EH=3DON,-DLLVM_ENABLE_EH=3DOFF"
+PACKAGECONFIG[exegesis] =3D "-DLLVM_TOOL_LLVM_EXEGESIS_BUILD=3DON,-DLLVM=
_TOOL_LLVM_EXEGESIS_BUILD=3DOFF"
+PACKAGECONFIG[libedit] =3D "-DLLVM_ENABLE_LIBEDIT=3DON,-DLLVM_ENABLE_LIB=
EDIT=3DOFF,libedit"
+PACKAGECONFIG[rtti] =3D "-DLLVM_ENABLE_RTTI=3DON,-DLLVM_ENABLE_RTTI=3DOF=
F"
+PACKAGECONFIG[shared-libs] =3D "-DLLVM_BUILD_LLVM_DYLIB=3DON -DLLVM_LINK=
_LLVM_DYLIB=3DON,-DLLVM_BUILD_LLVM_DYLIB=3DOFF -DLLVM_LINK_LLVM_DYLIB=3DO=
FF"
+PACKAGECONFIG[split-dwarf] =3D "-DLLVM_USE_SPLIT_DWARF=3DON,-DLLVM_USE_S=
PLIT_DWARF=3DOFF"
+PACKAGECONFIG[opt-viewer] =3D "-DLLVM_TOOL_OPT_VIEWER_BUILD=3DON,-DLLVM_=
TOOL_OPT_VIEWER_BUILD=3DOFF, \
+                             python3-pyyaml-native python3-pygments-nati=
ve python3-pyyaml python3-pygments, \
+                             python3-pyyaml python3-pygments,"
+PACKAGECONFIG[lto] =3D "-DLLVM_ENABLE_LTO=3DFull -DLLVM_BINUTILS_INCDIR=3D=
${STAGING_INCDIR},,binutils,"
+PACKAGECONFIG[thin-lto] =3D "-DLLVM_ENABLE_LTO=3DThin -DLLVM_BINUTILS_IN=
CDIR=3D${STAGING_INCDIR},,binutils,"
+
+# LLVM debug symbols are very large (several gigabytes), reduce the debu=
g level
+# so they're just hundreds of megabytes.
+DEBUG_LEVELFLAG =3D "-g1"
+
+reproducible_build_variables() {
+    sed -i -e "s,${DEBUG_PREFIX_MAP},,g" \
+        -e "s,--sysroot=3D${RECIPE_SYSROOT},,g" \
+        -e "s,${STAGING_DIR_HOST},,g" \
+        -e "s,${S}/llvm,,g"  \
+        -e "s,${B},,g" \
+        ${B}/tools/llvm-config/BuildVariables.inc
+}
+
+do_configure:append:class-target() {
+    reproducible_build_variables
+}
+do_configure:append:class-nativesdk() {
+    reproducible_build_variables
+}
+
+do_install:append() {
+    # llvm hardcodes lib as install path, this corrects it to actual lib=
dir.
+    # https://github.com/llvm/llvm-project/issues/152193
+    if [ -d ${D}/${prefix}/lib -a ! -d ${D}/${libdir} ]; then
+        mv ${D}/${prefix}/lib ${D}/${libdir}
+    fi
+
+    # Reproducibility fixes
+    sed -i -e 's,${WORKDIR},,g' ${D}/${libdir}/cmake/llvm/LLVMConfig.cma=
ke
+}
+
+do_install:append:class-native() {
+    # These are provided by llvm-tblgen-native
+    rm ${D}${bindir}/*-tblgen
+}
+
+SYSROOT_PREPROCESS_FUNCS:append:class-target =3D " llvm_sysroot_preproce=
ss"
+SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk =3D " llvm_sysroot_prepr=
ocess"
+
+llvm_sysroot_preprocess() {
+        install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+        install -m 0755 ${S}/llvm/tools/llvm-config/llvm-config ${SYSROO=
T_DESTDIR}${bindir_crossscripts}/
+}
+
+FILES:${PN}-dev +=3D "${libdir}/llvm-config"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


