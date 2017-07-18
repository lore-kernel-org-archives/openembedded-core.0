Return-Path: <gael.portay@savoirfairelinux.com>
X-Greylist: delayed 418 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 18 Jul 2017 01:01:59 UTC
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 98B3A77CEC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 01:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B957C9C1672
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:55:02 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id tNQ8IIVW_7FM; Mon, 17 Jul 2017 20:55:02 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 586D79C1B49;
	Mon, 17 Jul 2017 20:55:02 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id yNHCXGK4NZVb; Mon, 17 Jul 2017 20:55:02 -0400 (EDT)
Received: from localhost.localdomain (modemcable013.17-177-173.mc.videotron.ca
	[173.177.17.13])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 2DDF49C1672;
	Mon, 17 Jul 2017 20:55:02 -0400 (EDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jul 2017 20:54:57 -0400
Message-Id: <20170718005457.1179-1-gael.portay@savoirfairelinux.com>
X-Mailer: git-send-email 2.13.2
MIME-Version: 1.0
Subject: [PATCH] kernel: fitimage: deploy real fit-image
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
X-List-Received-Date: Tue, 18 Jul 2017 01:02:00 -0000
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

Signed-off-by: Ga=C3=ABl PORTAY <gael.portay@savoirfairelinux.com>
---
Hi all,

This patch is a modified version of the one I wrote on a meta-arago/morty
build. Thus it is not tested, but it should work.

In the deploy image directory, I had

	$ file -L fitImage=20
	fitImage: Linux kernel ARM boot executable zImage (little-endian)

With the patch, I have

	$ file -L fitImage=20
	fitImage: data

Regards,
Gael

 meta/classes/kernel-fitimage.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-f=
itimage.bbclass
index 2630b47316..a745e873c1 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -453,9 +453,9 @@ kernel_do_deploy_append() {
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
@@ -469,7 +469,7 @@ kernel_do_deploy_append() {
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
2.13.2


