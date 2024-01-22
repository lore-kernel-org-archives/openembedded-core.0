Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C30C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 04:05:38 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.65648.1705896337420562228
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jan 2024 20:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=H0Jr2pwf;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d71cb97937so13016215ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 20:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1705896336; x=1706501136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9TqJdCz2b0L+PGP+Mo9Quveu6D/AE/r1CApF7P4IdRY=;
        b=H0Jr2pwfmoObUoEC8SgyUFqfUJuqzIeoypvxrQ37898jRhaqEUbT2wOg68uAmxdVQZ
         WC/rNtOUXuPjnxKXgQFVmOOxsV8ifzuuPp3tMyLR7ZPYRDJK+tNAxodBGGPRrOjcwG4G
         O4Pk5dWHdZu41g9ofa8BArKnx29Qk8K7Q5j0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705896336; x=1706501136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9TqJdCz2b0L+PGP+Mo9Quveu6D/AE/r1CApF7P4IdRY=;
        b=gFGvogoS8TwTK7V23hu+eqSfjETlJQRThQHCdQuhoMCW2r8AAzPuQqNWUiI9ByOaxn
         bC2vBV9JlJtQMEGd8LMUjvC6eNN59wb2mrYz1vzMlIb/uL8oedikgW92m43zMDPJgc0v
         XrQgoePxJe/OLlT1TGNiepRm+OCbYj6ZgZyR3Hi/YpmcgOQQ3tggZ/OzY7phInSzjfF9
         JeZISnHzbQ72Is1tKWkG2Nxf9JhD70GvwgizPy8B9AgeI1W7S2wDy1OK+W97evHpleBr
         YRZgI7G2KDgU2WsJRMeFy49lXeZRCzWrEirVHctNA6XmhnM2OMgDJVXNZmpu7DVlH+Zz
         E1hQ==
X-Gm-Message-State: AOJu0Yzk9sowOJBCEwiPo7CATn2B+BuhJ4u6vftRZjzicyuMiJnStfWu
	n6iWRy8R5wcSAtRyJLFu6Ch8O/GFYO2eT+mUbdbIJcG21laEnlhaH7jzmxsgmYLJ4zBRTN7Vlc/
	y
X-Google-Smtp-Source: AGHT+IE7LxBvc4FN2jC39vqGMlyxWp55sb14l4XSZxP8f0Hkk+QV0kEuN3s9jGndLJB+jhtOM3gVTg==
X-Received: by 2002:a17:903:181:b0:1d7:3b65:764d with SMTP id z1-20020a170903018100b001d73b65764dmr1010657plg.91.1705896336038;
        Sun, 21 Jan 2024 20:05:36 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1cb0:fd5f:88b5:add1:694c:ed35])
        by smtp.gmail.com with ESMTPSA id o19-20020a170903009300b001d73a2acc0dsm2253351pld.300.2024.01.21.20.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 20:05:35 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] gnutls: Backport fix for CVE-2023-5981
Date: Mon, 22 Jan 2024 09:35:27 +0530
Message-Id: <20240122040527.7542-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 04:05:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194109

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [import from ubuntu https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/gnutls28/3.6.13-2ubuntu1.9/gnutls28_3.6.13-2ubuntu1.9.debian.tar.xz
Upstream-Commit: https://gitlab.com/gnutls/gnutls/-/commit/29d6298d0b04cfff970b993915db71ba3f580b6d]

References:
https://ubuntu.com/security/CVE-2023-5981

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


