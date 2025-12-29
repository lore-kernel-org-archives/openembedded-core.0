Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABA1E92FD7
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 20:29:25 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50865.1767040157435205566
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 12:29:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=buYcgALa;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79018a412edso23147917b3.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 12:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767040156; x=1767644956; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AHfr6PQUc9F39QdbVvD5k+Q0L3fYt7PNh9I3qh/oLfg=;
        b=buYcgALaBWgJFh+MUmqzb0ufbt+tk9NlAP6i88skPHdLGz8Fnn7mcEvKhL78z3erxt
         AEe/UiBlaCB0fO+uEi5xeMQreCkUTuQoWlh7h00Lq83Q/SrU2VnpELrqkTD67kdN2886
         pZt2qoGcqWXnJugsD+jpjzvMHBTe/9RQz+aKwG/uX1nN75geB1cxH/zlI89AL7jrrw2Q
         RV8l4aeWbYuUa6CTIplwX0jjb+b6JFvLuFmGY5gYwrGeq22WEEJ05vCQiNzVtMCN8hE+
         Bt5cN7FbkXC8V+dfkUTOl+hrDmDmqkUJpzXRKpPPKN5JNFAwSg4BY9hVE4Y58hF+4Y3t
         yjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767040156; x=1767644956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHfr6PQUc9F39QdbVvD5k+Q0L3fYt7PNh9I3qh/oLfg=;
        b=dXdpw2iTbRxZbtmw3LQDzhX9YDy7XCDlzAzpRJLhtLxr3HJ6E7ZPtG+Hus8Ofq7d+3
         l5X9XkBmEujvBaGo8XVpgQGJXhFx8xJmOwZvgzbPnzQMLpkWIcc3a/y7BIeJgrkxY5b9
         qkRDGNwHry56SpnZrZ7L7rWzWMuFsz7DbBk+Miujec4NYJVHD7MyK9J8iDIo+ieXDUJK
         zMWhKb3Hj977OL/vaAYmCBbj3UY7AIVEKdo/xw8O4o6DoIojiTehcN019cAXuGap9aMg
         1jETRzRVqAZaG+jud5oGLgv5kGG706Vu5Fo/yyqeepGN6trWgVoa9q6zGymrltTz1rO0
         T8fA==
X-Forwarded-Encrypted: i=1; AJvYcCUVfIMLpc1QAk7UtD5Ds1myeHvP6tx17lsdubAbkODHDEb0wh7PoWQfPh0SxLBv7xpMiBu0986mycDppp/q6rTveg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzEthUWXvtqasfgiR/MxgnT7q5ljxr3Q/DkS79QLPSy0LZKaIm2
	2ABrGYq+D1mJGbtbJYaahLv2e64CnPrzFcuKjIhhkA7UPGZLkokUEa15yjaK4QkgiF8jYbNHa+d
	JOCFHRuFjzdvF/1BTlEc3KXrvDdsqC48=
X-Gm-Gg: AY/fxX7Rest3Zhg18GsuFGR5pan81c0ycElUbZGEN1ZMKVfvcK2KVrh11gLPTO/VKOf
	/Lfi2jsWyvDE1VJLHXiUJ3wg9dvLEIXszFDQ/i5Cl8vyG1kYSNV0pxlK0Wd2Mmdg4xVICzlbxGa
	KiTjk05oj2qUC3JkPgddutkxfX2PjqMGqB6o06rpgOru8jTZxOLo2lAXJMGtst2e7MNHtz1WrSe
	+5Yac/EXYU1gH4yRTGzk7WiXboVdjEDd/S3c8zF3qWPED9kCRHNg1zL6r/9igPj3KvnmepslQoj
	toN6P7QM7oC8lXxAqCBhL+2YmKCGJnWeFnBqzT1ikJx5P3YHX5idPFJ1loXx/LLAaLT3dBQt7W+
	ZxdzP6WECx3L2K3TD24LFfwKYUbqtU+klm0RLIQ==
X-Google-Smtp-Source: AGHT+IFRCkttqq8JCvsVomuF4K7MbjFyGe2tkMo0Gmj2CwJnsPacmV0CcaER/CnZom0Nwqqwuc26bipOTal3rIsWHQ0=
X-Received: by 2002:a05:690e:6dd:b0:63c:e853:669d with SMTP id
 956f58d0204a3-6466a8ac062mr20825699d50.50.1767040156362; Mon, 29 Dec 2025
 12:29:16 -0800 (PST)
