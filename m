Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D69C41513
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 14:49:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.90115.1691592561218228182
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 07:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27A64D75;
	Wed,  9 Aug 2023 07:50:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5247A3F59C;
	Wed,  9 Aug 2023 07:49:20 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/4] systemd-boot: use MESON_TARGET
Date: Wed,  9 Aug 2023 15:49:16 +0100
Message-Id: <20230809144917.3110384-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230809144917.3110384-1-ross.burton@arm.com>
References: <20230809144917.3110384-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 14:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185707

From: Ross Burton <ross.burton@arm.com>

Instead of re-implementing do_compile, use MESON_TARGET.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd-boot_254.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_254.bb b/meta/recipes=
-core/systemd/systemd-boot_254.bb
index e887e636e86..a490c0328e6 100644
--- a/meta/recipes-core/systemd/systemd-boot_254.bb
+++ b/meta/recipes-core/systemd/systemd-boot_254.bb
@@ -22,6 +22,8 @@ c_ld =3D ${@meson_array('EFI_LD', d)}
 EOF
 }
=20
+MESON_TARGET =3D "systemd-boot"
+
 EXTRA_OEMESON +=3D "-Defi=3Dtrue \
                   -Dbootloader=3Dtrue \
                   -Dman=3Dfalse \
@@ -51,10 +53,6 @@ TUNE_CCARGS:remove =3D "-mfpmath=3Dsse"
 COMPATIBLE_HOST =3D "(aarch64.*|arm.*|x86_64.*|i.86.*)-linux"
 COMPATIBLE_HOST:x86-x32 =3D "null"
=20
-do_compile() {
-	ninja systemd-boot
-}
-
 do_install() {
 	install -d ${D}${EFI_FILES_PATH}
 	install ${B}/src/boot/efi/systemd-boot*.efi ${D}${EFI_FILES_PATH}/${SYS=
TEMD_BOOT_IMAGE}
--=20
2.34.1


