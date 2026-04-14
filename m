Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB15F9D0DC
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 15:57:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59.1776182219715850949
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 08:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=CJTuOLyD;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81C8F4403
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 08:56:53 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DB0793F7B4
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 08:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776182219; bh=WXOh5Z2G43yPIDCzGGxizZjqPErdNZN5Z22GSwCgNAw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CJTuOLyDItKde1rOUJpFCjxvad4le2I3tXpOBVQ3TTnxh4bFgDu2frW5J4aROrvby
	 nKDe4krJBs7aFPt9gEXHI54T1lh2aNm3DAiSkrvcR+1KO8dnfjH2p/b6kJNQ+AUT1e
	 PNh6PKXY4MKY8wZ6u3SuplGx1MZYn0orOoD7j5rw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] perl: link to the system bzip2 instead of a vendored copy
Date: Tue, 14 Apr 2026 16:56:52 +0100
Message-ID: <20260414155652.1214302-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414155652.1214302-1-ross.burton@arm.com>
References: <20260414155652.1214302-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 15:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235166

The perl module Compress-Raw-Bzip2 defaults to using a vendored copy of
the bzip2 sources. We should be building perl against the system bzip2
recipe to avoid potential security issues.

This is a little fiddly in the DEPENDS as bzip2-native is assume-provided
so we need to depend on bzip2-replacement-native for the native build.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/perl/perl_5.42.0.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-dev=
tools/perl/perl_5.42.0.bb
index 5992ac2d927..cf28067bab8 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
@@ -30,7 +30,9 @@ B =3D "${WORKDIR}/perl-${PV}-build"
=20
 inherit upstream-version-is-even update-alternatives
=20
-DEPENDS +=3D "perlcross-native zlib virtual/crypt"
+DEPENDS +=3D "perlcross-native bzip2 zlib virtual/crypt"
+DEPENDS:append:class-native =3D " bzip2-replacement-native"
+
 # make 4.1 has race issues with the double-colon usage of MakeMaker, see=
 #14096
 DEPENDS +=3D "make-native"
=20
@@ -59,8 +61,10 @@ CFLAGS:append:toolchain-clang =3D " -fno-strict-aliasi=
ng"
 # Needed with -march=3Dx86-64-v3
 CFLAGS:append:toolchain-gcc:class-target:x86-64 =3D " -fno-builtin-memcp=
y -D__NO_STRING_INLINES -U_FORTIFY_SOURCE"
=20
-# Link Compress-Raw-Zlib to the system zlib instead of a vendored copy
+# Link Compress-Raw-Zlib to the system libraries instead of a vendored c=
opy
 EXTRA_OEMAKE +=3D "BUILD_ZLIB=3DFalse ZLIB_INCLUDE=3D${STAGING_INCDIR} Z=
LIB_LIB=3D${STAGING_LIBDIR}"
+# Link Compress-Raw-Bzip2 to the system libraries instead of a vendored =
copy
+EXTRA_OEMAKE +=3D "BUILD_BZIP2=3DFalse BZIP2_INCLUDE=3D${STAGING_INCDIR}=
 BZIP2_LIB=3D${STAGING_LIBDIR}"
=20
 CVE_STATUS[CVE-2026-4176] =3D "not-applicable-config: we do not use the =
vendorered zlib"
=20
--=20
2.43.0


