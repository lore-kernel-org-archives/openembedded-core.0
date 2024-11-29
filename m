Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE73D729EC
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 17:38:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.119631.1732901891688952882
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 09:38:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 733E711FB
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 09:38:40 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9A77A3F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 09:38:10 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] gnu-efi: pass HOSTCC and INCLUDEDIR
Date: Fri, 29 Nov 2024 17:38:00 +0000
Message-Id: <20241129173803.3499627-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 17:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208026

Pass the correct host compiler (HOSTCC) and include directory to the
build.

Also enable verbose builds (V=3D1).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb b/meta/recipes-bs=
p/gnu-efi/gnu-efi_3.0.18.bb
index 8257190568f..092e7ed863f 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb
@@ -39,8 +39,11 @@ do_compile:prepend() {
     unset LDFLAGS
 }
=20
-EXTRA_OEMAKE =3D "'ARCH=3D${@gnu_efi_arch(d)}' 'CC=3D${CC}' 'AS=3D${AS}'=
 'LD=3D${LD}' 'AR=3D${AR}' \
-                'RANLIB=3D${RANLIB}' 'OBJCOPY=3D${OBJCOPY}' 'PREFIX=3D${=
prefix}' 'LIBDIR=3D${libdir}' \
+EXTRA_OEMAKE =3D "'V=3D1' 'ARCH=3D${@gnu_efi_arch(d)}' \
+                'HOSTCC=3D${BUILD_CC}' 'CC=3D${CC}' \
+                'AS=3D${AS}' 'LD=3D${LD}' 'AR=3D${AR}' \
+                'RANLIB=3D${RANLIB}' 'OBJCOPY=3D${OBJCOPY}' \
+                'PREFIX=3D${prefix}' 'LIBDIR=3D${libdir}' 'INCLUDEDIR=3D=
${includedir}' \
                 "
=20
 # gnu-efi's Makefile treats prefix as toolchain prefix, so don't
--=20
2.34.1


