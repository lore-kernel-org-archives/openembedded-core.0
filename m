Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 247C1CA5FA1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 08:33:25 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3294.1790670800967495398
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 01:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=NCvDSHUh;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 284EE1A1049;
	Tue, 29 Sep 2026 08:33:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EA590601BD;
	Tue, 29 Sep 2026 08:33:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E5DCB103297A3;
	Tue, 29 Sep 2026 10:33:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790670798; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cJ0wrb65Zp/9STT6UMUZXiVJHJqhpqqtDZaxfnCtNkU=;
	b=NCvDSHUhU49VH+9Jb8c8HDjLQLALMt2HNTsPE19tHpOp2nMiDKTm04MTl6WTijCed5P+5o
	zf4nSZD5yFDdC/cXKBuPT/SlPVchwvoX9tjqKXQvs5KklaYOrDXrK5Gb59stIMEzuNR2eO
	aFcFxb++refKbOfZSf9WJMqDd8RNJ0dU5FaPLOERIrB7yacE4Dc8eHCj7LgyzrzB+iIzp7
	F5bt37vdE6OtdKGI8oTiBj8fc+pq+x9oTs4STAqw8I/Lvh9G77HqTyrooI3UgIkrJWvzIG
	GZbGvvG/Py5qBnk9wfqgVTkAF3R5LbCKXsUfs99EfyLuT1VcoVJNNLuM0zb8yg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	tgamblin@baylibre.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v3 1/1] recipes-support/gnutls: disable slow tests for RISCV64
Date: Tue, 29 Sep 2026 10:33:08 +0200
Message-ID: <20260929083308.1734775-2-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929083308.1734775-1-joaomarcos.costa@bootlin.com>
References: <20260929083308.1734775-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 08:33:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246848

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
 ...m-disable-slow-test-cases-in-RISCV64.patch | 107 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.13.bb  |   4 +
 2 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-Makefil=
e.am-disable-slow-test-cases-in-RISCV64.patch

