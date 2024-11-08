Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87FE6D6406B
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 17:02:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17736.1731085329047734276
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 09:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95553497
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Nov 2024 09:02:38 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 60CA43F6A8
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Nov 2024 09:02:08 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] xinit: use x-terminal-emulator as the fallback terminal
Date: Fri,  8 Nov 2024 17:01:53 +0000
Message-Id: <20241108170156.2057761-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108170156.2057761-1-ross.burton@arm.com>
References: <20241108170156.2057761-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 17:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206895

Instead of using rxvt as the fallback terminal use x-terminal-emulator.

Also add a recommends on something providing that name, as previously
it tried to use rxvt but that wasn't necessarily present.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-app/xinit_1.4.2.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-app/xinit_1.4.2.bb b/meta/recipes=
-graphics/xorg-app/xinit_1.4.2.bb
index 82c0b0d8335..8a8367c6888 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.4.2.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.4.2.bb
@@ -18,9 +18,8 @@ SRC_URI_EXT =3D "xz"
=20
 SRC_URI[sha256sum] =3D "b7d8dc8d22ef9f15985a10b606ee4f2aad6828befa437359=
934647e88d331f23"
=20
-EXTRA_OECONF =3D "ac_cv_path_MCOOKIE=3D${bindir}/mcookie"
-
-PACKAGECONFIG ??=3D "rxvt"
-PACKAGECONFIG[rxvt] =3D "--with-xterm=3Drxvt,,,rxvt-unicode"
+EXTRA_OECONF =3D "ac_cv_path_MCOOKIE=3D${bindir}/mcookie \
+                --with-xterm=3Dx-terminal-emulator"
=20
 RDEPENDS:${PN} +=3D "util-linux-mcookie"
+RRECOMMENDS:${PN} +=3D "virtual-x-terminal-emulator"
--=20
2.34.1


