Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092F9CCA463
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:03:52 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32816.1792040622715764544
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Zua/sf6N;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1ad2e2391so18762495e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040621; x=1792645421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OQxF8e3E/eKlsMra0h2EfckzilfN9n23pV25fI8zgys=;
        b=Zua/sf6Nkadi3ZgKbc6e3umFs8AeBPYV+tijeRXO2DJmpUpLFeVhI5es1xHg+JbrIa
         e7rHpDZc49Flek8DCLspwasXbIlhjqW1fxS9lUGSHbgy4QFsDrjV50vUZiDtFIF+sHzJ
         StMUxPvhrG+W8oN21I5DHAo3xkfPoUxGiMw9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040621; x=1792645421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OQxF8e3E/eKlsMra0h2EfckzilfN9n23pV25fI8zgys=;
        b=TdB8V6qrGk+qd8Xr7/7YTLSQF8cMO4V2scVEQ+y3mTjMak3cu5m2ugsJiBLLfRHzg0
         60RaIgMVgPpG/xP5lceKC0l9ZYA8bEY+CnRgO2EIef1kv/U0hO7PdrYp/txT93nFWuFV
         RynQAh0sN2t21k8rONDnfir3TVkO1s9oOb0bATjAv/6vlrnbHl80/C+I4Xl6Cpi1la8h
         dm5OTNrKPX4LQCcWeE7HExwCZKzhgoQaiWV0GiKs5GmnBPJLhBfBN/61eSm+Mbt/URrp
         zwgVJjjLJvPCvM2qBOyF0wN8IXrroYbaoFStgpEji4XVUCh2oWH4t5dE9Trtm6GIwLJE
         e2Kw==
X-Gm-Message-State: AFq9FYISuVazzIsf8o+HUqvC5FZmR/WvgogPne2+iG9/NTW2/P3dvsYC
	zsBXIB9Sba5UTsTgc/ikYZAZiPn4hZL8uM0B71G6HhYeBkuQ9UYmAFhVZAjMkvhwarhEhrAyIlg
	4rQijTAo=
X-Gm-Gg: AYBFou3bOJfM/9Xqmg3wCdJp1vhzPsseQUCwvtRSP84Hzqu/N5ZZtS4mp+arOGlvWk8
	V/m2XDNyVuOubt83BtEIDSgFPUMldhuU9dVnKa4aDN8qWqHlB3GkS0qBpIaeemY/YdMa/JEUq3t
	T/awMOhQGNjoK6E1jYEt/J2dmeBs31x+Q/9KqyUAWvW21tNumJhNhL8ryLH5UOpjJrYvQl5SH/H
	ShBQ+NB82q5VoAijNpOW7t5sYYwq0BZWN6p1VcIFqQpY1c+9zWRfLCVyJ8OxmBZkhBzuV3w5ttT
	RjwqaFzARtgVKuVz3B5kxkkeEXymTaRjqAucZvgckt/hoDVGccr9MYFFpQRbwFsiGE1eoISColR
	L51MFqFYJS6EhUsXoB8viNSgas0amCaDJ56I5lODWcS/n1P0L5EJyXEc74XHhepQUIurE0kFTpx
	eTCSzzMOZ0O78rYWj4dS5QcsliB5vx4T9yv6TljC0+hRJik8wr9pTb0UExxvl6xsNQXyEhcfliE
	6QhR9pATGSXalzaVDIxKc9rBfi9LTbbmYRX24Y+h/6ChjlpPIeaV1fxyuHpTXONa/AdiECFXw==
X-Received: by 2002:a05:600c:4e11:b0:4a1:7f41:b9dc with SMTP id 5b1f17b1804b1-4a18e4d67famr352213065e9.23.1792040620878;
        Wed, 14 Oct 2026 22:03:40 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/55] gnutls: fix CVE-2026-5260
Date: Thu, 15 Oct 2026 07:02:29 +0200
Message-ID: <dd6c9c2852d112597eccf5d14e4368ac4c49967c.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247804

From: Jakub Szczudlo (Nokia) <jakub.szczudlo@nokia.com>

Backport patch to fix CVE-2026-5260.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-5260

Upstream fix:
  https://gitlab.com/gnutls/gnutls/-/commit/77228f2d1ac207d2f894e5a168fbb47e5378e42f
  https://gitlab.com/gnutls/gnutls/-/commit/cf6bdc5e4df49e5583d3fb4d2296779785f10683

Tested with ptest

Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnutls/gnutls/CVE-2026-5260_p1.patch      | 69 +++++++++++++++++++
 .../gnutls/gnutls/CVE-2026-5260_p2.patch      | 33 +++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  2 +
 3 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p2.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p1.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p1.patch
