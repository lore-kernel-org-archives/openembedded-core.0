Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EEBBFC9815
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:38:19 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38624.1774823891483680086
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2IRo9TA0;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b949bf4easo2187360f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774823890; x=1775428690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZ363e0EVIi8MryHmDhiofnldkWTub/QYI8YZsUpARI=;
        b=2IRo9TA0FMqsdcjpX2OWcPF3GZ6uqjwJtjFNM6n4Mt3NoAKGsyCVtiW+aw9NTQ6tKQ
         nGQ9JdohHff1T6VaRFktZcimGKjjC+tWKr2Rq8AOMT9XMEzlbzNhSFO6AX8hEHtGAf3i
         +0bbuKeyu13/3XAm0Lnjnio+PkJL7mQ0XX5tA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774823890; x=1775428690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GZ363e0EVIi8MryHmDhiofnldkWTub/QYI8YZsUpARI=;
        b=PiG4PyEulpn7NnHw9VGfvdKuuKCbJsj+Nb/oDjRHW/J3ydL9LFMzGWWHv1YmLAqp/Z
         FRkLCAR17NgYI663UI3muf8nC2yQckeY3eLWYdZ9041plmTPoEoXO0bO9EcNySyivdKH
         zIgO+VOZlJoaf3csDpCIOWYcQjjsmmL3DOi3+ouddSd4pcWXKxhsC2Tg2dRJU4oWsxu2
         rsyZblMZ8rm/QrhGGSSgHYKWxqycVMkdHjaobo9dE7Tbx/XvS0NBhkVqBRePhkCkq6VX
         F088I6ZQhKdkgKJmLzqU15THg4gXO3BXQeVgT4OyDS6VoB/9o8n5/9SI7Y2SAHuLrFhL
         AhKg==
X-Gm-Message-State: AOJu0Yw1XsavM/YMCvvRNPRpkMs1aLmpj8QItoe8WCGMLMQaw/jdP18M
	Q+UkfrAigeg/ryOt7Un4nQvbRhDk823Z23/upBEEIsCE+J8oADvV97ME6Anunu9I9WjsW/07W7k
	Vl8e8sao=
X-Gm-Gg: ATEYQzxFg2LBARr1MIZF+Ui2umEIHbHIukjieEd9APK7m0vRIq29Du6XlBOvXBFT4kR
	05LlGPI0FlrbMOLXY8J8lO0bk8DuvnuThzE3Llg9s3/exJN88sNMezZuZy1n8XYuotfCwG177pp
	sFoax089ae6S7LTYLLQgxoMpMUC975PiXh3MbzkpIlxTHF98ZP44Kvh21gIKhFv31crWF/ueaNu
	qesjHT6HdNeEN6aPJm4gLByGu28j8qwy4jaJdUSDaqq6p7f9aWg86LphgymLRb8ULSeUWiRgQQ3
	AEnpb2Aubq8Xco3fzJBqQfBBpS6PxkMt1iFwEIRs0p8BXsKkkGt/f6d/wrLJC35ve/ALI3GhS7N
	AsbKbZP1n6+ihu9ZA1O1KkDmMk1DW/2JNTeFp1DZqXlevREqnGOmxHeTN7z/JsTUWey+/BQbgPb
	QeuPJUCE0RnWP9sRNHaDdklh9yvxAgGgchDoSAYAFI3BTXBboj9/nvNFj9NPLzLOkMtBMisMpyb
	f3ksNcSJfLiGIav18vfuG6H/nU=
X-Received: by 2002:a05:6000:1a89:b0:43b:9b9a:1bc with SMTP id ffacd0b85a97d-43b9ea9ac46mr17817176f8f.5.1774823889647;
        Sun, 29 Mar 2026 15:38:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm13038542f8f.29.2026.03.29.15.38.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:38:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/16] python3-pyopenssl: Fix CVE-2026-27459
Date: Mon, 30 Mar 2026 00:37:43 +0200
Message-ID: <e6f3b2e043259650d80fb6f761797c5cf5587eb5.1774823430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774823430.git.yoann.congal@smile.fr>
References: <cover.1774823430.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234169

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch mentioned in NVD

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-27459
[2] https://ubuntu.com/security/CVE-2026-27459

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-pyopenssl/CVE-2026-27459.patch    | 109 ++++++++++++++++++
 .../python/python3-pyopenssl_24.0.0.bb        |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch

diff --git a/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch b/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch
new file mode 100644
index 00000000000..f75540f96e0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch
@@ -0,0 +1,109 @@
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
+index 12e60e4..6041fdc 100644
+--- a/CHANGELOG.rst
++++ b/CHANGELOG.rst
+@@ -16,6 +16,7 @@ Deprecations:
+ Changes:
+ ^^^^^^^^
+ 
++- Properly raise an error if a DTLS cookie callback returned a cookie longer than ``DTLS1_COOKIE_LENGTH`` bytes. Previously this would result in a buffer-overflow.
+ - Added ``OpenSSL.SSL.Connection.get_selected_srtp_profile`` to determine which SRTP profile was negotiated.
+   `#1279 <https://github.com/pyca/pyopenssl/pull/1279>`_.
+ - ``Context.set_tlsext_servername_callback`` now handles exceptions raised in the callback by calling ``sys.excepthook`` and returning a fatal TLS alert. Previously, exceptions were silently swallowed and the handshake would proceed as if the callback had succeeded.
+diff --git a/src/OpenSSL/SSL.py b/src/OpenSSL/SSL.py
+index a6263c4..2e4da78 100644
+--- a/src/OpenSSL/SSL.py
++++ b/src/OpenSSL/SSL.py
+@@ -691,11 +691,18 @@ class _CookieGenerateCallbackHelper(_CallbackExceptionHelper):
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
+index 55489b9..683e368 100644
+--- a/tests/test_ssl.py
++++ b/tests/test_ssl.py
+@@ -4560,6 +4560,44 @@ class TestDTLS:
+     def test_it_works_with_srtp(self):
+         self._test_handshake_and_data(srtp_profile=b"SRTP_AES128_CM_SHA1_80")
+ 
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
++
+     def test_timeout(self, monkeypatch):
+         c_ctx = Context(DTLS_METHOD)
+         c = Connection(c_ctx)
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
index bc0b568a46a..94a70aa17d1 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
@@ -12,6 +12,7 @@ inherit pypi setuptools3
 
 SRC_URI += " \
     file://CVE-2026-27448.patch \
+    file://CVE-2026-27459.patch \
 "
 
 PACKAGES =+ "${PN}-tests"

