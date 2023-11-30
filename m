Return-Path: <andrey.popov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21502C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 16:16:54 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web11.76364.1701361009235005095
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 08:16:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=FU3pYLW0;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=YxHTN2R8;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: andrey.popov@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com E8C9EC0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1701361004; bh=XsWd4rTIbCMQHDQYVA8owM7sy0ahHOQY3UNXvbjXohY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=FU3pYLW0rznbvSVwzQPccyStl5dPFmEZlWtqPmgHkCE83GXemeiTReI8/uwr3pusx
	 HhHC0HER4ZzwIYXYm/EwPoM8gYmZIE0dyzoZ39UwXAaLhrfosI04IHHsG9/6pghvK+
	 RWGZ2s4SBLlgMO4w51aJju+zeL0JNN0/kxpXFBn+0/AJzXwThdCJdJzJPJhtQzda5k
	 ev6050f/kGzOvAKp8jBSv0dS3hTfWXXs6V18R4UazX0m52CzzSXKVm8wJ7d7bSgsLM
	 YGOpchI5XyvvlBgaP7Nv5YTJBQ/1F5QlTl3lXT795SuwjvgdI/AYE8KN6/Q0U/1iwc
	 A35efI0ocOY/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1701361004; bh=XsWd4rTIbCMQHDQYVA8owM7sy0ahHOQY3UNXvbjXohY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=YxHTN2R8irSxSBFVUbFq8UR7axywYhvln1PwaMcnsreqG5nuHZpH104nTTUcwtUPF
	 Y0/L63Pb0bk/EsjbF0VTKa/ujCBrVvaB0A9UvKMDXhwwqoVvLi8J4z0Gf4kQy+MJOH
	 sD9/wP6QrpKetzwp5ZiQgSLCErTR5nhzWIUOq2EpoC1FfwyT9YLvqP7YiIlcwfmQlb
	 823uUtjPUzVrkMUuvJqF0AoBcq0sTXDdZ/tVECln79qC5me5/wjoCPhcjLkj8HZp9p
	 4OyXDSxieOWHOs2EzkZQ7yMAOqbFW7T1ONQtc7mNyYGDkynn8OWvklG/wphAx2/IDi
	 lVH7L9WC4LkOg==
From: Andrey Popov <andrey.popov@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrey Popov <andrey.popov@yadro.com>
Subject: [PATCH v3] image-live: Add support for building EFI-bootable ISO images for non-x86-based archs
Date: Thu, 30 Nov 2023 19:16:24 +0300
Message-ID: <20231130161624.1833206-1-andrey.popov@yadro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-06.corp.yadro.com (172.17.10.110) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 16:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191512

Since syslinux is only compatible with platforms that use x86-based
CPUs, this change allows creation of bootable ISO images for other
EFI-compatible platforms by replacing invocation of the isohybrid
tool for those platforms with a python script that creates MBR
partition table with a single entry that points to a bootable
EFI image placed inside the ISO image.

Signed-off-by: Andrey Popov <andrey.popov@yadro.com>
---
 meta/classes-recipe/image-live.bbclass | 124 ++++++++++++++++++-------
 1 file changed, 92 insertions(+), 32 deletions(-)

diff --git a/meta/classes-recipe/image-live.bbclass b/meta/classes-recipe=
/image-live.bbclass
index 95dd44a..c01bc71 100644
--- a/meta/classes-recipe/image-live.bbclass
+++ b/meta/classes-recipe/image-live.bbclass
@@ -2,15 +2,15 @@
 #
 # SPDX-License-Identifier: MIT
=20
-# Creates a bootable image using syslinux, your kernel and an optional
+# Creates a bootable image using syslinux (for x86), your kernel and an =
optional
 # initrd
=20
 #
 # End result is two things:
 #
-# 1. A .hddimg file which is an msdos filesystem containing syslinux, a =
kernel,
-# an initrd and a rootfs image. These can be written to harddisks direct=
ly and
-# also booted on USB flash disks (write them there with dd).
+# 1. A .hddimg file which is an msdos filesystem containing syslinux (fo=
r x86),
+# a kernel, an initrd and a rootfs image. These can be written to harddi=
sks
+# directly and also booted on USB flash disks (write them there with dd)=
.
 #
 # 2. A CD .iso image
