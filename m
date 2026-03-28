Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D54A10F3DC8
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 02:12:04 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3975.1774663915444515805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 19:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=UDrUjzVq;
 spf=pass (domain: mvista.com, ip: 209.85.208.52, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66ad907833dso4693535a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 19:11:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774663914; cv=none;
        d=google.com; s=arc-20240605;
        b=d3oqE362QpcrEkVb3BBqKZ2/h8d9NOlyKgZqgwMetfq5f0VjAKq6jJIFkheJ3/cLKI
         GrPIhhXY7oLtxPBZI/R06O8jOPgeSec2au7rqP9HXcGWSCiWhwBSkldNYFnvNm+BV77b
         +4+nUMzObG7G8a1bFepAD8NzqC5Y68sWPcs3rljnTTuVeoT0Qcx5MQPjuK3qeDGtNruj
         qVbHKHYslCd6LH0vEbZ4puckjtumLJONnGNCU/kDlu6vhlBRKrhdVZEfuasV74bDsIqi
         /kA5c2wYDTsnyJdlgz2gS4Tgdqo40ZYff9NOzoNBf63JFqdLPfbsAr/Wf/c8I5R36uDG
         J2sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aBDDgryd4A9pjRTAm1wRzxtfziATr2w4ImS+GNZ5lMA=;
        fh=asqV5XwkQ3j1DNjI0AxRPYfk3NtHNhY/iAvm1HVGsgw=;
        b=Q7qaobLd2Xi3hqr9IkA4ppTZxlJXucg44RQUa/6FHfX0skIkoLpJ54njEq93x8hbr+
         Ybff+gon6dfIUSGHoSDdvBuQz+33ma/288auyfBh/B9Be8Bq91ZXFkXhp1Gl50sBOZch
         qH+ndad/W1tnuoFt2vT2Kl6k08GpXEPi3binE2SydXlHqdT8KcIYGgYkUHsIp4t9Bp8C
         O0sPC+SDpJe8As89333PMpGScRvft0qdsJHeb91o6SRv3L0O40CprkMpaPGWv9NL6K27
         3BBUvn15BfaykWRnoJCTZtENmUs7p4XLZ2l5gsaFXWtMMyqHSLW2grT8gOPM/O/1iNfn
         Saww==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774663914; x=1775268714; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aBDDgryd4A9pjRTAm1wRzxtfziATr2w4ImS+GNZ5lMA=;
        b=UDrUjzVqnVUOsEfuKAGwFPFiQHioHpZCRnAdFKC5Ng5h5VY8mirNr0wgCXHTD3uVeH
         Z18jAAEZ9Z21FIlXI6yfE9is5jXk4jIlLg0frjZf8RQxyDSMn0/i+dOCU+Gv/5OVe8QX
         NO1exzhj0YyS742ILxAOBl5llBDWEczNmnaEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774663914; x=1775268714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBDDgryd4A9pjRTAm1wRzxtfziATr2w4ImS+GNZ5lMA=;
        b=WMQjVuEZK4pQOsAeEyaLp5bLIc+VkwBugtqXCbtwgn7CG/Z0KrjWWCqJdErgt9yEIj
         QvMljScwViO96GdcET24JyE7NI+E1zyg2KJhcGANm6gCFr8tGnfk+RsdPltdoEQv6hMr
         DFPVlQLSSF1s1oVFbROyTTu1R9hipCKiR/rhkRPdgdgBvNjsqebcYYrsTNGtiXCj269t
         ppg6Iejo1DdFuJGClwvjXTGd42dPL60sZP2kEn/nv72zNyJqpei+62zim8VOrL/KiIit
         KySCY3/07tvVBb4oWQDghL6GD3NYfM5hcEc6TditCwsIuZJ764Ut6uoncoZjguZb1GfP
         8Dig==
X-Gm-Message-State: AOJu0YxozwINqxegtiTqQwTSkFUZfUwAIlF2YJFb0CmXLqF7J/NkuAAI
	6Vxv3bWeBybM90i/7w8XLX6y1H/yYzp1rpTOKbiitGzIiy+QRpk14oFw3DrBVhBU5uUSNyTm60K
	s0v7CNyp9mC1+e6K5E6HDyKC55V6jlJApsad5Gt8mEA==
X-Gm-Gg: ATEYQzx8PHevdZ7H4xKocgn+Bh4b8XGLhN2y3R8/hLzlW34nGdv7fIHoxrIt8N8xt7z
	Pu3OitxeBtG4U1P6VBmKGgZY7xWMcIXjVKzhmIuil29zk+BomIXo6hitENP2hq2FHaQWM8ALLDE
	kRWk0pRm98qJHAtr0k0GoZO4zU7mOFOF7CBVegLjMFnlR/8z61ITUHGwdPut+nbRUT0vTh0jXY/
	PYuAoqwry6Z7grAhFn7SnGuQ3Rr3b8fNaAXALJ2AuDSVJQqTksNLqsmrWD2kl9A5F3LysYPA5V4
	VBVHqM7TFuQcE16q6jA=
X-Received: by 2002:a05:6402:2554:b0:65f:71ed:7ab9 with SMTP id
 4fb4d7f45d1cf-66b28b5d311mr2769742a12.22.1774663913465; Fri, 27 Mar 2026
 19:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260325072340.112787-1-vanusuri@mvista.com> <DHDY9F8XP2QC.1FPKRXZ97INT7@smile.fr>
In-Reply-To: <DHDY9F8XP2QC.1FPKRXZ97INT7@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Sat, 28 Mar 2026 07:41:42 +0530
X-Gm-Features: AQROBzAdo8FOUWwRl70I8-mlyOK2WOkDOJ8Kj-rc2OIx8pxAkqQnkJheo1ENDvI
Message-ID: <CANQUz18HaAotXzEKD+CaNxfNk+1a7sQzE3E7W51NGMCTjcqTjQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][patch 1/2] python3-pyopenssl: Fix CVE-2026-27448
To: Yoann Congal <yoann.congal@smile.fr>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000287889064e0c24bf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 02:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234114

