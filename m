Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5480.1626438252617290691
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jul 2021 05:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35EC2D6E
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 05:24:12 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D38A63F774
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 05:24:11 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] image_types: ext4 should always have large inodes
Date: Fri, 16 Jul 2021 13:24:07 +0100
Message-Id: <20210716122407.19416-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

mkfs.ext4 has logic where "small" file systems use "good old" 128-byte
inodes instead of the default 256-byte inodes.  This means that small
filesystems are not 2038-safe as they only support 32-bit timestamps.

However, "small" is defined as "less than 500MB", which is a fair number
of filesystems in OpenEmbedded, especially when filesystems may be
created small and expanded later.

To avoid a discussion over how small a file system should be before
it shouldn't be 2038-safe, simply build all filesystems with the default
type so they all have 256-byte inodes and thus 64-bit timestamps.

[ YOCTO #14478 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.=
bbclass
index 954d6739ec..3dad86caa7 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -90,7 +90,7 @@ oe_mkext234fs () {
=20
 IMAGE_CMD_ext2 =3D "oe_mkext234fs ext2 ${EXTRA_IMAGECMD}"
 IMAGE_CMD_ext3 =3D "oe_mkext234fs ext3 ${EXTRA_IMAGECMD}"
-IMAGE_CMD_ext4 =3D "oe_mkext234fs ext4 ${EXTRA_IMAGECMD}"
+IMAGE_CMD_ext4 =3D "oe_mkext234fs ext4 -T default ${EXTRA_IMAGECMD}"
=20
 MIN_BTRFS_SIZE ?=3D "16384"
 IMAGE_CMD_btrfs () {
--=20
2.25.1

