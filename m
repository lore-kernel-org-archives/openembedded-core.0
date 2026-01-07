Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9F2CF6C1D
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 09:26:23 +0000 (UTC)
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2370.1767777977335363979
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 01:26:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=enozRvsI;
 spf=pass (domain: g0hl1n.net, ip: 91.218.175.179, mailfrom: dev@g0hl1n.net)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1767777975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HO0EwWfw+a1a6EMI74AhoCUT3vVAjWg1M79htuRjWyQ=;
	b=enozRvsIJdR4ZfZHLQbQTs8Y7vNFOc4F0bndaaNTCQkIHxpuLQDX5ee9e9b9dCb2KzrXEF
	+e/v0ho+R+oxUCkejyHdgarj7udNvV0DWGRzeotjkT5ualkRIFobRUEvOYNKaQK3NR/fOX
	b5UkS/JzN1PffgN72X50nM8thwsPXKY=
From: Richard Leitner <dev@g0hl1n.net>
To: openembedded-core@lists.openembedded.org
Cc: Richard Leitner <dev@g0hl1n.net>
Subject: [PATCH] fitimage: introduce FIT_CONF_STRIP_EXT
Date: Wed,  7 Jan 2026 10:26:00 +0100
Message-ID: <20260107092600.73848-1-dev@g0hl1n.net>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 09:26:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228966

Introduce a configuration variable named FIT_CONF_STRIP_EXT which
removes the file-type extension from the configuration node name.

This feature enables us to give configuration nodes arbritary names
(based on the dtb file names). This is in my case needed to ensure
consistent configuration names which where previously (walnascar)
generated using a fitimage_emit_section_config:append() function.

Signed-off-by: Richard Leitner <dev@g0hl1n.net>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 1 +
 meta/conf/image-fitimage.conf                | 3 +++
 meta/lib/oe/fitimage.py                      | 4 ++++
 meta/lib/oeqa/selftest/cases/fitimage.py     | 3 +++
 4 files changed, 11 insertions(+)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-=
recipe/kernel-fit-image.bbclass
index fd0d21ceee..6f78016e14 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -54,6 +54,7 @@ python do_compile() {
     root_node =3D oe.fitimage.ItsNodeRootKernel(
         d.getVar("FIT_DESC"), d.getVar("FIT_ADDRESS_CELLS"),
         d.getVar('HOST_PREFIX'), d.getVar('UBOOT_ARCH'),  d.getVar("FIT_=
CONF_PREFIX"),
+        oe.types.boolean(d.getVar('FIT_CONF_STRIP_EXT')),
         oe.types.boolean(d.getVar('FIT_KERNEL_SIGN_ENABLE')), d.getVar("=
FIT_KERNEL_SIGN_KEYDIR"),
         d.getVar("UBOOT_MKIMAGE"), d.getVar("UBOOT_MKIMAGE_DTCOPTS"),
         d.getVar("UBOOT_MKIMAGE_SIGN"), d.getVar("UBOOT_MKIMAGE_SIGN_ARG=
S"),
diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.con=
f
index 090ee148f4..6bf0dd1299 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -35,6 +35,9 @@ FIT_SIGN_INDIVIDUAL ?=3D "0"
 FIT_CONF_PREFIX ?=3D "conf-"
 FIT_CONF_PREFIX[doc] =3D "Prefix to use for FIT configuration node name"
=20
+FIT_CONF_STRIP_EXT ?=3D "0"
+FIT_CONF_STRIP_EXT[doc] =3D "Set true to strip a possible file-type exte=
nsion from a FIT configuration node name"
+
 FIT_SUPPORTED_INITRAMFS_FSTYPES ?=3D "cpio.lz4 cpio.lzo cpio.lzma cpio.x=
z cpio.zst cpio.gz ext2.gz cpio"
=20
 # Allow user to support special use cases where the kernel binary is
diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index f303799155..bbd5e1843f 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -154,6 +154,7 @@ class ItsNodeRootKernel(ItsNode):
     firt DTB. If there is no dtb present than the default configuation t=
he kernel.
     """
     def __init__(self, description, address_cells, host_prefix, arch, co=
nf_prefix,
+                 conf_strip_ext=3DFalse,
                  sign_enable=3DFalse, sign_keydir=3DNone,
                  mkimage=3DNone, mkimage_dtcopts=3DNone,
                  mkimage_sign=3DNone, mkimage_sign_args=3DNone,
@@ -171,6 +172,7 @@ class ItsNodeRootKernel(ItsNode):
         self._host_prefix =3D host_prefix
         self._arch =3D arch
         self._conf_prefix =3D conf_prefix
+        self._conf_strip_ext =3D conf_strip_ext
=20
         # Signature related properties
         self._sign_enable =3D sign_enable
@@ -468,6 +470,8 @@ class ItsNodeRootKernel(ItsNode):
                 dtb_name =3D dtb.name
                 if dtb.name.startswith("fdt-"):
                     dtb_name =3D dtb.name[len("fdt-"):]
+                if self._conf_strip_ext:
+                    dtb_name =3D dtb_name.rsplit(".", 1)[0]
                 self._fitimage_emit_one_section_config(self._conf_prefix=
 + dtb_name, dtb)
             for dtb in self._dtb_alias:
                 self._fitimage_emit_one_section_config(self._conf_prefix=
 + dtb.alias_name, dtb)
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/sel=
ftest/cases/fitimage.py
index 8df5e92a34..84741f10ae 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -412,6 +412,7 @@ class KernelFitImageBase(FitImageTestCase):
             'DEPLOY_DIR_IMAGE',
             'FIT_CONF_DEFAULT_DTB',
             'FIT_CONF_PREFIX',
+            'FIT_CONF_STRIP_EXT',
             'FIT_DESC',
             'FIT_HASH_ALG',
             'FIT_KERNEL_COMP_ALG',
@@ -1070,6 +1071,7 @@ class FitImagePyTests(KernelFitImageBase):
             'FIT_ADDRESS_CELLS': "1",
             'FIT_CONF_DEFAULT_DTB': "",
             'FIT_CONF_PREFIX': "conf-",
+            'FIT_CONF_STRIP_EXT': "0",
             'FIT_DESC': "Kernel fitImage for a dummy distro",
             'FIT_GENERATE_KEYS': "0",
             'FIT_HASH_ALG': "sha256",
@@ -1115,6 +1117,7 @@ class FitImagePyTests(KernelFitImageBase):
         root_node =3D oe.fitimage.ItsNodeRootKernel(
             bb_vars["FIT_DESC"], bb_vars["FIT_ADDRESS_CELLS"],
             bb_vars['HOST_PREFIX'], bb_vars['UBOOT_ARCH'],  bb_vars["FIT=
_CONF_PREFIX"],
+            oe.types.boolean(bb_vars['FIT_CONF_STRIP_EXT']),
             oe.types.boolean(bb_vars['UBOOT_SIGN_ENABLE']), bb_vars["UBO=
OT_SIGN_KEYDIR"],
             bb_vars["UBOOT_MKIMAGE"], bb_vars["UBOOT_MKIMAGE_DTCOPTS"],
             bb_vars["UBOOT_MKIMAGE_SIGN"], bb_vars["UBOOT_MKIMAGE_SIGN_A=
RGS"],
--=20
2.47.3


