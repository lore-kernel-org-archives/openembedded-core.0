Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551A1C4167B
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:09:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2446.1702390154409791168
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:09:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DC071474;
	Tue, 12 Dec 2023 06:10:00 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9BE163F738;
	Tue, 12 Dec 2023 06:09:13 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/9] nativesdk: ensure features don't get backfilled
Date: Tue, 12 Dec 2023 14:08:12 +0000
Message-Id: <20231212140820.2900963-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212140820.2900963-1-ross.burton@arm.com>
References: <20231212140820.2900963-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192193

From: Ross Burton <ross.burton@arm.com>

nativesdk aims to run in a slightly different environment than the
target build, so it unsets MACHINE_FEATURES and lets DISTRO_FEATURES be
filtered by DISTRO_FEATURES_NATIVESDK (in bitbake.conf).

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

I don't believe this is intentional or desired as the machine features
are unrelated to the nativesdk environment.  Specifically, this means
that recipes that look for the qemu-usermode machine feature will fail
in nativesdk as there may not actually be qemu-user support for the
nativesdk environment.

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


