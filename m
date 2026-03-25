Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE42FEA82C
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 07:25:12 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17219.1774423511448695657
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 00:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RgiCErtD;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ab077e3f32so22018855ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 00:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774423510; x=1775028310; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J7nOpVhqBzDDkTGHSl8uI/UySUItk4U9Bc/Xtm5ovsU=;
        b=RgiCErtD/xgvvhVeRLsPxktQtF8sWq7DQ3UOVoI9+rcoUsDQQVxWAb2KnEawarPFAm
         74KS7vrP8+6VY2xtv3MPRey6v0TzzgjjwIFxre2Jk83nh1pdEfZANQ5lEhJIq+JOI6vR
         nmWhQDhp4H6y/qZxRQ35DwiOgwbd0+ipwhRk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774423510; x=1775028310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7nOpVhqBzDDkTGHSl8uI/UySUItk4U9Bc/Xtm5ovsU=;
        b=kcy5Y99Ttd7jV8SlgBkKyXjOuEqaA4M8gNsjU2NBcJdIfmLP91GSIB5QnNdue/9KPG
         TN78Pijh7RQUcaVxv2iIz5YmHbuSnggy+tjcDxV/HsyDwgnBhn4jpfL+GcEFVJlTo3hJ
         Hq8htuK1fCxbHn86+diVuj9F3/CF4IkXgO8RVRSobVOq2YFuNWQJ2tIqMKl1ZST4hxu3
         K5mBp32D6yC7/dEAwqUL6WikQA+YRYAgzKasbXmx2qvqqm4/oAlgqcBFMi0JNl4ywjEL
         Gkivube4XTPqcwh6PlVabkbOc4eeIFs/XjGhUlmLHtlHU/N9sovugYCZ31Xh6YQbeLj6
         fb4g==
X-Gm-Message-State: AOJu0YwdC3ZSUucAiyvDacYlb4nNRw4YpSQJsteA0kdCIJeP7DKRgtsW
	oTPIlfMlAWUY+uVvvJ7SKVxNDKrnR+FEb46zqy2TpvxGMdBmGlkJbP8R05hCmayICA7+x1wRJMj
	Hgm0YMp1ylA==
X-Gm-Gg: ATEYQzwzHKIxYs7nJh1dBkZ/4acygHK6KvGEdUxabGsqXFPgdNXQUCxQWye3ilLCuAd
	w7CR8cblbpChWKZPL8WZzfXHssoZ5ncnF1EyeURTZ7XflmAbdZqQ7wf4SGzJjzaV7O0ul3k0MIr
	KvPdtClrHVUyYb27dbmfM4V5R88BqWgtV/5d91v0ilKkeEMy0EJiQPArKAvw7jYgZUaOrgz/aXv
	NMARWPxMPJ18VKxVi4O4A0f/g0UG6YId5JJHtxjjvHsGSvTEFKPV2ltR2BHNJdPHzG0ImxomuTN
	GgjjF2pE/KcqW4iuyjc1NkV6CgStzsL+2/k1a616Z/PgEy+MdWBqDqeKrvf83F3gYj3infHu/Kp
	5zpm2zku3yEIXDwteop7KDOAHW0hnHkmeELc60diBwtXSZb55MOmr5xrZYpfuDGMS8n2smAgWa7
	pmMb6Lx9QvrZEbJkV2m0L9XyI4syMlzyHdtO9q
X-Received: by 2002:a17:902:ef07:b0:2ae:ba5f:3ac3 with SMTP id d9443c01a7336-2b0b09a7468mr28032495ad.2.1774423510347;
        Wed, 25 Mar 2026 00:25:10 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:54:2bec:794a:a8bb:bd94:ee98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836955dbsm232803035ad.72.2026.03.25.00.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:25:09 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 1/2] python3-pyopenssl: Fix CVE-2026-27448
Date: Wed, 25 Mar 2026 12:54:53 +0530
Message-Id: <20260325072454.91845-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 07:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233861

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch mentioned in NVD

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-27448
[2] https://ubuntu.com/security/CVE-2026-27448

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python3-pyopenssl/CVE-2026-27448.patch    | 125 ++++++++++++++++++
 .../python/python3-pyopenssl_22.0.0.bb        |   4 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch

diff --git a/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch b/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch
new file mode 100644
index 0000000000..4a06e2c020
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
+ CHANGELOG.rst      |  2 ++
+ src/OpenSSL/SSL.py |  7 ++++++-
+ tests/test_ssl.py  | 50 ++++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 58 insertions(+), 1 deletion(-)
+
+diff --git a/CHANGELOG.rst b/CHANGELOG.rst
+index c84b30a..5b6d523 100644
+--- a/CHANGELOG.rst
++++ b/CHANGELOG.rst
+@@ -20,6 +20,8 @@ Deprecations:
+ Changes:
+ ^^^^^^^^
+ 
++- ``Context.set_tlsext_servername_callback`` now handles exceptions raised in the callback by calling ``sys.excepthook`` and returning a fatal TLS alert. Previously, exceptions were silently swallowed and the handshake would proceed as if the callback had succeeded.
++
+ - Expose wrappers for some `DTLS
+   <https://en.wikipedia.org/wiki/Datagram_Transport_Layer_Security>`_
+   primitives. `#1026 <https://github.com/pyca/pyopenssl/pull/1026>`_
+diff --git a/src/OpenSSL/SSL.py b/src/OpenSSL/SSL.py
+index 12374b7..6ef44d4 100644
+--- a/src/OpenSSL/SSL.py
++++ b/src/OpenSSL/SSL.py
+@@ -1,5 +1,6 @@
+ import os
+ import socket
++import sys
+ from sys import platform
+ from functools import wraps, partial
+ from itertools import count, chain
+@@ -1431,7 +1432,11 @@ class Context(object):
+ 
+         @wraps(callback)
+         def wrapper(ssl, alert, arg):
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
+index ccc8a38..77e1876 100644
+--- a/tests/test_ssl.py
++++ b/tests/test_ssl.py
+@@ -1884,6 +1884,56 @@ class TestServerNameCallback(object):
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
+ class TestApplicationLayerProtoNegotiation(object):
+     """
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb
index db0e809ef5..13d87939b6 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb
@@ -10,6 +10,10 @@ SRC_URI[sha256sum] = "660b1b1425aac4a1bea1d94168a85d99f0b3144c869dd4390d27629d00
 PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools3
 
+SRC_URI += " \
+    file://CVE-2026-27448.patch \
+"
+
 PACKAGES =+ "${PN}-tests"
 FILES:${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
 
-- 
2.25.1


