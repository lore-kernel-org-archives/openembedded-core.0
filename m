Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76AEAFD3758
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 12:37:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44241.1772023053012845782
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 04:37:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FDA3165C
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 04:37:26 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4C2773F59E
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 04:37:32 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] rxvt: improve aclocal.m4 handling
Date: Wed, 25 Feb 2026 12:37:25 +0000
Message-ID: <20260225123727.2043715-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225123727.2043715-1-ross.burton@arm.com>
References: <20260225123727.2043715-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 12:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231965

I don't know why we copy aclocal.m4 to acinclude.m4 to avoid
autotools.bbclass deleting the upstream hand-maintained aclocal.m4, but
we do.

A neater fix is to exclude aclocal, which has the side-effect of not
deleting aclocal.m4 in do_configure.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recip=
es-sato/rxvt-unicode/rxvt-unicode.inc
index 2eab0d4ec4c..5a1b44a71c3 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -36,11 +36,8 @@ EXTRA_OECONF =3D "--enable-xim \
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[startup] =3D "--enable-startup-notification,--disable-star=
tup-notification,startup-notification,"
=20
-do_configure:prepend () {
-	if [ ! -e ${S}/acinclude.m4 ]; then
-		cp ${S}/aclocal.m4 ${S}/acinclude.m4
-	fi
-}
+# Ensure we don't delete the shipped aclocal.m4
+EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
=20
 do_compile:prepend () {
 	echo '#define UTMP_FILE "${localstatedir}/run/utmp"' >> config.h
--=20
2.43.0


