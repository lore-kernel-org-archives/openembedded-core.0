Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7641EC47DDF
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 14:21:12 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.17140.1706278867262376051
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 06:21:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xvpxqdHi;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2949dd860f8so146950a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 06:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706278866; x=1706883666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3ZE3kOZuBNwFFFT5DbhAxQUgnl2FUlOC9HTp7nx+8I=;
        b=xvpxqdHihQXDV1sMGXylRu1/1JupZTqawxtI+bzzy/yFSO1wgc+9Ez2cFpGPiMSJwt
         v+6dYOKFW8WNAutXzuVa+7BWGB1sQm7ib9ujYC8RE1yx/5n4x52l2kJkkf9DAnxhrhJz
         VR9dyQwlj18e+rN9SUzalCH1CQIUKYgJVlC138V660bQyNJDq64WCHeQgPhHnn9vxOiM
         tSZU6H4c1oxvTfDLzYZlc/txNJENleu+FhPoW6ZNbtrRbYTN2Pf1d0WsGmw3z6o4EVPp
         7k7wxiQt5XTBWn3lHE51I4oMgLpIIfjg25UnXJRaKh+Za/fR/C33+UEhbPwG8mCti7TF
         JNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706278866; x=1706883666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3ZE3kOZuBNwFFFT5DbhAxQUgnl2FUlOC9HTp7nx+8I=;
        b=DObYU1dJAyBR5QKNsLIdVITtHvFSrjxIVoBqYIjNSkKenlLmYmnDR6ubY/JCQ+1Vb6
         MXmsihVSo80/ZjXX5vW/SM16NCPlGL8qGm/MhXnB45VhfX3MkhlBQOoe7KCWs8unHRFy
         1rakdioGi0lN9gRD8nfU+S23RhI7qCt82Lq9PC/Wno5GKE0whncoec7Lha9vXmIhZ3no
         kMf3zEMAxj7VJGkKWZcNaecCBFet2ag2bqC5GRZrLCMJgrs5DzdtJmzL4XcLIM++l+J2
         9eM3HXNluVkRMsaLV7kEeQehhT6Iw8Fjwt7UAUBXSX8QsEOOhaqKrHvPUWeN+HJj7Ewv
         xg8g==
X-Gm-Message-State: AOJu0YxnN9HqAHSHz5VQPg7+tJyaIAYzAYBgwDAp3gbuUH4JCqTXxlAX
	AHg4GpuwQ4tfk02duiO5QWMOg8bL5+uwig+ghOiFL/2noRsVlpJhdjVxbhSDJ83WPhMW+TZyv25
	G8zA=
X-Google-Smtp-Source: AGHT+IHtwWJGoKcO6oItUMyLoOHxuZRRw0iWp36b7hA5cHfnJO0Cr6XA1tWzeQRe4jR7NKgJgvq7rQ==
X-Received: by 2002:a17:90a:7c06:b0:290:cef3:822a with SMTP id v6-20020a17090a7c0600b00290cef3822amr801829pjf.90.1706278865709;
        Fri, 26 Jan 2024 06:21:05 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id rr14-20020a17090b2b4e00b0029095a896c8sm1136458pjb.40.2024.01.26.06.21.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 06:21:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/8] gnutls: Backport fix for CVE-2023-5981
