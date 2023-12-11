Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9035EC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 08:07:21 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.3624.1702282032027599728
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 00:07:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=TjihaZ3K;
 spf=pass (domain: mvista.com, ip: 209.85.210.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6cea0fd9b53so2372489b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 00:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1702282030; x=1702886830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T6DdbMdHwXqTXlH7jiNuZtccyMr4R76ILJ4qGFOtlbg=;
        b=TjihaZ3K7jKEUMzgNLexlZ6fydR1Qt0YLenQL3RcUb4j34b0dViArtnh4FsIZiSzCY
         Gq0Eoau0vwfeWH8rxJTrERwMacnctwy9uTQaO9Th/Khwa7SJgEjun3Omm7vQGFy8aZDp
         tsKlFqa6VIydhnRyBLIC0zeWoVWQNwn4psvAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702282030; x=1702886830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6DdbMdHwXqTXlH7jiNuZtccyMr4R76ILJ4qGFOtlbg=;
        b=IesxNiOE06YV7f3FMVNgiPx8arXuMWryQh1lgiAzR5cQGuYEGJWMOYRZZmP5gOQMiR
         P+tEHNouhWbKQNKZjCz2kogqBpZEtdwSNE6zB5PFzYFcIu9vWOnwOWN80CMr6WWaMyCy
         tmQazcjSfdCr04a6TaY+cCEv3Tn6DJz3TOcoHNZhCxJSO8lIWqO2jeAMdtIrbTLGVWQ0
         TYodNWmA0OWhX8OjLjsGo2dOZhNo8NNwpy2uq6xUrOU7OjlRe+My/wdNy1QV0TeqpLAv
         g6BOdKqe3SQUPkyFg0KgV8M2IGdtL/5tGudq4TpB9NJkKSqoSwDQ16Lo5HUdrNp0gBJU
         E49Q==
X-Gm-Message-State: AOJu0Yyxn6NC0eMA7JvetCaQ2NiNXKElpHnrNAky+j4FAD8hLSTGlllm
	/6GSfRFZ1K/6IXWkrw83kxU7X+YM6tDClDWsArU=
X-Google-Smtp-Source: AGHT+IHwg9Dma6vQWLehzCx30kItWgS/QtaYwz3EKujcQmPvZ+5B6J3YN/Hg8VK118sFzaOahVfYow==
X-Received: by 2002:a05:6a21:998a:b0:18f:20bf:d855 with SMTP id ve10-20020a056a21998a00b0018f20bfd855mr2034804pzb.1.1702282030462;
        Mon, 11 Dec 2023 00:07:10 -0800 (PST)
Received: from MVIN00020.mvista.com ([223.230.81.28])
        by smtp.gmail.com with ESMTPSA id gw17-20020a17090b0a5100b00285be64e529sm7778204pjb.39.2023.12.11.00.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 00:07:10 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] gnutls: Backport fix for CVE-2023-5981
Date: Mon, 11 Dec 2023 13:34:56 +0530
Message-Id: <20231211080456.574686-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 08:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192147

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [import from debian https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/gnutls28/3.7.3-4ubuntu1.3/gnutls28_3.7.3-4ubuntu1.3.debian.tar.xz
Upstream-Commit: https://gitlab.com/gnutls/gnutls/-/commit/29d6298d0b04cfff970b993915db71ba3f580b6d]

References:
https://ubuntu.com/security/CVE-2023-5981

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../gnutls/gnutls/CVE-2023-5981.patch         | 206 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |   1 +
 2 files changed, 207 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2023-5981.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2023-5981.patch b/meta/recipes-support/gnutls/gnutls/CVE-2023-5981.patch
new file mode 100644
index 0000000000..33e498b8e5
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
+Upstream-Status: Backport [import from debian https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/gnutls28/3.7.3-4ubuntu1.3/gnutls28_3.7.3-4ubuntu1.3.debian.tar.xz
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
+@@ -974,7 +974,6 @@ struct gnutls_priority_st {
+ 	bool _no_etm;
+ 	bool _no_ext_master_secret;
+ 	bool _allow_key_usage_violation;
+-	bool _allow_wrong_pms;
+ 	bool _dumbfw;
+ 	unsigned int _dh_prime_bits;	/* old (deprecated) variable */
+ 
+@@ -992,7 +991,6 @@ struct gnutls_priority_st {
+ 	      (x)->no_etm = 1; \
+ 	      (x)->no_ext_master_secret = 1; \
+ 	      (x)->allow_key_usage_violation = 1; \
+-	      (x)->allow_wrong_pms = 1; \
+ 	      (x)->dumbfw = 1
+ 
+ #define ENABLE_PRIO_COMPAT(x) \
+@@ -1001,7 +999,6 @@ struct gnutls_priority_st {
+ 	      (x)->_no_etm = 1; \
+ 	      (x)->_no_ext_master_secret = 1; \
+ 	      (x)->_allow_key_usage_violation = 1; \
+-	      (x)->_allow_wrong_pms = 1; \
+ 	      (x)->_dumbfw = 1
+ 
+ /* DH and RSA parameters types.
+@@ -1126,7 +1123,6 @@ typedef struct {
+ 	bool no_etm;
+ 	bool no_ext_master_secret;
+ 	bool allow_key_usage_violation;
+-	bool allow_wrong_pms;
+ 	bool dumbfw;
+ 
+ 	/* old (deprecated) variable. This is used for both srp_prime_bits
+--- a/lib/priority.c
++++ b/lib/priority.c
+@@ -690,7 +690,6 @@ gnutls_priority_set(gnutls_session_t ses
+ 	COPY_TO_INTERNALS(no_etm);
+ 	COPY_TO_INTERNALS(no_ext_master_secret);
+ 	COPY_TO_INTERNALS(allow_key_usage_violation);
+-	COPY_TO_INTERNALS(allow_wrong_pms);
+ 	COPY_TO_INTERNALS(dumbfw);
+ 	COPY_TO_INTERNALS(dh_prime_bits);
+ 
diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
index fcd9af05dc..25f730b801 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
            file://CVE-2022-2509.patch \
            file://CVE-2023-0361.patch \
+           file://CVE-2023-5981.patch \
            "
 
 SRC_URI[sha256sum] = "e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f"
-- 
2.25.1


