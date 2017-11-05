Return-Path: <gael.portay@savoirfairelinux.com>
X-Greylist: delayed 565 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 05 Nov 2017 18:01:55 UTC
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id CE9E8782A3
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Nov 2017 18:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E00889C24E0;
	Sun,  5 Nov 2017 12:52:31 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id x3TaquWREbq0; Sun,  5 Nov 2017 12:52:30 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A3EA29C1BE9;
	Sun,  5 Nov 2017 12:52:30 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id sJJGLfAsvjiB; Sun,  5 Nov 2017 12:52:30 -0500 (EST)
Received: from localhost.localdomain (unknown [172.16.15.6])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 70D489C24E0;
	Sun,  5 Nov 2017 12:52:30 -0500 (EST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Nov 2017 12:52:36 -0500
Message-Id: <20171105175236.26818-1-gael.portay@savoirfairelinux.com>
X-Mailer: git-send-email 2.14.2
MIME-Version: 1.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [RESEND PATCH] kernel: fitimage: deploy real fit-image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Nov 2017 18:01:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Currently, do_deploy installs a standard kernel image as an ITB. This
image is linux.bin and it is prepared by uboot_prep_kimage.

The real kernel fit-image is build under arch/${ARCH}/boot/fitImage.

This patch deploys the real fit-image instead of the one prepared by
u-boot and which is included in the ITB.

Note: this patch only concerns fit-images which are not signed by u-boot
or which do not contains initramfs. Only a kernel image with a
device-tree.

Reviewed-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Ga=C3=ABl PORTAY <gael.portay@savoirfairelinux.com>
---

 meta/classes/kernel-fitimage.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-f=
itimage.bbclass
index 179185b6b2..8b581b36e7 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -456,9 +456,9 @@ kernel_do_deploy_append() {
 		its_base_name=3D"fitImage-its-${PV}-${PR}-${MACHINE}-${DATETIME}"
 		its_symlink_name=3DfitImage-its-${MACHINE}
 		install -m 0644 fit-image.its ${DEPLOYDIR}/${its_base_name}.its
-		linux_bin_base_name=3D"fitImage-linux.bin-${PV}-${PR}-${MACHINE}-${DAT=
ETIME}"
-		linux_bin_symlink_name=3DfitImage-linux.bin-${MACHINE}
-		install -m 0644 linux.bin ${DEPLOYDIR}/${linux_bin_base_name}.bin
+		itb_base_name=3D"fitImage-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}=
"
+		itb_symlink_name=3DfitImage-linux.bin-${MACHINE}
+		install -m 0644 arch/${ARCH}/boot/fitImage ${DEPLOYDIR}/${itb_base_nam=
e}.bin
=20
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
 			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
@@ -472,7 +472,7 @@ kernel_do_deploy_append() {
=20
 		cd ${DEPLOYDIR}
 		ln -sf ${its_base_name}.its ${its_symlink_name}.its
-		ln -sf ${linux_bin_base_name}.bin ${linux_bin_symlink_name}.bin
+		ln -sf ${itb_base_name}.bin ${itb_symlink_name}.bin
=20
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
 			ln -sf ${its_initramfs_base_name}.its ${its_initramfs_symlink_name}.i=
ts
--=20
2.14.2


