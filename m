Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA011C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 17:23:45 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.57.1717435424422896624
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 10:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=W8IEHmyl;
 spf=pass (domain: mvista.com, ip: 209.85.210.176, mailfrom: sdoshi@mvista.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70276322ad8so230961b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 10:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1717435423; x=1718040223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lYJuBFMHVwuWUzj0igRQYji+0LMTX7qTo2wrGWiK3/Q=;
        b=W8IEHmylr/iiPtzJGDDfDl9BLSh4Vb4kMgxJ3dxWGr6AUnk7R68uTPsC5yJMAAg/Ha
         jqO9GpVqueOLPN/evY+C5blXsdAHPpzTHfmZiaY2IUUtQFK/5ngpMGjKrPBDgh94kiur
         xk4wfQj4SGL/XyG4KDJzk4vTlu1v1Z3pWhfIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717435423; x=1718040223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lYJuBFMHVwuWUzj0igRQYji+0LMTX7qTo2wrGWiK3/Q=;
        b=gAVc1BZTS4A7v46sFQNqelcFFGNDtSzKS8t5ICqdGsoL/sOdFJJ1isIglmiDridl5c
         Nna5CJc4nkBG47t8rmLKtVmD1d5EWHcejwy5ujMM6SXbKABulqwJDPieiTKwXcb4erfc
         isMCqnchnHwZGzj38ImSIh/+m4TkRWgQQeYtCELObhDAkviKH0TDFa8qNaMnsFgAO0gp
         XHTD7bsPAN0g8LUHW8OarKBHt/s0WgOIP08HzILv1ZyutLzjWbRzKk4cP97rKR4IuGy9
         cM9EEathsfOGQW/rU9qcPQXQh2WOgNXztqrTb4Ouf0Klzcujb31JSUlj/eh3OyYNzPHf
         0+dw==
X-Gm-Message-State: AOJu0YzrN8Bhs8CKv29mHXXk58cVZHeWCPB27o8Zmp5VMKrLpkNwrA4V
	jvOqzv6kQFooJt/njXWlyrvhLgxsdBgd0LjcAa8jon/nccNz0j9vyFy3BECFFu39EPCJi80sXWo
	r
X-Google-Smtp-Source: AGHT+IFuw6dr6c82BHXhgoXO7uYp9uXPOuCWPUcRD6PMqQRepWpc98yYy3Py4cmIu2p+xPxeYCX6MQ==
X-Received: by 2002:a05:6a20:5aa9:b0:1b1:c745:5c66 with SMTP id adf61e73a8af0-1b26f286f07mr8606710637.54.1717435423068;
        Mon, 03 Jun 2024 10:23:43 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([49.34.100.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f667512bf2sm32662355ad.224.2024.06.03.10.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 10:23:42 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][kirkstone][PATCHv2] openssl: Security fix for CVE-2024-4741
Date: Mon,  3 Jun 2024 22:52:15 +0530
Message-Id: <20240603172215.319982-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 17:23:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200272

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/b3f0eb0a295f58f16ba43ba99dad70d4ee5c437d, https://github.com/openssl/openssl/commit/2d05959073c4bf8803401668b9df85931a08e020, https://github.com/openssl/openssl/commit/6fef334f914abfcd988e53a32d19f01d84529f74, https://github.com/openssl/openssl/commit/1359c00e683840154760b7ba9204bad1b13dc074, https://github.com/openssl/openssl/commit/d095674320c84b8ed1250715b1dd5ce05f9f267b]

CVE's Fixed:
CVE-2024-4741:Use After Free with SSL_free_buffers

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../openssl/openssl/CVE-2024-4741_1.patch     |  76 +++++++
 .../openssl/openssl/CVE-2024-4741_2.patch     |  56 +++++
 .../openssl/openssl/CVE-2024-4741_3.patch     | 137 ++++++++++++
 .../openssl/openssl/CVE-2024-4741_4.patch     | 122 +++++++++++
 .../openssl/openssl/CVE-2024-4741_5.patch     | 205 ++++++++++++++++++
 .../openssl/openssl_3.0.13.bb                 |   5 +
 6 files changed, 601 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_1.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_2.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_3.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_4.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_5.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_1.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_1.patch
new file mode 100644
index 0000000000..0753fa222c
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_1.patch
@@ -0,0 +1,76 @@
+From b3f0eb0a295f58f16ba43ba99dad70d4ee5c437d Mon Sep 17 00:00:00 2001
+From: Watson Ladd <watsonbladd@gmail.com>
+Date: Wed, 24 Apr 2024 11:26:56 +0100
+Subject: [PATCH] Only free the read buffers if we're not using them
+
+If we're part way through processing a record, or the application has
+not released all the records then we should not free our buffer because
+they are still needed.
+
+CVE-2024-4741
+
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+Reviewed-by: Neil Horman <nhorman@openssl.org>
+Reviewed-by: Matt Caswell <matt@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/24395)
+
+(cherry picked from commit 704f725b96aa373ee45ecfb23f6abfe8be8d9177)
+
+Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/b3f0eb0a295f58f16ba43ba99dad70d4ee5c437d]
+CVE: CVE-2024-4741
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ ssl/record/rec_layer_s3.c | 9 +++++++++
+ ssl/record/record.h       | 1 +
+ ssl/ssl_lib.c             | 3 +++
+ 3 files changed, 13 insertions(+)
+
+diff --git a/ssl/record/rec_layer_s3.c b/ssl/record/rec_layer_s3.c
+index 4bcffcc..1569997 100644
+--- a/ssl/record/rec_layer_s3.c
++++ b/ssl/record/rec_layer_s3.c
+@@ -81,6 +81,15 @@ int RECORD_LAYER_read_pending(const RECORD_LAYER *rl)
+     return SSL3_BUFFER_get_left(&rl->rbuf) != 0;
+ }
+ 
++int RECORD_LAYER_data_present(const RECORD_LAYER *rl)
++{
++    if (rl->rstate == SSL_ST_READ_BODY)
++        return 1;
++    if (RECORD_LAYER_processed_read_pending(rl))
++        return 1;
++    return 0;
++}
++
+ /* Checks if we have decrypted unread record data pending */
+ int RECORD_LAYER_processed_read_pending(const RECORD_LAYER *rl)
+ {
+diff --git a/ssl/record/record.h b/ssl/record/record.h
+index 234656b..b60f71c 100644
+--- a/ssl/record/record.h
++++ b/ssl/record/record.h
+@@ -205,6 +205,7 @@ void RECORD_LAYER_release(RECORD_LAYER *rl);
+ int RECORD_LAYER_read_pending(const RECORD_LAYER *rl);
+ int RECORD_LAYER_processed_read_pending(const RECORD_LAYER *rl);
+ int RECORD_LAYER_write_pending(const RECORD_LAYER *rl);
++int RECORD_LAYER_data_present(const RECORD_LAYER *rl);
+ void RECORD_LAYER_reset_read_sequence(RECORD_LAYER *rl);
+ void RECORD_LAYER_reset_write_sequence(RECORD_LAYER *rl);
+ int RECORD_LAYER_is_sslv2_record(RECORD_LAYER *rl);
+diff --git a/ssl/ssl_lib.c b/ssl/ssl_lib.c
+index eed649c..d14c55a 100644
+--- a/ssl/ssl_lib.c
++++ b/ssl/ssl_lib.c
+@@ -5492,6 +5492,9 @@ int SSL_free_buffers(SSL *ssl)
+     if (RECORD_LAYER_read_pending(rl) || RECORD_LAYER_write_pending(rl))
+         return 0;
+ 
++    if (RECORD_LAYER_data_present(rl))
++        return 0;
++
+     RECORD_LAYER_release(rl);
+     return 1;
+ }
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_2.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_2.patch
new file mode 100644
index 0000000000..30a74c5ca4
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_2.patch
@@ -0,0 +1,56 @@
+From 2d05959073c4bf8803401668b9df85931a08e020 Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Wed, 24 Apr 2024 11:33:41 +0100
+Subject: [PATCH] Set rlayer.packet to NULL after we've finished using it
+
+In order to ensure we do not have a UAF we reset the rlayer.packet pointer
+to NULL after we free it.
+
+CVE-2024-4741
+
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+Reviewed-by: Neil Horman <nhorman@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/24395)
+
+(cherry picked from commit d146349171101dec3a876c13eb7a6dea32ba62ba)
+
+Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/2d05959073c4bf8803401668b9df85931a08e020]
+CVE: CVE-2024-4741
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ ssl/record/rec_layer_s3.c | 6 ++++++
+ ssl/record/ssl3_buffer.c  | 2 ++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/ssl/record/rec_layer_s3.c b/ssl/record/rec_layer_s3.c
+index 1569997..779e998 100644
+--- a/ssl/record/rec_layer_s3.c
++++ b/ssl/record/rec_layer_s3.c
+@@ -230,6 +230,12 @@ int ssl3_read_n(SSL *s, size_t n, size_t max, int extend, int clearold,
+         /* ... now we can act as if 'extend' was set */
+     }
+ 
++    if (!ossl_assert(s->rlayer.packet != NULL)) {
++        /* does not happen */
++        SSLfatal(s, SSL_AD_INTERNAL_ERROR, ERR_R_INTERNAL_ERROR);
++        return -1;
++    }
++
+     len = s->rlayer.packet_length;
+     pkt = rb->buf + align;
+     /*
+diff --git a/ssl/record/ssl3_buffer.c b/ssl/record/ssl3_buffer.c
+index 97b0c26..1a10a7c 100644
+--- a/ssl/record/ssl3_buffer.c
++++ b/ssl/record/ssl3_buffer.c
+@@ -191,5 +191,7 @@ int ssl3_release_read_buffer(SSL *s)
+         OPENSSL_cleanse(b->buf, b->len);
+     OPENSSL_free(b->buf);
+     b->buf = NULL;
++    s->rlayer.packet = NULL;
++    s->rlayer.packet_length = 0;
+     return 1;
+ }
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_3.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_3.patch
new file mode 100644
index 0000000000..60a6dcbf2a
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_3.patch
@@ -0,0 +1,137 @@
+From 6fef334f914abfcd988e53a32d19f01d84529f74 Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Thu, 25 Apr 2024 09:34:16 +0100
+Subject: [PATCH] Extend the SSL_free_buffers testing
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
+(cherry picked from commit 4238abc17d44383592f92d6254d89dac806ee76b)
+
+Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/6fef334f914abfcd988e53a32d19f01d84529f74]
+CVE: CVE-2024-4741
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ test/sslbuffertest.c | 93 ++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 93 insertions(+)
+
+diff --git a/test/sslbuffertest.c b/test/sslbuffertest.c
+index 3c3e69d..133fdb1 100644
+--- a/test/sslbuffertest.c
++++ b/test/sslbuffertest.c
+@@ -150,6 +150,98 @@ static int test_func(int test)
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
+@@ -173,6 +265,7 @@ int setup_tests(void)
+     }
+ 
+     ADD_ALL_TESTS(test_func, 9);
++    ADD_ALL_TESTS(test_free_buffers, 4);
+     return 1;
+ }
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_4.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_4.patch
new file mode 100644
index 0000000000..26775ecc86
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_4.patch
@@ -0,0 +1,122 @@
+From 0bb8b48c00f69601266db2b67dcec70b2c248632 Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Fri, 26 Apr 2024 11:05:52 +0100
+Subject: [PATCH] Move the ability to load the dasync engine into ssltestlib.c
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
+(cherry picked from commit 0544c21a22f4d787e6f31d35e8f980402ac90a6d)
+
+Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/1359c00e683840154760b7ba9204bad1b13dc074]
+CVE: CVE-2024-4741
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ test/helpers/ssltestlib.c | 33 +++++++++++++++++++++++++++++++++
+ test/helpers/ssltestlib.h |  1 +
+ test/sslapitest.c         | 21 ---------------------
+ 3 files changed, 34 insertions(+), 21 deletions(-)
+
+diff --git a/test/helpers/ssltestlib.c b/test/helpers/ssltestlib.c
+index ef4a617..da14f66 100644
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
+ #include "internal/nelem.h"
+ #include "ssltestlib.h"
+ #include "../testutil.h"
+@@ -1182,3 +1191,27 @@ void shutdown_ssl_connection(SSL *serverssl, SSL *clientssl)
+     SSL_free(serverssl);
+     SSL_free(clientssl);
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
+index 8e9daa5..2777fb3 100644
+--- a/test/helpers/ssltestlib.h
++++ b/test/helpers/ssltestlib.h
+@@ -59,4 +59,5 @@ typedef struct mempacket_st MEMPACKET;
+ 
+ DEFINE_STACK_OF(MEMPACKET)
+ 
++ENGINE *load_dasync(void);
+ #endif /* OSSL_TEST_SSLTESTLIB_H */
+diff --git a/test/sslapitest.c b/test/sslapitest.c
+index e0274f1..f344b07 100644
+--- a/test/sslapitest.c
++++ b/test/sslapitest.c
+@@ -10128,27 +10128,6 @@ end:
+ }
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
+2.35.7
+
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_5.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_5.patch
new file mode 100644
index 0000000000..8d231b4946
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4741_5.patch
@@ -0,0 +1,205 @@
+From d095674320c84b8ed1250715b1dd5ce05f9f267b Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Fri, 26 Apr 2024 13:58:29 +0100
+Subject: [PATCH] Further extend the SSL_free_buffers testing
+
+We extend the testing to test what happens when pipelining is in use.
+
+Follow on from CVE-2024-4741
+
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+Reviewed-by: Neil Horman <nhorman@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/24395)
+
+(cherry picked from commit 6972d5ace1275faf404e7a53e806861962f4121c)
+
+Upstream-Status: Backport from [https://github.com/openssl/openssl/commit/d095674320c84b8ed1250715b1dd5ce05f9f267b]
+CVE: CVE-2024-4741
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ test/sslbuffertest.c | 113 +++++++++++++++++++++++++++++++++++++------
+ 1 file changed, 97 insertions(+), 16 deletions(-)
+
+diff --git a/test/sslbuffertest.c b/test/sslbuffertest.c
+index 133fdb1..7079d04 100644
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
+ #include "internal/packet.h"
+ 
+@@ -160,34 +169,65 @@ static int test_func(int test)
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
+@@ -215,16 +255,47 @@ static int test_free_buffers(int test)
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
+@@ -238,7 +309,13 @@ static int test_free_buffers(int test)
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
+@@ -265,7 +342,11 @@ int setup_tests(void)
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
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb b/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
index 87ab4047d9..d7a71d51f5 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
@@ -14,6 +14,11 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
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


