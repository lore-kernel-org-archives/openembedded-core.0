Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232D8C47DDC
	for <webhook@archiver.kernel.org>; Sun, 21 Jan 2024 18:58:15 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.54148.1705863488695929991
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jan 2024 10:58:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FAY4m1Oy;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.177, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3bd9030d68fso1595592b6e.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 10:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705863487; x=1706468287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qweoij2P56lNt0b5fFBZhIY1j6GMMbmfxM/RM7ud1O4=;
        b=FAY4m1OyqgF5s2CTcgnwV/8io/8wUNgAqtqpmtS7U6t+3++ME0BCqO1b3HN9KIcVxS
         5C+/TGCK9zUcAd34MJ9/WTThrQp0fzXU5t1B0eLrGOujqnCfo0OnKX0IQ5r4cj2YzNVH
         Cook2k80zsDmz0OZ3fQrTCYqtbaZo3X5LY3bngiYkK/MJEs6Z5t77wqrpLFZ1Q7aHCkU
         qOLID4EJqKELWhpFz5wRyvEA/09nBLhTkVHlYm3ZaAjMC5M1bn7H549SIm/2PKcpZrcd
         t9icROL8yWgqZ1oyZAJugghf5829jR8rnPL8drm78gwjXjIYQ5h7D1N3IswGW1atGTc9
         EmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705863487; x=1706468287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qweoij2P56lNt0b5fFBZhIY1j6GMMbmfxM/RM7ud1O4=;
        b=Da+KK6Y/jgzcxLGAxPp5/Uar9M9Yr+7dr2wIMdiO5uLUi2XninIfYuKbd1PyAllENm
         5mlxogeQDWwQF4XA9xnlrJscPiGSlMvLoxmgn0fr42Dz7H1JaQahfAIh97yfVc7Uq76I
         DFhaBS6j2XLWzyjV2jQV0ON3q0yhw+BYBMlZs/BcVYju6Of9Cn1acAzGYDfA0unjBj9u
         ufnoSaBiSnRpbNpYybq7T8udvnHExiWUIIJxOr7+L1tyFU4F6hTbWH0Vodi70VksAPOj
         SnrPjX2jhNKW5MJFQ4VC+qqyJe2BNMbJra606OBvP87MMc2HfyIB10kkrxB1KIiK8EW0
         FLmg==
X-Gm-Message-State: AOJu0YyMyJKSdMkpKbJeQonSZC/+q0GyFO+9PVWLQCswfcvDiVbXUxJa
	VamOPcg9WBPJ6cmIEkouJJXR1f9fyDDK//KszaOHytDjLkoTQd10ufvCTIcfM594KkunmSDFa9Q
	FhKy/uQ==
X-Google-Smtp-Source: AGHT+IF8waMSpJDWCnGSCWkor08RrVkZqRWgN03q3zTZu5SVHnr5cz8uGzep6YNnXWDnXxrBD90kRg==
X-Received: by 2002:a05:6808:2f0c:b0:3bd:97b0:f893 with SMTP id gu12-20020a0568082f0c00b003bd97b0f893mr4865902oib.49.1705863487078;
        Sun, 21 Jan 2024 10:58:07 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id t187-20020a6281c4000000b006d99125b114sm8675277pfd.65.2024.01.21.10.58.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 10:58:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/6] gnutls: Fix for CVE-2024-0553 and CVE-2024-0567
Date: Sun, 21 Jan 2024 08:57:53 -1000
Message-Id: <de74fd5dea8cc71af1d457b4e688cfbe0f39e4d8.1705863274.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705863274.git.steve@sakoman.com>
References: <cover.1705863274.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 18:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194098

From: Vijay Anusuri <vanusuri@mvista.com>

CVE-2024-0553
A vulnerability was found in GnuTLS. The response times to malformed ciphertexts in RSA-PSK ClientKeyExchange differ from response times of ciphertexts with correct PKCS#1 v1.5 padding. This issue may allow a remote attacker to perform a timing side-channel attack in the RSA-PSK key exchange, potentially leading to the leakage of sensitive data. CVE-2024-0553 is designated as an incomplete resolution for CVE-2023-5981.

CVE-2024-0567
A vulnerability was found in GnuTLS, where a cockpit (which uses gnuTLS) rejects a certificate chain with distributed trust. This issue occurs when validating a certificate chain with cockpit-certificate-ensure. This flaw allows an unauthenticated, remote client or attacker to initiate a denial of service attack.

