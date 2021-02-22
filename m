Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.416.1614017212494088883
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 10:06:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A8D71FB
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 10:06:42 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A85FB3F73B
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 10:06:41 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] grub: shuffle packaging for aarch64 builds
Date: Mon, 22 Feb 2021 18:06:37 +0000
Message-Id: <20210222180637.2337318-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Even in grub-efi platforms we need to build grub for the the common
tools. On x86 this isn't a problem because grub builds legacy boot and
grub-efi builds EFI, but on aarch64 there is no legacy boot supported by
grub.

To ensure that the common tools are built the grub recipe also builds
EFI binaries, but this now means that grub and grub-efi ship the same
binaries.

oe-core 933286 fixed this conflict by deleting the binaries from
grub-efi and putting the aarch64 modules into grub-common (relying on
dependencies to pull grub-common in).  This seems backwards: grub-efi no
longer contains the binaries and they're in different packages on arm or
x86.  Also, SDK generation is broken as the grub package itself is now
empty as the binaries are in grub-common.

Resolve all of these issues by reversing the logic:  grub-efi is the
package which holds the EFI binaries on all platforms. grub only builds
for EFI on aarch64 as a way to build the common binaries, so delete them
in that recipe to avoid conflicts.  And finally as the grub recipe is
empty on aarch64 but needed by dependencies, set ALLOW_EMPTY.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-bsp/grub/grub-efi_2.04.bb |  6 ------
 meta/recipes-bsp/grub/grub_2.04.bb     | 11 +++++++----
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb b/meta/recipes-bsp/gr=
ub/grub-efi_2.04.bb
index f80afd95cb..287845c507 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.04.bb
@@ -70,10 +70,6 @@ do_install() {
     install -m 644 ${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} ${D}${EFI_FILE=
S_PATH}/${GRUB_IMAGE}
 }
=20
-do_install_append_aarch64() {
-    rm -rf  ${D}/${prefix}/
-}
-
 GRUB_BUILDIN ?=3D "boot linux ext2 fat serial part_msdos part_gpt normal=
 \
                  efi_gop iso9660 configfile search loadenv test"
=20
@@ -88,8 +84,6 @@ FILES_${PN} =3D "${libdir}/grub/${GRUB_TARGET}-efi \
                ${EFI_FILES_PATH}/${GRUB_IMAGE} \
                "
=20
-FILES_${PN}_remove_aarch64 =3D "${libdir}/grub/${GRUB_TARGET}-efi"
-
 # 64-bit binaries are expected for the bootloader with an x32 userland
 INSANE_SKIP_${PN}_append_linux-gnux32 =3D " arch"
 INSANE_SKIP_${PN}-dbg_append_linux-gnux32 =3D " arch"
diff --git a/meta/recipes-bsp/grub/grub_2.04.bb b/meta/recipes-bsp/grub/g=
rub_2.04.bb
index f2942b9e37..d4e09faa40 100644
--- a/meta/recipes-bsp/grub/grub_2.04.bb
+++ b/meta/recipes-bsp/grub/grub_2.04.bb
@@ -16,12 +16,15 @@ FILES_${PN}-common =3D " \
     ${sbindir} \
     ${datadir}/grub \
 "
-
-FILES_${PN}-common_append_aarch64 =3D " \
-    ${libdir}/${BPN} \
-"
+ALLOW_EMPTY_${PN} =3D "1"
=20
 do_install_append () {
+    # Avoid conflicts with the EFI package for systems such as arm64 whe=
re we
+    # need to build grub and grub-efi but only EFI is supported by remov=
ing EFI
+    # from this package.
+    rm -rf ${D}${libdir}/grub/*-efi/
+    rmdir --ignore-fail-on-non-empty ${D}${libdir}/grub ${D}${libdir}
+
     install -d ${D}${sysconfdir}/grub.d
     # Remove build host references...
     find "${D}" -name modinfo.sh -type f -exec \
--=20
2.25.1

