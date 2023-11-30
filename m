Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D59C10DC2
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:58:20 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.5169.1701377896642580343
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:58:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zUuNfKei;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6cbbfdf72ecso1403179b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377896; x=1701982696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytAB1BaDcjZYa4VIx2T7xNgSudiGgtuNgmJOwxzsJwo=;
        b=zUuNfKeiHG0/shw8+FCkvdvvdTXHhs01f1xn24F78G15nbyZJ3gQS7uGrjU+9qBlgr
         AGoDUSY/7Qu6JoGLHub4tBTvOPcDgeEdrhN6F4GPj9TXn+8wav/+nZfzyDun1jLooqGX
         MvEH0TwCjb3mFhJyI6HgMbupQtg0iW27n/312hnF+UtPGP1IYnyg95tG5nLpwG2sB2va
         tZ/jY0xtime5VZ7KEBe2VfKAfM6HZogsOm7JxI2AZHULETAvDI0ZgA3+upmXjaqaTtRs
         IRcRnPLfBRPCkdiPlAlMX4PJAyGNT9wWaCOtbzsw17/DUC7t7XIdA/1rAIWnVl+PbWJW
         NRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377896; x=1701982696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytAB1BaDcjZYa4VIx2T7xNgSudiGgtuNgmJOwxzsJwo=;
        b=kelRg7ANJJAR094bPde0s8o+WxVJ6/Vk803fJkxWeI2/g7fV+dP7QGb0NvGWCJeCbf
         ZB+Fz2g8QJQWz70x6rVZzUsHTmXnmDBv9OVC7nMWXUfN2oUeUYPubKOMa47GlkZmCDUd
         dk9NMPeTdPFEfF1BhAvSjEM2+dk3FitmxP8KFcjW8bX8IUtG/WqSiKBKkdYOKKXlom5T
         dk0s5A0G+hdUMVcKQSOaxJ5n2b/zHA4QGuMfZ7zTJbvjogZjZW5AAt7bLdUArFk5IzYa
         JZwacnXoYLVNLahuEltp6deLLEQGUKyeHNuyauzyvVo/ZHJ2li7ohzGuRWryDKUmsr6I
         e/Qg==
X-Gm-Message-State: AOJu0YwuOKUHyXfoxU6atHtWtQrcRnuDyLA06V5NSQBIVmERP4OoIqno
	vof8UiFUTnH0jlATaFPy4vI12r/0vet1EPaMsXkKow==
X-Google-Smtp-Source: AGHT+IHsdQ39HD47/a5d+Zy4TCUDO+BxE+hXrX7zcoPEszd+HYJbElbaOLgCRaSYpIy5ZFTaBstprQ==
X-Received: by 2002:a05:6a20:8f15:b0:18c:1248:bb17 with SMTP id b21-20020a056a208f1500b0018c1248bb17mr27027019pzk.21.1701377895583;
        Thu, 30 Nov 2023 12:58:15 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.58.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:58:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 21/25] openssl: improve handshake test error reporting
Date: Thu, 30 Nov 2023 10:57:29 -1000
Message-Id: <c176229ced6b710b6c44d1090e9e7347d98e4be4.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191539

From: William Lyu <William.Lyu@windriver.com>

