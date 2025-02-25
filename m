Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19237C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:26:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8935.1740493602500525858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:26:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8BB41BCB
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:26:57 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 266113F6A8
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:26:41 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] autotools: don't try and find in-tree macros
Date: Tue, 25 Feb 2025 14:26:33 +0000
Message-ID: <20250225142636.703255-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211881

autotools has improved a lot since this class was written, and there's
now no need to search the source tree for m4 files and add them to the
include path.

If packages have macros in subdirectories the idiom is to tell aclocal
via an assignment in Makefile.am:

  ACLOCAL_AMFLAGS =3D -I gl/m4 -I m4

If, for example, a package isn't autoreconfable out of the box (because
it has a non-trivial autogen.sh or similar, say) then the required -I
statements can be added to EXTRA_AUTORECONF.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/autotools.bbclass | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/=
autotools.bbclass
index e33eae7d486..bffd8a7a057 100644
--- a/meta/classes-recipe/autotools.bbclass
+++ b/meta/classes-recipe/autotools.bbclass
@@ -36,7 +36,6 @@ inherit siteinfo
 # the contents of the sysroot.
 export CONFIG_SITE
=20
-acpaths ?=3D "default"
 EXTRA_AUTORECONF +=3D "--exclude=3Dautopoint"
=20
 export lt_cv_sys_lib_dlsearch_path_spec =3D "${libdir} ${base_libdir}"
@@ -167,15 +166,6 @@ autotools_do_configure() {
 		cd ${AUTOTOOLS_SCRIPT_PATH}
 		# aclocal looks in the native sysroot by default, so tell it to also l=
ook in the target sysroot.
 		ACLOCAL=3D"aclocal --aclocal-path=3D${STAGING_DATADIR}/aclocal/"
-		if [ x"${acpaths}" =3D xdefault ]; then
-			acpaths=3D
-			for i in `find ${AUTOTOOLS_SCRIPT_PATH} -ignore_readdir_race -maxdept=
h 2 -name \*.m4|grep -v 'aclocal.m4'| \
-				grep -v 'acinclude.m4' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
-				acpaths=3D"$acpaths -I $i"
-			done
-		else
-			acpaths=3D"${acpaths}"
-		fi
 		# autoreconf is too shy to overwrite aclocal.m4 if it doesn't look
 		# like it was auto-generated.  Work around this by blowing it away
 		# by hand, unless the package specifically asked not to run aclocal.
@@ -212,8 +202,8 @@ autotools_do_configure() {
 			find ${S} -ignore_readdir_race -name $i -delete
 		done
=20
-		bbnote Executing ACLOCAL=3D\"$ACLOCAL\" autoreconf -Wcross --verbose -=
-install --force ${EXTRA_AUTORECONF} $acpaths
-		ACLOCAL=3D"$ACLOCAL" autoreconf -Wcross -Wno-obsolete --verbose --inst=
all --force ${EXTRA_AUTORECONF} $acpaths || die "autoreconf execution fai=
led."
+		bbnote Executing ACLOCAL=3D\"$ACLOCAL\" autoreconf -Wcross --verbose -=
-install --force ${EXTRA_AUTORECONF}
+		ACLOCAL=3D"$ACLOCAL" autoreconf -Wcross -Wno-obsolete --verbose --inst=
all --force ${EXTRA_AUTORECONF} || die "autoreconf execution failed."
 		cd $olddir
 	fi
 	if [ -e ${CONFIGURE_SCRIPT} ]; then
--=20
2.43.0


