Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4922C7618D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:01:30 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.8777.1678888888323139588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=M3qM7mh2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id y2so18912644pjg.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678888887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DaCjpzBFMljmhm/pAMgvVMr4NbV5roYDfhkAXubkpXk=;
        b=M3qM7mh2IXafVkdCwPOLjs1roP+pLSK6ojDH8IrMWj2gxk83FdEi9kWA9JT6BJT7km
         1Ta0A82Ky/J/1mYciEVUDeL36dWMtdNB6lxmGrJQbt32vCU3iJLRpRdDSYlL4gZExXh3
         nj2wolvtlaqdDLiqLEU4bb7TqZi4UOUt3WkKYAKzurQ7L8EgmiwJUbOMcUKi/DZ+kYEg
         54MbZbH4i+oEamPt390FwSL5M46wSKZaCU7I8wQvKHiUmA6xXQ2GxgAb8ITKCVDG5/WW
         K+K9ft9KBMeUQQJkzXZHxjCBKSYj3+h8JotvF21EyosJXpytqdXCDBwtc2jLeBXhUmZ5
         2Htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DaCjpzBFMljmhm/pAMgvVMr4NbV5roYDfhkAXubkpXk=;
        b=Y37YkhYm+5VsWrKwzqaqhLNPwFaS5fB77llpgt0jt0jbpHRBgCtlyitMLrR3nfrm7R
         /pEUgn/cT9nYHZmQSIaxtDZAH2bxKtOOYT+BYYRLacboKsUX4cQujHEvBg9C8ZS0R7q0
         x/cEXF7UGuuvVB8PDb+olrx2HX42Z9hZysmDfbi0sJ/P2dQSuqDyrzrUYPi0wS4cPcts
         YY7I0K6/9iaWoLn9MCeYLfFlqIiDVQhyj9dIdxE0T/O1uORtDfMGnqU+xu6YqALsLL5y
         9dQYi2G8jm3BOV1ZCpNnoI0CXtOUDafnN/9YnBVAAgHL28P3pNFOx+ZuXewvMDHUsmsy
         Xwyg==
X-Gm-Message-State: AO0yUKXp2lAeU0UKyhsrVWNqp34ynUEPvWgcV7pfwvRTpFuCHn8pVA3k
	93JGhM0N9uUte+S8M9TwOYvfPz9R1HGWP6IRujc=
X-Google-Smtp-Source: AK7set+itIVUVt8nz4ZpbFHVpvXjzM4yx9lE1POTlHkMIRKi3OcUA/WQ0IjqaZCnm35wlyhjMx4fOw==
X-Received: by 2002:a17:903:42c4:b0:1a1:6584:31b0 with SMTP id jy4-20020a17090342c400b001a1658431b0mr1906040plb.30.1678888887194;
        Wed, 15 Mar 2023 07:01:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001a0432ca99csm3663755plf.269.2023.03.15.07.01.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:01:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/22] gnutls: fix CVE-2023-0361 timing side-channel in the TLS RSA key exchange code
Date: Wed, 15 Mar 2023 04:00:54 -1000
Message-Id: <05b1222815bec400d573f7b06c0ad6b7b2d78a80.1678888649.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678888649.git.steve@sakoman.com>
References: <cover.1678888649.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178554

From: Vivek Kumbhar <vkumbhar@mvista.com>

Remove branching that depends on secret data.

