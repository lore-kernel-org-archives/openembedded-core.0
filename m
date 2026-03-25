Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC42AFEA81E
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 07:24:02 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16881.1774423441634813139
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 00:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OVdoZJl8;
 spf=pass (domain: mvista.com, ip: 209.85.215.178, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c757a9251faso1824471a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 00:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774423440; x=1775028240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEBm79Z4q3mIBPQEbP+7CajHLORyOf5jcrE+XDWdRhM=;
        b=OVdoZJl837SFtXwaqZkRjDQoINKKjPdxN5L9KG/NvkQxfgLroM9ayAELgWGD9xhWyP
         QUdrNTRpeSAkQdbpaxgD61KkxExk74iY0x6KWS6uiXbF8MlOBq8nyg2hsTtxjU8J8eGJ
         00Q1YkY7Ip9iTnJUlVZbmYOaPvjOifeG0mN/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774423440; x=1775028240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EEBm79Z4q3mIBPQEbP+7CajHLORyOf5jcrE+XDWdRhM=;
        b=CH4lM1ASUiWKwRcMlV4GwueIpJbOvN4lrZAkF/Yy5b4Rt3gv7dYdGq6j42JRyK51Xj
         LhPkKNoB0PSYVzfspKTgO4ou9MSBqbWeneeGQmfAe2DOT5eO4DmN1BJG6aAkYoW9vbiM
         eMO9wevz8O6zIJAjPL2uIEzhYzsAVlxQj9h1aR7P09gfbqs5Z5vaJtCTTOzSWXFgTGLU
         SI8WVWSQoalqBvW9NpgQf6etFPPVCmZDadHuy1SM7PAwXQ7eMTN9Dxf0Sn+YDQZkF4u7
         oEyYRUgsUu2My7+BJWmZDQE+Q1ptWPa+4jieWUU/kl5v3PF7yRu1epw0ZgZBabrtmHJ/
         KcnQ==
X-Gm-Message-State: AOJu0YxdmxeVSLDWTiObnD58nVJ8Re/rghB24RQ3GiFHYzbFymPUBppy
	L2jKO4KGaeTxgul4/6tPenqNZAvxSC6MRkvbsQcAPN3iof7r9pOdn0/YtDph1zvi3LmCwmYpPVH
	u1rCIN/eeTA==
X-Gm-Gg: ATEYQzxp4A7rXk1oIQClKPCqrJzo3rrtC/LWTggpOjQAIOQobRwSI4dhDclBL0vFz/e
	zrzeEhuSFjjgZNa6ncPKqXh1ALZvL7jA0YtSo7wBYxIQMQwgYlMgPi27EcF9MTbYcsETf7cbsVD
	oMy5mlrvu7duv/6YJ1hffZJZaXIqxRWtmL5qZRcyAXexAoBohOgjOGGKe4OVGBcf052sMRtSrwX
	/Pe+eJj8bFVs/elMTfc+kyMJqmMA4pQngG0/kmNqBfLwtP9oOKjtqVcixpB/jLd4gWxgHQaf4Lj
	hzHu2GrOFJxVIGfwEIn5IQ7Cnu3k3rlE6MZbIojWiykgksxUzqao5DJaBeJuzuAFIo273fcYoM6
	hKIhf0hhCOTItFtPp4n8VEpwFx0DQVT/kv8JGT0zpK8e1OGhu6mtrNCrB6Y48MwEl2o/2v/Ke95
	w3RbU+dyKJL0oGIiO8prmaKtuS+V3P01xh0b2l
X-Received: by 2002:a17:902:c943:b0:2ae:567f:fd7e with SMTP id d9443c01a7336-2b0b09a717fmr29544675ad.4.1774423440268;
        Wed, 25 Mar 2026 00:24:00 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2406:7400:54:2bec:2fe1:f565:2db5:2818])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0a9801748sm57135535ad.17.2026.03.25.00.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:23:59 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 2/2] python3-pyopenssl: Fix CVE-2026-27459
Date: Wed, 25 Mar 2026 12:53:40 +0530
Message-ID: <20260325072340.112787-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325072340.112787-1-vanusuri@mvista.com>
References: <20260325072340.112787-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 07:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233860

Pick patch mentioned in NVD

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-27459
[2] https://ubuntu.com/security/CVE-2026-27459

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python3-pyopenssl/CVE-2026-27459.patch    | 109 ++++++++++++++++++
 .../python/python3-pyopenssl_24.0.0.bb        |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch

diff --git a/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch b/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch
new file mode 100644
index 0000000000..f75540f96e
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
index bc0b568a46..94a70aa17d 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
@@ -12,6 +12,7 @@ inherit pypi setuptools3
 
 SRC_URI += " \
     file://CVE-2026-27448.patch \
+    file://CVE-2026-27459.patch \
 "
 
 PACKAGES =+ "${PN}-tests"
-- 
2.43.0


