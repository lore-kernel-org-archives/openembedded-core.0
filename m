Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A001C83F13
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 20:52:44 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.131.1693169564260121243
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 13:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ldbsWdFZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so1458763a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 13:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693169563; x=1693774363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUKfE6OgtA370p8jg1guN77ctirCqxj505kERavdMZA=;
        b=ldbsWdFZvFnoYoHQ7UtBXnXgpbynJJaYA3WZRThFPJFnoEIB4Rq/QaXdhaKt48miLu
         oE8Wq6ry1Yf/h2rU6nQpdLsgLlm81qTDkUqEMliTzKX9IyPgkQ9A8zvsjlt8vyin6dxn
         A0oxrn8tYD5zgGbD69nfIeFRXgAaqcv1gIw2QQdwI6El6tOxwH0oGX+y+EE5B5ceJxhE
         mXA8ctrN98M4DumOsQSkWfPxUeTuCuDaRkRhmJ5FGvOsSPrTBsPZYuM/kt1JiluGfaTa
         HXJnA0UkNgQV6LXMrQnSFcgdBdnKSKKVSz+Z2zxNHTNSoo25mIp0NPVc5oa8u/LJLx3r
         gtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693169563; x=1693774363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUKfE6OgtA370p8jg1guN77ctirCqxj505kERavdMZA=;
        b=iYLiH0OrxLxyg0tDec5Clo8a64468sOPI7c/oH/pupnrWhXh8O6+eI0bi2ivM2Gm7f
         h+hMBX3qVGhkCFvWfyPBi+G2cl7YwC3bcyCJ3W4QMACX/RkAqw7OqPnqRHOPdS+ZnoTs
         5Rkvsz7wtD7yjjNqUdKX6vuwk8EHRCg53Wsq+LCq3U4Y9YiOkBsmMixtNwSmk9xDl4bZ
         eRQ35y/0gr/xi2kRZciGUpHjfPdlXk6OHGdm/5+a9YGV7k/ZpB+Hgp3qNDNXv1/IK3p4
         JVCEPmkpBtcG1ulBhH71VlINfyWWwqdqht0AEA97SLqWvQCVSlzTe06tOpeq+dVQgdGW
         wDFQ==
X-Gm-Message-State: AOJu0YwvIt9nD80hNyORrNoiq5+qxKeSF3e8G+BY2DRqnbyGvI/brI2O
	S+fEAx7C+GgbU2Bt934XWudWUo9vO6AyHnGaT++LEg==
X-Google-Smtp-Source: AGHT+IEzGFqy8D9QxD8ij4uU9MLSJfqIltehQhSejU6NjxiifMFoaeePj6vMQQyyVLqAhNxNADxxNQ==
X-Received: by 2002:a05:6a20:7f86:b0:13a:6bca:7a84 with SMTP id d6-20020a056a207f8600b0013a6bca7a84mr33691201pzj.44.1693169563314;
        Sun, 27 Aug 2023 13:52:43 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id p2-20020a63c142000000b00565dd935938sm1220684pgi.85.2023.08.27.13.52.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 13:52:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/8] nghttp2: fix CVE-2023-35945
Date: Sun, 27 Aug 2023 10:52:25 -1000
Message-Id: <0e6eb0f417079eaf76b003973c9d93338e6363b5.1693169420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693169420.git.steve@sakoman.com>
References: <cover.1693169420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 20:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186800

From: Yogita Urade <yogita.urade@windriver.com>

Envoy is a cloud-native high-performance edge/middle/service
proxy. Envoy’s HTTP/2 codec may leak a header map and
bookkeeping structures upon receiving `RST_STREAM` immediately
followed by the `GOAWAY` frames from an upstream server. In
nghttp2, cleanup of pending requests due to receipt of the
`GOAWAY` frame skips de-allocation of the bookkeeping structure
and pending compressed header. The error return [code path] is
taken if connection is already marked for not sending more
requests due to `GOAWAY` frame. The clean-up code is right after
the return statement, causing memory leak. Denial of service
through memory exhaustion. This vulnerability was patched in
versions(s) 1.26.3, 1.25.8, 1.24.9, 1.23.11.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-35945
https://github.com/envoyproxy/envoy/security/advisories/GHSA-jfxv-29pc-x22r

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../nghttp2/nghttp2/CVE-2023-35945.patch      | 151 ++++++++++++++++++
 .../recipes-support/nghttp2/nghttp2_1.47.0.bb |   1 +
 2 files changed, 152 insertions(+)
 create mode 100644 meta/recipes-support/nghttp2/nghttp2/CVE-2023-35945.patch