since the `ok` variable isn't used any more, we can remove all code
used to calculate it

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnutls/gnutls/CVE-2023-0361.patch         | 85 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2023-0361.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2023-0361.patch b/meta/recipes-support/gnutls/gnutls/CVE-2023-0361.patch
new file mode 100644
index 0000000000..943f4ca704
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2023-0361.patch
@@ -0,0 +1,85 @@
+From 80a6ce8ddb02477cd724cd5b2944791aaddb702a Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Tue, 9 Aug 2022 16:05:53 +0200
+Subject: [PATCH] auth/rsa: side-step potential side-channel
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+Signed-off-by: Hubert Kario <hkario@redhat.com>
+Tested-by: Hubert Kario <hkario@redhat.com>
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/80a6ce8ddb02477cd724cd5b2944791aaddb702a
+                           https://gitlab.com/gnutls/gnutls/-/commit/4b7ff428291c7ed77c6d2635577c83a43bbae558]
+CVE: CVE-2023-0361
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ lib/auth/rsa.c | 30 +++---------------------------
+ 1 file changed, 3 insertions(+), 27 deletions(-)
+
+diff --git a/lib/auth/rsa.c b/lib/auth/rsa.c
+index 8108ee8..858701f 100644
+--- a/lib/auth/rsa.c
++++ b/lib/auth/rsa.c
+@@ -155,13 +155,10 @@ static int
+ proc_rsa_client_kx(gnutls_session_t session, uint8_t * data,
+		   size_t _data_size)
+ {
+-	const char attack_error[] = "auth_rsa: Possible PKCS #1 attack\n";
+	gnutls_datum_t ciphertext;
+	int ret, dsize;
+	ssize_t data_size = _data_size;
+	volatile uint8_t ver_maj, ver_min;
+-	volatile uint8_t check_ver_min;
+-	volatile uint32_t ok;
+
+ #ifdef ENABLE_SSL3
+	if (get_num_version(session) == GNUTLS_SSL3) {
+@@ -187,7 +184,6 @@ proc_rsa_client_kx(gnutls_session_t session, uint8_t * data,
+
+	ver_maj = _gnutls_get_adv_version_major(session);
+	ver_min = _gnutls_get_adv_version_minor(session);
+-	check_ver_min = (session->internals.allow_wrong_pms == 0);
+
+	session->key.key.data = gnutls_malloc(GNUTLS_MASTER_SIZE);
+	if (session->key.key.data == NULL) {
+@@ -206,10 +202,9 @@ proc_rsa_client_kx(gnutls_session_t session, uint8_t * data,
+		return ret;
+	}
+
+-	ret =
+-	    gnutls_privkey_decrypt_data2(session->internals.selected_key,
+-					 0, &ciphertext, session->key.key.data,
+-					 session->key.key.size);
++	gnutls_privkey_decrypt_data2(session->internals.selected_key,
++				     0, &ciphertext, session->key.key.data,
++				     session->key.key.size);
+	/* After this point, any conditional on failure that cause differences
+	 * in execution may create a timing or cache access pattern side
+	 * channel that can be used as an oracle, so treat very carefully */
+@@ -225,25 +220,6 @@ proc_rsa_client_kx(gnutls_session_t session, uint8_t * data,
+	 * Vlastimil Klima, Ondej Pokorny and Tomas Rosa.
+	 */
+
+-	/* ok is 0 in case of error and 1 in case of success. */
+-
+-	/* if ret < 0 */
+-	ok = CONSTCHECK_EQUAL(ret, 0);
+-	/* session->key.key.data[0] must equal ver_maj */
+-	ok &= CONSTCHECK_EQUAL(session->key.key.data[0], ver_maj);
+-	/* if check_ver_min then session->key.key.data[1] must equal ver_min */
+-	ok &= CONSTCHECK_NOT_EQUAL(check_ver_min, 0) &
+-	        CONSTCHECK_EQUAL(session->key.key.data[1], ver_min);
+-
+-	if (ok) {
+-		/* call logging function unconditionally so all branches are
+-		 * indistinguishable for timing and cache access when debug
+-		 * logging is disabled */
+-		_gnutls_no_log("%s", attack_error);
+-	} else {
+-		_gnutls_debug_log("%s", attack_error);
+-	}
+-
+	/* This is here to avoid the version check attack
+	 * discussed above.
+	 */
+--
+2.25.1
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
index fb06337efb..fcd9af05dc 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
@@ -22,6 +22,7 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
            file://arm_eabi.patch \
            file://CVE-2022-2509.patch \
+           file://CVE-2023-0361.patch \
            "
 
 SRC_URI[sha256sum] = "e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f"
-- 
2.34.1


