Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 300ECEF4EA2
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 06:27:39 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49605.1775456857093154090
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 23:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YbDwoegr;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48897fd88ebso22428525e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 23:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775456855; x=1776061655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DS4DHbc7Jf3zRsV2JHtkpVskXSIoVHL+z+JE3NrXy+4=;
        b=YbDwoegrYxu7r6sEjE7Z3cHijbCTzn7fVT97ocGCGeXdembZncojFfxoCe+rOwuN4z
         S2wgEl05he2lKNWeFUDNVz1H/J/qby5RwGyR5vnizDQJdHvllDwsLjvfLb3VU45na5av
         qiQBqtsmWpXCzInLPrvMZNXNTtAFnbrc+lFGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775456855; x=1776061655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DS4DHbc7Jf3zRsV2JHtkpVskXSIoVHL+z+JE3NrXy+4=;
        b=cFCcmpJkt7hzaVhM30+9lj33WBaGx9Fp+PyYAq1uuU0+XhjGn0zUlUejtj5wvK8pRO
         abbxQwYx52R8g+MGVx6MM/H7Y3IsPIqTLOf0OUS92sWXHJnKDteEl/RLVi/GL3UB/OUO
         rttKBxgW01YSsm+mG67V8d2DxHUlvopFLVoJh8wnJRDgSY47qapt523e8nQJtiiCMPNM
         XOe1+t5o5TWafb5hvZhK7VpA9O0FfvWvTqMbazvnFmIrA5TZKhXPCvP/LWaBlsKMV0s3
         LnHKMWrBDqVdBhmryI0mg3IvmsiMpaGQK5d9xQ5wtfSDstUN9VDejUFzaWco0AFeby0E
         bMTg==
X-Gm-Message-State: AOJu0YzWkwE1KzAel5nqzelS/sv6hjrIbH3g+MJ4B5/qQlZLsc4eU6CD
	/cGEb7yImpLDBq5okaO3TGamHT8E1zFLQEUUHLFthoZlS49N8jhlSfydRQ8Ho0qGHEOnrYlW8bV
	FalKlWJI=
X-Gm-Gg: AeBDieuhoaPwWj1jSJthG2yKXmW0846bprA01Yxj7nmAh32FDkD3u8QP4MjU5xfCZv9
	dqpZzNISOaNdqEhbNwGH/D6bHyJm4BeYHhQcrvEmO0tcRjUfof7JQeAd9wNYL/Bxgbeu6x7BT4U
	tBZJtlLVKnj0cj2gfBIyLT+C39/4kB95PVE367B3bbYIJqGIP0Co4fShCbu+npKGhzmqrOeclLg
	Ete0VO/xQr3lMbc14I40weRU74fxxcH6yHhoxAYBYv3es7+5JJ6GZE7MncUo5SEwKgTbz1rACaW
	DW2hBGltzorg/p/vOmQ4rPGGbnoOrSQs4Z+naBdg3/h7tWzGdKMsNEssRENsdAvVuZVbQ7PZ9Ej
	YrrfUsLBqb+0w70SDRB74/d9jOKcrEnKt5bhiFOYMBMtLH4yfkf8prbonoN+KuQajirESPkkydf
	bWVKYJo89mVcLgTwDLb9bjMMR0YIJ7bu32klyMeFuzb1FEJLkfgtNQiEw3N7xjszoYXkGWosen5
	Ato2r1E44pX7nH8x4oJhkwwfos=
X-Received: by 2002:a05:600c:4447:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-48899785c7bmr185709395e9.17.1775456855182;
        Sun, 05 Apr 2026 23:27:35 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899eab0f7sm84273785e9.29.2026.04.05.23.27.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:27:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/18] python3-pyopenssl: Fix CVE-2026-27459
Date: Mon,  6 Apr 2026 08:26:39 +0200
Message-ID: <6985f9ba57fef2d9bc212a7f9a23e35979983d29.1775435063.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775435063.git.yoann.congal@smile.fr>
References: <cover.1775435063.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234656

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch mentioned in NVD

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-27459
[2] https://ubuntu.com/security/CVE-2026-27459

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-pyopenssl/CVE-2026-27459.patch    | 106 ++++++++++++++++++
 .../python/python3-pyopenssl_22.0.0.bb        |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch

