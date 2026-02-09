Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A93E81BB3
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 12:56:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46683.1770641795813922522
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 04:56:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 191BA339
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 04:56:29 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0EC8B3F740
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 04:56:34 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 6/9] qemu: extend PKG_CONFIG_LIBDIR when using the host search path
Date: Mon,  9 Feb 2026 12:56:24 +0000
Message-ID: <20260209125628.640221-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209125628.640221-1-ross.burton@arm.com>
References: <20260209125628.640221-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 12:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230793

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
index 7aa593bc5d..8abe366284 100644
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


