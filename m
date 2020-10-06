Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.11865.1601982889673043154
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 04:14:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B7AD143D
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Oct 2020 04:14:48 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2765C3F66B
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Oct 2020 04:14:48 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] boost: build a standalone boost.build
Date: Tue,  6 Oct 2020 12:14:42 +0100
Message-Id: <20201006111444.3952584-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Boost is a huge unirepo made from multiple submodules. To bootstrap it we
need boost.build (previously bjam) which is also available as a solo
repository. This smaller repository can unpack/build/package faster than
the Boost unirepo can unpack.

Rename the recipe to the current name of Boost.Build that installs a b2
binary, use the solo repository, and update the Boost recipe to use
the b2 binary instead of bjam.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc      |  2 +-
 .../boost/bjam-native_1.74.0.bb               | 18 ---------------
 .../boost/boost-build-native_4.3.0.bb         | 23 +++++++++++++++++++
 meta/recipes-support/boost/boost.inc          |  8 +++----
 4 files changed, 28 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-support/boost/bjam-native_1.74.0.bb
 create mode 100644 meta/recipes-support/boost/boost-build-native_4.3.0.b=
b

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 5a3f913b0f..7935f968c7 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -70,12 +70,12 @@ RECIPE_MAINTAINER_pn-binutils-cross-canadian-${TRANSL=
ATED_TARGET_ARCH} =3D "Khem R
 RECIPE_MAINTAINER_pn-binutils-cross-testsuite =3D "Khem Raj <raj.khem@gm=
ail.com>"
 RECIPE_MAINTAINER_pn-binutils-crosssdk-${SDK_SYS} =3D "Khem Raj <raj.khe=
m@gmail.com>"
 RECIPE_MAINTAINER_pn-bison =3D "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER_pn-bjam-native =3D "Alexander Kanavin <alex.kanavin@gm=
ail.com>"
 RECIPE_MAINTAINER_pn-blktool =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-blktrace =3D "Alexander Kanavin <alex.kanavin@gmail=
.com>"
 RECIPE_MAINTAINER_pn-bluez5 =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-bmap-tools =3D "Anuj Mittal <anuj.mittal@intel.com>=
"
 RECIPE_MAINTAINER_pn-boost =3D "Alexander Kanavin <alex.kanavin@gmail.co=
m>"
+RECIPE_MAINTAINER_pn-boost-build-native =3D "Alexander Kanavin <alex.kan=
avin@gmail.com>"
 RECIPE_MAINTAINER_pn-bootchart2 =3D "Alexander Kanavin <alex.kanavin@gma=
il.com>"
 RECIPE_MAINTAINER_pn-bsd-headers =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-btrfs-tools =3D "Wang Mingyu <wangmy@cn.fujitsu.com=
>"
diff --git a/meta/recipes-support/boost/bjam-native_1.74.0.bb b/meta/reci=
pes-support/boost/bjam-native_1.74.0.bb
deleted file mode 100644
index c0eeed60b0..0000000000
--- a/meta/recipes-support/boost/bjam-native_1.74.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require boost-${PV}.inc
-
-SUMMARY =3D "Portable Boost.Jam build tool for boost"
-SECTION =3D "devel"
-
-inherit native
-
-do_compile() {
-    ./bootstrap.sh --with-toolset=3Dgcc
-}
-
-do_install() {
-    install -d ${D}${bindir}/
-    install b2 ${D}${bindir}/bjam
-}
-
-# The build is either release mode (pre-stripped) or debug (-O0).
-INSANE_SKIP_${PN} =3D "already-stripped"
diff --git a/meta/recipes-support/boost/boost-build-native_4.3.0.bb b/met=
a/recipes-support/boost/boost-build-native_4.3.0.bb
new file mode 100644
index 0000000000..d8096de5af
--- /dev/null
+++ b/meta/recipes-support/boost/boost-build-native_4.3.0.bb
@@ -0,0 +1,23 @@
+SUMMARY =3D "Boost.Build"
+SECTION =3D "devel"
+
+LICENSE =3D "BSL-1.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3De4224ccaecb14d942c71d31be=
f20d78c"
+
+SRC_URI =3D "git://github.com/boostorg/build;protocol=3Dhttps"
+SRCREV =3D "632ea768f3eb225b4472c5ed6d20afee708724ad"
+
+inherit native
+
+S =3D "${WORKDIR}/git"
+
+do_compile() {
+    ./bootstrap.sh
+}
+
+do_install() {
+    ./b2 install --prefix=3D${prefix} staging-prefix=3D${D}${prefix}
+}
+
+# The build is either release mode (pre-stripped) or debug (-O0).
+INSANE_SKIP_${PN} =3D "already-stripped"
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/=
boost/boost.inc
index ea1bc123b8..e74c7d6f7d 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -1,6 +1,6 @@
 SUMMARY =3D "Free peer-reviewed portable C++ source libraries"
 SECTION =3D "libs"
-DEPENDS =3D "bjam-native zlib bzip2"
+DEPENDS =3D "boost-build-native zlib bzip2"
=20
 CVE_PRODUCT =3D "boost:boost"
=20
@@ -180,7 +180,7 @@ do_configure() {
 		echo "using mpi : : <find-shared-library>mpi ;" >> ${WORKDIR}/user-con=
fig.jam
 	fi
=20
-	CC=3D"${BUILD_CC}" CFLAGS=3D"${BUILD_CFLAGS}" ./bootstrap.sh --with-bja=
m=3Dbjam --with-toolset=3Dgcc
+	CC=3D"${BUILD_CC}" CFLAGS=3D"${BUILD_CFLAGS}" ./bootstrap.sh --with-bja=
m=3Db2 --with-toolset=3Dgcc
=20
 	# Boost can't be trusted to find Python on it's own, so remove any ment=
ion
 	# of it from the boost configuration
@@ -189,7 +189,7 @@ do_configure() {
=20
 do_compile() {
 	cd ${S}
-	bjam ${BJAM_OPTS} \
+	b2 ${BJAM_OPTS} \
 		--prefix=3D${prefix} \
 		--exec-prefix=3D${exec_prefix} \
 		--libdir=3D${libdir} \
@@ -199,7 +199,7 @@ do_compile() {
=20
 do_install() {
 	cd ${S}
-	bjam ${BJAM_OPTS} \
+	b2 ${BJAM_OPTS} \
 		--libdir=3D${D}${libdir} \
 		--includedir=3D${D}${includedir} \
 		install
--=20
2.25.1

