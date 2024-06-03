Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6ACC25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 17:28:55 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.198.1717435730992949043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 10:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Acv+EOZs;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f612d7b0f5so29062785ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 10:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1717435730; x=1718040530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zNOdcLpE30jeAUTTdUuJw7wNQl9l1gyV1BCkGQHneXU=;
        b=Acv+EOZsERLbvXl9qdhkShURU3lWzhZ9m0L8Kl6HXlrH6ICqlAepOmKMTYEDQyDUMJ
         oyzajn+7/CGKuF6JS1soU6NVC0V5fo6WFInqFgo3+sCBhEsd01YmbzlByJi+qFo6v7Cm
         KBhaMIAGeITNCdlMCVeKKNaQas1wmYT39a8EM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717435730; x=1718040530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zNOdcLpE30jeAUTTdUuJw7wNQl9l1gyV1BCkGQHneXU=;
        b=DOGr75YUJrFaTxD1dTM1uoYfBlpjT9pMmwze2MfkcTTk7QkxIWkarJf+yAByY5Jiyg
         RhMGJMlsoXFbPTbq39EQskQkyj/2Pg6cr9EXqlj7vJpjc/Txa5rh8Wx2EKb/XcP8cD3K
         GvT3gzwGwF17kXqU7aoK5Lz1O82s3wgQTSMi563ioIV4DPnWNZuHaMgCH8QS5t+1V7Z5
         wPL3WUbBC9677cFcyNtVP/p0U6R5Dnc0YR6zfPiBna8cBpSiE78lEeMHoviNPwP/+6Ax
         cHsNCPqiVmTWSu9+S9rMgPEzEpcXQcfgrOBd/1BHVInPjPKlzIYlfFMDyDh+mo6hy5Xh
         Q9Vg==
X-Gm-Message-State: AOJu0Yz9674LTE4e0ES8LTK9VbBdEm30QZi7hihLo9JUXk0K5V9ta0jc
	YSg7v3G7oud93/Cvp/RyDg8hcim3bXAUABVesrmZq6CTAGRWSbLuPAOJQhzXp++RuTdC79ryJVp
	k
