Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DBCC55838
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 11:41:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14263.1785843699545191703
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 04:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ozxr1mia;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CACA31476
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 04:41:34 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7B8F63F86F
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 04:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785843698; bh=7cBdahalfH5KQVKoewW8AF0x/4n5QgSJq0GHUWrgMFQ=;
	h=From:To:Subject:Date:From;
	b=ozxr1miahJaUNOg7DrpC6Rh2TGG+stTzx8VL7AcB4Qjwh0hCx9fol5Xz7qGNY+ejA
	 3J/XY8s0WBZSmlwJ0VeyrdgNOHCsowGbWtOlKzrv2LHIeq8EFKxtoa7j2nkiP+VecY
	 /Udvx6tEb4MRUTz6PfGQOpF+9mp4mLbmXJnsNrrQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] u-boot: always use GCC to build
Date: Tue,  4 Aug 2026 12:41:34 +0100
Message-ID: <20260804114134.4028175-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 11:41:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242718

Previously, u-boot was almost always built with GCC because the
kernel-arch inherit set TOOLCHAIN to KERNEL_TOOLCHAIN, which defaulted
to 'gcc'.

However, since kernel-arch inherit was removed, u-boot in theory now
respects the default toolchain. In practise, the recipe hard-codes CC
to be gcc, and there are known caveats building u-boot with clang[2].

In the long term we should be able to make this recipe respect TOOLCHAIN,
as the upstream u-boot CI does build and test with clang, but for now
fix the build by restoring the explicit use of gcc.

[1] oe-core 8fb5470841b ("u-boot: Separate out from kernel-arch.bbclass")
[2] https://docs.u-boot-project.org/en/latest/build/clang.html

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot=
/u-boot.inc
index 3e2f5aa1a5f..00a12f1bb91 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -3,6 +3,10 @@ PROVIDES =3D "virtual/bootloader"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
+# u-boot is best built with gcc
+# https://docs.u-boot-project.org/en/latest/build/clang.html
+TOOLCHAIN =3D "gcc"
+
 DEPENDS +=3D "${@bb.utils.contains('UBOOT_ENV_SUFFIX', 'scr', 'u-boot-mk=
image-native', '', d)}"
 DEPENDS +=3D "${@ 'u-boot-mkenvimage-native' if bb.utils.to_boolean(d.ge=
tVar('UBOOT_INITIAL_ENV_BINARY')) else ''}"
=20
--=20
2.43.0


