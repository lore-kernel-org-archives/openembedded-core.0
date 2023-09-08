Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91000EE7FFC
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 13:47:17 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.39462.1694180834050508598
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 06:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1svENcNG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-68a1af910e0so1776766b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 06:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694180833; x=1694785633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EV3RoJZ+Gqe5TGYaboiYtE4WliYfl33LyDU50Iv7rVI=;
        b=1svENcNGmEIMngkdOkTJUBS8os4FEHOOl7XFzABqn1SVfNRP/PxehM64HByGc7Vzt1
         QBoFPaaQdyBU9Vs7u0BnSOWGO+ZxDinD/07pyD4iTxtdvXEUMtB5bhLvBEuIZOhgpWq4
         20F6Puej3kmppu8g7gXVN+GLHrIPwfaXXZ8ICu49HHGWLYnZMNAYasv/wzZuNVn3Pu39
         B+be0zY2EedUtxKa1Nmhkel5lOGswFeYkroOf6IMYhNfOf4nQh2F02aPYuX48wKVe+gE
         J2BB4ucbSSVy1iwlIZz9WEAPV23jAcN8iF25BFbXlnWD9E/4+TgM8+9KA7jywbfMsJIa
         2GWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694180833; x=1694785633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EV3RoJZ+Gqe5TGYaboiYtE4WliYfl33LyDU50Iv7rVI=;
        b=FfmjPOksCRFWkLu4a8plI2Bp6NdNtYXNcuWRXbdHum/RMmG8jHZUGOBG4R6IlAKVA+
         D9i6czRLuYWbfZfxVto73j6KWftST1Xfkrjp25LJZlIqUbuD7TQT4GUNfB3g1YYDd3Hr
         JB6VSdE3ibPn2kt3wD6X/kjT4JIZstpIapJdgBgPeRpRdmDoCg84/LlNkYULZ1gpgNdC
         0jqFsYgTrEVa+hQZ5a5BTloQzi3nxUSQWrKDUXKpyctSwqaGlIf5mqreNW+KWMtEPrEI
         675j0UE1gSioMF0fR52VhgD3T4w1pk3uhHuAm6eGOnDZOaUjTSb7BqaN4qCt3mDXOnxn
         EHdw==
X-Gm-Message-State: AOJu0YxB0EvYpNOn5x8iC/iAdXepNVbRRHs8/iKMXx52IJK9LDGC+PFP
	WzTuO2ryp2lpkE8hmTTqRnLJXzogY0HOnBQlOTA=
X-Google-Smtp-Source: AGHT+IEaBZC1rSSIm/qTYABc+4rb1ASw1fum0rqeeCR4fLbnUl3C7wyb9dfdAsSzK0TGAurLTBP+1g==
X-Received: by 2002:a05:6a20:cea0:b0:135:38b5:7e58 with SMTP id if32-20020a056a20cea000b0013538b57e58mr2609188pzb.37.1694180832906;
        Fri, 08 Sep 2023 06:47:12 -0700 (PDT)
Received: from xps13.. ([65.154.164.134])
        by smtp.gmail.com with ESMTPSA id x18-20020a056a00271200b00653fe2d527esm1344828pfv.32.2023.09.08.06.47.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 06:47:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 2/9] nghttp2: fix CVE-2023-35945
Date: Fri,  8 Sep 2023 03:46:53 -1000
Message-Id: <18277a43f7fd6522a67f194f40595bc378468733.1694179812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694179812.git.steve@sakoman.com>
References: <cover.1694179812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 13:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187424

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
 .../recipes-support/nghttp2/nghttp2_1.52.0.bb |   1 +
 2 files changed, 152 insertions(+)
 create mode 100644 meta/recipes-support/nghttp2/nghttp2/CVE-2023-35945.patch

diff --git a/meta/recipes-support/nghttp2/nghttp2/CVE-2023-35945.patch b/meta/recipes-support/nghttp2/nghttp2/CVE-2023-35945.patch
new file mode 100644
index 0000000000..04d2086e1c
--- /dev/null
+++ b/meta/recipes-support/nghttp2/nghttp2/CVE-2023-35945.patch
@@ -0,0 +1,151 @@
+From ce385d3f55a4b76da976b3bdf71fe2deddf315ba Mon Sep 17 00:00:00 2001
+From: Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
+Date: Mon, 4 Sep 2023 06:48:30 +0000
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
+index 93f3f07..9bb32b2 100644
+--- a/lib/nghttp2_session.c
++++ b/lib/nghttp2_session.c
+@@ -3300,6 +3300,7 @@ static ssize_t nghttp2_session_mem_send_internal(nghttp2_session *session,
+       if (rv < 0) {
+         int32_t opened_stream_id = 0;
+         uint32_t error_code = NGHTTP2_INTERNAL_ERROR;
++        int rv2 = 0;
+
+         DEBUGF("send: frame preparation failed with %s\n",
+                nghttp2_strerror(rv));
+@@ -3342,19 +3343,18 @@ static ssize_t nghttp2_session_mem_send_internal(nghttp2_session *session,
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
+index 08152d4..14ab132 100644
+--- a/tests/nghttp2_session_test.c
++++ b/tests/nghttp2_session_test.c
+@@ -585,6 +585,15 @@ static int on_stream_close_callback(nghttp2_session *session, int32_t stream_id,
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
+@@ -4297,6 +4306,8 @@ void test_nghttp2_session_on_goaway_received(void) {
+   nghttp2_frame frame;
+   int i;
+   nghttp2_mem *mem;
++  const uint8_t *data;
++  ssize_t datalen;
+
+   mem = nghttp2_mem_default();
+   user_data.frame_recv_cb_called = 0;
+@@ -4338,6 +4349,29 @@ void test_nghttp2_session_on_goaway_received(void) {
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
diff --git a/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb
index f57a15954d..0fba554919 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 SRC_URI = "\
     ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
+    file://CVE-2023-35945.patch \
 "
 SRC_URI[sha256sum] = "3ea9f0439e60469ad4d39cb349938684ffb929dd7e8e06a7bffe9f9d21f8ba7d"
 
-- 
2.34.1


