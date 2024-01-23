Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A21BC47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 05:42:56 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.5468.1705988570456797032
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 21:42:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=K6NW2okl;
 spf=pass (domain: mvista.com, ip: 209.85.210.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6da9c834646so3933356b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 21:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1705988569; x=1706593369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aNQzxu6rMLQv09bGnzA/b23VviXpstNrR7wJBF1fPOA=;
        b=K6NW2okl4Lzs4sZ9q6WbABe0U6c3OO8CktLrKZ/tkMJW0wEtFyNc3a1LbQpkltvGaE
         v0GMVh2sG4Jqslo3btCK5kn72HCkjy7hDWbbJPnBNpjcfBs4PQs65NAwlG6SrhEMXcO4
         VuMnz3w7Ty37xCssKsYMsNquRXbxHJirsmBdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705988569; x=1706593369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNQzxu6rMLQv09bGnzA/b23VviXpstNrR7wJBF1fPOA=;
        b=MWE5w/cLy6tmvxYYoLSABl/LQnwBVcC5L3pb5Z09VUOcADBR8MoqB5ZafJIgI9rIS8
         /ecmgMtPE4vLdshTWwUnPHQnRv8132nyMxTEQowRcQEYgypehPo2avy4252F6HvT9THp
         DO4EVza4+KLEhQ57wqdxBfdxP/8NUGND60OPPHQNjC1PxEd+lL1RDE4aMa18DMKp5GrB
         /RRRXee0AvreL74xEBRVST01HOu1JSp/RHELKPXmGV6EQ1xXI9aY0ZPxH7VZcb4EHwNp
         hCx3K+m/Xs6aY+rXhAtWY7T2z1qFtnax1qhm2Re/PdDz9WJZmNbBJScFOem1WsSlHkxo
         eQYw==
X-Gm-Message-State: AOJu0YwWvnFSxKimoxFLusF0btTj5XH4tvwfHjLNVtBYnT7i0mEBzseJ
	wLTX1h1NYooFudJ3HJuH2jfdMjIuB/sjs10ZVDATPt576lUVUBGRr5vqv/Klib12Gl2bq2c3tDj
	/
X-Google-Smtp-Source: AGHT+IHl2S4uVhOXboy5AYbhb1oSn7nQVzYbzbGMv9GxvF74kP3PyYWES+cUxwKMvzKEx7GvPytnEg==
X-Received: by 2002:a05:6a20:7fa0:b0:19b:5f7:e142 with SMTP id d32-20020a056a207fa000b0019b05f7e142mr7292697pzj.30.1705988569302;
        Mon, 22 Jan 2024 21:42:49 -0800 (PST)
Received: from MVIN00020.mvista.com ([136.185.199.154])
        by smtp.gmail.com with ESMTPSA id y2-20020a63e242000000b005cd78f13608sm9278960pgj.13.2024.01.22.21.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 21:42:48 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] gnutls: Backport fix for CVE-2024-0553
Date: Tue, 23 Jan 2024 11:10:38 +0530
Message-Id: <20240123054038.5462-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 05:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194202

From: Vijay Anusuri <vanusuri@mvista.com>

CVE-2024-0553
A vulnerability was found in GnuTLS. The response times to malformed ciphertexts in RSA-PSK ClientKeyExchange differ from response times of ciphertexts with correct PKCS#1 v1.5 padding. This issue may allow a remote attacker to perform a timing side-channel attack in the RSA-PSK key exchange, potentially leading to the leakage of sensitive data. CVE-2024-0553 is designated as an incomplete resolution for CVE-2023-5981.

Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/40dbbd8de499668590e8af51a15799fbc430595e]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


