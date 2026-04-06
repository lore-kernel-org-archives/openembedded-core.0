Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE9DEF4EA6
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 06:27:39 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49553.1775456856586675280
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 23:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MpEc/g3/;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4888375f735so32383875e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 23:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775456855; x=1776061655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGwAQjzppj08vZE+eBqJn8AJRwFKcPlSu7fv234ON6o=;
        b=MpEc/g3/ftdSs36H5pnJsheHHVSZpqbG6d5B2wxUyPmPwnHvj3wWJLvPJNwbJ+mtF3
         Pw3Y1O7BQH1XgCR6czIeNi52wlfkvJvYQfafkX3ugDeUNW3uKLbj5YQp6d7UF9TjLsdP
         MLk656JPzR3ua6FHwcljSkODvzdxu4EDtS8Ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775456855; x=1776061655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PGwAQjzppj08vZE+eBqJn8AJRwFKcPlSu7fv234ON6o=;
        b=bopwVpQtIFAfiouoKZcyOm81a7B+30RXgrugEaWSC55CZ9PMbkJmx2mD7uH+0sA5mv
         wyr81V4HrtMxi0gZvlW0TpXCr1OYZQMNJjtGt7JML44jVB47h4L++HtdlP61rwCTG8uW
         qxq6k1+X9koG1+FWKKGwv0Asm37ls24irYXLsVeIZ55lKHnFXw5rJiLGXJXf035rXlxl
         hOrg0s8K8/NnalgSC74JegIKdj0aSPu5tmRMbJVifAFcoZES1sH2nLnYO4fdlbqFIxOk
         /NOh1ylrceOGSovXUZBR0HSMETsR6Zkhz5nhluZyNtqY9UrCQzHQ7uuz9ed02U0ll6ZA
         iX1w==
X-Gm-Message-State: AOJu0YzH9g/3xBsaywjO6KuTO2GytMYqHDMFHdWIS8SnAdb8F/5Vlx0e
	0rgJ4JEL76PMnvrHwRTlgWl6bksyjdBnuBZDCy6h0fKhbarn19+2O+9yXy+DDIZaTyYA/H600cC
	H7nhHktA=
X-Gm-Gg: AeBDievo1aUtEnA2OgZ0yfE/TIYDnBqGz6seakVs1LYuxGRIo9r2QrQYputESApBfIh
	51wDun7u4Qx29SO/NDt2wBj7gFhfXfNwMaJqhEYyO/dwu/S9L6oFm9OxR37Tdi0H4sxhfkJZPV1
	xT8K1wNOd5gVnPjubzYGipNzLTfTpXcrYU0qU82lWrUg8zRAEK5Qidg+9T6ynvuuElZKHzg2wxK
	ou8aeT83fGC/l5rthBr9a1Mj4YfbaqrEHUK8RaGar2tCVLpX+i+glhFtJAPg6TfUOiAeKtNbdj8
	w0dzHl5T7+5vJ+bMDSTeT+Z8AfBbqitDH7JTCbYeEFkWC/9ntGKxOAtxF/MEitXhu98L7Sew4OF
	XFixfeB3Xec+YoYVDQ0EvSiaxhrkpd/Sz27QZPCJRHwTWf66zvPUIYkfdWAF//vTwPij/6lLTWy
	bBJitI2ScVSWQMgE8EKcPV0NUzU0q7RVQ7JOl6i3Jp9jEQK2lYFbrDyie4Ga0VvvJhX9PrPE+LO
	nO+xEImL2RLkmqqevohvYNiXbw=
X-Received: by 2002:a05:600c:4f15:b0:488:945a:ed63 with SMTP id 5b1f17b1804b1-488995cbaa7mr179717425e9.0.1775456854637;
        Sun, 05 Apr 2026 23:27:34 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899eab0f7sm84273785e9.29.2026.04.05.23.27.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:27:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/18] python3-pyopenssl: Fix CVE-2026-27448
Date: Mon,  6 Apr 2026 08:26:38 +0200
Message-ID: <2d2cd3e06323a6b12db80cd3b359c0d550996e5f.1775435063.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775435063.git.yoann.congal@smile.fr>
References: <cover.1775435063.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234655

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch mentioned in NVD

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-27448
[2] https://ubuntu.com/security/CVE-2026-27448

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-pyopenssl/CVE-2026-27448.patch    | 125 ++++++++++++++++++
 .../python/python3-pyopenssl_22.0.0.bb        |   4 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch

diff --git a/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch b/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch
new file mode 100644
index 00000000000..4a06e2c0201
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
index db0e809ef54..13d87939b62 100644
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
 

