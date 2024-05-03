Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A391C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 10:59:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9885.1714733964334871658
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 03:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B4882F4
	for <openembedded-core@lists.openembedded.org>; Fri,  3 May 2024 03:59:49 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 86B543F793
	for <openembedded-core@lists.openembedded.org>; Fri,  3 May 2024 03:59:23 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: fix pkgconfig path problems
Date: Fri,  3 May 2024 10:59:21 +0000
Message-Id: <20240503105921.3734301-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 10:59:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198976

OpenSSL 3.3.0 introduced new pkgconfig generators which interact badly
with our incorrect setting of --libdir, which is documented as being
the name of the directory _under $prefix_, not an absolute path.  This
resulted in the pkgconfig files have libdir=3D/usr which mostly works as
the actual library directory is on the search path, but can break other
recipes (such as tpm2-openssl).

Pass the correct value for --libdir, and also remove the odd handling of
an empty ${prefix} which is very historical[1] and can't happen anymore
as all build variations have a prefix.

[1] Added in oe-classic f725a81c, 2009

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/openssl/openssl_3.3.0.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.3.0.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.3.0.bb
index 2cdaf4c75d5..37a2b6e31b4 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.3.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.3.0.bb
@@ -136,16 +136,12 @@ do_configure () {
 		;;
 	esac
=20
-	useprefix=3D${prefix}
-	if [ "x$useprefix" =3D "x" ]; then
-		useprefix=3D/
-	fi
 	# WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECON=
F, as they will fully replace the
 	# environment variables set by bitbake. Adjust the environment variable=
s instead.
 	PERLEXTERNAL=3D"$(realpath ${S}/external/perl/Text-Template-*/lib)"
 	test -d "$PERLEXTERNAL" || bberror "PERLEXTERNAL '$PERLEXTERNAL' not fo=
und!"
 	HASHBANGPERL=3D"/usr/bin/env perl" PERL=3Dperl PERL5LIB=3D"$PERLEXTERNA=
L" \
-	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECA=
TED_CRYPTO_FLAGS} --prefix=3D$useprefix --openssldir=3D${libdir}/ssl-3 --=
libdir=3D${libdir} $target
+	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECA=
TED_CRYPTO_FLAGS} --prefix=3D${prefix} --openssldir=3D${libdir}/ssl-3 --l=
ibdir=3D${baselib} $target
 	perl ${B}/configdata.pm --dump
 }
=20
--=20
2.34.1


