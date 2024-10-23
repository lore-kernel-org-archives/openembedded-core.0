Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FE9CFA45E
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 18:49:27 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.5607.1729709365099000035
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 11:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=EkOMaa0L;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2024102318491973503906331fdece15-xhy2cx@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2024102318491973503906331fdece15
        for <openembedded-core@lists.openembedded.org>;
        Wed, 23 Oct 2024 20:49:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=/fGDCEjC9nb4IjzSlel8GTxsie9rmDJi2paHU2NWkkg=;
 b=EkOMaa0LJirM+NeCpQWqaOrKMZy2dRX8oToq9Xx36nKbNosqRMkieiMk3BPZowIS7mJnvN
 E03PaeunvmIwVNdMkS4l5M69tamJM1CFa8CXpvOJqkmSvNm3Mai9g4wOnflQP9uPY00e7wXR
 PWf57bFTAZnLGXfaBBuzRS/9JX0bsCj4fpFhUHWXYwL0AspumUbgpiUcuyFL7Ru9wIGmHYiJ
 bmG77g/WNYs+rE1mlXYZVZA9+OFDWwuuTra9y09WYdAeP+SfxFrtz6+sVhh/jeIEczTDqsrv
 cENiSU9T1XS94+rj0pFes4nf5953cqpBT0Um7lSEXP0k0hclclrxtmnw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] openssl: upgrade 3.3.1 ->  3.4.0
Date: Wed, 23 Oct 2024 20:48:29 +0200
Message-Id: <20241023184829.2216595-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 18:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206264

From: Peter Marko <peter.marko@siemens.com>

Release information:
https://github.com/openssl/openssl/blob/openssl-3.4/NEWS.md#major-changes-between-openssl-33-and-openssl-340-22-oct-2024

Handles CVE-2024-9143

Refreshed patches.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...ke-history-reporting-when-test-fails.patch | 53 ++++++++-----------
 ...1-Configure-do-not-tweak-mips-cflags.patch |  4 +-
 ...sysroot-and-debug-prefix-map-from-co.patch |  4 +-
 .../{openssl_3.3.1.bb => openssl_3.4.0.bb}    |  2 +-
 4 files changed, 28 insertions(+), 35 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.3.1.bb => openssl_3.4.0.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
index aa2e5bb800..31bbbd8679 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
@@ -7,26 +7,19 @@ Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/22481]
 
 Signed-off-by: William Lyu <William.Lyu@windriver.com>
 ---
- test/helpers/handshake.c | 139 +++++++++++++++++++++++++++++----------
+ test/helpers/handshake.c | 137 +++++++++++++++++++++++++++++----------
  test/helpers/handshake.h |  70 +++++++++++++++++++-
  test/ssl_test.c          |  44 +++++++++++++
- 3 files changed, 218 insertions(+), 35 deletions(-)
+ 3 files changed, 217 insertions(+), 34 deletions(-)
 
 diff --git a/test/helpers/handshake.c b/test/helpers/handshake.c
-index e0422469e4..ae2ad59dd4 100644
+index f611b3a..5703b48 100644
 --- a/test/helpers/handshake.c
 +++ b/test/helpers/handshake.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright 2016-2022 The OpenSSL Project Authors. All Rights Reserved.
-+ * Copyright 2016-2023 The OpenSSL Project Authors. All Rights Reserved.
-  *
-  * Licensed under the Apache License 2.0 (the "License").  You may not use
-  * this file except in compliance with the License.  You can obtain a copy
 @@ -24,6 +24,102 @@
  #include <netinet/sctp.h>
  #endif
