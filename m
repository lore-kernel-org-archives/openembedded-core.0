Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27143.1795549133544944513
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 11:38:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@pengutronix.de header.s=20260414 header.b=a5A9rdin;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: uol@pengutronix.de)
Received: from dude03.red.stw.pengutronix.de (dude03.red.stw.4.pengutronix.de [10.17.1.7])
	(Authenticated sender: relay-from-dude03.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 68191205A38;
	Tue, 24 Nov 2026 20:38:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795549126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oierQU7uXK0y4m28+6fKGCF88UPvDPztPBoV2Ytx9NY=;
	b=a5A9rdinlS83IEnIwdW+T47toEuW56a87Tyn4USaTAje7EUvqPwMaH6pGHX6rPuHYXCTrC
	hnZwn4qh6zicGGnz7fIlXK3VKaoS69FLCQYIT4FVfvyfAgCPrPQfc4VoEN8MphUbt8gL/H
	tSgMYM8Sbuyi6fgi7RNiySQLjxDDqqHIEbeS5eecu5Ak8dpPBSncelj21GdcU9ho+7Ezc1
	SBLN8lH/2m8I07lJTeq5YpZogEtB6dzpdOwkifxxaVhjqxc2dbMyKuFFtj4raCS5J9zKo/
	TzrgHx7xbjuKtTxGBTdFpiyoqyljBP+Vlf2MqaSgFU+XqINn9Qq04x7R+Zmy7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795549126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oierQU7uXK0y4m28+6fKGCF88UPvDPztPBoV2Ytx9NY=;
	b=eiRcDNSA1zrdUM46DfkFrzq91HUrFnNiwhr6kiEx7j0RFwjEEQuRUjkHMvMcUz0PdDWhD0
	taT1LlD/adYMOdauYmlv9SFPRhmAPsa5nDSrpGYStvfZct7n6Vvl0ON7M8McP6n12jS4HE
	rtxbNMBLQCBajNQLE2afP57+FmJ8IDxTs27MEUL6c0LKiDk5tMcWTFs7aqgV8dbm86jkuA
	s3dz6gjuFhFkbDMPzsI645qnDBHwqZdQ0YWAA661/txgn8c/y4b1o5zzEgyKVybyRhS7pK
	UiclCYI+276kakv8xGAJkfXRZryNjvZeqCQBwawqpG6HJUOyoohUUi/LqpK15A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude03.red.stw.pengutronix.de smtp.mailfrom=uol@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795549126; a=rsa-sha256;
	cv=none;
	b=VoE7vlPK61oOpVuw2vifAPXa/4cGTx8wfYAqwc0bK81qqVj887id/6Qs0vTfDc/CNSeesS
	qbN4nhlk9wVK4gAx6MZi88tlJRSNqkgye35roZMutcbUymi4ndzKzcsjmJsZpLBjJcgsPs
	USx7LRKphtncWvmu9hQp4aVzZl/09pJdp/FHN9pBj4hT9IXNLx0wvYYe5wZt5SEb/sscly
	sZRXJmQnUlIvjs4usP3BiaxnQYahvNhBHGEaQyPNNMJXBVXWtBRI4NiettKNKDlAkqKxRD
	y58DHmxIMJeSi6HumGHlVRz+6PnTF4q7XdY+/tVsOBm54jpjJGZRieahT1oIzA==
Received: by dude03.red.stw.pengutronix.de (Postfix, from userid 1052)
	id 4CD2E2CAAB1; Tue, 24 Nov 2026 20:38:46 +0100 (CET)
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: OpenEmbedded Core Developers <openembedded-core@lists.openembedded.org>
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH 1/2] initramfs-framework: fix dependencies
Date: Tue, 24 Nov 2026 20:38:42 +0100
Message-ID: <20261124193843.3572691-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 19:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251076

As can be seen from the PACKAGES list, there is no package named ${PN}.
Therefore, the dependency on VIRTUAL-RUNTIME_base-utils, as introduced by=
 [1]
and updated by [2], and the recommendation for VIRTUAL-RUNTIME_base-utils=
-
syslog, as added by [3], had no effect.

This dependency and recommendation were presumably intended for the base
package, so assign them to ${PN}-base instead.

Note: The missing dependency on VIRTUAL-RUNTIME_base-utils, which default=
s to
"busybox" in default-providers.inc, is hidden in OE-Core's initramfs reci=
pes
because they explicitly list it again in their list of packages to be ins=
talled.
Fixing the recommendation for VIRTUAL-RUNTIME_base-utils-syslog, which de=
faults
to "busybox-syslog" in default-providers.inc, may now add that package to=
 the
initramfs.

[1] 8c9a604d3ef3 ("initramfsframework: Improve RDEPENDS to be package spe=
cific")
[2] f0f7062e9aa5 ("initramfs-framework_1.0:replace busybox for variable."=
)
[3] 544ade2d78f1 ("busybox/packagegroups: Break out the busybox-syslog de=
pendency")

Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
---
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b=
/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 2c5ff108138f..1fe7ec9b5e2c 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -1,8 +1,8 @@
 SUMMARY =3D "Modular initramfs system"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
-RDEPENDS:${PN} +=3D "${VIRTUAL-RUNTIME_base-utils}"
-RRECOMMENDS:${PN} =3D "${VIRTUAL-RUNTIME_base-utils-syslog}"
+RDEPENDS:${PN}-base +=3D "${VIRTUAL-RUNTIME_base-utils}"
+RRECOMMENDS:${PN}-base =3D "${VIRTUAL-RUNTIME_base-utils-syslog}"
=20
 SRC_URI =3D "file://init \
            file://exec \
--=20
2.47.3

