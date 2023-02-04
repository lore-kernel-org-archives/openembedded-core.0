Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17D3C636CC
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 09:13:19 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.2698.1675501991556715261
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 01:13:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout01.t-online.de (Postfix) with SMTP id 3C82B6FE3
	for <openembedded-core@lists.openembedded.org>; Sat,  4 Feb 2023 10:13:09 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.165.5]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pOEbc-4BiPuz0; Sat, 4 Feb 2023 10:13:08 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] mesa: add PACKAGECONFIG for video-codecs
Date: Sat,  4 Feb 2023 10:13:01 +0100
Message-Id: <20230204091301.87892-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1675501988-927EB95E-37EE0CC2/0/0 CLEAN NORMAL
X-TOI-MSGID: d0d29d02-1eac-4ca9-9cac-5a35086431e5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 09:13:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176757

'mesa' no longer provides support for it by default because these codecs =
are
patent encumbered.

Hide the build behind the commercial flag

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 0ec681cf20..cc4aa5eeab 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -86,6 +86,7 @@ PACKAGECONFIG =3D " \
 	${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'dri3', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
+	${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'video-cod=
ecs', '', d)} \
 "
=20
 # "gbm" requires "opengl"
@@ -178,6 +179,9 @@ PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Denabled,-Dli=
bunwind=3Ddisabled,libunwind"
=20
 PACKAGECONFIG[lmsensors] =3D "-Dlmsensors=3Denabled,-Dlmsensors=3Ddisabl=
ed,lmsensors"
=20
+VIDEO_CODECS =3D "vc1dec,h264dec,h264enc,h265dec,h265enc"
+PACKAGECONFIG[video-codecs] =3D "-Dvideo-codecs=3D${@strip_comma('${VIDE=
O_CODECS}')}, -Dvideo-codecs=3D''"
+
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION:append =3D " -fno-omit-frame-pointer"
=20
--=20
2.34.1


