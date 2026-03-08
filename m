Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64AEEA8536
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 16:15:44 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41947.1772986534793206901
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 09:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout12.t-online.de (Postfix) with SMTP id 5DD20E185
	for <openembedded-core@lists.openembedded.org>; Sun,  8 Mar 2026 17:14:56 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.163.87]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vzGmJ-1aASW10; Sun, 8 Mar 2026 17:14:51 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] systemd: fix installed-vs-shipped error
Date: Sun,  8 Mar 2026 17:14:32 +0100
Message-ID: <20260308161432.3415411-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1772986491-B51096B8-C5672D2F/0/0 CLEAN NORMAL
X-TOI-MSGID: 9616af5f-085e-4a70-9efc-bb9d55bc43a3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 16:15:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232664

There are files installed in /usr/lib/nvpcr that are not shipped.
Add them to FILES:${PN}.

This fixes
ERROR: systemd-1_259.1-r0 do_package: QA Issue: systemd: Files/directorie=
s were installed
but not shipped in any package
  /usr/lib/nvpcr
  /usr/lib/nvpcr/cryptsetup.nvpcr
  /usr/lib/nvpcr/hardware.nvpcr
Please set FILES such that these items are packaged. Alternatively if the=
y are
unneeded, avoid installing them or delete them within do_install.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-core/systemd/systemd_259.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_259.1.bb b/meta/recipes-co=
re/systemd/systemd_259.1.bb
index 34dd37ffff..edbbae8e0e 100644
--- a/meta/recipes-core/systemd/systemd_259.1.bb
+++ b/meta/recipes-core/systemd/systemd_259.1.bb
@@ -675,6 +675,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
                 ${nonarch_libdir}/systemd/* \
                 ${libdir}/systemd/libsystemd-core* \
                 ${libdir}/pam.d \
+                ${nonarch_libdir}/nvpcr \
                 ${nonarch_libdir}/pam.d \
                 ${systemd_unitdir}/* \
                 ${base_libdir}/security/*.so \
--=20
2.53.0


