Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9AF10F3DD3
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 05:29:35 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5996.1774675766539120246
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 22:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BBxK7THb;
 spf=pass (domain: mvista.com, ip: 209.85.216.43, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35a09e0dd63so2582828a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 22:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774675765; x=1775280565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O7SP403NahW1YR5Caufnm6qomVPoZqn1hRnrOrIx+kc=;
        b=BBxK7THbBLEOBz+7eXWoB8/sm7mvSGczi9jKCu03WgVFCB8iHu9pKVfQnMKmLlx0yP
         b5BN+qSLa3RnYQr0YJlesYL5NYmp7XUkxcPV7cgZatAj6VFfagwNk8876hNG1Hr5JLTt
         4/CnDj4BwBjX2wu/4HNHiuHxhWKzrsnGmE8FU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774675765; x=1775280565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7SP403NahW1YR5Caufnm6qomVPoZqn1hRnrOrIx+kc=;
        b=E+qt2GdXiBIptzLoAjLzCf8fcwnKEPaQxEtPEjzxDOD76ddZozFOplsBjAE4C1No/b
         D51geGf8RlY9mGQ7BHJwOfZq51JMaLMdnSUnMGrK8LwGSpKTlh0JoEavwYmLcjJ/JUpy
         ObWbtHgyhb2oRAAYTIiTAZpfyMnfZEjgBUKVpPMsuz3+g4KOWBruXnSlt67Vob7z10V1
         ybVGV9Ghy+h5pz6nLlQz2MJsC1A2my8U3PtWckd60uctmQzERVTYdS0ZGnjZ6TkhcHWy
         0OsHekTfG4gLXYXkDkSi5A0YQHbI44stoB8ikYm84jFxPshHExiRxblc8hEzwX2uEGEX
         O3Gg==
X-Gm-Message-State: AOJu0YyAvCy/wgUwQMNlg9gahSVPQI4uXozIx5lUpYyaz2FfF8Vuru5O
	eK6w7HL9jnpDvbndrVzQtwFRYa+vjaNU6MyHUY/BJKTMc4C/XrNYMHUYz81XjsBNqTTgCuBBW/B
	dwPwD58Y=
X-Gm-Gg: ATEYQzzTQk21zG+xKartkJgapcmK322KvEuo1uCqISBUT1JTfq/jWt1GAT96kJx4dlJ
	oc3SR9UKXQCwP5QJYgC3WBvoGW1JskuiRHAmXgPLCe0bZvg6chA+6uBAyS9RNYs6VXm/Gc2sCe9
	3rAvIKjIa4wQhh3RqcWUM9afAInY/h2NeRPCYaUo7htN+EzZdX3cPwyn1bRL5lcKZ/mS2EM4RGH
	vaMdEFdM1b9aZeXD93lAdJhmAm9EExd9Q0OGAASxp+JnH2K+mnKCYf+Juj4NQBe0FzTmTGz9eGv
	uUTk+Y12e8wnZ1c1xll5VgNX/5cRqkyiZBc3cUUxV/9Fbqh5h8y8XV63K6vLNBhv0cz/lcsGNU+
	4uPV8TL2eICqbxw0SCV0T1Xq1v/TQ+e/67SktwKVXPyV6JaepODqx3bwWgffBP7Cphzp5DqEYZo
	lu2kyIDPs6qOUBb7r9nnr1XznvboYBecvVw50=
X-Received: by 2002:a17:90b:1d4c:b0:35b:e551:e776 with SMTP id 98e67ed59e1d1-35c3010e291mr4901709a91.27.1774675765393;
        Fri, 27 Mar 2026 22:29:25 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2406:7400:54:2bec:7f1f:a17:8f64:417f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22a82231sm9327916a91.6.2026.03.27.22.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 22:29:24 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][whinlatter][patch 1/2] python3-pyopenssl: Fix CVE-2026-27448
Date: Sat, 28 Mar 2026 10:59:13 +0530
Message-ID: <20260328052914.187040-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 05:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234116

Pick patch mentioned in NVD

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-27448
[2] https://ubuntu.com/security/CVE-2026-27448

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python3-pyopenssl/CVE-2026-27448.patch    | 125 ++++++++++++++++++
 .../python/python3-pyopenssl_25.1.0.bb        |   4 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch

diff --git a/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch b/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch
new file mode 100644
index 0000000000..59452c168e
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
index c1f571c552..25263629a4 100644
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
 
-- 
2.43.0


