Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2826CD3EE7C
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 15:34:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39966.1769096087032292534
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 07:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 238911476
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 07:34:40 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4EB503F632
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 07:34:46 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] gpgme: ensure manpage generation is deterministic
Date: Thu, 22 Jan 2026 15:34:38 +0000
Message-ID: <20260122153438.1546221-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122153438.1546221-1-ross.burton@arm.com>
References: <20260122153438.1546221-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 15:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229852

In a similar way to the previous commits with pod2man, gpgme will not
generate manpages on a clean build but will on rebuilds due to
do_package -> rpm-native -> ... -> libgpg-error-native, where the
libgpg-error-native recipe provides the yat2m tool.

To ensure that we generate manpages deterministicly, depend on this
recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/gpgme/gpgme_2.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gpgme/gpgme_2.0.1.bb b/meta/recipes-sup=
port/gpgme/gpgme_2.0.1.bb
index 364147fad5..ae20f785e6 100644
--- a/meta/recipes-support/gpgme/gpgme_2.0.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_2.0.1.bb
@@ -26,7 +26,7 @@ SRC_URI =3D "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
=20
 SRC_URI[sha256sum] =3D "821ab0695c842eab51752a81980c92b0410c7eadd04103f7=
91d5d2a526784966"
=20
-DEPENDS =3D "libgpg-error libassuan"
+DEPENDS =3D "libgpg-error-native libgpg-error libassuan"
=20
 RRECOMMENDS:${PN} +=3D "${PN}-tool"
=20
--=20
2.43.0


