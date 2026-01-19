Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C9ED29C41
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 16:25:41 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38844.1768839933789494927
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 08:25:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qiYVtN24;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so41791765e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 08:25:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768839932; cv=none;
        d=google.com; s=arc-20240605;
        b=CsozAjEdXn0qqqgeM5Dp/bN301mJkGvpCdN9GbRz0qwI4UDdbQpIHmIFIz+WOYb/Qe
         19Mpjs9We1fNnzSQn7/Q+LpO22LndSAQ47UZmTF3Enax6onz2POt8+/yAMe+ZWLnHz9O
         hRacce189Ln08u9Gxc3zGpcnabLqpBaBQ3i3sAwdEBozsT7sLu53YEBdr+zoYneVT84A
         21yQmE4LLu08DRaIxOyoAhIMuEyWDfMdOK6JJMwdD8qvenOEiMcBdlKk5gW2n0mxDw1A
         kOHliRAsWHmOmkuk/11pRRcFZzm1Qvjmaxf3YdVaadsZpAXDF9klQhyWrXwBCaE5W3z8
         7aoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AgcreLigq0C+UrVMVAW/dmMWpF+BmBpEk8g1MnQJBiU=;
        fh=dI4eGhhXRYQf7RsXLxEGaKg0Olh6BsHtf/nuVeEubBo=;
        b=gOZVhBQwsbSfCh7aoHH00JhgcFweKPoAUzt4NsTQNhVvhvGl/etVXmmT8rnXRUYKyi
         BUEol7HsbH9ltNny9w7NFCz2XOtQ/FIA3vjFxv4Ol8EVrDpeU06btk9804B1nWvfM+/g
         r54N4yN9kGUebAmfskfYvEkpb5AnikmfzAPsb+5m7Cg9If8fAnSNYj0svU1nMDi1K2Nj
         Ygy0nFfQD/67aKoMzifXyWetO1kQOZ/WYm604HnyhFsVn/N7ChTC+YGxNL4wljr2lAu0
         5ZS8vD7U1WmGZ4Cz62wHNrPVkVbi/d38gvT0eIJDHOzCcYIPWCu9HvwQTPDOsW7zh3VJ
         zmcw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768839932; x=1769444732; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AgcreLigq0C+UrVMVAW/dmMWpF+BmBpEk8g1MnQJBiU=;
        b=qiYVtN24AiKtYQ3zrdb9MnqaFDu+gQ+OHwFncobL+5A2IpLD5zrOx80tiLEF0GCX3O
         KaBHJgqt9WDNGbqdWj7G4sGwwvdrz6b7p3zmtU/ewqs4S7M6hV9uEZK4JBo3QML7wdWa
         eGvalL9NQJrSpAVkTS41g8MVkjeabxU3rmq6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768839932; x=1769444732;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgcreLigq0C+UrVMVAW/dmMWpF+BmBpEk8g1MnQJBiU=;
        b=ZUBvA4mXxNhkZr0sIUmVWyi7TiDGD94pH36KZ9CKq8H+ja/Ciqeob98MbB7mQHTZuJ
         H19yMCDZqLoXiZ4o1M43FaicaA+s/a6Wy9GAYDVFZI+EBz3REdySNUP13bE5g7zS6LoQ
         llNYNf8ifI6czAa+CvMJRPdTysAN/XN4kyQBVYIzt3V09ceFYEegfUbPz2+4COoH5Wng
         mwd1WrWDbxICwuY9R/u3MtRqM/MIHP0j54pxJEWb5O+dC4L9l44Tbs0iheAFT56wf/Kl
         hH4htsxtIt6+tXvH0dMKGWQ0kKOpIINdfp5oeG1qBQjmN+Kn0GkvsuR0BX5+9oZUA1pv
         3csA==
X-Gm-Message-State: AOJu0YxFX1/j5LilVJ/NDz+Wfv/TsqDV5FB/VOln1aGw5RNF3/Vh8CTd
	oPAA0GB4g/+yuzry9ec54YTQ/a3ToKjiL7XnxOOsDFI6V9RMLc5bgwda8brYZXhuCmjKmzG1N/q
	X5eJpXvU6ejWNpapW8KDahvhYpmlOBcmuAU0KGUL3XQ==
