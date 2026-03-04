Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4F9EF901A
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 16:48:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22974.1772642920208063621
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 08:48:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91B3F339
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 08:48:33 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 82E7D3F836
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 08:48:39 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 4/5] readline: improve aclocal.m4 handling
Date: Wed,  4 Mar 2026 16:48:33 +0000
Message-ID: <20260304164834.618765-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304164834.618765-1-ross.burton@arm.com>
References: <20260304164834.618765-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 16:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232390

I don't know why I decided to copy aclocal.m4 to acinclude.m4 to avoid
autotools.bbclass deleting the upstream hand-maintained aclocal.m4, but
I did.

A neater fix is to exclude aclocal, which has the side-effect of not
deleting aclocal.m4 in do_configure.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/readline/readline.inc | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/=
readline/readline.inc
index 555bd0876f..06630dc455 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -17,17 +17,13 @@ SRC_URI +=3D "file://inputrc"
=20
 inherit autotools texinfo
=20
-EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader"
+# Ensure we don't delete the shipped aclocal.m4 or config.h.in
+EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader,aclocal"
+
 EXTRA_OECONF +=3D "bash_cv_termcap_lib=3Dncurses --with-shared-termcap-l=
ibrary"
=20
 LEAD_SONAME =3D "libreadline.so"
=20
-do_configure:prepend () {
-	if [ ! -e ${S}/acinclude.m4 ]; then
-		cat ${S}/aclocal.m4 > ${S}/acinclude.m4
-	fi
-}
-
 do_install:append () {
 	# Make install doesn't properly install these
 	oe_libinstall -so -C shlib libhistory ${D}${libdir}
--=20
2.43.0


