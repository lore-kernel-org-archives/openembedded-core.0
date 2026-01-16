Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84297C982DF
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 17:34:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2690.1768584844816820723
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 09:34:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F16A1516
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 09:33:57 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DE7953F59E
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 09:34:03 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ffmpeg: ensure manpage generation is deterministic
Date: Fri, 16 Jan 2026 17:34:02 +0000
Message-ID: <20260116173402.1460230-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 17:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229552

With a clean build tree, building ffmpeg from scratch will not have any
manpages generated. However if you then force ffmpeg to rebuild, the
resulting packages will have manpages.

This is because the ffmpeg manpage generation uses pod2man, which is
provided by perl-native. This is not a build-dependency on ffmpeg but it
does enter the sysroot in do_package via further dependencies on that
task.

As this is non-deterministic and easy to solve, simply add perl-native
to the DEPENDS.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_8.0.1.bb
index 5ae985efb5..7d1f32f044 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
@@ -38,6 +38,7 @@ ARM_INSTRUCTION_SET:armv6 =3D "arm"
 # Should be API compatible with libav (which was a fork of ffmpeg)
 PROVIDES =3D "libav"
=20
+DEPENDS =3D "perl-native"
 DEPENDS:append:x86 =3D " nasm-native"
 DEPENDS:append:x86-64 =3D " nasm-native"
=20
--=20
2.43.0


