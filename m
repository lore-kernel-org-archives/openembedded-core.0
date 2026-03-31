Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C87FF60D5
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 06:57:33 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14330.1774940251622091389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 23:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hIkiAMu6;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so240805e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 23:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774940249; x=1775545049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILnd2rVswjl9uGlcuyKTgq1kNzzjubpgOLOZCzpAf3k=;
        b=hIkiAMu6pVki6XtN/6YKjnzQuKbn3Qky2Ae2u87xKdGnVyNNYLkvINrnC3cCkCvsMV
         1PnTSS8o8TCzMD9zfz3jQyfVVFosliKUwS7Jx89Qb5zujX/PmIzf4zF5FovrotCX7gL1
         a/gKHmhQRm/HWbDHr0KcDg5c8pSZdplIm63sA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774940249; x=1775545049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ILnd2rVswjl9uGlcuyKTgq1kNzzjubpgOLOZCzpAf3k=;
        b=XwBhumoashCf/bL3KhTQi/eyQNBkgLHkKRnEy8MXqDYlKUM1AMoGaNl8w57XE8iyRX
         E34Ci/Jc9jlbnuZYOiUjrMdpmuF2drOre8Q3fPka2dtCDVGoW/1DBPGpBfqb5+RAfzrp
         GXJEVJMKpKj6jbou/yicmX8pMKTWWoUDUBLQ3EPqdMdSM+XsvkH4rsukQUEWokyqP2az
         zzVGfsOQquHAeWw5srtTGWdSIaBzD6d2OLbWuGLPY74FB/OBXUWAd657CsSv3GsYylrV
         CoJCd7PM3EIrWv8ThUiDFOqsR2uKfYA8W+DtZEHYARA1OODxH48thXPmXimA55/hsYQu
         +h0A==
X-Gm-Message-State: AOJu0YyHzXT6HyvpQNMhxesqiQzCaYCbdu6kq8VgahKpaNcsiO7a7msH
	1A3ibdxgA6+qhTdGJdI5MboPdhzsKzqrevH/L5Qx6GmKwiM59MMmr8IABmIOKUMWcmX1LFiEvLe
	2DRqQQUI=
X-Gm-Gg: ATEYQzyGTqKdUtGezcae0re2OsPUkcsEH/OeuvTYePexDDFb0nVzvRymWUT9O88rhxu
	KAfhyBeKUd7dSS3J9ymf5I52z+BjIwNrAZzVuAb97WYVoumvONn4UqV+1gqmFzW9tzZtVlDJJ6p
	OSNgSW6RJrvfWFCfWHRdM713CWZ4qtIW3FHUKuD4GmZ3zhnG76t00vo2lmMbZQf5kPnUnqipN6l
	QiwQeyUwc6TvDGMHBLQWJtkC5Wirlx3+9TAqrzzHhxEZkZ8pSlpfg+QZ3Q9RvW69WFIFVGI3F+s
	pVcUL7f0zE6AHKD1zcst5gMRBAfYcDUmxuErWWhaAcDqrqEqTSKKOVP7Tb3aAzm/GZcS8tuziH8
	hmpRX3efJLa9F4uJyUhdhbxEXsTQyVDwWfO/XyWikzzsd9MxjOCtGbgt9nA8eH61Z4yv+x0pzUl
	zpW2/jUNoWPxtUdYvFoclde3s0dnCdMNsSwzLDC1G06ETH358eEIiWYs/EnSTweGdjJ2rQq5olW
	m2RAowN8bLdwLiB6LHIj6kN+lc=
X-Received: by 2002:a05:600c:8489:b0:486:fbdb:b718 with SMTP id 5b1f17b1804b1-4872807483cmr258500365e9.25.1774940249397;
        Mon, 30 Mar 2026 23:57:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8a546esm11016455e9.5.2026.03.30.23.57.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 23:57:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 4/6] python3-pyopenssl: Fix CVE-2026-27448
Date: Tue, 31 Mar 2026 08:57:01 +0200
Message-ID: <6349510d2ae9d8f4ad1c52d7356d2359b7bf4826.1774939987.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774939987.git.yoann.congal@smile.fr>
References: <cover.1774939987.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 06:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234266

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch mentioned in NVD

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-27448
[2] https://ubuntu.com/security/CVE-2026-27448

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-pyopenssl/CVE-2026-27448.patch    | 124 ++++++++++++++++++
 .../python/python3-pyopenssl_24.0.0.bb        |   4 +
 2 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch

diff --git a/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch b/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch
new file mode 100644
index 00000000000..87f46b4cb0f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch
@@ -0,0 +1,124 @@
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
+index 6e23770..12e60e4 100644
+--- a/CHANGELOG.rst
++++ b/CHANGELOG.rst
+@@ -18,6 +18,7 @@ Changes:
+ 
+ - Added ``OpenSSL.SSL.Connection.get_selected_srtp_profile`` to determine which SRTP profile was negotiated.
+   `#1279 <https://github.com/pyca/pyopenssl/pull/1279>`_.
++- ``Context.set_tlsext_servername_callback`` now handles exceptions raised in the callback by calling ``sys.excepthook`` and returning a fatal TLS alert. Previously, exceptions were silently swallowed and the handshake would proceed as if the callback had succeeded.
+ 
+ 23.3.0 (2023-10-25)
+ -------------------
+diff --git a/src/OpenSSL/SSL.py b/src/OpenSSL/SSL.py
+index 4db5240..a6263c4 100644
+--- a/src/OpenSSL/SSL.py
++++ b/src/OpenSSL/SSL.py
+@@ -1,5 +1,6 @@
+ import os
+ import socket
++import sys
+ import typing
+ from errno import errorcode
+ from functools import partial, wraps
+@@ -1567,7 +1568,11 @@ class Context:
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
+index ca5bf83..55489b9 100644
+--- a/tests/test_ssl.py
++++ b/tests/test_ssl.py
+@@ -1855,6 +1855,56 @@ class TestServerNameCallback:
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
diff --git a/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
index 116f214bfa8..bc0b568a46a 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
@@ -10,6 +10,10 @@ SRC_URI[sha256sum] = "6aa33039a93fffa4563e655b61d11364d01264be8ccb49906101e02a33
 PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools3
 
+SRC_URI += " \
+    file://CVE-2026-27448.patch \
+"
+
 PACKAGES =+ "${PN}-tests"
 FILES:${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
 

