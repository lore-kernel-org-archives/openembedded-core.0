Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B30D6555E
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 12:17:26 +0000 (UTC)
Received: from dwarf.ash.relay.mailchannels.net (dwarf.ash.relay.mailchannels.net [23.83.222.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13292.1765973842248362521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 04:17:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=TgZE3ers;
 spf=pass (domain: rootcommit.com, ip: 23.83.222.53, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 2D4767E1933
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:17:21 +0000 (UTC)
Received: from de-fra-smtpout7.hostinger.io (trex-green-0.trex.outbound.svc.cluster.local [100.107.170.83])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 713267E2419
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:17:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765973840;
	b=vV+Jz9mk+4Ci5tn9RIGaW43bRg+m95V88my+1CTzc6SV/VQkyeknEYOAc1Wu98TEEu70ZB
	wSrLenoF6ch8guFGeuKVhAAed7OPlPJf05xErBVfjek/sxHe5JdxuynNwxVVVdnVltLEGQ
	lUAK9rvqSUEJ5uKGmy/+UMs780iJfA9XGN9CaqpzcxkzkMGdpSv2hbBB5aE82q0J/Lzxbr
	Jhp05AOzSRwBY7CGpn7X23P3437M4T8e+6diLs7g0k4aFz+CaL1LDXCM4J+4FXcFpt08A5
	3yCvlnluMF444n/dI1ch5lrk6SAjiZnf39OH3l3OHk75OTsL7tXfzwieT2zgTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765973840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=oxKT/8dazrkCsLBDiUU4/miYhUnMwDGZwY2Ch4DEz90=;
	b=Vo5GYoikXBOgj6eToWw6DIaRIvY7t/Ex1Mtqtln8zqERoQwgUtSCa+l+0tkmWWK5syWx8+
	jXID91mYALv2BTT0SELijR/RXSkLpeS6lR45AS/XY3P8G1/skYdaiiEFGafeyDxyTZFYyG
	REGXzYJY7Z4I7AxJiCydQwXmElkJ6ysOc3T0suq6vq5HL8ARcycD7uc/bTbPFeVcrqfXM8
	X9+/w3rupEWayNf0ucM63t33ykRq/T2ZMFy6UA0tre09oK24pQPcIFB9w2MbdyLlg5FTSp
	PaqBQWTeWsmmkaT8Es5kvI8Zjrhkop1Qs8yZJn3Id1Ua/N+CPNeO11qU6cI1dQ==
ARC-Authentication-Results: i=1;
	rspamd-6ccd5b4cc5-r97t4;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Desert-Wide-Eyed: 4a23bed51476b898_1765973840967_798958801
X-MC-Loop-Signature: 1765973840967:2684407687
X-MC-Ingress-Time: 1765973840967
Received: from de-fra-smtpout7.hostinger.io (de-fra-smtpout7.hostinger.io
 [148.222.55.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.107.170.83 (trex/7.1.3);
	Wed, 17 Dec 2025 12:17:20 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:8e2b:fce5:ec42:f176])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dWXqL4Svtz42Qm;
	Wed, 17 Dec 2025 12:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765973838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oxKT/8dazrkCsLBDiUU4/miYhUnMwDGZwY2Ch4DEz90=;
	b=TgZE3ersZkZ8mGLyY4ptofCXVkcGeVTMCMYGyW8vD3RXg9Nfl8vvIXg4BNbogVAO25CODz
	N+L0LqzySfgJQ26oK3PeEwSE9qTMj2k4UF2T1MbQ8E6LXctlyWjmZXbid0eYoGFSgzbbsC
	vSCylKYQ7W39Czr+KCxZRQExY4SxvaxZWCv2wFbv4NuMnk6cdEFfnDVYFQPPfyhYZJPsVZ
	Znzlpl6JSAuFHlaWkrsAuCIa1C28uoHwhmdDz8leuSoOLqvf+Fjho3KXjz5s/caJnUULdL
	bvANhOhBloGK2omeeCeLRXc68lyE9hz7D/C33fukmrO2YCoGK4H6E+g4C0v3bg==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH 1/5] alsa-lib: upgrade 1.2.14 -> 1.2.15
Message-ID: <20251217121705.391288-2-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217121705.391288-1-michael.opdenacker@rootcommit.com>
References: <20251217121705.391288-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 12:17:18 +0000 (UTC)
X-CM-Envelope: MS4xfBh13Emj9WrLdGRtSdmZIATge3M1gEJy9aMlgXt4ch95ZiVCrF1mYvpVLRgoye3Ovk9C8a6phqU/TI7Ie3ByZFOPoSmUGjaVwiCWkYhNWvji7xwbp5Lx IgdX3J6q4FC2Scwai4evka9NmUjm103VzEjY0f5llIB5O7dxPjDIJwQsNF68lNEU1PWbVxIfKVTxbP9nxTv5xMNy1LYcqcqfLIaXbaTG5vH36OKn3f6u0W7e fXx1yXDalAEyaMYY3sCprEf5M9jefZlpzaNxl8Wg/OCuR03o6iytDLOKHNGNbfocQVMt3GCWIaP2dZO8lczzhwVzkubn2/VEvpEUtdDMucF+TnYTFxmJQ1V1 RW/jL7Th
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=69429f4e a=JY/OoRUBqPoXaiLUhbiEKg==:617 a=xqWC_Br6kY4A:10 a=foHCeV_ZAAAA:8 a=d70CFdQeAAAA:8 a=_7PUJ1hbmRs6JOKwMsMA:9 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228029

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Upstream changes:
https://www.alsa-project.org/wiki/Changes_v1.2.14_v1.2.15#alsa-lib

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 .../alsa/{alsa-lib_1.2.14.bb =3D> alsa-lib_1.2.15.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.14.bb =3D> alsa-lib_1.=
2.15.bb} (94%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb b/meta/recip=
es-multimedia/alsa/alsa-lib_1.2.15.bb
similarity index 94%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb
index 41a42f9ecc..bf20e1a1ad 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b9107=
6e631dd8edb7424769c7 \
                     "
=20
 SRC_URI =3D "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] =3D "be9c88a0b3604367dd74167a2b754a35e142f670292ae47a=
2fdef27a2ee97a32"
+SRC_URI[sha256sum] =3D "83770841585e766a60c99fd23f8c574c22643ae0cb1f2d20=
b793c3d84eb95a8d"
=20
 inherit autotools pkgconfig
=20

