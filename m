Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD0CCC47DAF
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 15:07:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4751.1705504044821358778
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 07:07:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D39A1596
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 07:08:10 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 236203F5A1
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 07:07:24 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] libunwind: clean up configuration
Date: Wed, 17 Jan 2024 15:07:20 +0000
Message-Id: <20240117150720.3585669-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117150720.3585669-1-ross.burton@arm.com>
References: <20240117150720.3585669-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 15:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193922

From: Ross Burton <ross.burton@arm.com>

Add a PACKAGECONFIG for the support for zlib-compressed debuginfo.

There's no need to explicitly enable reading of .debug_frame segments as
this is enabled automatically for arm/aarch64.

Enable static globally, there's not much to gain by making this
musl-specific.

Don't disable the tests on musl as they verify that libunwind can link,
which is important with external libucontext libraries.

No need to disable documentation on musl, as it's already disabled out
of the box.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libunwind/libunwind_1.6.2.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/libunwind/libunwind_1.6.2.bb b/meta/rec=
ipes-support/libunwind/libunwind_1.6.2.bb
index d40a2af26d3..3208785124a 100644
--- a/meta/recipes-support/libunwind/libunwind_1.6.2.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.6.2.bb
@@ -21,13 +21,10 @@ COMPATIBLE_HOST:riscv32 =3D "null"
=20
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[lzma] =3D "--enable-minidebuginfo,--disable-minidebuginfo,=
xz"
+PACKAGECONFIG[zlib] =3D "--enable-zlibdebuginfo,--disable-zlibdebuginfo,=
zlib"
 PACKAGECONFIG[latexdocs] =3D "--enable-documentation, --disable-document=
ation, latex2man-native"
=20
-EXTRA_OECONF:arm =3D "--enable-debug-frame"
-EXTRA_OECONF:armeb =3D "--enable-debug-frame"
-EXTRA_OECONF:aarch64 =3D "--enable-debug-frame"
-
-EXTRA_OECONF:append:libc-musl =3D " --disable-documentation --disable-te=
sts --enable-static"
+EXTRA_OECONF =3D "--enable-static"
=20
 # http://errors.yoctoproject.org/Errors/Details/20487/
 ARM_INSTRUCTION_SET:armv4 =3D "arm"
--=20
2.34.1