X-Gm-Gg: AY/fxX4W5XEj+mVNb4YSU63i7AYieyNdEPgNM/qxp4040mc44X4eruTJDFz0qCsUQF7
	1J+GWAp7IlbvoI56OjzebBvYVHiv7i9+79PxTlQd0UBrsuyA8N596jm/0NsmmdhfIvy2+jBUPDH
	0BsbQ4BoQ9WYg0n3ODjYtObFd/vzo8zDyOefAfJeWcprJfnO5WnhLJ8TZvN0Zn/di/cip/TcQRT
	+VIb+i0wtYo7dYeyrIPaTxLgi7RAvg6ju/1zNJezugoEtlVMt/+/76GKC18xuji7sSrgcr5Pw==
X-Received: by 2002:a05:600c:3495:b0:479:1348:c614 with SMTP id
 5b1f17b1804b1-4801e34343cmr157738195e9.26.1768839931871; Mon, 19 Jan 2026
 08:25:31 -0800 (PST)
MIME-Version: 1.0
References: <20260101180250.4148772-1-peter.marko@siemens.com>
In-Reply-To: <20260101180250.4148772-1-peter.marko@siemens.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 19 Jan 2026 17:25:05 +0100
X-Gm-Features: AZwV_QiyvredGxUVQT6nxwgxEKjhJ9yiCse-Kd33aUOU4O6nZAyEEXyXE7A1pJg
Message-ID: <CAMSfU+4UWRF-LqGhU_r7A7cmqVhSNR=QpRs93cqrR+rtnF42=Q@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] python3: patch CVE-2025-13836
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cdd2440648c02349"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 16:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229625

--000000000000cdd2440648c02349
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 1 janv. 2026 =C3=A0 19:03, Peter Marko via lists.openembedded.org
<peter.marko=3Dsiemens.com@lists.openembedded.org> a =C3=A9crit :

