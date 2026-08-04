Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3C3C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 15:45:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19587.1785858298332032476
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 08:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=gTIQen0B;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACF55165C
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 08:44:53 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5B75C3F86F
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 08:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785858297; bh=LJq4BDE/rlaVXLasPwZ/kQ2Qidkvg1F2c/4NdHKUIUI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gTIQen0BEJ5lz2VtrQwAfciOQ/LALybXD4UVIKtM0A3ki47e5aJdznrCIlMPCdbaS
	 T10LPhP6LzXrOjCiIeavaP8dLKnNchIFbACrNY4/tpEKrlCery44uJDBTavjGPfZ0G
	 cHBidBW9eOr1giUqtpwbBeIXTtYBHJcCA1Jim1uA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libjpeg-turbo: use system zlib instead of bundled copy
Date: Tue,  4 Aug 2026 16:44:51 +0100
Message-ID: <20260804154451.2506951-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804154451.2506951-1-ross.burton@arm.com>
References: <20260804154451.2506951-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 15:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242778

The libjpegturbo library bundles a copy of libspng which in turn bundles
a copy of zlib.  We don't currently have a libspng recipe but we can
stop it bundling zlib.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb b/meta/rec=
ipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
index 89504419762..7a548d4e9c6 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
@@ -5,6 +5,7 @@ HOMEPAGE =3D "http://libjpeg-turbo.org/"
 LICENSE =3D "BSD-3-Clause AND IJG AND Zlib"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dd21daef3b4b318f77062055059=
c72934"
=20
+DEPENDS =3D "zlib"
 DEPENDS:append:x86-64:class-target =3D " nasm-native"
 DEPENDS:append:x86:class-target =3D " nasm-native"
=20
@@ -28,6 +29,8 @@ export NASMENV =3D "--reproducible --debug-prefix-map=3D=
${WORKDIR}=3D${TARGET_DBGSRC_D
 EXTRA_OECMAKE +=3D "-DCMAKE_SKIP_INSTALL_RPATH=3DON"
 # Ensure the -fPIC options are used to avoid -native compile failures, e=
.g. on opensuse160
 EXTRA_OECMAKE +=3D "-DCMAKE_POSITION_INDEPENDENT_CODE=3DON"
+# Use system zlib instead of the bundled copy
+EXTRA_OECMAKE +=3D "-DWITH_SYSTEM_ZLIB=3DON"
=20
 # Add nasm-native dependency consistently for all build arches is hard
 EXTRA_OECMAKE:append:class-native =3D " -DWITH_SIMD=3DFalse"
--=20
2.43.0


