Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C017DFEA82D
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 07:25:22 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16894.1774423515170712715
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 00:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VDTBYN9G;
 spf=pass (domain: mvista.com, ip: 209.85.216.50, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so3093425a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 00:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774423514; x=1775028314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uC895IMZXAXczAWFGNBeA2e7HODXkgOFCMskI8l5ZXQ=;
        b=VDTBYN9GuIxgEiggg45GZnzDhYAenfyAVGl2xakrq0C+jz79K39dwOIuC7+r/sNnjX
         jjkS9QJKyMmXRO7vSR6xc13vTIjONl9Aur1dE1IgFmt83d1vhneUdpR6ON+KH3pgirPi
         wbOJsxdA3Kt9V0W+EBU+yiNDT96hoMXjzrey0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774423514; x=1775028314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uC895IMZXAXczAWFGNBeA2e7HODXkgOFCMskI8l5ZXQ=;
        b=EpXOmYjXftwjFj54r2uqQeZxa9B3m2+0oOCkTBTynbJacL0m5mBivQoNoL33ImVauT
         G6q1t267jmXgXERnZSsKp50MWmWP5QQ3kSx6Rn6mK+KTpE0J5yYq8A+hI8/dtPC3DVin
         zPjLjrHrwY51An13m7eRUkt2abHG3pw03u1VePXMs7fLUUrKbwrqU3I3IIl4z/kAosUy
         4AZaNpRdRDpAHhjPRqTNGIDva7i4g5wd88iiIBi1XAnk6y/upHdT7fzRQE98oWTcioTu
         1SjS+igRt7NLmbA03t4WeXMd+4OruC4WCM9v5sitGh6GjKp/ypBBjBQa8mOqfyFO/BK2
         v+yA==
X-Gm-Message-State: AOJu0YzO5edD6s1oadST+fqq4GhWLOie1VFgjcgauFToffaLy/bDfP81
	8278l/ybkAvH4Or52wa6WWwkOGkVtfP3XGEw6CYo9l4cbJ7RBT6H/EM+CWEH9V10iPCYA4omGNo
	E4IIUNf3VuA==
X-Gm-Gg: ATEYQzxb3UxglsGY6GSiv/OfgxUqW86XCDFwDH6kxozontkIg0Z4xWvBhCpIaHOfIMR
	5Vd5srwsATEBbQodcKYyREKqxPGpmnmmYzwRT+lp8pbm8wTtk/oHBQ2iN4GXQAf6FawyQk8qdNU
	HxplQpKoS4iV3YCtZxuwLcsKxwHJv+tl/m7BuQzUMfSco63wux/J06iuzSxWrSC1A8YqT49wJMG
	IzU8QBc+U7RRk6A/p1EC73ebIC5QQvoA96knOVWYIoxdfFF6Pkkglj16SGFiVeQDt0Mt7Xr99Pn
	+wzVYJKzVpA0HZdDm9Uyk5Wo+eNQk60SXGEPXe/BBKeVHGyAziwX7V9o1qyWXIr3ZVP/iKRCiVL
	K3N/IEUr3uZCkzXa8AnABgJx+iGoZC06L2uYTGjqnYnJtzyYwrHmP/8B946VX8hsaZGWOMX1Pzx
	R6VAi3x1/fo8ykr6NTCK+cZZXAjnQEsGJBHOZf
X-Received: by 2002:a17:903:3807:b0:2ae:aa16:acfb with SMTP id d9443c01a7336-2b0b0a7fa9emr29294945ad.22.1774423513928;
        Wed, 25 Mar 2026 00:25:13 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:54:2bec:794a:a8bb:bd94:ee98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836955dbsm232803035ad.72.2026.03.25.00.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:25:13 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 2/2] python3-pyopenssl: Fix CVE-2026-27459
Date: Wed, 25 Mar 2026 12:54:54 +0530
Message-Id: <20260325072454.91845-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260325072454.91845-1-vanusuri@mvista.com>
References: <20260325072454.91845-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 07:25:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233862

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch mentioned in NVD

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-27459
[2] https://ubuntu.com/security/CVE-2026-27459

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python3-pyopenssl/CVE-2026-27459.patch    | 106 ++++++++++++++++++
 .../python/python3-pyopenssl_22.0.0.bb        |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch

diff --git a/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch b/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch
new file mode 100644
index 0000000000..b5e37a6900
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
index 13d87939b6..42de3207b4 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb
@@ -12,6 +12,7 @@ inherit pypi setuptools3
 
 SRC_URI += " \
     file://CVE-2026-27448.patch \
+    file://CVE-2026-27459.patch \
 "
 
 PACKAGES =+ "${PN}-tests"
-- 
2.25.1


