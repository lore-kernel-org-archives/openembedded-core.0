Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4927D41D64
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 15:50:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12499.1765468246046054054
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 07:50:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 419451063
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 07:50:38 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 161BD3F740
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 07:50:44 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libxml2: remove obsolete ptest RDEPENDS
Date: Thu, 11 Dec 2025 15:50:41 +0000
Message-ID: <20251211155041.523217-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 15:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227549

As part of the libxml2 2.10.3 upgrade[1] the run-ptest was moved from
calling make to running the tests directly, but the make dependency was
not removed.

Also verified that there is no bash usage in the tests, so also remove
the bash dependency.

[1] oe-core ec5f380a142 ("libxml2: upgrade 2.9.14 -> 2.10.3")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/libxml/libxml2_2.15.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.15.1.bb b/meta/recipes-co=
re/libxml/libxml2_2.15.1.bb
index a010c84f779..905688e834b 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.1.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.1.bb
@@ -31,7 +31,7 @@ inherit autotools pkgconfig binconfig-disabled ptest
=20
 LDFLAGS:append:riscv64 =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-=
is-lld ptest', ' -fuse-ld=3Dbfd', '', d)}"
=20
-RDEPENDS:${PN}-ptest +=3D "bash make locale-base-en-us"
+RDEPENDS:${PN}-ptest +=3D "locale-base-en-us"
 RDEPENDS:${PN}-ptest:append:libc-musl =3D " musl-locales"
 RDEPENDS:${PN}-ptest:append:libc-glibc =3D " glibc-gconv-ebcdic-us \
                                            glibc-gconv-ibm1141 \
--=20
2.43.0


