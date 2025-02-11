Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15C5C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 18:37:36 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.777.1739299054441759415
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 10:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=HXMKQPIP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202502111837316017d2829b09d0ec7a-h7y_n_@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202502111837316017d2829b09d0ec7a
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Feb 2025 19:37:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=edeEwgEnhEEBvshny3urUTpQ9LT8P8LQfrdykW+3tM8=;
 b=HXMKQPIP/fCGm2Itw+tScY/DCCQydWGEqkvV7LKqNKAK+UisJsVsEvgihOyVNIQHoCzf5T
 q9NdvcpT4BYt+RdD4Uz1QWwH+ZGMhQlOPPE82krmh+IjcWhOBjmlnG+ZSNS0SDc3H0gGkiNR
 8vTUcDW0a3lob2y3oA62MhfpwGW9a1WedjH8jHLA8JgIz+ZiAOvZ7k+iYJ/uQW9YbO0llSC8
 3iFDbE4DOppkc673k4S4NQkjKmzbmRkdf4LnO6kOxjxWDI43YnGm0GnvC5pZ0jUzC3kSKmuJ
 SCeK+neMI519HrQ0uhjb0byqU3tomCIrgJWNvn8KvOqhW+xpQm3AtZIA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] openssl: upgrade 3.2.3 -> 3.2.4
Date: Tue, 11 Feb 2025 19:36:20 +0100
Message-Id: <20250211183620.1574061-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 18:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211163

From: Peter Marko <peter.marko@siemens.com>

Release information:
https://github.com/openssl/openssl/blob/openssl-3.2/NEWS.md#major-changes-between-openssl-323-and-openssl-324-11-feb-2025

Handles CVE-2024-12797 in addition to already patched CVEs.

Refresh patches and remove CVE patches included in the new version.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...ke-history-reporting-when-test-fails.patch |  40 ++--
 ...1-Configure-do-not-tweak-mips-cflags.patch |   2 +-
 ...sysroot-and-debug-prefix-map-from-co.patch |   4 +-
 .../openssl/openssl/CVE-2024-13176.patch      | 126 -----------
 .../openssl/openssl/CVE-2024-9143.patch       | 202 ------------------
 .../{openssl_3.2.3.bb => openssl_3.2.4.bb}    |   4 +-
 6 files changed, 24 insertions(+), 354 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch
 delete mode 100755 meta/recipes-connectivity/openssl/openssl/CVE-2024-9143.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.2.3.bb => openssl_3.2.4.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
index 9baa0c2d75..b05d7abf7c 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
@@ -8,10 +8,10 @@ Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/22481]
 Signed-off-by: William Lyu <William.Lyu@windriver.com>
 Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
 ---
- test/helpers/handshake.c | 139 +++++++++++++++++++++++++++++----------
+ test/helpers/handshake.c | 137 +++++++++++++++++++++++++++++----------
  test/helpers/handshake.h |  70 +++++++++++++++++++-
  test/ssl_test.c          |  44 +++++++++++++
- 3 files changed, 218 insertions(+), 35 deletions(-)
+ 3 files changed, 217 insertions(+), 34 deletions(-)
 
 diff --git a/test/helpers/handshake.c b/test/helpers/handshake.c
 index e0422469e4..ae2ad59dd4 100644
@@ -20,7 +20,7 @@ index e0422469e4..ae2ad59dd4 100644
 @@ -24,6 +24,102 @@
  #include <netinet/sctp.h>
  #endif
