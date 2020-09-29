Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1854.1601417804758946254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2020 15:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A110931B
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2020 15:16:43 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BC5B3F70D
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2020 15:16:43 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] bjam-native: don't do debug builds
Date: Tue, 29 Sep 2020 23:16:37 +0100
Message-Id: <20200929221638.2114178-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Previously this recipe was changed to do debug builds because otherwise i=
nsane
warns that the binary is already stripped.

However, debug builds for boost.build also pass -O0.  It turns out that g=
iven
how large Boost is (or, how bad boost.build is) doing a release build wit=
h -O3
knocks a third off the walltime for a Boost package in my test, mainly by=
 reducing
how long it spends deciding that nothing needs to be rebuilt in do_instal=
l:

  PKG      TASK        ABSDIFF  RELDIFF  WALLTIME1 -> WALLTIME2
  boost    do_install  -330.7s   -69.2%     477.6s -> 146.9s
  boost    do_compile    -7.1s    -2.7%     269.3s -> 262.2s

Replace debug mode with INSANE_SKIP=3Dalready-stripped.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../boost/bjam-native_1.74.0.bb               | 10 ++---
 .../0001-Build-debug-version-of-bjam.patch    | 38 -------------------
 ....sh-use-DNDEBUG-also-in-debug-builds.patch | 27 -------------
 3 files changed, 4 insertions(+), 71 deletions(-)
 delete mode 100644 meta/recipes-support/boost/files/0001-Build-debug-ver=
sion-of-bjam.patch
 delete mode 100644 meta/recipes-support/boost/files/0001-build.sh-use-DN=
DEBUG-also-in-debug-builds.patch

diff --git a/meta/recipes-support/boost/bjam-native_1.74.0.bb b/meta/reci=
pes-support/boost/bjam-native_1.74.0.bb
index d843eb038c..c0eeed60b0 100644
--- a/meta/recipes-support/boost/bjam-native_1.74.0.bb
+++ b/meta/recipes-support/boost/bjam-native_1.74.0.bb
@@ -5,16 +5,14 @@ SECTION =3D "devel"
=20
 inherit native
=20
-SRC_URI +=3D "file://0001-Build-debug-version-of-bjam.patch \
-            file://0001-build.sh-use-DNDEBUG-also-in-debug-builds.patch =
\
-           "
-
 do_compile() {
     ./bootstrap.sh --with-toolset=3Dgcc
 }
=20
 do_install() {
     install -d ${D}${bindir}/
-    # install unstripped version for bjam
-    install -c -m 755 b2 ${D}${bindir}/bjam
+    install b2 ${D}${bindir}/bjam
 }
+
+# The build is either release mode (pre-stripped) or debug (-O0).
+INSANE_SKIP_${PN} =3D "already-stripped"
diff --git a/meta/recipes-support/boost/files/0001-Build-debug-version-of=
-bjam.patch b/meta/recipes-support/boost/files/0001-Build-debug-version-o=
f-bjam.patch
deleted file mode 100644
index c6dcee915e..0000000000
--- a/meta/recipes-support/boost/files/0001-Build-debug-version-of-bjam.p=
atch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 19c117c3d1388654da484e26afb3fb6c3e4181a9 Mon Sep 17 00:00:00 2001
-From: Daniel Klauer <daniel.klauer@gin.de>
-Date: Tue, 30 Jul 2019 11:39:09 +0200
-Subject: [PATCH] Build debug version of bjam
-
-bjam is stripped by default, this causes QA warning while stripping it
-from do_populate_sysroot():
-
-  WARNING: File '.../tmp/sysroots/x86_64-linux/usr/bin/bjam' \
-    from bjam-native was already stripped, \
-    this will prevent future debugging!
-
-The JAM scripts allow to build unstripped version with '--debug'. Just
-build and install the bjam.debug to stop bjam from being stripped in
-compile step.
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- bootstrap.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/bootstrap.sh b/bootstrap.sh
-index ca0b08d58..87f38dcf2 100755
---- a/bootstrap.sh
-+++ b/bootstrap.sh
-@@ -223,7 +223,7 @@ rm -f config.log
- if test "x$BJAM" =3D x; then
-   $ECHO -n "Building Boost.Build engine with toolset $TOOLSET... "
-   pwd=3D`pwd`
--  (cd "$my_dir/tools/build/src/engine" && ./build.sh "$TOOLSET") > boot=
strap.log 2>&1
-+  (cd "$my_dir/tools/build/src/engine" && ./build.sh "$TOOLSET" --debug=
) > bootstrap.log 2>&1
-   if [ $? -ne 0 ]; then
-       echo
-       echo "Failed to build Boost.Build build engine"=20
---=20
-2.17.1
-
diff --git a/meta/recipes-support/boost/files/0001-build.sh-use-DNDEBUG-a=
lso-in-debug-builds.patch b/meta/recipes-support/boost/files/0001-build.s=
h-use-DNDEBUG-also-in-debug-builds.patch
deleted file mode 100644
index 4c6ef2ed84..0000000000
--- a/meta/recipes-support/boost/files/0001-build.sh-use-DNDEBUG-also-in-=
debug-builds.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 2afd025997a57794ce24e07e914b461dfea6ba5f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 26 Aug 2019 16:04:16 +0200
-Subject: [PATCH] build.sh: use -DNDEBUG also in debug builds
-
-Without it, there is a significant performance regression
-when running 'bjam install'.
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- tools/build/src/engine/build.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/build/src/engine/build.sh b/tools/build/src/engine/bu=
ild.sh
-index a1e4cd335..64e0a4c80 100755
---- a/tools/build/src/engine/build.sh
-+++ b/tools/build/src/engine/build.sh
-@@ -436,7 +436,7 @@ case $B2_OS in
-     ;;
- esac
-=20
--if check_debug_build "$@" ; then B2_CXXFLAGS=3D"${B2_CXXFLAGS_DEBUG}"
-+if check_debug_build "$@" ; then B2_CXXFLAGS=3D"${B2_CXXFLAGS_DEBUG} -D=
NDEBUG"
- else B2_CXXFLAGS=3D"${B2_CXXFLAGS_RELEASE} -DNDEBUG"
- fi
- echo_run ${B2_CXX} ${CXXFLAGS} ${B2_CXXFLAGS} ${B2_SOURCES} -o b2
--=20
2.25.1