=20
@@ -18,6 +18,10 @@
 # in syslinux. Actions based on the label are then performed (e.g. insta=
lling to
 # an hdd)
=20
+# Since some versions of isohybrid are still looking for the isolinux.bi=
n inside
+# the target image, if machine does not have pcbios feature defined we h=
ave to
+# use our own method to create EFI-bootable MBR.
+
 # External variables (also used by syslinux.bbclass)
 # ${INITRD} - indicates a list of filesystem images to concatenate and u=
se as an initrd (optional)
 # ${HDDIMG_ID} - FAT image volume-id
@@ -29,8 +33,12 @@ do_bootimg[depends] +=3D "dosfstools-native:do_populat=
e_sysroot \
                         mtools-native:do_populate_sysroot \
                         cdrtools-native:do_populate_sysroot \
                         virtual/kernel:do_deploy \
-                        ${MLPREFIX}syslinux:do_populate_sysroot \
-                        syslinux-native:do_populate_sysroot \
+                        ${@bb.utils.contains('MACHINE_FEATURES', 'pcbios=
', \
+                                             d.getVar('MLPREFIX') + 'sys=
linux:do_populate_sysroot \
+                                             syslinux-native:do_populate=
_sysroot', '', d)} \
+                        ${@bb.utils.contains('MACHINE_FEATURES', 'efi', =
\
+                                             bb.utils.contains('MACHINE_=
FEATURES', 'pcbios', \
+                                                               '', 'libi=
soburn-native:do_populate_sysroot', d), '', d)} \
                         ${@'%s:do_image_%s' % (d.getVar('PN'), d.getVar(=
'LIVE_ROOTFS_TYPE').replace('-', '_')) if d.getVar('ROOTFS') else ''} \
                         "
=20
@@ -66,19 +74,65 @@ COMPACT_ISODIR =3D "${S}/iso.z"
 ISOLINUXDIR ?=3D "/isolinux"
 ISO_BOOTIMG =3D "isolinux/isolinux.bin"
 ISO_BOOTCAT =3D "isolinux/boot.cat"
-MKISOFS_OPTIONS =3D "-no-emul-boot -boot-load-size 4 -boot-info-table"
+MKISOFS_BOOT_OPTIONS =3D "-no-emul-boot -boot-load-size 4 -boot-info-tab=
le"
=20
 BOOTIMG_VOLUME_ID   ?=3D "boot"
 BOOTIMG_EXTRA_SPACE ?=3D "512"
=20
+def compute_chs(sector_z):
+    C =3D int(sector_z / (63 * 255))
+    H =3D int((sector_z % (63 * 255)) / 63)
+    # convert zero-based sector to CHS format
+    S =3D int(sector_z % 63) + 1
+    # munge accord to partition table format
+    S =3D (S & 0x3f) | (((C >> 8) & 0x3) << 6)
+    C =3D (C & 0xFF)
+    return (C, H, S)
+
+def mk_efi_part_table(iso, start, length):
+    from struct import pack
+
+    # Compute starting and ending CHS addresses for the partition entry.
+    (s_C, s_H, s_S) =3D compute_chs(start)
+    (e_C, e_H, e_S) =3D compute_chs(start + length - 1)
+
+    # Write the 66 byte partition table to bytes 0x1BE through 0x1FF in
+    # sector 0 of the .ISO.
+    #
+    # See the partition table format here:
+    # http://en.wikipedia.org/wiki/Master_boot_record#Sector_layout
+    f =3D open(iso, 'r+b')
+    f.seek(0x1BE)
+    f.write(pack("<8BLL48xH", 0x80, s_H, s_S, s_C,
+                 0xEF, e_H, e_S, e_C, start, length, 0xAA55))
+    f.close()
+
+def install_efi_part_table(iso_img):
+    import subprocess
+
+    find_efi_img_cmd =3D "xorriso -indev %s -find /efi.img \
+                        -name efi.img -exec report_lba --" % iso_img
+    ret =3D subprocess.run(find_efi_img_cmd.split(), capture_output=3DTr=
ue)
+    efi_img_start =3D -1
+    efi_img_length =3D -1
+    for line in ret.stdout.decode(encoding=3D'utf-8').split("\n"):
+        if "File data lba:" in line and "/efi.img" in line:
+            file_stat =3D line[14:].split(',')
+            efi_img_start =3D int(file_stat[1].strip()) * 4
+            efi_img_length =3D int(int(file_stat[3].strip()) / 512)
+            break
+    if (efi_img_start < 0) or (efi_img_length < 0):
+        bb.fatal("Failed to determine /efi.img attributes")
+    mk_efi_part_table(iso_img, efi_img_start, efi_img_length)
+
 populate_live() {
-    populate_kernel $1
+	populate_kernel $1
 	if [ -s "${ROOTFS}" ]; then
 		install -m 0644 ${ROOTFS} $1/rootfs.img
 	fi
 }
