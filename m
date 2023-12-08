Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D676DC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 10:56:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20329.1702032965671739470
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 02:56:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E22D411FB;
	Fri,  8 Dec 2023 02:56:50 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C39BF3F762;
	Fri,  8 Dec 2023 02:56:04 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] images: remove redundant IMAGE_BASENAME assignments
Date: Fri,  8 Dec 2023 10:56:03 +0000
Message-Id: <20231208105603.3977045-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 10:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192041

From: Ross Burton <ross.burton@arm.com>

core-image-tiny-initramfs and core-image-testcontroller-initramfs just
repeat PN, which is the default value.

core-image-minimal-initramfs adds MLPREFIX, but that's also covered by
PN:

$ bitbake-getvar -r lib32-core-image-minimal-initramfs IMAGE_BASENAME
IMAGE_BASENAME=3D"lib32-core-image-minimal-initramfs"

As these assignments are all redundant, remove them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/images/core-image-minimal-initramfs.bb         | 1 -
 meta/recipes-core/images/core-image-tiny-initramfs.bb            | 1 -
 .../images/core-image-testcontroller-initramfs.bb                | 1 -
 3 files changed, 3 deletions(-)

diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/m=
eta/recipes-core/images/core-image-minimal-initramfs.bb
index 7bb0b2738c7..36e8771c4ab 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -20,7 +20,6 @@ IMAGE_FEATURES =3D ""
 # Don't allow the initramfs to contain a kernel
 PACKAGE_EXCLUDE =3D "kernel-image-*"
=20
-export IMAGE_BASENAME =3D "${MLPREFIX}core-image-minimal-initramfs"
 IMAGE_NAME_SUFFIX ?=3D ""
 IMAGE_LINGUAS =3D ""
=20
diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta=
/recipes-core/images/core-image-tiny-initramfs.bb
index 8af25f1b1fe..7a71d55b1e8 100644
--- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
+++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
@@ -13,7 +13,6 @@ PACKAGE_INSTALL =3D "initramfs-live-boot-tiny packagegr=
oup-core-boot dropbear ${VI
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES =3D ""
=20
-export IMAGE_BASENAME =3D "core-image-tiny-initramfs"
 IMAGE_NAME_SUFFIX ?=3D ""
 IMAGE_LINGUAS =3D ""
=20
diff --git a/meta/recipes-extended/images/core-image-testcontroller-initr=
amfs.bb b/meta/recipes-extended/images/core-image-testcontroller-initramf=
s.bb
index a5b3d10205c..3b81afd7c07 100644
--- a/meta/recipes-extended/images/core-image-testcontroller-initramfs.bb
+++ b/meta/recipes-extended/images/core-image-testcontroller-initramfs.bb
@@ -7,7 +7,6 @@ PACKAGE_INSTALL =3D "initramfs-live-boot initramfs-live-i=
nstall-testfs initramfs-l
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES =3D ""
=20
-export IMAGE_BASENAME =3D "core-image-testcontroller-initramfs"
 IMAGE_NAME_SUFFIX ?=3D ""
 IMAGE_LINGUAS =3D ""
=20
--=20
2.34.1


