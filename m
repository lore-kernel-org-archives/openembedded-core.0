Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F93C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 11:12:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.18442.1658920319616828246
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 04:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9F1BD6E;
	Wed, 27 Jul 2022 04:11:59 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1C113F70D;
	Wed, 27 Jul 2022 04:11:58 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] wic: depend on cross-binutils
Date: Wed, 27 Jul 2022 12:11:55 +0100
Message-Id: <20220727111155.101717-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727111155.101717-1-ross.burton@arm.com>
References: <20220727111155.101717-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 11:12:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168555

Wic can build an unified kernel image, but this needs the cross-objcopy
from binutils.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/image_types_wic.bbclass | 2 ++
 meta/recipes-core/meta/wic-tools.bb  | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_ty=
pes_wic.bbclass
index 79f8d93b94c..940dc5f5774 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -84,6 +84,8 @@ do_image_wic[deptask] +=3D "do_image_complete"
=20
 WKS_FILE_DEPENDS_DEFAULT =3D '${@bb.utils.contains_any("BUILD_ARCH", [ '=
x86_64', 'i686' ], "syslinux-native", "",d)}'
 WKS_FILE_DEPENDS_DEFAULT +=3D "bmap-tools-native cdrtools-native btrfs-t=
ools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
+# Unified kernel images need objcopy
+WKS_FILE_DEPENDS_DEFAULT +=3D "virtual/${TARGET_PREFIX}binutils"
 WKS_FILE_DEPENDS_BOOTLOADERS =3D ""
 WKS_FILE_DEPENDS_BOOTLOADERS:x86 =3D "syslinux grub-efi systemd-boot os-=
release"
 WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 =3D "syslinux grub-efi systemd-boot =
os-release"
diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta=
/wic-tools.bb
index b9580d7e335..9282d36a4dc 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -7,6 +7,7 @@ DEPENDS =3D "\
            mtools-native bmap-tools-native grub-native cdrtools-native \
            btrfs-tools-native squashfs-tools-native pseudo-native \
            e2fsprogs-native util-linux-native tar-native erofs-utils-nat=
ive \
+           virtual/${TARGET_PREFIX}binutils \
            "
 DEPENDS:append:x86 =3D " syslinux-native syslinux grub-efi systemd-boot"
 DEPENDS:append:x86-64 =3D " syslinux-native syslinux grub-efi systemd-bo=
ot"
--=20
2.34.1