new file mode 100644
index 00000000000..f7e6f978b1a
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p1.patch
@@ -0,0 +1,69 @@
+From 77228f2d1ac207d2f894e5a168fbb47e5378e42f Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Mon, 30 Mar 2026 17:31:07 +0200
+Subject: [PATCH] lib/auth/rsa: check that ciphertext matches the modulus size
+
+A client sending extremely short premaster secret as part of an
+RSA key exchange could've theoretically triggered a short heap overread
+to nowhere when the RSA key was backed with a PKCS#11 token.
+With this fix, the internal decryption function will not be called
+with an mismatching plaintext length specified, avoiding the overread.
+
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1814
+Fixes: CVE-2026-5260
+Fixes: GNUTLS-SA-2026-04-29-10
+CVSS: 5.9 Medium CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:N/A:H
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+CVE: CVE-2026-5260
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/77228f2d1ac207d2f894e5a168fbb47e5378e42f]
+
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
+---
+diff --git a/lib/auth/rsa.c b/lib/auth/rsa.c
+index b5ecc09..24c1649 100644
+--- a/lib/auth/rsa.c
++++ b/lib/auth/rsa.c
+@@ -158,6 +158,7 @@ static int proc_rsa_client_kx(gnutls_session_t session, uint8_t *data,
+ 	int ret, dsize;
+ 	ssize_t data_size = _data_size;
+ 	volatile uint8_t ver_maj, ver_min;
++	unsigned int key_bits;
+ 
+ #ifdef ENABLE_SSL3
+ 	if (get_num_version(session) == GNUTLS_SSL3) {
+@@ -180,6 +181,10 @@ static int proc_rsa_client_kx(gnutls_session_t session, uint8_t *data,
+ 		}
+ 		ciphertext.size = dsize;
+ 	}
++	gnutls_privkey_get_pk_algorithm(session->internals.selected_key,
++					&key_bits);
++	if (ciphertext.size != (key_bits + 7) / 8)
++		return gnutls_assert_val(GNUTLS_E_DECRYPTION_FAILED);
+ 
+ 	ver_maj = _gnutls_get_adv_version_major(session);
+ 	ver_min = _gnutls_get_adv_version_minor(session);
+diff --git a/lib/auth/rsa_psk.c b/lib/auth/rsa_psk.c
+index 399fb4d..7a99d87 100644
+--- a/lib/auth/rsa_psk.c
++++ b/lib/auth/rsa_psk.c
+@@ -257,6 +257,7 @@ static int _gnutls_proc_rsa_psk_client_kx(gnutls_session_t session,
+ 	ssize_t data_size = _data_size;
+ 	gnutls_psk_server_credentials_t cred;
+ 	volatile uint8_t ver_maj, ver_min;
++	unsigned int rsa_key_bits;
+ 
+ 	cred = (gnutls_psk_server_credentials_t)_gnutls_get_cred(
+ 		session, GNUTLS_CRD_PSK);
+@@ -313,6 +314,10 @@ static int _gnutls_proc_rsa_psk_client_kx(gnutls_session_t session,
+ 		return GNUTLS_E_UNEXPECTED_PACKET_LENGTH;
+ 	}
+ 	ciphertext.size = dsize;
++	gnutls_privkey_get_pk_algorithm(session->internals.selected_key,
++					&rsa_key_bits);
++	if (ciphertext.size != (rsa_key_bits + 7) / 8)
++		return gnutls_assert_val(GNUTLS_E_DECRYPTION_FAILED);
+ 
+ 	ver_maj = _gnutls_get_adv_version_major(session);
+ 	ver_min = _gnutls_get_adv_version_minor(session);
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p2.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p2.patch
new file mode 100644
index 00000000000..fd94c64b6c4
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p2.patch
@@ -0,0 +1,33 @@
+From cf6bdc5e4df49e5583d3fb4d2296779785f10683 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Mon, 30 Mar 2026 17:46:40 +0200
+Subject: [PATCH] lib/pkcs11_privkey: guard against overreading on short
+ ciphertexts
+
+This is an alternative fix for the callee side.
+
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1814
+Fixes: CVE-2026-5260
+Fixes: GNUTLS-SA-2026-04-29-10
+CVSS: 5.9 Medium CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:N/A:H
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+CVE: CVE-2026-5260
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/cf6bdc5e4df49e5583d3fb4d2296779785f10683]
+
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
+---
+diff --git a/lib/pkcs11_privkey.c b/lib/pkcs11_privkey.c
+index 5093a6d..369b034 100644
+--- a/lib/pkcs11_privkey.c
++++ b/lib/pkcs11_privkey.c
+@@ -826,7 +826,7 @@ int _gnutls_pkcs11_privkey_decrypt_data2(gnutls_pkcs11_privkey_t key,
+ 	if (ret != 0)
+ 		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
+ 
+-	buffer = gnutls_malloc(siglen);
++	buffer = gnutls_malloc(MAX((size_t)siglen, plaintext_size));
+ 	if (!buffer) {
+ 		gnutls_assert();
+ 		return GNUTLS_E_MEMORY_ERROR;
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index bb9bc0af05d..7f7f9c9c05f 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -60,6 +60,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-42013.patch \
            file://CVE-2026-42014.patch \
            file://CVE-2026-42015.patch \
+           file://CVE-2026-5260_p1.patch \
+           file://CVE-2026-5260_p2.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"

