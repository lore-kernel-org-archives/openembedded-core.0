Return-Path: <gael.portay@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7422E7523F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2018 17:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id D3B559C1B77
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2018 13:23:42 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id 6RvYXs9wgN6F; Sat, 16 Jun 2018 13:23:42 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 4D4A39C1C91;
	Sat, 16 Jun 2018 13:23:42 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id DH6AszwNm21L; Sat, 16 Jun 2018 13:23:42 -0400 (EDT)
Received: from localhost.localdomain (unknown [172.16.15.10])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 240439C1B77;
	Sat, 16 Jun 2018 13:23:42 -0400 (EDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2018 13:23:40 -0400
Message-Id: <20180616172340.24189-1-gael.portay@savoirfairelinux.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH v2] kernel: fitimage: deploy real fit-image
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
X-List-Received-Date: Sat, 16 Jun 2018 17:23:44 -0000
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
Changes since v1:
 - rebase onto master 83c9405df5748744ef673ac8757bb89d7050ad8d

 meta/classes/kernel-fitimage.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-f=
itimage.bbclass
index 50a91e1990..081a8bfd84 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -461,9 +461,9 @@ kernel_do_deploy_append() {
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
@@ -477,7 +477,7 @@ kernel_do_deploy_append() {
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
2.17.1