diff --git a/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch b/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch
new file mode 100644
index 00000000000..b5e37a6900d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch
@@ -0,0 +1,106 @@
+From 57f09bb4bb051d3bc2a1abd36e9525313d5cd408 Mon Sep 17 00:00:00 2001
+From: Alex Gaynor <alex.gaynor@gmail.com>
+Date: Wed, 18 Feb 2026 07:46:15 -0500
+Subject: [PATCH] Fix buffer overflow in DTLS cookie generation callback
+ (#1479)
+
+The cookie generate callback copied user-returned bytes into a
+fixed-size native buffer without enforcing a maximum length. A
+callback returning more than DTLS1_COOKIE_LENGTH bytes would overflow
+the OpenSSL-provided buffer, corrupting adjacent memory.
+
+Co-authored-by: Claude Opus 4.6 <noreply@anthropic.com>
+
+Upstream-Status: Backport [https://github.com/pyca/pyopenssl/commit/57f09bb4bb051d3bc2a1abd36e9525313d5cd408]
+CVE: CVE-2026-27459
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ CHANGELOG.rst      |  1 +
+ src/OpenSSL/SSL.py |  7 +++++++
+ tests/test_ssl.py  | 38 ++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 46 insertions(+)
+
+diff --git a/CHANGELOG.rst b/CHANGELOG.rst
+index 5b6d523..13d8abd 100644
+--- a/CHANGELOG.rst
++++ b/CHANGELOG.rst
+@@ -20,6 +20,7 @@ Deprecations:
+ Changes:
+ ^^^^^^^^
+ 
++- Properly raise an error if a DTLS cookie callback returned a cookie longer than ``DTLS1_COOKIE_LENGTH`` bytes. Previously this would result in a buffer-overflow.
+ - ``Context.set_tlsext_servername_callback`` now handles exceptions raised in the callback by calling ``sys.excepthook`` and returning a fatal TLS alert. Previously, exceptions were silently swallowed and the handshake would proceed as if the callback had succeeded.
+ 
+ - Expose wrappers for some `DTLS
+diff --git a/src/OpenSSL/SSL.py b/src/OpenSSL/SSL.py
+index 6ef44d4..fa1b556 100644
+--- a/src/OpenSSL/SSL.py
++++ b/src/OpenSSL/SSL.py
+@@ -556,11 +556,18 @@ class _CookieGenerateCallbackHelper(_CallbackExceptionHelper):
+     def __init__(self, callback):
+         _CallbackExceptionHelper.__init__(self)
+ 
++        max_cookie_len = getattr(_lib, "DTLS1_COOKIE_LENGTH", 255)
++
+         @wraps(callback)
+         def wrapper(ssl, out, outlen):
+             try:
+                 conn = Connection._reverse_mapping[ssl]
+                 cookie = callback(conn)
++                if len(cookie) > max_cookie_len:
++                    raise ValueError(
++                        f"Cookie too long (got {len(cookie)} bytes, "
++                        f"max {max_cookie_len})"
++                    )
+                 out[0 : len(cookie)] = cookie
+                 outlen[0] = len(cookie)
+                 return 1
+diff --git a/tests/test_ssl.py b/tests/test_ssl.py
+index 77e1876..fb77b75 100644
+--- a/tests/test_ssl.py
++++ b/tests/test_ssl.py
+@@ -4455,3 +4455,41 @@ class TestDTLS(object):
+             assert 0 < c.get_cleartext_mtu() < 500
+         except NotImplementedError:  # OpenSSL 1.1.0 and earlier
+             pass
++
++    def test_cookie_generate_too_long(self) -> None:
++        s_ctx = Context(DTLS_METHOD)
++
++        def generate_cookie(ssl: Connection) -> bytes:
++            return b"\x00" * 256
++
++        def verify_cookie(ssl: Connection, cookie: bytes) -> bool:
++            return True
++
++        s_ctx.set_cookie_generate_callback(generate_cookie)
++        s_ctx.set_cookie_verify_callback(verify_cookie)
++        s_ctx.use_privatekey(load_privatekey(FILETYPE_PEM, server_key_pem))
++        s_ctx.use_certificate(load_certificate(FILETYPE_PEM, server_cert_pem))
++        s_ctx.set_options(OP_NO_QUERY_MTU)
++        s = Connection(s_ctx)
++        s.set_accept_state()
++
++        c_ctx = Context(DTLS_METHOD)
++        c_ctx.set_options(OP_NO_QUERY_MTU)
++        c = Connection(c_ctx)
++        c.set_connect_state()
++
++        c.set_ciphertext_mtu(1500)
++        s.set_ciphertext_mtu(1500)
++
++        # Client sends ClientHello
++        try:
++            c.do_handshake()
++        except SSL.WantReadError:
++            pass
++        chunk = c.bio_read(self.LARGE_BUFFER)
++        s.bio_write(chunk)
++
++        # Server tries DTLSv1_listen, which triggers cookie generation.
++        # The oversized cookie should raise ValueError.
++        with pytest.raises(ValueError, match="Cookie too long"):
++            s.DTLSv1_listen()
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb
index 13d87939b62..42de3207b46 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb
@@ -12,6 +12,7 @@ inherit pypi setuptools3
 
 SRC_URI += " \
     file://CVE-2026-27448.patch \
+    file://CVE-2026-27459.patch \
 "
 
 PACKAGES =+ "${PN}-tests"

