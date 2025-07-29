Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC87C83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 12:25:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5792.1753791895489862772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 05:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D89C1516
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 05:24:47 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D0EBB3F673
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 05:24:54 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/3] clang: split lld into a separate lld recipe
Date: Tue, 29 Jul 2025 13:24:48 +0100
Message-ID: <20250729122448.1067745-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250729122448.1067745-1-ross.burton@arm.com>
References: <20250729122448.1067745-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 12:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221074

The lld linker is a standalone project under the LLVM umbrella that just
depends on libLLVM and nothing else, such as clang.

To reduce the build time of clang if lld is not being used, split it out
into a separate recipe.

To ensure that lld is present if needed, the clang-cross recipe will
depend on lld-native if ld-is-lld is enable.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../recipes-devtools/clang/clang-cross_git.bb |  2 +-
 meta/recipes-devtools/clang/clang_git.bb      |  8 +++-----
 meta/recipes-devtools/clang/lld_git.bb        | 20 +++++++++++++++++++
 4 files changed, 25 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/clang/lld_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 927aac16d6d..5260bde36bc 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -480,6 +480,7 @@ RECIPE_MAINTAINER:pn-linux-yocto =3D "Bruce Ashfield =
<bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-dev =3D "Bruce Ashfield <bruce.ashfield=
@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-rt =3D "Bruce Ashfield <bruce.ashfield@=
gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-tiny =3D "Bruce Ashfield <bruce.ashfiel=
d@gmail.com>"
+RECIPE_MAINTAINER:pn-lld =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-project-source-20.1.8 =3D "Khem Raj <raj.khem@=
gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D "Khem Raj <raj.khem@gmail.co=
m>"
diff --git a/meta/recipes-devtools/clang/clang-cross_git.bb b/meta/recipe=
s-devtools/clang/clang-cross_git.bb
index 7b12e450091..e240a1bb6de 100644
--- a/meta/recipes-devtools/clang/clang-cross_git.bb
+++ b/meta/recipes-devtools/clang/clang-cross_git.bb
@@ -11,7 +11,7 @@ PN =3D "clang-cross-${TARGET_ARCH}"
=20
 inherit cross
=20
-DEPENDS +=3D "clang-native virtual/cross-binutils"
+DEPENDS +=3D "clang-native virtual/cross-binutils ${@bb.utils.contains('=
DISTRO_FEATURES', 'ld-is-lld', 'lld-native', '', d)}"
=20
 do_install() {
         install -d ${D}${bindir}
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index 35b40d0ed18..ad070b5a3e0 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -60,7 +60,7 @@ PACKAGECONFIG[eh] =3D "-DLLVM_ENABLE_EH=3DON,-DLLVM_ENA=
BLE_EH=3DOFF,,"
 PACKAGECONFIG[libcplusplus] =3D "-DCLANG_DEFAULT_CXX_STDLIB=3Dlibc++,,"
 PACKAGECONFIG[libedit] =3D "-DLLVM_ENABLE_LIBEDIT=3DON,-DLLVM_ENABLE_LIB=
EDIT=3DOFF,libedit libedit-native"
 PACKAGECONFIG[libomp] =3D "-DCLANG_DEFAULT_OPENMP_RUNTIME=3Dlibomp,,"
-PACKAGECONFIG[lld] =3D "-DCLANG_DEFAULT_LINKER=3Dlld,,"
+PACKAGECONFIG[lld] =3D "-DCLANG_DEFAULT_LINKER=3Dlld,,,lld"
 PACKAGECONFIG[lto] =3D "-DLLVM_ENABLE_LTO=3DFull -DLLVM_BINUTILS_INCDIR=3D=
${STAGING_INCDIR},,binutils,"
 PACKAGECONFIG[pfm] =3D "-DLLVM_ENABLE_LIBPFM=3DON,-DLLVM_ENABLE_LIBPFM=3D=
OFF,libpfm,"
 PACKAGECONFIG[rtti] =3D "-DLLVM_ENABLE_RTTI=3DON,-DLLVM_ENABLE_RTTI=3DOF=
F,,"
@@ -110,7 +110,7 @@ HF[vardepvalue] =3D "${HF}"
=20
 # Ensure that LLVM_PROJECTS does not contain compiler runtime components=
 e.g. libcxx etc
 # they are enabled via LLVM_ENABLE_RUNTIMES
-LLVM_PROJECTS ?=3D "clang;clang-tools-extra;lld"
+LLVM_PROJECTS ?=3D "clang;clang-tools-extra"
=20
 # linux hosts (.so) on Windows .pyd
 SOLIBSDEV:mingw32 =3D ".pyd"
@@ -396,10 +396,8 @@ clang_sysroot_preprocess() {
 	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
 	install -m 0755 ${S}/llvm/tools/llvm-config/llvm-config ${SYSROOT_DESTD=
IR}${bindir_crossscripts}/
 	ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config=
${PV}
-	# LLDTargets.cmake references the lld executable(!) that some modules/p=
lugins link to
-	install -d ${SYSROOT_DESTDIR}${bindir}
=20
-	binaries=3D"lld diagtool clang-${MAJOR_VER} clang-format clang-offload-=
packager
+	binaries=3D"diagtool clang-${MAJOR_VER} clang-format clang-offload-pack=
ager
 	                clang-offload-bundler clang-scan-deps clang-repl
 	                clang-refactor clang-check clang-extdef-mapping clang-a=
pply-replacements
 	                clang-reorder-fields clang-tidy clang-change-namespace =
clang-doc clang-include-fixer
diff --git a/meta/recipes-devtools/clang/lld_git.bb b/meta/recipes-devtoo=
ls/clang/lld_git.bb
new file mode 100644
index 00000000000..6c8ba03c052
--- /dev/null
+++ b/meta/recipes-devtools/clang/lld_git.bb
@@ -0,0 +1,20 @@
+SUMMARY =3D "LLD - the LLVM Linker"
+DESCRIPTION =3D "LLD is a linker from the LLVM project that is a drop-in=
 replacement for system linkers and runs much faster than them."
+HOMEPAGE =3D "https://lld.llvm.org"
+SECTION =3D "devel"
+
+require common-clang.inc
+require common-source.inc
+
+LIC_FILES_CHKSUM =3D "file://lld/LICENSE.TXT;md5=3Dae7dc7c027b1fa89b5b01=
3d391d3ee2b"
+
+inherit cmake pkgconfig
+
+DEPENDS =3D "llvm-tblgen-native llvm"
+
+OECMAKE_SOURCEPATH =3D "${S}/lld"
+
+EXTRA_OECMAKE =3D "-DLLVM_INCLUDE_TESTS=3DOFF \
+                 -DLLVM_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llvm-tbl=
gen"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