--000000000000287889064e0c24bf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

As kirkstone LTS going to end this month,  I've sent patches for both
kirkstone and scarthgap first.

I will send patches for whinlatter soon.

Thanks for reminding me.

Thanks & Regards,
Vijay

On Sat, 28 Mar, 2026, 4:53=E2=80=AFam Yoann Congal, <yoann.congal@smile.fr>=
 wrote:

> On Wed Mar 25, 2026 at 8:23 AM CET, Vijay Anusuri via
> lists.openembedded.org wrote:
> > Pick patch mentioned in NVD
> >
> > [1] https://nvd.nist.gov/vuln/detail/CVE-2026-27448
> > [2] https://ubuntu.com/security/CVE-2026-27448
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
>
> Hello,
>
> As far as I can tell, this CVE also applies to whinlatter. You need to
> send the fix there before I can take it for scarthgap and kirkstone.
>
> That also applies to the 2/2 patch.
>
> Regards,
>
>
> >  .../python3-pyopenssl/CVE-2026-27448.patch    | 124 ++++++++++++++++++
> >  .../python/python3-pyopenssl_24.0.0.bb        |   4 +
> >  2 files changed, 128 insertions(+)
> >  create mode 100644
> meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch
> >
> > diff --git
> a/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch
> b/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch
> > new file mode 100644
> > index 0000000000..87f46b4cb0
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.pat=
ch
> > @@ -0,0 +1,124 @@
> > +From d41a814759a9fb49584ca8ab3f7295de49a85aa0 Mon Sep 17 00:00:00 2001
> > +From: Alex Gaynor <alex.gaynor@gmail.com>
> > +Date: Mon, 16 Feb 2026 21:04:37 -0500
> > +Subject: [PATCH] Handle exceptions in set_tlsext_servername_callback
> callbacks
> > + (#1478)
> > +
> > +When the servername callback raises an exception, call sys.excepthook
> > +with the exception info and return SSL_TLSEXT_ERR_ALERT_FATAL to abort
> > +the handshake. Previously, exceptions would propagate uncaught through
> > +the CFFI callback boundary.
> > +
> > +https://claude.ai/code/session_01P7y1XmWkdtC5UcmZwGDvGi
> > +
> > +Co-authored-by: Claude <noreply@anthropic.com>
> > +
> > +Upstream-Status: Backport [
> https://github.com/pyca/pyopenssl/commit/d41a814759a9fb49584ca8ab3f7295de=
49a85aa0
> ]
> > +CVE: CVE-2026-27448
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + CHANGELOG.rst      |  1 +
> > + src/OpenSSL/SSL.py |  7 ++++++-
> > + tests/test_ssl.py  | 50 +++++++++++++++++++++++++++++++++++++++++++++=
+
> > + 3 files changed, 57 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/CHANGELOG.rst b/CHANGELOG.rst
> > +index 6e23770..12e60e4 100644
> > +--- a/CHANGELOG.rst
> > ++++ b/CHANGELOG.rst
> > +@@ -18,6 +18,7 @@ Changes:
> > +
> > + - Added ``OpenSSL.SSL.Connection.get_selected_srtp_profile`` to
> determine which SRTP profile was negotiated.
> > +   `#1279 <https://github.com/pyca/pyopenssl/pull/1279>`_.
> > ++- ``Context.set_tlsext_servername_callback`` now handles exceptions
> raised in the callback by calling ``sys.excepthook`` and returning a fata=
l
> TLS alert. Previously, exceptions were silently swallowed and the handsha=
ke
> would proceed as if the callback had succeeded.
> > +
> > + 23.3.0 (2023-10-25)
> > + -------------------
> > +diff --git a/src/OpenSSL/SSL.py b/src/OpenSSL/SSL.py
> > +index 4db5240..a6263c4 100644
> > +--- a/src/OpenSSL/SSL.py
> > ++++ b/src/OpenSSL/SSL.py
> > +@@ -1,5 +1,6 @@
> > + import os
> > + import socket
> > ++import sys
> > + import typing
> > + from errno import errorcode
> > + from functools import partial, wraps
> > +@@ -1567,7 +1568,11 @@ class Context:
> > +
> > +         @wraps(callback)
> > +         def wrapper(ssl, alert, arg):
> > +-            callback(Connection._reverse_mapping[ssl])
> > ++            try:
> > ++                callback(Connection._reverse_mapping[ssl])
> > ++            except Exception:
> > ++                sys.excepthook(*sys.exc_info())
> > ++                return _lib.SSL_TLSEXT_ERR_ALERT_FATAL
> > +             return 0
> > +
> > +         self._tlsext_servername_callback =3D _ffi.callback(
> > +diff --git a/tests/test_ssl.py b/tests/test_ssl.py
> > +index ca5bf83..55489b9 100644
> > +--- a/tests/test_ssl.py
> > ++++ b/tests/test_ssl.py
> > +@@ -1855,6 +1855,56 @@ class TestServerNameCallback:
> > +
> > +         assert args =3D=3D [(server, b"foo1.example.com")]
> > +
> > ++    def test_servername_callback_exception(
> > ++        self, monkeypatch: pytest.MonkeyPatch
> > ++    ) -> None:
> > ++        """
> > ++        When the callback passed to
> `Context.set_tlsext_servername_callback`
> > ++        raises an exception, ``sys.excepthook`` is called with the
> exception
> > ++        and the handshake fails with an ``Error``.
> > ++        """
> > ++        exc =3D TypeError("server name callback failed")
> > ++
> > ++        def servername(conn: Connection) -> None:
> > ++            raise exc
> > ++
> > ++        excepthook_calls: list[
> > ++            tuple[type[BaseException], BaseException, object]
> > ++        ] =3D []
> > ++
> > ++        def custom_excepthook(
> > ++            exc_type: type[BaseException],
> > ++            exc_value: BaseException,
> > ++            exc_tb: object,
> > ++        ) -> None:
> > ++            excepthook_calls.append((exc_type, exc_value, exc_tb))
> > ++
> > ++        context =3D Context(SSLv23_METHOD)
> > ++        context.set_tlsext_servername_callback(servername)
> > ++
> > ++        # Necessary to actually accept the connection
> > ++        context.use_privatekey(load_privatekey(FILETYPE_PEM,
> server_key_pem))
> > ++        context.use_certificate(
> > ++            load_certificate(FILETYPE_PEM, server_cert_pem)
> > ++        )
> > ++
> > ++        # Do a little connection to trigger the logic
> > ++        server =3D Connection(context, None)
> > ++        server.set_accept_state()
> > ++
> > ++        client =3D Connection(Context(SSLv23_METHOD), None)
> > ++        client.set_connect_state()
> > ++        client.set_tlsext_host_name(b"foo1.example.com")
> > ++
> > ++        monkeypatch.setattr(sys, "excepthook", custom_excepthook)
> > ++        with pytest.raises(Error):
> > ++            interact_in_memory(server, client)
> > ++
> > ++        assert len(excepthook_calls) =3D=3D 1
> > ++        assert excepthook_calls[0][0] is TypeError
> > ++        assert excepthook_calls[0][1] is exc
> > ++        assert excepthook_calls[0][2] is not None
> > ++
> > +
> > + class TestApplicationLayerProtoNegotiation:
> > +     """
> > +--
> > +2.43.0
> > +
> > diff --git a/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
> b/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
> > index 116f214bfa..bc0b568a46 100644
> > --- a/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
> > +++ b/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
> > @@ -10,6 +10,10 @@ SRC_URI[sha256sum] =3D
> "6aa33039a93fffa4563e655b61d11364d01264be8ccb49906101e02a33
> >  PYPI_PACKAGE =3D "pyOpenSSL"
> >  inherit pypi setuptools3
> >
> > +SRC_URI +=3D " \
> > +    file://CVE-2026-27448.patch \
> > +"
> > +
> >  PACKAGES =3D+ "${PN}-tests"
> >  FILES:${PN}-tests =3D "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/t=
est"
> >
>
>
> --
> Yoann Congal
> Smile ECS
>
>

--000000000000287889064e0c24bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi=C2=A0Yoann,<div dir=3D"auto"><br></div><div dir=3D"aut=
o">As kirkstone LTS going to end this month,=C2=A0 I&#39;ve sent patches fo=
r both kirkstone and scarthgap first.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">I will send patches for whinlatter soon.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Thanks for reminding me.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Thanks &amp; Regards,</div><div dir=3D"auto=
">Vijay=C2=A0</div></div><br><div class=3D"gmail_quote gmail_quote_containe=
r"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 28 Mar, 2026, 4:53=E2=80=
=AFam Yoann Congal, &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.cong=
al@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed M=
ar 25, 2026 at 8:23 AM CET, Vijay Anusuri via <a href=3D"http://lists.opene=
mbedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.openembe=
dded.org</a> wrote:<br>
&gt; Pick patch mentioned in NVD<br>
&gt;<br>
&gt; [1] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-27448" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/=
CVE-2026-27448</a><br>
&gt; [2] <a href=3D"https://ubuntu.com/security/CVE-2026-27448" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">https://ubuntu.com/security/CVE-2026-2=
7448</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank" rel=3D"noreferrer">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
<br>
Hello,<br>
<br>
As far as I can tell, this CVE also applies to whinlatter. You need to<br>
send the fix there before I can take it for scarthgap and kirkstone.<br>
<br>
That also applies to the 2/2 patch.<br>
<br>
Regards,<br>
<br>
<br>
&gt;=C2=A0 .../python3-pyopenssl/CVE-2026-27448.patch=C2=A0 =C2=A0 | 124 ++=
++++++++++++++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-pyopenssl_24.0.0.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">python3-pyopenssl_24.0.0.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
&gt;=C2=A0 2 files changed, 128 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python3-pyopenss=
l/CVE-2026-27448.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-2=
7448.patch b/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.=
patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..87f46b4cb0<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.pa=
tch<br>
&gt; @@ -0,0 +1,124 @@<br>
&gt; +From d41a814759a9fb49584ca8ab3f7295de49a85aa0 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alex Gaynor &lt;<a href=3D"mailto:alex.gaynor@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">alex.gaynor@gmail.com</a>&gt;<br>
&gt; +Date: Mon, 16 Feb 2026 21:04:37 -0500<br>
&gt; +Subject: [PATCH] Handle exceptions in set_tlsext_servername_callback =
callbacks<br>
&gt; + (#1478)<br>
&gt; +<br>
&gt; +When the servername callback raises an exception, call sys.excepthook=
<br>
&gt; +with the exception info and return SSL_TLSEXT_ERR_ALERT_FATAL to abor=
t<br>
&gt; +the handshake. Previously, exceptions would propagate uncaught throug=
h<br>
&gt; +the CFFI callback boundary.<br>
&gt; +<br>
&gt; +<a href=3D"https://claude.ai/code/session_01P7y1XmWkdtC5UcmZwGDvGi" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://claude.ai/code/sessi=
on_01P7y1XmWkdtC5UcmZwGDvGi</a><br>
&gt; +<br>
&gt; +Co-authored-by: Claude &lt;<a href=3D"mailto:noreply@anthropic.com" t=
arget=3D"_blank" rel=3D"noreferrer">noreply@anthropic.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/pyca/pyopens=
sl/commit/d41a814759a9fb49584ca8ab3f7295de49a85aa0" rel=3D"noreferrer noref=
errer" target=3D"_blank">https://github.com/pyca/pyopenssl/commit/d41a81475=
9a9fb49584ca8ab3f7295de49a85aa0</a>]<br>
&gt; +CVE: CVE-2026-27448<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank" rel=3D"noreferrer">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + CHANGELOG.rst=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; + src/OpenSSL/SSL.py |=C2=A0 7 ++++++-<br>
&gt; + tests/test_ssl.py=C2=A0 | 50 +++++++++++++++++++++++++++++++++++++++=
+++++++<br>
&gt; + 3 files changed, 57 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/CHANGELOG.rst b/CHANGELOG.rst<br>
&gt; +index 6e23770..12e60e4 100644<br>
&gt; +--- a/CHANGELOG.rst<br>
&gt; ++++ b/CHANGELOG.rst<br>
&gt; +@@ -18,6 +18,7 @@ Changes:<br>
&gt; + <br>
&gt; + - Added ``OpenSSL.SSL.Connection.get_selected_srtp_profile`` to dete=
rmine which SRTP profile was negotiated.<br>
&gt; +=C2=A0 =C2=A0`#1279 &lt;<a href=3D"https://github.com/pyca/pyopenssl/=
pull/1279" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.c=
om/pyca/pyopenssl/pull/1279</a>&gt;`_.<br>
&gt; ++- ``Context.set_tlsext_servername_callback`` now handles exceptions =
raised in the callback by calling ``sys.excepthook`` and returning a fatal =
TLS alert. Previously, exceptions were silently swallowed and the handshake=
 would proceed as if the callback had succeeded.<br>
&gt; + <br>
&gt; + 23.3.0 (2023-10-25)<br>
&gt; + -------------------<br>
&gt; +diff --git a/src/OpenSSL/SSL.py b/src/OpenSSL/SSL.py<br>
&gt; +index 4db5240..a6263c4 100644<br>
&gt; +--- a/src/OpenSSL/SSL.py<br>
&gt; ++++ b/src/OpenSSL/SSL.py<br>
&gt; +@@ -1,5 +1,6 @@<br>
&gt; + import os<br>
&gt; + import socket<br>
&gt; ++import sys<br>
&gt; + import typing<br>
&gt; + from errno import errorcode<br>
&gt; + from functools import partial, wraps<br>
&gt; +@@ -1567,7 +1568,11 @@ class Context:<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@wraps(callback)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0def wrapper(ssl, alert, arg):<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 callback(Connection._rever=
se_mapping[ssl])<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 callback(Con=
nection._reverse_mapping[ssl])<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exceptho=
ok(*sys.exc_info())<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return _lib.=
SSL_TLSEXT_ERR_ALERT_FATAL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._tlsext_servername_callback =
=3D _ffi.callback(<br>
&gt; +diff --git a/tests/test_ssl.py b/tests/test_ssl.py<br>
&gt; +index ca5bf83..55489b9 100644<br>
&gt; +--- a/tests/test_ssl.py<br>
&gt; ++++ b/tests/test_ssl.py<br>
&gt; +@@ -1855,6 +1855,56 @@ class TestServerNameCallback:<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert args =3D=3D [(server, b&quot=
;<a href=3D"http://foo1.example.com" rel=3D"noreferrer noreferrer" target=
=3D"_blank">foo1.example.com</a>&quot;)]<br>
&gt; + <br>
&gt; ++=C2=A0 =C2=A0 def test_servername_callback_exception(<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self, monkeypatch: pytest.MonkeyPatch<br=
>
&gt; ++=C2=A0 =C2=A0 ) -&gt; None:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 When the callback passed to `Context.set=
_tlsext_servername_callback`<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 raises an exception, ``sys.excepthook`` =
is called with the exception<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 and the handshake fails with an ``Error`=
`.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 exc =3D TypeError(&quot;server name call=
back failed&quot;)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 def servername(conn: Connection) -&gt; N=
one:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise exc<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 excepthook_calls: list[<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tuple[type[BaseException],=
 BaseException, object]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ] =3D []<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 def custom_excepthook(<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exc_type: type[BaseExcepti=
on],<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exc_value: BaseException,<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exc_tb: object,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ) -&gt; None:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 excepthook_calls.append((e=
xc_type, exc_value, exc_tb))<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 context =3D Context(SSLv23_METHOD)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 context.set_tlsext_servername_callback(s=
ervername)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Necessary to actually accept the conne=
ction<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 context.use_privatekey(load_privatekey(F=
ILETYPE_PEM, server_key_pem))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 context.use_certificate(<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 load_certificate(FILETYPE_=
PEM, server_cert_pem)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Do a little connection to trigger the =
logic<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 server =3D Connection(context, None)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 server.set_accept_state()<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 client =3D Connection(Context(SSLv23_MET=
HOD), None)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 client.set_connect_state()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 client.set_tlsext_host_name(b&quot;<a hr=
ef=3D"http://foo1.example.com" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">foo1.example.com</a>&quot;)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 monkeypatch.setattr(sys, &quot;excepthoo=
k&quot;, custom_excepthook)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 with pytest.raises(Error):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interact_in_memory(server,=
 client)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert len(excepthook_calls) =3D=3D 1<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert excepthook_calls[0][0] is TypeErr=
or<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert excepthook_calls[0][1] is exc<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert excepthook_calls[0][2] is not Non=
e<br>
&gt; ++<br>
&gt; + <br>
&gt; + class TestApplicationLayerProtoNegotiation:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; +-- <br>
&gt; +2.43.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-py=
openssl_24.0.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-=
pyopenssl_24.0.0.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://py=
thon3-pyopenssl_24.0.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">=
python3-pyopenssl_24.0.0.bb</a><br>
&gt; index 116f214bfa..bc0b568a46 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-pyopenssl=
_24.0.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-pyopens=
sl_24.0.0.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-pyopenssl=
_24.0.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-pyopens=
sl_24.0.0.bb</a><br>
&gt; @@ -10,6 +10,10 @@ SRC_URI[sha256sum] =3D &quot;6aa33039a93fffa4563e65=
5b61d11364d01264be8ccb49906101e02a33<br>
&gt;=C2=A0 PYPI_PACKAGE =3D &quot;pyOpenSSL&quot;<br>
&gt;=C2=A0 inherit pypi setuptools3<br>
&gt;=C2=A0 <br>
&gt; +SRC_URI +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 file://CVE-2026-27448.patch \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt;=C2=A0 PACKAGES =3D+ &quot;${PN}-tests&quot;<br>
&gt;=C2=A0 FILES:${PN}-tests =3D &quot;${libdir}/${PYTHON_DIR}/site-package=
s/OpenSSL/test&quot;<br>
&gt;=C2=A0 <br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--000000000000287889064e0c24bf--

