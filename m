Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C1BC4332F
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 18:43:58 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.23089.1670525035992941636
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 10:43:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-68-201-55-29.elp.res.rr.com [68.201.55.29])
	by linux.microsoft.com (Postfix) with ESMTPSA id AA60620B6C40;
	Thu,  8 Dec 2022 10:43:54 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AA60620B6C40
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] baremetal-image: Avoid overriding qemu variables from IMAGE_CLASSES
Date: Thu,  8 Dec 2022 11:43:47 -0700
Message-Id: <20221208184347.1585470-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 18:43:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174408

Since qemuboot is part of IMAGE_CLASSES via qemu.inc it is being
inherited before we set the QB_FOO variables.
Since our variables have conditional definitions and at that point
they've already been defined by qemuboot, we can no longer define
them in our class.

Move the IMAGE_CLASSES inherit to execute it after we set the
QB_FOO variables to fix booting via runqemu.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 meta/classes-recipe/baremetal-image.bbclass | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classes-r=
ecipe/baremetal-image.bbclass
index d3377a92fa..513155e9ae 100644
--- a/meta/classes-recipe/baremetal-image.bbclass
+++ b/meta/classes-recipe/baremetal-image.bbclass
@@ -15,15 +15,6 @@
 #
 # See meta-skeleton for a working example.
=20
-## Emulate image.bbclass
-# Handle inherits of any of the image classes we need
-IMAGE_CLASSES ??=3D ""
-IMGCLASSES =3D " ${IMAGE_CLASSES}"
-inherit ${IMGCLASSES}
-# Set defaults to satisfy IMAGE_FEATURES check
-IMAGE_FEATURES ?=3D ""
-IMAGE_FEATURES[type] =3D "list"
-IMAGE_FEATURES[validitems] +=3D ""
=20
 # Toolchain should be baremetal or newlib based.
 # TCLIBC=3D"baremetal" or TCLIBC=3D"newlib"
@@ -110,6 +101,17 @@ QB_OPT_APPEND:append:qemuriscv32 =3D " -bios none"
 CFLAGS:append:qemuriscv64 =3D " -mcmodel=3Dmedany"
=20
=20
+## Emulate image.bbclass
+# Handle inherits of any of the image classes we need
+IMAGE_CLASSES ??=3D ""
+IMGCLASSES =3D " ${IMAGE_CLASSES}"
+inherit ${IMGCLASSES}
+# Set defaults to satisfy IMAGE_FEATURES check
+IMAGE_FEATURES ?=3D ""
+IMAGE_FEATURES[type] =3D "list"
+IMAGE_FEATURES[validitems] +=3D ""
+
+
 # This next part is necessary to trick the build system into thinking
 # its building an image recipe so it generates the qemuboot.conf
 addtask do_rootfs before do_image after do_install
--=20
2.34.1


