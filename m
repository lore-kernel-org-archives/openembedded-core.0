Return-Path: <rpeuvergne@free.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B406EB64DB
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 13:03:31 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by mx.groups.io with SMTP id smtpd.web11.17622.1686834203777956913
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 06:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: non.se.com, ip: 212.27.42.3, mailfrom: remi.peuvergne@non.se.com)
Received: from localhost.localdomain (unknown [80.214.152.232])
	(Authenticated sender: rpeuvergne@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id D05CD13F8D5;
	Thu, 15 Jun 2023 15:03:16 +0200 (CEST)
From: Remi Peuvergne <remi.peuvergne@non.se.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>,
	Walter Schweizer <walter.schweizer@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Remi Peuvergne <remi.peuvergne@non.se.com>
Subject: [dunfell][PATCH 2/2] kernel-fitimage: use correct kernel image
Date: Thu, 15 Jun 2023 15:02:01 +0200
Message-Id: <20230615130201.1875914-3-remi.peuvergne@non.se.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230615130201.1875914-1-remi.peuvergne@non.se.com>
References: <20230615130201.1875914-1-remi.peuvergne@non.se.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 13:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182860

From: Andrej Valek <andrej.valek@siemens.com>

Even if initramfs_bundle_path was used, a wrong compression was reflected
in output its template file. Use linux.bin as universal kernel image.
The linux.bin file covers both cases because it's beying created from
vmlinux.

We know, that vmlinux is created inside compressed directory already,
so no external compression will be used.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Walter Schweizer <walter.schweizer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backport of 27fbbeaf972bb7e2535c1b23375cfa9d66b69db6 in master branch
Signed-off-by: Remi Peuvergne <remi.peuvergne@non.se.com>
---
 meta/classes/kernel-fitimage.bbclass | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-f=
itimage.bbclass
index 945914af44..ab483c383b 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -423,22 +423,7 @@ fitimage_assemble() {
 	fitimage_emit_section_maint ${1} imagestart
=20
 	uboot_prep_kimage
-
-	if [ "${INITRAMFS_IMAGE_BUNDLE}" =3D "1" ]; then
-		initramfs_bundle_path=3D"arch/"${UBOOT_ARCH}"/boot/"${KERNEL_IMAGETYPE=
_REPLACEMENT}".initramfs"
-		if [ -e "${initramfs_bundle_path}" ]; then
-
-			#
-			# Include the kernel/rootfs bundle.
-			#
-
-			fitimage_emit_section_kernel ${1} "${kernelcount}" "${initramfs_bundl=
e_path}" "${linux_comp}"
-		else
-			bbwarn "${initramfs_bundle_path} not found."
-		fi
-	else
-		fitimage_emit_section_kernel ${1} "${kernelcount}" linux.bin "${linux_=
comp}"
-	fi
+	fitimage_emit_section_kernel $1 $kernelcount linux.bin "$linux_comp"
=20
 	#
 	# Step 2: Prepare a DTB image section
--=20
2.25.1


