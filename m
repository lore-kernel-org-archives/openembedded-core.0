Return-Path: <m.salvini@koansoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3778C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 16:37:12 +0000 (UTC)
Received: from mail.koansoftware.com (mail.koansoftware.com [172.104.12.216])
 by mx.groups.io with SMTP id smtpd.web10.16722.1709743031322636509
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 08:37:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: koansoftware.com, ip: 172.104.12.216, mailfrom: m.salvini@koansoftware.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.koansoftware.com (Postfix) with ESMTP id 9268A3DB13;
	Wed,  6 Mar 2024 17:37:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail
Received: from mail.koansoftware.com ([127.0.0.1])
	by localhost (mail.koansoftware.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CxJuAJ09s8u8; Wed,  6 Mar 2024 17:37:09 +0100 (CET)
From: Mauro Salvini <m.salvini@koansoftware.com>
To: openembedded-core@lists.openembedded.org
Cc: Mauro Salvini <m.salvini@koansoftware.com>
Subject: [PATCH] image_types_wic.bbclass: remove .env file in do_clean
Date: Wed,  6 Mar 2024 17:36:58 +0100
Message-Id: <20240306163658.34188-1-m.salvini@koansoftware.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 16:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196745

Before this commit, the .env file created in
tmp/sysroots/<machine>/imgdata/<image>.env was never cleaned,
but when the do_clean task is invoked on an image, the .env file
contains paths that are not valid anymore.
If another image wants to use the cleaned image fs to build a .wic,
the wic command fails because paths contained in .env are not found.
With this patch, the returned error is more clear:

  "File /.../tmp/sysroots/<machine>/imgdata/<image>.env doesn't exist"

Signed-off-by: Mauro Salvini <m.salvini@koansoftware.com>
---
 meta/classes-recipe/image_types_wic.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-r=
ecipe/image_types_wic.bbclass
index cf3be909b3..b0b5691225 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -205,3 +205,14 @@ addtask do_flush_pseudodb after do_rootfs before do_=
image do_image_qa
 addtask do_rootfs_wicenv after do_image before do_image_wic
 do_rootfs_wicenv[vardeps] +=3D "${WICVARS}"
 do_rootfs_wicenv[prefuncs] =3D 'set_image_size'
+
+#
+# Clean also .env file created in tmp/sysroots/<machine>/imgdata/<image>=
.env
+# when a clean is invoked
+#
+do_clean:append() {
+    stdir =3D d.getVar('STAGING_DIR')
+    outdir =3D os.path.join(stdir, d.getVar('MACHINE'), 'imgdata')
+    basename =3D d.getVar('IMAGE_BASENAME')
+    bb.utils.remove(os.path.join(outdir, basename) + '.env')
+}
--=20
2.34.1


