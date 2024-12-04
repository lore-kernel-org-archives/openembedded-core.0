Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F2DE7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 23:09:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.29060.1733353751960178452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 15:09:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 10B1640C6B;
	Wed,  4 Dec 2024 23:09:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C9QQXb7hgw8F; Wed,  4 Dec 2024 23:09:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E47A740C56;
	Wed,  4 Dec 2024 23:09:09 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id 36C2D1640F6;
	Wed,  4 Dec 2024 18:09:09 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH] vim: fix xxd-native RPROVIDES
Date: Wed,  4 Dec 2024 18:09:07 -0500
Message-Id: <20241204230907.43936-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 23:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208362

From: Denys Dmytriyenko <denys@konsulko.com>

BBCLASSEXTEND doesn't handle overrides with suffixed ${PN} for
native class, e.g.:

RPROVIDES:${PN}-xxd =3D "xxd"

becomes:

RPROVIDES:vim-native-xxd =3D "xxd-native"

instead of:

RPROVIDES:vim-xxd-native =3D "xxd-native"

This results in "Nothing RPROVIDES xxd-native" error when
something RDEPENDS on xxd-native because there's no such
package as vim-native-xxd.

Use ${BPN} and explicitly handle RPROVIDES.

Since native class does not produce packages, other variables
using :${PN}-xxd override don't matter. And nativesdk class
is not affected, as it uses a prefix, not suffix.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta/recipes-support/vim/vim_9.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/v=
im/vim_9.1.bb
index fee9f055e9..8968b8cb07 100644
--- a/meta/recipes-support/vim/vim_9.1.bb
+++ b/meta/recipes-support/vim/vim_9.1.bb
@@ -11,7 +11,9 @@ BBCLASSEXTEND =3D "native nativesdk"
=20
 PACKAGES =3D+ "${PN}-xxd"
 FILES:${PN}-xxd =3D "${bindir}/xxd"
-RPROVIDES:${PN}-xxd =3D "xxd"
+RPROVIDES:${BPN}-xxd =3D "xxd"
+RPROVIDES:${BPN}-xxd-native =3D "xxd-native"
+RPROVIDES:nativesdk-${BPN}-xxd =3D "nativesdk-xxd"
=20
 ALTERNATIVE:${PN}-xxd =3D "xxd"
 ALTERNATIVE_TARGET[xxd] =3D "${bindir}/xxd"
--=20
2.35.3