-
+ 
 +/* Shamelessly copied from test/helpers/ssl_test_ctx.c */
 +/* Maps string names to various enumeration type */
 +typedef struct {
@@ -120,10 +120,10 @@ index e0422469e4..ae2ad59dd4 100644
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
@@ -136,10 +136,10 @@ index e0422469e4..ae2ad59dd4 100644
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
@@ -154,10 +154,10 @@ index e0422469e4..ae2ad59dd4 100644
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
@@ -174,10 +174,10 @@ index e0422469e4..ae2ad59dd4 100644
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
@@ -185,10 +185,10 @@ index e0422469e4..ae2ad59dd4 100644
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
@@ -208,9 +208,9 @@ index 78b03f9f4b..b9967c2623 100644
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
@@ -222,7 +222,7 @@ index 78b03f9f4b..b9967c2623 100644
 @@ -22,6 +27,63 @@ typedef struct ctx_data_st {
      char *session_ticket_app_data;
  } CTX_DATA;
-
+ 
 +typedef enum {
 +    HANDSHAKE,
 +    RENEG_APPLICATION_DATA,
@@ -290,12 +290,12 @@ index 78b03f9f4b..b9967c2623 100644
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
@@ -308,7 +308,7 @@ index ea608518f9..9d6b093c81 100644
 @@ -26,6 +26,44 @@ static OSSL_LIB_CTX *libctx = NULL;
  /* Currently the section names are of the form test-<number>, e.g. test-15. */
  #define MAX_TESTCASE_NAME_LENGTH 100
-
+ 
 +static void print_handshake_history(const HANDSHAKE_HISTORY *history)
 +{
 +    size_t first_idx;
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
index 502a7aaf32..3f6ab97795 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
@@ -20,7 +20,7 @@ diff --git a/Configure b/Configure
 index 4569952..adf019b 100755
 --- a/Configure
 +++ b/Configure
-@@ -1422,16 +1422,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
+@@ -1485,16 +1485,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
          push @{$config{shared_ldflag}}, "-mno-cygwin";
          }
  
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
index bafdbaa46f..ce2acb2462 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
@@ -38,7 +38,7 @@ Index: openssl-3.0.4/Configurations/unix-Makefile.tmpl
 ===================================================================
 --- openssl-3.0.4.orig/Configurations/unix-Makefile.tmpl
 +++ openssl-3.0.4/Configurations/unix-Makefile.tmpl
-@@ -472,13 +472,23 @@ BIN_LDFLAGS={- join(' ', $target{bin_lfl
+@@ -481,13 +481,23 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
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
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch
deleted file mode 100644
index 28d4dd706a..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-From 4b1cb94a734a7d4ec363ac0a215a25c181e11f65 Mon Sep 17 00:00:00 2001
-From: Tomas Mraz <tomas@openssl.org>
-Date: Wed, 15 Jan 2025 18:27:02 +0100
-Subject: [PATCH] Fix timing side-channel in ECDSA signature computation
-
-There is a timing signal of around 300 nanoseconds when the top word of
-the inverted ECDSA nonce value is zero. This can happen with significant
-probability only for some of the supported elliptic curves. In particular
-the NIST P-521 curve is affected. To be able to measure this leak, the
-attacker process must either be located in the same physical computer or
-must have a very fast network connection with low latency.
-
-Attacks on ECDSA nonce are also known as Minerva attack.
-
-Fixes CVE-2024-13176
-
-Reviewed-by: Tim Hudson <tjh@openssl.org>
-Reviewed-by: Neil Horman <nhorman@openssl.org>
-Reviewed-by: Paul Dale <ppzgs1@gmail.com>
-(Merged from https://github.com/openssl/openssl/pull/26429)
-
-(cherry picked from commit 63c40a66c5dc287485705d06122d3a6e74a6a203)
-(cherry picked from commit 392dcb336405a0c94486aa6655057f59fd3a0902)
-
-CVE: CVE-2024-13176
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/4b1cb94a734a7d4ec363ac0a215a25c181e11f65]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- crypto/bn/bn_exp.c  | 21 +++++++++++++++------
- crypto/ec/ec_lib.c  |  7 ++++---
- include/crypto/bn.h |  3 +++
- 3 files changed, 22 insertions(+), 9 deletions(-)
-
-diff --git a/crypto/bn/bn_exp.c b/crypto/bn/bn_exp.c
-index b876edbfac36e..af52e2ced6914 100644
---- a/crypto/bn/bn_exp.c
-+++ b/crypto/bn/bn_exp.c
-@@ -606,7 +606,7 @@ static int MOD_EXP_CTIME_COPY_FROM_PREBUF(BIGNUM *b, int top,
-  * out by Colin Percival,
-  * http://www.daemonology.net/hyperthreading-considered-harmful/)
-  */
--int BN_mod_exp_mont_consttime(BIGNUM *rr, const BIGNUM *a, const BIGNUM *p,
-+int bn_mod_exp_mont_fixed_top(BIGNUM *rr, const BIGNUM *a, const BIGNUM *p,
-                               const BIGNUM *m, BN_CTX *ctx,
-                               BN_MONT_CTX *in_mont)
- {
-@@ -623,10 +623,6 @@ int BN_mod_exp_mont_consttime(BIGNUM *rr, const BIGNUM *a, const BIGNUM *p,
-     unsigned int t4 = 0;
- #endif
- 
--    bn_check_top(a);
--    bn_check_top(p);
--    bn_check_top(m);
--
-     if (!BN_is_odd(m)) {
-         ERR_raise(ERR_LIB_BN, BN_R_CALLED_WITH_EVEN_MODULUS);
-         return 0;
-@@ -1146,7 +1142,7 @@ int BN_mod_exp_mont_consttime(BIGNUM *rr, const BIGNUM *a, const BIGNUM *p,
-             goto err;
-     } else
- #endif
--    if (!BN_from_montgomery(rr, &tmp, mont, ctx))
-+    if (!bn_from_mont_fixed_top(rr, &tmp, mont, ctx))
-         goto err;
-     ret = 1;
-  err:
-@@ -1160,6 +1156,19 @@ int BN_mod_exp_mont_consttime(BIGNUM *rr, const BIGNUM *a, const BIGNUM *p,
-     return ret;
- }
- 
-+int BN_mod_exp_mont_consttime(BIGNUM *rr, const BIGNUM *a, const BIGNUM *p,
-+                              const BIGNUM *m, BN_CTX *ctx,
-+                              BN_MONT_CTX *in_mont)
-+{
-+    bn_check_top(a);
-+    bn_check_top(p);
-+    bn_check_top(m);
-+    if (!bn_mod_exp_mont_fixed_top(rr, a, p, m, ctx, in_mont))
-+        return 0;
-+    bn_correct_top(rr);
-+    return 1;
-+}
-+
- int BN_mod_exp_mont_word(BIGNUM *rr, BN_ULONG a, const BIGNUM *p,
-                          const BIGNUM *m, BN_CTX *ctx, BN_MONT_CTX *in_mont)
- {
-diff --git a/crypto/ec/ec_lib.c b/crypto/ec/ec_lib.c
-index c92b4dcb0ac45..a79fbb98cf6fa 100644
---- a/crypto/ec/ec_lib.c
-+++ b/crypto/ec/ec_lib.c
-@@ -21,6 +21,7 @@
- #include <openssl/opensslv.h>
- #include <openssl/param_build.h>
- #include "crypto/ec.h"
-+#include "crypto/bn.h"
- #include "internal/nelem.h"
- #include "ec_local.h"
- 
-@@ -1261,10 +1262,10 @@ static int ec_field_inverse_mod_ord(const EC_GROUP *group, BIGNUM *r,
-     if (!BN_sub(e, group->order, e))
-         goto err;
-     /*-
--     * Exponent e is public.
--     * No need for scatter-gather or BN_FLG_CONSTTIME.
-+     * Although the exponent is public we want the result to be
-+     * fixed top.
-      */
--    if (!BN_mod_exp_mont(r, x, e, group->order, ctx, group->mont_data))
-+    if (!bn_mod_exp_mont_fixed_top(r, x, e, group->order, ctx, group->mont_data))
-         goto err;
- 
-     ret = 1;
-diff --git a/include/crypto/bn.h b/include/crypto/bn.h
-index 302f031c2ff1d..499e1d10efab0 100644
---- a/include/crypto/bn.h
-+++ b/include/crypto/bn.h
-@@ -73,6 +73,9 @@ int bn_set_words(BIGNUM *a, const BN_ULONG *words, int num_words);
-  */
- int bn_mul_mont_fixed_top(BIGNUM *r, const BIGNUM *a, const BIGNUM *b,
-                           BN_MONT_CTX *mont, BN_CTX *ctx);
-+int bn_mod_exp_mont_fixed_top(BIGNUM *rr, const BIGNUM *a, const BIGNUM *p,
-+                              const BIGNUM *m, BN_CTX *ctx,
-+                              BN_MONT_CTX *in_mont);
- int bn_to_mont_fixed_top(BIGNUM *r, const BIGNUM *a, BN_MONT_CTX *mont,
-                          BN_CTX *ctx);
- int bn_from_mont_fixed_top(BIGNUM *r, const BIGNUM *a, BN_MONT_CTX *mont,
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-9143.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-9143.patch
deleted file mode 100755
index 99c16cd573..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2024-9143.patch
+++ /dev/null
@@ -1,202 +0,0 @@
-From bc7e04d7c8d509fb78fc0e285aa948fb0da04700 Mon Sep 17 00:00:00 2001
-From: Viktor Dukhovni <viktor@openssl.org>
-Date: Thu, 19 Sep 2024 01:02:40 +1000
-Subject: [PATCH] Harden BN_GF2m_poly2arr against misuse.
-
-The BN_GF2m_poly2arr() function converts characteristic-2 field
-(GF_{2^m}) Galois polynomials from a representation as a BIGNUM bitmask,
-to a compact array with just the exponents of the non-zero terms.
-
-These polynomials are then used in BN_GF2m_mod_arr() to perform modular
-reduction.  A precondition of calling BN_GF2m_mod_arr() is that the
-polynomial must have a non-zero constant term (i.e. the array has `0` as
-its final element).
-
-Internally, callers of BN_GF2m_poly2arr() did not verify that
-precondition, and binary EC curve parameters with an invalid polynomial
-could lead to out of bounds memory reads and writes in BN_GF2m_mod_arr().
-
-The precondition is always true for polynomials that arise from the
-standard form of EC parameters for characteristic-two fields (X9.62).
-See the "Finite Field Identification" section of:
-
-    https://www.itu.int/ITU-T/formal-language/itu-t/x/x894/2018-cor1/ANSI-X9-62.html
-
-The OpenSSL GF(2^m) code supports only the trinomial and pentanomial
-basis X9.62 forms.
-
-This commit updates BN_GF2m_poly2arr() to return `0` (failure) when
-the constant term is zero (i.e. the input bitmask BIGNUM is not odd).
-
-Additionally, the return value is made unambiguous when there is not
-enough space to also pad the array with a final `-1` sentinel value.
-The return value is now always the number of elements (including the
-final `-1`) that would be filled when the output array is sufficiently
-large.  Previously the same count was returned both when the array has
-just enough room for the final `-1` and when it had only enough space
-for non-sentinel values.
-
-Finally, BN_GF2m_poly2arr() is updated to reject polynomials whose
-degree exceeds `OPENSSL_ECC_MAX_FIELD_BITS`, this guards against
-CPU exhausition attacks via excessively large inputs.
-
-The above issues do not arise in processing X.509 certificates.  These
-generally have EC keys from "named curves", and RFC5840 (Section 2.1.1)
-disallows explicit EC parameters.  The TLS code in OpenSSL enforces this
-constraint only after the certificate is decoded, but, even if explicit
-parameters are specified, they are in X9.62 form, which cannot represent
-problem values as noted above.
-
-Initially reported as oss-fuzz issue 71623.
-
-A closely related issue was earlier reported in
-<https://github.com/openssl/openssl/issues/19826>.
-
-Severity: Low, CVE-2024-9143
-
-Reviewed-by: Matt Caswell <matt@openssl.org>
-Reviewed-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
-Reviewed-by: Paul Dale <ppzgs1@gmail.com>
-Reviewed-by: Tomas Mraz <tomas@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/25639)
-
-(cherry picked from commit 8e008cb8b23ec7dc75c45a66eeed09c815b11cd2)
-
-CVE: CVE-2024-9143
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/bc7e04d7c8d509fb78fc0e285aa948fb0da04700]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- crypto/bn/bn_gf2m.c     | 28 +++++++++++++++-------
- test/ec_internal_test.c | 51 +++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 71 insertions(+), 8 deletions(-)
-
-diff --git a/crypto/bn/bn_gf2m.c b/crypto/bn/bn_gf2m.c
-index 444c5ca7a3755..ae7e9d751c29c 100644
---- a/crypto/bn/bn_gf2m.c
-+++ b/crypto/bn/bn_gf2m.c
-@@ -15,6 +15,7 @@
- #include "bn_local.h"
- 
- #ifndef OPENSSL_NO_EC2M
-+# include <openssl/ec.h>
- 
- /*
-  * Maximum number of iterations before BN_GF2m_mod_solve_quad_arr should
-@@ -1130,16 +1131,26 @@ int BN_GF2m_mod_solve_quad(BIGNUM *r, const BIGNUM *a, const BIGNUM *p,
- /*
-  * Convert the bit-string representation of a polynomial ( \sum_{i=0}^n a_i *
-  * x^i) into an array of integers corresponding to the bits with non-zero
-- * coefficient.  Array is terminated with -1. Up to max elements of the array
-- * will be filled.  Return value is total number of array elements that would
-- * be filled if array was large enough.
-+ * coefficient.  The array is intended to be suitable for use with
-+ * `BN_GF2m_mod_arr()`, and so the constant term of the polynomial must not be
-+ * zero.  This translates to a requirement that the input BIGNUM `a` is odd.
-+ *
-+ * Given sufficient room, the array is terminated with -1.  Up to max elements
-+ * of the array will be filled.
-+ *
-+ * The return value is total number of array elements that would be filled if
-+ * array was large enough, including the terminating `-1`.  It is `0` when `a`
-+ * is not odd or the constant term is zero contrary to requirement.
-+ *
-+ * The return value is also `0` when the leading exponent exceeds
-+ * `OPENSSL_ECC_MAX_FIELD_BITS`, this guards against CPU exhaustion attacks,
-  */
- int BN_GF2m_poly2arr(const BIGNUM *a, int p[], int max)
- {
-     int i, j, k = 0;
-     BN_ULONG mask;
- 
--    if (BN_is_zero(a))
-+    if (!BN_is_odd(a))
-         return 0;
- 
-     for (i = a->top - 1; i >= 0; i--) {
-@@ -1157,12 +1168,13 @@ int BN_GF2m_poly2arr(const BIGNUM *a, int p[], int max)
-         }
-     }
- 
--    if (k < max) {
-+    if (k > 0 && p[0] > OPENSSL_ECC_MAX_FIELD_BITS)
-+        return 0;
-+
-+    if (k < max)
-         p[k] = -1;
--        k++;
--    }
- 
--    return k;
-+    return k + 1;
- }
- 
- /*
-diff --git a/test/ec_internal_test.c b/test/ec_internal_test.c
-index 5076f9894d5b8..92904cfc42b20 100644
---- a/test/ec_internal_test.c
-+++ b/test/ec_internal_test.c
-@@ -155,6 +155,56 @@ static int field_tests_ecp_mont(void)
- }
- 
- #ifndef OPENSSL_NO_EC2M
-+/* Test that decoding of invalid GF2m field parameters fails. */
-+static int ec2m_field_sanity(void)
-+{
-+    int ret = 0;
-+    BN_CTX *ctx = BN_CTX_new();
-+    BIGNUM *p, *a, *b;
-+    EC_GROUP *group1 = NULL, *group2 = NULL, *group3 = NULL;
-+
-+    TEST_info("Testing GF2m hardening\n");
-+
-+    BN_CTX_start(ctx);
-+    p = BN_CTX_get(ctx);
-+    a = BN_CTX_get(ctx);
-+    if (!TEST_ptr(b = BN_CTX_get(ctx))
-+        || !TEST_true(BN_one(a))
-+        || !TEST_true(BN_one(b)))
-+        goto out;
-+
-+    /* Even pentanomial value should be rejected */
-+    if (!TEST_true(BN_set_word(p, 0xf2)))
-+        goto out;
-+    if (!TEST_ptr_null(group1 = EC_GROUP_new_curve_GF2m(p, a, b, ctx)))
-+        TEST_error("Zero constant term accepted in GF2m polynomial");
-+
-+    /* Odd hexanomial should also be rejected */
-+    if (!TEST_true(BN_set_word(p, 0xf3)))
-+        goto out;
-+    if (!TEST_ptr_null(group2 = EC_GROUP_new_curve_GF2m(p, a, b, ctx)))
-+        TEST_error("Hexanomial accepted as GF2m polynomial");
-+
-+    /* Excessive polynomial degree should also be rejected */
-+    if (!TEST_true(BN_set_word(p, 0x71))
-+        || !TEST_true(BN_set_bit(p, OPENSSL_ECC_MAX_FIELD_BITS + 1)))
-+        goto out;
-+    if (!TEST_ptr_null(group3 = EC_GROUP_new_curve_GF2m(p, a, b, ctx)))
-+        TEST_error("GF2m polynomial degree > %d accepted",
-+                   OPENSSL_ECC_MAX_FIELD_BITS);
-+
-+    ret = group1 == NULL && group2 == NULL && group3 == NULL;
-+
-+ out:
-+    EC_GROUP_free(group1);
-+    EC_GROUP_free(group2);
-+    EC_GROUP_free(group3);
-+    BN_CTX_end(ctx);
-+    BN_CTX_free(ctx);
-+
-+    return ret;
-+}
-+
- /* test EC_GF2m_simple_method directly */
- static int field_tests_ec2_simple(void)
- {
-@@ -443,6 +493,7 @@ int setup_tests(void)
-     ADD_TEST(field_tests_ecp_simple);
-     ADD_TEST(field_tests_ecp_mont);
- #ifndef OPENSSL_NO_EC2M
-+    ADD_TEST(ec2m_field_sanity);
-     ADD_TEST(field_tests_ec2_simple);
- #endif
-     ADD_ALL_TESTS(field_tests_default, crv_len);
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.3.bb b/meta/recipes-connectivity/openssl/openssl_3.2.4.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_3.2.3.bb
rename to meta/recipes-connectivity/openssl/openssl_3.2.4.bb
index 0b47bab550..bada192fe9 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.3.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.4.bb
@@ -12,15 +12,13 @@ SRC_URI = "https://github.com/openssl/openssl/releases/download/openssl-${PV}/op
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
-           file://CVE-2024-9143.patch \
-           file://CVE-2024-13176.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "52b5f1c6b8022bc5868c308c54fb77705e702d6c6f4594f99a0df216acf46239"
+SRC_URI[sha256sum] = "b23ad7fd9f73e43ad1767e636040e88ba7c9e5775bfa5618436a0dd2c17c3716"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