Fixes [YOCTO #15225]

Yocto Bug #15255 is not reproducible. To obtain more useful information
for debugging, the OpenSSL test code is improved so that more detailed
state information in the handshake loop is printed when an error occurs.

Signed-off-by: William Lyu <William.Lyu@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 5bf9a70f580357badd01f39822998985654b0bfc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ke-history-reporting-when-test-fails.patch | 374 ++++++++++++++++++
 .../openssl/openssl_3.1.4.bb                  |   1 +
 2 files changed, 375 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
new file mode 100644
index 0000000000..aa2e5bb800
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
@@ -0,0 +1,374 @@
+From 5ba65051fea0513db0d997f0ab7cafb9826ed74a Mon Sep 17 00:00:00 2001
+From: William Lyu <William.Lyu@windriver.com>
+Date: Fri, 20 Oct 2023 16:22:37 -0400
+Subject: [PATCH] Added handshake history reporting when test fails
+
+Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/22481]
+
+Signed-off-by: William Lyu <William.Lyu@windriver.com>
+---
+ test/helpers/handshake.c | 139 +++++++++++++++++++++++++++++----------
+ test/helpers/handshake.h |  70 +++++++++++++++++++-
+ test/ssl_test.c          |  44 +++++++++++++
+ 3 files changed, 218 insertions(+), 35 deletions(-)
+
+diff --git a/test/helpers/handshake.c b/test/helpers/handshake.c
+index e0422469e4..ae2ad59dd4 100644
+--- a/test/helpers/handshake.c
++++ b/test/helpers/handshake.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright 2016-2022 The OpenSSL Project Authors. All Rights Reserved.
++ * Copyright 2016-2023 The OpenSSL Project Authors. All Rights Reserved.
+  *
+  * Licensed under the Apache License 2.0 (the "License").  You may not use
+  * this file except in compliance with the License.  You can obtain a copy
+@@ -24,6 +24,102 @@
+ #include <netinet/sctp.h>
+ #endif
+
++/* Shamelessly copied from test/helpers/ssl_test_ctx.c */
++/* Maps string names to various enumeration type */
++typedef struct {
++    const char *name;
++    int value;
++} enum_name_map;
++
++static const enum_name_map connect_phase_names[] = {
++    {"Handshake", HANDSHAKE},
++    {"RenegAppData", RENEG_APPLICATION_DATA},
++    {"RenegSetup", RENEG_SETUP},
++    {"RenegHandshake", RENEG_HANDSHAKE},
++    {"AppData", APPLICATION_DATA},
++    {"Shutdown", SHUTDOWN},
++    {"ConnectionDone", CONNECTION_DONE}
++};
++
++static const enum_name_map peer_status_names[] = {
++    {"PeerSuccess", PEER_SUCCESS},
++    {"PeerRetry", PEER_RETRY},
++    {"PeerError", PEER_ERROR},
++    {"PeerWaiting", PEER_WAITING},
++    {"PeerTestFail", PEER_TEST_FAILURE}
++};
++
++static const enum_name_map handshake_status_names[] = {
++    {"HandshakeSuccess", HANDSHAKE_SUCCESS},
++    {"ClientError", CLIENT_ERROR},
++    {"ServerError", SERVER_ERROR},
++    {"InternalError", INTERNAL_ERROR},
++    {"HandshakeRetry", HANDSHAKE_RETRY}
++};
++
++/* Shamelessly copied from test/helpers/ssl_test_ctx.c */
++static const char *enum_name(const enum_name_map *enums, size_t num_enums,
++                             int value)
++{
++    size_t i;
++    for (i = 0; i < num_enums; i++) {
++        if (enums[i].value == value) {
++            return enums[i].name;
++        }
++    }
++    return "InvalidValue";
++}
++
++const char *handshake_connect_phase_name(connect_phase_t phase)
++{
++    return enum_name(connect_phase_names, OSSL_NELEM(connect_phase_names),
++                     (int)phase);
++}
++
++const char *handshake_status_name(handshake_status_t handshake_status)
++{
++    return enum_name(handshake_status_names, OSSL_NELEM(handshake_status_names),
++                     (int)handshake_status);
++}
++
++const char *handshake_peer_status_name(peer_status_t peer_status)
++{
++    return enum_name(peer_status_names, OSSL_NELEM(peer_status_names),
++                     (int)peer_status);
++}
++
++static void save_loop_history(HANDSHAKE_HISTORY *history,
++                              connect_phase_t phase,
++                              handshake_status_t handshake_status,
++                              peer_status_t server_status,
++                              peer_status_t client_status,
++                              int client_turn_count,
++                              int is_client_turn)
++{
++    HANDSHAKE_HISTORY_ENTRY *new_entry = NULL;
++
++    /*
++     * Create a new history entry for a handshake loop with statuses given in
++     * the arguments. Potentially evicting the oldest entry when the
++     * ring buffer is full.
++     */
++    ++(history->last_idx);
++    history->last_idx &= MAX_HANDSHAKE_HISTORY_ENTRY_IDX_MASK;
++
++    new_entry = &((history->entries)[history->last_idx]);
++    new_entry->phase = phase;
++    new_entry->handshake_status = handshake_status;
++    new_entry->server_status = server_status;
++    new_entry->client_status = client_status;
++    new_entry->client_turn_count = client_turn_count;
++    new_entry->is_client_turn = is_client_turn;
++
++    /* Evict the oldest handshake loop entry when the ring buffer is full. */
++    if (history->entry_count < MAX_HANDSHAKE_HISTORY_ENTRY) {
++        ++(history->entry_count);
++    }
++}
++
+ HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void)
+ {
+     HANDSHAKE_RESULT *ret;
+@@ -719,15 +815,6 @@ static void configure_handshake_ssl(SSL *server, SSL *client,
+         SSL_set_post_handshake_auth(client, 1);
+ }
+
+-/* The status for each connection phase. */
+-typedef enum {
+-    PEER_SUCCESS,
+-    PEER_RETRY,
+-    PEER_ERROR,
+-    PEER_WAITING,
+-    PEER_TEST_FAILURE
+-} peer_status_t;
+-
+ /* An SSL object and associated read-write buffers. */
+ typedef struct peer_st {
+     SSL *ssl;
+@@ -1074,17 +1161,6 @@ static void do_shutdown_step(PEER *peer)
+     }
+ }
+
+-typedef enum {
+-    HANDSHAKE,
+-    RENEG_APPLICATION_DATA,
+-    RENEG_SETUP,
+-    RENEG_HANDSHAKE,
+-    APPLICATION_DATA,
+-    SHUTDOWN,
+-    CONNECTION_DONE
+-} connect_phase_t;
+-
+-
+ static int renegotiate_op(const SSL_TEST_CTX *test_ctx)
+ {
+     switch (test_ctx->handshake_mode) {
+@@ -1162,19 +1238,6 @@ static void do_connect_step(const SSL_TEST_CTX *test_ctx, PEER *peer,
+     }
+ }
+
+-typedef enum {
+-    /* Both parties succeeded. */
+-    HANDSHAKE_SUCCESS,
+-    /* Client errored. */
+-    CLIENT_ERROR,
+-    /* Server errored. */
+-    SERVER_ERROR,
+-    /* Peers are in inconsistent state. */
+-    INTERNAL_ERROR,
+-    /* One or both peers not done. */
+-    HANDSHAKE_RETRY
+-} handshake_status_t;
+-
+ /*
+  * Determine the handshake outcome.
+  * last_status: the status of the peer to have acted last.
+@@ -1539,6 +1602,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
+
+     start = time(NULL);
+
++    save_loop_history(&(ret->history),
++                      phase, status, server.status, client.status,
++                      client_turn_count, client_turn);
++
+     /*
+      * Half-duplex handshake loop.
+      * Client and server speak to each other synchronously in the same process.
+@@ -1560,6 +1627,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
+                                       0 /* server went last */);
+         }
+
++        save_loop_history(&(ret->history),
++                          phase, status, server.status, client.status,
++                          client_turn_count, client_turn);
++
+         switch (status) {
+         case HANDSHAKE_SUCCESS:
+             client_turn_count = 0;
+diff --git a/test/helpers/handshake.h b/test/helpers/handshake.h
+index 78b03f9f4b..b9967c2623 100644
+--- a/test/helpers/handshake.h
++++ b/test/helpers/handshake.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright 2016-2021 The OpenSSL Project Authors. All Rights Reserved.
++ * Copyright 2016-2023 The OpenSSL Project Authors. All Rights Reserved.
+  *
+  * Licensed under the Apache License 2.0 (the "License").  You may not use
+  * this file except in compliance with the License.  You can obtain a copy
+@@ -12,6 +12,11 @@
+
+ #include "ssl_test_ctx.h"
+
++#define MAX_HANDSHAKE_HISTORY_ENTRY_BIT 4
++#define MAX_HANDSHAKE_HISTORY_ENTRY (1 << MAX_HANDSHAKE_HISTORY_ENTRY_BIT)
++#define MAX_HANDSHAKE_HISTORY_ENTRY_IDX_MASK \
++    ((1 << MAX_HANDSHAKE_HISTORY_ENTRY_BIT) - 1)
++
+ typedef struct ctx_data_st {
+     unsigned char *npn_protocols;
+     size_t npn_protocols_len;
+@@ -22,6 +27,63 @@ typedef struct ctx_data_st {
+     char *session_ticket_app_data;
+ } CTX_DATA;
+
++typedef enum {
++    HANDSHAKE,
++    RENEG_APPLICATION_DATA,
++    RENEG_SETUP,
++    RENEG_HANDSHAKE,
++    APPLICATION_DATA,
++    SHUTDOWN,
++    CONNECTION_DONE
++} connect_phase_t;
++
++/* The status for each connection phase. */
++typedef enum {
++    PEER_SUCCESS,
++    PEER_RETRY,
++    PEER_ERROR,
++    PEER_WAITING,
++    PEER_TEST_FAILURE
++} peer_status_t;
++
++typedef enum {
++    /* Both parties succeeded. */
++    HANDSHAKE_SUCCESS,
++    /* Client errored. */
++    CLIENT_ERROR,
++    /* Server errored. */
++    SERVER_ERROR,
++    /* Peers are in inconsistent state. */
++    INTERNAL_ERROR,
++    /* One or both peers not done. */
++    HANDSHAKE_RETRY
++} handshake_status_t;
++
++/* Stores the various status information in a handshake loop. */
++typedef struct handshake_history_entry_st {
++    connect_phase_t phase;
++    handshake_status_t handshake_status;
++    peer_status_t server_status;
++    peer_status_t client_status;
++    int client_turn_count;
++    int is_client_turn;
++} HANDSHAKE_HISTORY_ENTRY;
++
++typedef struct handshake_history_st {
++    /* Implemented using ring buffer. */
++    /*
++     * The valid entries are |entries[last_idx]|, |entries[last_idx-1]|,
++     * ..., etc., going up to |entry_count| number of entries. Note that when
++     * the index into the array |entries| becomes < 0, we wrap around to
++     * the end of |entries|.
++     */
++    HANDSHAKE_HISTORY_ENTRY entries[MAX_HANDSHAKE_HISTORY_ENTRY];
++    /* The number of valid entries in |entries| array. */
++    size_t entry_count;
++    /* The index of the last valid entry in the |entries| array. */
++    size_t last_idx;
++} HANDSHAKE_HISTORY;
++
+ typedef struct handshake_result {
+     ssl_test_result_t result;
+     /* These alerts are in the 2-byte format returned by the info_callback. */
+@@ -77,6 +139,8 @@ typedef struct handshake_result {
+     char *cipher;
+     /* session ticket application data */
+     char *result_session_ticket_app_data;
++    /* handshake loop history */
++    HANDSHAKE_HISTORY history;
+ } HANDSHAKE_RESULT;
+
+ HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void);
+@@ -95,4 +159,8 @@ int configure_handshake_ctx_for_srp(SSL_CTX *server_ctx, SSL_CTX *server2_ctx,
+                                     CTX_DATA *server2_ctx_data,
+                                     CTX_DATA *client_ctx_data);
+
++const char *handshake_connect_phase_name(connect_phase_t phase);
++const char *handshake_status_name(handshake_status_t handshake_status);
++const char *handshake_peer_status_name(peer_status_t peer_status);
++
+ #endif  /* OSSL_TEST_HANDSHAKE_HELPER_H */
+diff --git a/test/ssl_test.c b/test/ssl_test.c
+index ea608518f9..9d6b093c81 100644
+--- a/test/ssl_test.c
++++ b/test/ssl_test.c
+@@ -26,6 +26,44 @@ static OSSL_LIB_CTX *libctx = NULL;
+ /* Currently the section names are of the form test-<number>, e.g. test-15. */
+ #define MAX_TESTCASE_NAME_LENGTH 100
+
++static void print_handshake_history(const HANDSHAKE_HISTORY *history)
++{
++    size_t first_idx;
++    size_t i;
++    size_t cur_idx;
++    const HANDSHAKE_HISTORY_ENTRY *cur_entry;
++    const char header_template[] = "|%14s|%16s|%16s|%16s|%17s|%14s|";
++    const char body_template[]   = "|%14s|%16s|%16s|%16s|%17d|%14s|";
++
++    TEST_info("The following is the server/client state "
++              "in the most recent %d handshake loops.",
++              MAX_HANDSHAKE_HISTORY_ENTRY);
++
++    TEST_note("=================================================="
++              "==================================================");
++    TEST_note(header_template,
++              "phase", "handshake status", "server status",
++              "client status", "client turn count", "is client turn");
++    TEST_note("+--------------+----------------+----------------"
++              "+----------------+-----------------+--------------+");
++
++    first_idx = (history->last_idx - history->entry_count + 1) &
++                MAX_HANDSHAKE_HISTORY_ENTRY_IDX_MASK;
++    for (i = 0; i < history->entry_count; ++i) {
++        cur_idx = (first_idx + i) & MAX_HANDSHAKE_HISTORY_ENTRY_IDX_MASK;
++        cur_entry = &(history->entries)[cur_idx];
++        TEST_note(body_template,
++                  handshake_connect_phase_name(cur_entry->phase),
++                  handshake_status_name(cur_entry->handshake_status),
++                  handshake_peer_status_name(cur_entry->server_status),
++                  handshake_peer_status_name(cur_entry->client_status),
++                  cur_entry->client_turn_count,
++                  cur_entry->is_client_turn ? "true" : "false");
++    }
++    TEST_note("=================================================="
++              "==================================================");
++}
++
+ static const char *print_alert(int alert)
+ {
+     return alert ? SSL_alert_desc_string_long(alert) : "no alert";
+@@ -388,6 +426,12 @@ static int check_test(HANDSHAKE_RESULT *result, SSL_TEST_CTX *test_ctx)
+         ret &= check_client_sign_type(result, test_ctx);
+         ret &= check_client_ca_names(result, test_ctx);
+     }
++
++    /* Print handshake loop history if any check fails. */
++    if (!ret) {
++        print_handshake_history(&(result->history));
++    }
++
+     return ret;
+ }
+
+--
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.4.bb b/meta/recipes-connectivity/openssl/openssl_3.1.4.bb
index b1d5d8766f..0fe4e76808 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.4.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.4.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://fix_random_labels.patch \
+           file://0001-Added-handshake-history-reporting-when-test-fails.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.34.1


