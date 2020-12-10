Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.16516.1607617964939959440
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 08:32:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8768F1FB
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Dec 2020 08:32:44 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3192E3F885
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Dec 2020 08:32:44 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd-boot: allow building for Arm targets
Date: Thu, 10 Dec 2020 16:32:42 +0000
Message-Id: <20201210163242.3329917-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

systemd-boot work on 32-bit and 64-bit Arm targets (assuming the firmware
does EFI, obviously), so allow it to be built.

Remove the SYSTEMD_BOOT_EFI_ARCH assignments, as they're never used.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd-boot_246.6.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_246.6.bb b/meta/recip=
es-core/systemd/systemd-boot_246.6.bb
index f92c639810..453351d1b1 100644
--- a/meta/recipes-core/systemd/systemd-boot_246.6.bb
+++ b/meta/recipes-core/systemd/systemd-boot_246.6.bb
@@ -47,15 +47,10 @@ RDEPENDS_${PN} +=3D "virtual/systemd-bootconf"
=20
 # Imported from the old gummiboot recipe
 TUNE_CCARGS_remove =3D "-mfpmath=3Dsse"
-COMPATIBLE_HOST =3D "(x86_64.*|i.86.*)-linux"
+COMPATIBLE_HOST =3D "(aarch64.*|arm.*|x86_64.*|i.86.*)-linux"
 COMPATIBLE_HOST_x86-x32 =3D "null"
=20
 do_compile() {
-	SYSTEMD_BOOT_EFI_ARCH=3D"ia32"
-	if [ "${TARGET_ARCH}" =3D "x86_64" ]; then
-		SYSTEMD_BOOT_EFI_ARCH=3D"x64"
-	fi
-
 	ninja src/boot/efi/${SYSTEMD_BOOT_IMAGE_PREFIX}${SYSTEMD_BOOT_IMAGE}
 }
=20
--=20
2.25.1

