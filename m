Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78BDDF9D0E4
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 15:57:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58.1776182219273189345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 08:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=UMv/2L/m;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9F3B2D95
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 08:56:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 464D33F7B4
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 08:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776182218; bh=teTUuOjkk1XeWn8B0Y+XvdRTkHf5LCAAS3YqHK31vlM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UMv/2L/mrl2o+LHzp1QNothNEFaQMEQLdcuRxvk6a0gYFlqNFSabPPFO6G8cx6Og7
	 DKADQknXzz2+TV+tEaN+edTF15Ny6AI/vggMQzxgTKS424gD+RgDlK/1FC/hpYn7HO
	 LrJfXAgbgGNvcjPP8AGDJ/sMdD/UT5uruDncA2jc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] perl: link to the system zlib instead of a vendored copy
Date: Tue, 14 Apr 2026 16:56:51 +0100
Message-ID: <20260414155652.1214302-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414155652.1214302-1-ross.burton@arm.com>
References: <20260414155652.1214302-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 15:57:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235165

The perl module Compress-Raw-Zlib defaults to using a vendored copy of
the zlib sources which has a number of CVEs.  A newer version of perl
updates this to zlib 1.3.2 to resolve them, but we should be linking to
our zlib recipe instead of the vendored code.

This mitigates CVE-2026-4176 so mark it as not appropriate.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/perl/perl_5.42.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-dev=
tools/perl/perl_5.42.0.bb
index a154bbc0a9b..5992ac2d927 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
@@ -59,6 +59,11 @@ CFLAGS:append:toolchain-clang =3D " -fno-strict-aliasi=
ng"
 # Needed with -march=3Dx86-64-v3
 CFLAGS:append:toolchain-gcc:class-target:x86-64 =3D " -fno-builtin-memcp=
y -D__NO_STRING_INLINES -U_FORTIFY_SOURCE"
=20
+# Link Compress-Raw-Zlib to the system zlib instead of a vendored copy
+EXTRA_OEMAKE +=3D "BUILD_ZLIB=3DFalse ZLIB_INCLUDE=3D${STAGING_INCDIR} Z=
LIB_LIB=3D${STAGING_LIBDIR}"
+
+CVE_STATUS[CVE-2026-4176] =3D "not-applicable-config: we do not use the =
vendorered zlib"
+
 do_configure:prepend() {
     rm -rf ${B}
     cp -rfp ${S} ${B}
--=20
2.43.0


