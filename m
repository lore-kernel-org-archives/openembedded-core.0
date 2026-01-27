Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBC2D2FED9
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 18:37:02 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19294.1769539010755425657
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 10:36:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=NmC3XdEI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202601271836470c9dc2c311000207df-r5gwba@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202601271836470c9dc2c311000207df
        for <openembedded-core@lists.openembedded.org>;
        Tue, 27 Jan 2026 19:36:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=rqOUPpQgIqL/1fG+d+o2P4e04g8Lq3dkyzB9c4vMKnc=;
 b=NmC3XdEISgwPbFbxJRTFOmsG9WWDBDBEDyR0Sccp7OuL2GZAbdU9RTR5YzqBUYx+X8CuAu
 pogxuqan9yoLocLYgrfjEoMgGOcUaLz3/aWF+qha5iXuLSY2Jl/BRfXZ/qa0hgLAODGq7a+H
 0N/iARSHwBb0e3Fmam35H+rZd8UvcoWoQXgJG6Csz33Rg/hcnFwE7V6F72sA1qBv+FEnqaPV
 zirs66z5NkA7gBVWUxJQhiMbQM7gjj/oxMtoh5SySpM8la+RTTAUHzwmiyfXLOLmphF8DfuE
 S5hN9Fhi12AqQQf1uxIi6Hd6HL+pszT/3el09s2NBuGo11GRq1ksRQaQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] openssl: upgrade 3.5.4 -> 3.5.5
Date: Tue, 27 Jan 2026 19:36:41 +0100
Message-Id: <20260127183641.2313779-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 18:37:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230061

From: Peter Marko <peter.marko@siemens.com>

Resolved patch conflicts.

Release information [1]:

OpenSSL 3.5.5 is a security patch release. The most severe CVE fixed in this release is High.
This release incorporates the following bug fixes and mitigations:
* Fixed Improper validation of PBMAC1 parameters in PKCS#12 MAC verification. (CVE-2025-11187)
* Fixed Stack buffer overflow in CMS AuthEnvelopedData parsing. (CVE-2025-15467)
* Fixed NULL dereference in SSL_CIPHER_find() function on unknown cipher ID. (CVE-2025-15468)
* Fixed openssl dgst one-shot codepath silently truncates inputs >16 MiB. (CVE-2025-15469)
* Fixed TLS 1.3 CompressedCertificate excessive memory allocation. (CVE-2025-66199)
* Fixed Heap out-of-bounds write in BIO_f_linebuffer on short writes. (CVE-2025-68160)
* Fixed Unauthenticated/unencrypted trailing bytes with low-level OCB function calls. (CVE-2025-69418)
* Fixed Out of bounds write in PKCS12_get_friendlyname() UTF-8 conversion. (CVE-2025-69419)
* Fixed Missing ASN1_TYPE validation in TS_RESP_verify_response() function. (CVE-2025-69420)
* Fixed NULL Pointer Dereference in PKCS12_item_decrypt_d2i_ex() function. (CVE-2025-69421)
* Fixed Missing ASN1_TYPE validation in PKCS#12 parsing. (CVE-2026-22795)
* Fixed ASN1_TYPE Type Confusion in the PKCS7_digest_from_attributes() function. (CVE-2026-22796)

[1] https://github.com/openssl/openssl/blob/openssl-3.5/NEWS.md#major-changes-between-openssl-354-and-openssl-355-27-jan-2026

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...ke-history-reporting-when-test-fails.patch | 23 +++++++++----------
 .../0001-extend-check_cwm-test-timeout.patch  |  2 +-
 .../{openssl_3.5.4.bb => openssl_3.5.5.bb}    |  2 +-
 3 files changed, 13 insertions(+), 14 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.4.bb => openssl_3.5.5.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
index 5b7365a353..a74c79303f 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
@@ -7,10 +7,10 @@ Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/22481]
 
 Signed-off-by: William Lyu <William.Lyu@windriver.com>
 ---
- test/helpers/handshake.c | 137 +++++++++++++++++++++++++++++----------
+ test/helpers/handshake.c | 136 ++++++++++++++++++++++++++++++---------
  test/helpers/handshake.h |  70 +++++++++++++++++++-
  test/ssl_test.c          |  44 +++++++++++++