=20
-build_iso() {
+build_iso_base() {
 	# Only create an ISO if we have an INITRD and the live or iso image typ=
e was selected
 	if [ -z "${INITRD}" ] || [ "${@bb.utils.contains_any('IMAGE_FSTYPES', '=
live iso', '1', '0', d)}" !=3D "1" ]; then
 		bbnote "ISO image will not be created."
@@ -103,14 +157,6 @@ build_iso() {
 		build_fat_img ${EFIIMGDIR} ${ISODIR}/efi.img
 	fi
=20
-	# EFI only
-	if [ "${PCBIOS}" !=3D "1" ] && [ "${EFI}" =3D "1" ] ; then
-		# Work around bug in isohybrid where it requires isolinux.bin
-		# In the boot catalog, even though it is not used
-		mkdir -p ${ISODIR}/${ISOLINUXDIR}
-		install -m 0644 ${STAGING_DATADIR}/syslinux/isolinux.bin ${ISODIR}${IS=
OLINUXDIR}
-	fi
-
 	# We used to have support for zisofs; this is a relic of that
 	mkisofs_compress_opts=3D"-r"
=20
@@ -128,26 +174,40 @@ build_iso() {
 		fi
 	fi
=20
-	if [ "${PCBIOS}" =3D "1" ] && [ "${EFI}" !=3D "1" ] ; then
-		# PCBIOS only media
-		mkisofs -V ${BOOTIMG_VOLUME_ID} \
-		        -o ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso \
-			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
-			$mkisofs_compress_opts \
-			${MKISOFS_OPTIONS} $mkisofs_iso_level ${ISODIR}
+	if [ "${PCBIOS}" =3D "1" ]; then
+		if [ "${EFI}" =3D "1" ]; then
+			# EFI+PCBIOS
+			mkisofs -A ${BOOTIMG_VOLUME_ID} -V ${BOOTIMG_VOLUME_ID} \
+				-o ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso \
+				-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
+				$mkisofs_compress_opts ${MKISOFS_BOOT_OPTIONS} $mkisofs_iso_level \
+				-eltorito-alt-boot -eltorito-platform efi \
+				-b efi.img -no-emul-boot \
+				${ISODIR}
+			isohybrid_args=3D"-u"
+		else
+			# PCBIOS only
+			mkisofs -V ${BOOTIMG_VOLUME_ID} \
+				-o ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso \
+				-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
+				$mkisofs_compress_opts \
+				${MKISOFS_BOOT_OPTIONS} $mkisofs_iso_level ${ISODIR}
+		fi
+
+		isohybrid $isohybrid_args ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso
 	else
-		# EFI only OR EFI+PCBIOS
 		mkisofs -A ${BOOTIMG_VOLUME_ID} -V ${BOOTIMG_VOLUME_ID} \
-		        -o ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso \
-			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
-			$mkisofs_compress_opts ${MKISOFS_OPTIONS} $mkisofs_iso_level \
-			-eltorito-alt-boot -eltorito-platform efi \
-			-b efi.img -no-emul-boot \
+			-o ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso \
+			$mkisofs_compress_opts $mkisofs_iso_level \
 			${ISODIR}
-		isohybrid_args=3D"-u"
 	fi
+}
=20
-	isohybrid $isohybrid_args ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso
+python build_iso() {
+    bb.build.exec_func("build_iso_base", d)
+    if d.getVar("PCBIOS") !=3D "1" and d.getVar("EFI") =3D=3D "1":
+        install_efi_part_table(d.getVar("IMGDEPLOYDIR") + "/" + \
+                               d.getVar("IMAGE_NAME") + ".iso")
 }
=20
 build_fat_img() {
--=20
2.34.1


