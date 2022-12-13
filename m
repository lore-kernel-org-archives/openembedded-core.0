Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBD0C4167B
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 16:17:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.77805.1670948260412202102
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 08:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CE251682;
	Tue, 13 Dec 2022 08:18:20 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98D5C3F71E;
	Tue, 13 Dec 2022 08:17:39 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/4] at-spi2-core: disable API docs if x11 is disabled
Date: Tue, 13 Dec 2022 16:17:31 +0000
Message-Id: <20221213161732.865885-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213161732.865885-1-ross.burton@arm.com>
References: <20221213161732.865885-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 16:17:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174542

The gtk-doc documentation doesn't build if X11 is disabled.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/atk/at-spi2-core_2.46.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.46.0.bb b/meta/recip=
es-support/atk/at-spi2-core_2.46.0.bb
index f815a5eeb21..d9161e1acb3 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.46.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.46.0.bb
@@ -28,6 +28,8 @@ PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURE=
S', 'x11', d)}"
 PACKAGECONFIG[x11] =3D "-Dx11=3Dyes,-Dx11=3Dno,virtual/libx11 libxi libx=
tst"
=20
 GTKDOC_MESON_OPTION =3D "docs"
+# The documentation doesn't build if X11 is disabled. Appears to be fixe=
d post 2.46.0.
+EXTRA_OEMESON +=3D "${@bb.utils.contains("DISTRO_FEATURES", "x11", "", "=
-Ddocs=3Dfalse", d)}"
=20
 GIR_MESON_OPTION =3D 'introspection'
 GIR_MESON_ENABLE_FLAG =3D 'yes'
--=20
2.34.1


