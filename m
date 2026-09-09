Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72983C79FB5
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:23 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6335.1788939019751421307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=l71huKZ9;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4859b45abadso397069f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939018; x=1789543818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XCO7U/bbyHVrGlMGY7Q9Qly6xKr6w0CXDwz9U66ZLUA=;
        b=l71huKZ9MyIp/Z/nDflHo5N6sFJ59JnaL+S1XczDe6BkJsrMZ0jscOr+ukBZUChBMx
         IvYCLDApDWMzNUS6mFP7k7pakIGiZynxm48XK62MiS1ETE/qMBNZpu7zh9UCYbMqyNkW
         5nK0kI4msAXaYBy7cuCTGAJoH/1qt9F0WAvrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939018; x=1789543818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XCO7U/bbyHVrGlMGY7Q9Qly6xKr6w0CXDwz9U66ZLUA=;
        b=oY4Da68wA3oC9w4IG9ZiSXXo8Bx8mAZ6iWnkgR1nqFn4gnekRmYFlqup31vkjFNhee
         RHPV8JsC0Pj5DZ2SrtdE8d08NM1VTqxrJqnLFcYsWxVt16kD27JGfPhh/y0qUNyYJpex
         QfZAaf3X7ARbrmTqv/VwgpPrdehW0RK10txZHjZAkikf1o065HN6UAd/1rGW6iw6YWkN
         2EVcu0rTVeRJYfZk6bIGjDOjLCtDjnmuvZiIs+U3YNPGsiCjcIJzI5bBsYlCZIZmzJYs
         sPpAL+DAiiswzzud7SEB/fHFx6chGhtJ2/dso8icotG7ulKP6iFh2rWCEd1EfB4FRz77
         2wIg==
X-Gm-Message-State: AFuF++lb+4M10dpGR4uFFW4E0NrCQ20gKMggEER3hRC45n++NaEwYXFl
	f831t8kYmJ893nYGZ/8tfzEPJwTdaLlN+BEQqqmc3KhimodjoTXKfYPJlcs9ACUPBBW/d7wAc3c
	vipRh85M=
X-Gm-Gg: AYBFou36qSjRMqquFtHSXUxpd9zpmQW2dZ+K+2yv5nVpburxrYOPp2lkXMo3q0WU4f+
	5qLSQbjjDrjQ7lGs5fOcTR5cTis4cprNdFfhek5PXuGnSCnmBg9eDSPdnn3V0dLjEki1oLYEvjO
	uCY9MSstXaHIw29rMv0i+EPZhnH5CKEn12LrW3N+DpM3CMSIP8LPXsp7SXqQo6KBgl0hedAGmko
	Zshkd8xusugMFY7DqGdd3GMZqsjLnsU281DJoJWEtRi7c88sPXE1b5wEzVgLiwD9Ntg+P9s4kbL
	1F/qFZhB9iuiNzeGy0YJKQYALSjc9BkCV85H886Fh82yvZiNP5L1o0JM4aQU3obvqzvPZuOmtGT
	iHgp+o3oR1gG2zqbJTOFnvl9dIB1CTwHSmt/y6KdYCXejckM9eADlLi6kldncjrk/v7XJ4NS59a
	ZJcTk1lmFAbdPv4BhkGrUv9lv6IotJkMPI5hOqnJJo5bkBFAAUDcFS75lDgl2D4riIhBAkO+xL3
	QCrSXtrQBRzr1T6dwGu4tt9FRV5L2BLKPenfiTO71iFd7EaRwXcU3iyDVLAZbKLmGk1SGWZuWU=
X-Received: by 2002:a05:6000:4b11:b0:485:8a46:b3bd with SMTP id ffacd0b85a97d-4858a46b4c8mr30478282f8f.37.1788939017753;
        Wed, 09 Sep 2026 00:30:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 33/38] curl: patch CVE-2026-11586
Date: Wed,  9 Sep 2026 09:29:32 +0200
Message-ID: <6b4a3a3e44c51896d81d4db83b606447d214c3f0.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245442

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].
Resolve fuzz caused by having additional tests in new version.

[1] https://curl.se/docs/CVE-2026-11586.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-11586.patch            | 203 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 204 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11586.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-11586.patch b/meta/recipes-support/curl/curl/CVE-2026-11586.patch
new file mode 100644
index 00000000000..3444166b326
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
index 6c9801f8792..a964868d872 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -28,6 +28,7 @@ SRC_URI = " \
     file://CVE-2026-8932-dependent.patch \
     file://CVE-2026-8932.patch \
     file://CVE-2026-11352.patch \
+    file://CVE-2026-11586.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

