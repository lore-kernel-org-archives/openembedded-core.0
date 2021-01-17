Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.18809.1610893549911519285
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jan 2021 06:25:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=kt2/NTq6;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from dom0.fritz.box (unknown [87.123.119.238])
	by linux.microsoft.com (Postfix) with ESMTPSA id CAA8E20B6C41;
	Sun, 17 Jan 2021 06:25:46 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CAA8E20B6C41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1610893549;
	bh=QbAyqUCfoPuGwlXHRcSG4FT2+TlZIx32t6AqLXTPG9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kt2/NTq6VP+ockA0ZOw2blNvNYYDAywQm5/cJSBCKtRwsAXTk1RHdyrMCkhOFSnpG
	 sYBdxJXkEG4kBZmSphiaHaAtG/wMVod0uFkiBGZxOEkgSygD1RY5+BUND7caWdJGtZ
	 eVjRGS2UsjUMELL7Xx7hwrxu3NHYpri+p06r0VIk=
From: "Anatol Belski" <anbelski@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Paul Barker <pbarker@konsulko.com>
Subject: [meta-oe][PATCH v2 2/3] meta/classes: Add supprot for WIC<>VHD/VHDX conversion
Date: Sun, 17 Jan 2021 15:25:18 +0100
Message-Id: <20210117142519.21297-2-anbelski@linux.microsoft.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117142519.21297-1-anbelski@linux.microsoft.com>
References: <20210117142519.21297-1-anbelski@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Sinan Kaya <okaya@kernel.org>

Signed-off-by: Sinan Kaya <okaya@kernel.org>
Co-Developed-by: Anatol Belski <anbelski@linux.microsoft.com>
Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
---
 meta/classes/image-live.bbclass  | 2 +-
 meta/classes/image_types.bbclass | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bb=
class
index 9ea5ddc312..1b2183eadd 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -234,7 +234,7 @@ build_hddimg() {
 				bberror "${HDDDIR}/rootfs.img rootfs size is greather than or equal =
to 4GB,"
 				bberror "and this doesn't work on a FAT filesystem. You can either:"
 				bberror "1) Reduce the size of rootfs.img, or,"
-				bbfatal "2) Use wic, vmdk or vdi instead of hddimg\n"
+				bbfatal "2) Use wic, vmdk,vhd, vhdx or vdi instead of hddimg\n"
 			fi
 		fi
=20
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.=
bbclass
index 286009057e..c937ae4538 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -269,7 +269,7 @@ IMAGE_TYPES =3D " \
 # CONVERSION_CMD/DEPENDS.
 COMPRESSIONTYPES ?=3D ""
=20
-CONVERSIONTYPES =3D "gz bz2 lzma xz lz4 lzo zip zst sum md5sum sha1sum s=
ha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 base64 =
${COMPRESSIONTYPES}"
+CONVERSIONTYPES =3D "gz bz2 lzma xz lz4 lzo zip zst sum md5sum sha1sum s=
ha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qcow=
2 base64 ${COMPRESSIONTYPES}"
 CONVERSION_CMD_lzma =3D "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}=
.${type}"
 CONVERSION_CMD_gz =3D "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}${IMAGE=
_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
 CONVERSION_CMD_bz2 =3D "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$=
{type}"
@@ -288,6 +288,8 @@ CONVERSION_CMD_sha512sum =3D "sha512sum ${IMAGE_NAME}=
${IMAGE_NAME_SUFFIX}.${type}
 CONVERSION_CMD_bmap =3D "bmaptool create ${IMAGE_NAME}${IMAGE_NAME_SUFFI=
X}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.bmap"
 CONVERSION_CMD_u-boot =3D "mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk =
-C none -n ${IMAGE_NAME} -d ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${I=
MAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.u-boot"
 CONVERSION_CMD_vmdk =3D "qemu-img convert -O vmdk ${IMAGE_NAME}${IMAGE_N=
AME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vmdk"
+CONVERSION_CMD_vhdx =3D "qemu-img convert -O vhdx -o subformat=3Ddynamic=
 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFF=
IX}.${type}.vhdx"
+CONVERSION_CMD_vhd =3D "qemu-img convert -O vpc -o subformat=3Dfixed ${I=
MAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.=
${type}.vhd"
 CONVERSION_CMD_vdi =3D "qemu-img convert -O vdi ${IMAGE_NAME}${IMAGE_NAM=
E_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vdi"
 CONVERSION_CMD_qcow2 =3D "qemu-img convert -O qcow2 ${IMAGE_NAME}${IMAGE=
_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.qcow2"
 CONVERSION_CMD_base64 =3D "base64 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${ty=
pe} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.base64"
@@ -306,6 +308,8 @@ CONVERSION_DEPENDS_vmdk =3D "qemu-system-native"
 CONVERSION_DEPENDS_vdi =3D "qemu-system-native"
 CONVERSION_DEPENDS_qcow2 =3D "qemu-system-native"
 CONVERSION_DEPENDS_base64 =3D "coreutils-native"
+CONVERSION_DEPENDS_vhdx =3D "qemu-system-native"
+CONVERSION_DEPENDS_vhd =3D "qemu-system-native"
=20
 RUNNABLE_IMAGE_TYPES ?=3D "ext2 ext3 ext4"
 RUNNABLE_MACHINE_PATTERNS ?=3D "qemu"
@@ -313,7 +317,7 @@ RUNNABLE_MACHINE_PATTERNS ?=3D "qemu"
 DEPLOYABLE_IMAGE_TYPES ?=3D "hddimg iso"=20
=20
 # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAG=
E_FSTYPES,
-# images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hdd=
img, iso, etc.
+# images that will not be built at do_rootfs time: vmdk, vhd, vhdx, vdi,=
 qcow2, hddimg, iso, etc.
 IMAGE_TYPES_MASKED ?=3D ""
=20
 # bmap requires python3 to be in the PATH
--=20
2.29.2

