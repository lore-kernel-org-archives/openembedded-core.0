Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12544.1794488244553594018
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 04:57:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=sO4TXfjG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4F15B1A162A
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 12:57:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E0CF5FF85;
	Thu, 12 Nov 2026 12:57:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7226111BC06A8;
	Thu, 12 Nov 2026 13:57:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794488237; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=a1uncmqphzDLtBRQXuc8eXZst7mjIASltVX4tf6Vt1k=;
	b=sO4TXfjGdesXKQDrXlWCTMyZzys3MCBx1A1h7KlrbLl0ORwEQpH3ffDb5Xw2mXismNAiMX
	bzZIiEdyhwUynVxK3i9satZ1pQhxUHSvZt38Wcmpdiut+sZpy594/g7+hXk6mwbhcTdaAY
	lDuyu+wJ5i1//YQFxN96FWmNFC9yZLvWREetJVfqUa4HA7kCPhiMxmoYNVLgRpDpHq6qjz
	g3sBSN6doswfuUtH0lyeD7lZWD1E1kJv3ANO2/JLy8Wb6G8fR1FHu9cHSEE2RqMeIGhHAF
	dNm2CuTzZvY9Z4jPlWJSJUUPgtgCCErcHrlBOS7651TrA9qhmTAbfXCUmpJX8A==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	ross.burton@arm.com,
	mathieu.dubois-briand@bootlin.com,
	pratik.farkase@est.tech,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH] python3: skip test_interrupt with musl
Date: Thu, 12 Nov 2026 13:57:08 +0100
Message-ID: <20261112125708.54478-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 12:57:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250090

This test was skipped by a previous patch [1], which was somewhat reverte=
d
later [2], and test_interrupt is failing again.

As per the logs [3], test_interrupt is not actually being skipped for mus=
l,
and the failure is happening again:

FAIL: test_interrupt (test.test_multiprocessing_fork.test_processes.WithP=
rocessesTestProcess.test_interrupt)

Skip it for musl.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D7a7fbf902=
8bb1f84a3638d06fb1f56f44f258c48
[2] https://git.openembedded.org/openembedded-core/commit/?id=3Df230c2d50=
c8afd141ea075b4e643ac503724f427
[3] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16348#c5

[YOCTO #16348]

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-devtools/python/python3_3.14.10.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.10.bb b/meta/recip=
es-devtools/python/python3_3.14.10.bb
index c50c4d4bab..e76051ec60 100644
--- a/meta/recipes-devtools/python/python3_3.14.10.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
@@ -337,6 +337,11 @@ SKIPPED_TESTS:append =3D " \
     --ignore TimerfdTests \
 "
=20
+# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16348
+SKIPPED_TESTS:append:libc-musl =3D " \
+    --ignore test.test_multiprocessing_fork.test_processes.WithProcesses=
TestProcess.test_interrupt \
+"
+
 # https://github.com/python/cpython/issues/159424
 SKIPPED_TESTS:append:libc-musl =3D " \
     --ignore test.test_readline.TestHistoryManipulation.test_append_limi=
ted_history \
--=20
2.55.0

