Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4BCC02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 16:33:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.25931.1736958810874344179
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 08:33:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B99F611FB
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 08:33:58 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 071A43F673
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 08:33:29 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] autotools: clean up aclocal/ search path assignments
Date: Wed, 15 Jan 2025 16:33:16 +0000
Message-ID: <20250115163318.1110804-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 16:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209920

We need aclocal to look in two different $datadir/aclocal/ directories:
the native (eg, for pkg.m4 from pkgconfig) and the target (eg, for
alsa.m4 from alsa-lib).

aclocal doesn't directly support this pattern, currently we use
--system-acdir to specify the target directory and then add the native
directory to the user include list.

However, since automake 1.17 there is also an --aclocal-path option to
augument the search list.  As the relocated aclocal from automake-native
already knows the correct path for the native aclocal directory we can
use --aclocal-path to add the correct target aclocal directory.

For simplicity I don't bother only doing this in non-native builds as
this just adds the same path to the search twice.

This removes ACLOCALDIR and ACLOCALEXTRAPATH. Recipes using these to
add search paths should instead use EXTRA_AUTORECONF +=3D "-I path".

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/autotools.bbclass | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/=
autotools.bbclass
index 4e7bf6696d7..99d3cb75833 100644
--- a/meta/classes-recipe/autotools.bbclass
+++ b/meta/classes-recipe/autotools.bbclass
@@ -139,11 +139,6 @@ do_compile[prefuncs] +=3D "autotools_aclocals"
 do_install[prefuncs] +=3D "autotools_aclocals"
 do_configure[postfuncs] +=3D "autotools_postconfigure"
=20
-ACLOCALDIR =3D "${STAGING_DATADIR}/aclocal"
-ACLOCALEXTRAPATH =3D ""
-ACLOCALEXTRAPATH:class-target =3D " -I ${STAGING_DATADIR_NATIVE}/aclocal=
/"
-ACLOCALEXTRAPATH:class-nativesdk =3D " -I ${STAGING_DATADIR_NATIVE}/aclo=
cal/"
-
 python autotools_aclocals () {
     sitefiles, searched =3D siteinfo_get_files(d, sysrootcache=3DTrue)
     d.setVar("CONFIG_SITE", " ".join(sitefiles))
@@ -171,8 +166,8 @@ autotools_do_configure() {
 	if [ -e ${AUTOTOOLS_SCRIPT_PATH}/configure.in -o -e ${AUTOTOOLS_SCRIPT_=
PATH}/configure.ac ]; then
 		olddir=3D`pwd`
 		cd ${AUTOTOOLS_SCRIPT_PATH}
-		mkdir -p ${ACLOCALDIR}
-		ACLOCAL=3D"aclocal --system-acdir=3D${ACLOCALDIR}/"
+		# aclocal looks in the native sysroot by default, so tell it to also l=
ook in the target sysroot.
+		ACLOCAL=3D"aclocal --aclocal-path=3D${STAGING_DATADIR}/aclocal/"
 		if [ x"${acpaths}" =3D xdefault ]; then
 			acpaths=3D
 			for i in `find ${AUTOTOOLS_SCRIPT_PATH} -ignore_readdir_race -maxdept=
h 2 -name \*.m4|grep -v 'aclocal.m4'| \
@@ -182,7 +177,6 @@ autotools_do_configure() {
 		else
 			acpaths=3D"${acpaths}"
 		fi
-		acpaths=3D"$acpaths ${ACLOCALEXTRAPATH}"
 		# autoreconf is too shy to overwrite aclocal.m4 if it doesn't look
 		# like it was auto-generated.  Work around this by blowing it away
 		# by hand, unless the package specifically asked not to run aclocal.
--=20
2.43.0


