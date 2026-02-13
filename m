Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87943EF48DE
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 08:10:30 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67219.1770970222762518429
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 00:10:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3qA33Qx/;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43591b55727so670808f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 00:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770970221; x=1771575021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+mxI7LVnLd153UWdXzcPexHSUkanORI0w7NgzpHCCwI=;
        b=3qA33Qx/NBfZjZ/fmNLByg+COct7NWjhQY/DoFy6gHYO928ctMFG0T+ZziXKpPyHFz
         Sy83rWcjiJ/rSC1byf1phRSZZK7ir+NzHhBKziD41d1m+ijn1dKG9XhQN82bMM3LdgbC
         /LemyrK0sXt8DEJpREBY1kxqaMIEerCeN8fqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970221; x=1771575021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+mxI7LVnLd153UWdXzcPexHSUkanORI0w7NgzpHCCwI=;
        b=hRYJAZn8bucnHuaO08+bGXq6E5gopnFi/V5zCkE6qCkTOzsOV02OBg795DnP1jgoiZ
         6O4nDqFU7PL6ZxKNWtdPNMAMDkxElt+Rbg84vtUJKHnlHTFfZOtD27VZyCygk54pzHdc
         0gKgB2/X+WcSH/73d/0gJasXeLG1z2XUfh/xtc+m1Q4IL5DmCwpAOZyB7wfJUD0WMdBp
         0D25muAWViDx/2ZNW8281ISU0oyQOlHYqZ27knDXFqLQ5psw45tFl8iwm407TcBgsjvP
         gcfRFNlzMajhQTay2JMWUQzdaEw/ETryt3EGZSg6Mkrc9fgSG2fqpQvjAKaOHCwgBuIj
         9pIQ==
X-Gm-Message-State: AOJu0YyCkAn41cTKQmYgppzB1agwE8PunieXy0YSzsZCOUDG1XwZzTLS
	Vg2b6OjMMdV7zzxtmLLU/X+Qm5TLWBBr5DF45qp/5RnN0ifqZSZdNZGuCm0rcSimr7NOyPUgyjZ
	LwieZ
X-Gm-Gg: AZuq6aIPjJrXs+WtpJELs8/jPfKISrDHupZDkozv4M1wwXwn4aDLL0bVMYv2/dXi8tY
	VcIVY4C/3lrvZCnY2KSd1OtgXoBtpuPa9xi4hqvUGUV4eHBAcHuvv7gcbInlr2hHieRCopyCVX1
	bC/TTMP8lvnJrOE2TH9Mm8qE+cDc8rpiNf2lFRVZtZNzTpMhrunC0K2jI6qa7aEJ6yywvQIZ19j
	rXXv3dYPcEqclwf1Qb+ZC0GJoC3H0ZPnuEXCJnDWsKtybXm9B7GSV4NxzwUTPQcG4V++ofZ1PLk
	eF/nz4jQgTMG2iNdwKqfzJcaz5WdNYOMb0pEfaRtHzuN5i6EMuP9uggYQoRjcYz0ul79h00Xdjx
	H0uv1VKWThanaNeuUrDSGnVcHQbVjzgCI2n06HkXsD9Qi9c98uHpQJjhvHoGa4b1N8GS2zC1K1r
	1zOUIyvPzkA+scgh53VrFyfUdPfQo192IWxo5/fqfvDlPlJ2nIsfNr1zq6n/JmaPiVNHXipX8jz
	Elr2S8HX2Cp7qbhbH/y3Mp5dY8=
X-Received: by 2002:a05:6000:603:b0:436:1e6:e1d6 with SMTP id ffacd0b85a97d-4379791c825mr1997814f8f.46.1770970220686;
        Fri, 13 Feb 2026 00:10:20 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00d6f202ec534aee64.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d6f2:2ec:534a:ee64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-437969fd36dsm3590815f8f.0.2026.02.13.00.10.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:10:20 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 03/19] openssl: upgrade 3.5.4 -> 3.5.5
Date: Fri, 13 Feb 2026 09:08:21 +0100
Message-ID: <a4b722dc0e5c07c393f5d44cc6f62b7560de25f2.1770968514.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770968514.git.yoann.congal@smile.fr>
References: <cover.1770968514.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 08:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231085

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 66ee1660399859e02b374fc6b36745915f328e4f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ke-history-reporting-when-test-fails.patch | 23 +++++++++----------
 .../0001-extend-check_cwm-test-timeout.patch  |  2 +-
 .../{openssl_3.5.4.bb => openssl_3.5.5.bb}    |  2 +-
 3 files changed, 13 insertions(+), 14 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.4.bb => openssl_3.5.5.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
index 5b7365a3531..a74c79303f6 100644
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
index d02d42f1b51..f6eb28069ac 100644
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
index e760baf3a02..c0d02b617ba 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "967311f84955316969bdb1d8d4b983718ef42338639c621ec4c34fddef355e99"
+SRC_URI[sha256sum] = "b28c91532a8b65a1f983b4c28b7488174e4a01008e29ce8e69bd789f28bc2a89"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

