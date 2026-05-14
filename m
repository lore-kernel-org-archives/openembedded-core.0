Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEFD6CD4851
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 14:12:46 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12081.1778767959837445687
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 07:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=vTzQyOrk;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 666BBC5DC78;
	Thu, 14 May 2026 14:13:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5590060495;
	Thu, 14 May 2026 14:12:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DA75F11AF8C61;
	Thu, 14 May 2026 16:12:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778767956; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=paI0EqAW6v+QQatFdxU+56DM5ew9Yf6m4hPEyR84qII=;
	b=vTzQyOrkLsLwcvxkJt61gu3j1ye5Ji2QH4s9QyGEuWk/TI+PxHsnc3WrfdNYFwA4/6OAyv
	6SpbrSLukJdN1m8gSt9mSd4e+rDIuyE0sOTYeX4egfg8b/vxziA/s4fm68MBVoxiFI2yZQ
	17s+sErs272xt0rOAh9i04VJYrNX/2yvbYBrS9OX97C+x7qq87hINIoTdhlIEco0S1DuxG
	iu9HdHLsyFp9MMmyAJD/YsYWc5ILAKZ6dAyZQLWPVqPDp9Dj2RPKQe12cokkmekHXdKulM
	JHQKjSrbroNaAPaKo+svA25eMVC4TWDRXb2vW6bGxISbc4FZtd4YCro1q+rVYw==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	ross.burton@arm.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH] vim: simplify PACKAGECONFIG's default value
Date: Thu, 14 May 2026 16:11:13 +0200
Message-ID: <20260514141113.225627-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 14:12:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237038

GTK+3 UI was disabled [1] by default, and the resulting call to
bb.utils.contains() could be replaced by a bb.utils.filter() as in a
similar change [2].

Better than that, just move 'x11' to the bb.utils.filter() above.

[1] a07763f03d4f ("vim: disable GTK+3 UI by default")
[2] f38320c9646a ("meta: simplify conditional operations with bb.utils.fi=
lter")

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-support/vim/vim.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
index d6fdf45706..6e0058b13e 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -52,8 +52,7 @@ do_configure () {
 }
=20
 PACKAGECONFIG ??=3D "\
-    ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux x11', d)} \
     nls \
 "
=20
--=20
2.47.0


