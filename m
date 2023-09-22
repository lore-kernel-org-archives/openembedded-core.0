Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F7F7CE7A86
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 22:20:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.10078.1695421253662824389
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 15:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B6F8D40CB2;
	Fri, 22 Sep 2023 22:20:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y8Y7mBm-bEOh; Fri, 22 Sep 2023 22:20:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9BF3140CB0;
	Fri, 22 Sep 2023 22:20:51 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 2F597163CAA;
	Fri, 22 Sep 2023 18:20:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH 1/2] bitbake.conf: add MACHINE to SDK_NAME
Date: Fri, 22 Sep 2023 22:20:42 +0000
Message-Id: <20230922222043.36032-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 22:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188138

Do the same here as Poky has done 5 years ago, adding MACHINE to
SDK_NAME:

https://git.yoctoproject.org/meta-yocto/commit/?id=3D3614dd4aee9d19f1024e=
db6a36b2862c2d726c04

This avoids file conflicts in deploy/sdk/ when building multiple
machines (either manually or via multiconfig), where sdk/toolchain
installers, manifests and now SPDX archives will overlap otherwise.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 67577c8fe7..3fd089cebb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -459,7 +459,7 @@ PKGDATA_DIR_SDK =3D "${TMPDIR}/pkgdata/${SDK_SYS}"
 ##################################################################
=20
 SDK_NAME_PREFIX ?=3D "oecore"
-SDK_NAME =3D "${SDK_NAME_PREFIX}-${IMAGE_BASENAME}-${SDK_ARCH}-${TUNE_PK=
GARCH}"
+SDK_NAME =3D "${SDK_NAME_PREFIX}-${IMAGE_BASENAME}-${SDK_ARCH}-${TUNE_PK=
GARCH}-${MACHINE}"
 SDKPATH =3D "/usr/local/oe-sdk-hardcoded-buildpath"
 SDKPATHNATIVE =3D "${SDKPATH}/sysroots/${SDK_SYS}"
 # The path to default to installing the SDK to
--=20
2.25.1


