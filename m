Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACF3C433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 11:52:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9200.1644493924684821307
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 03:52:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BBE7ED1
	for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 03:52:03 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 190233F73B
	for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 03:52:02 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel: make kernel-base recommend kernel-image, not depend
Date: Thu, 10 Feb 2022 11:52:01 +0000
Message-Id: <20220210115201.1729034-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 11:52:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161611

As kernel modules depend on the base kernel package, and the base kernel
recipe depends on the kernel image, it's impossible to build file system
images which contain kernel modules but not the kernel itself, such as
an initramfs.

Change the RDEPENDS to RRECOMMENDS so that the disk images can set
PACKAGE_EXCLUDE =3D "kernel-image-*" to remove the kernel.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 880ee614064..4f304eb9c7a 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -655,7 +655,7 @@ FILES:${KERNEL_PACKAGE_NAME}-modules =3D ""
 RDEPENDS:${KERNEL_PACKAGE_NAME} =3D "${KERNEL_PACKAGE_NAME}-base (=3D ${=
EXTENDPKGV})"
 # Allow machines to override this dependency if kernel image files are
 # not wanted in images as standard
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base ?=3D "${KERNEL_PACKAGE_NAME}-image =
(=3D ${EXTENDPKGV})"
+RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base ?=3D "${KERNEL_PACKAGE_NAME}-ima=
ge (=3D ${EXTENDPKGV})"
 PKG:${KERNEL_PACKAGE_NAME}-image =3D "${KERNEL_PACKAGE_NAME}-image-${@le=
gitimize_package_name(d.getVar('KERNEL_VERSION'))}"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-image +=3D "${@oe.utils.conditional('KER=
NEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux (=3D ${EXTENDP=
KGV})', '', d)}"
 PKG:${KERNEL_PACKAGE_NAME}-base =3D "${KERNEL_PACKAGE_NAME}-${@legitimiz=
e_package_name(d.getVar('KERNEL_VERSION'))}"
--=20
2.25.1


