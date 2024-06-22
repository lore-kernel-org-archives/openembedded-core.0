Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C217C2BD05
	for <webhook@archiver.kernel.org>; Sat, 22 Jun 2024 11:58:17 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.95903.1719057489123384153
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jun 2024 04:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wfvcd4ol;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.47, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5c1b734383cso1238587eaf.3
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 04:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719057488; x=1719662288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TCRAzBUWtxcC0Ac/wfC3ONJAhr59pRM1qpSt6icgs+A=;
        b=wfvcd4ols8ioirmfz2pWXazaUJ5ybrLoLsn/rEPORXG/qCJ5glk6PmHabYodnsM7qn
         RdUxnE5eMmqGCjOKyrHtxL6BdcWPTZbjckC+yt2IzcOOmXSxG/lARKjB0m2zFN708UEU
         +5oSTBjVWFkHps9v6xmbZhJUww7gPJTsjA0O7hEwrMXQpqnaP9MZmLm1ej+y4kQTw8Lu
         DWmQzLvOiE8e779AjajV2WVJ8nFWHjK2vaR81XJXc00bqV4Chkcfxv6iAZ/RtGL5RTEo
         T9rZWPq1YmIQ5mxsVjqmy+mRsfI+sZCsneEkoMjIx9FLLMGjxyINCe74eloPDhXCFUD2
         hSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719057488; x=1719662288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCRAzBUWtxcC0Ac/wfC3ONJAhr59pRM1qpSt6icgs+A=;
        b=PvF7J9r5hZMDpohyMWsm2tV9lTGe8SFi1YnlMRFX9U2guSjls97A1AEgGQrzX61g4N
         zyzY8qmOQSSJYg/qNtguAUngHGCQmPBonxghe5WUSBNhwJ/RJR+ovzFTNtbsoWGZ87v/
         vtDQyif4P+7JGWT+Z5kaOgUZFRP/yYcE+NjVx9jyRDSxYBjRcBpzvvDe5RdfbgqxmtdY
         QGoRgywLvhgr6hEpt0LMdaCQofgSk4iDNhxKTsLE28HIdDN6T8WWiBUjBLrqn8QNDLmP
         NsHJENWw/+lh3loHx6ayAExlpS3Js7bmi9suXC1jT22d7ThSNZYqa/IunWLMQAxrJf2H
         Rc7w==
X-Gm-Message-State: AOJu0YzDB7uXaQDUTeEdpfyNcHQ432tocEFTC9yK4GxpaJA7euqi/KqX
	zbi7V0RhgIhjLyTbsSi4CT8A+UsVNCc+qTO503yfMr91MXEu4pLRRn3rXDrLjmFCKD3R9n8EOva
	t
X-Google-Smtp-Source: AGHT+IH7OU1IjfWpK+Qzs3tT1W1Qusy1GO6aWAXAbw9Q1BO9iA4XZCn66pouQC2mlS+m7u0LKGX69Q==
X-Received: by 2002:a05:6359:4584:b0:19f:56b2:83f9 with SMTP id e5c5f4694b2df-1a1fd60c157mr1228124955d.28.1719057487805;
        Sat, 22 Jun 2024 04:58:07 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-716b364687bsm2101074a12.12.2024.06.22.04.58.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 04:58:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/9] openssl: Upgrade 3.0.13 -> 3.0.14
Date: Sat, 22 Jun 2024 04:57:33 -0700
Message-Id: <8f51bac2a05747ea186e928eda2358f2e6295883.1719057291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719057291.git.steve@sakoman.com>
References: <cover.1719057291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 11:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201044

From: Siddharth <sdoshi@mvista.com>

CVE's Fixed by upgrade:
CVE-2024-4741: Fixed potential use after free after SSL_free_buffers() is called
CVE-2024-4603: Fixed an issue where checking excessively long DSA keys or parameters may be very slow
CVE-2024-2511: Fixed unbounded memory growth with session handling in TLSv1.3

Removed backports of CVE-2024-2511 and CVE-2024-4603 as they are already
fixed.

