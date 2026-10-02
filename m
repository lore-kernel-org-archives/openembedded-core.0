Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 620EACA5FDD
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 12:40:17 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11062.1790944814611212395
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 05:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=zlJJ86W2;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3CA124E4110E;
	Fri,  2 Oct 2026 12:40:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0283D603DC;
	Fri,  2 Oct 2026 12:40:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDA0E103281D8;
	Fri,  2 Oct 2026 14:40:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790944807; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=cwRcSkoku3L664ZOOusQq5K64BHvcMiZhyIkI7pbYwo=;
	b=zlJJ86W2kyOgMHsJ1QkqXvLp8O5vyWqdo0Te2m/iAdulYm8H/C1g5GGJWWYHWxdOWL19O1
	JniQ7fsdFRWeENBTbVL/nq705eJVaOsJouBD7VgrJssZ4xuf1pp8ZecvbaMDKITMueMzvY
	tKk+HMQkLZ5+vq+kPYQeR/mlMffIZFv5h4jO/XdCCGEUxhA80HPSHQ1hCEDEoMF40PYGHN
	2HVVo1CS6rrv8bdgq6O0k4Cw3L6Q/iIDTnyo2/h9dJXTySMcHkjHViO1ual4PljASWlbyT
	xtudm1IBTCIb7j3sDQd1FScMfd/ETIS7woct8cN6y3eUyanHyQe9w3v9CR0oFQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH] python3: fix CVE-2026-19445
Date: Fri,  2 Oct 2026 14:39:43 +0200
Message-ID: <20261002123943.2208277-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 12:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247116

From: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.costa@bootl=
in.com>

This critical vulnerability [1] was fixed originally on 3.14, and then ba=
ckported to
3.12 through a PR (already merged) [2]:

"[3.12] gh-156293: Use-after-free for server-side SSLContext with sni_cal=
lback"

Backport the fix to oe-core's v3.12.14.

[1] https://security-tracker.debian.org/tracker/CVE-2026-19445
[2] https://github.com/python/cpython/pull/158517

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 .../python/python3/CVE-2026-19445.patch       | 265 ++++++++++++++++++
 .../python/python3_3.12.14.bb                 |   1 +
 2 files changed, 266 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-19445.p=
