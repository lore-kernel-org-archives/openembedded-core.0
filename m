Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F06CEFC4D
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 19:31:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4697.1728415870562519378
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 12:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF810FEC
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Oct 2024 12:31:39 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 990DF3F73F
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Oct 2024 12:31:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/10] ffmpeg: no need for textrel INSANE_SKIP
Date: Tue,  8 Oct 2024 20:30:55 +0100
Message-Id: <20241008193103.2429829-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008193103.2429829-1-ross.burton@arm.com>
References: <20241008193103.2429829-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 19:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205302

It appears in testing that modern ffmpeg no longer needs to disable PIC,
so there's no need to ignore textrel warnings.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_7.0.2.bb
index b16bd51dbd7..af66104ebf3 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
@@ -181,13 +181,3 @@ FILES:libpostproc =3D "${libdir}/libpostproc${SOLIBS=
}"
 FILES:libswresample =3D "${libdir}/libswresample${SOLIBS}"
 FILES:libswscale =3D "${libdir}/libswscale${SOLIBS}"
 FILES:${PN}-examples =3D "${datadir}/${PN}/examples"
-
-# ffmpeg disables PIC on some platforms (e.g. x86-32)
-INSANE_SKIP:${MLPREFIX}libavcodec =3D "textrel"
-INSANE_SKIP:${MLPREFIX}libavdevice =3D "textrel"
-INSANE_SKIP:${MLPREFIX}libavfilter =3D "textrel"
-INSANE_SKIP:${MLPREFIX}libavformat =3D "textrel"
-INSANE_SKIP:${MLPREFIX}libavutil =3D "textrel"
-INSANE_SKIP:${MLPREFIX}libswscale =3D "textrel"
-INSANE_SKIP:${MLPREFIX}libswresample =3D "textrel"
-INSANE_SKIP:${MLPREFIX}libpostproc =3D "textrel"
--=20
2.34.1


