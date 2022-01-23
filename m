Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2244FC433EF
	for <webhook@archiver.kernel.org>; Sun, 23 Jan 2022 07:55:40 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.7108.1642924539204121302
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jan 2022 23:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com
 header.s=default header.b=bUZ+nDIZ;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: alhe@linux.microsoft.com)
Received: from alsamon-xub.lan (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id CBB7720B6C61;
	Sat, 22 Jan 2022 23:55:37 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CBB7720B6C61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1642924538;
	bh=0BKpIox3BWQu/wS2EvcL+UjWKtxF9iL+TaHJehOz3K4=;
	h=From:To:Cc:Subject:Date:From;
	b=bUZ+nDIZjszGCXwtaOo5Od5z3BqOgbGoFavF7zfJMBS2ZVM/FFSluBjVyR27jtOAJ
	 CdPrEQgdJDWQI8HvNTkdU/U3sTE5nh9vrZq8noQsUC7fynJ1wSem7Bd1krYPftZJg/
	 Fjnc7vrYQP6wUoJ9QCh0hswlQHS43aDCXud1hCzk=
From: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
Subject: [PATCH] kernel.bbclass: Allow initramfs to be built from a separate
 multiconfig
Date: Sun, 23 Jan 2022 00:55:25 -0700
Message-Id: <20220123075525.2649373-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jan 2022 07:55:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160862

There may be a case where we want to build an initramfs image
that doesnt inherit the same DISTRO_FEATURES (or others) from
the main image being built.

For example we may want our initramfs not to inherit a certain
conf or feature, say we want to use musl for a smaller footprint,
but if we are using TCLIBC=3Dglibc for our DISTRO (and inherently
our main image), the initramfs image would inherit that conf and
be forced to use glibc, growing in size as a side effect, currently
avoiding this is not supported.

Allow the kernel class to create a multiconfig dependency
(mcdepends) vs depends for do_bundle_initramfs and define
our INITRAMFS_IMAGE from a separate multiconfig via two
new variables:
INITRAMFS_MULTICONFIG and INITRAMFS_DEPLOY_DIR_IMAGE which
define the multiconfig where the initramfs image should be
coming from and its deploy directory respectively, these two
keep a default definition which preserves current behavior
(do_bundle_initramfs uses depends).

Example usage:
- Create and use multiconfig initramfscfg.conf and set
  TCLIBC=3Dmusl there, along with its TMPDIR.
- Add the following to our DISTRO.conf:
  INITRAMFS_MULTICONFIG =3D "initramfscfg"

  and set
  INITRAMFS_DEPLOY_DIR_IMAGE to the DEPLOY_DIR_IMAGE of the
  initramfscfg multiconfig (hence our main kernel will be
  able to grab it from there and bundle it).

This will result in our musl based initramfs bundled in our
main kernel and our main image to be glibc based.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsof=
t.com>
---
 meta/classes/kernel.bbclass | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 473e28be47..880ee61406 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -30,6 +30,8 @@ INITRAMFS_IMAGE ?=3D ""
 INITRAMFS_IMAGE_NAME ?=3D "${@['${INITRAMFS_IMAGE}-${MACHINE}', ''][d.ge=
tVar('INITRAMFS_IMAGE') =3D=3D '']}"
 INITRAMFS_TASK ?=3D ""
 INITRAMFS_IMAGE_BUNDLE ?=3D ""
+INITRAMFS_DEPLOY_DIR_IMAGE ?=3D "${DEPLOY_DIR_IMAGE}"
+INITRAMFS_MULTICONFIG ?=3D ""
=20
 # KERNEL_VERSION is extracted from source code. It is evaluated as
 # None for the first parsing, since the code has not been fetched.
@@ -133,7 +135,10 @@ set -e
     # the do_bundle_initramfs does nothing, but the INITRAMFS_IMAGE is b=
uilt
     # standalone for use by wic and other tools.
     if image:
-        d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_=
IMAGE}:do_image_complete')
+        if d.getVar('INITRAMFS_MULTICONFIG'):
+            d.appendVarFlag('do_bundle_initramfs', 'mcdepends', ' mc::${=
INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
+        else:
+            d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRA=
MFS_IMAGE}:do_image_complete')
     if image and bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE'))=
:
         bb.build.addtask('do_transform_bundled_initramfs', 'do_deploy', =
'do_bundle_initramfs', d)
=20
@@ -240,8 +245,8 @@ copy_initramfs() {
 	# Find and use the first initramfs image archive type we find
 	rm -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
 	for img in cpio cpio.gz cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst; d=
o
-		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img" ]; then
-			cp ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img ${B}/usr/.
+		if [ -e "${INITRAMFS_DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img" ]=
; then
+			cp ${INITRAMFS_DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img ${B}/us=
r/.
 			case $img in
 			*gz)
 				echo "gzip decompressing image"
@@ -278,7 +283,7 @@ copy_initramfs() {
 		fi
 	done
 	# Verify that the above loop found a initramfs, fail otherwise
-	[ -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio ] && echo "Finished copy of =
initramfs into ./usr" || die "Could not find any ${DEPLOY_DIR_IMAGE}/${IN=
ITRAMFS_IMAGE_NAME}.cpio{.gz|.lz4|.lzo|.lzma|.xz|.zst) for bundling; INIT=
RAMFS_IMAGE_NAME might be wrong."
+	[ -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio ] && echo "Finished copy of =
initramfs into ./usr" || die "Could not find any ${INITRAMFS_DEPLOY_DIR_I=
MAGE}/${INITRAMFS_IMAGE_NAME}.cpio{.gz|.lz4|.lzo|.lzma|.xz|.zst) for bund=
ling; INITRAMFS_IMAGE_NAME might be wrong."
 }
=20
 do_bundle_initramfs () {
--=20
2.25.1


