Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.49234.1624291637210135706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 09:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=oNUfv8io;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.51, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f51.google.com with SMTP id j1so3081987wrn.9
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 09:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oFO9/tPZi4RogPz7Px5CycwifqE3bdiyaggIgMTrMmY=;
        b=oNUfv8ioV7jG4jKgw9bMZ8uWzQuuRmPGbYhROJpaiL/WC9B2T/aoNFYhxG9Hps1ien
         N76V8qmnZXybRXX022NDj91hc+J7gfCYUhuwfh1D+PAtHJIgadLBTzHzPx8bww2LvII/
         HLdy2hcrADNiAEmIdT6wzplLSd4hBz00eJ4aQtSk094NURyIHwEKVfcQgb3/RoynErGE
         5TKr3qdq8OZb/IQUnPeQiiecnL9iCPvvOmqb7jbFU55FapBjGorwb1+zFRtCkH13EnNG
         bbWabA/vhsjYktuVutMO6rympT6tAlj2UPety72ZUdNnWw33ZSf7+4P3pgqqDsTf0NNu
         5PTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oFO9/tPZi4RogPz7Px5CycwifqE3bdiyaggIgMTrMmY=;
        b=CNvYQlXuaUYkfLcvakmmjdG93r8TgSXgsx8J5OfXn1w6skWD7UqI27tkxO6LZbl0bv
         Nx29R2o0QKQ4McvC2NzjGmjzcnYjCRBIB8+LDLhmNyeP9ma2qbxu+eaNFVxMuPje4iVx
         Au9HN9xvTiJYNl083wGb13u/CMAYor5pIYho2dBy8YHZczHu2sn0uZR1uJSZ4BQsOhTe
         D43pD7UhDMCJNuLYHd5z6sp3Wn7dgRvW9+TkND9QMl5AgVn3eDdlWDFSVA5SNqiFgqeU
         fvIys6EPAJk1LAq4loh73DXj+AdWILp0lWLbbz6MFsZHkiiflbVyMfM635wuzc16w5pn
         npbQ==
X-Gm-Message-State: AOAM531g5WhrHtEK7CdikGynVZ8c685H7pfLR28zpwBOAjiaZu8XH/IP
	XfBr+xlc6YOx3GK6hxixItLFu3J1ytE01HXWzHsPrA==
X-Google-Smtp-Source: ABdhPJw8/wOQDhkLlhUomwnZ8M/VwzvH/MbhIHFnFxA4l8ldActAaffa27i+Tut9mTrHnpLSIZemDA7zrVZmjxhsGdk=
X-Received: by 2002:a5d:62d2:: with SMTP id o18mr6462296wrv.350.1624291635414;
 Mon, 21 Jun 2021 09:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210621144901.1480-1-flowergom@gmail.com>
In-Reply-To: <20210621144901.1480-1-flowergom@gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 21 Jun 2021 06:07:02 -1000
Message-ID: <CAOSpxdYEXvu8rJTg6=LV3UO+-jiEKkkpfA=sshXdLOrxwAMJJQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] python3: fix CVE-2021-3426
To: Minjae Kim <flowergom@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the patch!

I'm going to wait a bit on merging this because we are evaluating
doing a series of bug fix version bumps for python.  If successful
this CVE would be among those fixed by the version bumps.

Steve

