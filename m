Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883C9C5DF94
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 17:53:14 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.579.1787334791662669563
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 10:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=E1nvS1fw;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6689f36ae56so2293711d50.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 10:53:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787334791; cv=none;
        d=google.com; s=arc-20260327;
        b=eUGPK+jrtoRORdsFQcHr+WEzajkSRWkU9dKj2MniSx47+sXtSLuCugETxXNnWjAL4J
         X1FYQkg0QBqqZ30dKTaEOxWK1U7J177Va6lm1AhXQGVhToV8ZfgSv6BrdvWDJplFWmzU
         vIMXwPDZuNTsgvfExhcH476sqGWZTaTXc/TTbgw/Z0Hp50Gk5oIJf+AL4/bm7z/iPX6p
         HOdNAg7zDGU0s8nDQ/JDiU/XfvTlrkhyPylF7VkqV7G7uZfHkyi0oft3UMnsCNIhT4WK
         F/OIi0gWveEv+1xUXkIEXiIOr8+g4fz+EeC4Vsqh3gDhXMwMZiJ88UEdZMmp1ST9m+PU
         C8yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/5ffT9tv3CiVqlBcaoOQMo/F2MKZfBl85pYoHVK01bk=;
        fh=6Z4xUuTqkcxNv6cvnn0HdSGcZYvnhz2BRm++iEwx924=;
        b=qsGqjgnETT8dgwkmr5dLvJpPb1Z0wLg+dv9y0TMWOpDseUIzqQVQdI95rmOBxjLMvR
         /0lWKXG8rwIoQ4jT1CblFeiCPQNSQ1BbzThDbyHJHfH+sRKDifPqbIy1AnTGjvcqSfAd
         zSlD5YdbcDeAggJiJp6Qb9AirkSn5ZrU6z+2O0BYra88V8gXrWruXUtSa12zDX/n+3ym
         zqZAGGCxrSTmPtIYrJry0hB9smMKVkhczhbVuSKQJCcu0PVi3WcJWZ64OPy7RNL12Rmz
         T+8FTz28tjIJZFcK7S0nCiJjpiFnWMZdk3PrEqm8V5WhcPecY5Zmut2OStpF/iCPmrMn
         cpeQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787334791; x=1787939591; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/5ffT9tv3CiVqlBcaoOQMo/F2MKZfBl85pYoHVK01bk=;
        b=E1nvS1fw1xH2MMMdn/DeClzbHQWBlexxHc5wRjcaIAEc+6tzF8QFwBplVLQoA2Cjme
         D8pXsyqAPmM6SwMMtI8JwzOANAuhsx+z/eGT++iVLltvwsHcYm6nZR3cSC8GZIhc6hJC
         sfMNkNTu9rp2KA4CuXphgkW6d4k4OCrDq3J78KbAKuVmA5fLYjAT++WdunIJEStWKnAi
         t3WxXSReDp/GRZ3FanGYVu5zRPoAo/2huRY+s8/cfI9syWguaWDkzheXTCL6hIYMUuHe
         CTAi9m0t16VUhxN0qt9zx9DCgKqsJEXL+QZ9DR0N4O0gan/7uizQ+Z/s60aWhucARLcm
         BaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787334791; x=1787939591;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/5ffT9tv3CiVqlBcaoOQMo/F2MKZfBl85pYoHVK01bk=;
        b=C72fPKD4A/VMoJ2CiskXCgxzTs230AiFD7sZghLDkmN+86p0uv6aUNVEdGiAJ+g28W
         fl0QydTBxNlFc6SQstn76Ga93mQpLK2O9aiB0zqRrt+Ft84Lfs3jQXDgdMEDDjRJMNhK
         Oe6m8sMzJJkZdQCjE4yXdqX4+tHlvsY1NSX+ki02a+yGXJQttLUy0OB9Ku1t5VkvX/di
         KFGeqw+t07AvWCaYrB2j3bV/RDDnrzAOm1tNPls3BmQykztF2gaO7w1stRGboxmrx1zj
         +/5qGoAsnap1rlO3g4OUmUA4lZYr0ynu5D1RWbM6SwBU0mi6v6CSeeAWQ4W0ZjEKucnL
         WH9g==
X-Gm-Message-State: AFuF++lubKvbeAixiNnGtI2wItFtpt1XipV0keN48KvjovIbym5BlOWA
	DFvvUraOBy8+qj85IAKKHH3leYs2h9lFzaW0hO+6/aVLMvsfD5Ck2GN/hM/FniQTjf+wcLS6A4f
	CjY/aRrQzSm44QM8nxxQCqtyjmqoeBJP1mXur
X-Gm-Gg: AR+sD12/x1L3ARt1yutAZjxaCw+rx6kREQuhBTW6rgLsc4TkUx73Rul/NK96V+zT6Lg
	qkOwQAdlABFSPziJFmqH4pxdiIr47jr1o+jY+8BSjfbBD/OZ/TY2VzuRFlb5ZpEINISIVBflLGX
	lOVfJ4AcqlgSG2isNi4LGLPe6KCtrQEnaudrIApr9KOZLwomX4h8XcPLNBGZ4F4XA7VieoG11W9
	P1nit2Ig56RIi7ULBK1lXclp5J0KUOFJ4Q7m7aMDiU47gLhT5uJBkgL3LcDox/pejdL7hGMoDH4
	Lxa3W+3P580Oswpekzb7uwylAiqvtxx0kDm/NGfwjBrOn1AvJkO5pxqf5cb7FTp54FKCLueh6Hv
	z+dtL5eZ8OVQxm42YcAiBfTmVlzSWgILt4EMxtQHuUWnA261W82zLW0Vqp/XYHlZYaiOm+hPIGy
	wq0jFBv4w/RHDgBOXEqRLNWrn0Z0JS9xsPIszlP1UpI5UdGTnq5CK6S1Fimt7sHpVMWrN4bst0H
	n55bWYTyKRSOQ==
X-Received: by 2002:a05:690e:1756:b0:66b:35d2:b512 with SMTP id
 956f58d0204a3-66ce4b54df3mr2469692d50.48.1787334790386; Fri, 21 Aug 2026
 10:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260820181022.44434-1-jaipaul.cheernam@est.tech> <20260820181022.44434-2-jaipaul.cheernam@est.tech>
In-Reply-To: <20260820181022.44434-2-jaipaul.cheernam@est.tech>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Aug 2026 10:52:43 -0700
X-Gm-Features: AcwNN1Wdnit_Z-usB9CeN2abOsGKyybxuivani1QIqe9fZ3p6JcjU09H_lN7aHg
Message-ID: <CAMKF1soPi8PQjPywPhfaC5CpgMTm60nwbfX8N=Ymh41Q5uP_Rg@mail.gmail.com>
Subject: Re: [OE-core] [RFC v2 1/6] openssl: upgrade 3.5.7 -> 4.0.1
To: jaipaul.cheernam@est.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004697b30659924f5d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 17:53:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243949

--0000000000004697b30659924f5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

what do we do with the packages that depend on openssl-engines package ?
e.g. freediameter in meta-networking ?

On Thu, Aug 20, 2026 at 11:10=E2=80=AFAM Jaipaul Cheernam via lists.openemb=
edded.org
<jaipaul.cheernam=3Dest.tech@lists.openembedded.org> wrote:

