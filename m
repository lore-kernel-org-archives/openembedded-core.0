Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.23446.1599165119846739480
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2020 13:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D967512FC
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Sep 2020 13:31:58 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7AE7A3F71F
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Sep 2020 13:31:58 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/3] kea: no need to depend on kea-native
Date: Thu,  3 Sep 2020 21:31:51 +0100
Message-Id: <20200903203153.1300390-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kea-msg-compiler is only needed if you alter the messages and the
generated sources need to be rebuilt.  When this is the case, there are
better ways to build kea-msg-compiler that don't involve building all of
Kea.

Don't depend on kea-native, remove BBCLASSEXTEND=3Dnative, and the target
overrides.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/kea/kea_1.7.7.bb | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/kea/kea_1.7.7.bb b/meta/recipes-co=
nnectivity/kea/kea_1.7.7.bb
index e25f8e6fb0..c69a180833 100644
--- a/meta/recipes-connectivity/kea/kea_1.7.7.bb
+++ b/meta/recipes-connectivity/kea/kea_1.7.7.bb
@@ -5,8 +5,6 @@ SECTION =3D "connectivity"
 LICENSE =3D "MPL-2.0 & Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D68d95543d2096459290a4e6b9cecc=
ffa"
=20
-DEPENDS +=3D "kea-native"
-
 SRC_URI =3D "\
     http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
     file://0001-remove-AC_TRY_RUN.patch \
@@ -32,16 +30,14 @@ DEBUG_OPTIMIZATION_append_mipsel =3D " -O"
 BUILD_OPTIMIZATION_remove_mipsel =3D " -Og"
 BUILD_OPTIMIZATION_append_mipsel =3D " -O"
=20
-do_configure_prepend_class-target() {
-    mkdir -p ${B}/src/lib/log/compiler/
-    ln -sf ${STAGING_BINDIR_NATIVE}/kea-msg-compiler ${B}/src/lib/log/co=
mpiler/kea-msg-compiler
+do_configure_prepend() {
     # replace abs_top_builddir to avoid introducing the build path
     # don't expand the abs_top_builddir on the target as the abs_top_bui=
lddir is meanlingless on the target
     find ${S} -type f -name *.sh.in | xargs sed -i  "s:@abs_top_builddir=
@:@abs_top_builddir_placeholder@:g"
     sed -i "s:@abs_top_srcdir@:@abs_top_srcdir_placeholder@:g" ${S}/src/=
bin/admin/kea-admin.in
 }
=20
-do_install_append_class-target() {
+do_install_append() {
     install -d ${D}${systemd_system_unitdir}
     install -m 0644 ${WORKDIR}/kea-dhcp*service ${D}${systemd_system_uni=
tdir}
     sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bind=
ir},g' \
@@ -62,6 +58,4 @@ PACKAGECONFIG[boost] =3D "--with-boost-libs=3D-lboost_s=
ystem,,boost,boost"
 FILES_${PN}-staticdev +=3D "${libdir}/kea/hooks/*.a ${libdir}/hooks/*.a"
 FILES_${PN} +=3D "${libdir}/hooks/*.so"
=20
-BBCLASSEXTEND +=3D "native"
-
 PARALLEL_MAKEINST =3D ""
--=20
2.28.0

