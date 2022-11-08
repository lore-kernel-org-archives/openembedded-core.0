Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECF2C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 00:09:26 +0000 (UTC)
Received: from sirokuusama2.dnainternet.net (sirokuusama2.dnainternet.net [83.102.40.153])
 by mx.groups.io with SMTP id smtpd.web08.2291.1667866164510688509
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 16:09:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: parse error for token &{10 18 spfd.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 83.102.40.153, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by sirokuusama2.dnainternet.net (Postfix) with ESMTP id 3B06C139B5;
	Tue,  8 Nov 2022 02:09:22 +0200 (EET)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sirokuusama2.dnainternet.net ([83.102.40.153])
	by localhost (sirokuusama2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id 0zUuw3JugLe2; Tue,  8 Nov 2022 02:09:22 +0200 (EET)
Received: from kirsikkapuu2.dnainternet.net (kirsikkapuu2.dnainternet.net [83.102.40.52])
	by sirokuusama2.dnainternet.net (Postfix) with ESMTP id 10B62139B2;
	Tue,  8 Nov 2022 02:09:22 +0200 (EET)
Received: from localhost.localdomain (82-181-238-66.bb.dnainternet.fi [82.181.238.66])
	by kirsikkapuu2.dnainternet.net (Postfix) with ESMTP id DE0783FE0;
	Tue,  8 Nov 2022 02:09:18 +0200 (EET)
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
Cc: Niko Mauno <niko.mauno@vaisala.com>
Subject: [RFC PATCH 2/3] kbd: Disable 64 bit time with 32 bit glibc
Date: Tue,  8 Nov 2022 02:08:27 +0200
Message-Id: <20221108000828.42824-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221108000828.42824-1-niko.mauno@vaisala.com>
References: <20221108000828.42824-1-niko.mauno@vaisala.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 00:09:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172940

For now add exemption in order to avoid following failure during
do_compile()

  | .../build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0=
/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-p=
oky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/12.2.0/ld:.libs/libtswrap.ve=
r:2: syntax error in VERSION script
  | collect2: error: ld returned 1 exit status

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/kbd/kbd_2.5.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb b/meta/recipes-core/kbd/k=
bd_2.5.1.bb
index aa3ab6e121..b623aecd36 100644
--- a/meta/recipes-core/kbd/kbd_2.5.1.bb
+++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
@@ -18,6 +18,9 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/${BPN}/${B=
P}.tar.xz \
=20
 SRC_URI[sha256sum] =3D "ccdf452387a6380973d2927363e9cbb939fa2068915a6f93=
7ff9d24522024683"
=20
+# Compiling 64 bit time for 32 bit host is broken
+GLIBC_64BIT_TIME_CPPFLAGS =3D ""
+
 PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
                   "
=20
--=20
2.36.1