diff --git a/meta/recipes-support/gnutls/gnutls/0001-tests-Makefile.am-di=
sable-slow-test-cases-in-RISCV64.patch b/meta/recipes-support/gnutls/gnut=
ls/0001-tests-Makefile.am-disable-slow-test-cases-in-RISCV64.patch
new file mode 100644
index 0000000000..95be1da5c4
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-tests-Makefile.am-disable-s=
low-test-cases-in-RISCV64.patch
@@ -0,0 +1,107 @@
+From 3a77e07b66a3c828098ae601351a56c541803934 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D <joaomarcos.cos=
ta@bootlin.com>
+Date: Mon, 28 Sep 2026 15:56:37 +0000
+Subject: [PATCH] tests/Makefile.am: disable slow test cases in RISCV64
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Timeouts have been observed (very frequently in the past weeks)
+in the autobuilder, and a bug [1] was filed at Bugzilla.
+
+After some investigation [2] was performed by Trevor Gamblin, we now hav=
e a
+list of the most time consuming test cases:
+
+- mini-record-2 (187880ms)
+- record-retvals (145390ms)
+- rng-op-key (63820ms)
+- rng-op-random (63330ms)
+- rng-op-nonce (63260ms)
+- dtls-rehandshake-cert (61360ms)
+- dtls-rehandshake-cert-2 (61230ms)
+- dtls-rehandshake-anon (61030ms)
+- mini-loss-time (60130ms)
+- mini-dtls-hello-verify-48 (30050ms)
+- tls12-ffdhe (27790ms)
+- x509sign-verify-rsa (18460ms)
+- x509sign-verify-ecdsa (16050ms)
+
+Disable the tests that take > 60000ms to avoid so many timeouts in qemur=
iscv64-ptest runs.
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16162
+[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16162#c19
+
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ tests/Makefile.am | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index f84b2f1..5f4d86e 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -161,7 +161,7 @@ ctests +=3D tls13-early-start
+=20
+ ctests +=3D tls13/no-auto-send-ticket
+=20
+-ctests +=3D mini-record-2 simple gnutls_hmac_fast set_pkcs12_cred cert =
certuniqueid tls-neg-ext-key \
++ctests +=3D simple gnutls_hmac_fast set_pkcs12_cred cert certuniqueid t=
ls-neg-ext-key \
+ 	 mpi certificate_set_x509_crl dn parse_ca x509-dn x509-dn-decode recor=
d-sizes \
+ 	 hostname-check cve-2008-4989 pkcs12_s2k chainverify missingissuer mis=
singissuer_aia record-sizes-range \
+ 	 crq_key_id x509sign-verify sign-verify cve-2009-1415 cve-2009-1416		\
+@@ -172,13 +172,13 @@ ctests +=3D mini-record-2 simple gnutls_hmac_fast =
set_pkcs12_cred cert certuniquei
+ 	 rng-fork mini-eagain-dtls resume-dtls empty_retrieve_function \
+ 	 tls13-rehandshake-cert gnutls_ext_raw_parse handshake-large-cert \
+ 	 x509cert x509cert-tl x509cert-ct infoaccess mini-dtls-hello-verify si=
gn-verify-ed25519-rfc8080 \
+-	 trustdb-tofu dtls-rehandshake-anon mini-alpn mini-dtls-large \
++	 trustdb-tofu mini-alpn mini-dtls-large \
+ 	 mini-termination mini-x509-cas mini-x509-2 pkcs12_simple \
+ 	 mini-emsgsize-dtls chainverify-unsorted mini-overhead tls12-ffdhe \
+ 	 mini-dtls-heartbeat mini-x509-callbacks key-openssl priorities priori=
ties-groups	\
+ 	 gnutls_x509_privkey_import gnutls_x509_crt_list_import time x509-serv=
er-verify \
+ 	 sign-verify-ext4 tls-neg-ext4-key resume-lifetime \
+-	 mini-dtls-srtp rsa-encrypt-decrypt mini-loss-time gnutls-strcodes \
++	 mini-dtls-srtp rsa-encrypt-decrypt gnutls-strcodes \
+ 	 mini-record mini-dtls-record handshake-timeout mini-record-range \
+ 	 cert-status rsa-psk global-init sec-params sign-verify-data \
+ 	 fips-test fips-override-test mini-global-load name-constraints x509-e=
xtensions \
+@@ -192,14 +192,14 @@ ctests +=3D mini-record-2 simple gnutls_hmac_fast =
set_pkcs12_cred cert certuniquei
+ 	 rsa-rsa-oaep rsa-rsa-pss \
+ 	 mini-dtls-fork mini-key-material x509cert-invalid \
+ 	 tls-ext-register tls-supplemental mini-dtls0-9 duplicate-extensions \
+-	 record-retvals mini-server-name tls-etm tls-force-etm x509-cert-callb=
ack alerts \
++	 mini-server-name tls-etm tls-force-etm x509-cert-callback alerts \
+ 	 client-sign-md5-rep tls12-invalid-key-exchanges session-rdn-read \
+ 	 tls13-cert-key-exchange x509-cert-callback-ocsp gnutls_ocsp_resp_list=
_import2 \
+ 	 server-sign-md5-rep privkey-keygen mini-tls-nonblock no-signal pkcs7-=
gen dtls-etm \
+ 	 x509sign-verify-rsa x509sign-verify-ecdsa x509sign-verify-gost \
+ 	 cipher-alignment oids atfork prf psk-file priority-init2 post-client-=
hello-change-prio \
+ 	 status-request status-request-ok rfc7633-missing sign-verify-ext \
+-	 fallback-scsv pkcs8-key-decode urls dtls-rehandshake-cert rfc7633-ok =
\
++	 fallback-scsv pkcs8-key-decode urls rfc7633-ok \
+ 	 key-usage-rsa key-usage-ecdhe-rsa mini-session-verify-function auto-v=
erify \
+ 	 record-timeouts mini-dtls-hello-verify-48 set-default-prio \
+ 	 tls12-anon-upgrade tlsext-decoding rsa-psk-cb gnutls-ids \
+@@ -214,7 +214,7 @@ ctests +=3D mini-record-2 simple gnutls_hmac_fast se=
t_pkcs12_cred cert certuniquei
+ 	 set_x509_key_file_der set_x509_pkcs12_key crt_apis tls12-cert-key-exc=
hange \
+ 	 tls11-cert-key-exchange tls10-cert-key-exchange ssl30-cert-key-exchan=
ge \
+ 	 dtls12-cert-key-exchange dtls10-cert-key-exchange x509-cert-callback-=
legacy \
+-	 keylog-env ssl2-hello tlsfeature-ext dtls-rehandshake-cert-2 dtls-ses=
sion-ticket-lost \
++	 keylog-env ssl2-hello tlsfeature-ext dtls-session-ticket-lost \
+ 	 tlsfeature-crt dtls-rehandshake-cert-3 resume-with-false-start \
+ 	 set_x509_key_file_ocsp client-fastopen rng-sigint srp \
+ 	 safe-renegotiation/srn0 safe-renegotiation/srn1 safe-renegotiation/sr=
n2 \
+@@ -230,7 +230,7 @@ ctests +=3D mini-record-2 simple gnutls_hmac_fast se=
t_pkcs12_cred cert certuniquei
+ 	 rng-no-onload dtls1-2-mtu-check crl_apis cert_verify_inv_utf8 no-exte=
nsions \
+ 	 no-status-request hostname-check-utf8 pkcs8-key-decode-encrypted prio=
rity-mix pkcs7 \
+ 	 send-data-before-handshake recv-data-before-handshake crt_inv_write \
+-	 x509sign-verify-error rng-op-nonce rng-op-random rng-op-key x509-dn-d=
ecode-compat \
++	 x509sign-verify-error x509-dn-decode-compat \
+ 	 ip-check mini-x509-ipaddr trust-store base64-raw random-art dhex509se=
lf \
+ 	 dss-sig-val sign-pk-api tls-session-ext-override record-pad \
+ 	 tls13-server-kx-neg gnutls_ext_raw_parse_dtls key-export-pkcs8 \
+--=20
+2.39.5
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.13.bb b/meta/recipes-=
support/gnutls/gnutls_3.8.13.bb
index 9c8c994bdc..ff1c3e661e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.13.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
@@ -27,6 +27,10 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v=
${SHRT_VER}/gnutls-${PV}.tar
            file://0001-tests-mini-dtls-framents-link-to-gnulib.patch \
            "
=20
+SRC_URI:append:riscv64 =3D "\
+    file://0001-tests-Makefile.am-disable-slow-test-cases-in-RISCV64.pat=
ch \
+"
+
 SRC_URI[sha256sum] =3D "ffed8ec1bf09c2426d4f14aae377de4753b53e537d685e60=
4e99a8b16ca9c97e"
=20
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
--=20
2.55.0


