Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C08CC48286
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 14:21:12 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.17193.1706278869195388433
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 06:21:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=L9ODkNhF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d74678df08so2542285ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 06:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706278868; x=1706883668; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBb6jNJO9HC+B8JPixEcnxMW7PzYawT7hGndNknGVWE=;
        b=L9ODkNhFkaAvGV42Cd+i33WfmmEnmgz3cYba60065Sx3AKv5eGwYBCjExsQbDCABNX
         oTJIE1SvpjG+WH7OmALH1+UsMW2pYEer4lSkykEbXogmCX2eiIhaK+SwDZ8gqFsWXqfg
         /IUOMXqFHfZuUN/jM/arZ2enXJrFLNn/GDcZS0hSgFt9bEu1ARE29EFKBf4PPMsH1jQ0
         SUeT32i/7t7zscBMyFLrcE6Ocvl6r4FUxm8uLVJvSglalspWfooLmP4hrMFxQujisW5E
         qf6DjQk+q+619cXp13ePDEvX6o009q2Ucklv5CvXuk4Ft3zvbD0RVR5113yke7e0EFoL
         MxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706278868; x=1706883668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBb6jNJO9HC+B8JPixEcnxMW7PzYawT7hGndNknGVWE=;
        b=vpDkpWd5zTyz+AU1lVzzHUb66pgzZDs9TUTsAEQXaUFTd6fMfrQ5AkDjVArnJ3CqwU
         6W7Y6A/cVoBWxKcMGhGcOamFBnCZ9KQKuT/U1jvwsxMO67mwJNOhor23UdKrZ20rSP9n
         j+VMfVJCIvY9TT8RwK/AlL7mIjT5fYxvjAIFpNYjDJSfZDfUyk2h6mUHtgwGTVF2bqSw
         +dYYzZjUJXgs+ekiC//pAya7l4LCtjUjF+iZ4XUyDXyZ9dc3+Jpf3mQNE/L8H4h7Y2rB
         PCMpbejKKhGiw8vjynng2VY0mrr10j15hOP7MslqZ0klHkPT1/bGwUC6f5wroFjy4PA1
         N8/w==
X-Gm-Message-State: AOJu0YysM1V94lq/kq8akn/NdsPfuI6G7cwCEOfqSF9sLZ5mSJBuQp+P
	pPuCssxmbqZZi+fU971n7nbvE4CcRDjyBQv/Jnss9cfs/LPr6ACTyZZNGlU0xawzeaO3ipnOGYA
	A6mo=
X-Google-Smtp-Source: AGHT+IE+qC5LBr93Z7B4fypbMvctfTHxbmJMyNvrFGDaCdiCJYaKXfUyJXnB7vl1Yg+jePNyzEm5dA==
X-Received: by 2002:a17:902:c403:b0:1d7:4d4f:db24 with SMTP id k3-20020a170902c40300b001d74d4fdb24mr1354842plk.0.1706278867759;
        Fri, 26 Jan 2024 06:21:07 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id rr14-20020a17090b2b4e00b0029095a896c8sm1136458pjb.40.2024.01.26.06.21.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 06:21:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/8] gnutls: Backport fix for CVE-2024-0553
Date: Fri, 26 Jan 2024 04:20:37 -1000
Message-Id: <a07cc0b6fa4a485f318fd2957e434b63f5907d7e.1706278642.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706278642.git.steve@sakoman.com>
References: <cover.1706278642.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 14:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194378

From: Vijay Anusuri <vanusuri@mvista.com>

