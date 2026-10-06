Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25D3CA5FFF
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 10:47:26 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42546.1791283644394866927
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 03:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=rI+TCMmO;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd96.aul.t-online.de (fwd96.aul.t-online.de [10.223.144.122])
	by mailout11.t-online.de (Postfix) with SMTP id 6829B1C40F
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Oct 2026 12:47:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.33.153]) by fwd96.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xE2hd-1XvJlg0; Tue, 6 Oct 2026 12:47:21 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][oe-core][PATCH] libx11: stage the X11 locale data in the target sysroot
Date: Tue,  6 Oct 2026 12:47:04 +0200
Message-ID: <20261006104704.3299657-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1791283641-AB7FD862-78FA0753/0/0 CLEAN NORMAL
X-TOI-MSGID: 2d9a73c2-2807-4a08-b301-0d0645776ef9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1791283641; i=f_l_k@t-online.de;
	bh=ftI84HSmWDzgTaTZSntsbo3MVlh6VPmqLlgpccKuO20=;
	h=From:To:Subject:Date;
	b=rI+TCMmOGXK7N8kLAwIon3WZIhfRJohsX/IdCtHGWI4hnUpYrZE5XGjp1pMHL6VVZ
	 SBEAyREuUwCwFpF6x1j40F7hqsZmtzBilYLbVcflCCU9NoAXSk3yt+oJCom7RoTEP4
	 kbfkMlp8/E8aKBETwUwSizoDhEGJfvkhhKSaB1M1Re7IqhcoHfDIbRd3nFfWKRjQmm
	 8OIzGOlJ87oDlQvI+tVG/WdUeeESN9tkoDKYRhtGc+oKEKibw+fbfKvnMWZVMfXxfO
	 9XR8VOUK/x+CxP44g/k8lxgEba6U4eJQxPvZ8CiUY/Y0TiNeGaPWTdO8anDtrO+yWt
	 t7SYdPO57lFzg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 10:47:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247281

ibus 1.5.35 builds with meson and runs the tool that generates its
compose table through qemu, which looks for en_US.UTF-8/Compose under
/usr/share/X11/locale in the target sysroot and falls back to the build
host's copy when it is missing. Keep the directory in the target
sysroot instead of the native one, which ibus no longer uses. Tested by
building ibus 1.5.35-rc1 against it; the generated table matches the
one built from libx11-native's data.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb b/meta/recip=
es-graphics/xorg-lib/libx11_1.8.13.bb
index db176efede..42f52f3de2 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
@@ -39,6 +39,6 @@ FILES:${PN} +=3D "${datadir}/X11/XKeysymDB ${datadir}/X=
11/XErrorDB ${datadir}/X11/
 FILES:${PN}-xcb +=3D "${libdir}/libX11-xcb.so.*"
 FILES:${PN}-locale +=3D "${datadir}/X11/locale ${libdir}/X11/locale"
=20
-SYSROOT_DIRS_IGNORE:remove:class-native =3D "${datadir}/X11/locale"
+SYSROOT_DIRS_IGNORE:remove:class-target =3D "${datadir}/X11/locale"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.55.0


