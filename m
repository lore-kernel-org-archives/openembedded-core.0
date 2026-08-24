Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FF4C5DF9C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 22:21:18 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9392.1787610068324387186
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 15:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=NDcaEj9t;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2026082422210395061830c400020736-uyqlhy@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026082422210395061830c400020736
        for <openembedded-core@lists.openembedded.org>;
        Tue, 25 Aug 2026 00:21:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=gV+7i/mwVPtP9lP4eF4IGbA85/Udll5IzhkLFcileKk=;
 b=NDcaEj9tlpCXqQf0cTIaJwE1xSNXQwUOJDYlaRBdOuwco0aeZl4m8EN0iIM/mY5DmZwRk3
 QcNpPRebHd7Lon64ZReQA9MYzGu5Lshf/tFcEOpX0Ff25wlLbqS6rzsRbdf5I4aii3k7bvQp
 pieYhhtDhweNyel/498xcHg2hJe553CTVmgFpCIt8ggqNg7FshzPYn31Oci6mvrEUM2+fPdY
 6/8GYgq9yAmWuqQ1Oj1FPafQLl0tk+kuc4kW4PX8TYbeOs1DLHSWIXgF3UMYiKMZe9JSeg39
 x7DMVLrYU/v5jr6pixNEe27jOpZDx1+QyE2ZmEyLUmBcu252A1+gdGlA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 2/2] curl: patch CVE-2026-11586
Date: Tue, 25 Aug 2026 00:20:50 +0200
Message-ID: <20260824222050.1754160-2-peter.marko@siemens.com>
In-Reply-To: <20260824222050.1754160-1-peter.marko@siemens.com>
References: <20260824222050.1754160-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 22:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244154

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].
Resolve fuzz caused by having additional tests in new version.

