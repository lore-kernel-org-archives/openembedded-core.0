Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC80C47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 15:07:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4750.1705504043589131539
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 07:07:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FE97152B
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 07:08:09 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EAF7C3F5A1
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 07:07:22 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] libunwind: merge .inc and .bb
Date: Wed, 17 Jan 2024 15:07:18 +0000
Message-Id: <20240117150720.3585669-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117150720.3585669-1-ross.burton@arm.com>
References: <20240117150720.3585669-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 15:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193920

From: Ross Burton <ross.burton@arm.com>

There's no need to these to be split, so merge them together.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libunwind/libunwind.inc  | 23 ---------------
 .../libunwind/libunwind_1.6.2.bb              | 28 +++++++++++++++++--
 2 files changed, 25 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-support/libunwind/libunwind.inc

diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-=
support/libunwind/libunwind.inc
deleted file mode 100644
index bf74f9fa3c7..00000000000
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY =3D "Library for obtaining the call-chain of a program"
-DESCRIPTION =3D "a portable and efficient C programming interface (API) =
to determine the call-chain of a program"
-HOMEPAGE =3D "http://www.nongnu.org/libunwind"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d80c8ed4062b8339b715f90fa68c=
c9f"
-DEPENDS +=3D "libatomic-ops"
-DEPENDS:append:libc-musl =3D " libucontext"
-
-inherit autotools multilib_header
-
-PACKAGECONFIG ??=3D ""
-PACKAGECONFIG[lzma] =3D "--enable-minidebuginfo,--disable-minidebuginfo,=
xz"
-PACKAGECONFIG[latexdocs] =3D "--enable-documentation, --disable-document=
ation, latex2man-native"
-
-EXTRA_OECONF:arm =3D "--enable-debug-frame"
-EXTRA_OECONF:armeb =3D "--enable-debug-frame"
-EXTRA_OECONF:aarch64 =3D "--enable-debug-frame"
-
-do_install:append () {
-	oe_multilib_header libunwind.h
-}
-
-BBCLASSEXTEND =3D "native"
diff --git a/meta/recipes-support/libunwind/libunwind_1.6.2.bb b/meta/rec=
ipes-support/libunwind/libunwind_1.6.2.bb
index d67862608c1..650e2c9ec40 100644
--- a/meta/recipes-support/libunwind/libunwind_1.6.2.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.6.2.bb
@@ -1,4 +1,10 @@
-require libunwind.inc
+SUMMARY =3D "Library for obtaining the call-chain of a program"
+DESCRIPTION =3D "a portable and efficient C programming interface (API) =
to determine the call-chain of a program"
+HOMEPAGE =3D "http://www.nongnu.org/libunwind"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d80c8ed4062b8339b715f90fa68c=
c9f"
+DEPENDS +=3D "libatomic-ops"
+DEPENDS:append:libc-musl =3D " libucontext"
=20
 SRC_URI =3D "http://download.savannah.nongnu.org/releases/libunwind/libu=
nwind-${PV}.tar.gz \
            file://0003-x86-Stub-out-x86_local_resume.patch \
@@ -11,15 +17,31 @@ SRC_URI:append:libc-musl =3D " file://musl-header-con=
flict.patch"
=20
 SRC_URI[sha256sum] =3D "4a6aec666991fb45d0889c44aede8ad6eb108071c3554fcd=
ff671f9c94794976"
=20
+inherit autotools multilib_header
+
+COMPATIBLE_HOST:riscv32 =3D "null"
+
+PACKAGECONFIG ??=3D ""
+PACKAGECONFIG[lzma] =3D "--enable-minidebuginfo,--disable-minidebuginfo,=
xz"
+PACKAGECONFIG[latexdocs] =3D "--enable-documentation, --disable-document=
ation, latex2man-native"
+
+EXTRA_OECONF:arm =3D "--enable-debug-frame"
+EXTRA_OECONF:armeb =3D "--enable-debug-frame"
+EXTRA_OECONF:aarch64 =3D "--enable-debug-frame"
+
 EXTRA_OECONF:append:libc-musl =3D " --disable-documentation --disable-te=
sts --enable-static"
=20
 # http://errors.yoctoproject.org/Errors/Details/20487/
 ARM_INSTRUCTION_SET:armv4 =3D "arm"
 ARM_INSTRUCTION_SET:armv5 =3D "arm"
=20
-COMPATIBLE_HOST:riscv32 =3D "null"
-
 LDFLAGS +=3D "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES'=
, 'ld-is-gold', ' -fuse-ld=3Dbfd ', '', d)}"
=20
 SECURITY_LDFLAGS:append:libc-musl =3D " -lssp_nonshared"
 CACHED_CONFIGUREVARS:append:libc-musl =3D " LDFLAGS=3D'${LDFLAGS} -lucon=
text'"
+
+do_install:append () {
+	oe_multilib_header libunwind.h
+}
+
+BBCLASSEXTEND =3D "native"
--=20
2.34.1


