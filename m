Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.11194.1626097924697694343
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 06:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B34B6D
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 06:52:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D741D3F7D8
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 06:52:02 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] tcl: suffix all Tcl man pages instead of using alternatives
Date: Mon, 12 Jul 2021 14:51:51 +0100
Message-Id: <20210712135159.2131269-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Both Perl and Tcl want to install Thread.3.  Alternatives is a terrible
idea for manpages that don't correspond to binaries, instead just tell
Tcl to suffix the manpages so this is Thread.3tcl.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.11.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb b/meta/recipes-dev=
tools/tcltk/tcl_8.6.11.bb
index efb36b32dd..f5bb6b1a18 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
@@ -34,9 +34,9 @@ S =3D "${WORKDIR}/${BPN}${PV}/unix"
 PSEUDO_IGNORE_PATHS .=3D ",${WORKDIR}/${BPN}${PV}"
 VER =3D "${PV}"
=20
-inherit autotools ptest binconfig update-alternatives
+inherit autotools ptest binconfig
=20
-EXTRA_OECONF =3D "--enable-threads --disable-rpath --libdir=3D${libdir}"
+EXTRA_OECONF =3D "--enable-threads --disable-rpath --libdir=3D${libdir} =
--enable-man-suffix"
=20
 do_compile_prepend() {
 	echo > ${S}/../compat/fixstrtod.c
@@ -65,9 +65,6 @@ FILES_tcl-lib =3D "${libdir}/libtcl8.6.so.*"
 FILES_${PN} +=3D "${libdir}/tcl${VER} ${libdir}/tcl8.6 ${libdir}/tcl8"
 FILES_${PN}-dev +=3D "${libdir}/tclConfig.sh ${libdir}/tclooConfig.sh"
=20
-ALTERNATIVE_${PN}-doc =3D "Thread.3"
-ALTERNATIVE_LINK_NAME[Thread.3] =3D "${mandir}/man3/Thread.3"
-
 # isn't getting picked up by shlibs code
 RDEPENDS_${PN} +=3D "tcl-lib"
 RDEPENDS_${PN}-ptest +=3D "libgcc"
--=20
2.25.1

