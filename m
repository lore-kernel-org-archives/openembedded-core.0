Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE608C87FCC
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 19:12:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.70538.1753989140294417368
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 12:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FB091A25
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 12:12:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E0423F66E
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 12:12:18 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] clang: split lld into a separate lld recipe
Date: Thu, 31 Jul 2025 20:12:13 +0100
Message-ID: <20250731191213.1382928-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 19:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221204

The lld linker is a standalone project under the LLVM umbrella that just
depends on libLLVM and nothing else, such as clang.

To reduce the build time of clang if lld is not being used, split it out
into a separate recipe.

To ensure that lld is present if needed, the clang-cross recipe will
depend on lld-native if ld-is-lld is enable.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../clang/clang-cross-canadian_git.bb         |  2 +-
 .../recipes-devtools/clang/clang-cross_git.bb |  6 +++--
 .../clang/clang-crosssdk_git.bb               |  3 ++-
 meta/recipes-devtools/clang/clang_git.bb      | 12 ++++-----
 meta/recipes-devtools/clang/lld_git.bb        | 26 +++++++++++++++++++
 6 files changed, 39 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-devtools/clang/lld_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index ed1bc18ba39..96d5a0819c8 100644
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
diff --git a/meta/recipes-devtools/clang/clang-cross-canadian_git.bb b/me=
ta/recipes-devtools/clang/clang-cross-canadian_git.bb
index c9668615780..18bd6ecfded 100644
--- a/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
+++ b/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
@@ -11,7 +11,7 @@ PN =3D "clang-cross-canadian-${TRANSLATED_TARGET_ARCH}"
=20
 inherit cross-canadian
