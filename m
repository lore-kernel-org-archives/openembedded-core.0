Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9ECC021BB
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:26:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8938.1740493603865851608
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:26:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA6301BCB
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:26:59 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 107E53F6A8
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:26:42 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] freetype: pass missing include paths to autoreconf
Date: Tue, 25 Feb 2025 14:26:36 +0000
Message-ID: <20250225142636.703255-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225142636.703255-1-ross.burton@arm.com>
References: <20250225142636.703255-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211884

Now that autotools isn't searching for every m4 file the configure fails.
This is because freetype only uses autoconf and has a manual autogen.sh
script that passes -I. itself.

As we don't call that script, pass -I . to autoreconf ourselves.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/freetype/freetype_2.13.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/freetype/freetype_2.13.3.bb b/meta/rec=
ipes-graphics/freetype/freetype_2.13.3.bb
index 30f50cc289b..100a7d95b69 100644
--- a/meta/recipes-graphics/freetype/freetype_2.13.3.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.13.3.bb
@@ -23,7 +23,7 @@ inherit autotools pkgconfig multilib_header
 # Adapt autotools to work with the minimal autoconf usage in freetype
 AUTOTOOLS_SCRIPT_PATH =3D "${S}/builds/unix"
 CONFIGURE_SCRIPT =3D "${S}/configure"
-EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader --exclude=3Dautomake"
+EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader --exclude=3Dautomake -I ."
=20
 PACKAGECONFIG ??=3D "zlib pixmap"
=20
--=20
2.43.0


