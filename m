Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.46605.1629239362812813007
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 15:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3004B101E
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 15:29:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD8643F70D
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 15:29:21 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glibc: package the stub .a libaries into glibc-dev
Date: Tue, 17 Aug 2021 23:29:19 +0100
Message-Id: <20210817222919.2170420-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In glibc 2.34, the libraries libpthread, libdl, libutil, libanl have
been integrated into libc. To retain compatibility with old binaries the
shared libaries are still shipped but are empty, and to keep software
building there are empty static libraries.

However, these static libraries get packaged into glibc-staticdev (as
they should be), but by this design they should be in glibc-dev.

https://sourceware.org/pipermail/libc-alpha/2021-August/129718.html

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-cor=
e/glibc/glibc-package.inc
index 3026aec9b6f..56fbf8b08ce 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -22,6 +22,7 @@ ARCH_DYNAMIC_LOADER =3D ""
 ARCH_DYNAMIC_LOADER:aarch64 =3D "ld-linux-${TARGET_ARCH}.so.1"
 libc_baselibs:append =3D " ${@oe.utils.conditional('ARCH_DYNAMIC_LOADER'=
, '', '', '${root_prefix}/lib/${ARCH_DYNAMIC_LOADER}', d)}"
 INSANE_SKIP:${PN}:append:aarch64 =3D " libdir"
+INSANE_SKIP:${PN}-dev +=3D "staticdev"
=20
 FILES:${PN} =3D "${libc_baselibs} ${libexecdir}/* ${sysconfdir}/ld.so.co=
nf"
 RRECOMMENDS:${PN} =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig=
', '${MLPREFIX}ldconfig', '', d)}"
@@ -38,7 +39,7 @@ FILES:sln =3D "${base_sbindir}/sln"
 FILES:${PN}-pic =3D "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/lib=
c_pic/*.o"
 FILES:libsotruss =3D "${libdir}/audit/sotruss-lib.so"
 FILES_SOLIBSDEV =3D "${libdir}/lib*${SOLIBSDEV}"
-FILES:${PN}-dev +=3D "${libdir}/*_nonshared.a ${base_libdir}/*_nonshared=
.a ${base_libdir}/*.o ${datadir}/aclocal"
+FILES:${PN}-dev +=3D "${libdir}/libpthread.a ${libdir}/libdl.a ${libdir}=
/libutil.a ${libdir}/libanl.a ${libdir}/*_nonshared.a ${base_libdir}/*_no=
nshared.a ${base_libdir}/*.o ${datadir}/aclocal"
 RDEPENDS:${PN}-dev =3D "linux-libc-headers-dev"
 FILES:${PN}-staticdev +=3D "${libdir}/*.a ${base_libdir}/*.a"
 FILES:nscd =3D "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_uni=
tdir}/system/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \
--=20
2.32.0

