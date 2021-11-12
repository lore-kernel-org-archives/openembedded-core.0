Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD014C433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 14:02:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16086.1636725762045637979
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 06:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5D8513D5
	for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 06:02:41 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5194A3F70D
	for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 06:02:41 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] ncurses: poll() works, but only on Linux
Date: Fri, 12 Nov 2021 14:02:36 +0000
Message-Id: <20211112140237.575404-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112140237.575404-1-ross.burton@arm.com>
References: <20211112140237.575404-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 14:02:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158221

ncurses does AC_TRY_RUN() to determine is poll() actually works. As that
doesn't work in cross-compiles, we seed it with 'yes'.

However, MinGW doesn't have a working poll(), so use a :linux override
so that this only applies to Linux builds.

The ncurses build now compiles but doesn't link in MinGW, which is a step
forwards at least.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/nc=
urses/ncurses.inc
index e32a6d12f1..a0ecd8a80b 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -18,6 +18,7 @@ SRC_URI =3D "git://salsa.debian.org/debian/ncurses.git;=
protocol=3Dhttps;branch=3Dmaste
 EXTRA_AUTORECONF =3D "-I m4"
=20
 CACHED_CONFIGUREVARS =3D "cf_cv_func_nanosleep=3Dyes"
+CACHED_CONFIGUREVARS:append:linux =3D " cf_cv_working_poll=3Dyes"
=20
 EXTRASITECONFIG =3D "CFLAGS=3D'${CFLAGS} -I${SYSROOT_DESTDIR}${includedi=
r}'"
=20
@@ -98,10 +99,6 @@ ncurses_configure() {
 # patched autoconf213 to generate the configure script. This autoconf
 # is not available so that the shipped script will be used.
 do_configure() {
-        # check does not work with cross-compiling and is generally
-        # broken because it requires stdin to be pollable (which is
-        # not the case for /dev/null redirections)
-        export cf_cv_working_poll=3Dyes
 	#Remove ${includedir} from CPPFLAGS, need for cross compile
 	sed -i 's#-I${cf_includedir}##g' ${S}/configure || die "sed CPPFLAGS"
=20
--=20
2.25.1