MIME-Version: 1.0
References: <20251219120109.1967755-1-koen.kooi@oss.qualcomm.com>
 <20251219120109.1967755-2-koen.kooi@oss.qualcomm.com> <CAMKF1spSmrcUcrtFrUZ4qU+9dQvMZu49cKW3BPp11Cv7-iHV5Q@mail.gmail.com>
 <CA+chaQefJX0cHeW8GMUNKjpAA+Q0aQNnps9LZrp_7s1Pb-JSiQ@mail.gmail.com>
In-Reply-To: <CA+chaQefJX0cHeW8GMUNKjpAA+Q0aQNnps9LZrp_7s1Pb-JSiQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Dec 2025 12:28:50 -0800
X-Gm-Features: AQt7F2ou7IkWfnTiBVqHJVNhbGGAWUUisNtd7dOAOaam4OQpSw7ojHF8lLIY7EQ
Message-ID: <CAMKF1sqvLBhjFj93VJ30QyrXBSEKnSwKQM0Xv=M75FoY_CYDmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 1/4] python3-pyzstd: import 0.17.0 from meta-python
To: Martin Jansa <martin.jansa@gmail.com>
Cc: koen.kooi@oss.qualcomm.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d2eca506471d184a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 20:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228613

--000000000000d2eca506471d184a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 26, 2025 at 2:46=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:

> oe-core imported 0.17.0 version which fails to build with lto while
> meta-oe had 0.19.0 which doesn't fail
>
> it wasn't detected before, because of the overlayed version in
> meta-oe, removed by Khem now:
>
> https://git.openembedded.org/meta-openembedded/commit/?id=3Ddbc5ef5e12e49=
c14546be301421a7ea9cb998699
>
> oe-core is missing these pyzstd changes from meta-oe:
>
>
> https://git.openembedded.org/meta-openembedded/commit/meta-python/recipes=
-devtools/python?id=3Dabce3f440f46687a85cd04a40b61a5c38eb2bdcb
> python3-pyzstd
> <https://git.openembedded.org/meta-openembedded/commit/meta-python/recipe=
s-devtools/python?id=3Dabce3f440f46687a85cd04a40b61a5c38eb2bdcbpython3-pyzs=
td>:
> upgrade 0.17.0 -> 0.18.0
>
> https://git.openembedded.org/meta-openembedded/commit/meta-python/recipes=
-devtools/python?id=3D332072205f3ea5dcefe72cc2fe89b2fdbf7ee330
> python3-backports-zstd
> <https://git.openembedded.org/meta-openembedded/commit/meta-python/recipe=
s-devtools/python?id=3D332072205f3ea5dcefe72cc2fe89b2fdbf7ee330python3-back=
ports-zstd>:
> Add recipe
>
> https://git.openembedded.org/meta-openembedded/commit/meta-python/recipes=
-devtools/python?id=3D0b5f2ba62c32ab23bda52e54df2d144fc270cf50
> python3-pyzstd
> <https://git.openembedded.org/meta-openembedded/commit/meta-python/recipe=
s-devtools/python?id=3D0b5f2ba62c32ab23bda52e54df2d144fc270cf50python3-pyzs=
td>:
> Add ptest dependency on backports.zstd
>
> https://git.openembedded.org/meta-openembedded/commit/meta-python/recipes=
-devtools/python?id=3Dd8e7190fd3de3807599ec8fafbd23b8bf68100a1
> python3-pyzstd
> <https://git.openembedded.org/meta-openembedded/commit/meta-python/recipe=
s-devtools/python?id=3Dd8e7190fd3de3807599ec8fafbd23b8bf68100a1python3-pyzs=
td>:
> Remove setup.py tweak for lto/clang
>
>
and there might be more, e.g. python3-mypy would be needed to brought in as
well for python3-backports-zstd ptests to pass and it might need more


