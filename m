Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23493.1599165121080950569
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2020 13:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EC421396
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Sep 2020 13:31:59 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2037B3F71F
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Sep 2020 13:31:59 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/3] kea: don't use PACKAGECONFIG inappropriately
Date: Thu,  3 Sep 2020 21:31:52 +0100
Message-Id: <20200903203153.1300390-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903203153.1300390-1-ross.burton@arm.com>
References: <20200903203153.1300390-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The Kea recipe has PACKAGECONFIG options for boost, openssl, and
log4cplus. However, these are not optional but mandatory dependencies.

Remove the PACKAGECONFIGs and replace with explicit DEPENDS and
EXTRA_OECONF. Also the RDEPENDS in the PACKAGECONFIGs are redundant as
the library dependencies are generated correctly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/kea/kea_1.7.7.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/kea/kea_1.7.7.bb b/meta/recipes-co=
nnectivity/kea/kea_1.7.7.bb
index c69a180833..d2e41e0db2 100644
--- a/meta/recipes-connectivity/kea/kea_1.7.7.bb
+++ b/meta/recipes-connectivity/kea/kea_1.7.7.bb
@@ -5,6 +5,8 @@ SECTION =3D "connectivity"
 LICENSE =3D "MPL-2.0 & Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D68d95543d2096459290a4e6b9cecc=
ffa"
=20
+DEPENDS =3D "boost log4cplus openssl"
+
 SRC_URI =3D "\
     http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
     file://0001-remove-AC_TRY_RUN.patch \
@@ -30,6 +32,10 @@ DEBUG_OPTIMIZATION_append_mipsel =3D " -O"
 BUILD_OPTIMIZATION_remove_mipsel =3D " -Og"
 BUILD_OPTIMIZATION_append_mipsel =3D " -O"
=20
+EXTRA_OECONF =3D "--with-boost-libs=3D-lboost_system \
+                --with-log4cplus=3D${STAGING_DIR_TARGET}${prefix} \
+                --with-openssl=3D${STAGING_DIR_TARGET}${prefix}"
+
 do_configure_prepend() {
     # replace abs_top_builddir to avoid introducing the build path
     # don't expand the abs_top_builddir on the target as the abs_top_bui=
lddir is meanlingless on the target
@@ -49,12 +55,6 @@ do_install_append() {
     rm -rf "${D}${localstatedir}"
 }
=20
-PACKAGECONFIG ??=3D "openssl log4cplus boost"
-
-PACKAGECONFIG[openssl] =3D "--with-openssl=3D${STAGING_DIR_TARGET}${pref=
ix},,openssl,openssl"
-PACKAGECONFIG[log4cplus] =3D "--with-log4cplus=3D${STAGING_DIR_TARGET}${=
prefix},,log4cplus,log4cplus"
-PACKAGECONFIG[boost] =3D "--with-boost-libs=3D-lboost_system,,boost,boos=
t"
-
 FILES_${PN}-staticdev +=3D "${libdir}/kea/hooks/*.a ${libdir}/hooks/*.a"
 FILES_${PN} +=3D "${libdir}/hooks/*.so"
=20
--=20
2.28.0

