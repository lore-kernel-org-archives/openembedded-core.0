Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AD9F364DC
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:28 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.145069.1775776283025602736
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=O4WDQfMx;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488ad135063so12548925e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776281; x=1776381081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DS4DHbc7Jf3zRsV2JHtkpVskXSIoVHL+z+JE3NrXy+4=;
        b=O4WDQfMx4xb5272yhHhmVCy5n6eDVYzrdl07YpwV04LA6jRVpGDOnPg9vWeC52/qtv
         ysYq5H7sKS4uo2DrSIGWsUgu0I7/Op/katRoWFGSxtEgBjK6ly0qY32pKRTfiZEqWFGP
         moCM9iOQ6V9vMO7COfga+DPkzUcHp1kG7LkBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776281; x=1776381081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DS4DHbc7Jf3zRsV2JHtkpVskXSIoVHL+z+JE3NrXy+4=;
        b=a01c+EqLCSqtIoqdJBJ5BQttL3087r3vAfZtXcLnpK3VQbNO+Po8eFnw6DosleC6ls
         2FGmxc4qhmbgKi6Dt9X/y0dkPeFltjHM2DZNzV9oekCZviQhAo1onpjesSEW+ouAp3zv
         v4HdGPSTYg1b3kKxyZz8VxDEnH/FIrYIA35MhGI9xbwFbo5lvD0BD09jVZA1uJWb4Aiz
         imoWnEvOkIqSJV2FaC68TzOo28wFOjJiOqdPw2Bd0O1QSEFLNGXF2QfdQgOUhauF/oze
         MIyhSB5S9JBvmDbe6FshrOUKtsqj/DdCmVDwUvJeP9nTXtbCZN9X8QH9PQEy9kWmwyMq
         3qVA==
X-Gm-Message-State: AOJu0YyAHy73jsFg96M0t8oWlUo0S07YiyChB50ALqwQMpZUVYUZxFFj
	Q2ObpkyndoMZtFYsq7dYF4+Ty5r812tyiS/JuzGFo4j10UCfT/kVEC/DdGa5n/DTnfCuOZUmgOH
	1cdxI0sOk1scc
X-Gm-Gg: AeBDiesLGlA6VciI0YsWRmmT94ROr/bffy7ibBXKnay40OGTShbqmn7am5S0AgmxPf1
	JiFClj7/rEjFGRu/7D+DDb/RSSvbkIzIDqLTMAVbEZheawsSMyKzEaXPeBL+sy4YIbQzHAp1r+1
	EWO9AnaZzQty/fNjyflV8PBkQHUd/QF1OaYxm6POeij6KE+APZkayk7B8dpdBBlGUz129r/QSXX
	bq7LaDnQl4zPEOQxdmtNBV7hxuvK85gnBfV2uqpeiaCYHx6v8th/D++gcXlbNPHn5SN4O+xSTGE
	ZM4yk0E8yJ+qSPx6aXdE+EjBSTt5cIuhioiYI7rqzlLPaNJDqzC1iEKzHg2+DSAWt0fksW//JRT
	dsKYxZDBUwlFBkKcTLlSz/cbARG1fZZPluNGpQSee1GyNfTLZ7WIar5cnGYoJXTgQ2hzDx4ZcQF
	m8R4qKLn6YYkDTsMtLBPdIvpCHMFwcFCa/hlqCbqKqNFJul/Rg1tlLD6uj2P1DjSqX72Ud/oLTU
	LtRPYqmbmQXqBCcXqhmeeTPZ/6Y
X-Received: by 2002:a05:600c:5397:b0:488:b8bc:6a32 with SMTP id 5b1f17b1804b1-488d68a4765mr8661355e9.23.1775776281166;
        Thu, 09 Apr 2026 16:11:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 10/30] python3-pyopenssl: Fix CVE-2026-27459
Date: Fri, 10 Apr 2026 01:10:10 +0200
Message-ID: <b46b806b2ef773d7061923e7bab9184fb758a6b4.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234969

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

