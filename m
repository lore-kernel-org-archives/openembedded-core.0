Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.488.1607970714065988361
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 10:31:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AAF61042
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 10:31:53 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DBEF3F718
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 10:31:53 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/7] image-uefi.conf: add EFI arch variable
Date: Mon, 14 Dec 2020 18:31:45 +0000
Message-Id: <20201214183148.2673069-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214183148.2673069-1-ross.burton@arm.com>
References: <20201214183148.2673069-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Refactor EFI_BOOT_IMAGE so that the EFI name for the architecture
is exposed as EFI_ARCH, so that other recipes (such as bootloaders)
can reuse it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/image-uefi.conf | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/conf/image-uefi.conf b/meta/conf/image-uefi.conf
index aaeff12ccb..882a0e720c 100644
--- a/meta/conf/image-uefi.conf
+++ b/meta/conf/image-uefi.conf
@@ -8,9 +8,12 @@ EFI_PREFIX ?=3D "/boot"
 # Location inside rootfs.
 EFI_FILES_PATH =3D "${EFI_PREFIX}${EFIDIR}"
=20
+# The EFI name for the architecture
+EFI_ARCH ?=3D "INVALID"
+EFI_ARCH_x86 =3D "ia32"
+EFI_ARCH_x86-64 =3D "x64"
+EFI_ARCH_aarch64 =3D "aa64"
+EFI_ARCH_arm =3D "arm"
+
 # Determine name of bootloader image
-EFI_BOOT_IMAGE ?=3D "bootINVALID.efi"
-EFI_BOOT_IMAGE_x86-64 =3D "bootx64.efi"
-EFI_BOOT_IMAGE_x86 =3D "bootia32.efi"
-EFI_BOOT_IMAGE_aarch64 =3D "bootaa64.efi"
-EFI_BOOT_IMAGE_arm =3D "bootarm.efi"
+EFI_BOOT_IMAGE ?=3D "boot${EFI_ARCH}.efi"
--=20
2.25.1

