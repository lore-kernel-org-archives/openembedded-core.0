Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B720C83F1B
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 16:06:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17686.1752249969706931048
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 09:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A58A32247
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 09:05:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C8B4E3F6A8
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 09:06:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/3] llvm-tblgen-native: add new recipe
Date: Fri, 11 Jul 2025 17:06:05 +0100
Message-ID: <20250711160606.2208481-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250711160606.2208481-1-ross.burton@arm.com>
References: <20250711160606.2208481-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 16:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220152

Building the LLVM projects often means using the TableGen tools
(llvm-tblgen etc).

We currently build them as part of clang-native, but I am teasing the
clang recipe into its component parts and having to build llvm-native
or lldb-native simply for one tool isn't ideal.

Instead, add a native recipe that simply builds the tablegen binaries
for llvm, clang, and lldb
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/recipes-devtools/clang/clang_git.bb      | 10 +++----
 .../clang/llvm-tblgen-native_git.bb           | 27 +++++++++++++++++++
 3 files changed, 32 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/clang/llvm-tblgen-native_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 60f04da6089..331c438fd67 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -480,6 +480,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-dev =3D "Bruce Ashfi=
eld <bruce.ashfield@gmail.com
 RECIPE_MAINTAINER:pn-linux-yocto-rt =3D "Bruce Ashfield <bruce.ashfield@=
gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-tiny =3D "Bruce Ashfield <bruce.ashfiel=
d@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-project-source-20.1.7 =3D "Khem Raj <raj.khem@=
gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D "Khem Raj <raj.khem@gmail.co=
m>"
 RECIPE_MAINTAINER:pn-logrotate =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-log4cplus =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-lrzsz =3D "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index 2b5d3a27524..0f1b950cc63 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -207,7 +207,7 @@ EXTRA_OECMAKE:append:class-target =3D "\
                   -DLLDB_PYTHON_EXT_SUFFIX=3D${SOLIBSDEV} \
 "
=20
-DEPENDS =3D "binutils zlib zstd libffi libxml2 libxml2-native ninja-nati=
ve swig-native spirv-tools-native"
+DEPENDS =3D "binutils zlib zstd libffi libxml2 libxml2-native ninja-nati=
ve swig-native spirv-tools-native llvm-tblgen-native"
 DEPENDS:append:class-nativesdk =3D " clang-crosssdk-${SDK_SYS} virtual/n=
ativesdk-cross-binutils nativesdk-python3"
 DEPENDS:append:class-target =3D " clang-cross-${TARGET_ARCH} python3 ${@=
bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}=
 spirv-llvm-translator-native"
=20
@@ -276,18 +276,16 @@ do_install:append:class-native () {
         install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}${b=
indir}/clangd-indexer
     fi
     install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-char=
s-gen ${D}${bindir}/clang-tidy-confusable-chars-gen
-    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tblgen ${D}${bindir}=
/clang-tblgen
-    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/lldb-tblgen ${D}${bindir}/=
lldb-tblgen
-    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/llvm-min-tblgen ${D}${bind=
ir}/llvm-min-tblgen
     install -Dm 0755 ${B}${BINPATHPREFIX}/bin/prepare_builtins ${D}${bin=
dir}/prepare_builtins
=20
     for f in `find ${D}${bindir} -executable -type f -not -type l`; do
         test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
         echo "stripped $f"
     done
-    ln -sf clang-tblgen ${D}${bindir}/clang-tblgen${PV}
-    ln -sf llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
     ln -sf llvm-config ${D}${bindir}/llvm-config${PV}
+
+    # These are provided by llvm-tblgen-native
+    rm ${D}${bindir}/*-tblgen
 }
=20
 do_install:append:class-nativesdk () {
diff --git a/meta/recipes-devtools/clang/llvm-tblgen-native_git.bb b/meta=
/recipes-devtools/clang/llvm-tblgen-native_git.bb
new file mode 100644
index 00000000000..be04c1aa4d1
--- /dev/null
+++ b/meta/recipes-devtools/clang/llvm-tblgen-native_git.bb
@@ -0,0 +1,27 @@
+SUMMARY =3D "LLVM TableGen binaries, for the build host"
+SECTION =3D "devel"
+
+# Building the LLVM projects often means using the TableGen tools (llvm-=
tblgen,
+# etc). We could build these as part of llvm-native, but there are cases=
 where
+# this would be overkill. For example, building a target LLDB needs nati=
ve
+# tablegen binaries and a target libllvm so having to build a complete n=
ative
+# llvm is not needed.
+
+require common-clang.inc
+require common-source.inc
+
+inherit cmake pkgconfig native
+
+OECMAKE_SOURCEPATH =3D "${S}/llvm"
+
+EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DRelease -DLLVM_ENABLE_PROJECTS=3D=
'llvm;clang;lldb'"
+
+BINARIES =3D "llvm-min-tblgen llvm-tblgen clang-tblgen lldb-tblgen"
+
+OECMAKE_TARGET_COMPILE =3D "${BINARIES}"
+
+do_install() {
+    for f in ${BINARIES}; do
+        install -D ${B}/bin/$f ${D}${bindir}/$f
+    done
+}
--=20
2.43.0


