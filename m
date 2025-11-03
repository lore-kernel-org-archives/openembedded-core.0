Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1141FCCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 16:27:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1533.1762187237493546361
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 08:27:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=AKQ2fL//;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 296544E414D5;
	Mon,  3 Nov 2025 16:27:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F35DB60628;
	Mon,  3 Nov 2025 16:27:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6D3210B5016D;
	Mon,  3 Nov 2025 17:27:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762187235; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=2jr6t3PcpxQRv6UEPh0mqfnTtQs1jiTYoes/lZn7zmo=;
	b=AKQ2fL//TqCDAyJv3IebiiGDDeAYKePzDg+lxjouaVCR7hFm8iM8qMk+HS7LEeqS1CzksK
	e3Y4VHOO6jhp7iFUjq9+W0umzLo8nQalF9/mzwzOd3/iQ8aQzDLlp6UDIA4lNPIdotAznk
	0O4N25K3zpfqRbL0NjttdteWTMqSQYeTTsKuBCMTumGeM5C8FjNa66/D/3jLivfqeMkixF
	C9VY/GkyBSwziBeoBkcomwX4B5DkdDs8j2A8+HUzeuiB2L9HPExruoWd0opb4ofk7WKMqm
	qL64PXDjXnd7sGZifSd7CR4p8BB9c9+FHWopmGP69OR84ULQDpQlte9Abvx1fQ==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap v3 08/16] classes-recipe/baremetal-image: Add image file manifest
Date: Mon,  3 Nov 2025 17:26:34 +0100
Message-ID: <20251103162654.1714239-9-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103162654.1714239-1-kamel.bouhara@bootlin.com>
References: <20251103162654.1714239-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 16:27:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225675

From: Joshua Watt <JPEWhacker@gmail.com>

Downstream tasks may want to know what image files were written so write
out a manifest in do_image_complete. The format of the manifest is the
same as the one in image.bbclass

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/baremetal-image.bbclass | 32 +++++++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classes-r=
ecipe/baremetal-image.bbclass
index b9a584351a..c29b5c0b43 100644
--- a/meta/classes-recipe/baremetal-image.bbclass
+++ b/meta/classes-recipe/baremetal-image.bbclass
@@ -30,6 +30,9 @@ BAREMETAL_BINNAME ?=3D "hello_baremetal_${MACHINE}"
 IMAGE_LINK_NAME ?=3D "baremetal-helloworld-image-${MACHINE}"
 IMAGE_NAME_SUFFIX ?=3D ""
=20
+IMAGE_OUTPUT_MANIFEST_DIR =3D "${WORKDIR}/deploy-image-output-manifest"
+IMAGE_OUTPUT_MANIFEST =3D "${IMAGE_OUTPUT_MANIFEST_DIR}/manifest.json"
+
 do_rootfs[dirs] =3D "${IMGDEPLOYDIR} ${DEPLOY_DIR_IMAGE}"
=20
 do_image(){
@@ -37,8 +40,28 @@ do_image(){
     install ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf ${IMGD=
EPLOYDIR}/${IMAGE_LINK_NAME}.elf
 }
=20
-do_image_complete(){
-    :
+python do_image_complete(){
+    from pathlib import Path
+    import json
+
+    data =3D {
+        "taskname": "do_image",
+        "imagetype": "baremetal-image",
+        "images": []
+    }
+
+    img_deploy_dir =3D Path(d.getVar("IMGDEPLOYDIR"))
+
+    for child in img_deploy_dir.iterdir():
+        if not child.is_file() or child.is_symlink():
+            continue
+
+        data["images"].append({
+            "filename": child.name,
+        })
+
+    with open(d.getVar("IMAGE_OUTPUT_MANIFEST"), "w") as f:
+        json.dump([data], f)
 }
=20
 python do_rootfs(){
@@ -62,6 +85,7 @@ python do_rootfs(){
     bb.utils.mkdirhier(sysconfdir)
=20
     execute_pre_post_process(d, d.getVar('ROOTFS_POSTPROCESS_COMMAND'))
+    execute_pre_post_process(d, d.getVar("ROOTFS_POSTUNINSTALL_COMMAND")=
)
 }
=20
=20
@@ -72,6 +96,8 @@ SSTATE_SKIP_CREATION:task-image-complete =3D '1'
 do_image_complete[sstate-inputdirs] =3D "${IMGDEPLOYDIR}"
 do_image_complete[sstate-outputdirs] =3D "${DEPLOY_DIR_IMAGE}"
 do_image_complete[stamp-extra-info] =3D "${MACHINE_ARCH}"
+do_image_complete[sstate-plaindirs] +=3D "${IMAGE_OUTPUT_MANIFEST_DIR}"
+do_image_complete[dirs] +=3D "${IMAGE_OUTPUT_MANIFEST_DIR}"
 addtask do_image_complete after do_image before do_build
=20
 python do_image_complete_setscene () {
@@ -140,5 +166,5 @@ python(){
                 else:
                     deps +=3D " %s:%s" % (dep, task)
         return deps
-    d.appendVarFlag('do_image', 'depends', extraimage_getdepends('do_pop=
ulate_sysroot'))=20
+    d.appendVarFlag('do_image', 'depends', extraimage_getdepends('do_pop=
ulate_sysroot'))
 }
--=20
2.43.0


