Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 075EB10F3DD2
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 05:29:35 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5997.1774675770913385516
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 22:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BXPyPzW7;
 spf=pass (domain: mvista.com, ip: 209.85.216.43, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35d971fbcddso65582a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 22:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774675770; x=1775280570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lxb0cUn6iQEqjQ4l5Tc9OD2fyPSjpCjYtkWaKVseYw=;
        b=BXPyPzW7WtnVHNAj805DllTy5PiiCYodKu70yukVGI84B7CZtJBxUGGrrkZKRUjols
         xO+JysKyYJlnbkcaUvmJ3fymW35XDS24HkXDABmn6gyb2rtp2hoFrPllSRLwgC9L7g2p
         vY5rQIxXftMxARh1UWL/dagdDdM1MFebqMZW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774675770; x=1775280570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5lxb0cUn6iQEqjQ4l5Tc9OD2fyPSjpCjYtkWaKVseYw=;
        b=WN4KA0SHpOUOYsSvsghXxJfFqwxt2mFl/qBIjFhKFkEwaanHsuviwj2AYEq4JZvnKR
         kEHnBfoPodBjDs1BO6wahiDkW/uPI3I1icn/+iseqGdL2X2Dk3AowmvXT3D3tEV9nzpW
         FXgn0W9vGK0PhxazKUAF+SnYCGXkqaH6oTDOEVdQFGcxbM7tyJlPk9jgEO4lmtkN1SG4
         gnwvEZStUET1//tVaXkcFXwbpCfHFnmlpxGUCC+/uJ16wr0JLeKSQQYpJNIT1DtgFJNj
         Mu82PRP0NMbtAeEfc+JYt0XoUg5PXB5CCRuxTa8XtoNstq81gEDw30SrHJwQZiBybP1A
         imtQ==
X-Gm-Message-State: AOJu0YyMlBnJEQnp1B5qC0W8/PLHNImwCWK98hrBthzU+RjjUKXhwy+w
	ffYgO3OtfkD6GuHC1WXc570ogIL/IUYk/dlj2nEyWz0xyTEXFan/goxAsiQMrS8seZYRV/JRZd7
	sBBU9280=
X-Gm-Gg: ATEYQzy+8YiavLM+9U+Hutcxf27U2J48CZJmmpglZZFZ4d7Fu/X+l0oRms0cvRsuViQ
	cB6gYuB6ByIDls/QSLyp6pxDgml1xJ46FM3yQjd4bAQYN36zqdjc0La2reEHl5gGXafCfet2okA
	Mq3BVIOe5OJUI2VfzmPj2dpEEkNojUNoTJcbJ9qJ1LEY3SSLvJ6XWPsveKMzGmKhPlX+tkATndX
	md4j9/zXmvv5xTbgDqqEnC983FEME6KmcNyvYH5VTOwJTU7Y3bmMo5JCuUXxAXoX2XvmH63XWWG
	1SfBmOSd6O+mY5ZNnBTpc2YtuwdJRH2YaxXP8swZox4bTg9ERvNlFy9BIb1kYq+iWZF9csXBF/F
	HF4OT7oguhmasRc4WLdrTs+pAvjAIZkGKcbU2pWsShB7JI4g6q/pCFV+Ll3mjmmrtBJjoYbGu0B
	8jPlQJRQxP6+G/CXPD9WLJYvopDoMZKmflRgU=
X-Received: by 2002:a17:90b:390d:b0:359:8df1:8553 with SMTP id 98e67ed59e1d1-35c30d78e17mr3765802a91.9.1774675769910;
        Fri, 27 Mar 2026 22:29:29 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2406:7400:54:2bec:7f1f:a17:8f64:417f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22a82231sm9327916a91.6.2026.03.27.22.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 22:29:29 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][whinlatter][patch 2/2] python3-pyopenssl: Fix CVE-2026-27459
Date: Sat, 28 Mar 2026 10:59:14 +0530
Message-ID: <20260328052914.187040-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260328052914.187040-1-vanusuri@mvista.com>
References: <20260328052914.187040-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 05:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234117

Pick patch mentioned in NVD

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-27459
[2] https://ubuntu.com/security/CVE-2026-27459

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python3-pyopenssl/CVE-2026-27459.patch    | 109 ++++++++++++++++++
 .../python/python3-pyopenssl_25.1.0.bb        |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch

diff --git a/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch b/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch
new file mode 100644
index 0000000000..b35525c376
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
+index 5d953c9..de8b14a 100644
+--- a/CHANGELOG.rst
++++ b/CHANGELOG.rst
+@@ -35,6 +35,7 @@ Deprecations:
+ Changes:
+ ^^^^^^^^
+ 
++- Properly raise an error if a DTLS cookie callback returned a cookie longer than ``DTLS1_COOKIE_LENGTH`` bytes. Previously this would result in a buffer-overflow.
+ - Corrected type annotations on ``Context.set_alpn_select_callback``, ``Context.set_session_cache_mode``, ``Context.set_options``, ``Context.set_mode``, ``X509.subject_name_hash``, and ``X509Store.load_locations``.
+ - Deprecated APIs are now marked using ``warnings.deprecated``. ``mypy`` will emit deprecation notices for them when used with ``--enable-error-code deprecated``.
+ - ``Context.set_tlsext_servername_callback`` now handles exceptions raised in the callback by calling ``sys.excepthook`` and returning a fatal TLS alert. Previously, exceptions were silently swallowed and the handshake would proceed as if the callback had succeeded.
+diff --git a/src/OpenSSL/SSL.py b/src/OpenSSL/SSL.py
+index 178961f..6c7d6a2 100644
+--- a/src/OpenSSL/SSL.py
++++ b/src/OpenSSL/SSL.py
+@@ -716,11 +716,18 @@ class _CookieGenerateCallbackHelper(_CallbackExceptionHelper):
+     def __init__(self, callback: _CookieGenerateCallback) -> None:
+         _CallbackExceptionHelper.__init__(self)
+ 
++        max_cookie_len = getattr(_lib, "DTLS1_COOKIE_LENGTH", 255)
++
+         @wraps(callback)
+         def wrapper(ssl, out, outlen):  # type: ignore[no-untyped-def]
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
+index 9a5b19b..7dd3af8 100644
+--- a/tests/test_ssl.py
++++ b/tests/test_ssl.py
+@@ -4720,6 +4720,44 @@ class TestDTLS:
+     def test_it_works_with_srtp(self) -> None:
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
+     def test_timeout(self, monkeypatch: pytest.MonkeyPatch) -> None:
+         c_ctx = Context(DTLS_METHOD)
+         c = Connection(c_ctx)
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb
index 25263629a4..08c821c415 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb
@@ -11,6 +11,7 @@ inherit pypi setuptools3
 
 SRC_URI += " \
     file://CVE-2026-27448.patch \
+    file://CVE-2026-27459.patch \
 "
 
 PACKAGES =+ "${PN}-tests"
-- 
2.43.0


