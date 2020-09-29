Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1855.1601417805103094379
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2020 15:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32AA412FC
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2020 15:16:44 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D29D43F70D
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2020 15:16:43 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] boost: move the build directory outside of S
Date: Tue, 29 Sep 2020 23:16:38 +0100
Message-Id: <20200929221638.2114178-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200929221638.2114178-1-ross.burton@arm.com>
References: <20200929221638.2114178-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Instead of manually creating and deleting build directories, follow the i=
dioms
by setting B to WORKDIR/build, setting do_configure[cleandirs], and using=
 ${B}
where appropriate.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/boost/boost.inc | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/=
boost/boost.inc
index ca140d595f..ea1bc123b8 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -7,6 +7,9 @@ CVE_PRODUCT =3D "boost:boost"
 ARM_INSTRUCTION_SET_armv4 =3D "arm"
 ARM_INSTRUCTION_SET_armv5 =3D "arm"
=20
+B =3D "${WORKDIR}/build"
+do_configure[cleandirs] =3D "${B}"
+
 BOOST_LIBS =3D "\
 	atomic \
 	chrono \
@@ -146,7 +149,7 @@ BOOST_PARALLEL_MAKE =3D "${@oe.utils.parallel_make_ar=
gument(d, '-j%d')}"
 BJAM_OPTS    =3D '${BOOST_PARALLEL_MAKE} -d+2 -q \
 		${BJAM_TOOLS} \
 		-sBOOST_BUILD_USER_CONFIG=3D${WORKDIR}/user-config.jam \
-		--build-dir=3D${S}/${TARGET_SYS} \
+		--build-dir=3D${B} \
 		--disable-icu \
 		${BJAM_EXTRA}'
=20
@@ -161,6 +164,7 @@ BJAM_OPTS_append_arm =3D " abi=3Daapcs architecture=3D=
arm"
 BJAM_OPTS_append_aarch64 =3D " abi=3Daapcs address-model=3D64 architectu=
re=3Darm"
=20
 do_configure() {
+	cd ${S}
 	cp -f ${S}/boost/config/platform/linux.hpp ${S}/boost/config/platform/l=
inux-gnueabi.hpp
=20
 	# D2194:Fixing the failure of "error: duplicate initialization of gcc w=
ith the following parameters" during compilation.
@@ -184,8 +188,9 @@ do_configure() {
 }
=20
 do_compile() {
-	rm -rf ${S}/${TARGET_SYS}
-	bjam ${BJAM_OPTS} --prefix=3D${prefix} \
+	cd ${S}
+	bjam ${BJAM_OPTS} \
+		--prefix=3D${prefix} \
 		--exec-prefix=3D${exec_prefix} \
 		--libdir=3D${libdir} \
 		--includedir=3D${includedir} \
@@ -193,6 +198,7 @@ do_compile() {
 }
=20
 do_install() {
+	cd ${S}
 	bjam ${BJAM_OPTS} \
 		--libdir=3D${D}${libdir} \
 		--includedir=3D${D}${includedir} \
--=20
2.25.1

