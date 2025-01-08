Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BC5E7719C
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 15:46:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.22345.1736351203334160641
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 07:46:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AD3713D5
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jan 2025 07:47:11 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A92E13F66E
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jan 2025 07:46:42 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] autotools: remove aclocal --automake-acdir, relocated so knows the right path
Date: Wed,  8 Jan 2025 15:46:36 +0000
Message-ID: <20250108154636.1431857-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250108154636.1431857-1-ross.burton@arm.com>
References: <20250108154636.1431857-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 15:46:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209572

A relocated aclocal in the native sysroot has the right paths already:

$ cat /work/ross/build/tmp/work/cortexa57-poky-linux/expect/5.45.4/recipe=
-sysroot-native/usr/bin/aclocal
my @automake_includes =3D ('/work/ross/build/tmp/work/cortexa57-poky-linu=
x/expect/5.45.4/recipe-sysroot-native/usr/share/aclocal-' . $APIVERSION);

Thus there is no need to tell aclocal the path explicitly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/autotools.bbclass | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/=
autotools.bbclass
index 9e89ce40b9e..4e7bf6696d7 100644
--- a/meta/classes-recipe/autotools.bbclass
+++ b/meta/classes-recipe/autotools.bbclass
@@ -183,12 +183,6 @@ autotools_do_configure() {
 			acpaths=3D"${acpaths}"
 		fi
 		acpaths=3D"$acpaths ${ACLOCALEXTRAPATH}"
-		AUTOV=3D`automake --version | sed -e '1{s/.* //;s/\.[0-9]\+$//};q'`
-		automake --version
-		echo "AUTOV is $AUTOV"
-		if [ -d ${STAGING_DATADIR_NATIVE}/aclocal-$AUTOV ]; then
-			ACLOCAL=3D"$ACLOCAL --automake-acdir=3D${STAGING_DATADIR_NATIVE}/aclo=
cal-$AUTOV"
-		fi
 		# autoreconf is too shy to overwrite aclocal.m4 if it doesn't look
 		# like it was auto-generated.  Work around this by blowing it away
 		# by hand, unless the package specifically asked not to run aclocal.
--=20
2.43.0


