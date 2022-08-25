Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E5FC28D13
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 13:36:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.24016.1661434596333415765
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 06:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90E90D6E;
	Thu, 25 Aug 2022 06:36:40 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88CC83F71A;
	Thu, 25 Aug 2022 06:36:35 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 6/6] wic: depend on cross-binutils
Date: Thu, 25 Aug 2022 14:36:30 +0100
Message-Id: <20220825133630.1659896-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825133630.1659896-1-ross.burton@arm.com>
References: <20220825133630.1659896-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 13:36:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169864

Wic can build an unified kernel image, but this needs the cross-objcopy
from binutils.

(From OE-Core rev: 7c7a488116f49083ca42d3628ebc0870585110c3)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image_types_wic.bbclass | 2 ++
 meta/recipes-core/meta/wic-tools.bb  | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_ty=
pes_wic.bbclass
index e3863c88a9a..5374d6125e1 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -84,6 +84,8 @@ do_image_wic[deptask] +=3D "do_image_complete"
=20
 WKS_FILE_DEPENDS_DEFAULT =3D '${@bb.utils.contains_any("BUILD_ARCH", [ '=
x86_64', 'i686' ], "syslinux-native", "",d)}'
 WKS_FILE_DEPENDS_DEFAULT +=3D "bmap-tools-native cdrtools-native btrfs-t=
ools-native squashfs-tools-native e2fsprogs-native"
+# Unified kernel images need objcopy
+WKS_FILE_DEPENDS_DEFAULT +=3D "virtual/${TARGET_PREFIX}binutils"
 WKS_FILE_DEPENDS_BOOTLOADERS =3D ""
 WKS_FILE_DEPENDS_BOOTLOADERS:x86 =3D "syslinux grub-efi systemd-boot os-=
release"
 WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 =3D "syslinux grub-efi systemd-boot =
os-release"
diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta=
/wic-tools.bb
index ba0916cb567..daaf3ea5768 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -6,7 +6,8 @@ DEPENDS =3D "\
            parted-native gptfdisk-native dosfstools-native \
            mtools-native bmap-tools-native grub-native cdrtools-native \
            btrfs-tools-native squashfs-tools-native pseudo-native \
-           e2fsprogs-native util-linux-native tar-native\
+           e2fsprogs-native util-linux-native tar-native \
+           virtual/${TARGET_PREFIX}binutils \
            "
 DEPENDS:append:x86 =3D " syslinux-native syslinux grub-efi systemd-boot"
 DEPENDS:append:x86-64 =3D " syslinux-native syslinux grub-efi systemd-bo=
ot"
--=20
2.34.1


