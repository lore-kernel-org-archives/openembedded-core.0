Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9750.1623330511246896808
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 06:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3EC3106F
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 06:08:30 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F2713F73D
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 06:08:30 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] image_types: add zsync conversions
Date: Thu, 10 Jun 2021 14:08:27 +0100
Message-Id: <20210610130827.2205143-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add image conversion types to create zsync[1] metadata.  Use .zsync if
the image is already compressed and .gzsync if zsync should compress the
image itself.

The required tool, zsync-curl, has been submitted to meta-oe.

[1] http://zsync.moria.org.uk

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/image_types.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.=
bbclass
index 2a45d45c71..954d6739ec 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -278,7 +278,7 @@ IMAGE_TYPES =3D " \
 # CONVERSION_CMD/DEPENDS.
 COMPRESSIONTYPES ?=3D ""
=20
-CONVERSIONTYPES =3D "gz bz2 lzma xz lz4 lzo zip zst sum md5sum sha1sum s=
ha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qcow=
2 base64 ${COMPRESSIONTYPES}"
+CONVERSIONTYPES =3D "gz bz2 lzma xz lz4 lzo zip zst sum md5sum sha1sum s=
ha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qcow=
2 base64 gzsync zsync ${COMPRESSIONTYPES}"
 CONVERSION_CMD_lzma =3D "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}=
.${type}"
 CONVERSION_CMD_gz =3D "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}${IMAGE=
_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
 CONVERSION_CMD_bz2 =3D "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$=
{type}"
@@ -302,6 +302,8 @@ CONVERSION_CMD_vhd =3D "qemu-img convert -O vpc -o su=
bformat=3Dfixed ${IMAGE_NAME}${
 CONVERSION_CMD_vdi =3D "qemu-img convert -O vdi ${IMAGE_NAME}${IMAGE_NAM=
E_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vdi"
 CONVERSION_CMD_qcow2 =3D "qemu-img convert -O qcow2 ${IMAGE_NAME}${IMAGE=
_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.qcow2"
 CONVERSION_CMD_base64 =3D "base64 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${ty=
pe} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.base64"
+CONVERSION_CMD_zsync =3D "zsyncmake_curl ${IMAGE_NAME}${IMAGE_NAME_SUFFI=
X}.${type}"
+CONVERSION_CMD_gzsync =3D "zsyncmake_curl -z ${IMAGE_NAME}${IMAGE_NAME_S=
UFFIX}.${type}"
 CONVERSION_DEPENDS_lzma =3D "xz-native"
 CONVERSION_DEPENDS_gz =3D "pigz-native"
 CONVERSION_DEPENDS_bz2 =3D "pbzip2-native"
@@ -319,6 +321,8 @@ CONVERSION_DEPENDS_qcow2 =3D "qemu-system-native"
 CONVERSION_DEPENDS_base64 =3D "coreutils-native"
 CONVERSION_DEPENDS_vhdx =3D "qemu-system-native"
 CONVERSION_DEPENDS_vhd =3D "qemu-system-native"
+CONVERSION_DEPENDS_zsync =3D "zsync-curl-native"
+CONVERSION_DEPENDS_gzsync =3D "zsync-curl-native"
=20
 RUNNABLE_IMAGE_TYPES ?=3D "ext2 ext3 ext4"
 RUNNABLE_MACHINE_PATTERNS ?=3D "qemu"
--=20
2.25.1