> From: Peter Marko <peter.marko@siemens.com>
>
> Pick commit from branch 3.12 mentioned in [1].
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-13836
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../python/python3/CVE-2025-13836.patch       | 162 ++++++++++++++++++
>  .../python/python3_3.12.12.bb                 |   1 +
>  2 files changed, 163 insertions(+)
>  create mode 100644
> meta/recipes-devtools/python/python3/CVE-2025-13836.patch
>
> diff --git a/meta/recipes-devtools/python/python3/CVE-2025-13836.patch
> b/meta/recipes-devtools/python/python3/CVE-2025-13836.patch
> new file mode 100644
> index 00000000000..7a1acecdc70
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2025-13836.patch
> @@ -0,0 +1,162 @@
> +From 14b1fdb0a94b96f86fc7b86671ea9582b8676628 Mon Sep 17 00:00:00 2001
> +From: "Miss Islington (bot)"
> + <31488909+miss-islington@users.noreply.github.com>
> +Date: Mon, 22 Dec 2025 14:50:18 +0100
> +Subject: [PATCH] [3.12] gh-119451: Fix a potential denial of service in
> + http.client (GH-119454) (#142140)
> +
> +gh-119451: Fix a potential denial of service in http.client (GH-119454)
> +
> +Reading the whole body of the HTTP response could cause OOM if
> +the Content-Length value is too large even if the server does not send
> +a large amount of data. Now the HTTP client reads large data by chunks,
> +therefore the amount of consumed memory is proportional to the amount
> +of sent data.
> +(cherry picked from commit 5a4c4a033a4a54481be6870aa1896fad732555b5)
> +
> +Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
> +
> +CVE: CVE-2025-12084
>

That should read CVE-2025-13836 right?


> +Upstream-Status: Backport [
> https://github.com/python/cpython/commit/14b1fdb0a94b96f86fc7b86671ea9582=
b8676628
> ]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + Lib/http/client.py                            | 28 ++++++--
> + Lib/test/test_httplib.py                      | 66 +++++++++++++++++++
> + ...-05-23-11-47-48.gh-issue-119451.qkJe9-.rst |  5 ++
> + 3 files changed, 95 insertions(+), 4 deletions(-)
> + create mode 100644
> Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue-119451.qkJe9-.rst
> +
> +diff --git a/Lib/http/client.py b/Lib/http/client.py
> +index fb29923d942..70451d67d4c 100644
> +--- a/Lib/http/client.py
> ++++ b/Lib/http/client.py
> +@@ -111,6 +111,11 @@ responses =3D {v: v.phrase for v in
> http.HTTPStatus.__members__.values()}
> + _MAXLINE =3D 65536
> + _MAXHEADERS =3D 100
> +
> ++# Data larger than this will be read in chunks, to prevent extreme
> ++# overallocation.
> ++_MIN_READ_BUF_SIZE =3D 1 << 20
> ++
> ++
> + # Header name/value ABNF (http://tools.ietf.org/html/rfc7230#section-3.=
2
> )
> + #
> + # VCHAR          =3D %x21-7E
> +@@ -639,10 +644,25 @@ class HTTPResponse(io.BufferedIOBase):
> +         reading. If the bytes are truly not available (due to EOF), the=
n
> the
> +         IncompleteRead exception can be used to detect the problem.
> +         """
> +-        data =3D self.fp.read(amt)
> +-        if len(data) < amt:
> +-            raise IncompleteRead(data, amt-len(data))
> +-        return data
> ++        cursize =3D min(amt, _MIN_READ_BUF_SIZE)
> ++        data =3D self.fp.read(cursize)
> ++        if len(data) >=3D amt:
> ++            return data
> ++        if len(data) < cursize:
> ++            raise IncompleteRead(data, amt - len(data))
> ++
> ++        data =3D io.BytesIO(data)
> ++        data.seek(0, 2)
> ++        while True:
> ++            # This is a geometric increase in read size (never more tha=
n
> ++            # doubling out the current length of data per loop
> iteration).
> ++            delta =3D min(cursize, amt - cursize)
> ++            data.write(self.fp.read(delta))
> ++            if data.tell() >=3D amt:
> ++                return data.getvalue()
> ++            cursize +=3D delta
> ++            if data.tell() < cursize:
> ++                raise IncompleteRead(data.getvalue(), amt - data.tell()=
)
> +
> +     def _safe_readinto(self, b):
> +         """Same as _safe_read, but for reading into a buffer."""
> +diff --git a/Lib/test/test_httplib.py b/Lib/test/test_httplib.py
> +index 01f5a101901..e46dac00779 100644
> +--- a/Lib/test/test_httplib.py
> ++++ b/Lib/test/test_httplib.py
> +@@ -1452,6 +1452,72 @@ class BasicTest(TestCase):
> +         thread.join()
> +         self.assertEqual(result, b"proxied data\n")
> +
> ++    def test_large_content_length(self):
> ++        serv =3D socket.create_server((HOST, 0))
> ++        self.addCleanup(serv.close)
> ++
> ++        def run_server():
> ++            [conn, address] =3D serv.accept()
> ++            with conn:
> ++                while conn.recv(1024):
> ++                    conn.sendall(
> ++                        b"HTTP/1.1 200 Ok\r\n"
> ++                        b"Content-Length: %d\r\n"
> ++                        b"\r\n" % size)
> ++                    conn.sendall(b'A' * (size//3))
> ++                    conn.sendall(b'B' * (size - size//3))
> ++
> ++        thread =3D threading.Thread(target=3Drun_server)
> ++        thread.start()
> ++        self.addCleanup(thread.join, 1.0)
> ++
> ++        conn =3D client.HTTPConnection(*serv.getsockname())
> ++        try:
> ++            for w in range(15, 27):
> ++                size =3D 1 << w
> ++                conn.request("GET", "/")
> ++                with conn.getresponse() as response:
> ++                    self.assertEqual(len(response.read()), size)
> ++        finally:
> ++            conn.close()
> ++            thread.join(1.0)
> ++
> ++    def test_large_content_length_truncated(self):
> ++        serv =3D socket.create_server((HOST, 0))
> ++        self.addCleanup(serv.close)
> ++
> ++        def run_server():
> ++            while True:
> ++                [conn, address] =3D serv.accept()
> ++                with conn:
> ++                    conn.recv(1024)
> ++                    if not size:
> ++                        break
> ++                    conn.sendall(
> ++                        b"HTTP/1.1 200 Ok\r\n"
> ++                        b"Content-Length: %d\r\n"
> ++                        b"\r\n"
> ++                        b"Text" % size)
> ++
> ++        thread =3D threading.Thread(target=3Drun_server)
> ++        thread.start()
> ++        self.addCleanup(thread.join, 1.0)
> ++
> ++        conn =3D client.HTTPConnection(*serv.getsockname())
> ++        try:
> ++            for w in range(18, 65):
> ++                size =3D 1 << w
> ++                conn.request("GET", "/")
> ++                with conn.getresponse() as response:
> ++                    self.assertRaises(client.IncompleteRead,
> response.read)
> ++                conn.close()
> ++        finally:
> ++            conn.close()
> ++            size =3D 0
> ++            conn.request("GET", "/")
> ++            conn.close()
> ++            thread.join(1.0)
> ++
> +     def test_putrequest_override_domain_validation(self):
> +         """
> +         It should be possible to override the default validation
> +diff --git
> a/Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue-119451.qkJe9-.rs=
t
> b/Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue-119451.qkJe9-.rs=
t
> +new file mode 100644
> +index 00000000000..6d6f25cd2f8
> +--- /dev/null
> ++++
> b/Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue-119451.qkJe9-.rs=
t
> +@@ -0,0 +1,5 @@
> ++Fix a potential memory denial of service in the :mod:`http.client`
> module.
> ++When connecting to a malicious server, it could cause
> ++an arbitrary amount of memory to be allocated.
> ++This could have led to symptoms including a :exc:`MemoryError`,
> swapping, out
> ++of memory (OOM) killed processes or containers, or even system crashes.
> diff --git a/meta/recipes-devtools/python/python3_3.12.12.bb
> b/meta/recipes-devtools/python/python3_3.12.12.bb
> index 786f52875a9..280d98424a5 100644
> --- a/meta/recipes-devtools/python/python3_3.12.12.bb
> +++ b/meta/recipes-devtools/python/python3_3.12.12.bb
> @@ -36,6 +36,7 @@ SRC_URI =3D "
> http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>             file://0001-test_readline-skip-limited-history-test.patch \
>             file://CVE-2025-6075.patch \
>             file://CVE-2025-12084.patch \
> +           file://CVE-2025-13836.patch \
>             "
>
>  SRC_URI:append:class-native =3D " \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228826):
> https://lists.openembedded.org/g/openembedded-core/message/228826
> Mute This Topic: https://lists.openembedded.org/mt/117030195/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000cdd2440648c02349
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 1 =
janv. 2026 =C3=A0=C2=A019:03, Peter Marko via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;peter.marko=3D<a href=3D"mailto=
:siemens.com@lists.openembedded.org">siemens.com@lists.openembedded.org</a>=
&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com"=
 target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