atch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-19445.patch b/=
meta/recipes-devtools/python/python3/CVE-2026-19445.patch
new file mode 100644
index 0000000000..40fe283ba6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-19445.patch
@@ -0,0 +1,265 @@
+From 61ba3afbaab1394b5e47402e5122cb5c55d4884f Mon Sep 17 00:00:00 2001
+From: Seth Michael Larson <seth@python.org>
+Date: Wed, 30 Sep 2026 10:53:31 -0500
+Subject: [PATCH] [3.12] gh-156293: Use-after-free for server-side SSLCon=
text
+ with sni_callback
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-19445
+Upstream-Status: Backport [https://github.com/python/cpython/pull/158517=
]
+
+Co-authored-by: Gregory P. Smith <68491+gpshead@users.noreply.github.com=
>
+Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.c=
osta@bootlin.com>
+---
+ Doc/library/ssl.rst                           | 11 +++
+ Lib/test/test_ssl.py                          | 80 +++++++++++++++++++
+ ...-08-10-12-00-00.gh-issue-156293.sNIcbk.rst |  7 ++
+ Modules/_ssl.c                                | 40 +++++++---
+ 4 files changed, 126 insertions(+), 12 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-08-10-12-00-00.gh-iss=
ue-156293.sNIcbk.rst
+
+diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst
+index 67360a5079f..71199ceabc6 100644
+--- a/Doc/library/ssl.rst
++++ b/Doc/library/ssl.rst
+@@ -1666,6 +1666,12 @@ to speed up repeated connections from the same cl=
ients.
+    :class:`SSLContext` representing a certificate chain that matches th=
e server
+    name.
+=20
++   If the callback assigns a new context to :attr:`SSLSocket.context`, =
any
++   further ClientHello message on the same connection (for example afte=
r a
++   TLS 1.3 HelloRetryRequest) is dispatched to the new context's
++   *sni_callback*, if it has one; the original callback is not called a=
gain
++   for that connection.
++
+    Due to the early negotiation phase of the TLS connection, only limit=
ed
+    methods and attributes are usable like
+    :meth:`SSLSocket.selected_alpn_protocol` and :attr:`SSLSocket.contex=
t`.
+@@ -1689,6 +1695,11 @@ to speed up repeated connections from the same cl=
ients.
+=20
+    .. versionadded:: 3.7
+=20
++   .. versionchanged:: next
++      After the callback assigns a new :attr:`SSLSocket.context`, later
++      ClientHello messages on the connection are dispatched to the new
++      context's *sni_callback*.
++
+ .. attribute:: SSLContext.set_servername_callback(server_name_callback)
+=20
+    This is a legacy API retained for backwards compatibility. When poss=
ible,
+diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
+index b13e37d0cd1..accc030d2f3 100644
+--- a/Lib/test/test_ssl.py
++++ b/Lib/test/test_ssl.py
+@@ -1818,6 +1818,86 @@ class SSLObjectTests(unittest.TestCase):
+         c_in.write(s_out.read())
+         client.unwrap()
+=20
++    def test_sni_callback_context_released_and_callback_raises(self):
++        # Variant of the test below without a HelloRetryRequest: the ca=
llback
++        # switches the connection to another context, drops the last
++        # references to the context that carries it, and raises.  The C
++        # callback must not touch that context after the Python callbac=
k
++        # returned.
++        client_ctx, server_ctx, hostname =3D testing_context()
++        leaf_ctx =3D server_ctx
++
++        def sni_cb(sslobj, server_name, ctx):
++            sslobj.context =3D leaf_ctx
++            del ctx
++            raise LookupError("no certificate for " + repr(server_name)=
)
++
++        def make_server():
++            dispatch_ctx =3D ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
++            dispatch_ctx.load_cert_chain(SIGNED_CERTFILE)
++            dispatch_ctx.sni_callback =3D sni_cb
++            s_in, s_out =3D ssl.MemoryBIO(), ssl.MemoryBIO()
++            server =3D dispatch_ctx.wrap_bio(s_in, s_out, server_side=3D=
True)
++            return server, s_in, s_out
++
++        server, s_in, s_out =3D make_server()
++        c_in, c_out =3D ssl.MemoryBIO(), ssl.MemoryBIO()
++        client =3D client_ctx.wrap_bio(c_in, c_out, server_hostname=3Dh=
ostname)
++        with self.assertRaises(ssl.SSLWantReadError):
++            client.do_handshake()
++        s_in.write(c_out.read())
++        with support.catch_unraisable_exception() as cm:
++            with self.assertRaises(ssl.SSLError):
++                server.do_handshake()
++            self.assertIsInstance(cm.unraisable.exc_value, LookupError)
++        self.assertIs(server.context, leaf_ctx)
++
++    def test_sni_callback_context_released_before_second_client_hello(s=
elf):
++        # The SSLContext carrying sni_callback may be released by the
++        # application once the callback has switched the connection ove=
r to
++        # another context.  If the server then sends a HelloRetryReques=
t, the
++        # second ClientHello makes OpenSSL consult the original SSL_CTX=
's
++        # servername callback again; that must not use the deallocated
++        # SSLContext object.
++        client_ctx, leaf_ctx, hostname =3D testing_context()
++        calls =3D []
++
++        def make_server():
++            dispatch_ctx =3D ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
++            dispatch_ctx.load_cert_chain(SIGNED_CERTFILE)
++            # Force a HelloRetryRequest: the client offers an X25519 ke=
y
++            # share first, the server only accepts P-384.
++            dispatch_ctx.set_ecdh_curve("secp384r1")
++            def sni_cb(sslobj, server_name, ctx):
++                calls.append(server_name)
++                sslobj.context =3D leaf_ctx
++            dispatch_ctx.sni_callback =3D sni_cb
++            s_in, s_out =3D ssl.MemoryBIO(), ssl.MemoryBIO()
++            server =3D dispatch_ctx.wrap_bio(s_in, s_out, server_side=3D=
True)
++            return server, s_in, s_out, weakref.ref(dispatch_ctx)
++
++        # After this only the C-level SSL object references dispatch_ct=
x.
++        server, s_in, s_out, dispatch_ref =3D make_server()
++        c_in, c_out =3D ssl.MemoryBIO(), ssl.MemoryBIO()
++        client =3D client_ctx.wrap_bio(c_in, c_out, server_hostname=3Dh=
ostname)
++        for _ in range(10):
++            for obj, out, peer_in in ((client, c_out, s_in),
++                                      (server, s_out, c_in)):
++                try:
++                    obj.do_handshake()
++                except ssl.SSLWantReadError:
++                    pass
++                if out.pending:
++                    peer_in.write(out.read())
++        client.do_handshake()
++        server.do_handshake()
++        support.gc_collect()
++        self.assertIsNone(dispatch_ref())
++        self.assertGreaterEqual(len(calls), 1)
++        self.assertEqual(calls[0], hostname)
++        self.assertIs(server.context, leaf_ctx)
++        self.assertIsNotNone(client.cipher())
++
+ class SimpleBackgroundTests(unittest.TestCase):
+     """Tests that connect to a simple server running in the background"=
""
+=20
+diff --git a/Misc/NEWS.d/next/Security/2026-08-10-12-00-00.gh-issue-1562=
93.sNIcbk.rst b/Misc/NEWS.d/next/Security/2026-08-10-12-00-00.gh-issue-15=
6293.sNIcbk.rst
+new file mode 100644
+index 00000000000..0cc620b3fdc
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-08-10-12-00-00.gh-issue-156293.sNIc=
bk.rst
+@@ -0,0 +1,7 @@
++Fix a crash in :mod:`ssl` when an :attr:`~ssl.SSLContext.sni_callback`
++switches a connection to another :class:`~ssl.SSLContext` and the conte=
xt
++that carries the callback is no longer referenced by the application.
++Servers that keep their ``sni_callback`` context alive (the usual case =
when
++it wraps the listening socket or is stored on the server object) were n=
ot
++affected.
++This addresses :cve:`2026-19445`.
+diff --git a/Modules/_ssl.c b/Modules/_ssl.c
+index aae4dc323dd..91ca1362d4e 100644
+--- a/Modules/_ssl.c
++++ b/Modules/_ssl.c
+@@ -3184,6 +3184,9 @@ context_dealloc(PySSLContext *self)
+     /* bpo-31095: UnTrack is needed before calling any callbacks */
+     PyObject_GC_UnTrack(self);
+     context_clear(self);
++    /* The SSL_CTX may outlive this object as the session_ctx of socket=
s that
++       were switched to another context; leave no Python callback behin=
d. */
++    SSL_CTX_set_tlsext_servername_callback(self->ctx, NULL);
+     SSL_CTX_free(self->ctx);
+     PyMem_FREE(self->alpn_protocols);
+     Py_TYPE(self)->tp_free(self);
+@@ -4346,27 +4349,37 @@ _ssl__SSLContext_set_ecdh_curve(PySSLContext *se=
lf, PyObject *name)
+ }
+=20
+ static int
+-_servername_callback(SSL *s, int *al, void *args)
++_servername_callback(SSL *s, int *al, void *Py_UNUSED(args))
+ {
+     int ret;
+-    PySSLContext *sslctx =3D (PySSLContext *) args;
++    PySSLContext *sslctx;
+     PySSLSocket *ssl;
+     PyObject *result;
+     /* The high-level ssl.SSLSocket object */
+     PyObject *ssl_socket;
++    PyObject *sni_cb;
+     const char *servername =3D SSL_get_servername(s, TLSEXT_NAMETYPE_ho=
st_name);
+     PyGILState_STATE gstate =3D PyGILState_Ensure();
+=20
+-    if (sslctx->set_sni_cb =3D=3D NULL) {
+-        /* remove race condition in this the call back while if removin=
g the
+-         * callback is in progress */
++    /* Do not use the SSL_CTX's servername arg to find the context: it =
is a
++       borrowed pointer to whichever _SSLContext installed the callback=
, and
++       that object may already be gone while OpenSSL still reaches this
++       callback through the connection's session_ctx (e.g. on the secon=
d
++       ClientHello after a HelloRetryRequest, once sni_callback has swi=
tched
++       the socket to another context).  The socket's current context is
++       always alive; hold strong references to it and to the callback w=
hile
++       they are used here. */
++    ssl =3D SSL_get_app_data(s);
++    assert(ssl !=3D NULL);
++    sslctx =3D (PySSLContext *)Py_NewRef(ssl->ctx);
++    assert(Py_IS_TYPE(ssl, get_state_ctx(sslctx)->PySSLSocket_Type));
++    sni_cb =3D Py_XNewRef(sslctx->set_sni_cb);
++    if (sni_cb =3D=3D NULL) {
++        Py_DECREF(sslctx);
+         PyGILState_Release(gstate);
+         return SSL_TLSEXT_ERR_OK;
+     }
+=20
+-    ssl =3D SSL_get_app_data(s);
+-    assert(Py_IS_TYPE(ssl, get_state_ctx(sslctx)->PySSLSocket_Type));
+-
+     /* The servername callback expects an argument that represents the =
current
+      * SSL connection and that has a .context attribute that can be cha=
nged to
+      * identify the requested hostname. Since the official API is the P=
ython
+@@ -4387,7 +4400,7 @@ _servername_callback(SSL *s, int *al, void *args)
+         goto error;
+=20
+     if (servername =3D=3D NULL) {
+-        result =3D PyObject_CallFunctionObjArgs(sslctx->set_sni_cb, ssl=
_socket,
++        result =3D PyObject_CallFunctionObjArgs(sni_cb, ssl_socket,
+                                               Py_None, sslctx, NULL);
+     }
+     else {
+@@ -4410,14 +4423,14 @@ _servername_callback(SSL *s, int *al, void *args=
)
+         }
+         Py_DECREF(servername_bytes);
+         result =3D PyObject_CallFunctionObjArgs(
+-            sslctx->set_sni_cb, ssl_socket, servername_str,
++            sni_cb, ssl_socket, servername_str,
+             sslctx, NULL);
+         Py_DECREF(servername_str);
+     }
+     Py_DECREF(ssl_socket);
+=20
+     if (result =3D=3D NULL) {
+-        PyErr_WriteUnraisable(sslctx->set_sni_cb);
++        PyErr_WriteUnraisable(sni_cb);
+         *al =3D SSL_AD_HANDSHAKE_FAILURE;
+         ret =3D SSL_TLSEXT_ERR_ALERT_FATAL;
+     }
+@@ -4438,11 +4451,15 @@ _servername_callback(SSL *s, int *al, void *args=
)
+         Py_DECREF(result);
+     }
+=20
++    Py_DECREF(sni_cb);
++    Py_DECREF(sslctx);
+     PyGILState_Release(gstate);
+     return ret;
+=20
+ error:
+     Py_DECREF(ssl_socket);
++    Py_DECREF(sni_cb);
++    Py_DECREF(sslctx);
+     *al =3D SSL_AD_INTERNAL_ERROR;
+     ret =3D SSL_TLSEXT_ERR_ALERT_FATAL;
+     PyGILState_Release(gstate);
+@@ -4480,7 +4497,6 @@ set_sni_callback(PySSLContext *self, PyObject *arg=
, void *c)
+         }
+         self->set_sni_cb =3D Py_NewRef(arg);
+         SSL_CTX_set_tlsext_servername_callback(self->ctx, _servername_c=
allback);
+-        SSL_CTX_set_tlsext_servername_arg(self->ctx, self);
+     }
+     return 0;
+ }
diff --git a/meta/recipes-devtools/python/python3_3.12.14.bb b/meta/recip=
es-devtools/python/python3_3.12.14.bb
index 14be125180..bf2c7938b5 100644
--- a/meta/recipes-devtools/python/python3_3.12.14.bb
+++ b/meta/recipes-devtools/python/python3_3.12.14.bb
@@ -36,6 +36,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
            file://0001-test_readline-skip-limited-history-test.patch \
            file://CVE-2026-6019_p1.patch \
            file://CVE-2026-6019_p2.patch \
+           file://CVE-2026-19445.patch \
            "
=20
 SRC_URI:append:class-native =3D " \
--=20
2.55.0