Date: Fri, 26 Jan 2024 04:20:36 -1000
Message-Id: <087b7c5d8363bcc6ae801d3ca18e6490e86a1381.1706278642.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706278642.git.steve@sakoman.com>
References: <cover.1706278642.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 14:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194377

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [import from ubuntu https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/gnutls28/3.6.13-2ubuntu1.9/gnutls28_3.6.13-2ubuntu1.9.debian.tar.xz
Upstream-Commit: https://gitlab.com/gnutls/gnutls/-/commit/29d6298d0b04cfff970b993915db71ba3f580b6d]

References:
https://ubuntu.com/security/CVE-2023-5981

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnutls/gnutls/CVE-2023-5981.patch         | 206 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb  |   1 +
 2 files changed, 207 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2023-5981.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2023-5981.patch b/meta/recipes-support/gnutls/gnutls/CVE-2023-5981.patch
new file mode 100644
index 0000000000..c518cfa0ac
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2023-5981.patch
@@ -0,0 +1,206 @@
+Backport of:
+
+From 29d6298d0b04cfff970b993915db71ba3f580b6d Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Mon, 23 Oct 2023 09:26:57 +0900
+Subject: [PATCH] auth/rsa_psk: side-step potential side-channel
+
+This removes branching that depends on secret data, porting changes
+for regular RSA key exchange from
+4804febddc2ed958e5ae774de2a8f85edeeff538 and
+80a6ce8ddb02477cd724cd5b2944791aaddb702a.  This also removes the
+allow_wrong_pms as it was used sorely to control debug output
+depending on the branching.
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/gnutls28/3.6.13-2ubuntu1.9/gnutls28_3.6.13-2ubuntu1.9.debian.tar.xz
+Upstream-Commit: https://gitlab.com/gnutls/gnutls/-/commit/29d6298d0b04cfff970b993915db71ba3f580b6d]
+CVE: CVE-2023-5981
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/auth/rsa.c     |  2 +-
+ lib/auth/rsa_psk.c | 90 ++++++++++++++++++----------------------------
+ lib/gnutls_int.h   |  4 ---
+ lib/priority.c     |  1 -
+ 4 files changed, 35 insertions(+), 62 deletions(-)
+
+--- a/lib/auth/rsa.c
++++ b/lib/auth/rsa.c
+@@ -207,7 +207,7 @@ proc_rsa_client_kx(gnutls_session_t sess
+ 				     session->key.key.size);
+ 	/* After this point, any conditional on failure that cause differences
+ 	 * in execution may create a timing or cache access pattern side
+-	 * channel that can be used as an oracle, so treat very carefully */
++	 * channel that can be used as an oracle, so tread carefully */
+ 
+ 	/* Error handling logic:
+ 	 * In case decryption fails then don't inform the peer. Just use the
+--- a/lib/auth/rsa_psk.c
++++ b/lib/auth/rsa_psk.c
+@@ -264,14 +264,13 @@ _gnutls_proc_rsa_psk_client_kx(gnutls_se
+ {
+ 	gnutls_datum_t username;
+ 	psk_auth_info_t info;
+-	gnutls_datum_t plaintext;
+ 	gnutls_datum_t ciphertext;
+ 	gnutls_datum_t pwd_psk = { NULL, 0 };
+ 	int ret, dsize;
+-	int randomize_key = 0;
+ 	ssize_t data_size = _data_size;
+ 	gnutls_psk_server_credentials_t cred;
+ 	gnutls_datum_t premaster_secret = { NULL, 0 };
++	volatile uint8_t ver_maj, ver_min;
+ 
+ 	cred = (gnutls_psk_server_credentials_t)
+ 	    _gnutls_get_cred(session, GNUTLS_CRD_PSK);
+@@ -327,71 +326,47 @@ _gnutls_proc_rsa_psk_client_kx(gnutls_se
+ 	}
+ 	ciphertext.size = dsize;
+ 
+-	ret =
+-	    gnutls_privkey_decrypt_data(session->internals.selected_key, 0,
+-					&ciphertext, &plaintext);
+-	if (ret < 0 || plaintext.size != GNUTLS_MASTER_SIZE) {
+-		/* In case decryption fails then don't inform
+-		 * the peer. Just use a random key. (in order to avoid
+-		 * attack against pkcs-1 formatting).
+-		 */
+-		gnutls_assert();
+-		_gnutls_debug_log
+-		    ("auth_rsa_psk: Possible PKCS #1 format attack\n");
+-		if (ret >= 0) {
+-			gnutls_free(plaintext.data);
+-		}
+-		randomize_key = 1;
+-	} else {
+-		/* If the secret was properly formatted, then
+-		 * check the version number.
+-		 */
+-		if (_gnutls_get_adv_version_major(session) !=
+-		    plaintext.data[0]
+-		    || (session->internals.allow_wrong_pms == 0
+-			&& _gnutls_get_adv_version_minor(session) !=
+-			plaintext.data[1])) {
+-			/* No error is returned here, if the version number check
+-			 * fails. We proceed normally.
+-			 * That is to defend against the attack described in the paper
+-			 * "Attacking RSA-based sessions in SSL/TLS" by Vlastimil Klima,
+-			 * Ondej Pokorny and Tomas Rosa.
+-			 */
+-			gnutls_assert();
+-			_gnutls_debug_log
+-			    ("auth_rsa: Possible PKCS #1 version check format attack\n");
+-		}
+-	}
++	ver_maj = _gnutls_get_adv_version_major(session);
++	ver_min = _gnutls_get_adv_version_minor(session);
+ 
++	premaster_secret.data = gnutls_malloc(GNUTLS_MASTER_SIZE);
++	if (premaster_secret.data == NULL) {
++		gnutls_assert();
++		return GNUTLS_E_MEMORY_ERROR;
++	}
++	premaster_secret.size = GNUTLS_MASTER_SIZE;
+ 
+-	if (randomize_key != 0) {
+-		premaster_secret.size = GNUTLS_MASTER_SIZE;
+-		premaster_secret.data =
+-		    gnutls_malloc(premaster_secret.size);
+-		if (premaster_secret.data == NULL) {
+-			gnutls_assert();
+-			return GNUTLS_E_MEMORY_ERROR;
+-		}
+-
+-		/* we do not need strong random numbers here.
+-		 */
+-		ret = gnutls_rnd(GNUTLS_RND_NONCE, premaster_secret.data,
+-				  premaster_secret.size);
+-		if (ret < 0) {
+-			gnutls_assert();
+-			goto cleanup;
+-		}
+-	} else {
+-		premaster_secret.data = plaintext.data;
+-		premaster_secret.size = plaintext.size;
++	/* Fallback value when decryption fails. Needs to be unpredictable. */
++	ret = gnutls_rnd(GNUTLS_RND_NONCE, premaster_secret.data,
++			 premaster_secret.size);
++	if (ret < 0) {
++		gnutls_assert();
++		goto cleanup;
+ 	}
+ 
++	gnutls_privkey_decrypt_data2(session->internals.selected_key, 0,
++				     &ciphertext, premaster_secret.data,
++				     premaster_secret.size);
++	/* After this point, any conditional on failure that cause differences
++	 * in execution may create a timing or cache access pattern side
++	 * channel that can be used as an oracle, so tread carefully */
++
++	/* Error handling logic:
++	 * In case decryption fails then don't inform the peer. Just use the
++	 * random key previously generated. (in order to avoid attack against
++	 * pkcs-1 formatting).
++	 *
++	 * If we get version mismatches no error is returned either. We
++	 * proceed normally. This is to defend against the attack described
++	 * in the paper "Attacking RSA-based sessions in SSL/TLS" by
++	 * Vlastimil Klima, Ondej Pokorny and Tomas Rosa.
++	 */
++
+ 	/* This is here to avoid the version check attack
+ 	 * discussed above.
+ 	 */
+-
+-	premaster_secret.data[0] = _gnutls_get_adv_version_major(session);
+-	premaster_secret.data[1] = _gnutls_get_adv_version_minor(session);
++	premaster_secret.data[0] = ver_maj;
++	premaster_secret.data[1] = ver_min;
+ 
+ 	/* find the key of this username
+ 	 */
+--- a/lib/gnutls_int.h
++++ b/lib/gnutls_int.h
+@@ -989,7 +989,6 @@ struct gnutls_priority_st {
+ 	bool _no_etm;
+ 	bool _no_ext_master_secret;
+ 	bool _allow_key_usage_violation;
+-	bool _allow_wrong_pms;
+ 	bool _dumbfw;
+ 	unsigned int _dh_prime_bits;	/* old (deprecated) variable */
+ 
+@@ -1007,7 +1006,6 @@ struct gnutls_priority_st {
+ 	      (x)->no_etm = 1; \
+ 	      (x)->no_ext_master_secret = 1; \
+ 	      (x)->allow_key_usage_violation = 1; \
+-	      (x)->allow_wrong_pms = 1; \
+ 	      (x)->dumbfw = 1
+ 
+ #define ENABLE_PRIO_COMPAT(x) \
+@@ -1016,7 +1014,6 @@ struct gnutls_priority_st {
+ 	      (x)->_no_etm = 1; \
+ 	      (x)->_no_ext_master_secret = 1; \
+ 	      (x)->_allow_key_usage_violation = 1; \
+-	      (x)->_allow_wrong_pms = 1; \
+ 	      (x)->_dumbfw = 1
+ 
+ /* DH and RSA parameters types.
+@@ -1141,7 +1138,6 @@ typedef struct {
+ 	bool no_etm;
+ 	bool no_ext_master_secret;
+ 	bool allow_key_usage_violation;
+-	bool allow_wrong_pms;
+ 	bool dumbfw;
+ 
+ 	/* old (deprecated) variable. This is used for both srp_prime_bits
+--- a/lib/priority.c
++++ b/lib/priority.c
+@@ -681,7 +681,6 @@ gnutls_priority_set(gnutls_session_t ses
+ 	COPY_TO_INTERNALS(no_etm);
+ 	COPY_TO_INTERNALS(no_ext_master_secret);
+ 	COPY_TO_INTERNALS(allow_key_usage_violation);
+-	COPY_TO_INTERNALS(allow_wrong_pms);
+ 	COPY_TO_INTERNALS(dumbfw);
+ 	COPY_TO_INTERNALS(dh_prime_bits);
+ 
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.14.bb b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
index 0c3392d521..406f0b54c5 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2022-2509.patch \
            file://CVE-2021-4209.patch \
            file://CVE-2023-0361.patch \
+           file://CVE-2023-5981.patch \
 "
 
 SRC_URI[sha256sum] = "5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63"
-- 
2.34.1


