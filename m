Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979A4C43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 13:19:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.28510.1657545548836557003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 06:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3DB316A3;
	Mon, 11 Jul 2022 06:19:08 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C679F3F70D;
	Mon, 11 Jul 2022 06:19:07 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] perl: don't install Makefile.old into perl-ptest
Date: Mon, 11 Jul 2022 14:19:04 +0100
Message-Id: <20220711131905.3536120-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220711131905.3536120-1-ross.burton@arm.com>
References: <20220711131905.3536120-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 13:19:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167869

We already exclude Makefile, makefile, and makefile.old from copy of the
perl source tree that is used by perl-ptest, but Makefile.old is not
being excluded.  In a rebuild of perl with an existing source tree these
files now exist but have build paths in. As they're backup files, they
can just be excluded from the packages.

Use range globs to clean up the expressions, and exclude Makefile.old.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/perl/perl-ptest.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-dev=
tools/perl/perl-ptest.inc
index 54c78075715..c233fab5453 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -10,12 +10,12 @@ do_install_ptest () {
 	sed -e "s:\/usr\/local:${bindir}:g" -i cpan/version/t/*
 	sed -e "s:\/opt:\/usr:" -i Porting/add-package.pl
 	sed -e "s:\/local\/gnu\/:\/:" -i hints/cxux.sh
-	tar -c --exclude=3Dtry --exclude=3Da.out --exclude=3D'*.o' --exclude=3D=
libperl.so* --exclude=3DMakefile --exclude=3Dmakefile --exclude=3Dhostper=
l \
+	tar -c --exclude=3Dtry --exclude=3Da.out --exclude=3D'*.o' --exclude=3D=
libperl.so* --exclude=3D[Mm]akefile --exclude=3Dhostperl \
 	    --exclude=3Dcygwin --exclude=3Dos2 --exclude=3Ddjgpp --exclude=3Dqn=
x --exclude=3Dsymbian --exclude=3Dhaiku \
 	    --exclude=3Dvms --exclude=3Dvos --exclude=3DNetWare --exclude=3Dami=
gaos4  --exclude=3Dbuildcustomize.pl \
 	    --exclude=3D'win32/config.*' --exclude=3Dplan9 --exclude=3DREADME.p=
lan9 --exclude=3Dperlplan9.pod --exclude=3DConfigure \
 	    --exclude=3Dveryclean.sh --exclude=3Drealclean.sh  --exclude=3Dgeti=
octlsizes \
-	    --exclude=3Ddl_aix.xs --exclude=3Dsdbm.3 --exclude=3D'cflags.SH' --=
exclude=3Dmakefile.old \
+	    --exclude=3Ddl_aix.xs --exclude=3Dsdbm.3 --exclude=3D'cflags.SH' --=
exclude=3D[Mm]akefile.old \
 		--exclude=3Dminiperl --exclude=3Dgenerate_uudmap --exclude=3Dpatches -=
-exclude=3D'config.log' * | ( cd ${D}${PTEST_PATH} && tar -x )
=20
 	ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/perl
--=20
2.34.1