=20
-DEPENDS =3D "nativesdk-clang binutils-cross-canadian-${TRANSLATED_TARGET=
_ARCH} virtual/nativesdk-cross-binutils virtual/nativesdk-libc"
+DEPENDS =3D "nativesdk-clang binutils-cross-canadian-${TRANSLATED_TARGET=
_ARCH} virtual/nativesdk-cross-binutils virtual/nativesdk-libc ${@bb.util=
s.contains('DISTRO_FEATURES', 'ld-is-lld', 'nativesdk-lld', '', d)}"
=20
 do_install() {
 	install -d ${D}${bindir}
diff --git a/meta/recipes-devtools/clang/clang-cross_git.bb b/meta/recipe=
s-devtools/clang/clang-cross_git.bb
index bd72ee4e6d7..33b01e42349 100644
--- a/meta/recipes-devtools/clang/clang-cross_git.bb
+++ b/meta/recipes-devtools/clang/clang-cross_git.bb
@@ -11,7 +11,7 @@ PN =3D "clang-cross-${TARGET_ARCH}"
=20
 inherit cross
=20
-DEPENDS =3D "clang-native virtual/cross-binutils"
+DEPENDS =3D "clang-native virtual/cross-binutils ${@bb.utils.contains('D=
ISTRO_FEATURES', 'ld-is-lld', 'lld-native', '', d)}"
=20
 do_install() {
 	install -d ${D}${bindir}
@@ -19,6 +19,8 @@ do_install() {
             llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip llvm-objcopy =
llvm-objdump llvm-readelf \
             llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov
 	do
-		ln -sf ../$tool ${D}${bindir}/${TARGET_PREFIX}$tool
+		if [ -x ${STAGING_BINDIR_NATIVE}/$tool ]; then
+			ln -sf ../$tool ${D}${bindir}/${TARGET_PREFIX}$tool
+		fi
 	done
 }
diff --git a/meta/recipes-devtools/clang/clang-crosssdk_git.bb b/meta/rec=
ipes-devtools/clang/clang-crosssdk_git.bb
index 320579d8f12..9b527975a93 100644
--- a/meta/recipes-devtools/clang/clang-crosssdk_git.bb
+++ b/meta/recipes-devtools/clang/clang-crosssdk_git.bb
@@ -11,7 +11,8 @@ PN =3D "clang-crosssdk-${SDK_SYS}"
=20
 inherit crosssdk
=20
-DEPENDS =3D "clang-native nativesdk-clang-glue virtual/nativesdk-cross-b=
inutils virtual/nativesdk-libc"
+DEPENDS =3D "clang-native nativesdk-clang-glue virtual/nativesdk-cross-b=
inutils virtual/nativesdk-libc \
+	       ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', 'lld-native=
', '', d)}"
=20
 do_install() {
     install -d ${D}${bindir}
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index df091d3a554..3b803ead835 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -57,7 +57,7 @@ PACKAGECONFIG[eh] =3D "-DLLVM_ENABLE_EH=3DON,-DLLVM_ENA=
BLE_EH=3DOFF,,"
 PACKAGECONFIG[libcplusplus] =3D "-DCLANG_DEFAULT_CXX_STDLIB=3Dlibc++,,"
 PACKAGECONFIG[libedit] =3D "-DLLVM_ENABLE_LIBEDIT=3DON,-DLLVM_ENABLE_LIB=
EDIT=3DOFF,libedit libedit-native"
 PACKAGECONFIG[libomp] =3D "-DCLANG_DEFAULT_OPENMP_RUNTIME=3Dlibomp,,"
-PACKAGECONFIG[lld] =3D "-DCLANG_DEFAULT_LINKER=3Dlld,,"
+PACKAGECONFIG[lld] =3D "-DCLANG_DEFAULT_LINKER=3Dlld,,,"
 PACKAGECONFIG[lto] =3D "-DLLVM_ENABLE_LTO=3DFull -DLLVM_BINUTILS_INCDIR=3D=
${STAGING_INCDIR},,binutils,"
 PACKAGECONFIG[pfm] =3D "-DLLVM_ENABLE_LIBPFM=3DON,-DLLVM_ENABLE_LIBPFM=3D=
OFF,libpfm,"
 PACKAGECONFIG[rtti] =3D "-DLLVM_ENABLE_RTTI=3DON,-DLLVM_ENABLE_RTTI=3DOF=
F,,"
@@ -89,7 +89,7 @@ HF[vardepvalue] =3D "${HF}"
=20
 # Ensure that LLVM_PROJECTS does not contain compiler runtime components=
 e.g. libcxx etc
 # they are enabled via LLVM_ENABLE_RUNTIMES
-LLVM_PROJECTS ?=3D "clang;clang-tools-extra;lld"
+LLVM_PROJECTS ?=3D "clang;clang-tools-extra"
=20
 # linux hosts (.so) on Windows .pyd
 SOLIBSDEV:mingw32 =3D ".pyd"
@@ -141,8 +141,8 @@ DEPENDS =3D "binutils zlib zstd libffi libxml2 libxml=
2-native swig-native llvm-tbl
 DEPENDS:append:class-nativesdk =3D " clang-crosssdk-${SDK_SYS} virtual/n=
ativesdk-cross-binutils"
 DEPENDS:append:class-target =3D " clang-cross-${TARGET_ARCH} ${@bb.utils=
.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}"
=20
-RRECOMMENDS:${PN} =3D "binutils"
-RRECOMMENDS:${PN}:append:class-target =3D "${@bb.utils.contains('TC_CXX_=
RUNTIME', 'llvm', ' libcxx-dev', '', d)}"
+RDEPENDS:${PN}:append:class-target =3D "${@bb.utils.contains('DISTRO_FEA=
TURES', 'ld-is-lld', ' lld', '', d)}"
+RRECOMMENDS:${PN}:append:class-target =3D "binutils ${@bb.utils.contains=
('TC_CXX_RUNTIME', 'llvm', ' libcxx-dev', '', d)}"
=20
 # patch out build host paths for reproducibility
 reproducible_build_variables() {
@@ -370,10 +370,8 @@ clang_sysroot_preprocess() {
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
index 00000000000..02006e0edc9
--- /dev/null
+++ b/meta/recipes-devtools/clang/lld_git.bb
@@ -0,0 +1,26 @@
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
+# Explicitly disable RPATHs as otherwise they're stipped out of the bina=
ries,
+# and are then non-reproducible.
+#
+# Explicitly enable symlinks as the lld build doesn't call into the llvm=
 setup
+# and turn that on.
+EXTRA_OECMAKE =3D "-DCMAKE_SKIP_BUILD_RPATH=3DON \
+                 -DLLVM_INCLUDE_TESTS=3DOFF -DLLVM_USE_SYMLINKS=3DON \
+                 -DLLVM_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llvm-tbl=
gen"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


