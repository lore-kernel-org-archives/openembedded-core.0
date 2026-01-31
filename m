Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F5AD79759
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:57:16 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5115.1769846232125142428
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3WebLKHV;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48069a48629so29093535e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 23:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846230; x=1770451030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6IJ69mVhfVWjztas+9P69KN4H/Aar0+yT/0I1IVFB2A=;
        b=3WebLKHV22f8Po284fQ7pEWYtXnLOawROY/kMV/7b09aZXXKuUtPi/TZMA5FKaI4+I
         Ewe6wZaevBxLnFQydtYbJv8V2AMTBmqTWzGwBuiiogeHSxxOQrkWQJbeVQFRxVwY2QQi
         Ncpcqi8POiQ8xwsvQ1m0zpUwv09ZY+o2leoPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846230; x=1770451030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6IJ69mVhfVWjztas+9P69KN4H/Aar0+yT/0I1IVFB2A=;
        b=I+38ecybb22JN3mC7ZmfeuxJ0TMeamlAeiB8abH0W7IxpaktAWa/aIkz6R79HASzou
         m3QoLzNDvs4SGEebgMdn5LLJH6TNo7V1Caw0uesKrSnFkzOZ1DvPVkCo3QJVPTkqoB52
         56wN+0mrxl8dz+YjhrB9VEAzhDkiEBdbPWobAvU7ElnDojYTLAIULmaEpo+rwFa0hj3v
         UgUmPxT/VUxSBB/90KVj+vyELpXMgxWdB6Q5V0zy7lHQ7ed9pUwthgOPGCVad16Uehyj
         AKp4lfXANeYoAgJZenDnczZVzmilQTgTfcB+e2OhPulIgEWK6ZgZYyKuUNWd2l24O3Jy
         eWrw==
X-Gm-Message-State: AOJu0YwfWvB5pk+zpIjCziLUTGZgIQyCgdP6GLAZW4etLCxLZX0kMOo6
	ahimL4I9XgchRGfwHgBS3Ijnt3KyfSTM665Wog5p0YMLyBvnLbPTtyMKIMtzADc46VSMV4XMCym
	HN1JZMgs=
X-Gm-Gg: AZuq6aIafzVqGSnoK7dtccDPR9u8m0kmrdxyVWj3/Y9Bpp3In6I85Ew4GgiVynT67n/
	M2TJn1mR0EPQXWuHqSWB6Sd9DBcwsGMbH6fUPPt5p+tj47buFlIbfhlptLvara1q/tEvJaD9SRs
	miF7PnWeoVdZ+mdw6J5USuPJEUUA60KuM/RzX4rdlGeDW8vnBjmC2yeFDQc4JO6lYeaIaIvrHTH
	rQO2toruTVFLvoRdDl1N1bd8dfTHUblO4yt7Wz37UyMMoTqTe9s1uL9DOAIUvqR/wyqJxJHxg1n
	JfeObw5vSlauu90u8RMjtVPvyjmPuT9auiF033q7nXO3ijFBdIwX50OFtTwEql6PjHv0t0YFi8k
	6snqzSzD+7tJHWdOYIhG9CemdvNvyWi06AM2J3Xbqv5K3cj50JsjNyhTYZE0ocrOgkWEWOHm4l6
	zt6/Jf6e3qBlEbcQeo+7fMoLbrZO3iYLLs2cX8gOpzapzEffd7eA/zIoNdqISuH+nRUntgrI2yR
	dMFzhZrpadTQoVF
X-Received: by 2002:a05:600c:4e12:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-482db481c85mr72573765e9.22.1769846230272;
        Fri, 30 Jan 2026 23:57:10 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fa8b238ae1dd6dd8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fa8b:238a:e1dd:6dd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm258621475e9.14.2026.01.30.23.57.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:57:09 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 22/22] openssl: upgrade 3.5.4 -> 3.5.5
Date: Sat, 31 Jan 2026 08:56:33 +0100
Message-ID: <030e8e0e4af2349abeea7c1de02e9062fd8aebbe.1769845858.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769845858.git.yoann.congal@smile.fr>
References: <cover.1769845858.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 07:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230226

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