> Koen: will you please take care of them?
>
> Cheers,
>
> On Tue, Dec 23, 2025 at 4:39=E2=80=AFPM Khem Raj via lists.openembedded.o=
rg
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Hi Koen
> >
> > It's now applied to oe-core, we need it removed from meta-python, would
> you mind cooking a patch for it ?
> >
> > On Fri, Dec 19, 2025 at 4:01=E2=80=AFAM Koen Kooi via lists.openembedde=
d.org
> <koen.kooi=3Doss.qualcomm.com@lists.openembedded.org> wrote:
> >>
> >> From the upstream website:
> >>         Pyzstd module provides classes and functions for compressing a=
nd
> >>         decompressing data, using Facebook's Zstandard (or zstd as
> short name)
> >>         algorithm.
> >>
> >> This recipe is being moved over for systemd 258.x, the 'ukify' tool
> >> depends on this.
> >>
> >> Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
> >> ---
> >> Changes since v3:
> >>  * Added SUMMARY
> >> Changes since v2:
> >>  * No changes
> >> Changes since v1:
> >>  * Adjusted pyzstd patch to not specify an upper limit to the setuptoo=
ls
> >>    version, as suggested by Alexander Kanavin.
> >>
> >>  ...emove-setuptools-version-limit-of-74.patch | 27 ++++++++++++++++++=
+
> >>  .../python/python3-pyzstd_0.17.0.bb           | 20 ++++++++++++++
> >>  2 files changed, 47 insertions(+)
> >>  create mode 100644
> meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-versio=
n-limit-of-74.patch
> >>  create mode 100644 meta/recipes-devtools/python/
> python3-pyzstd_0.17.0.bb
> >>
> >> diff --git
> a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-vers=
ion-limit-of-74.patch
> b/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-vers=
ion-limit-of-74.patch
> >> new file mode 100644
> >> index 0000000000..f2910322ff
> >> --- /dev/null
> >> +++
> b/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-vers=
ion-limit-of-74.patch
> >> @@ -0,0 +1,27 @@
> >> +From bc9b975c9f41e43481a2eb0623b4180926baecec Mon Sep 17 00:00:00 200=
1
> >> +From: Khem Raj <raj.khem@gmail.com>
> >> +Date: Wed, 9 Apr 2025 14:38:31 -0700
> >> +Subject: [PATCH] Remove setuptools version limit of '74'
> >> +
> >> +Upstream sticks to 0.74 since setuptools have dropped msvc9compiler
> >> +support beyond that which is needed for python 3.9 on windows. We
> >> +do not have this problem on Linux
> >> +
> >> +Upstream-Status: Inappropriate [OE-specific]
> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> +---
> >> + pyproject.toml | 2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +diff --git a/pyproject.toml b/pyproject.toml
> >> +index dd885e4..5d4d511 100644
> >> +--- a/pyproject.toml
> >> ++++ b/pyproject.toml
> >> +@@ -1,6 +1,6 @@
> >> + [build-system]
> >> + # setuptools 64+ support --build-option
> >> + # setuptools 74+ drops distutils.msvc9compiler required for Python
> 3.9 under Windows
> >> +-requires =3D ["setuptools>=3D64,<74"]
> >> ++requires =3D ["setuptools>=3D64"]
> >> + backend-path =3D ["build_script"]
> >> + build-backend =3D "pyzstd_pep517"
> >> diff --git a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
> b/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
> >> new file mode 100644
> >> index 0000000000..af7069b6ed
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
> >> @@ -0,0 +1,20 @@
> >> +DESCRIPTION =3D "Pyzstd module provides classes and functions for
> compressing and \
> >> +decompressing data, using Facebook=E2=80=99s Zstandard (or zstd as sh=
ort name)
> algorithm."
> >> +SUMMARY =3D "Python bindings to Zstandard (zstd) compression library"
> >> +HOMEPAGE =3D "https://github.com/animalize/pyzstd"
> >> +SECTION =3D "devel/python"
> >> +
> >> +LICENSE =3D "BSD-3-Clause"
> >> +LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Daedb5a2679cd1552fb61c181ef974b9e"
> >> +
> >> +PYPI_PACKAGE =3D "pyzstd"
> >> +
> >> +SRC_URI +=3D "file://0001-Remove-setuptools-version-limit-of-74.patch=
"
> >> +SRC_URI[sha256sum] =3D
> "d84271f8baa66c419204c1dd115a4dec8b266f8a2921da21b81764fa208c1db6"
> >> +
> >> +inherit pypi python_setuptools_build_meta ptest-python-pytest
> >> +
> >> +# clang-16 with -flto segfaults on arm, therefore ignore flto for now
> >> +do_configure:append:arm:toolchain-clang() {
> >> +    sed -i -e "s|'-flto'|''|" ${S}/setup.py
> >> +}
> >> --
> >> 2.34.1
> >>
> >>
> >>
> >>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#228472):
> https://lists.openembedded.org/g/openembedded-core/message/228472
> > Mute This Topic: https://lists.openembedded.org/mt/116858017/3617156
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000d2eca506471d184a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 26,=
 2025 at 2:46=E2=80=AFAM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gm=
