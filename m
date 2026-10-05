Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF30CCA5FF0
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 13:39:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20307.1791207561426131528
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 06:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Nh5XwZYc;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 874A31A116B
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Oct 2026 13:39:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D18C601A5;
	Mon,  5 Oct 2026 13:39:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 552BE103306A3;
	Mon,  5 Oct 2026 15:39:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791207554; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m8lGEpjQr5zGYWG+V4DWf46+woIKleMYx2WwT9QAwFM=;
	b=Nh5XwZYceUowb3XXCtog4JLHxsK2rUa+p8Ac5KwcQnb3jSShxkletEy60yeA2JcWg7KUIK
	5UrSJ5AAInKE0vMdcuiP0BlfnrxPLJLaEhpvMC1JcelRmHXtl9pngos0KtbN68C5UmdYNK
	KsO7yzTw8cFbcSibl5sqKwUrtLxMr0Uf7zmQudMqSisKs4Ur7G1nnVfaS7ZNzSjRP1iNur
	7VCYoC9H6Hd11TsJJ4vqoOzpHN8nKCdF+EP55kJqffnTV4IMUjoaNw7Y66w1k0MrzNAI6d
	MJxhA2WIqL6ynGRJa0TV+vU9xEva/ASQyi8uhDiIyc6/yE+c+QwNUWlKZgFZIg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	tgamblin@baylibre.com,
	ross.burton@arm.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v4 1/1] recipes-support/gnutls: disable slow tests for RISCV64
Date: Mon,  5 Oct 2026 15:38:50 +0200
Message-ID: <20261005133850.2350694-2-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005133850.2350694-1-joaomarcos.costa@bootlin.com>
References: <20261005133850.2350694-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 13:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247242

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


