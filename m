Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.491.1607970714616505860
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 10:31:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C2081FB
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 10:31:54 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D37793F718
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 10:31:53 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 5/7] systemd-boot: build the EFI stub
Date: Mon, 14 Dec 2020 18:31:46 +0000
Message-Id: <20201214183148.2673069-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214183148.2673069-1-ross.burton@arm.com>
References: <20201214183148.2673069-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Also build and deploy the EFI stub.  SYSTEMD_BOOT_EFI_ARCH can be dropped
as image-uefi.conf now sets EFI_ARCH.

Changes originally taken from meta-intel.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd-boot_246.6.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_246.6.bb b/meta/recip=
es-core/systemd/systemd-boot_246.6.bb
index f92c639810..97093e4bb2 100644
--- a/meta/recipes-core/systemd/systemd-boot_246.6.bb
+++ b/meta/recipes-core/systemd/systemd-boot_246.6.bb
@@ -47,16 +47,14 @@ RDEPENDS_${PN} +=3D "virtual/systemd-bootconf"
=20
 # Imported from the old gummiboot recipe
 TUNE_CCARGS_remove =3D "-mfpmath=3Dsse"
+
 COMPATIBLE_HOST =3D "(x86_64.*|i.86.*)-linux"
 COMPATIBLE_HOST_x86-x32 =3D "null"
=20
 do_compile() {
-	SYSTEMD_BOOT_EFI_ARCH=3D"ia32"
-	if [ "${TARGET_ARCH}" =3D "x86_64" ]; then
-		SYSTEMD_BOOT_EFI_ARCH=3D"x64"
-	fi
-
-	ninja src/boot/efi/${SYSTEMD_BOOT_IMAGE_PREFIX}${SYSTEMD_BOOT_IMAGE}
+	ninja \
+		src/boot/efi/${SYSTEMD_BOOT_IMAGE_PREFIX}${SYSTEMD_BOOT_IMAGE} \
+		src/boot/efi/linux${EFI_ARCH}.efi.stub
 }
=20
 do_install() {
@@ -66,5 +64,7 @@ do_install() {
=20
 do_deploy () {
 	install ${B}/src/boot/efi/systemd-boot*.efi ${DEPLOYDIR}
+	install ${B}/src/boot/efi/linux*.efi.stub ${DEPLOYDIR}
 }
+
 addtask deploy before do_build after do_compile
--=20
2.25.1

