Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3977AC02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 20:12:53 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web11.21589.1737663167637416391
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 12:12:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=mx-20241105 header.b=SvyS9r85;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3837101D23B1;
	Thu, 23 Jan 2025 21:12:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737663165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YBLcEtMa18Kx+Gf4F7e8kMDF7RT5wXGAapECvd3xFFk=;
	b=SvyS9r85YAn9wrovH5MmeXltpdkB4zQg/3rzn3tsyeW6ydWdYmsmbQkafPZVumatZkKmSA
	DXBP+s0tIBPgrc46wALfRYhoKv3yfkpDgZLRFoO2Fj1ioskJDl4VYVce3LvvEtV/eGp2vC
	fvJe0eIVPFk+ZOvxXHUYtgaBUulaSwQYJZxL5Ttkf7ga2ySjkeDPvruzAzqAMhz6mCBeti
	qcZXMYd6iKRoRuLEPCEsQBB4nd6SDjcwDozosRXpYuKVVCYlewW8DmGaka8LeRDEpLz+Fo
	o9L3tW8zLYXMpnmdpHR20f4YjfT/vCgBXoGlVJniY61BlQ2IEHBW5WzGqNu92g==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alex@linutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] [RFC] bash: Drop /bin/sh from RPROVIDES
Date: Thu, 23 Jan 2025 21:12:01 +0100
Message-ID: <20250123201229.182266-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 20:12:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210212

Remove /bin/sh from bash RPROVIDES as this has a side-effect which
confuses rpm package manager when also busybox provides /bin/sh and
base-files depend on /bin/sh . The problem is broken down below.

First, bash depends on base-files and bash pkg_postinst must run
after base-files was installed, because it requires /etc/shells
provided by base-files to be in place.

Second, base-files depends on /bin/sh, which is provided by either
bash or busybox in this case. This is the actual problem here, if
bash is selected as /bin/sh provider, then there is cyclic dependency
between bash and base-files, and that confuses dnf which may install
the packages in the wrong order, bash first and base-files second .

To make this worse, if busybox is also /bin/sh provider, it can and
does happen that some systems pick busybox as the /bin/sh provider,
while others pick bash as the /bin/sh provider, and that cyclic
dependency does not always appear.

Attempt to break this dependency, drop RPROVIDES /bin/sh from bash
recipe to always force base-files to pick /bin/sh from busybox .
(I am really unsure about this approach)

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexander Kanavin <alex@linutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/bash/bash.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/=
bash/bash.inc
index 634209c9115..6a061b8a612 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -134,4 +134,4 @@ FILES:${PN}-loadable +=3D "${libdir}/bash/*"
=20
 # Limit the RPROVIDES here to class target so that if usrmerge is enable=
d for nativesdk, it does not
 # include host system paths in /bin/
-RPROVIDES:${PN}:append:class-target =3D " ${@bb.utils.contains('DISTRO_F=
EATURES', 'usrmerge', '/bin/sh /bin/bash', '', d)}"
+RPROVIDES:${PN}:append:class-target =3D " ${@bb.utils.contains('DISTRO_F=
EATURES', 'usrmerge', '/bin/bash', '', d)}"
--=20
2.45.2


