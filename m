Return-Path: <l.stach@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CD4CA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 17:18:07 +0000 (UTC)
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.444.1790961482667230968
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 10:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@pengutronix.de header.s=20260414 header.b=ADyC2ydy;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: l.stach@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B598E201991;
	Fri, 02 Oct 2026 19:17:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790961474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aqZ+XbAoSktBEgtRCfb45jvn0lXdK17AHM6Fbl0sGoQ=;
	b=ADyC2ydy+7ufaKb0MEBN4XZt6J+4iqAQ4/LC3eqbYQjUKBEQ3XBD66J5UvTcPy2ZK+bZ7I
	A5OIzAQkOSEDhhsE2/xu+83KF5oRmmAnKsvjKYtAJHuIqwsVn+qiQpvLCX3p5WNosxhKYp
	2Izm5o5i25uh6PE3JWKphgEusZ6+8rnI8exZoJN1tIx7RTvS8gAnAUzL0gx3fyln/s69qz
	WJHRUF72NDpfpgD0n7rKPuY7ZX2g0D4SkiFzNVEUyCw0ruuSZBS3ZKbX15jpAPaxY2YIDl
	8bZcGovecIDMvSYMBdTTp6PQ4Fn8lwbrIm6+kEWnTG1WN8+7PvpCbzBjnWW7/A==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790961474; a=rsa-sha256;
	cv=none;
	b=VHW+cx11Ca2r5/9/Fid2G+/i3H2LM0JE+n0Ok5QoeKaAa/+lzMU8kPi6NRjZZive2CJlQs
	4dK+KlO6RYDnuU6GveQlvWrzGi0OQ+lqrbBMdYVyWIqn8oh7WxkZ98OsbluyPfmYXTaOw7
	mGj3rfJNqF6AGcIQmi11iM2x518nH+onWd3ohlREPcZYsAqWh7GVKnXT2aFCuHp78kkr5Q
	qWMjhEMkoIpOEkOCM/h9jQjm7sSsuqoBt9+Vxcp+KHG8/b0InHvbZCL0qLWsOsefcpfZuB
	btwYMTrEl4emPKOBOLQ2X5qFaxGNAzZJdoVHnj+jQcSwSXQMcZuiGdKIclpIdw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=l.stach@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790961474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aqZ+XbAoSktBEgtRCfb45jvn0lXdK17AHM6Fbl0sGoQ=;
	b=b4P0ejdTIxUOq4drEKEDmCB7bWI9tssX7oCWrEFb2qX7e6wAkgw05Dvgs+U3kFkz183PEK
	EDj5q1OxgmB/vRvude7H608eeVovu4xYGoe5ZoApIXu9C5g4p96JL7VRdUnrUZfMvvizOp
	EQBCOUNrrK0UvVk9fVDN97POVZtwPpgRQW5pXrVZ4NILYprTjNUVlfoJ3+muMQNp1zu25U
	gkScrn4ZJIhToGyaMGkxLAtEfUp3e1VlpNLhaVcbTRvBKRshf0tgNqg9CYkZaCiFRHHW5w
	4fa4mPvOMinTU48RbM2dAN/HoYNO1Iu5l0OgEJ8aJbYwaCJAs3lkgQwcwUM1Cw==
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <l.stach@pengutronix.de>)
	id 1xCgtO-003vVz-20;
	Fri, 02 Oct 2026 19:17:54 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [wrynose][PATCH] barebox: upgrade 2026.04.0 -> 2026.04.2
Date: Fri,  2 Oct 2026 19:17:54 +0200
Message-ID: <20261002171754.3944723-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 17:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247134

Bump to the latest stable release, which includes a fix for a
FIT image verification bypass, see:
https://github.com/barebox/barebox/security/advisories/GHSA-jhvm-7xq8-rvg=
m

Release: https://github.com/barebox/barebox/releases/tag/v2026.04.2

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-b=
sp/barebox/barebox-common.inc
index f736ca68e02f..db7fb25e264d 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION =3D "bootloaders"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df5125d13e000b9ca1f0d3364286c4=
192"
=20
-PV =3D "2026.04.0"
+PV =3D "2026.04.2"
 SRC_URI =3D "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] =3D "07fd3e3440c23e27d0094432f67827887fcc0e37d5fe24dc=
257c39b97c4294a0"
+SRC_URI[sha256sum] =3D "aa575d3ca4e7a8abe6b9796d0ff1d1ace43f86e34c627cc0=
55ddb0a7ebd9dbe2"
--=20
2.47.3


