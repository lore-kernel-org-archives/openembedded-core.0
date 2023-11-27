Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E63AC0755A
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 11:48:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.93083.1701085706812080453
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 03:48:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38E842F4;
	Mon, 27 Nov 2023 03:49:13 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2963D3F73F;
	Mon, 27 Nov 2023 03:48:25 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] core-image-minimal-initramfs: don't install a kernel into the initramfs
Date: Mon, 27 Nov 2023 11:48:23 +0000
Message-Id: <20231127114823.1817907-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 11:48:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191295

From: Ross Burton <ross.burton@arm.com>

There's obviously no point in installing a kernel into an initramfs, but
if we install kernel modules then they'll recommend the relevant kernel.

Set PACKAGE_EXCLUDE to ensure the initramfs for a kernel doesn't contain
the kernel.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/images/core-image-minimal-initramfs.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/m=
eta/recipes-core/images/core-image-minimal-initramfs.bb
index 1c08c7fec62..7bb0b2738c7 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -17,6 +17,9 @@ PACKAGE_INSTALL =3D "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUN=
TIME_base-utils} udev base-
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES =3D ""
=20
+# Don't allow the initramfs to contain a kernel
+PACKAGE_EXCLUDE =3D "kernel-image-*"
+
 export IMAGE_BASENAME =3D "${MLPREFIX}core-image-minimal-initramfs"
 IMAGE_NAME_SUFFIX ?=3D ""
 IMAGE_LINGUAS =3D ""
--=20
2.34.1


