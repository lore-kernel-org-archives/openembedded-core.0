Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5977CCAC59B
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 12:07:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17778.1758024427925430368
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 05:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2257C12FC
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 05:06:59 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EE2283F673
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 05:07:06 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] fontconfig: remove obsolete relative_symlinks class
Date: Tue, 16 Sep 2025 13:07:02 +0100
Message-ID: <20250916120703.622865-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 12:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223544

The fontconfig recipe inherited this because the symlink farm that it
creates in /etc/fonts/conf.d/ to /usr/share/fontconfig/conf.avail/ were
all absolute links, and this causes "problems" for the native sstate
code[1].

However, as of fontconfig 2.15[2] these links are created relative, so
this inherit is redundant.

[1] oe-core e478550c8cd ("openssl/fontconfig/bzip2: Use relative symlinks=
 instead of absolute ones (using a new class)")
[2] fontconfig 5d954398 ("Create a symlink with relative path")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb b/meta=
/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
index 17d2f87dd6f..48151fe4f5f 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
@@ -57,7 +57,7 @@ RREPLACES:fontconfig-utils =3D "libfontconfig-utils"
 RCONFLICTS:fontconfig-utils =3D "libfontconfig-utils"
 DEBIAN_NOAUTONAME:fontconfig-utils =3D "1"
=20
-inherit meson pkgconfig relative_symlinks gettext
+inherit meson pkgconfig gettext
=20
 FONTCONFIG_CACHE_DIR ?=3D "${localstatedir}/cache/fontconfig"
=20
--=20
2.43.0