<br>
Pick commit from branch 3.12 mentioned in [1].<br>
<br>
[1] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2025-13836" rel=3D"nore=
ferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2025-13836</=
a><br>
<br>
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
---<br>
=C2=A0.../python/python3/CVE-2025-13836.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
62 ++++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python3_3.12.12.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python3_3.12.12.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 163 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-1383=
6.patch<br>
<br>
diff --git a/meta/recipes-devtools/python/python3/CVE-2025-13836.patch b/me=
ta/recipes-devtools/python/python3/CVE-2025-13836.patch<br>
new file mode 100644<br>
index 00000000000..7a1acecdc70<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/python3/CVE-2025-13836.patch<br>
@@ -0,0 +1,162 @@<br>
+From 14b1fdb0a94b96f86fc7b86671ea9582b8676628 Mon Sep 17 00:00:00 2001<br>
+From: &quot;Miss Islington (bot)&quot;<br>
+ &lt;<a href=3D"mailto:31488909%2Bmiss-islington@users.noreply.github.com"=
 target=3D"_blank">31488909+miss-islington@users.noreply.github.com</a>&gt;=
<br>
+Date: Mon, 22 Dec 2025 14:50:18 +0100<br>
+Subject: [PATCH] [3.12] gh-119451: Fix a potential denial of service in<br=
>
+ http.client (GH-119454) (#142140)<br>
+<br>
+gh-119451: Fix a potential denial of service in http.client (GH-119454)<br=
>
+<br>
+Reading the whole body of the HTTP response could cause OOM if<br>
+the Content-Length value is too large even if the server does not send<br>
+a large amount of data. Now the HTTP client reads large data by chunks,<br=
>
+therefore the amount of consumed memory is proportional to the amount<br>
+of sent data.<br>
+(cherry picked from commit 5a4c4a033a4a54481be6870aa1896fad732555b5)<br>
+<br>
+Co-authored-by: Serhiy Storchaka &lt;<a href=3D"mailto:storchaka@gmail.com=
" target=3D"_blank">storchaka@gmail.com</a>&gt;<br>
+<br>
+CVE: CVE-2025-12084<br></blockquote><div><br></div><div>That should read=
=C2=A0<span class=3D"gmail-il">CVE</span>-<span class=3D"gmail-il">2025</sp=
an>-13836 right?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
+Upstream-Status: Backport [<a href=3D"https://github.com/python/cpython/co=
mmit/14b1fdb0a94b96f86fc7b86671ea9582b8676628" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/python/cpython/commit/14b1fdb0a94b96f86fc7b8667=
1ea9582b8676628</a>]<br>
+Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" =
target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
+---<br>
+ Lib/http/client.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 28 ++++++--<br>
+ Lib/test/test_httplib.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 66 +++++++++++++++++++<br>
+ ...-05-23-11-47-48.gh-issue-119451.qkJe9-.rst |=C2=A0 5 ++<br>
+ 3 files changed, 95 insertions(+), 4 deletions(-)<br>
+ create mode 100644 Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue=
-119451.qkJe9-.rst<br>
+<br>
+diff --git a/Lib/http/client.py b/Lib/http/client.py<br>
+index fb29923d942..70451d67d4c 100644<br>
+--- a/Lib/http/client.py<br>
++++ b/Lib/http/client.py<br>
+@@ -111,6 +111,11 @@ responses =3D {v: v.phrase for v in http.HTTPStatus._=
_members__.values()}<br>
+ _MAXLINE =3D 65536<br>
+ _MAXHEADERS =3D 100<br>
+ <br>
++# Data larger than this will be read in chunks, to prevent extreme<br>
++# overallocation.<br>
++_MIN_READ_BUF_SIZE =3D 1 &lt;&lt; 20<br>
++<br>
++<br>
+ # Header name/value ABNF (<a href=3D"http://tools.ietf.org/html/rfc7230#s=
ection-3.2" rel=3D"noreferrer" target=3D"_blank">http://tools.ietf.org/html=
/rfc7230#section-3.2</a>)<br>
+ #<br>
+ # VCHAR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D %x21-7E<br>
+@@ -639,10 +644,25 @@ class HTTPResponse(io.BufferedIOBase):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reading. If the bytes are truly not avai=
lable (due to EOF), then the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IncompleteRead exception can be used to =
detect the problem.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D self.fp.read(amt)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(data) &lt; amt:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise IncompleteRead(data, amt-=
len(data))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return data<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cursize =3D min(amt, _MIN_READ_BUF_SIZE)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D self.fp.read(cursize)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(data) &gt;=3D amt:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return data<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(data) &lt; cursize:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise IncompleteRead(data, amt =
- len(data))<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D io.BytesIO(data)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 data.seek(0, 2)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 while True:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # This is a geometric increase =
in read size (never more than<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # doubling out the current leng=
th of data per loop iteration).<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delta =3D min(cursize, amt - cu=
rsize)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data.write(self.fp.read(delta))=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if data.tell() &gt;=3D amt:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return data.getva=
lue()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cursize +=3D delta<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if data.tell() &lt; cursize:<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise IncompleteR=
ead(data.getvalue(), amt - data.tell())<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0def _safe_readinto(self, b):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Same as _safe_read, bu=
t for reading into a buffer.&quot;&quot;&quot;<br>
+diff --git a/Lib/test/test_httplib.py b/Lib/test/test_httplib.py<br>
+index 01f5a101901..e46dac00779 100644<br>
+--- a/Lib/test/test_httplib.py<br>
++++ b/Lib/test/test_httplib.py<br>
+@@ -1452,6 +1452,72 @@ class BasicTest(TestCase):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0thread.join()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(result, b&quot;proxied =
data\n&quot;)<br>
+ <br>
++=C2=A0 =C2=A0 def test_large_content_length(self):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 serv =3D socket.create_server((HOST, 0))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.addCleanup(serv.close)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 def run_server():<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [conn, address] =3D serv.accept=
()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with conn:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while conn.recv(1=
024):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 con=
n.sendall(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 b&quot;HTTP/1.1 200 Ok\r\n&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 b&quot;Content-Length: %d\r\n&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 b&quot;\r\n&quot; % size)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 con=
n.sendall(b&#39;A&#39; * (size//3))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 con=
n.sendall(b&#39;B&#39; * (size - size//3))<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 thread =3D threading.Thread(target=3Drun_serv=
er)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 thread.start()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.addCleanup(thread.join, 1.0)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 conn =3D client.HTTPConnection(*serv.getsockn=
ame())<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for w in range(15, 27):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D 1 &lt;&l=
t; w<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conn.request(&quo=
t;GET&quot;, &quot;/&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with conn.getresp=
onse() as response:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sel=
f.assertEqual(len(response.read()), size)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 finally:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conn.close()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thread.join(1.0)<br>
++<br>
++=C2=A0 =C2=A0 def test_large_content_length_truncated(self):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 serv =3D socket.create_server((HOST, 0))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.addCleanup(serv.close)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 def run_server():<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while True:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [conn, address] =
=3D serv.accept()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with conn:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 con=
n.recv(1024)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
not size:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 con=
n.sendall(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 b&quot;HTTP/1.1 200 Ok\r\n&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 b&quot;Content-Length: %d\r\n&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 b&quot;\r\n&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 b&quot;Text&quot; % size)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 thread =3D threading.Thread(target=3Drun_serv=
er)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 thread.start()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.addCleanup(thread.join, 1.0)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 conn =3D client.HTTPConnection(*serv.getsockn=
ame())<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for w in range(18, 65):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D 1 &lt;&l=
t; w<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conn.request(&quo=
t;GET&quot;, &quot;/&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with conn.getresp=
onse() as response:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sel=
f.assertRaises(client.IncompleteRead, response.read)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conn.close()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 finally:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conn.close()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D 0<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conn.request(&quot;GET&quot;, &=
quot;/&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conn.close()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thread.join(1.0)<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0def test_putrequest_override_domain_validation(self):<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0It should be possible to override the de=
fault validation<br>
+diff --git a/Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue-119451=
.qkJe9-.rst b/Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue-119451=
.qkJe9-.rst<br>
+new file mode 100644<br>
+index 00000000000..6d6f25cd2f8<br>
+--- /dev/null<br>
++++ b/Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue-119451.qkJe9-=
.rst<br>
+@@ -0,0 +1,5 @@<br>
++Fix a potential memory denial of service in the :mod:`http.client` module=
.<br>
++When connecting to a malicious server, it could cause<br>
++an arbitrary amount of memory to be allocated.<br>
++This could have led to symptoms including a :exc:`MemoryError`, swapping,=
 out<br>
++of memory (OOM) killed processes or containers, or even system crashes.<b=
r>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.12.12=
.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.12.12.bb</a> b/meta/rec=
ipes-devtools/python/<a href=3D"http://python3_3.12.12.bb" rel=3D"noreferre=
r" target=3D"_blank">python3_3.12.12.bb</a><br>
index 786f52875a9..280d98424a5 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.12.12.bb" re=
l=3D"noreferrer" target=3D"_blank">python3_3.12.12.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.12.12.bb" re=
l=3D"noreferrer" target=3D"_blank">python3_3.12.12.bb</a><br>
@@ -36,6 +36,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.python.org/ftp/py=
thon/$%7BPV%7D/Python-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank=
">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-test_readline-skip-li=
mited-history-test.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2025-6075.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2025-12084.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-13836.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI:append:class-native =3D &quot; \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#228826): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/228826" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/228826</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117030195/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117030195/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000cdd2440648c02349--

