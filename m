Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD49CC35274
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 22:40:36 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.10217.1702420836278802708
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 14:40:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AE8QgegQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.173, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3b9f111c114so2892676b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702420835; x=1703025635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+GrvasqrhEEz08lO+XbXSA0sLxwDyuNjo6TD/ci7ok=;
        b=AE8QgegQ1fMrAXk/cbQRGCa/jHwMypwecxM1zfB+HnbPJCyhatSMD3ozkZdqwiNyYz
         rl4/ircU3XPPIxKZ8IEnB1tr2Dj5xX/DhT14H75zsv2AWSVT/Udk4ABxlcB3356APatA
         R03PaIP50Oaa6oyorNluJkBKtOXCLLNoKJFqh1PxPbuqXW7Ur7tb01ifUhspiztKvM+l
         EOZQsM5ehZ8UqmOu4CZrt+N2/UDEUH3gcrr+J42lY2VZ9idrM4d855ftc0elvx4oFj7T
         bdM5Tcu6MFlhUr7SVg01qoYEZRCV3vJjSQ9zxmI1VjkuyJRaxbzlJxuITI7FEL2MTPUO
         MTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702420835; x=1703025635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+GrvasqrhEEz08lO+XbXSA0sLxwDyuNjo6TD/ci7ok=;
        b=MbDqNJNRg7CgaIdpRbUfTXiATxJTN3GIDGUVC5WTgue5sFAuemZ9hucgvq5IaQX4pq
         HJM6L7bEjE0DTe9uKfSZOb/O5MzewW5j5EgmVs89tPu0JYLqySS4fjeM7ejnH0La5FAS
         nUB7MgW/0sS+4AziJENdkmZrI5xopIC8ZkqsId5hiYsNPWgQgem9OWr4uRhqDtq6M3Kq
         HSz6KwGaITipoTWXEGYzTYrscd7xasKWKUTkFLpVnebbeB4pxhyfxN8mQRMxp6ZLNi/z
         34BroLHIz9X7JSdQ1L7Iay0eu93Ovg0erWrKxJGezeG1BRlIUirRsniez2/elDToqc+L
         NXBQ==
X-Gm-Message-State: AOJu0YzpwcFw6poQfkLFs3HKThsnCGgEM2FJB3Boz9Er1h7FXJt1/JkN
	b0rLjEiKZJRyiHjria7QlRzhnutK2LtJeHZZ1AA=
X-Google-Smtp-Source: AGHT+IEmqn6Csv8OHn25BL2xu3ZewxrgEYi+a4SCcf43EztfZyCYBVaRoIWn/ePJ3LkCU3xSfOW5EQ==
X-Received: by 2002:a05:6808:1307:b0:3b9:ee89:541b with SMTP id y7-20020a056808130700b003b9ee89541bmr8369309oiv.28.1702420834774;
        Tue, 12 Dec 2023 14:40:34 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006d0951e74cbsm3847974pfo.178.2023.12.12.14.40.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 14:40:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/5] gnutls: Backport fix for CVE-2023-5981
Date: Tue, 12 Dec 2023 12:40:18 -1000
Message-Id: <626d267806841fae2423e8c595ec7c41dc91e6af.1702420654.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702420654.git.steve@sakoman.com>
References: <cover.1702420654.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 22:40:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192249

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [import from debian https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/gnutls28/3.7.3-4ubuntu1.3/gnutls28_3.7.3-4ubuntu1.3.debian.tar.xz
Upstream-Commit: https://gitlab.com/gnutls/gnutls/-/commit/29d6298d0b04cfff970b993915db71ba3f580b6d]

References:
https://ubuntu.com/security/CVE-2023-5981

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


