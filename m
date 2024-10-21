Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3D7D1713F
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 21:22:10 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.3879.1729545725652411529
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 14:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kVAQnMrx;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3e6105886dfso825604b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 14:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729545725; x=1730150525; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=18ic/A/aZfVE1qLN2QJe4Hnc0NKtxd9GHRVo4xzYw+I=;
        b=kVAQnMrx0v1eJHXG0vRcpI2su/kdmT/lWTT6sapaZdvWWpN69MZtAh7aRDsqALVE2P
         sIfObc/0aAUEJRU+HZfRDia7pCJTM7PCSZ7UPja8W5X7arriaROGC6Up4YVftqITEOyI
         NzN1wlSZfDQmwuCBcYQ2FTgTN8G4FyFIVY+29F+abg+Y8cj3zUNGT7TexFgRmAMVylpr
         /mnGmpulcjqVks9fgjZOTM0EQH/8SKiElsACP9CxBfVUyzZZXzjtqwuwFnTUhZKTy20J
         TXPHAL9m67aUd6ei3PYHHrJVgVWzfJz60WGJpxGL2JaG6AypmJZbLLYmfO3mdkcdWSF4
         vDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729545725; x=1730150525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18ic/A/aZfVE1qLN2QJe4Hnc0NKtxd9GHRVo4xzYw+I=;
        b=ogRjmazTWZ8SmINsGz4uH8tAtls5i4lplaMeOnGD74i00Z+ZIxP8Pis98ta6hrypWb
         g3jCotZiFl0/y70dh7m4VBT0h+tX7IyZKm5T2pKdv0AMEpquwsQ9F2vQg5IouMX0E9SP
         jlSuddFeq9wlRPfusS/vxhedfmdMEMthCaLSWAU1aAg0bY4SzTF5bb3xxACsmb6in6GG
         erx0FLplUXL4GNi7WK7ZeraToLqzGvG9fMq2VNRyJun4MGl/VLs8rrVlHFue5dmkOIdl
         AQJrNuRMD3vjf4kcnJYk2n/q0Z2A12DaAyAaD5E9zJQXXM1Ca0qJr1/V89+P9xdM9rv7
         cFzg==
X-Gm-Message-State: AOJu0YygdFjD4lt1k2gE7v7dtjajtv0k4NTD+0kL8zMChlgzeVEeMmm2
	Ak6BIg4Zo63Rvgo3sIvatV8fT0CJ4BLsJ3T/0fu+Z4bHr5KfgO92nxzHyB1nnaEIFWsVBKx3Mc8
	cN1nzym71yaqzZCM4UwYnh5kvhLg=
X-Google-Smtp-Source: AGHT+IES9euTkCGlOCBBKjFvM3dXYUviIa+AZLzOlnRPWN7Y2qadtjb97bkbd5qaR9DcIudCQO7MkEjuJhuTstJ9pZM=
X-Received: by 2002:a05:6808:2394:b0:3e6:cb:8c7c with SMTP id
 5614622812f47-3e61cc2a611mr564129b6e.22.1729545724781; Mon, 21 Oct 2024
 14:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20241019184824.1338594-1-raj.khem@gmail.com> <20241019184824.1338594-2-raj.khem@gmail.com>
 <CANNYZj_CG9YmauWebfUfNJQsqVcba_CjkNwgm-2vcGJ+PKxOFA@mail.gmail.com>
In-Reply-To: <CANNYZj_CG9YmauWebfUfNJQsqVcba_CjkNwgm-2vcGJ+PKxOFA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Oct 2024 14:21:52 -0700
Message-ID: <CAMKF1sqG7idoFGeORvwpxKmp+HJs_X-94SKe==X=ydkfmHhXtw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-libarchive-c: Avoid using
 find_library python API
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008c6ef80625033e82"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 21:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206133

--0000000000008c6ef80625033e82
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 3:27=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> Can this be a proper patch please?


I have thought of it. sadly It can not be patched with a single patch as
libdir is not uniform across all combos we may build

