Return-Path: <andrey.popov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A48FC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 14:51:14 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web10.12878.1699368668751335692
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 06:51:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=Xyg5e2OG;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=m5WDxhco;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: andrey.popov@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com A1531C000C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1699368663; bh=IP0Nf9dFGBLMhLKwVCfBxZggIJ4OVTlgVDL9GYvWEc8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Xyg5e2OGgTov2UvuLPtRgzsT0aAL7WqvB2w94g0jgCfab1ROqHX5rKZAjfRV//ntL
	 8PUjJdNVUNWNZs2Shtxh4vBCjWv8jRDSmDz/fI68NJdxRPg9hdYANFG3nNJ9/hiju2
	 lPq3x1/RpQOO1WrbIHrjCOqReNlRsj1bCu0w+YDnaOJq2IFXDI3LHPPdYstbZ1As8s
	 Y21XzmyTvVoEwdtPOsCBYux6hPZBlStB0VbTtGOfrG/3v3qkPUI4HXKg2kICby0o77
	 UPHH/avShrTLQlz8B8rD3Pfw3kyYGlD2qZ3cSun2hjuAAQ69o3kpY2tZaufXiHsSz1
	 5ZE+cdA07HjvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1699368663; bh=IP0Nf9dFGBLMhLKwVCfBxZggIJ4OVTlgVDL9GYvWEc8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=m5WDxhcoIWGPbj9EwkM1Aty3QQvhQO9IVKoIxhDT605JAcBasb/MCGo5t/Mq7Uh6+
	 qAGim1e1R2x0/PxhB/LssPdZVsM29f4I7ZYFQXdiI8TYf2G5OBIWE8DG2b1zSdR2Ho
	 M57bJic557sq7h5dZLWkkK1L4e/cC+lYKb2THxzNVkf00mNsK4xaXUBlNtsuHcbmfX
	 JbIZGA1iWG4eBVClmAj1NqMjzwOsSFsd2Hols2CA3GhSHzMwfBbEExsvtVL7FWjfSp
	 VcWSilbBOql0o8GGYi+2GDhEg40AcnOkh2CdbkSm8RIqs+whTWUYwAX3vozYKN4c6J
	 mMUUZs7PcOfHA==
From: Andrey Popov <andrey.popov@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrey Popov <andrey.popov@yadro.com>
Subject: [PATCH] classes/image-live: Add support for building EFI-bootable ISO images for architectures other than x86 and x86_64
Date: Tue, 7 Nov 2023 17:50:48 +0300
Message-ID: <20231107145048.10436-1-andrey.popov@yadro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-06.corp.yadro.com (172.17.10.110) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 14:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190285

Since syslinux is only compatible with platforms that use x86-based
CPUs, this change allows creation of bootable ISO images for other
EFI-compatible platforms by replacing invocation of the isohybrid
tool for those platforms with a python script that creates MBR
partition table with a single entry that points to a bootable
EFI image placed inside the ISO image.

Signed-off-by: Andrey Popov <andrey.popov@yadro.com>
---
 meta/classes-recipe/image-live.bbclass | 129 ++++++++++++++++++++++---
 1 file changed, 115 insertions(+), 14 deletions(-)

diff --git a/meta/classes-recipe/image-live.bbclass b/meta/classes-recipe=
/image-live.bbclass
index 95dd44a..ac7fc1b 100644
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
@@ -29,8 +29,10 @@ do_bootimg[depends] +=3D "dosfstools-native:do_populat=
e_sysroot \
                         mtools-native:do_populate_sysroot \
                         cdrtools-native:do_populate_sysroot \
                         virtual/kernel:do_deploy \
-                        ${MLPREFIX}syslinux:do_populate_sysroot \
-                        syslinux-native:do_populate_sysroot \
+                        ${@d.getVar('MLPREFIX') + 'syslinux:do_populate_=
sysroot \
+                           syslinux-native:do_populate_sysroot' if __imp=
ort__('re').match('i.86', d.getVar('TARGET_ARCH')) or \
+                                                                   __imp=
ort__('re').match('x86_64', d.getVar('TARGET_ARCH')) else \
+                           'xorriso-native:do_populate_sysroot'} \
                         ${@'%s:do_image_%s' % (d.getVar('PN'), d.getVar(=
'LIVE_ROOTFS_TYPE').replace('-', '_')) if d.getVar('ROOTFS') else ''} \
                         "