diff --git a/meta/recipes-support/nghttp2/nghttp2/CVE-2023-35945.patch b/meta/recipes-support/nghttp2/nghttp2/CVE-2023-35945.patch
new file mode 100644
index 0000000000..e03915fda8
--- /dev/null
+++ b/meta/recipes-support/nghttp2/nghttp2/CVE-2023-35945.patch
@@ -0,0 +1,151 @@
+From ce385d3f55a4b76da976b3bdf71fe2deddf315ba Mon Sep 17 00:00:00 2001
+From: Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
+Date: Thu, 24 Aug 2023 09:34:26 +0000
+Subject: [PATCH] Fix memory leak
+
+This commit fixes memory leak that happens when PUSH_PROMISE or
+HEADERS frame cannot be sent, and nghttp2_on_stream_close_callback
+fails with a fatal error.  For example, if GOAWAY frame has been
+received, a HEADERS frame that opens new stream cannot be sent.
+
+This issue has already been made public via CVE-2023-35945 [1] issued
+by envoyproxy/envoy project.  During embargo period, the patch to fix
+this bug was accidentally submitted to nghttp2/nghttp2 repository [2].
+And they decided to disclose CVE early.  I was notified just 1.5 hours
+before disclosure.  I had no time to respond.
+
+PoC described in [1] is quite simple, but I think it is not enough to
+trigger this bug.  While it is true that receiving GOAWAY prevents a
+client from opening new stream, and nghttp2 enters error handling
+branch, in order to cause the memory leak,
+nghttp2_session_close_stream function must return a fatal error.
+nghttp2 defines 2 fatal error codes:
+
+- NGHTTP2_ERR_NOMEM
+- NGHTTP2_ERR_CALLBACK_FAILURE
+
+NGHTTP2_ERR_NOMEM, as its name suggests, indicates out of memory.  It
+is unlikely that a process gets short of memory with this simple PoC
+scenario unless application does something memory heavy processing.
+
+NGHTTP2_ERR_CALLBACK_FAILURE is returned from application defined
+callback function (nghttp2_on_stream_close_callback, in this case),
+which indicates something fatal happened inside a callback, and a
+connection must be closed immediately without any further action.  As
+nghttp2_on_stream_close_error_callback documentation says, any error
+code other than 0 or NGHTTP2_ERR_CALLBACK_FAILURE is treated as fatal
+error code.  More specifically, it is treated as if
+NGHTTP2_ERR_CALLBACK_FAILURE is returned.  I guess that envoy returns
+NGHTTP2_ERR_CALLBACK_FAILURE or other error code which is translated
+into NGHTTP2_ERR_CALLBACK_FAILURE.
+
+[1] https://github.com/envoyproxy/envoy/security/advisories/GHSA-jfxv-29pc-x22r
+[2] https://github.com/nghttp2/nghttp2/pull/1929
+
+CVE: CVE-2023-35945
+
+Upstream-Status: Backport [https://github.com/nghttp2/nghttp2/commit/ce385d3f55a4b76da976b3bdf71fe2deddf315ba]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/nghttp2_session.c        | 10 +++++-----
+ tests/nghttp2_session_test.c | 34 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 39 insertions(+), 5 deletions(-)
+
+diff --git a/lib/nghttp2_session.c b/lib/nghttp2_session.c
+index 380a47c..2d9285f 100644
+--- a/lib/nghttp2_session.c
++++ b/lib/nghttp2_session.c
+@@ -2940,6 +2940,7 @@ static ssize_t nghttp2_session_mem_send_internal(nghttp2_session *session,
+       if (rv < 0) {
+         int32_t opened_stream_id = 0;
+         uint32_t error_code = NGHTTP2_INTERNAL_ERROR;
++        int rv2 = 0;
+
+         DEBUGF("send: frame preparation failed with %s\n",
+                nghttp2_strerror(rv));
+@@ -2982,19 +2983,18 @@ static ssize_t nghttp2_session_mem_send_internal(nghttp2_session *session,
+         }
+         if (opened_stream_id) {
+           /* careful not to override rv */
+-          int rv2;
+           rv2 = nghttp2_session_close_stream(session, opened_stream_id,
+                                              error_code);
+-
+-          if (nghttp2_is_fatal(rv2)) {
+-            return rv2;
+-          }
+         }
+
+         nghttp2_outbound_item_free(item, mem);
+         nghttp2_mem_free(mem, item);
+         active_outbound_item_reset(aob, mem);
+
++        if (nghttp2_is_fatal(rv2)) {
++          return rv2;
++        }
++
+         if (rv == NGHTTP2_ERR_HEADER_COMP) {
+           /* If header compression error occurred, should terminiate
+              connection. */
+diff --git a/tests/nghttp2_session_test.c b/tests/nghttp2_session_test.c
+index cb6bdf7..c2778bc 100644
+--- a/tests/nghttp2_session_test.c
++++ b/tests/nghttp2_session_test.c
+@@ -584,6 +584,15 @@ static int on_stream_close_callback(nghttp2_session *session, int32_t stream_id,
+   return 0;
+ }
+
++static int fatal_error_on_stream_close_callback(nghttp2_session *session,
++                                                int32_t stream_id,
++                                                uint32_t error_code,
++                                                void *user_data) {
++  on_stream_close_callback(session, stream_id, error_code, user_data);
++
++  return NGHTTP2_ERR_CALLBACK_FAILURE;
++}
++
+ static ssize_t pack_extension_callback(nghttp2_session *session, uint8_t *buf,
+                                        size_t len, const nghttp2_frame *frame,
+                                        void *user_data) {
+@@ -3906,6 +3915,8 @@ void test_nghttp2_session_on_goaway_received(void) {
+   nghttp2_frame frame;
+   int i;
+   nghttp2_mem *mem;
++  const uint8_t *data;
++  ssize_t datalen;
+
+   mem = nghttp2_mem_default();
+   user_data.frame_recv_cb_called = 0;
+@@ -3947,6 +3958,29 @@ void test_nghttp2_session_on_goaway_received(void) {
+
+   nghttp2_frame_goaway_free(&frame.goaway, mem);
+   nghttp2_session_del(session);
++
++  /* Make sure that no memory leak when stream_close callback fails
++     with a fatal error */
++  memset(&callbacks, 0, sizeof(nghttp2_session_callbacks));
++  callbacks.on_stream_close_callback = fatal_error_on_stream_close_callback;
++
++  memset(&user_data, 0, sizeof(user_data));
++
++  nghttp2_session_client_new(&session, &callbacks, &user_data);
++
++  nghttp2_frame_goaway_init(&frame.goaway, 0, NGHTTP2_NO_ERROR, NULL, 0);
++
++  CU_ASSERT(0 == nghttp2_session_on_goaway_received(session, &frame));
++
++  nghttp2_submit_request(session, NULL, reqnv, ARRLEN(reqnv), NULL, NULL);
++
++  datalen = nghttp2_session_mem_send(session, &data);
++
++  CU_ASSERT(NGHTTP2_ERR_CALLBACK_FAILURE == datalen);
++  CU_ASSERT(1 == user_data.stream_close_cb_called);
++
++  nghttp2_frame_goaway_free(&frame.goaway, mem);
++  nghttp2_session_del(session);
+ }
+
+ void test_nghttp2_session_on_window_update_received(void) {
+--
+2.35.5
diff --git a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
index 90d3286ac6..0b9091f7e8 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
@@ -9,6 +9,7 @@ UPSTREAM_CHECK_URI = "https://github.com/nghttp2/nghttp2/releases"
 SRC_URI = "\
     https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
+    file://CVE-2023-35945.patch \
 "
 SRC_URI[sha256sum] = "68271951324554c34501b85190f22f2221056db69f493afc3bbac8e7be21e7cc"
 
-- 
2.34.1


