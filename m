Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34FF1C61DB3
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 15:53:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.75908.1673279634137605853
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 07:53:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.199, mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 69B13FF80A;
	Mon,  9 Jan 2023 15:53:50 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] packagegroup-core-boot: make init-ifupdown package a recommendation
Date: Mon,  9 Jan 2023 16:53:40 +0100
Message-Id: <20230109-optional-ifupdown-v1-1-18a8f3aee85b@theobroma-systems.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 15:53:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175692

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D
=0D
init-ifupdown provides an /etc/network/interfaces, which disables=0D
interface management with networkmanager for example. If a network=0D
manager (such as networkmanager) is provided, there may not be a need=0D
for network related init scripts provided by init-ifupdown, so let's=0D
make it a recommendation so it can be easily removed in image recipes=0D
via the NO_RECOMMENDATIONS/BAD_RECOMMENDATIONS mechanism.=0D
=0D
Cc: Quentin Schulz <foss+yocto@0leil.net>=0D
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D
---=0D
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D
---=0D
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 4 ++--=0D
 1 file changed, 2 insertions(+), 2 deletions(-)=0D
=0D
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/me=
ta/recipes-core/packagegroups/packagegroup-core-boot.bb=0D
index faf7bc0026..a7bad81023 100644=0D
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb=0D
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb=0D
@@ -18,7 +18,6 @@ EFI_PROVIDER ??=3D "grub-efi"=0D
 =0D
 SYSVINIT_SCRIPTS =3D "${@bb.utils.contains('MACHINE_FEATURES', 'rtc', '${V=
IRTUAL-RUNTIME_base-utils-hwclock}', '', d)} \=0D
                     modutils-initscripts \=0D
-                    init-ifupdown \=0D
                     ${VIRTUAL-RUNTIME_initscripts} \=0D
                    "=0D
 =0D
@@ -38,4 +37,5 @@ RDEPENDS:${PN} =3D "\=0D
 =0D
 RRECOMMENDS:${PN} =3D "\=0D
     ${VIRTUAL-RUNTIME_base-utils-syslog} \=0D
-    ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS}"=0D
+    ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS} \=0D
+    ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "init-ifupdown", "=
", d)}"=0D
=0D
---=0D
base-commit: a134a7186b2266378bc0b08c134e169a943eedde=0D
change-id: 20230109-optional-ifupdown-f25f75924f58=0D
=0D
Best regards,=0D
-- =0D
Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D