[1] https://curl.se/docs/CVE-2026-11586.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../curl/curl/CVE-2026-11586.patch            | 203 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 204 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11586.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-11586.patch b/meta/recipes-support/curl/curl/CVE-2026-11586.patch
new file mode 100644
index 0000000000..3444166b32
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-11586.patch
@@ -0,0 +1,203 @@
+From 849317ff5c5a5e13f50ec3d001e46ddffa77d8a4 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Mon, 8 Jun 2026 16:57:01 +0200
+Subject: [PATCH] ws: make pong sending lazy
+
+Do not send PONG frames unless there is sufficient space left in the
+websocket send buffer. A server might be lazy in reading our data and
+intermediary PONG frames can be skipped by a client (RFC 6455, ch.
+5.5.3).
+
+Add test case measuring no real RSS increase on a server blasting with
+PING frames.
+
+Closes #21911
+
+CVE: CVE-2026-11586
+Upstream-Status: Backport [https://github.com/curl/curl/commit/849317ff5c5a5e13f50ec3d001e46ddffa77d8a4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/ws.c                         | 33 +++++++++-----
+ tests/http/test_20_websockets.py | 78 ++++++++++++++++++++++++++++++++
+ 2 files changed, 99 insertions(+), 12 deletions(-)
+
+diff --git a/lib/ws.c b/lib/ws.c
+index d7840f1ffb..d00891b83f 100644
+--- a/lib/ws.c
++++ b/lib/ws.c
+@@ -632,6 +632,7 @@ static CURLcode ws_enc_add_cntrl(struct Curl_easy *data,
+                                  size_t plen,
+                                  unsigned int frame_type)
+ {
++  (void)data;
+   DEBUGASSERT(plen <= WS_MAX_CNTRL_LEN);
+   if(plen > WS_MAX_CNTRL_LEN)
+     return CURLE_BAD_FUNCTION_ARGUMENT;
+@@ -641,13 +642,6 @@ static CURLcode ws_enc_add_cntrl(struct Curl_easy *data,
+   ws->pending.type = frame_type;
+   ws->pending.payload_len = plen;
+   memcpy(ws->pending.payload, payload, plen);
+-
+-  if(!ws->enc.payload_remain) { /* not in the middle of another frame */
+-    CURLcode result = ws_enc_add_pending(data, ws);
+-    if(!result)
+-      (void)ws_flush(data, ws, Curl_is_in_callback(data));
+-    return result;
+-  }
+   return CURLE_OK;
+ }
+ 
+@@ -716,7 +710,7 @@ static CURLcode ws_cw_write(struct Curl_easy *data,
+ {
+   struct ws_cw_ctx *ctx = writer->ctx;
+   struct websocket *ws;
+-  CURLcode result;
++  CURLcode result = CURLE_OK;
+ 
+   CURL_TRC_WRITE(data, "ws_cw_write(len=%zu, type=%d)", nbytes, type);
+   if(!(type & CLIENTWRITE_BODY) || data->set.ws_raw_mode)
+@@ -749,7 +743,8 @@ static CURLcode ws_cw_write(struct Curl_easy *data,
+     if(result == CURLE_AGAIN) {
+       /* insufficient amount of data, keep it for later.
+        * we pretend to have written all since we have a copy */
+-      return CURLE_OK;
++      result = CURLE_OK;
++      goto out;
+     }
+     else if(result) {
+       failf(data, "[WS] decode payload error %d", (int)result);
+@@ -760,10 +755,16 @@ static CURLcode ws_cw_write(struct Curl_easy *data,
+   if((type & CLIENTWRITE_EOS) && !Curl_bufq_is_empty(&ctx->buf)) {
+     failf(data, "[WS] decode ending with %zd frame bytes remaining",
+           Curl_bufq_len(&ctx->buf));
+-    return CURLE_RECV_ERROR;
++    result = CURLE_RECV_ERROR;
+   }
+ 
+-  return CURLE_OK;
++out:
++  if(!result) {
++    result = ws_flush(data, ws, Curl_is_in_callback(data));
++    if(result == CURLE_AGAIN)
++      result = CURLE_OK;
++  }
++  return result;
+ }
+ 
+ /* WebSocket payload decoding client writer. */
+@@ -1627,8 +1628,16 @@ CURLcode curl_ws_recv(CURL *d, void *buffer,
+ static CURLcode ws_flush(struct Curl_easy *data, struct websocket *ws,
+                          bool blocking)
+ {
++  CURLcode result;
++
++  /* If there is space, add any pending control frame */
++  if(Curl_bufq_len(&ws->sendbuf) < ws->sendbuf.chunk_size) {
++    result = ws_enc_add_pending(data, ws);
++    if(result && (result != CURLE_AGAIN))
++      return result;
++  }
++
+   if(!Curl_bufq_is_empty(&ws->sendbuf)) {
+-    CURLcode result;
+     const uint8_t *out;
+     size_t outlen, n;
+ #ifdef DEBUGBUILD
+diff --git a/tests/http/test_20_websockets.py b/tests/http/test_20_websockets.py
+index 3a55d41b2b..00fc394a3b 100644
+--- a/tests/http/test_20_websockets.py
++++ b/tests/http/test_20_websockets.py
+@@ -24,11 +24,15 @@
+ #
+ ###########################################################################
+ #
++import base64
++import hashlib
+ import logging
+ import os
++import re
+ import shutil
+ import socket
+ import subprocess
++import threading
+ import time
+ from datetime import datetime, timedelta
+ from typing import Dict
+@@ -207,3 +211,77 @@ class TestWebsockets:
+         large = 0
+         r = client.run(args=[f'-{model}', '-c', str(count), '-m', str(large), url])
+         r.check_exit_code(0)
++
++    def test_20_11_crazy_pings(self, env: Env):
++        st = {}
++        send_rounds = 1
++
++        def srv():
++            try:
++                with socket.socket() as s:
++                    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
++                    s.bind(("127.0.0.1", 0))
++                    s.listen(1)
++                    st["p"] = s.getsockname()[1]
++
++                    c, _ = s.accept()
++                    c.setsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF, 4096)
++                    c.settimeout(Env.SERVER_TIMEOUT)
++                    req = b""
++                    while b"\r\n\r\n" not in req:
++                        req += c.recv(4096)
++
++                    k = re.search(rb"(?im)^Sec-WebSocket-Key:\s*(\S+)", req).group(1)
++                    a = base64.b64encode(
++                        hashlib.sha1(k + b"258EAFA5-E914-47DA-95CA-C5AB0DC85B11").digest()
++                    ).decode()
++                    c.sendall(
++                        (
++                            "HTTP/1.1 101 Switching Protocols\r\n"
++                            "Upgrade: websocket\r\n"
++                            "Connection: Upgrade\r\n"
++                            f"Sec-WebSocket-Accept: {a}\r\n\r\n"
++                        ).encode()
++                    )
++
++                    f = b"\x89\x00" * 65536  # PING frames, many
++                    try:
++                        for _ in range(send_rounds):
++                            c.sendall(f)
++                        f = b"\x88\x00"  # CLOSE frame
++                        c.sendall(f)
++                    except OSError:
++                        pass
++                    time.sleep(1)
++                    c.close()
++            except OSError as e:
++                st["err"] = e
++
++        curl = CurlClient(env=env)
++        send_rounds = 2
++        threading.Thread(target=srv, daemon=True).start()
++        while "p" not in st and "err" not in st:
++            time.sleep(0.01)
++        assert "err" not in st, f'ws-ping server failed to start: {st["err"]}'
++
++        url = f'ws://127.0.0.1:{st["p"]}/'
++        r = curl.http_download(urls=[url], alpn_proto='http/1.1', with_stats=True,
++                               with_profile=True)
++        assert r.exit_code in [55, 56], f'{r.dump_logs()}'  # SEND/RECV_ERROR
++        assert r.profile, f'{r}'
++        rss1 = r.profile.stats['rss'] / (1024 * 1024)
++
++        st.clear()
++        send_rounds = 10
++        threading.Thread(target=srv, daemon=True).start()
++        while "p" not in st and "err" not in st:
++            time.sleep(0.01)
++        assert "err" not in st, f'ws-ping server failed to start: {st["err"]}'
++
++        url = f'ws://127.0.0.1:{st["p"]}/'
++        r = curl.http_download(urls=[url], alpn_proto='http/1.1', with_stats=True,
++                               with_profile=True)
++        assert r.exit_code in [55, 56], f'{r.dump_logs()}'  # SEND/RECV_ERROR
++        assert r.profile, f'{r}'
++        rss2 = r.profile.stats['rss'] / (1024 * 1024)
++        assert (rss1 * 1.1) >= rss2, 'bad memory increase'
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index cf1d65c3a3..bca7f35d06 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -24,6 +24,7 @@ SRC_URI = " \
     file://CVE-2026-7168.patch \
     file://CVE-2026-4873.patch \
     file://CVE-2026-11352.patch \
+    file://CVE-2026-11586.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