ail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">oe-core imported 0.17.0 version which fail=
s to build with lto while<br>
meta-oe had 0.19.0 which doesn&#39;t fail<br>
<br>
it wasn&#39;t detected before, because of the overlayed version in<br>
meta-oe, removed by Khem now:<br>
<a href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=3Ddbc5=
ef5e12e49c14546be301421a7ea9cb998699" rel=3D"noreferrer" target=3D"_blank">=
https://git.openembedded.org/meta-openembedded/commit/?id=3Ddbc5ef5e12e49c1=
4546be301421a7ea9cb998699</a><br>
<br>
oe-core is missing these pyzstd changes from meta-oe:<br>
<br>
<a href=3D"https://git.openembedded.org/meta-openembedded/commit/meta-pytho=
n/recipes-devtools/python?id=3Dabce3f440f46687a85cd04a40b61a5c38eb2bdcbpyth=
on3-pyzstd" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.o=
rg/meta-openembedded/commit/meta-python/recipes-devtools/python?id=3Dabce3f=
440f46687a85cd04a40b61a5c38eb2bdcb<br>
python3-pyzstd</a>: upgrade 0.17.0 -&gt; 0.18.0<br>
<a href=3D"https://git.openembedded.org/meta-openembedded/commit/meta-pytho=
n/recipes-devtools/python?id=3D332072205f3ea5dcefe72cc2fe89b2fdbf7ee330pyth=
on3-backports-zstd" rel=3D"noreferrer" target=3D"_blank">https://git.openem=
bedded.org/meta-openembedded/commit/meta-python/recipes-devtools/python?id=
=3D332072205f3ea5dcefe72cc2fe89b2fdbf7ee330<br>
python3-backports-zstd</a>: Add recipe<br>
<a href=3D"https://git.openembedded.org/meta-openembedded/commit/meta-pytho=
n/recipes-devtools/python?id=3D0b5f2ba62c32ab23bda52e54df2d144fc270cf50pyth=
on3-pyzstd" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.o=
rg/meta-openembedded/commit/meta-python/recipes-devtools/python?id=3D0b5f2b=
a62c32ab23bda52e54df2d144fc270cf50<br>
python3-pyzstd</a>: Add ptest dependency on backports.zstd<br>
<a href=3D"https://git.openembedded.org/meta-openembedded/commit/meta-pytho=
n/recipes-devtools/python?id=3Dd8e7190fd3de3807599ec8fafbd23b8bf68100a1pyth=
on3-pyzstd" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.o=
rg/meta-openembedded/commit/meta-python/recipes-devtools/python?id=3Dd8e719=
0fd3de3807599ec8fafbd23b8bf68100a1<br>
python3-pyzstd</a>: Remove setup.py tweak for lto/clang<br>
<br></blockquote><div><br></div><div>and there might be more, e.g. python3-=
mypy would be needed to brought in as well for python3-backports-zstd ptest=
s to pass and it might need more=C2=A0</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
Koen: will you please take care of them?<br>
<br>
Cheers,<br>
<br>
On Tue, Dec 23, 2025 at 4:39=E2=80=AFPM Khem Raj via <a href=3D"http://list=
s.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded=
.org</a><br>
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Koen<br>
&gt;<br>
&gt; It&#39;s now applied to oe-core, we need it removed from meta-python, =
would you mind cooking a patch for it ?<br>
&gt;<br>
&gt; On Fri, Dec 19, 2025 at 4:01=E2=80=AFAM Koen Kooi via <a href=3D"http:=
//lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openem=
bedded.org</a> &lt;koen.kooi=3D<a href=3D"mailto:oss.qualcomm.com@lists.ope=
nembedded.org" target=3D"_blank">oss.qualcomm.com@lists.openembedded.org</a=
>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From the upstream website:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pyzstd module provides classes an=
d functions for compressing and<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0decompressing data, using Faceboo=
k&#39;s Zstandard (or zstd as short name)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0algorithm.<br>
&gt;&gt;<br>
&gt;&gt; This recipe is being moved over for systemd 258.x, the &#39;ukify&=
#39; tool<br>
&gt;&gt; depends on this.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Koen Kooi &lt;<a href=3D"mailto:koen.kooi@oss.qualc=
omm.com" target=3D"_blank">koen.kooi@oss.qualcomm.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; Changes since v3:<br>
&gt;&gt;=C2=A0 * Added SUMMARY<br>
&gt;&gt; Changes since v2:<br>
&gt;&gt;=C2=A0 * No changes<br>
&gt;&gt; Changes since v1:<br>
&gt;&gt;=C2=A0 * Adjusted pyzstd patch to not specify an upper limit to the=
 setuptools<br>
