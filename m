Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9C3D17140
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 21:24:30 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.3843.1729545869192342424
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 14:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZZ0yzrq8;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5ebc349204cso664511eaf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 14:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729545868; x=1730150668; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=txoXsbFBvysLjszX6Yn/HAVNHfAuyh9jYcNzSSJtv24=;
        b=ZZ0yzrq8v47CULgIC3hoW5MwIdcfXkEAGMNcduNMZQFvmb5dL5KilZe8E2x7rC1JKY
         IIZUJyDC4zv29znYT5asfvgQVDqhKCW5iWHiNfIodaEtf1IV38P4L8ZklTbDszoBDZxQ
         +zIctF4S6Z+FV/orwWCS3NO31j3HAi/z0unbC4xDoAHcMn3ULwyHPfnKAEItW0+CdioO
         4+VZBrPja3cOS5pDdo4C3wUdM4ZkMKHnh2pCdz4LrSvdhnVy6VtUaxmLCHx1tMxuodrq
         jlA7hjopQe6apstDcXZiITcjseBzhiwA+bLgXTDwiVbAGgfujqxkY1DDk7OxJwlH5r5y
         1URg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729545868; x=1730150668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=txoXsbFBvysLjszX6Yn/HAVNHfAuyh9jYcNzSSJtv24=;
        b=KijxuBeNgePKcL7vm5Qu37AwZ3jgeMgUs7JKw1027LrL5kBxtvSLfeQpL5GKmipgje
         9uSD+ckmv5Q/KHunfEEvfbGnLwj9MAgs8fyPkm6supBr6p5uoJtbEuJraZT0id9KErSt
         crkrps+WC5WM1Lc/t8GWURtqTJXJJFKYKCbrYWR5EtMwBOsKSl5p41vKB52TyrWNLeN1
         rosghjPLOwQWKsu9WnYIaB/8qV7PsIKq8RWfVLrebuwA8P05+X/h625RYnPJO97iAUPr
         6C22jeBIHqwaT9aijTrwHALx8dvD6v5KHqr4he1tJuFKkPAV/nQY4VH8fUkBuwAyw1iY
         38Cw==
X-Gm-Message-State: AOJu0YxX6fQv2GJ55lkpBmvgFbhPpvC7mCqpOVgPZ9n3iARkE/ExD3l7
	YRS4kOwJkJVqS7eVCnMLqYJSTkwY1eZDHCcVoM3olbS9/Zj6N2uRwe9jlIuiHJnoyPS7kqog3tF
	cQQSvbDzkG3yb2p/FPZ2IhS9v2f8=
X-Google-Smtp-Source: AGHT+IESOWINTtF/bPGYkGmcrqyNvpR0Y2P/byx36xYGiMX1y+tcBY7E5PJwl9tA2W7m4y82t3MJeXdDAWsh2/szt44=
X-Received: by 2002:a05:6820:50a:b0:5eb:85ee:2cbd with SMTP id
 006d021491bc7-5eb8b75e70emr8655551eaf.6.1729545868401; Mon, 21 Oct 2024
 14:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20241019184824.1338594-1-raj.khem@gmail.com> <CANNYZj-Mf9DQKCzA8_e0gagdSP9iAbv_bjtJixtHZFMuxD4MOg@mail.gmail.com>
In-Reply-To: <CANNYZj-Mf9DQKCzA8_e0gagdSP9iAbv_bjtJixtHZFMuxD4MOg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Oct 2024 14:24:17 -0700
Message-ID: <CAMKF1sqSaMczRwi_D0sRcsyA1D2SCAbxKQZ1_9E-KCTDRZCmLQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-packaging: Ignore old glibc tests
 on musl
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001be20506250347b9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 21:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206134

--0000000000001be20506250347b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 3:29=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> Can run-ptest be rewritten to load the list of tests to skip from a
> file, and then the recipe would add to that file instead? These sed
> hacks are brittle and barely readable.


Yeah IIRC there is also some pre existing case of doing so I will look into
it

>
>
> Alex
>
> On Sat, 19 Oct 2024 at 20:48, Khem Raj via lists.openembedded.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > These tests expect glibc to be the system C library
> > ignore them for musl
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/python/python3-packaging_24.1.bb | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/python/python3-packaging_24.1.bb
> b/meta/recipes-devtools/python/python3-packaging_24.1.bb
> > index 20bcd55fbad..f8465d9fdb7 100644
> > --- a/meta/recipes-devtools/python/python3-packaging_24.1.bb
> > +++ b/meta/recipes-devtools/python/python3-packaging_24.1.bb
> > @@ -25,6 +25,10 @@ do_install_ptest() {
> >      rm -f ${D}${PTEST_PATH}/tests/manylinux/build.sh
> >  }
> >
> > +do_install_ptest:append:libc-musl() {
> > +    sed -i -e '/^pytest/ s|$| --deselect
> tests/test_manylinux.py::test_is_manylinux_compatible_old
> --ignore=3Dtests/test_tags.py|' ${D}${PTEST_PATH}/run-ptest
> > +}
> > +
> >  RDEPENDS:${PN}-ptest =3D "\
> >      python3-ctypes \
> >      python3-pretend \
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#206085):
> https://lists.openembedded.org/g/openembedded-core/message/206085
> > Mute This Topic: https://lists.openembedded.org/mt/109104794/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000001be20506250347b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Oct 21, 2024 at 3:29=E2=80=AFAM Alexander Kanavin &=
lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Can run-ptest be rewritten =
to load the list of tests to skip from a<br>
file, and then the recipe would add to that file instead? These sed<br>
hacks are brittle and barely readable.</blockquote><div dir=3D"auto"><br></=
div><div dir=3D"auto">Yeah IIRC there is also some pre existing case of doi=
ng so I will look into it=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"=
auto"><br>
<br>
Alex<br>
<br>
On Sat, 19 Oct 2024 at 20:48, Khem Raj via <a href=3D"http://lists.openembe=
dded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><b=
r>
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; These tests expect glibc to be the system C library<br>
&gt; ignore them for musl<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/python/<a href=3D"http://python3-packaging=
_24.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-packaging_24.1.bb</a=
> | 4 ++++<br>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-pa=
ckaging_24.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-packaging_24.=
1.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-packaging=
_24.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-packaging_24.1.bb</a=
><br>
&gt; index 20bcd55fbad..f8465d9fdb7 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-packaging=
_24.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-packaging_24.1.bb</a=
><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-packaging=
_24.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-packaging_24.1.bb</a=
><br>
&gt; @@ -25,6 +25,10 @@ do_install_ptest() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rm -f ${D}${PTEST_PATH}/tests/manylinux/build.sh<b=
r>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +do_install_ptest:append:libc-musl() {<br>
&gt; +=C2=A0 =C2=A0 sed -i -e &#39;/^pytest/ s|$| --deselect tests/test_man=
ylinux.py::test_is_manylinux_compatible_old --ignore=3Dtests/test_tags.py|&=
#39; ${D}${PTEST_PATH}/run-ptest<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 RDEPENDS:${PN}-ptest =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-ctypes \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-pretend \<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#206085): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/206085" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/206085</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10910479=
4/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/109104794/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--0000000000001be20506250347b9--