-
+ 
 +/* Shamelessly copied from test/helpers/ssl_test_ctx.c */
 +/* Maps string names to various enumeration type */
 +typedef struct {
@@ -126,10 +119,10 @@ index e0422469e4..ae2ad59dd4 100644
  HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void)
  {
      HANDSHAKE_RESULT *ret;
-@@ -719,15 +815,6 @@ static void configure_handshake_ssl(SSL *server, SSL *client,
+@@ -725,15 +821,6 @@ static void configure_handshake_ssl(SSL *server, SSL *client,
          SSL_set_post_handshake_auth(client, 1);
  }
-
+ 
 -/* The status for each connection phase. */
 -typedef enum {
 -    PEER_SUCCESS,
@@ -142,10 +135,10 @@ index e0422469e4..ae2ad59dd4 100644
  /* An SSL object and associated read-write buffers. */
  typedef struct peer_st {
      SSL *ssl;
-@@ -1074,17 +1161,6 @@ static void do_shutdown_step(PEER *peer)
+@@ -1080,17 +1167,6 @@ static void do_shutdown_step(PEER *peer)
      }
  }
-
+ 
 -typedef enum {
 -    HANDSHAKE,
 -    RENEG_APPLICATION_DATA,
@@ -160,10 +153,10 @@ index e0422469e4..ae2ad59dd4 100644
  static int renegotiate_op(const SSL_TEST_CTX *test_ctx)
  {
      switch (test_ctx->handshake_mode) {
-@@ -1162,19 +1238,6 @@ static void do_connect_step(const SSL_TEST_CTX *test_ctx, PEER *peer,
+@@ -1168,19 +1244,6 @@ static void do_connect_step(const SSL_TEST_CTX *test_ctx, PEER *peer,
      }
  }
-
+ 
 -typedef enum {
 -    /* Both parties succeeded. */
 -    HANDSHAKE_SUCCESS,
@@ -180,10 +173,10 @@ index e0422469e4..ae2ad59dd4 100644
  /*
   * Determine the handshake outcome.
   * last_status: the status of the peer to have acted last.
-@@ -1539,6 +1602,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
-
+@@ -1545,6 +1608,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
+ 
      start = time(NULL);
-
+ 
 +    save_loop_history(&(ret->history),
 +                      phase, status, server.status, client.status,
 +                      client_turn_count, client_turn);
@@ -191,10 +184,10 @@ index e0422469e4..ae2ad59dd4 100644
      /*
       * Half-duplex handshake loop.
       * Client and server speak to each other synchronously in the same process.
-@@ -1560,6 +1627,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
+@@ -1566,6 +1633,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
                                        0 /* server went last */);
          }
-
+ 
 +        save_loop_history(&(ret->history),
 +                          phase, status, server.status, client.status,
 +                          client_turn_count, client_turn);
@@ -203,7 +196,7 @@ index e0422469e4..ae2ad59dd4 100644
          case HANDSHAKE_SUCCESS:
              client_turn_count = 0;
 diff --git a/test/helpers/handshake.h b/test/helpers/handshake.h
-index 78b03f9f4b..b9967c2623 100644
+index 78b03f9..b9967c2 100644
 --- a/test/helpers/handshake.h
 +++ b/test/helpers/handshake.h
 @@ -1,5 +1,5 @@
@@ -214,9 +207,9 @@ index 78b03f9f4b..b9967c2623 100644
   * Licensed under the Apache License 2.0 (the "License").  You may not use
   * this file except in compliance with the License.  You can obtain a copy
 @@ -12,6 +12,11 @@
-
+ 
  #include "ssl_test_ctx.h"
-
+ 
 +#define MAX_HANDSHAKE_HISTORY_ENTRY_BIT 4
 +#define MAX_HANDSHAKE_HISTORY_ENTRY (1 << MAX_HANDSHAKE_HISTORY_ENTRY_BIT)
 +#define MAX_HANDSHAKE_HISTORY_ENTRY_IDX_MASK \
@@ -228,7 +221,7 @@ index 78b03f9f4b..b9967c2623 100644
 @@ -22,6 +27,63 @@ typedef struct ctx_data_st {
      char *session_ticket_app_data;
  } CTX_DATA;
-
+ 
 +typedef enum {
 +    HANDSHAKE,
 +    RENEG_APPLICATION_DATA,
@@ -296,25 +289,25 @@ index 78b03f9f4b..b9967c2623 100644
 +    /* handshake loop history */
 +    HANDSHAKE_HISTORY history;
  } HANDSHAKE_RESULT;
-
+ 
  HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void);
 @@ -95,4 +159,8 @@ int configure_handshake_ctx_for_srp(SSL_CTX *server_ctx, SSL_CTX *server2_ctx,
                                      CTX_DATA *server2_ctx_data,
                                      CTX_DATA *client_ctx_data);
-
+ 
 +const char *handshake_connect_phase_name(connect_phase_t phase);
 +const char *handshake_status_name(handshake_status_t handshake_status);
 +const char *handshake_peer_status_name(peer_status_t peer_status);
 +
  #endif  /* OSSL_TEST_HANDSHAKE_HELPER_H */
 diff --git a/test/ssl_test.c b/test/ssl_test.c
-index ea608518f9..9d6b093c81 100644
+index ea60851..9d6b093 100644
 --- a/test/ssl_test.c
 +++ b/test/ssl_test.c
 @@ -26,6 +26,44 @@ static OSSL_LIB_CTX *libctx = NULL;
  /* Currently the section names are of the form test-<number>, e.g. test-15. */
  #define MAX_TESTCASE_NAME_LENGTH 100
-
+ 
 +static void print_handshake_history(const HANDSHAKE_HISTORY *history)
 +{
 +    size_t first_idx;
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
index 502a7aaf32..c7e9c9d96e 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
@@ -17,10 +17,10 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 10 deletions(-)
 
 diff --git a/Configure b/Configure
-index 4569952..adf019b 100755
+index fff97bd..5ee54c1 100755
 --- a/Configure
 +++ b/Configure
-@@ -1422,16 +1422,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
+@@ -1529,16 +1529,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
          push @{$config{shared_ldflag}}, "-mno-cygwin";
          }
  
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
index bafdbaa46f..b8672735ab 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
@@ -38,7 +38,7 @@ Index: openssl-3.0.4/Configurations/unix-Makefile.tmpl
 ===================================================================
 --- openssl-3.0.4.orig/Configurations/unix-Makefile.tmpl
 +++ openssl-3.0.4/Configurations/unix-Makefile.tmpl
-@@ -472,13 +472,23 @@ BIN_LDFLAGS={- join(' ', $target{bin_lfl
+@@ -502,13 +502,23 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
                           '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
  BIN_EX_LIBS=$(CNF_EX_LIBS) $(EX_LIBS)
  
@@ -67,7 +67,7 @@ Index: openssl-3.0.4/crypto/build.info
 ===================================================================
 --- openssl-3.0.4.orig/crypto/build.info
 +++ openssl-3.0.4/crypto/build.info
-@@ -109,7 +109,7 @@ DEFINE[../libcrypto]=$UPLINKDEF
+@@ -115,7 +115,7 @@ DEFINE[../libcrypto]=$UPLINKDEF
  
  DEPEND[info.o]=buildinf.h
  DEPEND[cversion.o]=buildinf.h
diff --git a/meta/recipes-connectivity/openssl/openssl_3.3.1.bb b/meta/recipes-connectivity/openssl/openssl_3.4.0.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.3.1.bb
rename to meta/recipes-connectivity/openssl/openssl_3.4.0.bb
index 3bc0153429..734e3c54ef 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.3.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.4.0.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "777cd596284c883375a2a7a11bf5d2786fc5413255efab20c50d6ffe6d020b7e"
+SRC_URI[sha256sum] = "e15dda82fe2fe8139dc2ac21a36d4ca01d5313c75f99f46c4e8a27709b7294bf"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.30.2


