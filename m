Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FC6FCB60B
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 15:21:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71371.1772810476255684377
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 07:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DB8D1516
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Mar 2026 07:21:09 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 56B743F836
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Mar 2026 07:21:15 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] tcl8: prefer tcl's own tzdata
Date: Fri,  6 Mar 2026 15:21:10 +0000
Message-ID: <20260306152110.47750-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306152110.47750-1-ross.burton@arm.com>
References: <20260306152110.47750-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 15:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232579

The little thread that was "one of the tcl test cases fails with system
tzdata" has unravelled upstream into a series of problems with the tz
code when the system tzdata is used:

https://core.tcl-lang.org/tcl/tktview/51aa53616067cb63900b17ca1d71f07b094=
ffa1a

Add a PACKAGECONFIG for the option, and default to using the tcl tzdata
until the issues are resolved upstream.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb b/meta/recipes-d=
evtools/tcltk8/tcl8_8.6.17.bb
index 0f829a9d1b..0a8d6ea1bf 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
@@ -42,11 +42,10 @@ EXTRA_AUTORECONF =3D "--exclude=3Daclocal"
=20
 EXTRA_OECONF =3D "--enable-threads --disable-rpath --enable-man-suffix=3D=
tcl8"
=20
-# Prevent installing copy of tzdata based on tzdata installation on the =
build host
-# It doesn't install tzdata if one of the following files exist on the h=
ost:
-# /usr/share/zoneinfo/UTC /usr/share/zoneinfo/GMT /usr/share/lib/zoneinf=
o/UTC /usr/share/lib/zoneinfo/GMT /usr/lib/zoneinfo/UTC /usr/lib/zoneinfo=
/GMT
-# otherwise "/usr/lib/tcl8.6/tzdata" is included in tcl package
-EXTRA_OECONF +=3D "--with-tzdata=3Dno"
+PACKAGECONFIG ??=3D ""
+# Use of system tzdata is not recommended at present:
+# https://core.tcl-lang.org/tcl/tktview/51aa53616067cb63900b17ca1d71f07b=
094ffa1a
+PACKAGECONFIG[system-tzdata] =3D "--with-tzdata=3Dno,--with-tzdata=3Dyes=
,,tzdata"
=20
 do_install() {
 	autotools_do_install
@@ -73,7 +72,7 @@ FILES:${PN}-dev +=3D "${libdir}/tcl8Config.sh ${libdir}=
/tcl8ooConfig.sh"
=20
 # isn't getting picked up by shlibs code
 RDEPENDS:${PN} +=3D "tcl8-lib"
-RDEPENDS:${PN}-ptest +=3D "libgcc locale-base-en-us tzdata"
+RDEPENDS:${PN}-ptest +=3D "libgcc locale-base-en-us"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
--=20
2.43.0


