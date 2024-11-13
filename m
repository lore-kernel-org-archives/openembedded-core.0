Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B92D462D7
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 15:55:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14820.1731513320323157400
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 07:55:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D93631474
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 07:55:49 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 53C8E3F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 07:55:19 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 5/8] packagegroup-core-x11-base: use virtual-x-terminal-emulator
Date: Wed, 13 Nov 2024 15:55:08 +0000
Message-Id: <20241113155511.1948551-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113155511.1948551-1-ross.burton@arm.com>
References: <20241113155511.1948551-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 15:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207117

Instead of depending on matchbox-terminal explicitly, just depend on
the virtual name.

core-image-x11 then uses rxvt instead of matchbox-terminal, as that is
the default, removing the entire GTK+ stack from the image.

core-image-sato and friends are unchanged as the sato packagegroup pulls
in matchbox-terminal explicitly, so rxvt isn't needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../packagegroups/packagegroup-core-x11-base.bb                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-ba=
se.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
index db6242af335..d82d318368e 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
@@ -8,8 +8,8 @@ REQUIRED_DISTRO_FEATURES =3D "x11"
 RDEPENDS:${PN} =3D "\
     packagegroup-core-x11-xserver \
     packagegroup-core-x11-utils \
-    matchbox-terminal \
     matchbox-wm \
     mini-x-session \
+    virtual-x-terminal-emulator \
     liberation-fonts \
     "
--=20
2.34.1


