Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55AB1CA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 18:56:30 +0000 (UTC)
Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63550.1790615047887975869
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=grvXdcsC;
 spf=pass (domain: baylibre.com, ip: 74.125.230.232, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk2-f40.google.com with SMTP id af79cd13be357-93c5ce9914dso216133485a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 10:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790615047; x=1791219847; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5fax+g4/C1VkhqieIAtGwRxAPfWy2r9+IUvdDHvOzxk=;
        b=grvXdcsCGcJyiyFm79Iq6rPofLJJcehnye9FAfC5GKcRxEpqP/vCYJ/j52fkB0d6bf
         8XUdkB2hMNVjjGayz/Q1XLr1UdeD4WzCnMEtWOJWjeAfrRqp3nknL0OSy5WASzCTZxY1
         UTxO6dh2RgQJG1YpT5IIs5yWnS7irAxXBrfqInPh+l1OwEIOjAnbzAbRc1ucJFSVrdUc
         64Q4CR8T5deotwS9CS2aJZ4DzRCeCRcIUHrX1RLpxrzd79IPKAMl+ZoDVEneqJ4P7Joo
         jBRuTxWSJxBRiQAHeifjo+mToyTP1vhG0QlnVDqCgkG5yWvsXNCL0dki1FsDkBsnRfh+
         CqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615047; x=1791219847;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5fax+g4/C1VkhqieIAtGwRxAPfWy2r9+IUvdDHvOzxk=;
        b=b1ab3K9+cCZlXVUiv/JQ96iHK7NKI1eW8lchRsdAJp/CaeDZKCO+AnpyNhldYL902X
         8FNLZH7/btkRILybyuE0nWIRw0XCZKWXrXhOdZaqq1XNOj2C+9OX84BpgLzpn9iFxrMy
         Qg7Pzvzm/QK0tCc/mBL3K21tlEm4ZlOtnBK169bnsvlAMKikLgDHKOzd1C7l0Xbrln0X
         XxglvQ6xOEDDWTd8fMukzgdap/P2JVvZoj+7Uo8+/XMNzzTLzhvnYdemRv+IQFg7akKv
         BHxjpgS0bx18QxbpJGHSA2z3AF3VCgpodIWuwCo5Eg1iuR64cJfrQ9D2eOemKyV8byjY
         f0pQ==
X-Forwarded-Encrypted: i=1; AKwUvByNQCYdUN0Q02NrqLrAe5gzF8T/d0s6bhPIRYaQKlxcK+nMuaFCErbMoZeeKNWk2DoGG8W9d2YubYVwyLU6ush6jA==@lists.openembedded.org
X-Gm-Message-State: AFuF++nVil39KbUnyWchRnFWNaoEe22bmQaPfMuE3JQ0JuyJQnwJN+2s
	ADYe4SrEQf7ZE1FZcbE7EVoCCKfafRfBE5dxpJztv8KK3UICOaSZyO97FCXBdirXht5hI5crS5t
	Jhkoc
X-Gm-Gg: AYBFou0M/YXs/34P4jYOw9ynIWzXmHe+zF8JL6Lg5+EmhQV7wN3ele/uE4s77jgNnhC
	8sQDWbX/fAytHgB5knbAEZyVXQY8ZpsbBJWgCguJqUvtnuh8usdV9mTgSMuepZB8Um92EMdfiqa
	nYLJQfaKd4OrqBH1LwA5Gv4Xo8qvjOb6VZ4d1EQ8q+d3gHW92jLnDfR8oyKw1uVa6TI1OItEwoW
	XlFf79PhN8lvmCIHwsz0fbE07F6CK1+puIsmi9OrgORntkmGnS1xtWM1PGRxcnRXHbQuziV7rqC
	QMpFnDQzsrXiw0T8/upUadB98nqNeN72ZYl5d3CrZh36fxU+bCSwkoCou3kL+WqMUkVzm57hGJS
	zrWN4YZrn3V9/Hu2uexq6J56y4QivCx41+O7DlW9Z9Q3addmXghVGlcVQS/p3H4MDzjR+FopgLy
	5zuqKoXI4kMAJpG1jLtpcXCGg1XP1LnbJVbMM79djpiabT33ySNQALQ0XNFOYq2S9y0R44Qg2UJ
	gLvslcjTUfZIfF7xtTbbX8ch+0kR1MjZRgpexQw6gt+
X-Received: by 2002:a05:620a:7083:b0:939:6c31:2318 with SMTP id af79cd13be357-93c43ca0f85mr2159002885a.34.1790615046462;
        Mon, 28 Sep 2026 10:04:06 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914309a5917sm84653406d6.4.2026.09.28.10.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:04:05 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 28 Sep 2026 13:04:03 -0400
Message-Id: <DLR4232VEGLK.D4805FQMYD9Z@baylibre.com>
To: =?utf-8?q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Subject: Re: [PATCH v2 1/1] recipes-support/gnutls: disable slow tests for RISCV64
Cc: <thomas.petazzoni@bootlin.com>, <tgamblin@baylibre.com>
X-Mailer: aerc 0.22.0
References: <20260928162614.1685239-1-joaomarcos.costa@bootlin.com>
 <20260928162614.1685239-2-joaomarcos.costa@bootlin.com>
In-Reply-To: <20260928162614.1685239-2-joaomarcos.costa@bootlin.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 18:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246786

On Mon Sep 28, 2026 at 12:26 PM EDT, Jo=C3=A3o Marcos Costa wrote:
> Timeouts have been observed (very frequently in the past weeks)
> in the autobuilder, and a bug [1] was filed at Bugzilla.
>
> After some investigation [2] was performed by Trevor Gamblin, we now have=
 a
> list of the most time consuming test cases:
>
> - mini-record-2 (187880ms)
> - record-retvals (145390ms)
> - rng-op-key (63820ms)
> - rng-op-random (63330ms)
> - rng-op-nonce (63260ms)
> - dtls-rehandshake-cert (61360ms)
> - dtls-rehandshake-cert-2 (61230ms)
> - dtls-rehandshake-anon (61030ms)
> - mini-loss-time (60130ms)
> - mini-dtls-hello-verify-48 (30050ms)
> - tls12-ffdhe (27790ms)
> - x509sign-verify-rsa (18460ms)
> - x509sign-verify-ecdsa (16050ms)
>
> Disable them to avoid so many timeouts in qemuriscv64-ptest runs.

Thanks for submitting this. I'm sorry if I wasn't clear before, but I think=
 we
should only disable mini-record-2 and record-retvals to start, since they a=
re
significantly longer than all of the others. If gnutls remains a problem
afterward then the others should be considered, but for now we want to try
retaining the others to maximize test coverage.

Trevor
>
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16162
> [2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16162#c19
>
> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>  ...m-disable-slow-test-cases-in-RISCV64.patch | 109 ++++++++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.8.13.bb  |   4 +
>  2 files changed, 113 insertions(+)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-Makefil=
e.am-disable-slow-test-cases-in-RISCV64.patch
>
> diff --git a/meta/recipes-support/gnutls/gnutls/0001-tests-Makefile.am-di=
sable-slow-test-cases-in-RISCV64.patch b/meta/recipes-support/gnutls/gnutls=
/0001-tests-Makefile.am-disable-slow-test-cases-in-RISCV64.patch
> new file mode 100644
> index 0000000000..6dbd165658
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/0001-tests-Makefile.am-disable-s=
low-test-cases-in-RISCV64.patch
> @@ -0,0 +1,109 @@
> +From a27faed63722263f5ae8e2b7fac564de3a65fda1 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D <joaomarcos.cos=
ta@bootlin.com>
> +Date: Mon, 28 Sep 2026 15:56:37 +0000
> +Subject: [PATCH] tests/Makefile.am: disable slow test cases in RISCV64
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Timeouts have been observed (very frequently in the past weeks)
> +in the autobuilder, and a bug [1] was filed at Bugzilla.
> +
> +After some investigation [2] was performed by Trevor Gamblin, we now hav=
e a
> +list of the most time consuming test cases:
> +
> +- mini-record-2 (187880ms)
> +- record-retvals (145390ms)
> +- rng-op-key (63820ms)
> +- rng-op-random (63330ms)
> +- rng-op-nonce (63260ms)
> +- dtls-rehandshake-cert (61360ms)
> +- dtls-rehandshake-cert-2 (61230ms)
> +- dtls-rehandshake-anon (61030ms)
> +- mini-loss-time (60130ms)
> +- mini-dtls-hello-verify-48 (30050ms)
> +- tls12-ffdhe (27790ms)
> +- x509sign-verify-rsa (18460ms)
> +- x509sign-verify-ecdsa (16050ms)
> +
> +Disable them to avoid so many timeouts in qemuriscv64-ptest runs.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +
> +[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16162
> +[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16162#c19
> +
> +Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> +---
> + tests/Makefile.am | 20 ++++++++++----------
> + 1 file changed, 10 insertions(+), 10 deletions(-)
> +
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index f84b2f1..b03e570 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -161,7 +161,7 @@ ctests +=3D tls13-early-start
> +=20
> + ctests +=3D tls13/no-auto-send-ticket
> +=20
> +-ctests +=3D mini-record-2 simple gnutls_hmac_fast set_pkcs12_cred cert =
certuniqueid tls-neg-ext-key \
> ++ctests +=3D simple gnutls_hmac_fast set_pkcs12_cred cert certuniqueid t=
ls-neg-ext-key \
> + 	 mpi certificate_set_x509_crl dn parse_ca x509-dn x509-dn-decode recor=
d-sizes \
> + 	 hostname-check cve-2008-4989 pkcs12_s2k chainverify missingissuer mis=
singissuer_aia record-sizes-range \
> + 	 crq_key_id x509sign-verify sign-verify cve-2009-1415 cve-2009-1416		\
> +@@ -172,13 +172,13 @@ ctests +=3D mini-record-2 simple gnutls_hmac_fast =
set_pkcs12_cred cert certuniquei
> + 	 rng-fork mini-eagain-dtls resume-dtls empty_retrieve_function \
> + 	 tls13-rehandshake-cert gnutls_ext_raw_parse handshake-large-cert \
> + 	 x509cert x509cert-tl x509cert-ct infoaccess mini-dtls-hello-verify si=
gn-verify-ed25519-rfc8080 \
> +-	 trustdb-tofu dtls-rehandshake-anon mini-alpn mini-dtls-large \
> ++	 trustdb-tofu mini-alpn mini-dtls-large \
> + 	 mini-termination mini-x509-cas mini-x509-2 pkcs12_simple \
> +-	 mini-emsgsize-dtls chainverify-unsorted mini-overhead tls12-ffdhe \
> ++	 mini-emsgsize-dtls chainverify-unsorted mini-overhead \
> + 	 mini-dtls-heartbeat mini-x509-callbacks key-openssl priorities priori=
ties-groups	\
> + 	 gnutls_x509_privkey_import gnutls_x509_crt_list_import time x509-serv=
er-verify \
> + 	 sign-verify-ext4 tls-neg-ext4-key resume-lifetime \
> +-	 mini-dtls-srtp rsa-encrypt-decrypt mini-loss-time gnutls-strcodes \
> ++	 mini-dtls-srtp rsa-encrypt-decrypt gnutls-strcodes \
> + 	 mini-record mini-dtls-record handshake-timeout mini-record-range \
> + 	 cert-status rsa-psk global-init sec-params sign-verify-data \
> + 	 fips-test fips-override-test mini-global-load name-constraints x509-e=
xtensions \
> +@@ -192,16 +192,16 @@ ctests +=3D mini-record-2 simple gnutls_hmac_fast =
set_pkcs12_cred cert certuniquei
> + 	 rsa-rsa-oaep rsa-rsa-pss \
> + 	 mini-dtls-fork mini-key-material x509cert-invalid \
> + 	 tls-ext-register tls-supplemental mini-dtls0-9 duplicate-extensions \
> +-	 record-retvals mini-server-name tls-etm tls-force-etm x509-cert-callb=
ack alerts \
> ++	 mini-server-name tls-etm tls-force-etm x509-cert-callback alerts \
> + 	 client-sign-md5-rep tls12-invalid-key-exchanges session-rdn-read \
> + 	 tls13-cert-key-exchange x509-cert-callback-ocsp gnutls_ocsp_resp_list=
_import2 \
> + 	 server-sign-md5-rep privkey-keygen mini-tls-nonblock no-signal pkcs7-=
gen dtls-etm \
> +-	 x509sign-verify-rsa x509sign-verify-ecdsa x509sign-verify-gost \
> ++	 x509sign-verify-gost \
> + 	 cipher-alignment oids atfork prf psk-file priority-init2 post-client-=
hello-change-prio \
> + 	 status-request status-request-ok rfc7633-missing sign-verify-ext \
> +-	 fallback-scsv pkcs8-key-decode urls dtls-rehandshake-cert rfc7633-ok =
\
> ++	 fallback-scsv pkcs8-key-decode urls rfc7633-ok \
> + 	 key-usage-rsa key-usage-ecdhe-rsa mini-session-verify-function auto-v=
erify \
> +-	 record-timeouts mini-dtls-hello-verify-48 set-default-prio \
> ++	 record-timeouts set-default-prio \
> + 	 tls12-anon-upgrade tlsext-decoding rsa-psk-cb gnutls-ids \
> + 	 rehandshake-switch-cert rehandshake-switch-cert-allow rehandshake-swi=
tch-cert-client \
> + 	 rehandshake-switch-cert-client-allow handshake-versions dtls-handshak=
e-versions \
> +@@ -214,7 +214,7 @@ ctests +=3D mini-record-2 simple gnutls_hmac_fast se=
t_pkcs12_cred cert certuniquei
> + 	 set_x509_key_file_der set_x509_pkcs12_key crt_apis tls12-cert-key-exc=
hange \
> + 	 tls11-cert-key-exchange tls10-cert-key-exchange ssl30-cert-key-exchan=
ge \
> + 	 dtls12-cert-key-exchange dtls10-cert-key-exchange x509-cert-callback-=
legacy \
> +-	 keylog-env ssl2-hello tlsfeature-ext dtls-rehandshake-cert-2 dtls-ses=
sion-ticket-lost \
> ++	 keylog-env ssl2-hello tlsfeature-ext dtls-session-ticket-lost \
> + 	 tlsfeature-crt dtls-rehandshake-cert-3 resume-with-false-start \
> + 	 set_x509_key_file_ocsp client-fastopen rng-sigint srp \
> + 	 safe-renegotiation/srn0 safe-renegotiation/srn1 safe-renegotiation/sr=
n2 \
> +@@ -230,7 +230,7 @@ ctests +=3D mini-record-2 simple gnutls_hmac_fast se=
t_pkcs12_cred cert certuniquei
> + 	 rng-no-onload dtls1-2-mtu-check crl_apis cert_verify_inv_utf8 no-exte=
nsions \
> + 	 no-status-request hostname-check-utf8 pkcs8-key-decode-encrypted prio=
rity-mix pkcs7 \
> + 	 send-data-before-handshake recv-data-before-handshake crt_inv_write \
> +-	 x509sign-verify-error rng-op-nonce rng-op-random rng-op-key x509-dn-d=
ecode-compat \
> ++	 x509sign-verify-error x509-dn-decode-compat \
> + 	 ip-check mini-x509-ipaddr trust-store base64-raw random-art dhex509se=
lf \
> + 	 dss-sig-val sign-pk-api tls-session-ext-override record-pad \
> + 	 tls13-server-kx-neg gnutls_ext_raw_parse_dtls key-export-pkcs8 \
> diff --git a/meta/recipes-support/gnutls/gnutls_3.8.13.bb b/meta/recipes-=
support/gnutls/gnutls_3.8.13.bb
> index 9c8c994bdc..ff1c3e661e 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.8.13.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
> @@ -27,6 +27,10 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v=
${SHRT_VER}/gnutls-${PV}.tar
>             file://0001-tests-mini-dtls-framents-link-to-gnulib.patch \
>             "
> =20
> +SRC_URI:append:riscv64 =3D "\
> +    file://0001-tests-Makefile.am-disable-slow-test-cases-in-RISCV64.pat=
ch \
> +"
> +
>  SRC_URI[sha256sum] =3D "ffed8ec1bf09c2426d4f14aae377de4753b53e537d685e60=
4e99a8b16ca9c97e"
> =20
>  inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest



