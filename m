Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79165CC6B00
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 05:22:14 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9311.1775107332072060436
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 22:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nBQM+Eek;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so5232225e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 22:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775107330; x=1775712130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BjStwzxqsEhZAlE4Anlyd4kFDZwobQ8X4iwP7o17ITE=;
        b=nBQM+Eek6pRBGRGwlKGppwhCImiiqQu3vA8BnVZ9j2l2Pnk1yOcejBJRwyd7AwgqRx
         MG4twNrBx1X4yT0168f9egJFjWU8Vj7ZC8UKTmRsVIMtKB+OQ+ybj/JgKOQ/QJy5s9Y9
         Qi4hSUn0czYmW3a8zeqFO4KAFZiE2uDBTtQLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775107330; x=1775712130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BjStwzxqsEhZAlE4Anlyd4kFDZwobQ8X4iwP7o17ITE=;
        b=ToJvCYFeFFPT9m2e5MXocalfNEPP596GQnlS/em7ZyqGD0nAsTXxq45TT6j+CPp7IJ
         t9a2+f9fuC8eseFQyK/EvzruKXgcvPv3JOHO8JrCQw5lWEieuuU+Sr9bklXIPApfc73/
         hhuz0Bta9FZq4yvL2qt1XT6Fp+g1ZJ66/eweC7wSeoOlYMf94VkCoZ0GWlu2NhSddg6b
         yyYwzrJPsrzONsNUcAQR0tXaYBtBGHr+30/4LyAUe6w+zbdRfQaPvNvqKSsJ5AXUZGrb
         DoDbVjScUbiZE8aW2dpul3ldzn9P3+Lzzt3JxyOszNZ0Yxh4PHqgP6orY7QAUAsOkcQ9
         CVqw==
X-Gm-Message-State: AOJu0Yz90x4NP9oDcMVR6bRxBF0t2CpmoWMo2ynTdWt7/gJYvPJuD7jn
	j0MxjXASG/ZlNUWovu10z9l69JQJvwV6Prc4PAYGJlWuYQpYWmRBZOVD35auGAXf1cHfQ7GCfnL
	pMYV1I+I=
X-Gm-Gg: ATEYQzw60kmKO7BZtqAuZHZtLXaPqtKDIah2xUlOSF6kYn0ph8vrbMMuQYJ1OM5Xtuy
	3Jf9ebjCoAkeO4uQyAxR6ue3HVAhPBGluVOUgx047+Nxj0IdFQADTS7IlxQBuvslqbTsSvgCfKx
	LD5bQh4D3gD4tHnwvCZBo4xlbmGsp2rv4RosAaCfIaFYrmMyfuch9FrGdDaB6RFWtdL+0yP8Bvg
	r7XXj4QkmmM6NSwmm9j9bv94KFx5HcHBIPjqyPajf/9zhgqhgMUDPiROfbzhvXSWf2XfxwXmWyx
	RwmbYR5qYU/W23j25J573Sx78Zxf2k6fCp4i208Ma7cAh0fTIUSwRkYlUuMKUFaW+4SYRmG3ini
	cqtxTbYlU+sQCuugM1A/7HCqGyg/dJBZtUxWh1jO7/KEV+OcXfxk6RKLr3BpPTwBapii0KWY6cx
	wlwwDsf+TfbPH6BSJKPfbPPJNcHjkjBlFLeyTXul0TTnyyx4/LZwxi+wSHrB+8W/5lbYIl7EAlZ
	a7AuBUl44ZlIFaWi3Bi9FE89Mkz1bHp8TuiPw==
X-Received: by 2002:a05:600c:3e0b:b0:488:7e6a:e70 with SMTP id 5b1f17b1804b1-48883562d72mr110419375e9.9.1775107330125;
        Wed, 01 Apr 2026 22:22:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e829c43sm151111865e9.5.2026.04.01.22.22.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:22:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 01/15] python3-pyopenssl: Fix CVE-2026-27448
Date: Thu,  2 Apr 2026 07:21:18 +0200
Message-ID: <db1e3b4cd8cf641f4968ca9035950acd1ce20694.1775106968.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775106968.git.yoann.congal@smile.fr>
References: <cover.1775106968.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 05:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234473

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch mentioned in NVD

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-27448
[2] https://ubuntu.com/security/CVE-2026-27448

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-pyopenssl/CVE-2026-27448.patch    | 125 ++++++++++++++++++
 .../python/python3-pyopenssl_25.1.0.bb        |   4 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch

diff --git a/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch b/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch
new file mode 100644
index 00000000000..59452c168e8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch
@@ -0,0 +1,125 @@
+From d41a814759a9fb49584ca8ab3f7295de49a85aa0 Mon Sep 17 00:00:00 2001
+From: Alex Gaynor <alex.gaynor@gmail.com>
+Date: Mon, 16 Feb 2026 21:04:37 -0500
+Subject: [PATCH] Handle exceptions in set_tlsext_servername_callback callbacks
+ (#1478)
+
+When the servername callback raises an exception, call sys.excepthook
+with the exception info and return SSL_TLSEXT_ERR_ALERT_FATAL to abort
+the handshake. Previously, exceptions would propagate uncaught through
+the CFFI callback boundary.
+
+https://claude.ai/code/session_01P7y1XmWkdtC5UcmZwGDvGi
+
+Co-authored-by: Claude <noreply@anthropic.com>
+
+Upstream-Status: Backport [https://github.com/pyca/pyopenssl/commit/d41a814759a9fb49584ca8ab3f7295de49a85aa0]
+CVE: CVE-2026-27448
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ CHANGELOG.rst      |  1 +
+ src/OpenSSL/SSL.py |  7 ++++++-
+ tests/test_ssl.py  | 50 ++++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 57 insertions(+), 1 deletion(-)
+
+diff --git a/CHANGELOG.rst b/CHANGELOG.rst
+index d98901f..5d953c9 100644
+--- a/CHANGELOG.rst
++++ b/CHANGELOG.rst
+@@ -37,6 +37,7 @@ Changes:
+ 
+ - Corrected type annotations on ``Context.set_alpn_select_callback``, ``Context.set_session_cache_mode``, ``Context.set_options``, ``Context.set_mode``, ``X509.subject_name_hash``, and ``X509Store.load_locations``.
+ - Deprecated APIs are now marked using ``warnings.deprecated``. ``mypy`` will emit deprecation notices for them when used with ``--enable-error-code deprecated``.
++- ``Context.set_tlsext_servername_callback`` now handles exceptions raised in the callback by calling ``sys.excepthook`` and returning a fatal TLS alert. Previously, exceptions were silently swallowed and the handshake would proceed as if the callback had succeeded.
+ 
+ 24.3.0 (2024-11-27)
+ -------------------
+diff --git a/src/OpenSSL/SSL.py b/src/OpenSSL/SSL.py
+index ca8913c..178961f 100644
+--- a/src/OpenSSL/SSL.py
++++ b/src/OpenSSL/SSL.py
+@@ -2,6 +2,7 @@ from __future__ import annotations
+ 
+ import os
+ import socket
++import sys
+ import typing
+ import warnings
+ from collections.abc import Sequence
+@@ -1729,7 +1730,11 @@ class Context:
+ 
+         @wraps(callback)
+         def wrapper(ssl, alert, arg):  # type: ignore[no-untyped-def]
+-            callback(Connection._reverse_mapping[ssl])
++            try:
++                callback(Connection._reverse_mapping[ssl])
++            except Exception:
++                sys.excepthook(*sys.exc_info())
++                return _lib.SSL_TLSEXT_ERR_ALERT_FATAL
+             return 0
+ 
+         self._tlsext_servername_callback = _ffi.callback(
+diff --git a/tests/test_ssl.py b/tests/test_ssl.py
+index bcad6d9..9a5b19b 100644
+--- a/tests/test_ssl.py
++++ b/tests/test_ssl.py
+@@ -1929,6 +1929,56 @@ class TestServerNameCallback:
+ 
+         assert args == [(server, b"foo1.example.com")]
+ 
++    def test_servername_callback_exception(
++        self, monkeypatch: pytest.MonkeyPatch
++    ) -> None:
++        """
++        When the callback passed to `Context.set_tlsext_servername_callback`
++        raises an exception, ``sys.excepthook`` is called with the exception
++        and the handshake fails with an ``Error``.
++        """
++        exc = TypeError("server name callback failed")
++
++        def servername(conn: Connection) -> None:
++            raise exc
++
++        excepthook_calls: list[
++            tuple[type[BaseException], BaseException, object]
++        ] = []
++
++        def custom_excepthook(
++            exc_type: type[BaseException],
++            exc_value: BaseException,
++            exc_tb: object,
++        ) -> None:
++            excepthook_calls.append((exc_type, exc_value, exc_tb))
++
++        context = Context(SSLv23_METHOD)
++        context.set_tlsext_servername_callback(servername)
++
++        # Necessary to actually accept the connection
++        context.use_privatekey(load_privatekey(FILETYPE_PEM, server_key_pem))
++        context.use_certificate(
++            load_certificate(FILETYPE_PEM, server_cert_pem)
++        )
++
++        # Do a little connection to trigger the logic
++        server = Connection(context, None)
++        server.set_accept_state()
++
++        client = Connection(Context(SSLv23_METHOD), None)
++        client.set_connect_state()
++        client.set_tlsext_host_name(b"foo1.example.com")
++
++        monkeypatch.setattr(sys, "excepthook", custom_excepthook)
++        with pytest.raises(Error):
++            interact_in_memory(server, client)
++
++        assert len(excepthook_calls) == 1
++        assert excepthook_calls[0][0] is TypeError
++        assert excepthook_calls[0][1] is exc
++        assert excepthook_calls[0][2] is not None
++
+ 
+ class TestApplicationLayerProtoNegotiation:
+     """
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb
index c1f571c552e..25263629a4c 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb
@@ -9,6 +9,10 @@ SRC_URI[sha256sum] = "8d031884482e0c67ee92bf9a4d8cceb08d92aba7136432ffb0703c5280
 
 inherit pypi setuptools3
 
+SRC_URI += " \
+    file://CVE-2026-27448.patch \
+"
+
 PACKAGES =+ "${PN}-tests"
 FILES:${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
 

