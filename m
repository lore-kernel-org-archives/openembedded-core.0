Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1294BCEFC4A
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 19:31:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4652.1728415870265203034
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 12:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB4B3DA7
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Oct 2024 12:31:38 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B03A13F73F
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Oct 2024 12:31:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/10] ffmpeg: nasm is x86 only, so only DEPEND if x86
Date: Tue,  8 Oct 2024 20:30:54 +0100
Message-Id: <20241008193103.2429829-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 19:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205301

No need to depend on nasm if we're not going to use it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_7.0.2.bb
index 9e60b5cd23e..b16bd51dbd7 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
@@ -46,7 +46,8 @@ ARM_INSTRUCTION_SET:armv6 =3D "arm"
 # libpostproc was previously packaged from a separate recipe
 PROVIDES =3D "libav libpostproc"
=20
-DEPENDS =3D "nasm-native"
+DEPENDS:append:x86 =3D " nasm-native"
+DEPENDS:append:x86-64 =3D " nasm-native"
=20
 inherit autotools pkgconfig
=20
--=20
2.34.1


