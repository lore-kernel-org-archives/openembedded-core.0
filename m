Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C63C46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 13:34:38 +0000 (UTC)
Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch [185.125.25.10])
 by mx.groups.io with SMTP id smtpd.web11.22500.1706103267930482578
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 05:34:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.10, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [10.7.10.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4TKlLB0lPjzMrKdZ;
	Wed, 24 Jan 2024 14:34:26 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4TKlL92WPdzTDB;
	Wed, 24 Jan 2024 14:34:25 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
To: openembedded-core@lists.openembedded.org,
	leon.anavi@konsulko.com,
	twoerner@gmail.com
Cc: Quentin Schulz <foss+yocto@0leil.net>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH] u-boot: add missing dependency on pyelftools-native
Date: Wed, 24 Jan 2024 14:34:13 +0100
Message-ID: <20240124-u-boot-elftools-native-v1-1-63b133397a70@theobroma-systems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: quoted-printable
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 13:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194272

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D
=0D
When TF-A is necessary in U-Boot binary, binman requires elftools to be=0D
installed to be able to generate that U-boot ITB image.=0D
=0D
TF-A is necessary for at least all Aarch64 machines, so that is a=0D
non-negligible amount of boards that have this requirement.=0D
=0D
As a side note, Rockchip-based machines didn't need this until commit=0D
12c3e948eeab ("rockchip: Drop the FIT generator script") (v2023.04-rc1).=0D
=0D
This is already in meta-rockchip, c.f.=0D
https://git.yoctoproject.org/meta-rockchip/commit/recipes-bsp/u-boot?id=3D6=
127d169acf239a53df989f34a6b825fa182cc0c=0D
but I feel like this makes more sense to be present in OE-Core.=0D
=0D
Cc: Quentin Schulz <foss+yocto@0leil.net>=0D
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D
---=0D
=0D
I'm also wondering what are the criteria for having the DEPENDS in=0D
u-boot_<vers>.bb instead of u-boot.inc?=0D
=0D
 meta/recipes-bsp/u-boot/u-boot_2024.01.bb | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
diff --git a/meta/recipes-bsp/u-boot/u-boot_2024.01.bb b/meta/recipes-bsp/u=
-boot/u-boot_2024.01.bb=0D
index 4f5b3e5dfd..b15bcaa818 100644=0D
--- a/meta/recipes-bsp/u-boot/u-boot_2024.01.bb=0D
+++ b/meta/recipes-bsp/u-boot/u-boot_2024.01.bb=0D
@@ -1,5 +1,5 @@=0D
 require u-boot-common.inc=0D
 require u-boot.inc=0D
 =0D
-DEPENDS +=3D "bc-native dtc-native"=0D
+DEPENDS +=3D "bc-native dtc-native python3-pyelftools-native"=0D
 =0D
=0D
---=0D
base-commit: 999bcf990b1b1357dda0636090561659336cc0bf=0D
change-id: 20240124-u-boot-elftools-native-baa0d2cabff8=0D
=0D
Best regards,=0D
-- =0D
Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D
=0D

