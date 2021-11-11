Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55EEC433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 12:31:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9935.1636633910418466753
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 04:31:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08AC4101E
	for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 04:31:49 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4F093F70D
	for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 04:31:48 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] dtc: use Meson to build
Date: Thu, 11 Nov 2021 12:31:46 +0000
Message-Id: <20211111123146.2349838-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 12:31:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158174

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/dtc/dtc.inc | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dt=
c.inc
index b8a6b34f0c..adee8d5b4a 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -5,22 +5,14 @@ SECTION =3D "bootloader"
 LICENSE =3D "GPLv2 | BSD-2-Clause"
 DEPENDS =3D "flex-native bison-native"
=20
-SRC_URI =3D "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=3Dmas=
ter \
-           file://make_install.patch \
-           file://0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch=
 \
-           "
-
+SRC_URI =3D "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=3Dmas=
ter"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
-EXTRA_OEMAKE=3D'NO_PYTHON=3D1 PREFIX=3D"${prefix}" LIBDIR=3D"${libdir}" =
DESTDIR=3D"${D}"'
-
-inherit pkgconfig
-
 S =3D "${WORKDIR}/git"
=20
-do_install () {
-	oe_runmake install
-}
+inherit meson pkgconfig
+
+EXTRA_OEMESON =3D "-Dpython=3Ddisabled -Dvalgrind=3Ddisabled"
=20
 PACKAGES =3D+ "${PN}-misc"
 FILES:${PN}-misc =3D "${bindir}/convert-dtsv0 ${bindir}/ftdump ${bindir}=
/dtdiff"
--=20
2.25.1