=20
@@ -71,14 +73,92 @@ MKISOFS_OPTIONS =3D "-no-emul-boot -boot-load-size 4 =
-boot-info-table"
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
+def runtool(cmdln_or_args):
+    import subprocess
+
+    if isinstance(cmdln_or_args, list):
+        cmd =3D cmdln_or_args[0]
+        shell =3D False
+    else:
+        import shlex
+        cmd =3D shlex.split(cmdln_or_args)[0]
+        shell =3D True
+
+    sout =3D subprocess.PIPE
+    serr =3D subprocess.STDOUT
+
+    try:
+        process =3D subprocess.Popen(cmdln_or_args, stdout=3Dsout,
+                                   stderr=3Dserr, shell=3Dshell)
+        sout, serr =3D process.communicate()
+        # combine stdout and stderr, filter None out and decode
+        out =3D ''.join([out.decode('utf-8') for out in [sout, serr] if =
out])
+    except OSError as err:
+        bb.fatal("Cannot run command %s: %s" % (cmd, err))
+
+    return process.returncode, out
+
+def exec_cmd(cmd_and_args):
+    args =3D cmd_and_args.split()
+    ret, out =3D runtool(args)
+    out =3D out.strip()
+    if ret !=3D 0:
+        bb.fatal("exec_cmd: %s returned '%s' instead of 0\noutput: %s" %=
 \
+                 (cmd_and_args, ret, out))
+    return ret, out
+
+def install_efi_part_table(iso_img):
+    find_efi_img_cmd =3D "xorriso -indev %s -find /efi.img \
+                        -name efi.img -exec report_lba --" % iso_img
+    ret, out =3D exec_cmd(find_efi_img_cmd)
+    efi_img_start =3D -1
+    efi_img_length =3D -1
+    for line in out.split("\n"):
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
@@ -104,11 +184,13 @@ build_iso() {
 	fi
=20
 	# EFI only
-	if [ "${PCBIOS}" !=3D "1" ] && [ "${EFI}" =3D "1" ] ; then
-		# Work around bug in isohybrid where it requires isolinux.bin
-		# In the boot catalog, even though it is not used
-		mkdir -p ${ISODIR}/${ISOLINUXDIR}
-		install -m 0644 ${STAGING_DATADIR}/syslinux/isolinux.bin ${ISODIR}${IS=
OLINUXDIR}
+	if [ -n "$(echo ${TARGET_ARCH} | grep -e i.86)" ] || [ "${TARGET_ARCH}"=
 =3D "x86_64" ]; then
+		if [ "${PCBIOS}" !=3D "1" ] && [ "${EFI}" =3D "1" ]; then
+			# Work around bug in isohybrid where it requires isolinux.bin
+			# In the boot catalog, even though it is not used
+			mkdir -p ${ISODIR}/${ISOLINUXDIR}
+			install -m 0644 ${STAGING_DATADIR}/syslinux/isolinux.bin ${ISODIR}${I=
SOLINUXDIR}
+		fi
 	fi
=20
 	# We used to have support for zisofs; this is a relic of that
@@ -128,7 +210,15 @@ build_iso() {
 		fi
 	fi
=20
-	if [ "${PCBIOS}" =3D "1" ] && [ "${EFI}" !=3D "1" ] ; then
+	if [ -z "$(echo ${TARGET_ARCH} | grep -e i.86)" ] && [ "${TARGET_ARCH}"=
 !=3D "x86_64" ]; then
+		mkisofs -A ${BOOTIMG_VOLUME_ID} -V ${BOOTIMG_VOLUME_ID} \
+		        -o ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso \
+			$mkisofs_compress_opts $mkisofs_iso_level \
+			${ISODIR}
+		return
+	fi
+
+	if [ "${PCBIOS}" =3D "1" ] && [ "${EFI}" !=3D "1" ]; then
 		# PCBIOS only media
 		mkisofs -V ${BOOTIMG_VOLUME_ID} \
 		        -o ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso \
@@ -150,6 +240,17 @@ build_iso() {
 	isohybrid $isohybrid_args ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso
 }
=20
+python build_iso() {
+    import re
+
+    bb.build.exec_func("build_iso_base", d)
+    target_arch =3D d.getVar("TARGET_ARCH")
+    if not re.match("i.86", target_arch) and not re.match("x86_64", targ=
et_arch) \
+       and d.getVar("EFI") =3D=3D "1":
+        install_efi_part_table(d.getVar("IMGDEPLOYDIR") + "/" + \
+                               d.getVar("IMAGE_NAME") + ".iso")
+}
+
 build_fat_img() {
 	FATSOURCEDIR=3D$1
 	FATIMG=3D$2
--=20
2.34.1


