Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF76AF364D9
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:27 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.144831.1775776282587513977
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zhZrdaJy;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488a29e6110so16179595e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776281; x=1776381081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGwAQjzppj08vZE+eBqJn8AJRwFKcPlSu7fv234ON6o=;
        b=zhZrdaJyy20xXvvqR5rFjvC2gQ0CbA7r9znhLu+GZZ1YOqycNscJYxjSK43EJ0QDpL
         0o6F18J3NzzTVT1gaV4ZO1T3XgqkkeZhMhUZ7RLbob8Gp0fQ9XJbT3g+BAmI2Zu4WI2Q
         0BawUnbhAhpWyAaBGotf/eCvsU3lwi/mbkzO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776281; x=1776381081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PGwAQjzppj08vZE+eBqJn8AJRwFKcPlSu7fv234ON6o=;
        b=BahDehukgR4gBGNuZPzlZOOMknJk3mEuwMg1kpBgnJMKHoikPiKQLyjKiBQ29HbGzt
         7aZoZSC8u2hRy4hx+q1Ac099THYiOwbISRZuJIQXgLGl+m8yJPSO9kFSxaKOSO1vwxqo
         RW8ZbCyulxlzFqtXgcGcshItoWTEfPmMMcHvvzQjnVjIcR/Qu53n8Kc1MEKppa+VNC+P
         1TrF9wEZQ4aBARbV3U7W5RiwiVS9Ct8EY6L/qnnjc8NRoB5lllYauauw52cndy7eHCiu
         wC7p94WlBvMhSGzgJ61wD1cG9mwsXNjXEV1wK6d73MhP52oEewjTnqemB/K6pd1kK+yk
         97bg==
X-Gm-Message-State: AOJu0YxEhp0m8bSmFa/0a9blXtIqUGclo3Bmb9jtUSvzTexlkkVD2Tok
	pzJHel64yOO/bXq9jOFrPb0UFy2GE5hXx4ictmEik/hqu2seCh/81R5yrBXDKHD1aJaAMl9U3x7
	TeTxvG42m7jP6
X-Gm-Gg: AeBDievikYPHQFoq2VnDlWH50rhLUN1Vk3glssuMa3XNJn+nnq+cf9XUABJDJ6pKNON
	u+a+afeDppLHyAJg9nxZCxcBMMt6k0CnV5NidMAI80x5+McnhlYZ4zevsD8iLhdMIoWOHntOV5m
	UxUkxojY6YUurSCrDisIzET69IZZ5D5FKM0UIyr5JcBgawWopdwqLB75FOUIyH4Lqo47PBY1Lni
	vVTmrj0RogrGFGFcdR5g+LHQFm5R5UNFOrhybomBauSC42Sy4K4TFR+NHzNaxxzWFe52jy19C5O
	z8byFWqPdrGodhiqITwpvqDJWmhxUvT2456p/+oD5JIlYyXBBxSuHM99j1TWFf/1IjJnShvIyuC
	kyFTMFa3xPvfQZMOHMHBjHSRnMT614mZhRZl6y71Fx01E687QnShVTWui3h7QEYl7pyG6gIlxca
	76wdxHzCx/wZhBlznvIj7dGo7QN15DhmPAZCQuA3S5kJttdSA5Y5cR5uGjWt1M2cjRVbWAyHTFj
	t7FDTCAqo7NoNymlUo5hdE7050y
X-Received: by 2002:a05:600c:19cf:b0:485:4453:401d with SMTP id 5b1f17b1804b1-488d67ebc79mr7488875e9.2.1775776280639;
        Thu, 09 Apr 2026 16:11:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 09/30] python3-pyopenssl: Fix CVE-2026-27448
Date: Fri, 10 Apr 2026 01:10:09 +0200
Message-ID: <c95d2068281fd88427a2e0a996d69c3898473e63.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234968

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
 