X-Google-Smtp-Source: AGHT+IHndDUU7NjsSTm8vbBNIgClITqlkDS8ma1G7PZ76yUkFyaiCIOrxTgjeVMxqXJ+8gIdqHQm1w==
X-Received: by 2002:a17:902:e74d:b0:1f6:83d1:a232 with SMTP id d9443c01a7336-1f6937b3bebmr4306135ad.10.1717435729721;
        Mon, 03 Jun 2024 10:28:49 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([49.34.100.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323dfe3bsm69289445ad.135.2024.06.03.10.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 10:28:49 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCHv2] openssl: Security fix for CVE-2024-4741
Date: Mon,  3 Jun 2024 22:58:13 +0530
Message-Id: <20240603172813.320248-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 17:28:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200273

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/c88c3de51020c37e8706bf7a682a162593053aac, https://github.com/openssl/openssl/commit/10171e5b511b700c5ecd4fd3e1086b19c34b1ae3, https://github.com/openssl/openssl/commit/ec87bc54c8ccc13caa29bc7f74ae84d78ffa1f5e, https://github.com/openssl/openssl/commit/d0f5a122ba271c9c848e16970249f61b3fc11b2b, https://github.com/openssl/openssl/commit/d03e6fdf54ea41fb35e0499134eb3a7f831eeeeb]

CVE's Fixed:
CVE-2024-4741:Use After Free with SSL_free_buffers

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../openssl/openssl/CVE-2024-4741_1.patch     |  43 ++++
 .../openssl/openssl/CVE-2024-4741_2.patch     |  52 +++++
 .../openssl/openssl/CVE-2024-4741_3.patch     | 137 ++++++++++++
 .../openssl/openssl/CVE-2024-4741_4.patch     | 124 +++++++++++
 .../openssl/openssl/CVE-2024-4741_5.patch     | 205 ++++++++++++++++++
 .../openssl/openssl_3.2.1.bb                  |   5 +
 6 files changed, 566 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_1.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_2.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_3.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_4.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_5.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_1.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_1.patch
new file mode 100644
index 0000000000..6987220c35
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_1.patch
@@ -0,0 +1,43 @@
+From fe3eeaab1b2b5c9f9240a5ebafa5057a3211c3d0 Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Tue, 23 Apr 2024 16:34:46 +0100
+Subject: [PATCH 1/5] Only free the read buffers if we're not using them
+
+If we're part way through processing a record, or the application has
+not released all the records then we should not free our buffer because
+they are still needed.
+
+CVE-2024-4741
+
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+Reviewed-by: Neil Horman <nhorman@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/24395)
+
+(cherry picked from commit 38690cab18de88198f46478565fab423cf534efa)
+
+Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/c88c3de51020c37e8706bf7a682a162593053aac]
+CVE: CVE-2024-4741
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ ssl/record/methods/tls_common.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/ssl/record/methods/tls_common.c b/ssl/record/methods/tls_common.c
+index 08e519a..f46da0f 100644
+--- a/ssl/record/methods/tls_common.c
++++ b/ssl/record/methods/tls_common.c
+@@ -2129,7 +2129,10 @@ int tls_free_buffers(OSSL_RECORD_LAYER *rl)
+     /* Read direction */
+ 
+     /* If we have pending data to be read then fail */
+-    if (rl->curr_rec < rl->num_recs || TLS_BUFFER_get_left(&rl->rbuf) != 0)
++    if (rl->curr_rec < rl->num_recs
++            || rl->curr_rec != rl->num_released
++            || TLS_BUFFER_get_left(&rl->rbuf) != 0
++            || rl->rstate == SSL_ST_READ_BODY)
+         return 0;
+ 
+     return tls_release_read_buffer(rl);
+-- 
+2.44.0
+
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_2.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_2.patch
new file mode 100644
index 0000000000..6d455264ff
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_2.patch
@@ -0,0 +1,52 @@
+From af2a2a9b4a6504891de7225ad12dba799cc2f1d3 Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Tue, 23 Apr 2024 16:36:11 +0100
+Subject: [PATCH 2/5] Set rl->packet to NULL after we've finished using it
+
+In order to ensure we do not have a UAF we reset the rl->packet pointer
+to NULL after we free it.
+
+Follow on from CVE-2024-4741
+
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+Reviewed-by: Neil Horman <nhorman@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/24395)
+
+(cherry picked from commit bfb8128190632092b3a66465838b87b469455cec)
+
+Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/10171e5b511b700c5ecd4fd3e1086b19c34b1ae3]
+CVE: CVE-2024-4741
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ ssl/record/methods/tls_common.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/ssl/record/methods/tls_common.c b/ssl/record/methods/tls_common.c
+index f46da0f..4cc432e 100644
+--- a/ssl/record/methods/tls_common.c
++++ b/ssl/record/methods/tls_common.c
+@@ -283,6 +283,8 @@ static int tls_release_read_buffer(OSSL_RECORD_LAYER *rl)
+         OPENSSL_cleanse(b->buf, b->len);
+     OPENSSL_free(b->buf);
+     b->buf = NULL;
++    rl->packet = NULL;
++    rl->packet_length = 0;
+     return 1;
+ }
+ 
+@@ -325,6 +327,12 @@ int tls_default_read_n(OSSL_RECORD_LAYER *rl, size_t n, size_t max, int extend,
+         /* ... now we can act as if 'extend' was set */
+     }
+ 
++    if (!ossl_assert(rl->packet != NULL)) {
++        /* does not happen */
++        RLAYERfatal(rl, SSL_AD_INTERNAL_ERROR, ERR_R_INTERNAL_ERROR);
++        return OSSL_RECORD_RETURN_FATAL;
++    }
++
+     len = rl->packet_length;
+     pkt = rb->buf + align;
+     /*
+-- 
+2.44.0
+
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_3.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_3.patch
new file mode 100644
index 0000000000..7e79da8890
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_3.patch
@@ -0,0 +1,137 @@
+From 59874acf3ce063157851b9ec89298f036a4228c1 Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Thu, 25 Apr 2024 09:34:16 +0100
+Subject: [PATCH 3/5] Extend the SSL_free_buffers testing
+
+Test that attempting to free the buffers at points where they should not
+be freed works as expected.
+
+Follow on from CVE-2024-4741
+
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+Reviewed-by: Neil Horman <nhorman@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/24395)
+
+(cherry picked from commit 566f3069169b9fab4fbb23da98c3c91730dd5209)
+
+Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/ec87bc54c8ccc13caa29bc7f74ae84d78ffa1f5e]
+CVE: CVE-2024-4741
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ test/sslbuffertest.c | 93 ++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 93 insertions(+)
+
+diff --git a/test/sslbuffertest.c b/test/sslbuffertest.c
+index 94229d5..93cfc44 100644
+--- a/test/sslbuffertest.c
++++ b/test/sslbuffertest.c
+@@ -175,6 +175,98 @@ static int test_func(int test)
+     return result;
+ }
+ 
++/*
++ * Test that attempting to free the buffers at points where they cannot be freed
++ * works as expected
++ * Test 0: Attempt to free buffers after a full record has been processed, but
++ *         the application has only performed a partial read
++ * Test 1: Attempt to free buffers after only a partial record header has been
++ *         received
++ * Test 2: Attempt to free buffers after a full record header but no record body
++ * Test 3: Attempt to free buffers after a full record hedaer and partial record
++ *         body
++ */
++static int test_free_buffers(int test)
++{
++    int result = 0;
++    SSL *serverssl = NULL, *clientssl = NULL;
++    const char testdata[] = "Test data";
++    char buf[40];
++    size_t written, readbytes;
++
++    if (!TEST_true(create_ssl_objects(serverctx, clientctx, &serverssl,
++                                      &clientssl, NULL, NULL)))
++        goto end;
++
++    if (!TEST_true(create_ssl_connection(serverssl, clientssl,
++                                         SSL_ERROR_NONE)))
++        goto end;
++
++
++    if (!TEST_true(SSL_write_ex(clientssl, testdata, sizeof(testdata),
++                                &written)))
++        goto end;
++
++    if (test == 0) {
++        /*
++        * Deliberately only read the first byte - so the remaining bytes are
++        * still buffered
++        */
++        if (!TEST_true(SSL_read_ex(serverssl, buf, 1, &readbytes)))
++            goto end;
++    } else {
++        BIO *tmp;
++        size_t partial_len;
++
++        /* Remove all the data that is pending for read by the server */
++        tmp = SSL_get_rbio(serverssl);
++        if (!TEST_true(BIO_read_ex(tmp, buf, sizeof(buf), &readbytes))
++                || !TEST_size_t_lt(readbytes, sizeof(buf))
++                || !TEST_size_t_gt(readbytes, SSL3_RT_HEADER_LENGTH))
++            goto end;
++
++        switch(test) {
++        case 1:
++            partial_len = SSL3_RT_HEADER_LENGTH - 1;
++            break;
++        case 2:
++            partial_len = SSL3_RT_HEADER_LENGTH;
++            break;
++        case 3:
++            partial_len = readbytes - 1;
++            break;
++        default:
++            TEST_error("Invalid test index");
++            goto end;
++        }
++
++        /* Put back just the partial record */
++        if (!TEST_true(BIO_write_ex(tmp, buf, partial_len, &written)))
++            goto end;
++
++        /*
++         * Attempt a read. This should fail because only a partial record is
++         * available.
++         */
++        if (!TEST_false(SSL_read_ex(serverssl, buf, 1, &readbytes)))
++            goto end;
++    }
++
++    /*
++     * Attempting to free the buffers at this point should fail because they are
++     * still in use
++     */
++    if (!TEST_false(SSL_free_buffers(serverssl)))
++        goto end;
++
++    result = 1;
++ end:
++    SSL_free(clientssl);
++    SSL_free(serverssl);
++
++    return result;
++}
++
+ OPT_TEST_DECLARE_USAGE("certfile privkeyfile\n")
+ 
+ int setup_tests(void)
+@@ -198,6 +290,7 @@ int setup_tests(void)
+     }
+ 
+     ADD_ALL_TESTS(test_func, 9);
++    ADD_ALL_TESTS(test_free_buffers, 4);
+     return 1;
+ }
+ 
+-- 
+2.44.0
+
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_4.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_4.patch
new file mode 100644
index 0000000000..e28cd1fb9c
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_4.patch
@@ -0,0 +1,124 @@
+From 48f0b411ca42ea43ae9ea4ed9cd6e0459fd8a7e2 Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Fri, 26 Apr 2024 11:05:52 +0100
+Subject: [PATCH 4/5] Move the ability to load the dasync engine into
+ ssltestlib.c
+
+The sslapitest has a helper function to load the dasync engine which is
+useful for testing pipelining. We would like to have the same facility
+from sslbuffertest, so we move the function to the common location
+ssltestlib.c
+
+Follow on from CVE-2024-4741
+
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+Reviewed-by: Neil Horman <nhorman@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/24395)
+
+(cherry picked from commit 05752478df623a9ddf849f897b630c1e0728cb7c)
+
+Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/d0f5a122ba271c9c848e16970249f61b3fc11b2b]
+CVE: CVE-2024-4741
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ test/helpers/ssltestlib.c | 33 +++++++++++++++++++++++++++++++++
+ test/helpers/ssltestlib.h |  2 ++
+ test/sslapitest.c         | 21 ---------------------
+ 3 files changed, 35 insertions(+), 21 deletions(-)
+
+diff --git a/test/helpers/ssltestlib.c b/test/helpers/ssltestlib.c
+index 906aed4..b2ebed5 100644
+--- a/test/helpers/ssltestlib.c
++++ b/test/helpers/ssltestlib.c
+@@ -7,8 +7,17 @@
+  * https://www.openssl.org/source/license.html
+  */
+ 
++/*
++ * We need access to the deprecated low level ENGINE APIs for legacy purposes
++ * when the deprecated calls are not hidden
++ */
++#ifndef OPENSSL_NO_DEPRECATED_3_0
++# define OPENSSL_SUPPRESS_DEPRECATED
++#endif
++
+ #include <string.h>
+ 
++#include <openssl/engine.h>
+ #include "internal/e_os.h"
+ #include "internal/nelem.h"
+ #include "ssltestlib.h"
+@@ -1451,3 +1460,27 @@ int ssl_ctx_add_large_cert_chain(OSSL_LIB_CTX *libctx, SSL_CTX *sctx,
+     X509_free(chaincert);
+     return ret;
+ }
++
++ENGINE *load_dasync(void)
++{
++#if !defined(OPENSSL_NO_TLS1_2) && !defined(OPENSSL_NO_DYNAMIC_ENGINE)
++    ENGINE *e;
++
++    if (!TEST_ptr(e = ENGINE_by_id("dasync")))
++        return NULL;
++
++    if (!TEST_true(ENGINE_init(e))) {
++        ENGINE_free(e);
++        return NULL;
++    }
++
++    if (!TEST_true(ENGINE_register_ciphers(e))) {
++        ENGINE_free(e);
++        return NULL;
++    }
++
++    return e;
++#else
++    return NULL;
++#endif
++}
+diff --git a/test/helpers/ssltestlib.h b/test/helpers/ssltestlib.h
+index 871f9bd..bb73b58 100644
+--- a/test/helpers/ssltestlib.h
++++ b/test/helpers/ssltestlib.h
+@@ -81,4 +81,6 @@ SSL_SESSION *create_a_psk(SSL *ssl, size_t mdsize);
+ int ssl_ctx_add_large_cert_chain(OSSL_LIB_CTX *libctx, SSL_CTX *sctx,
+                                  const char *cert_file);
+ 
++ENGINE *load_dasync(void);
++
+ #endif /* OSSL_TEST_SSLTESTLIB_H */
+diff --git a/test/sslapitest.c b/test/sslapitest.c
+index a95f563..abda61d 100644
+--- a/test/sslapitest.c
++++ b/test/sslapitest.c
+@@ -10621,27 +10621,6 @@ end:
+ #endif /* OSSL_NO_USABLE_TLS1_3 */
+ 
+ #if !defined(OPENSSL_NO_TLS1_2) && !defined(OPENSSL_NO_DYNAMIC_ENGINE)
+-
+-static ENGINE *load_dasync(void)
+-{
+-    ENGINE *e;
+-
+-    if (!TEST_ptr(e = ENGINE_by_id("dasync")))
+-        return NULL;
+-
+-    if (!TEST_true(ENGINE_init(e))) {
+-        ENGINE_free(e);
+-        return NULL;
+-    }
+-
+-    if (!TEST_true(ENGINE_register_ciphers(e))) {
+-        ENGINE_free(e);
+-        return NULL;
+-    }
+-
+-    return e;
+-}
+-
+ /*
+  * Test TLSv1.2 with a pipeline capable cipher. TLSv1.3 and DTLS do not
+  * support this yet. The only pipeline capable cipher that we have is in the
+-- 
+2.44.0
+
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_5.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_5.patch
new file mode 100644
index 0000000000..00e7c3add0
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_5.patch
@@ -0,0 +1,205 @@
+From 76624e3e95f77849e524d40e22063a51163ff58e Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Fri, 26 Apr 2024 13:58:29 +0100
+Subject: [PATCH 5/5] Further extend the SSL_free_buffers testing
+
+We extend the testing to test what happens when pipelining is in use.
+
+Follow on from CVE-2024-4741
+
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+Reviewed-by: Neil Horman <nhorman@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/24395)
+
+(cherry picked from commit c1bd38a003fa19fd0d8ade85e1bbc20d8ae59dab)
+
+Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/d03e6fdf54ea41fb35e0499134eb3a7f831eeeeb]
+CVE: CVE-2024-4741
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ test/sslbuffertest.c | 113 +++++++++++++++++++++++++++++++++++++------
+ 1 file changed, 97 insertions(+), 16 deletions(-)
+
+diff --git a/test/sslbuffertest.c b/test/sslbuffertest.c
+index 93cfc44..ee58574 100644
+--- a/test/sslbuffertest.c
++++ b/test/sslbuffertest.c
+@@ -8,10 +8,19 @@
+  * or in the file LICENSE in the source distribution.
+  */
+ 
++/*
++ * We need access to the deprecated low level Engine APIs for legacy purposes
++ * when the deprecated calls are not hidden
++ */
++#ifndef OPENSSL_NO_DEPRECATED_3_0
++# define OPENSSL_SUPPRESS_DEPRECATED
++#endif
++
+ #include <string.h>
+ #include <openssl/ssl.h>
+ #include <openssl/bio.h>
+ #include <openssl/err.h>
++#include <openssl/engine.h>
+ 
+ /* We include internal headers so we can check if the buffers are allocated */
+ #include "../ssl/ssl_local.h"
+@@ -185,34 +194,65 @@ static int test_func(int test)
+  * Test 2: Attempt to free buffers after a full record header but no record body
+  * Test 3: Attempt to free buffers after a full record hedaer and partial record
+  *         body
++ * Test 4-7: We repeat tests 0-3 but including data from a second pipelined
++ *           record
+  */
+ static int test_free_buffers(int test)
+ {
+     int result = 0;
+     SSL *serverssl = NULL, *clientssl = NULL;
+     const char testdata[] = "Test data";
+-    char buf[40];
++    char buf[120];
+     size_t written, readbytes;
++    int i, pipeline = test > 3;
++    ENGINE *e = NULL;
++
++    if (pipeline) {
++        e = load_dasync();
++        if (e == NULL)
++            goto end;
++        test -= 4;
++    }
+ 
+     if (!TEST_true(create_ssl_objects(serverctx, clientctx, &serverssl,
+                                       &clientssl, NULL, NULL)))
+         goto end;
+ 
++    if (pipeline) {
++        if (!TEST_true(SSL_set_cipher_list(serverssl, "AES128-SHA"))
++                || !TEST_true(SSL_set_max_proto_version(serverssl,
++                                                        TLS1_2_VERSION))
++                || !TEST_true(SSL_set_max_pipelines(serverssl, 2)))
++            goto end;
++    }
++
+     if (!TEST_true(create_ssl_connection(serverssl, clientssl,
+                                          SSL_ERROR_NONE)))
+         goto end;
+ 
+-
+-    if (!TEST_true(SSL_write_ex(clientssl, testdata, sizeof(testdata),
+-                                &written)))
+-        goto end;
++    /*
++     * For the non-pipeline case we write one record. For pipelining we write
++     * two records.
++     */
++    for (i = 0; i <= pipeline; i++) {
++        if (!TEST_true(SSL_write_ex(clientssl, testdata, strlen(testdata),
++                                    &written)))
++            goto end;
++    }
+ 
+     if (test == 0) {
++        size_t readlen = 1;
++
+         /*
+-        * Deliberately only read the first byte - so the remaining bytes are
+-        * still buffered
+-        */
+-        if (!TEST_true(SSL_read_ex(serverssl, buf, 1, &readbytes)))
++         * Deliberately only read the first byte - so the remaining bytes are
++         * still buffered. In the pipelining case we read as far as the first
++         * byte from the second record.
++         */
++        if (pipeline)
++            readlen += strlen(testdata);
++
++        if (!TEST_true(SSL_read_ex(serverssl, buf, readlen, &readbytes))
++                || !TEST_size_t_eq(readlen, readbytes))
+             goto end;
+     } else {
+         BIO *tmp;
+@@ -240,16 +280,47 @@ static int test_free_buffers(int test)
+             goto end;
+         }
+ 
+-        /* Put back just the partial record */
+-        if (!TEST_true(BIO_write_ex(tmp, buf, partial_len, &written)))
+-            goto end;
++        if (pipeline) {
++            /* We happen to know the first record is 57 bytes long */
++            const size_t first_rec_len = 57;
++
++            if (test != 3)
++                partial_len += first_rec_len;
++
++            /*
++             * Sanity check. If we got the record len right then this should
++             * never fail.
++             */
++            if (!TEST_int_eq(buf[first_rec_len], SSL3_RT_APPLICATION_DATA))
++                goto end;
++        }
+ 
+         /*
+-         * Attempt a read. This should fail because only a partial record is
+-         * available.
++         * Put back just the partial record (plus the whole initial record in
++         * the pipelining case)
+          */
+-        if (!TEST_false(SSL_read_ex(serverssl, buf, 1, &readbytes)))
++        if (!TEST_true(BIO_write_ex(tmp, buf, partial_len, &written)))
+             goto end;
++
++        if (pipeline) {
++            /*
++             * Attempt a read. This should pass but only return data from the
++             * first record. Only a partial record is available for the second
++             * record.
++             */
++            if (!TEST_true(SSL_read_ex(serverssl, buf, sizeof(buf),
++                                        &readbytes))
++                    || !TEST_size_t_eq(readbytes, strlen(testdata)))
++                goto end;
++        } else {
++            /*
++            * Attempt a read. This should fail because only a partial record is
++            * available.
++            */
++            if (!TEST_false(SSL_read_ex(serverssl, buf, sizeof(buf),
++                                        &readbytes)))
++                goto end;
++        }
+     }
+ 
+     /*
+@@ -263,7 +334,13 @@ static int test_free_buffers(int test)
+  end:
+     SSL_free(clientssl);
+     SSL_free(serverssl);
+-
++#ifndef OPENSSL_NO_DYNAMIC_ENGINE
++    if (e != NULL) {
++        ENGINE_unregister_ciphers(e);
++        ENGINE_finish(e);
++        ENGINE_free(e);
++    }
++#endif
+     return result;
+ }
+ 
+@@ -290,7 +367,11 @@ int setup_tests(void)
+     }
+ 
+     ADD_ALL_TESTS(test_func, 9);
++#if !defined(OPENSSL_NO_TLS1_2) && !defined(OPENSSL_NO_DYNAMIC_ENGINE)
++    ADD_ALL_TESTS(test_free_buffers, 8);
++#else
+     ADD_ALL_TESTS(test_free_buffers, 4);
++#endif
+     return 1;
+ }
+ 
+-- 
+2.44.0
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.1.bb b/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
index 9bdf7e1ec6..495f0d7630 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
@@ -15,6 +15,11 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://bti.patch \
            file://CVE-2024-2511.patch \
            file://CVE-2024-4603.patch \
+           file://CVE-2024-4741_1.patch \
+           file://CVE-2024-4741_2.patch \
+           file://CVE-2024-4741_3.patch \
+           file://CVE-2024-4741_4.patch \
+           file://CVE-2024-4741_5.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.34.1


