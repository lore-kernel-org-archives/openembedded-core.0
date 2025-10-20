Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42534CCD1A4
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 07:10:44 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.12247.1760944242208048860
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 00:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=1DOXr4Br;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 400FAC0AFCE;
	Mon, 20 Oct 2025 07:10:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C473F606D5;
	Mon, 20 Oct 2025 07:10:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35DB6102F238E;
	Mon, 20 Oct 2025 09:10:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760944235; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=cDcLsWdl2ctlBwyENQRFJEmbGbYDkmsxCk7c3zhXFPc=;
	b=1DOXr4BrLMKVcqSdsu2ydp2Drhqffm80iCFCgs0LIyz8Gmt0x0jypMYTvLBF76IMbSNBjs
	L5fvsOd2Xznrjj4tPskCMq5fwTPo/sQvWzWZ9NkBKCo5v14JECvuyqS3gS9lr/blhY77rG
	gZVnaPHxhap5dsB/z24mCgrh6/NAd9nrelQfPtet2jW5VInUAHWxyYnGvacGffOF3WwVv9
	AaIzoCQSj4hsdfOErcSpGtuTKgEFT13gynQ+y4Z+2dhPTegXsvaYsP/y7jEEwwHdeqRPip
	RX9DqE4eWwj73jgd0PJZUtT9nShALg+XvSc3ETZKFLLwvepuMa8F8QZcO93Lew==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap v2 06/11] classes-recipe/image: Add image file manifest
Date: Mon, 20 Oct 2025 09:09:46 +0200
Message-ID: <20251020070952.942165-7-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
References: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 07:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225104

From: Joshua Watt <JPEWhacker@gmail.com>

Downstream tasks may want to know what image files were written by the
do_image family of tasks (e.g. SPDX) so have each task write out a
manifest file that describes the files it produced, then aggregate them
in do_image_complete

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5e55ed4c5b9d5af3c96b82805af34af1512fc3d1)
---
 meta/classes-recipe/image.bbclass | 58 +++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/imag=
e.bbclass
index 1f0ee1861e..00f1d58f23 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -88,6 +88,11 @@ PACKAGE_INSTALL_ATTEMPTONLY ?=3D "${FEATURE_INSTALL_OP=
TIONAL}"
=20
 IMGDEPLOYDIR =3D "${WORKDIR}/deploy-${PN}-image-complete"
=20
+IMGMANIFESTDIR =3D "${WORKDIR}/image-task-manifest"
+
+IMAGE_OUTPUT_MANIFEST_DIR =3D "${WORKDIR}/deploy-image-output-manifest"
+IMAGE_OUTPUT_MANIFEST =3D "${IMAGE_OUTPUT_MANIFEST_DIR}/manifest.json"
+
 # Images are generally built explicitly, do not need to be part of world=
.
 EXCLUDE_FROM_WORLD =3D "1"
=20
@@ -277,14 +282,28 @@ fakeroot python do_image () {
     execute_pre_post_process(d, pre_process_cmds)
 }
 do_image[dirs] =3D "${TOPDIR}"
+do_image[cleandirs] +=3D "${IMGMANIFESTDIR}"
 addtask do_image after do_rootfs
=20
 fakeroot python do_image_complete () {
     from oe.utils import execute_pre_post_process
+    from pathlib import Path
+    import json
=20
     post_process_cmds =3D d.getVar("IMAGE_POSTPROCESS_COMMAND")
=20
     execute_pre_post_process(d, post_process_cmds)
+
+    image_manifest_dir =3D Path(d.getVar('IMGMANIFESTDIR'))
+
+    data =3D []
+
+    for manifest_path in image_manifest_dir.glob("*.json"):
+        with manifest_path.open("r") as f:
+            data.extend(json.load(f))
+
+    with open(d.getVar("IMAGE_OUTPUT_MANIFEST"), "w") as f:
+        json.dump(data, f)
 }
 do_image_complete[dirs] =3D "${TOPDIR}"
 SSTATETASKS +=3D "do_image_complete"
@@ -292,6 +311,8 @@ SSTATE_SKIP_CREATION:task-image-complete =3D '1'
 do_image_complete[sstate-inputdirs] =3D "${IMGDEPLOYDIR}"
 do_image_complete[sstate-outputdirs] =3D "${DEPLOY_DIR_IMAGE}"
 do_image_complete[stamp-extra-info] =3D "${MACHINE_ARCH}"
+do_image_complete[sstate-plaindirs] +=3D "${IMAGE_OUTPUT_MANIFEST_DIR}"
+do_image_complete[dirs] +=3D "${IMAGE_OUTPUT_MANIFEST_DIR}"
 addtask do_image_complete after do_image before do_build
 python do_image_complete_setscene () {
     sstate_setscene(d)
@@ -501,12 +522,14 @@ python () {
         d.setVar(task, '\n'.join(cmds))
         d.setVarFlag(task, 'func', '1')
         d.setVarFlag(task, 'fakeroot', '1')
+        d.setVarFlag(task, 'imagetype', t)
=20
         d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size=
')
         d.prependVarFlag(task, 'postfuncs', 'create_symlinks ')
         d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
         d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
         d.appendVarFlag(task, 'vardepsexclude', ' DATETIME DATE ' + ' '.=
join(vardepsexclude))
+        d.appendVarFlag(task, 'postfuncs', ' write_image_output_manifest=
')
=20
         bb.debug(2, "Adding task %s before %s, after %s" % (task, 'do_im=
age_complete', after))
         bb.build.addtask(task, 'do_image_complete', after, d)
@@ -604,6 +627,41 @@ python create_symlinks() {
             bb.note("Skipping symlink, source does not exist: %s -> %s" =
% (dst, src))
 }
=20
+python write_image_output_manifest() {
+    import json
+    from pathlib import Path
+
+    taskname =3D d.getVar("BB_CURRENTTASK")
+    image_deploy_dir =3D Path(d.getVar('IMGDEPLOYDIR'))
+    image_manifest_dir =3D Path(d.getVar('IMGMANIFESTDIR'))
+    manifest_path =3D image_manifest_dir / ("do_" + d.getVar("BB_CURRENT=
TASK") + ".json")
+
+    image_name =3D d.getVar("IMAGE_NAME")
+    image_basename =3D d.getVar("IMAGE_BASENAME")
+    machine =3D d.getVar("MACHINE")
+
+    subimages =3D (d.getVarFlag("do_" + taskname, 'subimages', False) or=
 "").split()
+    imagetype =3D d.getVarFlag("do_" + taskname, 'imagetype', False)
+
+    data =3D {
+        "taskname": taskname,
+        "imagetype": imagetype,
+        "images": []
+    }
+
+    for type in subimages:
+        image_filename =3D image_name + "." + type
+        image_path =3D image_deploy_dir / image_filename
+        if not image_path.exists():
+            continue
+        data["images"].append({
+            "filename": image_filename,
+        })
+
+    with manifest_path.open("w") as f:
+        json.dump([data], f)
+}
+
 MULTILIBRE_ALLOW_REP +=3D "${base_bindir} ${base_sbindir} ${bindir} ${sb=
indir} ${libexecdir} ${sysconfdir} ${nonarch_base_libdir}/udev /lib/modul=
es/[^/]*/modules.*"
 MULTILIB_CHECK_FILE =3D "${WORKDIR}/multilib_check.py"
 MULTILIB_TEMP_ROOTFS =3D "${WORKDIR}/multilib"
--=20
2.43.0


