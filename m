Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3682EEF901C
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 16:48:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22975.1772642920868307591
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 08:48:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F160339
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 08:48:34 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1B4803F836
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 08:48:40 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 5/5] autotools: remove deletion of aclocal.m4
Date: Wed,  4 Mar 2026 16:48:34 +0000
Message-ID: <20260304164834.618765-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304164834.618765-1-ross.burton@arm.com>
References: <20260304164834.618765-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 16:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232391

We've historically[1] deleted any aclocal.m4 file in the source tree
before autoreconfing on the grounds that it is "too shy" to overwrite
aclocal.m4, so we forcibly delete the aclocal.m4 unless aclocal has been
excluded in autoreconf.

However, this shyness has been removed in autoconf 2.70[2] and autoreconf
will always call aclocal, which will rewrite the file if needed.

So, remove the explicit deletion of aclocal.m4.  I've verified that a
build of all recipes in core that use autotools have identical
aclocal.m4 files before and after this change.

[1] This code appears in oe-classic during 2011 but originated in a
    BitKeeper commit, so predates our use of git.

[2] autoconf bc7e12e7 ("autoreconf: drop support for old (< 1.8) aclocal =
versions")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/autotools.bbclass | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/=
autotools.bbclass
index bd477dc60f..bf58008669 100644
--- a/meta/classes-recipe/autotools.bbclass
+++ b/meta/classes-recipe/autotools.bbclass
@@ -166,13 +166,6 @@ autotools_do_configure() {
 		cd ${AUTOTOOLS_SCRIPT_PATH}
 		# aclocal looks in the native sysroot by default, so tell it to also l=
ook in the target sysroot.
 		ACLOCAL=3D"aclocal --aclocal-path=3D${STAGING_DATADIR}/aclocal/"
-		# autoreconf is too shy to overwrite aclocal.m4 if it doesn't look
-		# like it was auto-generated.  Work around this by blowing it away
-		# by hand, unless the package specifically asked not to run aclocal.
-		if ! echo ${EXTRA_AUTORECONF} | grep -q "aclocal"; then
-			bbnote Removing existing aclocal.m4
-			rm -f aclocal.m4
-		fi
 		if [ -e configure.in ]; then
 			CONFIGURE_AC=3Dconfigure.in
 		else
--=20
2.43.0


