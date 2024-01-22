Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4A7C47DDB
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 14:04:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.74562.1705932250458209378
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 06:04:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F28B1FB
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 06:04:56 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BBA933F73F
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 06:04:09 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] xserver-xorg: disable xvfb by default
Date: Mon, 22 Jan 2024 14:04:06 +0000
Message-Id: <20240122140406.3837333-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122140406.3837333-1-ross.burton@arm.com>
References: <20240122140406.3837333-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 14:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194164

From: Ross Burton <ross.burton@arm.com>

xvfb has limited use, so to mitigate CVE-2023-5574 out of the box we can
disable the xvfb PACKAGECONFIG.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/r=
ecipes-graphics/xorg-xserver/xserver-xorg.inc
index 5a0fceea865..22f7d9a8adc 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -122,7 +122,7 @@ EXTRA_OEMESON +=3D " \
 "
=20
 OPENGL_PKGCONFIGS =3D "dri glx glamor dri3"
-PACKAGECONFIG ??=3D "dga dri2 udev xvfb ${XORG_CRYPTO} \
+PACKAGECONFIG ??=3D "dga dri2 udev ${XORG_CRYPTO} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${=
OPENGL_PKGCONFIGS}', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 's=
ystemd-logind', '', d)} \
 "
--=20
2.34.1


