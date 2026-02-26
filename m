Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3221FFCE08C
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 14:31:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71074.1772116275565629883
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 06:31:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDAE0153B
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 06:31:08 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B97273F73B
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 06:31:14 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] qemu: extend PKG_CONFIG_LIBDIR when using the host search path
Date: Thu, 26 Feb 2026 14:31:11 +0000
Message-ID: <20260226143112.702564-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226143112.702564-1-ross.burton@arm.com>
References: <20260226143112.702564-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 14:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232031

The qemu recipe does something horrible when building natively and can
also search the build host's search path.

Now that we've moved from PKG_CONFIG_PATH to PKG_CONFIG_LIBDIR, this
code also needs to do the same as otherwise it will find packages on the
build host before the native sysroot.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 7aa593bc5d9..8abe366284e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -129,7 +129,7 @@ do_configure:prepend:class-native() {
 	# Append build host pkg-config paths for native target since the host m=
ay provide sdl
 	BHOST_PKGCONFIG_PATH=3D$(PATH=3D/usr/bin:/bin pkg-config --variable pc_=
path pkg-config || echo "")
 	if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
-		export PKG_CONFIG_PATH=3D$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
+		export PKG_CONFIG_LIBDIR=3D$PKG_CONFIG_LIBDIR:$BHOST_PKGCONFIG_PATH
 	fi
 }
=20
--=20
2.43.0


