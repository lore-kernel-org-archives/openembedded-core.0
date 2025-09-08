Return-Path: <dwagenknecht@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D9BCAC581
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 13:59:54 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.web10.14447.1757339990033049676
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 06:59:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 12FB25F870
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Sep 2025 15:59:47 +0200 (CEST)
From: Daniel Wagenknecht <dwagenknecht@emlix.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Wagenknecht <dwagenknecht@emlix.com>
Subject: [PATCH] buildtools-tarball: handle missing host pkg-config gracefully
Date: Mon,  8 Sep 2025 15:59:31 +0200
Message-ID: <20250908135933.889249-2-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 13:59:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223067

The host might not have pkg-config installed, which is OK when using
the buildtools-extended-tarball, since that contains pkg-config. So the
command for setting HOST_PKG_PATH is expected to fail in some cases
without this being an error.

The generated environment-setup-* script might be sourced in a shell
with activated `errexit` option. Prevent the expected failure of this
command from being treated as an error.

Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-=
core/meta/buildtools-tarball.bb
index 02117ab84..61b98c738 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -73,7 +73,7 @@ create_sdk_files:append () {
 	touch $script
 	echo 'export PATH=3D"${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIV=
E}${sbindir_nativesdk}:${SDKPATHNATIVE}${base_bindir_nativesdk}:${SDKPATH=
NATIVE}${base_sbindir_nativesdk}:$PATH"' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT=3D"${SDKPATHNATIVE}"' >> $script
-	echo 'HOST_PKG_PATH=3D$(command -p pkg-config --variable=3Dpc_path pkg-=
config 2>/dev/null)' >>$script
+	echo 'HOST_PKG_PATH=3D$(command -p pkg-config --variable=3Dpc_path pkg-=
config 2>/dev/null || true)' >>$script
 	echo 'export PKG_CONFIG_LIBDIR=3D${SDKPATHNATIVE}/${libdir}/pkgconfig:$=
{SDKPATHNATIVE}/${datadir}/pkgconfig:${HOST_PKG_PATH:-/usr/lib/pkgconfig:=
/usr/share/pkgconfig}' >>$script
 	echo 'unset HOST_PKG_PATH'
=20
--=20
2.49.0


