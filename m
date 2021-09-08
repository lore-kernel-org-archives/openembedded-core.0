Received: from mail.klausen.dk (mail.klausen.dk [157.90.24.29])
 by mx.groups.io with SMTP id smtpd.web09.12382.1631112815390124964
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 07:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@klausen.dk header.s=dkim header.b=3hlhQXTZ;
 spf=pass (domain: klausen.dk, ip: 157.90.24.29, mailfrom: kristian@klausen.dk)
From: "Kristian Klausen" <kristian@klausen.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
	t=1631112812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aToDdaja7BshuXLdpHMPn5XFefCxxXFQIx9D4AtXVP4=;
	b=3hlhQXTZQ4vZxBts++tiHXwSR3clLOfNMReERz9U2CMlSh42whmqtBkUim5zUhp0sijRjg
	y8nDCVzbK5Z+A5UIwgMNpfA3QVb0C40dEOnuCwUIFl8g0KvauJtGrQr2Q/99oeIICLPSpa
	z6PRibRYVnID1rzzcofXIgR908BKE3E=
To: openembedded-core@lists.openembedded.org
Cc: Kristian Klausen <kristian@klausen.dk>
Subject: [RFC][PATCH] kernel: Add Unified Kernel Image image type
Date: Wed,  8 Sep 2021 16:53:16 +0200
Message-Id: <20210908145316.223635-1-kristian@klausen.dk>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"A unified kernel image is a single EFI PE executable combining an EFI
stub loader, a kernel image, an initramfs image, and the kernel command
line.

[...]

Images of this type have the advantage that all metadata and payload
that makes up the boot entry is monopolized in a single PE file that can
be signed cryptographically as one for the purpose of EFI
SecureBoot."[1]

The cmdline can be set with the UNIFIED_KERNEL_IMAGE_CMDLINE variable.

[1] https://systemd.io/BOOT_LOADER_SPECIFICATION/#type-2-efi-unified-kern=
el-images

Signed-off-by: Kristian Klausen <kristian@klausen.dk>
---

This patch is a RFC as I'm unsure if this is the best way to do it.

Ideally creating the UKI would happen in the do_install task, but the
initramfs must be built and adding before
${INITRAMFS_IMAGE}:do_image_complete causes a circular dependency.

Ideally UNIFIED_KERNEL_IMAGE_CMDLINE would also default to ${APPEND} but
I couldn't get it to work.

As hinted in the commit message we need this for Secure Boot.

 meta/classes/kernel.bbclass | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index d13c38fb02..6126528a35 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,4 +1,5 @@
 inherit linux-kernel-base kernel-module-split
+require conf/image-uefi.conf
=20
 COMPATIBLE_HOST =3D ".*-linux"
=20
@@ -10,6 +11,7 @@ DEPENDS +=3D "virtual/${TARGET_PREFIX}binutils virtual/=
${TARGET_PREFIX}gcc kmod-na
 DEPENDS +=3D "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lzo=
p-native", "", d)}"
 DEPENDS +=3D "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4=
-native", "", d)}"
 DEPENDS +=3D "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.zst", "zst=
d-native", "", d)}"
+DEPENDS +=3D "${@bb.utils.contains("KERNEL_IMAGETYPE", "bzImage.efi", "s=
ystemd-boot binutils os-release", "", d)}"
 PACKAGE_WRITE_DEPS +=3D "depmodwrapper-cross"
=20
 do_deploy[depends] +=3D "depmodwrapper-cross:do_populate_sysroot gzip-na=
tive:do_populate_sysroot"
@@ -30,6 +32,7 @@ INITRAMFS_IMAGE ?=3D ""
 INITRAMFS_IMAGE_NAME ?=3D "${@['${INITRAMFS_IMAGE}-${MACHINE}', ''][d.ge=
tVar('INITRAMFS_IMAGE') =3D=3D '']}"
 INITRAMFS_TASK ?=3D ""
 INITRAMFS_IMAGE_BUNDLE ?=3D ""
+UNIFIED_KERNEL_IMAGE_CMDLINE ?=3D ""
=20
 # KERNEL_VERSION is extracted from source code. It is evaluated as
 # None for the first parsing, since the code has not been fetched.
@@ -85,6 +88,8 @@ python __anonymous () {
         for type in types.split():
             if type =3D=3D 'vmlinux.gz':
                 type =3D 'vmlinux'
+            if type =3D=3D 'bzImage.efi':
+                type =3D 'bzImage'
             typeformake.add(type)
=20
         d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', ' '.join(sorted(typeformak=
e)))
@@ -442,7 +447,7 @@ kernel_do_install() {
 	#
=20
 	for imageType in ${KERNEL_IMAGETYPES} ; do
-		if [ $imageType !=3D "fitImage" ] || [ "${INITRAMFS_IMAGE_BUNDLE}" !=3D=
 "1" ] ; then
+		if [ $imageType !=3D "bzImage.efi" ] && ([ $imageType !=3D "fitImage" =
] || [ "${INITRAMFS_IMAGE_BUNDLE}" !=3D "1" ]); then
 			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType ${D}/${KERNEL_IMAGEDE=
ST}/$imageType-${KERNEL_VERSION}
 		fi
 	done
@@ -755,7 +760,18 @@ kernel_do_deploy() {
=20
 	for imageType in ${KERNEL_IMAGETYPES} ; do
 		baseName=3D$imageType-${KERNEL_IMAGE_NAME}
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$baseName.b=
in
+		if [ "${imageType}" =3D "bzImage.efi" ]; then
+			echo "${UNIFIED_KERNEL_IMAGE_CMDLINE}" > cmdline
+			# https://github.com/systemd/systemd/blob/7728f6aa812f1af563821505d9f=
377a7f4f727d9/test/test-efi-create-disk.sh#L32-L38
+			objcopy \
+				--add-section .osrel=3D"${RECIPE_SYSROOT}${nonarch_libdir}/os-releas=
e" --change-section-vma .osrel=3D0x20000 \
+				--add-section .cmdline=3D"cmdline" --change-section-vma .cmdline=3D0=
x30000 \
+				--add-section .linux=3D"${KERNEL_OUTPUT_DIR}/bzImage" --change-secti=
on-vma .linux=3D0x2000000 \
+				--add-section .initrd=3D"${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MA=
CHINE}.${INITRAMFS_FSTYPES}" --change-section-vma .initrd=3D0x3000000 \
+				"${DEPLOY_DIR_IMAGE}/linux${EFI_ARCH}.efi.stub" "$deployDir/$baseNam=
e.bin"
+		else
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$baseName.=
bin
+		fi
 		ln -sf $baseName.bin $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}.b=
in
 		ln -sf $baseName.bin $deployDir/$imageType
 	done
--=20
2.25.1