- 3 files changed, 217 insertions(+), 34 deletions(-)
+ 3 files changed, 217 insertions(+), 33 deletions(-)
 
 diff --git a/test/helpers/handshake.c b/test/helpers/handshake.c
 index f611b3a..5703b48 100644
@@ -119,7 +119,7 @@ index f611b3a..5703b48 100644
  HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void)
  {
      HANDSHAKE_RESULT *ret;
-@@ -726,15 +822,6 @@ static void configure_handshake_ssl(SSL *server, SSL *client,
+@@ -724,15 +820,6 @@ static void configure_handshake_ssl(SSL *server, SSL *client,
          SSL_set_post_handshake_auth(client, 1);
  }
  
@@ -135,7 +135,7 @@ index f611b3a..5703b48 100644
  /* An SSL object and associated read-write buffers. */
  typedef struct peer_st {
      SSL *ssl;
-@@ -1081,17 +1168,6 @@ static void do_shutdown_step(PEER *peer)
+@@ -1077,16 +1164,6 @@ static void do_shutdown_step(PEER *peer)
      }
  }
  
@@ -148,12 +148,11 @@ index f611b3a..5703b48 100644
 -    SHUTDOWN,
 -    CONNECTION_DONE
 -} connect_phase_t;
--
 -
  static int renegotiate_op(const SSL_TEST_CTX *test_ctx)
  {
      switch (test_ctx->handshake_mode) {
-@@ -1169,19 +1245,6 @@ static void do_connect_step(const SSL_TEST_CTX *test_ctx, PEER *peer,
+@@ -1164,19 +1241,6 @@ static void do_connect_step(const SSL_TEST_CTX *test_ctx, PEER *peer,
      }
  }
  
@@ -173,7 +172,7 @@ index f611b3a..5703b48 100644
  /*
   * Determine the handshake outcome.
   * last_status: the status of the peer to have acted last.
-@@ -1546,6 +1609,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
+@@ -1541,6 +1605,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
  
      start = time(NULL);
  
@@ -184,8 +183,8 @@ index f611b3a..5703b48 100644
      /*
       * Half-duplex handshake loop.
       * Client and server speak to each other synchronously in the same process.
-@@ -1567,6 +1634,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
-                                       0 /* server went last */);
+@@ -1562,6 +1630,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
+                 0 /* server went last */);
          }
  
 +        save_loop_history(&(ret->history),
@@ -292,14 +291,14 @@ index 78b03f9..b9967c2 100644
  
  HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void);
 @@ -95,4 +159,8 @@ int configure_handshake_ctx_for_srp(SSL_CTX *server_ctx, SSL_CTX *server2_ctx,
-                                     CTX_DATA *server2_ctx_data,
-                                     CTX_DATA *client_ctx_data);
+     CTX_DATA *server2_ctx_data,
+     CTX_DATA *client_ctx_data);
  
 +const char *handshake_connect_phase_name(connect_phase_t phase);
 +const char *handshake_status_name(handshake_status_t handshake_status);
 +const char *handshake_peer_status_name(peer_status_t peer_status);
 +
- #endif  /* OSSL_TEST_HANDSHAKE_HELPER_H */
+ #endif /* OSSL_TEST_HANDSHAKE_HELPER_H */
 diff --git a/test/ssl_test.c b/test/ssl_test.c
 index ea60851..9d6b093 100644
 --- a/test/ssl_test.c
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch
index d02d42f1b5..f6eb28069a 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch
@@ -20,7 +20,7 @@ index 4a1e886a71..39f8c61ef9 100644
 +++ b/test/radix/main.c
 @@ -25,6 +25,11 @@ static int test_script(int idx)
      int testresult;
-     TERP_CONFIG cfg = {0};
+     TERP_CONFIG cfg = { 0 };
  
 +    // check_cwm test sometimes times out, the default 3000ms is
 +    // not enough if the test execution starves for CPU
diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.4.bb b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.5.4.bb
rename to meta/recipes-connectivity/openssl/openssl_3.5.5.bb
index e760baf3a0..c0d02b617b 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "967311f84955316969bdb1d8d4b983718ef42338639c621ec4c34fddef355e99"
+SRC_URI[sha256sum] = "b28c91532a8b65a1f983b4c28b7488174e4a01008e29ce8e69bd789f28bc2a89"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