Detailed Information:
https://github.com/openssl/openssl/blob/openssl-3.0/CHANGES.md#changes-between-3013-and-3014-4-jun-2024

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/openssl/CVE-2024-2511.patch       | 122 ------------
 .../openssl/openssl/CVE-2024-4603.patch       | 180 ------------------
 .../{openssl_3.0.13.bb => openssl_3.0.14.bb}  |   4 +-
 3 files changed, 1 insertion(+), 305 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-4603.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.0.13.bb => openssl_3.0.14.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch
deleted file mode 100644
index 8aea686205..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From b52867a9f618bb955bed2a3ce3db4d4f97ed8e5d Mon Sep 17 00:00:00 2001
-From: Matt Caswell <matt@openssl.org>
-Date: Tue, 5 Mar 2024 15:43:53 +0000
-Subject: [PATCH] Fix unconstrained session cache growth in TLSv1.3
-
-In TLSv1.3 we create a new session object for each ticket that we send.
-We do this by duplicating the original session. If SSL_OP_NO_TICKET is in
-use then the new session will be added to the session cache. However, if
-early data is not in use (and therefore anti-replay protection is being
-used), then multiple threads could be resuming from the same session
-simultaneously. If this happens and a problem occurs on one of the threads,
-then the original session object could be marked as not_resumable. When we
-duplicate the session object this not_resumable status gets copied into the
-new session object. The new session object is then added to the session
-cache even though it is not_resumable.
-
-Subsequently, another bug means that the session_id_length is set to 0 for
-sessions that are marked as not_resumable - even though that session is
-still in the cache. Once this happens the session can never be removed from
-the cache. When that object gets to be the session cache tail object the
-cache never shrinks again and grows indefinitely.
-
-CVE-2024-2511
-
-Reviewed-by: Neil Horman <nhorman@openssl.org>
-Reviewed-by: Tomas Mraz <tomas@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/24044)
-
-(cherry picked from commit 7e4d731b1c07201ad9374c1cd9ac5263bdf35bce)
-
-CVE: CVE-2024-2511
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/b52867a9f618bb955bed2a3ce3db4d4f97ed8e5d]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- ssl/ssl_lib.c            |  5 +++--
- ssl/ssl_sess.c           | 28 ++++++++++++++++++++++------
- ssl/statem/statem_srvr.c |  5 ++---
- 3 files changed, 27 insertions(+), 11 deletions(-)
-
-diff --git a/ssl/ssl_lib.c b/ssl/ssl_lib.c
-index 2c8479eb5fc69..eed649c6fdee9 100644
---- a/ssl/ssl_lib.c
-+++ b/ssl/ssl_lib.c
-@@ -3736,9 +3736,10 @@ void ssl_update_cache(SSL *s, int mode)
- 
-     /*
-      * If the session_id_length is 0, we are not supposed to cache it, and it
--     * would be rather hard to do anyway :-)
-+     * would be rather hard to do anyway :-). Also if the session has already
-+     * been marked as not_resumable we should not cache it for later reuse.
-      */
--    if (s->session->session_id_length == 0)
-+    if (s->session->session_id_length == 0 || s->session->not_resumable)
-         return;
- 
-     /*
-diff --git a/ssl/ssl_sess.c b/ssl/ssl_sess.c
-index d836b33ed0e81..75adbd9e52b40 100644
---- a/ssl/ssl_sess.c
-+++ b/ssl/ssl_sess.c
-@@ -152,16 +152,11 @@ SSL_SESSION *SSL_SESSION_new(void)
-     return ss;
- }
- 
--SSL_SESSION *SSL_SESSION_dup(const SSL_SESSION *src)
--{
--    return ssl_session_dup(src, 1);
--}
--
- /*
-  * Create a new SSL_SESSION and duplicate the contents of |src| into it. If
-  * ticket == 0 then no ticket information is duplicated, otherwise it is.
-  */
--SSL_SESSION *ssl_session_dup(const SSL_SESSION *src, int ticket)
-+static SSL_SESSION *ssl_session_dup_intern(const SSL_SESSION *src, int ticket)
- {
-     SSL_SESSION *dest;
- 
-@@ -285,6 +280,27 @@ SSL_SESSION *ssl_session_dup(const SSL_SESSION *src, int ticket)
-     return NULL;
- }
- 
-+SSL_SESSION *SSL_SESSION_dup(const SSL_SESSION *src)
-+{
-+    return ssl_session_dup_intern(src, 1);
-+}
-+
-+/*
-+ * Used internally when duplicating a session which might be already shared.
-+ * We will have resumed the original session. Subsequently we might have marked
-+ * it as non-resumable (e.g. in another thread) - but this copy should be ok to
-+ * resume from.
-+ */
-+SSL_SESSION *ssl_session_dup(const SSL_SESSION *src, int ticket)
-+{
-+    SSL_SESSION *sess = ssl_session_dup_intern(src, ticket);
-+
-+    if (sess != NULL)
-+        sess->not_resumable = 0;
-+
-+    return sess;
-+}
-+
- const unsigned char *SSL_SESSION_get_id(const SSL_SESSION *s, unsigned int *len)
- {
-     if (len)
-diff --git a/ssl/statem/statem_srvr.c b/ssl/statem/statem_srvr.c
-index a9e67f9d32a77..6c942e6bcec29 100644
---- a/ssl/statem/statem_srvr.c
-+++ b/ssl/statem/statem_srvr.c
-@@ -2338,9 +2338,8 @@ int tls_construct_server_hello(SSL *s, WPACKET *pkt)
-      * so the following won't overwrite an ID that we're supposed
-      * to send back.
-      */
--    if (s->session->not_resumable ||
--        (!(s->ctx->session_cache_mode & SSL_SESS_CACHE_SERVER)
--         && !s->hit))
-+    if (!(s->ctx->session_cache_mode & SSL_SESS_CACHE_SERVER)
-+            && !s->hit)
-         s->session->session_id_length = 0;
- 
-     if (usetls13) {
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-4603.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4603.patch
deleted file mode 100644
index b8e0b9fb7d..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2024-4603.patch
+++ /dev/null
@@ -1,180 +0,0 @@
-From 3559e868e58005d15c6013a0c1fd832e51c73397 Mon Sep 17 00:00:00 2001
-From: Tomas Mraz <tomas@openssl.org>
-Date: Wed, 8 May 2024 15:23:45 +0200
-Subject: [PATCH] Check DSA parameters for excessive sizes before validating
-
-This avoids overly long computation of various validation
-checks.
-
-Fixes CVE-2024-4603
-
-Reviewed-by: Paul Dale <ppzgs1@gmail.com>
-Reviewed-by: Matt Caswell <matt@openssl.org>
-Reviewed-by: Neil Horman <nhorman@openssl.org>
-Reviewed-by: Shane Lontis <shane.lontis@oracle.com>
-(Merged from https://github.com/openssl/openssl/pull/24346)
-
-(cherry picked from commit 85ccbab216da245cf9a6503dd327072f21950d9b)
-
-<dropped CHANGES.md modifications as it would need backport of all previous changes>
-
-CVE: CVE-2024-4603
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/3559e868e58005d15c6013a0c1fd832e51c73397]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- crypto/dsa/dsa_check.c                        | 44 ++++++++++++--
- .../invalid/p10240_q256_too_big.pem           | 57 +++++++++++++++++++
- 2 files changed, 97 insertions(+), 4 deletions(-)
- create mode 100644 test/recipes/15-test_dsaparam_data/invalid/p10240_q256_too_big.pem
-
-diff --git a/crypto/dsa/dsa_check.c b/crypto/dsa/dsa_check.c
-index fb0e9129a2..122449a7bf 100644
---- a/crypto/dsa/dsa_check.c
-+++ b/crypto/dsa/dsa_check.c
-@@ -19,8 +19,34 @@
- #include "dsa_local.h"
- #include "crypto/dsa.h"
- 
-+static int dsa_precheck_params(const DSA *dsa, int *ret)
-+{
-+    if (dsa->params.p == NULL || dsa->params.q == NULL) {
-+        ERR_raise(ERR_LIB_DSA, DSA_R_BAD_FFC_PARAMETERS);
-+        *ret = FFC_CHECK_INVALID_PQ;
-+        return 0;
-+    }
-+
-+    if (BN_num_bits(dsa->params.p) > OPENSSL_DSA_MAX_MODULUS_BITS) {
-+        ERR_raise(ERR_LIB_DSA, DSA_R_MODULUS_TOO_LARGE);
-+        *ret = FFC_CHECK_INVALID_PQ;
-+        return 0;
-+    }
-+
-+    if (BN_num_bits(dsa->params.q) >= BN_num_bits(dsa->params.p)) {
-+        ERR_raise(ERR_LIB_DSA, DSA_R_BAD_Q_VALUE);
-+        *ret = FFC_CHECK_INVALID_PQ;
-+        return 0;
-+    }
-+
-+    return 1;
-+}
-+
- int ossl_dsa_check_params(const DSA *dsa, int checktype, int *ret)
- {
-+    if (!dsa_precheck_params(dsa, ret))
-+        return 0;
-+
-     if (checktype == OSSL_KEYMGMT_VALIDATE_QUICK_CHECK)
-         return ossl_ffc_params_simple_validate(dsa->libctx, &dsa->params,
-                                                FFC_PARAM_TYPE_DSA, ret);
-@@ -39,6 +65,9 @@ int ossl_dsa_check_params(const DSA *dsa, int checktype, int *ret)
-  */
- int ossl_dsa_check_pub_key(const DSA *dsa, const BIGNUM *pub_key, int *ret)
- {
-+    if (!dsa_precheck_params(dsa, ret))
-+        return 0;
-+
-     return ossl_ffc_validate_public_key(&dsa->params, pub_key, ret)
-            && *ret == 0;
- }
-@@ -50,6 +79,9 @@ int ossl_dsa_check_pub_key(const DSA *dsa, const BIGNUM *pub_key, int *ret)
-  */
- int ossl_dsa_check_pub_key_partial(const DSA *dsa, const BIGNUM *pub_key, int *ret)
- {
-+    if (!dsa_precheck_params(dsa, ret))
-+        return 0;
-+
-     return ossl_ffc_validate_public_key_partial(&dsa->params, pub_key, ret)
-            && *ret == 0;
- }
-@@ -58,8 +90,10 @@ int ossl_dsa_check_priv_key(const DSA *dsa, const BIGNUM *priv_key, int *ret)
- {
-     *ret = 0;
- 
--    return (dsa->params.q != NULL
--            && ossl_ffc_validate_private_key(dsa->params.q, priv_key, ret));
-+    if (!dsa_precheck_params(dsa, ret))
-+        return 0;
-+
-+    return ossl_ffc_validate_private_key(dsa->params.q, priv_key, ret);
- }
- 
- /*
-@@ -72,8 +106,10 @@ int ossl_dsa_check_pairwise(const DSA *dsa)
-     BN_CTX *ctx = NULL;
-     BIGNUM *pub_key = NULL;
- 
--    if (dsa->params.p == NULL
--        || dsa->params.g == NULL
-+    if (!dsa_precheck_params(dsa, &ret))
-+        return 0;
-+
-+    if (dsa->params.g == NULL
-         || dsa->priv_key == NULL
-         || dsa->pub_key == NULL)
-         return 0;
-diff --git a/test/recipes/15-test_dsaparam_data/invalid/p10240_q256_too_big.pem b/test/recipes/15-test_dsaparam_data/invalid/p10240_q256_too_big.pem
-new file mode 100644
-index 0000000000..e85e2953b7
---- /dev/null
-+++ b/test/recipes/15-test_dsaparam_data/invalid/p10240_q256_too_big.pem
-@@ -0,0 +1,57 @@
-+-----BEGIN DSA PARAMETERS-----
-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
-+vKuje86bePD6kD/LH3wmkA==
-+-----END DSA PARAMETERS-----
--- 
-2.30.2
-
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb b/meta/recipes-connectivity/openssl/openssl_3.0.14.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_3.0.13.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.14.bb
index 87ab4047d9..021787adcb 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.14.bb
@@ -12,15 +12,13 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
-           file://CVE-2024-2511.patch \
-           file://CVE-2024-4603.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "88525753f79d3bec27d2fa7c66aa0b92b3aa9498dafd93d7cfa4b3780cdae313"
+SRC_URI[sha256sum] = "eeca035d4dd4e84fc25846d952da6297484afa0650a6f84c682e39df3a4123ca"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.34.1