> Upgrade OpenSSL from 3.5.7 to 4.0.1. This is a major version upgrade.
>
> Changelog:
> https://github.com/openssl/openssl/blob/openssl-4.0.1/CHANGES.md
>
> New CVE fixes not already in 3.5.7:
>   * CVE-2026-28386: Fixed OOB read in AES-CFB-128 on x86-64 with AVX-512
>   * CVE-2026-35188: Fixed double-free when checking OCSP stapled response
>   * CVE-2026-42765: Fixed NULL deref in cert verification with OCSP
>   * CVE-2026-42771: Fixed OOB read in X509_VERIFY_PARAM_set1_email()
>
> Major breaking changes in 4.0.0:
>   * Removed support for engines. The ENGINE API is fully removed.
>   * Removed support for SSLv3. SSLv3 has been deprecated since 2015.
>   * Removed support for the SSLv2 Client Hello.
>   * Removed per-version TLS method functions (SSLv3_method(),
>     TLSv1_method(), TLSv1_1_method(), TLSv1_2_method()).
>   * Removed c_rehash script tool. Use 'openssl rehash' instead.
>   * ASN1_STRING has been made opaque.
>   * Numerous API function signatures changed to include const qualifiers.
>   * libcrypto no longer cleans up globally allocated data via atexit().
>   * Added AKID verification checks when X509_V_FLAG_X509_STRICT is set.
>   * Support of deprecated elliptic curves in TLS disabled at compile-time
>     by default.
>
> Recipe changes:
>   * Drop 0001-Added-handshake-history-reporting-when-test-fails.patch
>     (merged upstream via PR #22481).
>   * Refresh remaining patches against the new version.
>   * Remove ENGINE API artifacts: engines package, dasync.so/ossltest.so
>     ptest installation, ENGINESDIR references, OPENSSL_ENGINES wrapper
>     variable, and cryptodev-linux PACKAGECONFIG.
>
> Tested: ptest on qemux86-64:
>   Files=3D362, Tests=3D4310, Result: PASS
>   Passed: 338, Skipped: 24 (fips, lms, rc5, tfo, compression,
>   sslversions, sslkeylogfile, external tests - all expected)
>   Failed: 0
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  ...ke-history-reporting-when-test-fails.patch | 366 ------------------
>  ...1-Configure-do-not-tweak-mips-cflags.patch |   6 +-
>  ...sysroot-and-debug-prefix-map-from-co.patch |  11 +-
>  .../0001-extend-check_cwm-test-timeout.patch  |   4 +-
>  .../{openssl_3.5.7.bb =3D> openssl_4.0.1.bb}    |  23 +-
>  5 files changed, 16 insertions(+), 394 deletions(-)
>  delete mode 100644
> meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-re=
porting-when-test-fails.patch
>  rename meta/recipes-connectivity/openssl/{openssl_3.5.7.bb =3D>
> openssl_4.0.1.bb} (88%)
>
> diff --git
> a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-=
reporting-when-test-fails.patch
> b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-=
reporting-when-test-fails.patch
> deleted file mode 100644
> index a74c79303f..0000000000
> ---
> a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-=
reporting-when-test-fails.patch
> +++ /dev/null
> @@ -1,366 +0,0 @@
> -From 5ba65051fea0513db0d997f0ab7cafb9826ed74a Mon Sep 17 00:00:00 2001
> -From: William Lyu <William.Lyu@windriver.com>
> -Date: Fri, 20 Oct 2023 16:22:37 -0400
> -Subject: [PATCH] Added handshake history reporting when test fails
> -
> -Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/2248=
1
> ]
> -
> -Signed-off-by: William Lyu <William.Lyu@windriver.com>
> ----
> - test/helpers/handshake.c | 136 ++++++++++++++++++++++++++++++---------
> - test/helpers/handshake.h |  70 +++++++++++++++++++-
> - test/ssl_test.c          |  44 +++++++++++++
> - 3 files changed, 217 insertions(+), 33 deletions(-)
> -
> -diff --git a/test/helpers/handshake.c b/test/helpers/handshake.c
> -index f611b3a..5703b48 100644
> ---- a/test/helpers/handshake.c
> -+++ b/test/helpers/handshake.c
> -@@ -25,6 +25,102 @@
> - #include <netinet/sctp.h>
> - #endif
> -
> -+/* Shamelessly copied from test/helpers/ssl_test_ctx.c */
> -+/* Maps string names to various enumeration type */
> -+typedef struct {
> -+    const char *name;
> -+    int value;
> -+} enum_name_map;
> -+
> -+static const enum_name_map connect_phase_names[] =3D {
> -+    {"Handshake", HANDSHAKE},
> -+    {"RenegAppData", RENEG_APPLICATION_DATA},
> -+    {"RenegSetup", RENEG_SETUP},
> -+    {"RenegHandshake", RENEG_HANDSHAKE},
> -+    {"AppData", APPLICATION_DATA},
> -+    {"Shutdown", SHUTDOWN},
> -+    {"ConnectionDone", CONNECTION_DONE}
> -+};
> -+
> -+static const enum_name_map peer_status_names[] =3D {
> -+    {"PeerSuccess", PEER_SUCCESS},
> -+    {"PeerRetry", PEER_RETRY},
> -+    {"PeerError", PEER_ERROR},
> -+    {"PeerWaiting", PEER_WAITING},
> -+    {"PeerTestFail", PEER_TEST_FAILURE}
> -+};
> -+
> -+static const enum_name_map handshake_status_names[] =3D {
> -+    {"HandshakeSuccess", HANDSHAKE_SUCCESS},
> -+    {"ClientError", CLIENT_ERROR},
> -+    {"ServerError", SERVER_ERROR},
> -+    {"InternalError", INTERNAL_ERROR},
> -+    {"HandshakeRetry", HANDSHAKE_RETRY}
> -+};
> -+
> -+/* Shamelessly copied from test/helpers/ssl_test_ctx.c */
> -+static const char *enum_name(const enum_name_map *enums, size_t
> num_enums,
> -+                             int value)
> -+{
> -+    size_t i;
> -+    for (i =3D 0; i < num_enums; i++) {
> -+        if (enums[i].value =3D=3D value) {
> -+            return enums[i].name;
> -+        }
> -+    }
> -+    return "InvalidValue";
> -+}
> -+
> -+const char *handshake_connect_phase_name(connect_phase_t phase)
> -+{
> -+    return enum_name(connect_phase_names,
> OSSL_NELEM(connect_phase_names),
> -+                     (int)phase);
> -+}
> -+
> -+const char *handshake_status_name(handshake_status_t handshake_status)
> -+{
> -+    return enum_name(handshake_status_names,
> OSSL_NELEM(handshake_status_names),
> -+                     (int)handshake_status);
> -+}
> -+
> -+const char *handshake_peer_status_name(peer_status_t peer_status)
> -+{
> -+    return enum_name(peer_status_names, OSSL_NELEM(peer_status_names),
> -+                     (int)peer_status);
> -+}
> -+
> -+static void save_loop_history(HANDSHAKE_HISTORY *history,
> -+                              connect_phase_t phase,
> -+                              handshake_status_t handshake_status,
> -+                              peer_status_t server_status,
> -+                              peer_status_t client_status,
> -+                              int client_turn_count,
> -+                              int is_client_turn)
> -+{
> -+    HANDSHAKE_HISTORY_ENTRY *new_entry =3D NULL;
> -+
> -+    /*
> -+     * Create a new history entry for a handshake loop with statuses
> given in
> -+     * the arguments. Potentially evicting the oldest entry when the
> -+     * ring buffer is full.
> -+     */
> -+    ++(history->last_idx);
> -+    history->last_idx &=3D MAX_HANDSHAKE_HISTORY_ENTRY_IDX_MASK;
> -+
> -+    new_entry =3D &((history->entries)[history->last_idx]);
> -+    new_entry->phase =3D phase;
> -+    new_entry->handshake_status =3D handshake_status;
> -+    new_entry->server_status =3D server_status;
> -+    new_entry->client_status =3D client_status;
> -+    new_entry->client_turn_count =3D client_turn_count;
> -+    new_entry->is_client_turn =3D is_client_turn;
> -+
> -+    /* Evict the oldest handshake loop entry when the ring buffer is
> full. */
> -+    if (history->entry_count < MAX_HANDSHAKE_HISTORY_ENTRY) {
> -+        ++(history->entry_count);
> -+    }
> -+}
> -+
> - HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void)
> - {
> -     HANDSHAKE_RESULT *ret;
> -@@ -724,15 +820,6 @@ static void configure_handshake_ssl(SSL *server, SS=
L
> *client,
> -         SSL_set_post_handshake_auth(client, 1);
> - }
> -
> --/* The status for each connection phase. */
> --typedef enum {
> --    PEER_SUCCESS,
> --    PEER_RETRY,
> --    PEER_ERROR,
> --    PEER_WAITING,
> --    PEER_TEST_FAILURE
> --} peer_status_t;
> --
> - /* An SSL object and associated read-write buffers. */
> - typedef struct peer_st {
> -     SSL *ssl;
> -@@ -1077,16 +1164,6 @@ static void do_shutdown_step(PEER *peer)
> -     }
> - }
> -
> --typedef enum {
> --    HANDSHAKE,
> --    RENEG_APPLICATION_DATA,
> --    RENEG_SETUP,
> --    RENEG_HANDSHAKE,
> --    APPLICATION_DATA,
> --    SHUTDOWN,
> --    CONNECTION_DONE
> --} connect_phase_t;
> --
> - static int renegotiate_op(const SSL_TEST_CTX *test_ctx)
> - {
> -     switch (test_ctx->handshake_mode) {
> -@@ -1164,19 +1241,6 @@ static void do_connect_step(const SSL_TEST_CTX
> *test_ctx, PEER *peer,
> -     }
> - }
> -
> --typedef enum {
> --    /* Both parties succeeded. */
> --    HANDSHAKE_SUCCESS,
> --    /* Client errored. */
> --    CLIENT_ERROR,
> --    /* Server errored. */
> --    SERVER_ERROR,
> --    /* Peers are in inconsistent state. */
> --    INTERNAL_ERROR,
> --    /* One or both peers not done. */
> --    HANDSHAKE_RETRY
> --} handshake_status_t;
> --
> - /*
> -  * Determine the handshake outcome.
> -  * last_status: the status of the peer to have acted last.
> -@@ -1541,6 +1605,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
> -
> -     start =3D time(NULL);
> -
> -+    save_loop_history(&(ret->history),
> -+                      phase, status, server.status, client.status,
> -+                      client_turn_count, client_turn);
> -+
> -     /*
> -      * Half-duplex handshake loop.
> -      * Client and server speak to each other synchronously in the same
> process.
> -@@ -1562,6 +1630,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
> -                 0 /* server went last */);
> -         }
> -
> -+        save_loop_history(&(ret->history),
> -+                          phase, status, server.status, client.status,
> -+                          client_turn_count, client_turn);
> -+
> -         switch (status) {
> -         case HANDSHAKE_SUCCESS:
> -             client_turn_count =3D 0;
> -diff --git a/test/helpers/handshake.h b/test/helpers/handshake.h
> -index 78b03f9..b9967c2 100644
> ---- a/test/helpers/handshake.h
> -+++ b/test/helpers/handshake.h
> -@@ -1,5 +1,5 @@
> - /*
> -- * Copyright 2016-2021 The OpenSSL Project Authors. All Rights Reserved=
.
> -+ * Copyright 2016-2023 The OpenSSL Project Authors. All Rights Reserved=
.
> -  *
> -  * Licensed under the Apache License 2.0 (the "License").  You may not
> use
> -  * this file except in compliance with the License.  You can obtain a
> copy
> -@@ -12,6 +12,11 @@
> -
> - #include "ssl_test_ctx.h"
> -
> -+#define MAX_HANDSHAKE_HISTORY_ENTRY_BIT 4
> -+#define MAX_HANDSHAKE_HISTORY_ENTRY (1 <<
> MAX_HANDSHAKE_HISTORY_ENTRY_BIT)
> -+#define MAX_HANDSHAKE_HISTORY_ENTRY_IDX_MASK \
> -+    ((1 << MAX_HANDSHAKE_HISTORY_ENTRY_BIT) - 1)
> -+
> - typedef struct ctx_data_st {
> -     unsigned char *npn_protocols;
> -     size_t npn_protocols_len;
> -@@ -22,6 +27,63 @@ typedef struct ctx_data_st {
> -     char *session_ticket_app_data;
> - } CTX_DATA;
> -
> -+typedef enum {
> -+    HANDSHAKE,
> -+    RENEG_APPLICATION_DATA,
> -+    RENEG_SETUP,
> -+    RENEG_HANDSHAKE,
> -+    APPLICATION_DATA,
> -+    SHUTDOWN,
> -+    CONNECTION_DONE
> -+} connect_phase_t;
> -+
> -+/* The status for each connection phase. */
> -+typedef enum {
> -+    PEER_SUCCESS,
> -+    PEER_RETRY,
> -+    PEER_ERROR,
> -+    PEER_WAITING,
> -+    PEER_TEST_FAILURE
> -+} peer_status_t;
> -+
> -+typedef enum {
> -+    /* Both parties succeeded. */
> -+    HANDSHAKE_SUCCESS,
> -+    /* Client errored. */
> -+    CLIENT_ERROR,
> -+    /* Server errored. */
> -+    SERVER_ERROR,
> -+    /* Peers are in inconsistent state. */
> -+    INTERNAL_ERROR,
> -+    /* One or both peers not done. */
> -+    HANDSHAKE_RETRY
> -+} handshake_status_t;
> -+
> -+/* Stores the various status information in a handshake loop. */
> -+typedef struct handshake_history_entry_st {
> -+    connect_phase_t phase;
> -+    handshake_status_t handshake_status;
> -+    peer_status_t server_status;
> -+    peer_status_t client_status;
> -+    int client_turn_count;
> -+    int is_client_turn;
> -+} HANDSHAKE_HISTORY_ENTRY;
> -+
> -+typedef struct handshake_history_st {
> -+    /* Implemented using ring buffer. */
> -+    /*
> -+     * The valid entries are |entries[last_idx]|, |entries[last_idx-1]|=
,
> -+     * ..., etc., going up to |entry_count| number of entries. Note tha=
t
> when
> -+     * the index into the array |entries| becomes < 0, we wrap around t=
o
> -+     * the end of |entries|.
> -+     */
> -+    HANDSHAKE_HISTORY_ENTRY entries[MAX_HANDSHAKE_HISTORY_ENTRY];
> -+    /* The number of valid entries in |entries| array. */
> -+    size_t entry_count;
> -+    /* The index of the last valid entry in the |entries| array. */
> -+    size_t last_idx;
> -+} HANDSHAKE_HISTORY;
> -+
> - typedef struct handshake_result {
> -     ssl_test_result_t result;
> -     /* These alerts are in the 2-byte format returned by the
> info_callback. */
> -@@ -77,6 +139,8 @@ typedef struct handshake_result {
> -     char *cipher;
> -     /* session ticket application data */
> -     char *result_session_ticket_app_data;
> -+    /* handshake loop history */
> -+    HANDSHAKE_HISTORY history;
> - } HANDSHAKE_RESULT;
> -
> - HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void);
> -@@ -95,4 +159,8 @@ int configure_handshake_ctx_for_srp(SSL_CTX
> *server_ctx, SSL_CTX *server2_ctx,
> -     CTX_DATA *server2_ctx_data,
> -     CTX_DATA *client_ctx_data);
> -
> -+const char *handshake_connect_phase_name(connect_phase_t phase);
> -+const char *handshake_status_name(handshake_status_t handshake_status);
> -+const char *handshake_peer_status_name(peer_status_t peer_status);
> -+
> - #endif /* OSSL_TEST_HANDSHAKE_HELPER_H */
> -diff --git a/test/ssl_test.c b/test/ssl_test.c
> -index ea60851..9d6b093 100644
> ---- a/test/ssl_test.c
> -+++ b/test/ssl_test.c
> -@@ -26,6 +26,44 @@ static OSSL_LIB_CTX *libctx =3D NULL;
> - /* Currently the section names are of the form test-<number>, e.g.
> test-15. */
> - #define MAX_TESTCASE_NAME_LENGTH 100
> -
> -+static void print_handshake_history(const HANDSHAKE_HISTORY *history)
> -+{
> -+    size_t first_idx;
> -+    size_t i;
> -+    size_t cur_idx;
> -+    const HANDSHAKE_HISTORY_ENTRY *cur_entry;
> -+    const char header_template[] =3D "|%14s|%16s|%16s|%16s|%17s|%14s|";
> -+    const char body_template[]   =3D "|%14s|%16s|%16s|%16s|%17d|%14s|";
> -+
> -+    TEST_info("The following is the server/client state "
> -+              "in the most recent %d handshake loops.",
> -+              MAX_HANDSHAKE_HISTORY_ENTRY);
> -+
> -+    TEST_note("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D"
> -+              "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D");
> -+    TEST_note(header_template,
> -+              "phase", "handshake status", "server status",
> -+              "client status", "client turn count", "is client turn");
> -+    TEST_note("+--------------+----------------+----------------"
> -+              "+----------------+-----------------+--------------+");
> -+
> -+    first_idx =3D (history->last_idx - history->entry_count + 1) &
> -+                MAX_HANDSHAKE_HISTORY_ENTRY_IDX_MASK;
> -+    for (i =3D 0; i < history->entry_count; ++i) {
> -+        cur_idx =3D (first_idx + i) & MAX_HANDSHAKE_HISTORY_ENTRY_IDX_M=
ASK;
> -+        cur_entry =3D &(history->entries)[cur_idx];
> -+        TEST_note(body_template,
> -+                  handshake_connect_phase_name(cur_entry->phase),
> -+                  handshake_status_name(cur_entry->handshake_status),
> -+                  handshake_peer_status_name(cur_entry->server_status),
> -+                  handshake_peer_status_name(cur_entry->client_status),
> -+                  cur_entry->client_turn_count,
> -+                  cur_entry->is_client_turn ? "true" : "false");
> -+    }
> -+    TEST_note("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D"
> -+              "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D");
> -+}
> -+
> - static const char *print_alert(int alert)
> - {
> -     return alert ? SSL_alert_desc_string_long(alert) : "no alert";
> -@@ -388,6 +426,12 @@ static int check_test(HANDSHAKE_RESULT *result,
> SSL_TEST_CTX *test_ctx)
> -         ret &=3D check_client_sign_type(result, test_ctx);
> -         ret &=3D check_client_ca_names(result, test_ctx);
> -     }
> -+
> -+    /* Print handshake loop history if any check fails. */
> -+    if (!ret) {
> -+        print_handshake_history(&(result->history));
> -+    }
> -+
> -     return ret;
> - }
> -
> ---
> -2.25.1
> -
> diff --git
> a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-m=
ips-cflags.patch
> b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-m=
ips-cflags.patch
> index cd8906df67..77bfe4e4e5 100644
> ---
> a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-m=
ips-cflags.patch
> +++
> b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-m=
ips-cflags.patch
> @@ -1,4 +1,4 @@
> -From 0377f0d5b5c1079e3b9a80881f4dcc891cbe9f9a Mon Sep 17 00:00:00 2001
> +From b5cee0cb0f14a78056ef7722a34b361491f1fdda Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex@linutronix.de>
>  Date: Tue, 30 May 2023 09:11:27 -0700
>  Subject: [PATCH] Configure: do not tweak mips cflags
> @@ -17,10 +17,10 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>   1 file changed, 10 deletions(-)
>
>  diff --git a/Configure b/Configure
> -index fff97bd..5ee54c1 100755
> +index c05a30b..db8adee 100755
>  --- a/Configure
>  +++ b/Configure
> -@@ -1557,16 +1557,6 @@ if ($target =3D~ /^mingw/ && `$config{CC}
> --target-help 2>&1` =3D~ m/-mno-cygwin/m)
> +@@ -1575,16 +1575,6 @@ if ($target =3D~ /^mingw/ && `$config{CC}
> --target-help 2>&1` =3D~ m/-mno-cygwin/m)
>           push @{$config{shared_ldflag}}, "-mno-cygwin";
>           }
>
> diff --git
> a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-=
and-debug-prefix-map-from-co.patch
> b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-=
and-debug-prefix-map-from-co.patch
> index bfbfedbd67..1d9e7539f6 100644
> ---
> a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-=
and-debug-prefix-map-from-co.patch
> +++
> b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-=
and-debug-prefix-map-from-co.patch
> @@ -1,4 +1,4 @@
> -From 5985253f2c9025d7c127443a3a9938946f80c2a1 Mon Sep 17 00:00:00 2001
> +From 6df53bfebcf8ca65910a18220a6576fb110918a5 Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?Martin=3D20Hundeb=3DC3=3DB8ll?=3D <martin@geanix.com>
>  Date: Tue, 6 Nov 2018 14:50:47 +0100
>  Subject: [PATCH] buildinfo: strip sysroot and debug-prefix-map from
> compiler
> @@ -28,17 +28,16 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
>  Update to fix buildpaths qa issue for '-ffile-prefix-map'.
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
>  ---
>   Configurations/unix-Makefile.tmpl | 16 +++++++++++++++-
>   crypto/build.info                 |  2 +-
>   2 files changed, 16 insertions(+), 2 deletions(-)
>
>  diff --git a/Configurations/unix-Makefile.tmpl
> b/Configurations/unix-Makefile.tmpl
> -index 09303c4..011bda1 100644
> +index eff66e5..bc48f51 100644
>  --- a/Configurations/unix-Makefile.tmpl
>  +++ b/Configurations/unix-Makefile.tmpl
> -@@ -514,13 +514,27 @@ BIN_LDFLAGS=3D{- join(' ', $target{bin_lflags} || =
(),
> +@@ -503,13 +503,27 @@ BIN_LDFLAGS=3D{- join(' ', $target{bin_lflags} || =
(),
>                            '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
>   BIN_EX_LIBS=3D$(CNF_EX_LIBS) $(EX_LIBS)
>
> @@ -68,10 +67,10 @@ index 09303c4..011bda1 100644
>
>   # For x86 assembler: Set PROCESSOR to 386 if you want to support
>  diff --git a/crypto/build.info b/crypto/build.info
> -index aee5c46..95c9577 100644
> +index 8e4a885..95b0902 100644
>  --- a/crypto/build.info
>  +++ b/crypto/build.info
> -@@ -115,7 +115,7 @@ DEFINE[../libcrypto]=3D$UPLINKDEF
> +@@ -114,7 +114,7 @@ DEFINE[../libcrypto]=3D$UPLINKDEF
>
>   DEPEND[info.o]=3Dbuildinf.h
>   DEPEND[cversion.o]=3Dbuildinf.h
> diff --git
> a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-ti=
meout.patch
> b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-ti=
meout.patch
> index f6eb28069a..76bc05d5f9 100644
> ---
> a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-ti=
meout.patch
> +++
> b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-ti=
meout.patch
> @@ -1,4 +1,4 @@
> -From c7000672296f4c367341aa3415f26c4d9f5e4749 Mon Sep 17 00:00:00 2001
> +From 14856dbd767621ce6f162680c00557b54af0effb Mon Sep 17 00:00:00 2001
>  From: Gyorgy Sarvari <skandigraun@gmail.com>
>  Date: Thu, 23 Oct 2025 11:24:36 +0200
>  Subject: [PATCH] extend check_cwm test timeout
> @@ -15,7 +15,7 @@ Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>   1 file changed, 5 insertions(+)
>
>  diff --git a/test/radix/main.c b/test/radix/main.c
> -index 4a1e886a71..39f8c61ef9 100644
> +index 0f3dc11..d925639 100644
>  --- a/test/radix/main.c
>  +++ b/test/radix/main.c
>  @@ -25,6 +25,11 @@ static int test_script(int idx)
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
> b/meta/recipes-connectivity/openssl/openssl_4.0.1.bb
> similarity index 88%
> rename from meta/recipes-connectivity/openssl/openssl_3.5.7.bb
> rename to meta/recipes-connectivity/openssl/openssl_4.0.1.bb
> index b95c734f1d..45498ca5ec 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_4.0.1.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "
> http://www.openssl.org/source/openssl-${PV}.tar.gz \
>             file://run-ptest \
>
> file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
>             file://0001-Configure-do-not-tweak-mips-cflags.patch \
> -
>  file://0001-Added-handshake-history-reporting-when-test-fails.patch \
>             file://0001-extend-check_cwm-test-timeout.patch \
>             "
>
> @@ -19,7 +18,7 @@ SRC_URI:append:class-nativesdk =3D " \
>             file://environment.d-openssl.sh \
>             "
>
> -SRC_URI[sha256sum] =3D
> "a8c0d28a529ca480f9f36cf5792e2cd21984552a3c8e4aa11a24aa31aeac98e8"
> +SRC_URI[sha256sum] =3D
> "2db3f3a0d6ea4b59e1f094ace2c8cd536dffb87cdc39084c5afa1e6f7f37dd09"
>
>  inherit lib_package multilib_header multilib_script ptest perlnative
> manpages
>  MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
> @@ -33,7 +32,6 @@ PACKAGECONFIG ?=3D ""
>  PACKAGECONFIG:class-native =3D ""
>  PACKAGECONFIG:class-nativesdk =3D ""
>
> -PACKAGECONFIG[cryptodev-linux] =3D
> "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-modu=
le"
>  PACKAGECONFIG[legacy] =3D ",no-legacy"
>  PACKAGECONFIG[tls1] =3D ",no-tls1"
>  PACKAGECONFIG[tls1_1] =3D ",no-tls1_1"
> @@ -57,8 +55,8 @@ EXTRA_OECONF:append:class-native =3D "
> --with-rand-seed=3Dos,devrandom"
>  EXTRA_OECONF:append:class-nativesdk =3D " --with-rand-seed=3Dos,devrando=
m"
>
>  # Relying on hardcoded built-in paths causes openssl-native to not be
> relocateable from sstate.
> -EXTRA_OEMAKE:append:task-compile:class-native =3D '
> OPENSSLDIR=3D"/not/builtin" ENGINESDIR=3D"/not/builtin"
> MODULESDIR=3D"/not/builtin"'
> -EXTRA_OEMAKE:append:task-compile:class-nativesdk =3D '
> OPENSSLDIR=3D"/not/builtin" ENGINESDIR=3D"/not/builtin"
> MODULESDIR=3D"/not/builtin"'
> +EXTRA_OEMAKE:append:task-compile:class-native =3D '
> OPENSSLDIR=3D"/not/builtin" MODULESDIR=3D"/not/builtin"'
> +EXTRA_OEMAKE:append:task-compile:class-nativesdk =3D '
> OPENSSLDIR=3D"/not/builtin" MODULESDIR=3D"/not/builtin"'
>
>  #| threads_pthread.c:(.text+0x372): undefined reference to
> `__atomic_is_lock_free'
>  EXTRA_OECONF:append:toolchain-clang:x86 =3D " -latomic"
> @@ -204,12 +202,10 @@ do_install:append:class-native () {
>             OPENSSL_CONF=3D\${OPENSSL_CONF:-${libdir}/ssl-3/openssl.cnf} =
\
>             SSL_CERT_DIR=3D\${SSL_CERT_DIR:-${libdir}/ssl-3/certs} \
>             SSL_CERT_FILE=3D\${SSL_CERT_FILE:-${libdir}/ssl-3/cert.pem} \
> -           OPENSSL_ENGINES=3D\${OPENSSL_ENGINES:-${libdir}/engines-3} \
>             OPENSSL_MODULES=3D\${OPENSSL_MODULES:-${libdir}/ossl-modules}
>
> -       # Setting ENGINESDIR and MODULESDIR to invalid paths prevents hos=
t
> contamination,
> +       # Setting MODULESDIR to invalid paths prevents host contamination=
,
>         # but also breaks the generated libcrypto.pc file. Post-Fix it
> manually here.
> -       sed -i 's|^enginesdir=3D\($.libdir.\)/.*|enginesdir=3D\1/engines-=
3|'
> ${D}${libdir}/pkgconfig/libcrypto.pc
>         sed -i
> 's|^modulesdir=3D\($.libdir.\)/.*|modulesdir=3D\1/ossl-modules|'
> ${D}${libdir}/pkgconfig/libcrypto.pc
>  }
>
> @@ -252,10 +248,6 @@ do_install_ptest() {
>
>         sed 's|${S}|${PTEST_PATH}|g' -i ${D}${PTEST_PATH}/configdata.pm
> ${D}${PTEST_PATH}/util/wrap.pl
>
> -       install -d ${D}${PTEST_PATH}/engines
> -       install -m755 ${B}/engines/dasync.so ${D}${PTEST_PATH}/engines/
> -       install -m755 ${B}/engines/ossltest.so ${D}${PTEST_PATH}/engines/
> -       ln -s ${libdir}/engines-3/loader_attic.so
> ${D}${PTEST_PATH}/engines/
>         ln -s ${libdir}/ossl-modules/ ${D}${PTEST_PATH}/providers
>  }
>
> @@ -270,16 +262,13 @@ pkg_postinst_ontarget:${PN}-ossl-module-fips () {
>  # file to be installed for both the openssl-bin package and the libcrypt=
o
>  # package since the openssl-bin package depends on the libcrypto package=
.
>
> -PACKAGES =3D+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc
> ${PN}-ossl-module-legacy ${PN}-ossl-module-fips"
> +PACKAGES =3D+ "libcrypto libssl openssl-conf ${PN}-misc
> ${PN}-ossl-module-legacy ${PN}-ossl-module-fips"
>
>  FILES:libcrypto =3D "${libdir}/libcrypto${SOLIBS}"
>  FILES:libssl =3D "${libdir}/libssl${SOLIBS}"
>  FILES:openssl-conf =3D "${sysconfdir}/ssl/openssl.cnf* \
>                        ${libdir}/ssl-3/openssl.cnf* \
>                        "
> -FILES:${PN}-engines =3D "${libdir}/engines-3"
> -# ${prefix} comes from what we pass into --prefix at configure time
> (which is used for INSTALLTOP)
> -FILES:${PN}-engines:append:mingw32:class-nativesdk =3D "
> ${prefix}${libdir}/engines-3"
>  FILES:${PN}-misc =3D "${libdir}/ssl-3/misc ${bindir}/c_rehash"
>  FILES:${PN}-ossl-module-legacy =3D "${libdir}/ossl-modules/legacy.so"
>  FILES:${PN}-ossl-module-fips =3D "${libdir}/ossl-modules/fips.so"
> @@ -290,7 +279,7 @@ CONFFILES:openssl-conf =3D
> "${sysconfdir}/ssl/openssl.cnf"
>
>  RRECOMMENDS:libcrypto +=3D "openssl-conf ${PN}-ossl-module-legacy"
>  RDEPENDS:${PN}-misc =3D "perl"
> -RDEPENDS:${PN}-ptest +=3D "openssl-bin perl perl-modules bash sed
> openssl-engines"
> +RDEPENDS:${PN}-ptest +=3D "openssl-bin perl perl-modules bash sed"
>  RRECOMMENDS:${PN}-ptest +=3D "${PN}-ossl-module-legacy"
>
>  RDEPENDS:${PN}-bin +=3D "openssl-conf"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#243875):
> https://lists.openembedded.org/g/openembedded-core/message/243875
> Mute This Topic: https://lists.openembedded.org/mt/120850402/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004697b30659924f5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">what do we do with=C2=A0the packages that depend on openss=
l-engines package ? e.g. freediameter in meta-networking ?</div><br><div cl=
ass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Thu, Aug 20, 2026 at 11:10=E2=80=AFAM Jaipaul Cheernam via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;jaipaul.c=
heernam=3D<a href=3D"mailto:est.tech@lists.openembedded.org">est.tech@lists=
.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Upgrade OpenSSL from 3.5.7 to 4.0.1. This is a major versi=
on upgrade.<br>
<br>
Changelog: <a href=3D"https://github.com/openssl/openssl/blob/openssl-4.0.1=
/CHANGES.md" rel=3D"noreferrer" target=3D"_blank">https://github.com/openss=
l/openssl/blob/openssl-4.0.1/CHANGES.md</a><br>
<br>
New CVE fixes not already in 3.5.7:<br>
=C2=A0 * CVE-2026-28386: Fixed OOB read in AES-CFB-128 on x86-64 with AVX-5=
12<br>
=C2=A0 * CVE-2026-35188: Fixed double-free when checking OCSP stapled respo=
nse<br>
=C2=A0 * CVE-2026-42765: Fixed NULL deref in cert verification with OCSP<br=
>
=C2=A0 * CVE-2026-42771: Fixed OOB read in X509_VERIFY_PARAM_set1_email()<b=
r>
<br>
Major breaking changes in 4.0.0:<br>
=C2=A0 * Removed support for engines. The ENGINE API is fully removed.<br>
=C2=A0 * Removed support for SSLv3. SSLv3 has been deprecated since 2015.<b=
r>
=C2=A0 * Removed support for the SSLv2 Client Hello.<br>
=C2=A0 * Removed per-version TLS method functions (SSLv3_method(),<br>
=C2=A0 =C2=A0 TLSv1_method(), TLSv1_1_method(), TLSv1_2_method()).<br>
=C2=A0 * Removed c_rehash script tool. Use &#39;openssl rehash&#39; instead=
.<br>
=C2=A0 * ASN1_STRING has been made opaque.<br>
=C2=A0 * Numerous API function signatures changed to include const qualifie=
rs.<br>
=C2=A0 * libcrypto no longer cleans up globally allocated data via atexit()=
.<br>
=C2=A0 * Added AKID verification checks when X509_V_FLAG_X509_STRICT is set=
.<br>
=C2=A0 * Support of deprecated elliptic curves in TLS disabled at compile-t=
ime<br>
=C2=A0 =C2=A0 by default.<br>
<br>
Recipe changes:<br>
=C2=A0 * Drop 0001-Added-handshake-history-reporting-when-test-fails.patch<=
br>
=C2=A0 =C2=A0 (merged upstream via PR #22481).<br>
=C2=A0 * Refresh remaining patches against the new version.<br>
=C2=A0 * Remove ENGINE API artifacts: engines package, <a href=3D"http://da=
sync.so/ossltest.so" rel=3D"noreferrer" target=3D"_blank">dasync.so/ossltes=
t.so</a><br>
=C2=A0 =C2=A0 ptest installation, ENGINESDIR references, OPENSSL_ENGINES wr=
apper<br>
=C2=A0 =C2=A0 variable, and cryptodev-linux PACKAGECONFIG.<br>
<br>
Tested: ptest on qemux86-64:<br>
=C2=A0 Files=3D362, Tests=3D4310, Result: PASS<br>
=C2=A0 Passed: 338, Skipped: 24 (fips, lms, rc5, tfo, compression,<br>
=C2=A0 sslversions, sslkeylogfile, external tests - all expected)<br>
=C2=A0 Failed: 0<br>
<br>
Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
---<br>
=C2=A0...ke-history-reporting-when-test-fails.patch | 366 -----------------=
-<br>
=C2=A0...1-Configure-do-not-tweak-mips-cflags.patch |=C2=A0 =C2=A06 +-<br>
=C2=A0...sysroot-and-debug-prefix-map-from-co.patch |=C2=A0 11 +-<br>
=C2=A0.../0001-extend-check_cwm-test-timeout.patch=C2=A0 |=C2=A0 =C2=A04 +-=
<br>
=C2=A0.../{<a href=3D"http://openssl_3.5.7.bb" rel=3D"noreferrer" target=3D=
"_blank">openssl_3.5.7.bb</a> =3D&gt; <a href=3D"http://openssl_4.0.1.bb" r=
el=3D"noreferrer" target=3D"_blank">openssl_4.0.1.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 23 +-<br>
=C2=A05 files changed, 16 insertions(+), 394 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Add=
ed-handshake-history-reporting-when-test-fails.patch<br>
=C2=A0rename meta/recipes-connectivity/openssl/{<a href=3D"http://openssl_3=
.5.7.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.5.7.bb</a> =3D&gt; =
<a href=3D"http://openssl_4.0.1.bb" rel=3D"noreferrer" target=3D"_blank">op=
enssl_4.0.1.bb</a>} (88%)<br>
<br>
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake=
-history-reporting-when-test-fails.patch b/meta/recipes-connectivity/openss=
l/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch<br>
deleted file mode 100644<br>
index a74c79303f..0000000000<br>
--- a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-histor=
y-reporting-when-test-fails.patch<br>
+++ /dev/null<br>
@@ -1,366 +0,0 @@<br>
-From 5ba65051fea0513db0d997f0ab7cafb9826ed74a Mon Sep 17 00:00:00 2001<br>
-From: William Lyu &lt;<a href=3D"mailto:William.Lyu@windriver.com" target=
=3D"_blank">William.Lyu@windriver.com</a>&gt;<br>
-Date: Fri, 20 Oct 2023 16:22:37 -0400<br>
-Subject: [PATCH] Added handshake history reporting when test fails<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/openssl/openssl/=
pull/22481" rel=3D"noreferrer" target=3D"_blank">https://github.com/openssl=
/openssl/pull/22481</a>]<br>
-<br>
-Signed-off-by: William Lyu &lt;<a href=3D"mailto:William.Lyu@windriver.com=
" target=3D"_blank">William.Lyu@windriver.com</a>&gt;<br>
----<br>
- test/helpers/handshake.c | 136 ++++++++++++++++++++++++++++++---------<br=
>
- test/helpers/handshake.h |=C2=A0 70 +++++++++++++++++++-<br>
- test/ssl_test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 44 ++++++++++++=
+<br>
- 3 files changed, 217 insertions(+), 33 deletions(-)<br>
-<br>
-diff --git a/test/helpers/handshake.c b/test/helpers/handshake.c<br>
-index f611b3a..5703b48 100644<br>
---- a/test/helpers/handshake.c<br>
-+++ b/test/helpers/handshake.c<br>
-@@ -25,6 +25,102 @@<br>
- #include &lt;netinet/sctp.h&gt;<br>
- #endif<br>
- <br>
-+/* Shamelessly copied from test/helpers/ssl_test_ctx.c */<br>
-+/* Maps string names to various enumeration type */<br>
-+typedef struct {<br>
-+=C2=A0 =C2=A0 const char *name;<br>
-+=C2=A0 =C2=A0 int value;<br>
-+} enum_name_map;<br>
-+<br>
-+static const enum_name_map connect_phase_names[] =3D {<br>
-+=C2=A0 =C2=A0 {&quot;Handshake&quot;, HANDSHAKE},<br>
-+=C2=A0 =C2=A0 {&quot;RenegAppData&quot;, RENEG_APPLICATION_DATA},<br>
-+=C2=A0 =C2=A0 {&quot;RenegSetup&quot;, RENEG_SETUP},<br>
-+=C2=A0 =C2=A0 {&quot;RenegHandshake&quot;, RENEG_HANDSHAKE},<br>
-+=C2=A0 =C2=A0 {&quot;AppData&quot;, APPLICATION_DATA},<br>
-+=C2=A0 =C2=A0 {&quot;Shutdown&quot;, SHUTDOWN},<br>
-+=C2=A0 =C2=A0 {&quot;ConnectionDone&quot;, CONNECTION_DONE}<br>
-+};<br>
-+<br>
-+static const enum_name_map peer_status_names[] =3D {<br>
-+=C2=A0 =C2=A0 {&quot;PeerSuccess&quot;, PEER_SUCCESS},<br>
-+=C2=A0 =C2=A0 {&quot;PeerRetry&quot;, PEER_RETRY},<br>
-+=C2=A0 =C2=A0 {&quot;PeerError&quot;, PEER_ERROR},<br>
-+=C2=A0 =C2=A0 {&quot;PeerWaiting&quot;, PEER_WAITING},<br>
-+=C2=A0 =C2=A0 {&quot;PeerTestFail&quot;, PEER_TEST_FAILURE}<br>
-+};<br>
-+<br>
-+static const enum_name_map handshake_status_names[] =3D {<br>
-+=C2=A0 =C2=A0 {&quot;HandshakeSuccess&quot;, HANDSHAKE_SUCCESS},<br>
-+=C2=A0 =C2=A0 {&quot;ClientError&quot;, CLIENT_ERROR},<br>
-+=C2=A0 =C2=A0 {&quot;ServerError&quot;, SERVER_ERROR},<br>
-+=C2=A0 =C2=A0 {&quot;InternalError&quot;, INTERNAL_ERROR},<br>
-+=C2=A0 =C2=A0 {&quot;HandshakeRetry&quot;, HANDSHAKE_RETRY}<br>
-+};<br>
-+<br>
-+/* Shamelessly copied from test/helpers/ssl_test_ctx.c */<br>
-+static const char *enum_name(const enum_name_map *enums, size_t num_enums=
,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int value)<br>
-+{<br>
-+=C2=A0 =C2=A0 size_t i;<br>
-+=C2=A0 =C2=A0 for (i =3D 0; i &lt; num_enums; i++) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (enums[i].value =3D=3D value) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return enums[i].name;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 return &quot;InvalidValue&quot;;<br>
-+}<br>
-+<br>
-+const char *handshake_connect_phase_name(connect_phase_t phase)<br>
-+{<br>
-+=C2=A0 =C2=A0 return enum_name(connect_phase_names, OSSL_NELEM(connect_ph=
ase_names),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(int)phase);<br>
-+}<br>
-+<br>
-+const char *handshake_status_name(handshake_status_t handshake_status)<br=
>
-+{<br>
-+=C2=A0 =C2=A0 return enum_name(handshake_status_names, OSSL_NELEM(handsha=
ke_status_names),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(int)handshake_status);<br>
-+}<br>
-+<br>
-+const char *handshake_peer_status_name(peer_status_t peer_status)<br>
-+{<br>
-+=C2=A0 =C2=A0 return enum_name(peer_status_names, OSSL_NELEM(peer_status_=
names),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(int)peer_status);<br>
-+}<br>
-+<br>
-+static void save_loop_history(HANDSHAKE_HISTORY *history,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 connect_phase_t phase,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 handshake_status_t handshake_status,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 peer_status_t server_status,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 peer_status_t client_status,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int client_turn_count,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int is_client_turn)<br>
-+{<br>
-+=C2=A0 =C2=A0 HANDSHAKE_HISTORY_ENTRY *new_entry =3D NULL;<br>
-+<br>
-+=C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0* Create a new history entry for a handshake loop wit=
h statuses given in<br>
-+=C2=A0 =C2=A0 =C2=A0* the arguments. Potentially evicting the oldest entr=
y when the<br>
-+=C2=A0 =C2=A0 =C2=A0* ring buffer is full.<br>
-+=C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 ++(history-&gt;last_idx);<br>
-+=C2=A0 =C2=A0 history-&gt;last_idx &amp;=3D MAX_HANDSHAKE_HISTORY_ENTRY_I=
DX_MASK;<br>
-+<br>
-+=C2=A0 =C2=A0 new_entry =3D &amp;((history-&gt;entries)[history-&gt;last_=
idx]);<br>
-+=C2=A0 =C2=A0 new_entry-&gt;phase =3D phase;<br>
-+=C2=A0 =C2=A0 new_entry-&gt;handshake_status =3D handshake_status;<br>
-+=C2=A0 =C2=A0 new_entry-&gt;server_status =3D server_status;<br>
-+=C2=A0 =C2=A0 new_entry-&gt;client_status =3D client_status;<br>
-+=C2=A0 =C2=A0 new_entry-&gt;client_turn_count =3D client_turn_count;<br>
-+=C2=A0 =C2=A0 new_entry-&gt;is_client_turn =3D is_client_turn;<br>
-+<br>
-+=C2=A0 =C2=A0 /* Evict the oldest handshake loop entry when the ring buff=
er is full. */<br>
-+=C2=A0 =C2=A0 if (history-&gt;entry_count &lt; MAX_HANDSHAKE_HISTORY_ENTR=
Y) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ++(history-&gt;entry_count);<br>
-+=C2=A0 =C2=A0 }<br>
-+}<br>
-+<br>
- HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0HANDSHAKE_RESULT *ret;<br>
-@@ -724,15 +820,6 @@ static void configure_handshake_ssl(SSL *server, SSL =
*client,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SSL_set_post_handshake_auth(client, 1);<=
br>
- }<br>
- <br>
--/* The status for each connection phase. */<br>
--typedef enum {<br>
--=C2=A0 =C2=A0 PEER_SUCCESS,<br>
--=C2=A0 =C2=A0 PEER_RETRY,<br>
--=C2=A0 =C2=A0 PEER_ERROR,<br>
--=C2=A0 =C2=A0 PEER_WAITING,<br>
--=C2=A0 =C2=A0 PEER_TEST_FAILURE<br>
--} peer_status_t;<br>
--<br>
- /* An SSL object and associated read-write buffers. */<br>
- typedef struct peer_st {<br>
-=C2=A0 =C2=A0 =C2=A0SSL *ssl;<br>
-@@ -1077,16 +1164,6 @@ static void do_shutdown_step(PEER *peer)<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- }<br>
- <br>
--typedef enum {<br>
--=C2=A0 =C2=A0 HANDSHAKE,<br>
--=C2=A0 =C2=A0 RENEG_APPLICATION_DATA,<br>
--=C2=A0 =C2=A0 RENEG_SETUP,<br>
--=C2=A0 =C2=A0 RENEG_HANDSHAKE,<br>
--=C2=A0 =C2=A0 APPLICATION_DATA,<br>
--=C2=A0 =C2=A0 SHUTDOWN,<br>
--=C2=A0 =C2=A0 CONNECTION_DONE<br>
--} connect_phase_t;<br>
--<br>
- static int renegotiate_op(const SSL_TEST_CTX *test_ctx)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0switch (test_ctx-&gt;handshake_mode) {<br>
-@@ -1164,19 +1241,6 @@ static void do_connect_step(const SSL_TEST_CTX *tes=
t_ctx, PEER *peer,<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- }<br>
- <br>
--typedef enum {<br>
--=C2=A0 =C2=A0 /* Both parties succeeded. */<br>
--=C2=A0 =C2=A0 HANDSHAKE_SUCCESS,<br>
--=C2=A0 =C2=A0 /* Client errored. */<br>
--=C2=A0 =C2=A0 CLIENT_ERROR,<br>
--=C2=A0 =C2=A0 /* Server errored. */<br>
--=C2=A0 =C2=A0 SERVER_ERROR,<br>
--=C2=A0 =C2=A0 /* Peers are in inconsistent state. */<br>
--=C2=A0 =C2=A0 INTERNAL_ERROR,<br>
--=C2=A0 =C2=A0 /* One or both peers not done. */<br>
--=C2=A0 =C2=A0 HANDSHAKE_RETRY<br>
--} handshake_status_t;<br>
--<br>
- /*<br>
-=C2=A0 * Determine the handshake outcome.<br>
-=C2=A0 * last_status: the status of the peer to have acted last.<br>
-@@ -1541,6 +1605,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0start =3D time(NULL);<br>
- <br>
-+=C2=A0 =C2=A0 save_loop_history(&amp;(ret-&gt;history),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 phase, status, server.status, client.status,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client_turn_count, client_turn);<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 * Half-duplex handshake loop.<br>
-=C2=A0 =C2=A0 =C2=A0 * Client and server speak to each other synchronously=
 in the same process.<br>
-@@ -1562,6 +1630,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 /* server =
went last */);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 save_loop_history(&amp;(ret-&gt;history),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 phase, status, server.status, client.status,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 client_turn_count, client_turn);<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (status) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case HANDSHAKE_SUCCESS:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client_turn_count =3D 0;<b=
r>
-diff --git a/test/helpers/handshake.h b/test/helpers/handshake.h<br>
-index 78b03f9..b9967c2 100644<br>
---- a/test/helpers/handshake.h<br>
-+++ b/test/helpers/handshake.h<br>
-@@ -1,5 +1,5 @@<br>
- /*<br>
-- * Copyright 2016-2021 The OpenSSL Project Authors. All Rights Reserved.<=
br>
-+ * Copyright 2016-2023 The OpenSSL Project Authors. All Rights Reserved.<=
br>
-=C2=A0 *<br>
-=C2=A0 * Licensed under the Apache License 2.0 (the &quot;License&quot;).=
=C2=A0 You may not use<br>
-=C2=A0 * this file except in compliance with the License.=C2=A0 You can ob=
tain a copy<br>
-@@ -12,6 +12,11 @@<br>
- <br>
- #include &quot;ssl_test_ctx.h&quot;<br>
- <br>
-+#define MAX_HANDSHAKE_HISTORY_ENTRY_BIT 4<br>
-+#define MAX_HANDSHAKE_HISTORY_ENTRY (1 &lt;&lt; MAX_HANDSHAKE_HISTORY_ENT=
RY_BIT)<br>
-+#define MAX_HANDSHAKE_HISTORY_ENTRY_IDX_MASK \<br>
-+=C2=A0 =C2=A0 ((1 &lt;&lt; MAX_HANDSHAKE_HISTORY_ENTRY_BIT) - 1)<br>
-+<br>
- typedef struct ctx_data_st {<br>
-=C2=A0 =C2=A0 =C2=A0unsigned char *npn_protocols;<br>
-=C2=A0 =C2=A0 =C2=A0size_t npn_protocols_len;<br>
-@@ -22,6 +27,63 @@ typedef struct ctx_data_st {<br>
-=C2=A0 =C2=A0 =C2=A0char *session_ticket_app_data;<br>
- } CTX_DATA;<br>
- <br>
-+typedef enum {<br>
-+=C2=A0 =C2=A0 HANDSHAKE,<br>
-+=C2=A0 =C2=A0 RENEG_APPLICATION_DATA,<br>
-+=C2=A0 =C2=A0 RENEG_SETUP,<br>
-+=C2=A0 =C2=A0 RENEG_HANDSHAKE,<br>
-+=C2=A0 =C2=A0 APPLICATION_DATA,<br>
-+=C2=A0 =C2=A0 SHUTDOWN,<br>
-+=C2=A0 =C2=A0 CONNECTION_DONE<br>
-+} connect_phase_t;<br>
-+<br>
-+/* The status for each connection phase. */<br>
-+typedef enum {<br>
-+=C2=A0 =C2=A0 PEER_SUCCESS,<br>
-+=C2=A0 =C2=A0 PEER_RETRY,<br>
-+=C2=A0 =C2=A0 PEER_ERROR,<br>
-+=C2=A0 =C2=A0 PEER_WAITING,<br>
-+=C2=A0 =C2=A0 PEER_TEST_FAILURE<br>
-+} peer_status_t;<br>
-+<br>
-+typedef enum {<br>
-+=C2=A0 =C2=A0 /* Both parties succeeded. */<br>
-+=C2=A0 =C2=A0 HANDSHAKE_SUCCESS,<br>
-+=C2=A0 =C2=A0 /* Client errored. */<br>
-+=C2=A0 =C2=A0 CLIENT_ERROR,<br>
-+=C2=A0 =C2=A0 /* Server errored. */<br>
-+=C2=A0 =C2=A0 SERVER_ERROR,<br>
-+=C2=A0 =C2=A0 /* Peers are in inconsistent state. */<br>
-+=C2=A0 =C2=A0 INTERNAL_ERROR,<br>
-+=C2=A0 =C2=A0 /* One or both peers not done. */<br>
-+=C2=A0 =C2=A0 HANDSHAKE_RETRY<br>
-+} handshake_status_t;<br>
-+<br>
-+/* Stores the various status information in a handshake loop. */<br>
-+typedef struct handshake_history_entry_st {<br>
-+=C2=A0 =C2=A0 connect_phase_t phase;<br>
-+=C2=A0 =C2=A0 handshake_status_t handshake_status;<br>
-+=C2=A0 =C2=A0 peer_status_t server_status;<br>
-+=C2=A0 =C2=A0 peer_status_t client_status;<br>
-+=C2=A0 =C2=A0 int client_turn_count;<br>
-+=C2=A0 =C2=A0 int is_client_turn;<br>
-+} HANDSHAKE_HISTORY_ENTRY;<br>
-+<br>
-+typedef struct handshake_history_st {<br>
-+=C2=A0 =C2=A0 /* Implemented using ring buffer. */<br>
-+=C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0* The valid entries are |entries[last_idx]|, |entries=
[last_idx-1]|,<br>
-+=C2=A0 =C2=A0 =C2=A0* ..., etc., going up to |entry_count| number of entr=
ies. Note that when<br>
-+=C2=A0 =C2=A0 =C2=A0* the index into the array |entries| becomes &lt; 0, =
we wrap around to<br>
-+=C2=A0 =C2=A0 =C2=A0* the end of |entries|.<br>
-+=C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 HANDSHAKE_HISTORY_ENTRY entries[MAX_HANDSHAKE_HISTORY_ENTRY=
];<br>
-+=C2=A0 =C2=A0 /* The number of valid entries in |entries| array. */<br>
-+=C2=A0 =C2=A0 size_t entry_count;<br>
-+=C2=A0 =C2=A0 /* The index of the last valid entry in the |entries| array=
. */<br>
-+=C2=A0 =C2=A0 size_t last_idx;<br>
-+} HANDSHAKE_HISTORY;<br>
-+<br>
- typedef struct handshake_result {<br>
-=C2=A0 =C2=A0 =C2=A0ssl_test_result_t result;<br>
-=C2=A0 =C2=A0 =C2=A0/* These alerts are in the 2-byte format returned by t=
he info_callback. */<br>
-@@ -77,6 +139,8 @@ typedef struct handshake_result {<br>
-=C2=A0 =C2=A0 =C2=A0char *cipher;<br>
-=C2=A0 =C2=A0 =C2=A0/* session ticket application data */<br>
-=C2=A0 =C2=A0 =C2=A0char *result_session_ticket_app_data;<br>
-+=C2=A0 =C2=A0 /* handshake loop history */<br>
-+=C2=A0 =C2=A0 HANDSHAKE_HISTORY history;<br>
- } HANDSHAKE_RESULT;<br>
- <br>
- HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void);<br>
-@@ -95,4 +159,8 @@ int configure_handshake_ctx_for_srp(SSL_CTX *server_ctx=
, SSL_CTX *server2_ctx,<br>
-=C2=A0 =C2=A0 =C2=A0CTX_DATA *server2_ctx_data,<br>
-=C2=A0 =C2=A0 =C2=A0CTX_DATA *client_ctx_data);<br>
- <br>
-+const char *handshake_connect_phase_name(connect_phase_t phase);<br>
-+const char *handshake_status_name(handshake_status_t handshake_status);<b=
r>
-+const char *handshake_peer_status_name(peer_status_t peer_status);<br>
-+<br>
- #endif /* OSSL_TEST_HANDSHAKE_HELPER_H */<br>
-diff --git a/test/ssl_test.c b/test/ssl_test.c<br>
-index ea60851..9d6b093 100644<br>
---- a/test/ssl_test.c<br>
-+++ b/test/ssl_test.c<br>
-@@ -26,6 +26,44 @@ static OSSL_LIB_CTX *libctx =3D NULL;<br>
- /* Currently the section names are of the form test-&lt;number&gt;, e.g. =
test-15. */<br>
- #define MAX_TESTCASE_NAME_LENGTH 100<br>
- <br>
-+static void print_handshake_history(const HANDSHAKE_HISTORY *history)<br>
-+{<br>
-+=C2=A0 =C2=A0 size_t first_idx;<br>
-+=C2=A0 =C2=A0 size_t i;<br>
-+=C2=A0 =C2=A0 size_t cur_idx;<br>
-+=C2=A0 =C2=A0 const HANDSHAKE_HISTORY_ENTRY *cur_entry;<br>
-+=C2=A0 =C2=A0 const char header_template[] =3D &quot;|%14s|%16s|%16s|%16s=
|%17s|%14s|&quot;;<br>
-+=C2=A0 =C2=A0 const char body_template[]=C2=A0 =C2=A0=3D &quot;|%14s|%16s=
|%16s|%16s|%17d|%14s|&quot;;<br>
-+<br>
-+=C2=A0 =C2=A0 TEST_info(&quot;The following is the server/client state &q=
uot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;in the most recent=
 %d handshake loops.&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MAX_HANDSHAKE_HISTORY_EN=
TRY);<br>
-+<br>
-+=C2=A0 =C2=A0 TEST_note(&quot;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&quot;);<br>
-+=C2=A0 =C2=A0 TEST_note(header_template,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;phase&quot;, &quot=
;handshake status&quot;, &quot;server status&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;client status&quot=
;, &quot;client turn count&quot;, &quot;is client turn&quot;);<br>
-+=C2=A0 =C2=A0 TEST_note(&quot;+--------------+----------------+----------=
------&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;+----------------+=
-----------------+--------------+&quot;);<br>
-+<br>
-+=C2=A0 =C2=A0 first_idx =3D (history-&gt;last_idx - history-&gt;entry_cou=
nt + 1) &amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MAX_HANDSHAKE_HIS=
TORY_ENTRY_IDX_MASK;<br>
-+=C2=A0 =C2=A0 for (i =3D 0; i &lt; history-&gt;entry_count; ++i) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cur_idx =3D (first_idx + i) &amp; MAX_HANDSHA=
KE_HISTORY_ENTRY_IDX_MASK;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cur_entry =3D &amp;(history-&gt;entries)[cur_=
idx];<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 TEST_note(body_template,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 handshake_=
connect_phase_name(cur_entry-&gt;phase),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 handshake_=
status_name(cur_entry-&gt;handshake_status),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 handshake_=
peer_status_name(cur_entry-&gt;server_status),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 handshake_=
peer_status_name(cur_entry-&gt;client_status),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cur_entry-=
&gt;client_turn_count,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cur_entry-=
&gt;is_client_turn ? &quot;true&quot; : &quot;false&quot;);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 TEST_note(&quot;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&quot;);<br>
-+}<br>
-+<br>
- static const char *print_alert(int alert)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0return alert ? SSL_alert_desc_string_long(alert) : &qu=
ot;no alert&quot;;<br>
-@@ -388,6 +426,12 @@ static int check_test(HANDSHAKE_RESULT *result, SSL_T=
EST_CTX *test_ctx)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret &amp;=3D check_client_sign_type(resu=
lt, test_ctx);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret &amp;=3D check_client_ca_names(resul=
t, test_ctx);<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-+<br>
-+=C2=A0 =C2=A0 /* Print handshake loop history if any check fails. */<br>
-+=C2=A0 =C2=A0 if (!ret) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print_handshake_history(&amp;(result-&gt;hist=
ory));<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0return ret;<br>
- }<br>
-<br>
---<br>
-2.25.1<br>
-<br>
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-no=
t-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-=
Configure-do-not-tweak-mips-cflags.patch<br>
index cd8906df67..77bfe4e4e5 100644<br>
--- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak=
-mips-cflags.patch<br>
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak=
-mips-cflags.patch<br>
@@ -1,4 +1,4 @@<br>
-From 0377f0d5b5c1079e3b9a80881f4dcc891cbe9f9a Mon Sep 17 00:00:00 2001<br>
+From b5cee0cb0f14a78056ef7722a34b361491f1fdda Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" tar=
get=3D"_blank">alex@linutronix.de</a>&gt;<br>
=C2=A0Date: Tue, 30 May 2023 09:11:27 -0700<br>
=C2=A0Subject: [PATCH] Configure: do not tweak mips cflags<br>
@@ -17,10 +17,10 @@ Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orl=
ing@konsulko.com" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
=C2=A0 1 file changed, 10 deletions(-)<br>
<br>
=C2=A0diff --git a/Configure b/Configure<br>
-index fff97bd..5ee54c1 100755<br>
+index c05a30b..db8adee 100755<br>
=C2=A0--- a/Configure<br>
=C2=A0+++ b/Configure<br>
-@@ -1557,16 +1557,6 @@ if ($target =3D~ /^mingw/ &amp;&amp; `$config{CC} -=
-target-help 2&gt;&amp;1` =3D~ m/-mno-cygwin/m)<br>
+@@ -1575,16 +1575,6 @@ if ($target =3D~ /^mingw/ &amp;&amp; `$config{CC} -=
-target-help 2&gt;&amp;1` =3D~ m/-mno-cygwin/m)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 push @{$config{shared_ldflag}}, &quot;-m=
no-cygwin&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip=
-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/ope=
nssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patc=
h<br>
index bfbfedbd67..1d9e7539f6 100644<br>
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroo=
t-and-debug-prefix-map-from-co.patch<br>
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroo=
t-and-debug-prefix-map-from-co.patch<br>
@@ -1,4 +1,4 @@<br>
-From 5985253f2c9025d7c127443a3a9938946f80c2a1 Mon Sep 17 00:00:00 2001<br>
+From 6df53bfebcf8ca65910a18220a6576fb110918a5 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: =3D?UTF-8?q?Martin=3D20Hundeb=3DC3=3DB8ll?=3D &lt;<a href=3D"ma=
ilto:martin@geanix.com" target=3D"_blank">martin@geanix.com</a>&gt;<br>
=C2=A0Date: Tue, 6 Nov 2018 14:50:47 +0100<br>
=C2=A0Subject: [PATCH] buildinfo: strip sysroot and debug-prefix-map from c=
ompiler<br>
@@ -28,17 +28,16 @@ Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@=
windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
=C2=A0Update to fix buildpaths qa issue for &#39;-ffile-prefix-map&#39;.<br=
>
<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
-<br>
=C2=A0---<br>
=C2=A0 Configurations/unix-Makefile.tmpl | 16 +++++++++++++++-<br>
=C2=A0 crypto/<a href=3D"http://build.info" rel=3D"noreferrer" target=3D"_b=
lank">build.info</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 2 +-<br>
=C2=A0 2 files changed, 16 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-=
Makefile.tmpl<br>
-index 09303c4..011bda1 100644<br>
+index eff66e5..bc48f51 100644<br>
=C2=A0--- a/Configurations/unix-Makefile.tmpl<br>
=C2=A0+++ b/Configurations/unix-Makefile.tmpl<br>
-@@ -514,13 +514,27 @@ BIN_LDFLAGS=3D{- join(&#39; &#39;, $target{bin_lflag=
s} || (),<br>
+@@ -503,13 +503,27 @@ BIN_LDFLAGS=3D{- join(&#39; &#39;, $target{bin_lflag=
s} || (),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&#39;$(CNF_LDFLAGS)&#39;, &#39;$(LDFLAGS)&#39;) -}<=
br>
=C2=A0 BIN_EX_LIBS=3D$(CNF_EX_LIBS) $(EX_LIBS)<br>
<br>
@@ -68,10 +67,10 @@ index 09303c4..011bda1 100644<br>
<br>
=C2=A0 # For x86 assembler: Set PROCESSOR to 386 if you want to support<br>
=C2=A0diff --git a/crypto/<a href=3D"http://build.info" rel=3D"noreferrer" =
target=3D"_blank">build.info</a> b/crypto/<a href=3D"http://build.info" rel=
=3D"noreferrer" target=3D"_blank">build.info</a><br>
-index aee5c46..95c9577 100644<br>
+index 8e4a885..95b0902 100644<br>
=C2=A0--- a/crypto/<a href=3D"http://build.info" rel=3D"noreferrer" target=
=3D"_blank">build.info</a><br>
=C2=A0+++ b/crypto/<a href=3D"http://build.info" rel=3D"noreferrer" target=
=3D"_blank">build.info</a><br>
-@@ -115,7 +115,7 @@ DEFINE[../libcrypto]=3D$UPLINKDEF<br>
+@@ -114,7 +114,7 @@ DEFINE[../libcrypto]=3D$UPLINKDEF<br>
<br>
=C2=A0 DEPEND[info.o]=3Dbuildinf.h<br>
=C2=A0 DEPEND[cversion.o]=3Dbuildinf.h<br>
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cw=
m-test-timeout.patch b/meta/recipes-connectivity/openssl/openssl/0001-exten=
d-check_cwm-test-timeout.patch<br>
index f6eb28069a..76bc05d5f9 100644<br>
--- a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-=
timeout.patch<br>
+++ b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-=
timeout.patch<br>
@@ -1,4 +1,4 @@<br>
-From c7000672296f4c367341aa3415f26c4d9f5e4749 Mon Sep 17 00:00:00 2001<br>
+From 14856dbd767621ce6f162680c00557b54af0effb Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" tar=
get=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
=C2=A0Date: Thu, 23 Oct 2025 11:24:36 +0200<br>
=C2=A0Subject: [PATCH] extend check_cwm test timeout<br>
@@ -15,7 +15,7 @@ Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skand=
igraun@gmail.com" target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 5 insertions(+)<br>
<br>
=C2=A0diff --git a/test/radix/main.c b/test/radix/main.c<br>
-index 4a1e886a71..39f8c61ef9 100644<br>
+index 0f3dc11..d925639 100644<br>
=C2=A0--- a/test/radix/main.c<br>
=C2=A0+++ b/test/radix/main.c<br>
=C2=A0@@ -25,6 +25,11 @@ static int test_script(int idx)<br>
diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.=
5.7.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.5.7.bb</a> b/meta/re=
cipes-connectivity/openssl/<a href=3D"http://openssl_4.0.1.bb" rel=3D"noref=
errer" target=3D"_blank">openssl_4.0.1.bb</a><br>
similarity index 88%<br>
rename from meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.5=
.7.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.5.7.bb</a><br>
rename to meta/recipes-connectivity/openssl/<a href=3D"http://openssl_4.0.1=
.bb" rel=3D"noreferrer" target=3D"_blank">openssl_4.0.1.bb</a><br>
index b95c734f1d..45498ca5ec 100644<br>
--- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.5.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_3.5.7.bb</a><br>
+++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_4.0.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_4.0.1.bb</a><br>
@@ -11,7 +11,6 @@ SRC_URI =3D &quot;<a href=3D"http://www.openssl.org/sourc=
e/openssl-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://www=
.openssl.org/source/openssl-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-buildinfo-strip-sysro=
ot-and-debug-prefix-map-from-co.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Configure-do-not-twea=
k-mips-cflags.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Added-handshake-histo=
ry-reporting-when-test-fails.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-extend-check_cwm-test=
-timeout.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
@@ -19,7 +18,7 @@ SRC_URI:append:class-nativesdk =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://<a href=3D"http://environm=
ent.d-openssl.sh" rel=3D"noreferrer" target=3D"_blank">environment.d-openss=
l.sh</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;a8c0d28a529ca480f9f36cf5792e2cd21984552a3c8e4=
aa11a24aa31aeac98e8&quot;<br>
+SRC_URI[sha256sum] =3D &quot;2db3f3a0d6ea4b59e1f094ace2c8cd536dffb87cdc390=
84c5afa1e6f7f37dd09&quot;<br>
<br>
=C2=A0inherit lib_package multilib_header multilib_script ptest perlnative =
manpages<br>
=C2=A0MULTILIB_SCRIPTS =3D &quot;${PN}-bin:${bindir}/c_rehash&quot;<br>
@@ -33,7 +32,6 @@ PACKAGECONFIG ?=3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG:class-native =3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG:class-nativesdk =3D &quot;&quot;<br>
<br>
-PACKAGECONFIG[cryptodev-linux] =3D &quot;enable-devcryptoeng,disable-devcr=
yptoeng,cryptodev-linux,,cryptodev-module&quot;<br>
=C2=A0PACKAGECONFIG[legacy] =3D &quot;,no-legacy&quot;<br>
=C2=A0PACKAGECONFIG[tls1] =3D &quot;,no-tls1&quot;<br>
=C2=A0PACKAGECONFIG[tls1_1] =3D &quot;,no-tls1_1&quot;<br>
@@ -57,8 +55,8 @@ EXTRA_OECONF:append:class-native =3D &quot; --with-rand-s=
eed=3Dos,devrandom&quot;<br>
=C2=A0EXTRA_OECONF:append:class-nativesdk =3D &quot; --with-rand-seed=3Dos,=
devrandom&quot;<br>
<br>
=C2=A0# Relying on hardcoded built-in paths causes openssl-native to not be=
 relocateable from sstate.<br>
-EXTRA_OEMAKE:append:task-compile:class-native =3D &#39; OPENSSLDIR=3D&quot=
;/not/builtin&quot; ENGINESDIR=3D&quot;/not/builtin&quot; MODULESDIR=3D&quo=
t;/not/builtin&quot;&#39;<br>
-EXTRA_OEMAKE:append:task-compile:class-nativesdk =3D &#39; OPENSSLDIR=3D&q=
uot;/not/builtin&quot; ENGINESDIR=3D&quot;/not/builtin&quot; MODULESDIR=3D&=
quot;/not/builtin&quot;&#39;<br>
+EXTRA_OEMAKE:append:task-compile:class-native =3D &#39; OPENSSLDIR=3D&quot=
;/not/builtin&quot; MODULESDIR=3D&quot;/not/builtin&quot;&#39;<br>
+EXTRA_OEMAKE:append:task-compile:class-nativesdk =3D &#39; OPENSSLDIR=3D&q=
uot;/not/builtin&quot; MODULESDIR=3D&quot;/not/builtin&quot;&#39;<br>
<br>
=C2=A0#| threads_pthread.c:(.text+0x372): undefined reference to `__atomic_=
is_lock_free&#39;<br>
=C2=A0EXTRA_OECONF:append:toolchain-clang:x86 =3D &quot; -latomic&quot;<br>
@@ -204,12 +202,10 @@ do_install:append:class-native () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OPENSSL_CONF=3D\${OPENSSL_CONF:-$=
{libdir}/ssl-3/openssl.cnf} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SSL_CERT_DIR=3D\${SSL_CERT_DIR:-$=
{libdir}/ssl-3/certs} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SSL_CERT_FILE=3D\${SSL_CERT_FILE:=
-${libdir}/ssl-3/cert.pem} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OPENSSL_ENGINES=3D\${OPENSSL_ENGI=
NES:-${libdir}/engines-3} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OPENSSL_MODULES=3D\${OPENSSL_MODU=
LES:-${libdir}/ossl-modules}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Setting ENGINESDIR and MODULESDIR to invalid =
paths prevents host contamination,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Setting MODULESDIR to invalid paths prevents =
host contamination,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # but also breaks the generated libcrypto.pc fi=
le. Post-Fix it manually here.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s|^enginesdir=3D\($.libdir.\)/.*|en=
ginesdir=3D\1/engines-3|&#39; ${D}${libdir}/pkgconfig/libcrypto.pc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|^modulesdir=3D\($.libdir.\)/.*|mo=
dulesdir=3D\1/ossl-modules|&#39; ${D}${libdir}/pkgconfig/libcrypto.pc<br>
=C2=A0}<br>
<br>
@@ -252,10 +248,6 @@ do_install_ptest() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed &#39;s|${S}|${PTEST_PATH}|g&#39; -i ${D}${P=
TEST_PATH}/<a href=3D"http://configdata.pm" rel=3D"noreferrer" target=3D"_b=
lank">configdata.pm</a> ${D}${PTEST_PATH}/util/<a href=3D"http://wrap.pl" r=
el=3D"noreferrer" target=3D"_blank">wrap.pl</a><br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/engines<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m755 ${B}/engines/dasync.so ${D}${PTES=
T_PATH}/engines/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m755 ${B}/engines/ossltest.so ${D}${PT=
EST_PATH}/engines/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s ${libdir}/engines-3/loader_attic.so ${D}$=
{PTEST_PATH}/engines/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s ${libdir}/ossl-modules/ ${D}${PTEST_PATH}=
/providers<br>
=C2=A0}<br>
<br>
@@ -270,16 +262,13 @@ pkg_postinst_ontarget:${PN}-ossl-module-fips () {<br>
=C2=A0# file to be installed for both the openssl-bin package and the libcr=
ypto<br>
=C2=A0# package since the openssl-bin package depends on the libcrypto pack=
age.<br>
<br>
-PACKAGES =3D+ &quot;libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc=
 ${PN}-ossl-module-legacy ${PN}-ossl-module-fips&quot;<br>
+PACKAGES =3D+ &quot;libcrypto libssl openssl-conf ${PN}-misc ${PN}-ossl-mo=
dule-legacy ${PN}-ossl-module-fips&quot;<br>
<br>
=C2=A0FILES:libcrypto =3D &quot;${libdir}/libcrypto${SOLIBS}&quot;<br>
=C2=A0FILES:libssl =3D &quot;${libdir}/libssl${SOLIBS}&quot;<br>
=C2=A0FILES:openssl-conf =3D &quot;${sysconfdir}/ssl/openssl.cnf* \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${libdir}/ssl-3/openssl.cnf* \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;<br>
-FILES:${PN}-engines =3D &quot;${libdir}/engines-3&quot;<br>
-# ${prefix} comes from what we pass into --prefix at configure time (which=
 is used for INSTALLTOP)<br>
-FILES:${PN}-engines:append:mingw32:class-nativesdk =3D &quot; ${prefix}${l=
ibdir}/engines-3&quot;<br>
=C2=A0FILES:${PN}-misc =3D &quot;${libdir}/ssl-3/misc ${bindir}/c_rehash&qu=
ot;<br>
=C2=A0FILES:${PN}-ossl-module-legacy =3D &quot;${libdir}/ossl-modules/legac=
y.so&quot;<br>
=C2=A0FILES:${PN}-ossl-module-fips =3D &quot;${libdir}/ossl-modules/fips.so=
&quot;<br>
@@ -290,7 +279,7 @@ CONFFILES:openssl-conf =3D &quot;${sysconfdir}/ssl/open=
ssl.cnf&quot;<br>
<br>
=C2=A0RRECOMMENDS:libcrypto +=3D &quot;openssl-conf ${PN}-ossl-module-legac=
y&quot;<br>
=C2=A0RDEPENDS:${PN}-misc =3D &quot;perl&quot;<br>
-RDEPENDS:${PN}-ptest +=3D &quot;openssl-bin perl perl-modules bash sed ope=
nssl-engines&quot;<br>
+RDEPENDS:${PN}-ptest +=3D &quot;openssl-bin perl perl-modules bash sed&quo=
t;<br>
=C2=A0RRECOMMENDS:${PN}-ptest +=3D &quot;${PN}-ossl-module-legacy&quot;<br>
<br>
=C2=A0RDEPENDS:${PN}-bin +=3D &quot;openssl-conf&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#243875): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/243875" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/243875</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120850402/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120850402/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000004697b30659924f5d--