&gt;&gt;=C2=A0 =C2=A0 version, as suggested by Alexander Kanavin.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 ...emove-setuptools-version-limit-of-74.patch | 27 +++++++++=
++++++++++<br>
&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-pyzstd_0.17.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.17.0.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 20 ++++++++++++++<br>
&gt;&gt;=C2=A0 2 files changed, 47 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python3-pyzs=
td/0001-Remove-setuptools-version-limit-of-74.patch<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/<a href=3D"h=
ttp://python3-pyzstd_0.17.0.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-pyzstd_0.17.0.bb</a><br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/python/python3-pyzstd/0001-Remo=
ve-setuptools-version-limit-of-74.patch b/meta/recipes-devtools/python/pyth=
on3-pyzstd/0001-Remove-setuptools-version-limit-of-74.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..f2910322ff<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setu=
ptools-version-limit-of-74.patch<br>
&gt;&gt; @@ -0,0 +1,27 @@<br>
&gt;&gt; +From bc9b975c9f41e43481a2eb0623b4180926baecec Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; +Date: Wed, 9 Apr 2025 14:38:31 -0700<br>
&gt;&gt; +Subject: [PATCH] Remove setuptools version limit of &#39;74&#39;<=
br>
&gt;&gt; +<br>
&gt;&gt; +Upstream sticks to 0.74 since setuptools have dropped msvc9compil=
er<br>
&gt;&gt; +support beyond that which is needed for python 3.9 on windows. We=
<br>
&gt;&gt; +do not have this problem on Linux<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Inappropriate [OE-specific]<br>
&gt;&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + pyproject.toml | 2 +-<br>
&gt;&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/pyproject.toml b/pyproject.toml<br>
&gt;&gt; +index dd885e4..5d4d511 100644<br>
&gt;&gt; +--- a/pyproject.toml<br>
&gt;&gt; ++++ b/pyproject.toml<br>
&gt;&gt; +@@ -1,6 +1,6 @@<br>
&gt;&gt; + [build-system]<br>
&gt;&gt; + # setuptools 64+ support --build-option<br>
&gt;&gt; + # setuptools 74+ drops distutils.msvc9compiler required for Pyth=
on 3.9 under Windows<br>
&gt;&gt; +-requires =3D [&quot;setuptools&gt;=3D64,&lt;74&quot;]<br>
&gt;&gt; ++requires =3D [&quot;setuptools&gt;=3D64&quot;]<br>
&gt;&gt; + backend-path =3D [&quot;build_script&quot;]<br>
&gt;&gt; + build-backend =3D &quot;pyzstd_pep517&quot;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python=
3-pyzstd_0.17.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.1=
7.0.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-pyzstd_=
0.17.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.17.0.bb</a=
><br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..af7069b6ed<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-pyzst=
d_0.17.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.17.0.bb<=
/a><br>
&gt;&gt; @@ -0,0 +1,20 @@<br>
&gt;&gt; +DESCRIPTION =3D &quot;Pyzstd module provides classes and function=
s for compressing and \<br>
&gt;&gt; +decompressing data, using Facebook=E2=80=99s Zstandard (or zstd a=
s short name) algorithm.&quot;<br>
&gt;&gt; +SUMMARY =3D &quot;Python bindings to Zstandard (zstd) compression=
 library&quot;<br>
&gt;&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/animalize/pyzstd=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/animalize/pyzstd<=
/a>&quot;<br>
&gt;&gt; +SECTION =3D &quot;devel/python&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Daedb5a2679cd1552f=
b61c181ef974b9e&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +PYPI_PACKAGE =3D &quot;pyzstd&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +SRC_URI +=3D &quot;file://0001-Remove-setuptools-version-limit-of=
-74.patch&quot;<br>
&gt;&gt; +SRC_URI[sha256sum] =3D &quot;d84271f8baa66c419204c1dd115a4dec8b26=
6f8a2921da21b81764fa208c1db6&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +inherit pypi python_setuptools_build_meta ptest-python-pytest<br>
&gt;&gt; +<br>
&gt;&gt; +# clang-16 with -flto segfaults on arm, therefore ignore flto for=
 now<br>
&gt;&gt; +do_configure:append:arm:toolchain-clang() {<br>
&gt;&gt; +=C2=A0 =C2=A0 sed -i -e &quot;s|&#39;-flto&#39;|&#39;&#39;|&quot;=
 ${S}/setup.py<br>
&gt;&gt; +}<br>
&gt;&gt; --<br>
&gt;&gt; 2.34.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#228472): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/228472" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/228472</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11685801=
7/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/116858017/3617156</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.co=
m" target=3D"_blank">martin.jansa@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000d2eca506471d184a--

