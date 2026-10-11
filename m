Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAC2CA9ED8
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:29 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23570.1791708079561204948
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PqXbb8pS;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso9942105e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708078; x=1792312878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qL3nLJSnGHZru/zl4WhEf0m8H66p9ladY4CHXDt42Yo=;
        b=PqXbb8pSbz9W0gbrI4iSdPeBC4J9PEtZnnPpDZeRODTHy5odYNbzPrN/2L0gd26VVU
         BaxlSmEiVwVkP3j9Zj8rau6xQstr2TPlDpvuUs5Tf/E90NTpvL/sNSfh6Vt0u563t7ga
         vM9pvKvR3HzL7AVhQeZLjA439Wl4AgNl8vYGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708078; x=1792312878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qL3nLJSnGHZru/zl4WhEf0m8H66p9ladY4CHXDt42Yo=;
        b=dqFaX9rPpkU+NczyFiapKgiyO2n9LtdrWmagRKuf497wt4EHwUnUCBW4T02/fsk7w+
         D6uKA/yojRbJPHpioFr1mDfYIQHN2oe196heD4ZtwavivpL4w1A57K1Z0y/rdTpeNdzt
         SxM6M9W2ejL4uisG+6QEfIgZYSp3HuvsGhjf/8Z5X/Yw2vItZy1AeZhQubIxxghFNfH2
         fB7sOsD5Iy8IerorLZfAjFo3Fv2CTzhtGUzTqx/oTcRhSBomwgu4Ig1P6jrfeHm2q1Yg
         h+dNfW51LgwFDFo1fZDA478Ha0OE/VDKG1l7vKYjXuP1UHD+lqGiWce3zOXxeSYqkmSd
         ERwg==
X-Gm-Message-State: AFq9FYIIcVjRVbGipICMi2LpjRUXvjmOPVUxP3i5FgLcrgntk/JggyHh
	A418ah/8zqgxgFtGuHVMaxxg75VIpG63RKvTnr1Gl8T9KUjYuYmLo2cA0qmhZPIVyF0i91TOFPy
	bK9bUfls=
X-Gm-Gg: AYBFou3Flg/JrM6jV/qgFkKSjEQoeYklTaIgHnp91MFj5c7cOU6rNtmV/GlzxcO9Mt2
	Aru8pE9datUXWXO8ifrIU8Vi4pkXPcPIeX4eMBZdUgOJuLLr42WL9xRpFKqI55pHpicpDtgTVlE
	2lgRn4HM0EWxMr23uFNyMELR8CNldJc+0VCk5gbWd4/VnP0ZsFJ344qNqgXBVw75/0huYl4ov7y
	xL+bt/k/gH0vVjnYWSPXbDz9P64KgAf/b5yE08PT2DvxvjFi+YlLcfQ4Zb83aoQHA2CMJlbfLae
	ty/QCcKJyUNAlFM6z1QUAHYUrgM/ZGxaLjIWoYkqWasL3JgqWNM6Q8WYzZrhPbHhk+O/c9uHvq8
	JXkK76bZAf6ILpztVR71wh7jsXzYdSudqEiVAZoWwOe8LbhKe/9ghm6ZGYiEg7VW8FHZjX8UUSg
	dkcbFuIn8BDHEjvAH8U+jsRThKszpGlZ45a56WJK1huaP/5K1/Ulqfrg9zhXaoUck7lZyodTRjM
	oFl808UDFYkAc906q2kJ5d6dQh1c9zMUW9MDcoFG/Ki3xO8WGmowRcs2cnNYZbCcWBrg/O5dw==
X-Received: by 2002:a05:600c:4709:b0:4a1:7baa:7303 with SMTP id 5b1f17b1804b1-4a18e4a5237mr123297365e9.7.1791708076844;
        Sun, 11 Oct 2026 01:41:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 26/60] gnutls: fix CVE-2026-5260
Date: Sun, 11 Oct 2026 10:39:59 +0200
Message-ID: <4ad1fb8b7d674369ab50bcc12678ecac9891748b.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247535

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
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |  2 +
 3 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p2.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p1.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p1.patch
new file mode 100644
index 00000000000..c5ab814031e
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
+index 4d18132..496c378 100644
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
+index cc92b4a..dba4011 100644
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
index 00000000000..67154164c52
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
+index 568474e..e133c49 100644
+--- a/lib/pkcs11_privkey.c
++++ b/lib/pkcs11_privkey.c
+@@ -838,7 +838,7 @@ int _gnutls_pkcs11_privkey_decrypt_data2(gnutls_pkcs11_privkey_t key,
+ 	if (ret != 0)
+ 		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
+ 
+-	buffer = gnutls_malloc(siglen);
++	buffer = gnutls_malloc(MAX((size_t)siglen, plaintext_size));
+ 	if (!buffer) {
+ 		gnutls_assert();
+ 		return GNUTLS_E_MEMORY_ERROR;
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index c9ec3b08f96..069e3f447b6 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -49,6 +49,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-42013.patch \
            file://CVE-2026-42014.patch \
            file://CVE-2026-42015.patch \
+           file://CVE-2026-5260_p1.patch \
+           file://CVE-2026-5260_p2.patch \
            "
 
 SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"

