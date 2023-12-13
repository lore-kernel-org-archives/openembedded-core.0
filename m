Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723B7C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 18:22:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.43760.1702491767103411503
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 10:22:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 445DFC15
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 10:23:32 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1F3AF3F762
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 10:22:46 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] images: add core-image-initramfs-boot
Date: Wed, 13 Dec 2023 18:22:37 +0000
Message-Id: <20231213182237.792790-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 18:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192310

From: Ross Burton <ross.burton@arm.com>

Add a minimal initramfs image recipe that just contains enough initramfs
to find the real root filesystem and pivot to it.

BSPs can use MACHINE_EXTRA_RRECOMMENDS to pull in any kernel module
packages that are required to bring up the hardware so that the rootfs
can be found.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../images/core-image-initramfs-boot.bb       | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-core/images/core-image-initramfs-boot.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 445f797bcb7..de68b32192f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -101,6 +101,7 @@ RECIPE_MAINTAINER:pn-connman-conf =3D "Ross Burton <r=
oss.burton@arm.com>"
 RECIPE_MAINTAINER:pn-connman-gnome =3D "Ross Burton <ross.burton@arm.com=
>"
 RECIPE_MAINTAINER:pn-consolekit =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-core-image-base =3D "Richard Purdie <richard.purdie=
@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-core-image-initramfs-boot =3D "Ross Burton <ross.bu=
rton@arm.com>"
 RECIPE_MAINTAINER:pn-core-image-minimal =3D "Richard Purdie <richard.pur=
die@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-minimal-dev =3D "Richard Purdie <richard=
.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-minimal-initramfs =3D "Richard Purdie <r=
ichard.purdie@linuxfoundation.org>"
diff --git a/meta/recipes-core/images/core-image-initramfs-boot.bb b/meta=
/recipes-core/images/core-image-initramfs-boot.bb
new file mode 100644
index 00000000000..72589447513
--- /dev/null
+++ b/meta/recipes-core/images/core-image-initramfs-boot.bb
@@ -0,0 +1,22 @@
+SUMMARY =3D "Basic initramfs to boot a fully-featured rootfs"
+DESCRIPTION =3D "Small initramfs that contains just udev and init, to fi=
nd the real rootfs."
+LICENSE =3D "MIT"
+
+INITRAMFS_SCRIPTS ?=3D "initramfs-framework-base initramfs-module-udev"
+
+PACKAGE_INSTALL =3D "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} =
base-passwd"
+
+# Ensure the initramfs only contains the bare minimum
+IMAGE_FEATURES =3D ""
+IMAGE_LINGUAS =3D ""
+
+# Don't allow the initramfs to contain a kernel, as kernel modules will =
depend
+# on the kernel image.
+PACKAGE_EXCLUDE =3D "kernel-image-*"
+
+IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
+IMAGE_NAME_SUFFIX ?=3D ""
+IMAGE_ROOTFS_SIZE =3D "8192"
+IMAGE_ROOTFS_EXTRA_SPACE =3D "0"
+
+inherit image
--=20
2.34.1


