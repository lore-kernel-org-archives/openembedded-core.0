Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D548CC6B1C
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 17:48:28 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3842.1791913703123163534
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 10:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=TWwDaXKy;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Zckv2O3t;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C5A364E41214
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 17:48:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9901460362
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 17:48:20 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id F336211D7159B; Tue, 13 Oct 2026 19:47:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913700; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=m8lGEpjQr5zGYWG+V4DWf46+woIKleMYx2WwT9QAwFM=;
	b=TWwDaXKyjRwGGfSIr5k5APSp3WGII5p/3gKk6moeWOk8F1Sf0b0IKEqW8KCdVHyoIILQNQ
	Llof8w/OC2TOB7KczUoYLDI5v6iSYenCGi1veOeYijWw9CmTtcipFMU0ylYjDQ9MjLtCvA
	FV6jp0GmJpmnl4KO0siABOTUZynEOvcDBLAoD1DZ/DAP2Kg4F6e6oBs4QPgozlPfFSOiQ1
	AYQ4jRJqmp6QlpO0z0HEHyXmymqck/EUiUW0XofxbDjY1DMCN3lfvE+CCH/Ixo5LhiUy9Z
	zZ/Px2SO2tp/OkV80JQ4gIG1memSEqS5rZIQ7DINB18SihaG3SSgc/KwXs/KyA==
Authentication-Results: mail.galae.net;
	none
Received: from mail.galae.net ([172.22.1.253])
	by 9e7fea892943 with LMTP
	id EKENMkK/xGpJhgAAtaWaaQ
	(envelope-from <joaomarcos.costa@bootlin.com>)
	for <joaomarcos.costa@bootlin.com>; Tue, 06 Oct 2026 11:28:34 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F61D10330753;
	Tue,  6 Oct 2026 11:28:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791278913; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=m8lGEpjQr5zGYWG+V4DWf46+woIKleMYx2WwT9QAwFM=;
	b=Zckv2O3twEN53bG+P99DtmNe4hiIoF97REht5+uQF2gXfobBMnoiga4cuJwuQeLZBaw+UN
	5YxymtVB43s1oSGpNnucqFIKdQcMjKXROonW6YBib5eRKt1XhpkvEC8pIVKpqPl76ePSzE
	OayCrDrAGLgXi/apUX0WmzdP6wtvYK1AYZM+P2m/5e1eZ5JYMRLZ3RTfw7DS0tr8Y0pG/c
	jPqmeKa/H2E42NOEm7E8LHA3xB1pnN+5+vTdAYQb/4SafHj/yad6kxuQMsjFBYLsnnEwka
	OEFqQS6tGSoHNm+4y8Fy7+ImafAooYmqgvkq14QT7DmItORnlksUCsEJVkh+yg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [blacksail][PATCH] recipes-support/gnutls: disable slow tests for RISCV64
Date: Tue,  6 Oct 2026 11:28:10 +0200
Message-ID: <20261006092810.2407651-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: F336211D7159B
X-Spamd-Result: default: False [-3.50 / 30.00];
	BAYES_HAM(-5.50)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[176];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	FORWARDED(0.00)[joaomarcos.costa@bootlin.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	BCC(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[joaomarcos.costa@bootlin.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[yoctoproject.org:url,bootlin.com:mid,bootlin.com:email,localhost:rdns,localhost:helo];
	RCPT_COUNT_THREE(0.00)[4]
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 17:48:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247732

Timeouts have been observed (very frequently in the past weeks)
in the autobuilder, and a bug [1] was filed at Bugzilla.

After some investigation [2] was performed by Trevor Gamblin, we now have=
 a
list of the most time consuming test cases:

- mini-record-2 (187880ms)
- record-retvals (145390ms)
- rng-op-key (63820ms)
- rng-op-random (63330ms)
- rng-op-nonce (63260ms)
- dtls-rehandshake-cert (61360ms)
- dtls-rehandshake-cert-2 (61230ms)
- dtls-rehandshake-anon (61030ms)
- mini-loss-time (60130ms)
- mini-dtls-hello-verify-48 (30050ms)
- tls12-ffdhe (27790ms)
- x509sign-verify-rsa (18460ms)
- x509sign-verify-ecdsa (16050ms)

Disable the tests that take > 60000ms to avoid so many timeouts in qemuri=
scv64-ptest runs.

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16162
[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16162#c19

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-support/gnutls/gnutls/run-ptest |  1 +
 meta/recipes-support/gnutls/gnutls_3.8.13.bb | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls/run-ptest b/meta/recipes-=
support/gnutls/gnutls/run-ptest
index b7827e1358..1d6999669a 100644
--- a/meta/recipes-support/gnutls/gnutls/run-ptest
+++ b/meta/recipes-support/gnutls/gnutls/run-ptest
@@ -53,6 +53,7 @@ test_disallowlist=3D"${test_disallowlist} system-overri=
de-sig"
 test_disallowlist=3D"${test_disallowlist} system-override-sig-tls"
 test_disallowlist=3D"${test_disallowlist} system-prio-file"
 test_disallowlist=3D"${test_disallowlist} x509cert-tl"
+test_disallowlist=3D"${test_disallowlist} @EXTRA_TEST_DISALLOWLIST@"
=20
 LOG=3D${PWD}/tests.log
 cd tests
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.13.bb b/meta/recipes-=
support/gnutls/gnutls_3.8.13.bb
index 9c8c994bdc..88b6135bf1 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.13.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
@@ -77,6 +77,24 @@ do_install:append:class-target() {
         fi
 }
=20
+EXTRA_TEST_DISALLOWLIST ?=3D ""
+
+EXTRA_TEST_DISALLOWLIST:riscv64 =3D "\
+    dtls-rehandshake-anon \
+    dtls-rehandshake-cert \
+    dtls-rehandshake-cert-2 \
+    mini-loss-time \
+    mini-record-2 \
+    record-retvals \
+    rng-op-key \
+    rng-op-nonce \
+    rng-op-random \
+"
+
+do_install_ptest_base:append() {
+    sed -i 's:@EXTRA_TEST_DISALLOWLIST@:${EXTRA_TEST_DISALLOWLIST}:g' ${=
D}${PTEST_PATH}/run-ptest
+}
+
 PACKAGES =3D+ "${PN}-dane ${PN}-openssl ${PN}-xx ${PN}-fips"
=20
 FILES:${PN}-dev +=3D "${bindir}/gnutls-cli-debug"
--=20
2.55.0


