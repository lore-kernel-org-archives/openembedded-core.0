Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.5407.1630488024884433194
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 02:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 9A6F710000B;
	Wed,  1 Sep 2021 09:20:22 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] meta: stop using "virtual/" in RPROVIDES and RDEPENDS
Date: Wed,  1 Sep 2021 11:20:20 +0200
Message-Id: <20210901092020.116142-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes [YOCTO #14538]

Recipes shouldn't use the "virtual/" string in RPROVIDES and RDEPENDS.

That's confusing because "virtual/" has no special meaning in
RPROVIDES and RDEPENDS (unlike in PROVIDES and DEPENDS).

Instead, using "virtual-" instead of "virtual/"
as already done in the glibc recipe.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/recipes-bsp/grub/grub-bootconf_1.00.bb        | 2 +-
 meta/recipes-bsp/grub/grub-efi_2.06.bb             | 2 +-
 meta/recipes-core/systemd/systemd-boot_249.3.bb    | 2 +-
 meta/recipes-core/systemd/systemd-bootconf_1.00.bb | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
index 151e601fd2..783e30bf38 100644
--- a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
+++ b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "Grub might require different configuration file for \
 different machines."
 HOMEPAGE = "https://www.gnu.org/software/grub/manual/grub/grub.html#Configuration"
 
-RPROVIDES:${PN} += "virtual/grub-bootconf"
+RPROVIDES:${PN} += "virtual-grub-bootconf"
 
 inherit grub-efi-cfg
 
diff --git a/meta/recipes-bsp/grub/grub-efi_2.06.bb b/meta/recipes-bsp/grub/grub-efi_2.06.bb
index 96e9df88b6..a8cc209a02 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.06.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.06.bb
@@ -5,7 +5,7 @@ require conf/image-uefi.conf
 GRUBPLATFORM = "efi"
 
 DEPENDS:append = " grub-native"
-RDEPENDS:${PN} = "grub-common virtual/grub-bootconf"
+RDEPENDS:${PN} = "grub-common virtual-grub-bootconf"
 
 SRC_URI += " \
            file://cfg \
diff --git a/meta/recipes-core/systemd/systemd-boot_249.3.bb b/meta/recipes-core/systemd/systemd-boot_249.3.bb
index af2be162a3..b3d4e31e08 100644
--- a/meta/recipes-core/systemd/systemd-boot_249.3.bb
+++ b/meta/recipes-core/systemd/systemd-boot_249.3.bb
@@ -46,7 +46,7 @@ python __anonymous () {
 
 FILES:${PN} = "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}"
 
-RDEPENDS:${PN} += "virtual/systemd-bootconf"
+RDEPENDS:${PN} += "virtual-systemd-bootconf"
 
 # Imported from the old gummiboot recipe
 TUNE_CCARGS:remove = "-mfpmath=sse"
diff --git a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
index 12c4447f37..19637546a9 100644
--- a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
+++ b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
@@ -2,7 +2,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SUMMARY = "Basic systemd-boot configuration files"
 
-RPROVIDES:${PN} += "virtual/systemd-bootconf"
+RPROVIDES:${PN} += "virtual-systemd-bootconf"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit systemd-boot-cfg
-- 
2.25.1

