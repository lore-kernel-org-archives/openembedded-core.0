Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B4EAC433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 19:16:34 +0000 (UTC)
Received: from sinikuusama2.dnainternet.net (sinikuusama2.dnainternet.net
 [83.102.40.152])
 by mx.groups.io with SMTP id smtpd.web08.11852.1655925391559625073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 12:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.protection.outlook.com}: parse error
 for token &{10 18 spfd.protection.outlook.com}: limit exceeded (domain:
 vaisala.com, ip: 83.102.40.152, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id D38BB1592C;
	Wed, 22 Jun 2022 22:16:28 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sinikuusama2.dnainternet.net ([83.102.40.152])
	by localhost (sinikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet,
 port 10041)
	with ESMTP id R1VQ-3Ke8kps; Wed, 22 Jun 2022 22:16:28 +0300 (EEST)
Received: from omenapuu2.dnainternet.net (omenapuu2.dnainternet.net
 [83.102.40.54])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id 95B9215419;
	Wed, 22 Jun 2022 22:16:28 +0300 (EEST)
Received: from gasmonkey.vaisala.com (82-181-110-188.bb.dnainternet.fi
 [82.181.110.188])
	by omenapuu2.dnainternet.net (Postfix) with ESMTP id 7356A1BE;
	Wed, 22 Jun 2022 22:16:26 +0300 (EEST)
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
Cc: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 1/3] ptest.bbclass: Honor PARALLEL_MAKE, PARALLEL_MAKEINST
Date: Wed, 22 Jun 2022 22:16:13 +0300
Message-Id: <20220622191615.10168-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 19:16:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167249

Since oe_runmake wrapper doesn't by default involve PARALLEL_MAKE
outside do_compile() nor PARALLEL_MAKEINST outside do_install(),
enable parallellized make by default when oe_runmake is invoked from
do_compile_ptest() or do_install_ptest() by declaring wrapper task
specific EXTRA_OEMAKE overrides in fashion similar to do_compile and
do_install overrides in meta/conf/bitbake.conf.

Parallel make can still be disabled by resetting bbclass specific
PTEST_PARALLEL_MAKE and PTEST_PARALLEL_MAKEINST variables in recipe
e.g. if a race issue needs to be avoided without modifying source code.

Tested by issuing following command sequence on a 32-core build host:

  $ bitbake -c clean util-linux && bitbake --skip-setscene -c compile uti=
l-linux && time bitbake --skip-setscene -c compile_ptest_base util-linux

and found that before this change the result was

  real	0m34.684s
  user	0m0.753s
  sys	0m0.131s

and after this change

  real	0m9.868s
  user	0m0.749s
  sys	0m0.150s

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes/ptest.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 1ec23c0923..c162f5d934 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -5,6 +5,10 @@ This package contains a test directory ${PTEST_PATH} for=
 package test purposes."
 PTEST_PATH ?=3D "${libdir}/${BPN}/ptest"
 PTEST_BUILD_HOST_FILES ?=3D "Makefile"
 PTEST_BUILD_HOST_PATTERN ?=3D ""
+PTEST_PARALLEL_MAKE ?=3D "${PARALLEL_MAKE}"
+PTEST_PARALLEL_MAKEINST ?=3D "${PARALLEL_MAKEINST}"
+EXTRA_OEMAKE:prepend:task-compile-ptest-base =3D "${PTEST_PARALLEL_MAKE}=
 "
+EXTRA_OEMAKE:prepend:task-install-ptest-base =3D "${PTEST_PARALLEL_MAKEI=
NST} "
=20
 FILES:${PN}-ptest +=3D "${PTEST_PATH}"
 SECTION:${PN}-ptest =3D "devel"
--=20
2.35.1


