Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 270E1D3E76E
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 18:33:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3242.1765391594669258235
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 10:33:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE214153B
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:33:06 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 978153F762
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:33:13 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] iputils: just set bindir, not prefix
Date: Wed, 10 Dec 2025 18:33:00 +0000
Message-ID: <20251210183308.4022909-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 18:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227497

We just want to put the binaries into base_bindir and nothing else, so
set bindir instead of prefix.

This is currently moot as iputils only installs binaries, but this is
the right thing to do and allows further cleanups.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/iputils/iputils_20250605.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/iputils/iputils_20250605.bb b/meta/rec=
ipes-extended/iputils/iputils_20250605.bb
index 31eb51e56d4..baeda556592 100644
--- a/meta/recipes-extended/iputils/iputils_20250605.bb
+++ b/meta/recipes-extended/iputils/iputils_20250605.bb
@@ -26,7 +26,7 @@ PACKAGECONFIG[docs] =3D "-DBUILD_HTML_MANS=3Dtrue -DBUI=
LD_MANS=3Dtrue,-DBUILD_HTML_MAN
=20
 inherit meson update-alternatives pkgconfig
=20
-EXTRA_OEMESON +=3D "--prefix=3D${root_prefix}/ -DSKIP_TESTS=3Dtrue"
+EXTRA_OEMESON +=3D "--bindir=3D${base_bindir} -DSKIP_TESTS=3Dtrue"
=20
 ALTERNATIVE_PRIORITY =3D "100"
=20
--=20
2.43.0


