Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFACFC36000
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 14:23:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8949.1742394200972548150
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 07:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7587C113E
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 07:23:23 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EEABB3F673
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 07:23:14 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pciutils: work around pseudo symlink creation race
Date: Wed, 19 Mar 2025 14:23:10 +0000
Message-ID: <20250319142310.4045570-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 14:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213339

Richard managed to reproduce a pseudo bug that pciutils in a minimal
test case[1] which confirmed that it was the symlink creation causing
issues.

The pciutils Makefile has several installation targets:
- install: binaries, manpages, shared library
- install-lib: headers, library symlinks, shared library

We need to run both targets to install the full set of files we want to
be installed, but notably they both create the .so symlink and as they're
running in parallel this is what triggers the bug in pseudo.

Until the bug has been resolved (or the Makefiles don't duplicate rules),
just run the two targets separately.

[ YOCTO #14957 ]

[1] https://lore.kernel.org/openembedded-core/20250319133457.806384-1-ric=
hard.purdie@linuxfoundation.org/T/#u

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-bsp/pciutils/pciutils_3.13.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.13.0.bb b/meta/recipes-=
bsp/pciutils/pciutils_3.13.0.bb
index 74edd8686b0..6478722838f 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.13.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.13.0.bb
@@ -32,7 +32,10 @@ EXTRA_OEMAKE +=3D "CC=3D"${CC} ${CFLAGS}" AR=3D"${AR}"=
 STRIP=3D LDFLAGS=3D"${LDFLAGS}""
 EXTRA_OEMAKE +=3D "PREFIX=3D${prefix} LIBDIR=3D${libdir} SBINDIR=3D${sbi=
ndir} SHAREDIR=3D${datadir} MANDIR=3D${mandir}"
=20
 do_install () {
-	oe_runmake DESTDIR=3D${D} install install-lib
+	# Do these in separate calls as they expose a race in pseudo when creat=
ing
+	# symlinks when ran in parallel.
+	oe_runmake DESTDIR=3D${D} install
+	oe_runmake DESTDIR=3D${D} install-lib
=20
 	install -d ${D}${bindir}
=20
--=20
2.43.0