On Mon, Jun 21, 2021 at 4:49 AM Minjae Kim <flowergom@gmail.com> wrote:
>
> Remove the pydoc getfile feature
>
> CVE-2021-3426: Remove the "getfile" feature of the pydoc module which
> could be abused to read arbitrary files on the disk (directory
> traversal vulnerability). Moreover, even source code of Python
> modules can contain sensitive data like passwords. Vulnerability
> reported by David Schw=C3=83=C2=B6rer.
>
> reference:
> https://nvd.nist.gov/vuln/detail/CVE-2021-3426
> https://github.com/python/cpython/pull/25015/commits/dc9580949cc82c51022=
a882ba43dad937ff929a8
> ---
>  .../python/python3/CVE-2021-3426.patch        | 105 ++++++++++++++++++
>  meta/recipes-devtools/python/python3_3.8.2.bb |   1 +
>  2 files changed, 106 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2021-3426.p=
atch
>
> diff --git a/meta/recipes-devtools/python/python3/CVE-2021-3426.patch b/=
meta/recipes-devtools/python/python3/CVE-2021-3426.patch
> new file mode 100644
> index 0000000000..68bd7d9296
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2021-3426.patch
> @@ -0,0 +1,105 @@
> +From 9b999479c0022edfc9835a8a1f06e046f3881048 Mon Sep 17 00:00:00 2001
> +From: Victor Stinner <vstinner@python.org>
> +Date: Mon, 29 Mar 2021 14:40:40 +0200
> +Subject: [PATCH] bpo-42988: Remove the pydoc getfile feature (GH-25015)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +CVE-2021-3426: Remove the "getfile" feature of the pydoc module which
> +could be abused to read arbitrary files on the disk (directory
> +traversal vulnerability). Moreover, even source code of Python
> +modules can contain sensitive data like passwords. Vulnerability
> +reported by David Schw=C3=83=C2=B6rer.
> +
> +Upstream-Status: Acepted
> +[https://github.com/python/cpython/pull/25015/commits/dc9580949cc82c510=
22a882ba43dad937ff929a8]
> +CVE: CVE-2021-3426
> +Signed-off-by: Minjae Kim <flowergom@gmail.com>
> +
> +---
> + Lib/pydoc.py                                   | 18 ------------------
> + Lib/test/test_pydoc.py                         |  6 ------
> + .../2021-03-24-14-16-56.bpo-42988.P2aNco.rst   |  4 ++++
> + 3 files changed, 4 insertions(+), 24 deletions(-)
> + create mode 100644 Misc/NEWS.d/next/Security/2021-03-24-14-16-56.bpo-4=
2988.P2aNco.rst
> +
> +diff --git a/Lib/pydoc.py b/Lib/pydoc.py
> +index 282a917998..753ea97ba0 100755
> +--- a/Lib/pydoc.py
> ++++ b/Lib/pydoc.py
> +@@ -2456,9 +2456,6 @@ def page(self, title, contents):
> + %s</head><body bgcolor=3D"#f0f0f8">%s<div style=3D"clear:both;padding-=
top:.5em;">%s</div>
> + </body></html>''' % (title, css_link, html_navbar(), contents)
> +
> +-        def filelink(self, url, path):
> +-            return '<a href=3D"getfile?key=3D%s">%s</a>' % (url, path)
> +-
> +
> +     html =3D _HTMLDoc()
> +
> +@@ -2544,19 +2541,6 @@ def bltinlink(name):
> +             'key =3D %s' % key, '#ffffff', '#ee77aa', '<br>'.join(resu=
lts))
> +         return 'Search Results', contents
> +
> +-    def html_getfile(path):
> +-        """Get and display a source file listing safely."""
> +-        path =3D urllib.parse.unquote(path)
> +-        with tokenize.open(path) as fp:
> +-            lines =3D html.escape(fp.read())
> +-        body =3D '<pre>%s</pre>' % lines
> +-        heading =3D html.heading(
> +-            '<big><big><strong>File Listing</strong></big></big>',
> +-            '#ffffff', '#7799ee')
> +-        contents =3D heading + html.bigsection(
> +-            'File: %s' % path, '#ffffff', '#ee77aa', body)
> +-        return 'getfile %s' % path, contents
> +-
> +     def html_topics():
> +         """Index of topic texts available."""
> +
> +@@ -2648,8 +2632,6 @@ def get_html_page(url):
> +                 op, _, url =3D url.partition('=3D')
> +                 if op =3D=3D "search?key":
> +                     title, content =3D html_search(url)
> +-                elif op =3D=3D "getfile?key":
> +-                    title, content =3D html_getfile(url)
> +                 elif op =3D=3D "topic?key":
> +                     # try topics first, then objects.
> +                     try:
> +diff --git a/Lib/test/test_pydoc.py b/Lib/test/test_pydoc.py
> +index 2f502627f4..3bc0e9e6b5 100644
> +--- a/Lib/test/test_pydoc.py
> ++++ b/Lib/test/test_pydoc.py
> +@@ -1374,18 +1374,12 @@ def test_url_requests(self):
> +             ("topic?key=3Ddef", "Pydoc: KEYWORD def"),
> +             ("topic?key=3DSTRINGS", "Pydoc: TOPIC STRINGS"),
> +             ("foobar", "Pydoc: Error - foobar"),
> +-            ("getfile?key=3Dfoobar", "Pydoc: Error - getfile?key=3Dfoo=
bar"),
> +             ]
> +
> +         with self.restrict_walk_packages():
> +             for url, title in requests:
> +                 self.call_url_handler(url, title)
> +
> +-            path =3D string.__file__
> +-            title =3D "Pydoc: getfile " + path
> +-            url =3D "getfile?key=3D" + path
> +-            self.call_url_handler(url, title)
> +-
> +
> + class TestHelper(unittest.TestCase):
> +     def test_keywords(self):
> +diff --git a/Misc/NEWS.d/next/Security/2021-03-24-14-16-56.bpo-42988.P2=
aNco.rst b/Misc/NEWS.d/next/Security/2021-03-24-14-16-56.bpo-42988.P2aNco.r=
st
> +new file mode 100644
> +index 0000000000..4b42dd0530
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2021-03-24-14-16-56.bpo-42988.P2aNco.rs=
t
> +@@ -0,0 +1,4 @@
> ++CVE-2021-3426: Remove the ``getfile`` feature of the :mod:`pydoc` modu=
le which
> ++could be abused to read arbitrary files on the disk (directory travers=
al
> ++vulnerability). Moreover, even source code of Python modules can conta=
in
> ++sensitive data like passwords. Vulnerability reported by David Schw=C3=
=
=83=C2=B6rer.
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipe=
s-devtools/python/python3_3.8.2.bb
> index 072ce97472..cbeb599705 100644
> --- a/meta/recipes-devtools/python/python3_3.8.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.8.2.bb
> @@ -39,6 +39,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Py=
thon-${PV}.tar.xz \
>             file://CVE-2020-26116.patch \
>             file://CVE-2020-27619.patch \
>             file://CVE-2021-3177.patch \
> +           file://CVE-2021-3426.patch \
>             "
>
>  SRC_URI_append_class-native =3D " \
> --
> 2.24.3 (Apple Git-128)
>
>
>=20
>
