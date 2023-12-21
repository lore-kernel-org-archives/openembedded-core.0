Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E2EDC35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 17:02:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.56202.1703178122038057753
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 09:02:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E9502F4
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 09:02:46 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C445E3F5A1
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 09:02:00 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] nativesdk: ensure features don't get backfilled
Date: Thu, 21 Dec 2023 17:01:57 +0000
Message-Id: <20231221170159.1995650-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 17:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192840

From: Ross Burton <ross.burton@arm.com>

nativesdk aims to run in a slightly different environment than the
target build, so it resets MACHINE_FEATURES and filters DISTRO_FEATURES
with DISTRO_FEATURES_NATIVESDK.

However, feature backfill happens _after_ these operations:

 $ bitbake-getvar -r nativesdk-glib-2.0 MACHINE_FEATURES
 #
 # $MACHINE_FEATURES [5 operations]
 #   set /home/ross/Yocto/poky/meta/conf/machine/include/qemu.inc:14
 #     "alsa bluetooth usbgadget screen vfat"
 #   set /home/ross/Yocto/poky/meta/conf/documentation.conf:284
 #     [doc] "Specifies the list of hardware features the MACHINE support=
s."
 #   set? /home/ross/Yocto/poky/meta/conf/bitbake.conf:893
 #     ""
 #   set /home/ross/Yocto/poky/meta/classes-recipe/nativesdk.bbclass:18
 #     ""
 #   append utils.py:132 [features_backfill]
 #     " rtc qemu-usermode"
 # pre-expansion value:
 #   " rtc qemu-usermode"
 MACHINE_FEATURES=3D" rtc qemu-usermode"

This is not intentional nor desired as the target machine features are
unrelated to the nativesdk environment.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/nativesdk.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/=
nativesdk.bbclass
index 08288fdb733..ccaf411f0d7 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -15,7 +15,10 @@ NATIVESDKLIBC ?=3D "libc-glibc"
 LIBCOVERRIDE =3D ":${NATIVESDKLIBC}"
 CLASSOVERRIDE =3D "class-nativesdk"
 MACHINEOVERRIDES =3D ""
+
 MACHINE_FEATURES =3D ""
+DISTRO_FEATURES_BACKFILL =3D ""
+MACHINE_FEATURES_BACKFILL =3D ""
=20
 MULTILIBS =3D ""
=20
--=20
2.34.1