CVE-2024-0553
A vulnerability was found in GnuTLS. The response times to malformed ciphertexts in RSA-PSK ClientKeyExchange differ from response times of ciphertexts with correct PKCS#1 v1.5 padding. This issue may allow a remote attacker to perform a timing side-channel attack in the RSA-PSK key exchange, potentially leading to the leakage of sensitive data. CVE-2024-0553 is designated as an incomplete resolution for CVE-2023-5981.

Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/40dbbd8de499668590e8af51a15799fbc430595e]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnutls/gnutls/CVE-2024-0553.patch         | 125 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb  |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2024-0553.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2024-0553.patch b/meta/recipes-support/gnutls/gnutls/CVE-2024-0553.patch
new file mode 100644
index 0000000000..f15c470879
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2024-0553.patch
@@ -0,0 +1,125 @@
+From 40dbbd8de499668590e8af51a15799fbc430595e Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Wed, 10 Jan 2024 19:13:17 +0900
+Subject: [PATCH] rsa-psk: minimize branching after decryption
+
+This moves any non-trivial code between gnutls_privkey_decrypt_data2
+and the function return in _gnutls_proc_rsa_psk_client_kx up until the
+decryption.  This also avoids an extra memcpy to session->key.key.
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/40dbbd8de499668590e8af51a15799fbc430595e]
+CVE: CVE-2024-0553
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/auth/rsa_psk.c | 68 ++++++++++++++++++++++++----------------------
+ 1 file changed, 35 insertions(+), 33 deletions(-)
+
+diff --git a/lib/auth/rsa_psk.c b/lib/auth/rsa_psk.c
+index 93c2dc9..c6cfb92 100644
+--- a/lib/auth/rsa_psk.c
++++ b/lib/auth/rsa_psk.c
+@@ -269,7 +269,6 @@ _gnutls_proc_rsa_psk_client_kx(gnutls_session_t session, uint8_t * data,
+ 	int ret, dsize;
+ 	ssize_t data_size = _data_size;
+ 	gnutls_psk_server_credentials_t cred;
+-	gnutls_datum_t premaster_secret = { NULL, 0 };
+ 	volatile uint8_t ver_maj, ver_min;
+ 
+ 	cred = (gnutls_psk_server_credentials_t)
+@@ -329,24 +328,48 @@ _gnutls_proc_rsa_psk_client_kx(gnutls_session_t session, uint8_t * data,
+ 	ver_maj = _gnutls_get_adv_version_major(session);
+ 	ver_min = _gnutls_get_adv_version_minor(session);
+ 
+-	premaster_secret.data = gnutls_malloc(GNUTLS_MASTER_SIZE);
+-	if (premaster_secret.data == NULL) {
++	/* Find the key of this username. A random value will be
++	 * filled in if the key is not found.
++	 */
++	ret = _gnutls_psk_pwd_find_entry(session, info->username,
++			                 strlen(info->username), &pwd_psk);
++	if (ret < 0)
++		return gnutls_assert_val(ret);
++
++	/* Allocate memory for premaster secret, and fill in the
++	 * fields except the decryption result.
++	 */
++	session->key.key.size = 2 + GNUTLS_MASTER_SIZE + 2 + pwd_psk.size;
++	session->key.key.data = gnutls_malloc(session->key.key.size);
++	if (session->key.key.data == NULL) {
+ 		gnutls_assert();
++		_gnutls_free_key_datum(&pwd_psk);
++		/* No need to zeroize, as the secret is not copied in yet */
++		_gnutls_free_datum(&session->key.key);
+ 		return GNUTLS_E_MEMORY_ERROR;
+ 	}
+-	premaster_secret.size = GNUTLS_MASTER_SIZE;
+ 
+ 	/* Fallback value when decryption fails. Needs to be unpredictable. */
+-	ret = gnutls_rnd(GNUTLS_RND_NONCE, premaster_secret.data,
+-			 premaster_secret.size);
++	ret = gnutls_rnd(GNUTLS_RND_NONCE, session->key.key.data + 2,
++			 GNUTLS_MASTER_SIZE);
+ 	if (ret < 0) {
+ 		gnutls_assert();
+-		goto cleanup;
++		_gnutls_free_key_datum(&pwd_psk);
++		/* No need to zeroize, as the secret is not copied in yet */
++		_gnutls_free_datum(&session->key.key);
++		return ret;
+ 	}
+ 
++	_gnutls_write_uint16(GNUTLS_MASTER_SIZE, session->key.key.data);
++	_gnutls_write_uint16(pwd_psk.size,
++			     &session->key.key.data[2 + GNUTLS_MASTER_SIZE]);
++	memcpy(&session->key.key.data[2 + GNUTLS_MASTER_SIZE + 2], pwd_psk.data,
++	       pwd_psk.size);
++	_gnutls_free_key_datum(&pwd_psk);
++
+ 	gnutls_privkey_decrypt_data2(session->internals.selected_key, 0,
+-				     &ciphertext, premaster_secret.data,
+-				     premaster_secret.size);
++				     &ciphertext, session->key.key.data + 2,
++				     GNUTLS_MASTER_SIZE);
+ 	/* After this point, any conditional on failure that cause differences
+ 	 * in execution may create a timing or cache access pattern side
+ 	 * channel that can be used as an oracle, so tread carefully */
+@@ -365,31 +388,10 @@ _gnutls_proc_rsa_psk_client_kx(gnutls_session_t session, uint8_t * data,
+ 	/* This is here to avoid the version check attack
+ 	 * discussed above.
+ 	 */
+-	premaster_secret.data[0] = ver_maj;
+-	premaster_secret.data[1] = ver_min;
++	session->key.key.data[2] = ver_maj;
++	session->key.key.data[3] = ver_min;
+ 
+-	/* find the key of this username
+-	 */
+-	ret =
+-	    _gnutls_psk_pwd_find_entry(session, info->username, strlen(info->username), &pwd_psk);
+-	if (ret < 0) {
+-		gnutls_assert();
+-		goto cleanup;
+-	}
+-
+-	ret =
+-	    set_rsa_psk_session_key(session, &pwd_psk, &premaster_secret);
+-	if (ret < 0) {
+-		gnutls_assert();
+-		goto cleanup;
+-	}
+-
+-	ret = 0;
+-      cleanup:
+-	_gnutls_free_key_datum(&pwd_psk);
+-	_gnutls_free_temp_key_datum(&premaster_secret);
+-
+-	return ret;
++	return 0;
+ }
+ 
+ static int
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.14.bb b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
index 406f0b54c5..a1451daf2c 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2021-4209.patch \
            file://CVE-2023-0361.patch \
            file://CVE-2023-5981.patch \
+           file://CVE-2024-0553.patch \
 "
 
 SRC_URI[sha256sum] = "5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63"
-- 
2.34.1


