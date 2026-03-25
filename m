Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB4E7FEA822
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 07:24:02 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16878.1774423437404282963
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 00:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KrmKzPui;
 spf=pass (domain: mvista.com, ip: 209.85.214.178, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2adbfab4501so20898445ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 00:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774423436; x=1775028236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Td5pGLVPyK6NhT62bEwmgrF0yVxS9e5Dq2BgfbYOJpY=;
        b=KrmKzPuiHHwSouvLD2wk94cy9PMOlasvwtazM8dm3BJcmLzQag3XdlerT9LdCOSsv/
         xjOOdsL/Vi23n/s/5GVhbeXXtxFiRgygXnrNJ83ZNDD/mEKJBaXRMU8WTpmUQqeZrall
         4RA/E7a6/ZEYNvk8JKTB/YSbrnVZnFJlbu6qI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774423436; x=1775028236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Td5pGLVPyK6NhT62bEwmgrF0yVxS9e5Dq2BgfbYOJpY=;
        b=Fp4l7+7Slv9WqloVs9rTdjk5rZKfGV7iTzo4XjIDOHg2zXM2JfF66PL7feDBs3WjvB
         N8Lj18BYyDm0XOVT/hcoJl8Wy2idID96c7m75vtVJGiXbyKcyGwNHlgYNN0BDhbPMQj2
         T30OzxsCfmy+QwgynCk4aT9kqhOrF5jVbLlfRDlKOrKAAvHugO76zcjstW/df3oZwq8Y
         ozeh2TP+2sTlOihBDynioxAZ1MTfrojAbDbhMCRgW30OVUaHEpJh7uHJw7XzMnzjuRbu
         0zS5Anwt9np5LAR31IYNZTUZZOzox1/WQgMXrT+/ynXrSqJfTciK33pNSSRwr3Nu7S07
         qU3g==
X-Gm-Message-State: AOJu0YzrcnT8+0yBP8uAdrwiGsDqmVm+YSzB7h++46bAeFEvQofEOtvL
	6uYwv/ED/ZPcCoiGKX83CHvVHx5X8YZEqD3TH2d6VM/2Qu2nz3D/FIGvJjvX54x6x31Sud181xv
	P2ASt0eEWnw==
X-Gm-Gg: ATEYQzwx6DXtz9njFnE9z05a2/BlSM5tM8PME/0iuwRuV2XsWygYpkDdrFoaZnSMfle
	8xTVO8qJbDawiAN2JrRGcXRBKfKf92uL8IHwoaVftOwM1AUgJPawZ0+BDjBSSst3QvJ3shoGfy9
	F2ZB9E9mVrv0s37Fa+Vuru5hINzKEVH+qqKbKhMeD3/+cTxoM77CMDvGcCQMPocO9iZDQgbuCFD
	nCAhX9tprwA8dOQqV34/MdlNDa/tN0f2j4gBoOnhdwKRAtn3YjPDoyKRpW5B0Uvc5EkUPzzssGZ
	KiT0ix8cDbu9H1eXn6xffGUCL3pEE571uEx4TYII5ne/xhfizvhOVyZPeDdT3/19rvr85K1ZQ3C
	Atq/hF7Jpaqw0mR/zZ4YGrUjqAxIgdADlCY6KoF6USH3ZTaeKphbBoRrY/5Y19LxXg1zq/3b4TE
	NvoTkK9SMPrCx/mu9FM/5oVCp+nFnMXwjulL5J
X-Received: by 2002:a17:903:2291:b0:2b0:5b4e:3704 with SMTP id d9443c01a7336-2b0b0ab93c5mr29314655ad.36.1774423436256;
        Wed, 25 Mar 2026 00:23:56 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2406:7400:54:2bec:2fe1:f565:2db5:2818])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0a9801748sm57135535ad.17.2026.03.25.00.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:23:55 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 1/2] python3-pyopenssl: Fix CVE-2026-27448
Date: Wed, 25 Mar 2026 12:53:39 +0530
Message-ID: <20260325072340.112787-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 07:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233859

Pick patch mentioned in NVD

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-27448
[2] https://ubuntu.com/security/CVE-2026-27448

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python3-pyopenssl/CVE-2026-27448.patch    | 124 ++++++++++++++++++
 .../python/python3-pyopenssl_24.0.0.bb        |   4 +
 2 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch

diff --git a/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch b/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch
new file mode 100644
index 0000000000..87f46b4cb0
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
index 116f214bfa..bc0b568a46 100644
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
 
-- 
2.43.0