>
>
> Alex
>
> On Sat, 19 Oct 2024 at 20:48, Khem Raj via lists.openembedded.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > find_library API depends on platform to provide ldconfig, ld, gcc,
> objdump
> > etc, so either we add these dependencies or avoid them by computing the
> > libarchive library name during build, which we can be done.
> >
> > This ensures that ffi module works with musl as well as glibc equally
> > as musl does not provide ldconfig like glibc does
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/python/python3-libarchive-c_5.1.bb | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
> b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
> > index 3116c6b62ec..510e2d9159c 100644
> > --- a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
> > +++ b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
> > @@ -16,6 +16,14 @@ inherit pypi setuptools3 ptest
> >
> >  SRC_URI[sha256sum] =3D
> "7bcce24ea6c0fa3bc62468476c6d2f6264156db2f04878a372027c10615a2721"
> >
> > +DEPENDS +=3D "patchelf-native libarchive"
> > +# Avoid using find_library API which needs ldconfig and ld/objdump
> > +# https://docs.python.org/3/library/ctypes.html#ctypes-reference
> > +#
> > +do_configure:append() {
> > +    sed -i -e "s|find_library('archive')|'${libdir}/$(patchelf
> --print-soname ${STAGING_LIBDIR}/libarchive.so)'|" ${S}/libarchive/ffi.py
> > +}
> > +
> >  RDEPENDS:${PN} +=3D "\
> >    libarchive \
> >    python3-ctypes \
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#206086):
> https://lists.openembedded.org/g/openembedded-core/message/206086
> > Mute This Topic: https://lists.openembedded.org/mt/109104795/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000008c6ef80625033e82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Oct 21, 2024 at 3:27=E2=80=AFAM Alexander Kanavin &=
lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Can this be a proper patch =
please?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I have th=
ought of it. sadly It can not be patched with a single patch as libdir is n=
ot uniform across all combos we may build=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex" dir=3D"auto"><br>
<br>
Alex<br>
<br>
On Sat, 19 Oct 2024 at 20:48, Khem Raj via <a href=3D"http://lists.openembe=
dded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><b=
r>
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; find_library API depends on platform to provide ldconfig, ld, gcc, obj=
dump<br>
&gt; etc, so either we add these dependencies or avoid them by computing th=
e<br>
&gt; libarchive library name during build, which we can be done.<br>
&gt;<br>
&gt; This ensures that ffi module works with musl as well as glibc equally<=
br>
&gt; as musl does not provide ldconfig like glibc does<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/python/<a href=3D"http://python3-libarchiv=
e-c_5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-libarchive-c_5.1.b=
b</a> | 8 ++++++++<br>
&gt;=C2=A0 1 file changed, 8 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-li=
barchive-c_5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-libarchive-=
c_5.1.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-libar=
chive-c_5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-libarchive-c_5=
.1.bb</a><br>
&gt; index 3116c6b62ec..510e2d9159c 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-libarchiv=
e-c_5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-libarchive-c_5.1.b=
b</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-libarchiv=
e-c_5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-libarchive-c_5.1.b=
b</a><br>
&gt; @@ -16,6 +16,14 @@ inherit pypi setuptools3 ptest<br>
&gt;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;7bcce24ea6c0fa3bc62468476c6d2f62641=
56db2f04878a372027c10615a2721&quot;<br>
&gt;<br>
&gt; +DEPENDS +=3D &quot;patchelf-native libarchive&quot;<br>
&gt; +# Avoid using find_library API which needs ldconfig and ld/objdump<br=
>
&gt; +# <a href=3D"https://docs.python.org/3/library/ctypes.html#ctypes-ref=
erence" rel=3D"noreferrer" target=3D"_blank">https://docs.python.org/3/libr=
ary/ctypes.html#ctypes-reference</a><br>
&gt; +#<br>
&gt; +do_configure:append() {<br>
&gt; +=C2=A0 =C2=A0 sed -i -e &quot;s|find_library(&#39;archive&#39;)|&#39;=
${libdir}/$(patchelf --print-soname ${STAGING_LIBDIR}/libarchive.so)&#39;|&=
quot; ${S}/libarchive/ffi.py<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 RDEPENDS:${PN} +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 libarchive \<br>
&gt;=C2=A0 =C2=A0 python3-ctypes \<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#206086): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/206086" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/206086</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10910479=
5/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/109104795/1686489</a><br>
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

--0000000000008c6ef80625033e82--

