Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246D1C433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 09:15:37 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.5156.1648631735025199009
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 02:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=d6fI5ccR;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-084-059-085-148.084.059.pools.vodafone-ip.de
 [84.59.85.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 723098209D;
	Wed, 30 Mar 2022 11:15:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1648631732;
	bh=yPlnlg5XRITNa38ZyLhoOjSI6HV2b4+yPt5Xy0kPhOc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d6fI5ccRBqpvil6xO4SOJcDdA9/QnPmq2fSxAtleNeUpSu5TStx0m0edA/Uk6Ftbr
	 vL2ESFplCLXLYW1B398PPjWetBsPBct4mhGI16/lJr0ns+sRGO1g7mggxWn/skTKcb
	 R442MtDDB6UMVvdtUZUzeoZRK7Jb37a0ITbaqArrHpJ6vynD4lzMfGITrW8WXFYU9w
	 iNvMrvqekb8FbrYTkWN+VnovmCkdSNhqDdJTbaUGro8LFHHsy3UBrX4b1b/fEIcjEj
	 cC/ggv/P5L+IYkDD6YWNILD6NJCUF7KLZmowrdOeAdkJZaRM2/N8K3WUAWKt/63Ur/
	 R3iNts7jpPx6Q==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Claudius Heine <ch@denx.de>
Subject: [RFC PATCH 1/1] kernel: add kernel-image-fitimage-initramfs
Date: Wed, 30 Mar 2022 11:15:22 +0200
Message-Id: <20220330091522.795083-2-ch@denx.de>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220330091522.795083-1-ch@denx.de>
References: <20220330091522.795083-1-ch@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 09:15:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163778

When creating an initramfs bundled into a kernel fitimage, the resulting
fitimage will only be placed into the deploy directory and not packaged
by the kernel recipe/class.

Changing the kernel recipe/class to produce a package with the fitimage
containing the initramfs is not possible, because build dependencies
require the kernel packages to be already build before the initramfs can
be created.

The kernel-image-fitimage-initramfs recipe solves this dependency cycle
by packaging the fitimage with the embedded initramfs from the deploy
directory and replaces the `kernel-image` and `kernel-image-fitimage`
packages from the kernel recipe/class.

Signed-off-by: Claudius Heine <ch@denx.de>
---
 .../kernel-image-fitimage-initramfs_0.1.0.bb  | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 meta/recipes-kernel/kernel-image-fitimage-initramfs/k=
ernel-image-fitimage-initramfs_0.1.0.bb

diff --git a/meta/recipes-kernel/kernel-image-fitimage-initramfs/kernel-i=
mage-fitimage-initramfs_0.1.0.bb b/meta/recipes-kernel/kernel-image-fitim=
age-initramfs/kernel-image-fitimage-initramfs_0.1.0.bb
new file mode 100644
index 0000000000..c25168301b
--- /dev/null
+++ b/meta/recipes-kernel/kernel-image-fitimage-initramfs/kernel-image-fi=
timage-initramfs_0.1.0.bb
@@ -0,0 +1,50 @@
+# Copyright (C) 2022 Claudius Heine <ch@denx.de>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY =3D "Packages the fitimage with embedded initramfs"
+LICENSE =3D "GPL-2.0-only"
+DEPENDS =3D "virtual/kernel"
+
+SRC_URI =3D ""
+
+inherit kernel-artifact-names
+INITRAMFS_IMAGE_NAME ?=3D "${@['${INITRAMFS_IMAGE}-${MACHINE}', ''][d.ge=
tVar('INITRAMFS_IMAGE') =3D=3D '']}"
+KERNEL_PACKAGE_NAME ?=3D "kernel"
+
+PN =3D "${KERNEL_PACKAGE_NAME}-image-fitimage-initramfs"
+
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+
+do_install[deptask] =3D "do_deploy"
+do_install() {
+    fitimage=3D"$(readlink "${DEPLOY_DIR_IMAGE}/fitImage-${INITRAMFS_IMA=
GE_NAME}-${KERNEL_FIT_LINK_NAME}")"
+    install -d ${D}/boot
+    install -m 0644 \
+        ${DEPLOY_DIR_IMAGE}/${fitimage} \
+        ${D}/boot/
+    ln -snf \
+        ${fitimage} \
+        ${D}/boot/fitImage
+}
+
+PACKAGES +=3D "${KERNEL_PACKAGE_NAME}-image-initramfs"
+
+FILES:${PN} =3D "/boot/fitImage /boot/fitImage-*"
+RPROVIDES:${PN} =3D "${KERNEL_PACKAGE_NAME}-image-fitimage"
+RCONFLICTS:${PN} =3D "${KERNEL_PACKAGE_NAME}-image-fitimage"
+RREPLACES:${PN} =3D "${KERNEL_PACKAGE_NAME}-image-fitimage"
+
+RDEPENDS:${KERNEL_PACKAGE_NAME}-image-initramfs =3D "${KERNEL_PACKAGE_NA=
ME}-image-fitimage-initramfs (=3D ${EXTENDPGKV})"
+RPROVIDES:${KERNEL_PACKAGE_NAME}-image-initramfs =3D "${KERNEL_PACKAGE_N=
AME}-image"
+RCONFLICTS:${KERNEL_PACKAGE_NAME}-image-initramfs =3D "${KERNEL_PACKAGE_=
NAME}-image"
+RREPLACES:${KERNEL_PACKAGE_NAME}-image-initramfs =3D "${KERNEL_PACKAGE_N=
AME}-image"
+ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image-initramfs =3D "1"
+
+python() {
+    if (not 'fitImage' in d.getVar('KERNEL_IMAGETYPES') or
+            bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE'))):
+        raise bb.parse.SkipRecipe('Requires generation of fitImage and b=
undled initramfs.')
+    if not d.getVar('KERNEL_FIT_LINK_NAME'):
+        raise bb.parse.SkipRecipe('Requires generation of fitImage symli=
nk in deploy dir.')
+}
--=20
2.33.1