Upstream-Status: Backport
[https://gitlab.com/gnutls/gnutls/-/commit/40dbbd8de499668590e8af51a15799fbc430595e
&
https://gitlab.com/gnutls/gnutls/-/commit/9edbdaa84e38b1bfb53a7d72c1de44f8de373405]

Reference: https://ubuntu.com/security/CVE-2024-0553
           https://ubuntu.com/security/CVE-2024-0567

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnutls/gnutls/CVE-2024-0553.patch         | 125 ++++++++++++
 .../gnutls/gnutls/CVE-2024-0567.patch         | 184 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |   2 +
 3 files changed, 311 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2024-0553.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2024-0567.patch

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
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2024-0567.patch b/meta/recipes-support/gnutls/gnutls/CVE-2024-0567.patch
new file mode 100644
index 0000000000..49c4531a9b
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2024-0567.patch
@@ -0,0 +1,184 @@
+From 9edbdaa84e38b1bfb53a7d72c1de44f8de373405 Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Thu, 11 Jan 2024 15:45:11 +0900
+Subject: [PATCH] x509: detect loop in certificate chain
+
+There can be a loop in a certificate chain, when multiple CA
+certificates are cross-signed with each other, such as A â†’ B, B â†’ C,
+and C â†’ A.  Previously, the verification logic was not capable of
+handling this scenario while sorting the certificates in the chain in
+_gnutls_sort_clist, resulting in an assertion failure.  This patch
+properly detects such loop and aborts further processing in a graceful
+manner.
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/9edbdaa84e38b1bfb53a7d72c1de44f8de373405]
+CVE: CVE-2024-0567
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/x509/common.c   |   4 ++
+ tests/test-chains.h | 125 ++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 129 insertions(+)
+
+diff --git a/lib/x509/common.c b/lib/x509/common.c
+index fad9da5..6367b03 100644
+--- a/lib/x509/common.c
++++ b/lib/x509/common.c
+@@ -1790,6 +1790,10 @@ unsigned int _gnutls_sort_clist(gnutls_x509_crt_t *clist,
+ 			break;
+ 		}
+ 
++		if (insorted[prev]) { /* loop detected */
++			break;
++		}
++
+ 		sorted[i] = clist[prev];
+ 		insorted[prev] = 1;
+ 	}
+diff --git a/tests/test-chains.h b/tests/test-chains.h
+index dd7ccf0..09a5461 100644
+--- a/tests/test-chains.h
++++ b/tests/test-chains.h
+@@ -4263,6 +4263,129 @@ static const char *rsa_sha1_not_in_trusted_ca[] = {
+ 	NULL
+ };
+ 
++static const char *cross_signed[] = {
++	/* server (signed by A1) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBqDCCAVqgAwIBAgIUejlil+8DBffazcnMNwyOOP6yCCowBQYDK2VwMBoxGDAW\n"
++	"BgNVBAMTD0ludGVybWVkaWF0ZSBBMTAgFw0yNDAxMTEwNjI3MjJaGA85OTk5MTIz\n"
++	"MTIzNTk1OVowNzEbMBkGA1UEChMSR251VExTIHRlc3Qgc2VydmVyMRgwFgYDVQQD\n"
++	"Ew90ZXN0LmdudXRscy5vcmcwKjAFBgMrZXADIQA1ZVS0PcNeTPQMZ+FuVz82AHrj\n"
++	"qL5hWEpCDgpG4M4fxaOBkjCBjzAMBgNVHRMBAf8EAjAAMBoGA1UdEQQTMBGCD3Rl\n"
++	"c3QuZ251dGxzLm9yZzATBgNVHSUEDDAKBggrBgEFBQcDATAOBgNVHQ8BAf8EBAMC\n"
++	"B4AwHQYDVR0OBBYEFGtEUv+JSt+zPoO3lu0IiObZVoiNMB8GA1UdIwQYMBaAFPnY\n"
++	"v6Pw0IvKSqIlb6ewHyEAmTA3MAUGAytlcANBAAS2lyc87kH/aOvNKzPjqDwUYxPA\n"
++	"CfYjyaKea2d0DZLBM5+Bjnj/4aWwTKgVTJzWhLJcLtaSdVHrXqjr9NhEhQ0=\n"
++	"-----END CERTIFICATE-----\n",
++	/* A1 (signed by A) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBUjCCAQSgAwIBAgIUe/R+NVp04e74ySw2qgI6KZgFR20wBQYDK2VwMBExDzAN\n"
++	"BgNVBAMTBlJvb3QgQTAgFw0yNDAxMTEwNjI1MDFaGA85OTk5MTIzMTIzNTk1OVow\n"
++	"GjEYMBYGA1UEAxMPSW50ZXJtZWRpYXRlIEExMCowBQYDK2VwAyEAlkTNqwz973sy\n"
++	"u3whMjSiUMs77CZu5YA7Gi5KcakExrKjYzBhMA8GA1UdEwEB/wQFMAMBAf8wDgYD\n"
++	"VR0PAQH/BAQDAgIEMB0GA1UdDgQWBBT52L+j8NCLykqiJW+nsB8hAJkwNzAfBgNV\n"
++	"HSMEGDAWgBRbYgOkRGsd3Z74+CauX4htzLg0lzAFBgMrZXADQQBM0NBaFVPd3cTJ\n"
++	"DSaZNT34fsHuJk4eagpn8mBxKQpghq4s8Ap+nYtp2KiXjcizss53PeLXVnkfyLi0\n"
++	"TLVBHvUJ\n"
++	"-----END CERTIFICATE-----\n",
++	/* A (signed by B) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBSDCB+6ADAgECAhQtdJpg+qlPcLoRW8iiztJUD4xNvDAFBgMrZXAwETEPMA0G\n"
++	"A1UEAxMGUm9vdCBCMCAXDTI0MDExMTA2MTk1OVoYDzk5OTkxMjMxMjM1OTU5WjAR\n"
++	"MQ8wDQYDVQQDEwZSb290IEEwKjAFBgMrZXADIQA0vDYyg3tgotSETL1Wq2hBs32p\n"
++	"WbnINkmOSNmOiZlGHKNjMGEwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMC\n"
++	"AgQwHQYDVR0OBBYEFFtiA6REax3dnvj4Jq5fiG3MuDSXMB8GA1UdIwQYMBaAFJFA\n"
++	"s2rg6j8w9AKItRnOOOjG2FG6MAUGAytlcANBAPv674p9ek5GjRcRfVQhgN+kQlHU\n"
++	"u774wL3Vx3fWA1E7+WchdMzcHrPoa5OKtKmxjIKUTO4SeDZL/AVpvulrWwk=\n"
++	"-----END CERTIFICATE-----\n",
++	/* A (signed by C) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBSDCB+6ADAgECAhReNpCiVn7eFDUox3mvM5qE942AVzAFBgMrZXAwETEPMA0G\n"
++	"A1UEAxMGUm9vdCBDMCAXDTI0MDExMTA2MjEyMVoYDzk5OTkxMjMxMjM1OTU5WjAR\n"
++	"MQ8wDQYDVQQDEwZSb290IEIwKjAFBgMrZXADIQAYX92hS97OGKbMzwrD7ReVifwM\n"
++	"3iz5tnfQHWQSkvvYMKNjMGEwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMC\n"
++	"AgQwHQYDVR0OBBYEFJFAs2rg6j8w9AKItRnOOOjG2FG6MB8GA1UdIwQYMBaAFEh/\n"
++	"XKjIuMeEavX5QVoy39Q+GhnwMAUGAytlcANBAIwghH3gelXty8qtoTGIEJb0+EBv\n"
++	"BH4YOUh7TamxjxkjvvIhDA7ZdheofFb7NrklJco7KBcTATUSOvxakYRP9Q8=\n"
++	"-----END CERTIFICATE-----\n",
++	/* B1 (signed by B) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBUjCCAQSgAwIBAgIUfpmrVDc1XBA5/7QYMyGBuB9mTtUwBQYDK2VwMBExDzAN\n"
++	"BgNVBAMTBlJvb3QgQjAgFw0yNDAxMTEwNjI1MjdaGA85OTk5MTIzMTIzNTk1OVow\n"
++	"GjEYMBYGA1UEAxMPSW50ZXJtZWRpYXRlIEIxMCowBQYDK2VwAyEAh6ZTuJWsweVB\n"
++	"a5fsye5iq89kWDC2Y/Hlc0htLmjzMP+jYzBhMA8GA1UdEwEB/wQFMAMBAf8wDgYD\n"
++	"VR0PAQH/BAQDAgIEMB0GA1UdDgQWBBTMQu37PKyLjKfPODZgxYCaayff+jAfBgNV\n"
++	"HSMEGDAWgBSRQLNq4Oo/MPQCiLUZzjjoxthRujAFBgMrZXADQQBblmguY+lnYvOK\n"
++	"rAZJnqpEUGfm1tIFyu3rnlE7WOVcXRXMIoNApLH2iHIipQjlvNWuSBFBTC1qdewh\n"
++	"/e+0cgQB\n"
++	"-----END CERTIFICATE-----\n",
++	/* B (signed by A) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBSDCB+6ADAgECAhRpEm+dWNX6DMZh/nottkFfFFrXXDAFBgMrZXAwETEPMA0G\n"
++	"A1UEAxMGUm9vdCBBMCAXDTI0MDExMTA2MTcyNloYDzk5OTkxMjMxMjM1OTU5WjAR\n"
++	"MQ8wDQYDVQQDEwZSb290IEIwKjAFBgMrZXADIQAYX92hS97OGKbMzwrD7ReVifwM\n"
++	"3iz5tnfQHWQSkvvYMKNjMGEwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMC\n"
++	"AgQwHQYDVR0OBBYEFJFAs2rg6j8w9AKItRnOOOjG2FG6MB8GA1UdIwQYMBaAFFti\n"
++	"A6REax3dnvj4Jq5fiG3MuDSXMAUGAytlcANBAFvmcK3Ida5ViVYDzxKVLPcPsCHe\n"
++	"3hxz99lBrerJC9iJSvRYTJoPBvjTxDYnBn5EFrQYMrUED+6i71lmGXNU9gs=\n"
++	"-----END CERTIFICATE-----\n",
++	/* B (signed by C) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBSDCB+6ADAgECAhReNpCiVn7eFDUox3mvM5qE942AVzAFBgMrZXAwETEPMA0G\n"
++	"A1UEAxMGUm9vdCBDMCAXDTI0MDExMTA2MjEyMVoYDzk5OTkxMjMxMjM1OTU5WjAR\n"
++	"MQ8wDQYDVQQDEwZSb290IEIwKjAFBgMrZXADIQAYX92hS97OGKbMzwrD7ReVifwM\n"
++	"3iz5tnfQHWQSkvvYMKNjMGEwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMC\n"
++	"AgQwHQYDVR0OBBYEFJFAs2rg6j8w9AKItRnOOOjG2FG6MB8GA1UdIwQYMBaAFEh/\n"
++	"XKjIuMeEavX5QVoy39Q+GhnwMAUGAytlcANBAIwghH3gelXty8qtoTGIEJb0+EBv\n"
++	"BH4YOUh7TamxjxkjvvIhDA7ZdheofFb7NrklJco7KBcTATUSOvxakYRP9Q8=\n"
++	"-----END CERTIFICATE-----\n",
++	/* C1 (signed by C) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBUjCCAQSgAwIBAgIUSKsfY1wD3eD2VmaaK1wt5naPckMwBQYDK2VwMBExDzAN\n"
++	"BgNVBAMTBlJvb3QgQzAgFw0yNDAxMTEwNjI1NDdaGA85OTk5MTIzMTIzNTk1OVow\n"
++	"GjEYMBYGA1UEAxMPSW50ZXJtZWRpYXRlIEMxMCowBQYDK2VwAyEA/t7i1chZlKkV\n"
++	"qxJOrmmyATn8XnpK+nV/iT4OMHSHfAyjYzBhMA8GA1UdEwEB/wQFMAMBAf8wDgYD\n"
++	"VR0PAQH/BAQDAgIEMB0GA1UdDgQWBBRmpF3JjoP3NiBzE5J5ANT0bvfRmjAfBgNV\n"
++	"HSMEGDAWgBRIf1yoyLjHhGr1+UFaMt/UPhoZ8DAFBgMrZXADQQAeRBXv6WCTOp0G\n"
++	"3wgd8bbEGrrILfpi+qH7aj/MywgkPIlppDYRQ3jL6ASd+So/408dlE0DV9DXKBi0\n"
++	"725XUUYO\n"
++	"-----END CERTIFICATE-----\n",
++	/* C (signed by A) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBSDCB+6ADAgECAhRvbZv3SRTjDOiAbyFWHH4y0yMZkjAFBgMrZXAwETEPMA0G\n"
++	"A1UEAxMGUm9vdCBBMCAXDTI0MDExMTA2MTg1MVoYDzk5OTkxMjMxMjM1OTU5WjAR\n"
++	"MQ8wDQYDVQQDEwZSb290IEMwKjAFBgMrZXADIQDxm6Ubhsa0gSa1vBCIO5e+qZEH\n"
++	"8Oocz+buNHfIJbh5NaNjMGEwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMC\n"
++	"AgQwHQYDVR0OBBYEFEh/XKjIuMeEavX5QVoy39Q+GhnwMB8GA1UdIwQYMBaAFFti\n"
++	"A6REax3dnvj4Jq5fiG3MuDSXMAUGAytlcANBAPl+SyiOfXJnjSWx8hFMhJ7w92mn\n"
++	"tkGifCFHBpUhYcBIMeMtLw0RBLXqaaN0EKlTFimiEkLClsU7DKYrpEEJegs=\n"
++	"-----END CERTIFICATE-----\n",
++	/* C (signed by B) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBSDCB+6ADAgECAhQU1OJWRVOLrGrgJiLwexd1/MwKkTAFBgMrZXAwETEPMA0G\n"
++	"A1UEAxMGUm9vdCBCMCAXDTI0MDExMTA2MjAzMFoYDzk5OTkxMjMxMjM1OTU5WjAR\n"
++	"MQ8wDQYDVQQDEwZSb290IEMwKjAFBgMrZXADIQDxm6Ubhsa0gSa1vBCIO5e+qZEH\n"
++	"8Oocz+buNHfIJbh5NaNjMGEwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMC\n"
++	"AgQwHQYDVR0OBBYEFEh/XKjIuMeEavX5QVoy39Q+GhnwMB8GA1UdIwQYMBaAFJFA\n"
++	"s2rg6j8w9AKItRnOOOjG2FG6MAUGAytlcANBALXeyuj8vj6Q8j4l17VzZwmJl0gN\n"
++	"bCGoKMl0J/0NiN/fQRIsdbwQDh0RUN/RN3I6DTtB20ER6f3VdnzAh8nXkQ4=\n"
++	"-----END CERTIFICATE-----\n",
++	NULL
++};
++
++static const char *cross_signed_ca[] = {
++	/* A (self-signed) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBJzCB2qADAgECAhQs1Ur+gzPs1ISxs3Tbs700q0CZcjAFBgMrZXAwETEPMA0G\n"
++	"A1UEAxMGUm9vdCBBMCAXDTI0MDExMTA2MTYwMFoYDzk5OTkxMjMxMjM1OTU5WjAR\n"
++	"MQ8wDQYDVQQDEwZSb290IEEwKjAFBgMrZXADIQA0vDYyg3tgotSETL1Wq2hBs32p\n"
++	"WbnINkmOSNmOiZlGHKNCMEAwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMC\n"
++	"AgQwHQYDVR0OBBYEFFtiA6REax3dnvj4Jq5fiG3MuDSXMAUGAytlcANBAHrVv7E9\n"
++	"5scuOVCH9gNRRm8Z9SUoLakRHAPnySdg6z/kI3vOgA/OM7reArpnW8l1H2FapgpL\n"
++	"bDeZ2XJH+BdVFwg=\n"
++	"-----END CERTIFICATE-----\n",
++	NULL
++};
++
+ #if defined __clang__ || __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 5)
+ #  pragma GCC diagnostic push
+ #  pragma GCC diagnostic ignored "-Wunused-variable"
+@@ -4442,6 +4565,8 @@ static struct
+     rsa_sha1_not_in_trusted, rsa_sha1_not_in_trusted_ca,
+     GNUTLS_PROFILE_TO_VFLAGS(GNUTLS_PROFILE_MEDIUM),
+     GNUTLS_CERT_INSECURE_ALGORITHM | GNUTLS_CERT_INVALID, NULL, 1620118136, 1},
++  { "cross signed - ok", cross_signed, cross_signed_ca, 0, 0, 0,
++    1704955300 },
+   { NULL, NULL, NULL, 0, 0}
+ };
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
index 25f730b801..b290022781 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
@@ -24,6 +24,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2022-2509.patch \
            file://CVE-2023-0361.patch \
            file://CVE-2023-5981.patch \
+           file://CVE-2024-0553.patch \
+           file://CVE-2024-0567.patch \
            "
 
 SRC_URI[sha256sum] = "e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f"
-- 
2.34.1


