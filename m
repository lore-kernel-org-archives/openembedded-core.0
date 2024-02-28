Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B38C5478C
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 12:15:14 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web11.11482.1709122506356265910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 04:15:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z2XGRV33;
 spf=pass (domain: gmail.com, ip: 209.85.222.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-7d130979108so2898317241.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 04:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709122505; x=1709727305; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Auty5u76WOhFJwpJmHq1Qabao2fwtUQOuSleC4kqa6g=;
        b=Z2XGRV33kZ4cZHssSbAklVIeHFLyGTIcbCcmwCEvfYfLj9G4dVnlGFK+fuiPb25O/E
         4pEnmJGbgDGJOvqSKF9l0n623Lsw2B4hnET83irHf8QLPDeqJfGrHdCH7KTQjYJma/Hm
         v2hWdGZs+5cBddO9T9hgJN66vH4dPONa48IAhUD6tqedUZ6yc09IjtEvXuje3zgANYsT
         KD1B3xt+n4fn58PGC1fxDPMMs/zOPiybcrF2nstlgHAczGLLjbcVbPFrjm+XD05cQNE1
         nP62K7gTd+cPNC1nANfQIHCuEbQXM1I4K23poUW1DAbHMbXx8Z3TAVql3XgT4ubUf1BE
         VzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709122505; x=1709727305;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Auty5u76WOhFJwpJmHq1Qabao2fwtUQOuSleC4kqa6g=;
        b=vH3KsTbmZl2qSxZ8WkRZB1IeG3pTQGbvJK4/NTTx7yoj8GnZ+NuI/mL8xnJRNwO0lB
         hM6GDK099KZFQED7z1DeXg9nyLqJswL5LuBiAGU0idOKgz3s5SE72R30VuWH6y+CCCDN
         Mh+CRP9QSglei3oavs5/MKovcOguv0X2hplTPlyq4JlTr1rWozWmGrj0kOVmtDyQ8GeT
         8acwfPh4mnekscYBSEvR2MSFGFgtjgeIskg5P6hp5B2n1KiuXEBoLDcGDNhufOtA7s4M
         2h1ptMLKlQMPI6Qub5mlix4Cwdicq0avh7S7yeFxXMD5U7Lk48hjPgRAjBig/Yk5wYuH
         3yew==
X-Gm-Message-State: AOJu0YzTg39oiaj3JYOKcEKTcs3tiUg3QQITdTsvM0/P86cybd3GUPHD
	VlJ2PvocyWPj4gQYXlElm5K0vnAUigyMDU6IizwqMAnKWGK2Bt8nfPqRAqyiCf+T/iVsa6pyLIx
	G8LndkUxWg6UYNW2huEf53HTGvIs=
X-Google-Smtp-Source: AGHT+IGwa/UvJ07kT05GX6kyCplQbqaMYsAvQA94QK/1LtTicqUc9kxFXKmpRRt5vwJnsVGHg+WHyrfPl9VABhLN+xs=
X-Received: by 2002:a05:6102:3f56:b0:470:6a99:25dd with SMTP id
 l22-20020a0561023f5600b004706a9925ddmr13684241vsv.17.1709122504709; Wed, 28
 Feb 2024 04:15:04 -0800 (PST)
MIME-Version: 1.0
References: <20240227100709.1154-1-jose.quaresma@foundries.io>
 <20240227100709.1154-3-jose.quaresma@foundries.io> <b7618e7f-42c4-eba5-6d86-0e273133439e@windriver.com>
In-Reply-To: <b7618e7f-42c4-eba5-6d86-0e273133439e@windriver.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 28 Feb 2024 12:14:53 +0000
Message-ID: <CANPvuRmfcWcqxk5VaTWTWco2=qEHZQ4zcDVmyCv4S21KjV6nvA@mail.gmail.com>
Subject: Re: [OE-core] [RFC OE-core][PATCH 3/3] goarch: disable dynamic
 linking globally
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000c55d26061270177e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 12:15:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196382

--000000000000c55d26061270177e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ChenQi <Qi.Chen@windriver.com> escreveu (quarta, 28/02/2024 =C3=A0(s) 02:38=
):

> Is this 1.21 upgrade going to be merged in LTS 5.0?
> The reason I'm asking is that I'm going to upgrade some recipes in
> meta-virt and I'd like to check what would be the go version in the next
> release.
>

I am still testing in my distro with the overwall virtualization stack we
use
and everything seems fine so far.
If no issues come in, I intend to submit the final version today or
tomorrow at the latest.


> P.S.
> Is this runtime error OE specific? Is it caused by some OE specific patch=
?
>

I don't know the reason for the runtime error yet.
When I start I suspected it could be due to separate-host-and-target-builds
patch
https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/g=
o/go/0005-cmd-dist-separate-host-and-target-builds.patch?id=3D44f81b6239f0f=
08877ccd6507c2a81f3650f193b

After several unsuccessful attempts, I was going to use gdb to debug the
target.
I decided to disable the dynamic linking because it would make it easier
for me with
the symbols and I would have just one binary.
After that, when I was going to run gdb on the target everything started
working without any issue.

Jose


> Regards,
> Qi
>
> On 2/27/24 18:07, Jose Quaresma wrote:
> > With go-1.21 dynamic linking cause a runtime panic:
> >
> > | root@qemux86-64:~# go-helloworld
> > | panic: runtime error: index out of range [0] with length 0
> > |
> > | goroutine 1 [running]:
> > | flag.init()
> > |         /usr/lib/go/src/flag/flag.go:1199 +0xf9
> >
> > In my opinion, this would be a good trade-off so that we can update and
> > leave the version 1.20 for the next LTS 5.0 since we are already quite
> > behind on the version available upstream which already has the 1.22
> available.
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >   meta/classes-recipe/goarch.bbclass | 14 +++++++-------
> >   1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/meta/classes-recipe/goarch.bbclass
> b/meta/classes-recipe/goarch.bbclass
> > index 1ebe03864f..6899ec28e4 100644
> > --- a/meta/classes-recipe/goarch.bbclass
> > +++ b/meta/classes-recipe/goarch.bbclass
> > @@ -38,13 +38,13 @@ BASE_GOARM:armv5 =3D '5'
> >   # Go supports dynamic linking on a limited set of architectures.
> >   # See the supportsDynlink function in
> go/src/cmd/compile/internal/gc/main.go
> >   GO_DYNLINK =3D ""
> > -GO_DYNLINK:arm ?=3D "1"
> > -GO_DYNLINK:aarch64 ?=3D "1"
> > -GO_DYNLINK:x86 ?=3D "1"
> > -GO_DYNLINK:x86-64 ?=3D "1"
> > -GO_DYNLINK:powerpc64 ?=3D "1"
> > -GO_DYNLINK:powerpc64le ?=3D "1"
> > -GO_DYNLINK:class-native ?=3D ""
> > +GO_DYNLINK:arm =3D ""
> > +GO_DYNLINK:aarch64 =3D ""
> > +GO_DYNLINK:x86 =3D ""
> > +GO_DYNLINK:x86-64 =3D ""
> > +GO_DYNLINK:powerpc64 =3D ""
> > +GO_DYNLINK:powerpc64le =3D ""
> > +GO_DYNLINK:class-native =3D ""
> >   GO_DYNLINK:class-nativesdk =3D ""
> >
> >   # define here because everybody inherits this class
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#196251):
> https://lists.openembedded.org/g/openembedded-core/message/196251
> > Mute This Topic: https://lists.openembedded.org/mt/104600087/7304865
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Qi.Chen@eng.windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000c55d26061270177e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">ChenQi &lt;<a href=3D"mailto:Qi.Chen@=
windriver.com">Qi.Chen@windriver.com</a>&gt; escreveu (quarta, 28/02/2024 =
=C3=A0(s) 02:38):<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Is this 1.21 upgrade going to be merged in LTS 5.0?<br>
The reason I&#39;m asking is that I&#39;m going to upgrade some recipes in =
<br>
meta-virt and I&#39;d like to check what would be the go version in the nex=
t <br>
release.<br></blockquote><div><br></div><div>I am still testing in my distr=
o with the overwall virtualization=C2=A0stack we use</div><div>and everythi=
ng seems fine so far.</div><div>If no issues come in, I intend to submit th=
e final version today or tomorrow at the latest.<br><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
P.S.<br>
Is this runtime error OE specific? Is it caused by some OE specific patch?<=
br></blockquote><div><br></div><div>I don&#39;t=C2=A0know the reason=C2=A0f=
or the runtime error yet.</div><div>When I start=C2=A0I suspected it could =
be due to separate-host-and-target-builds patch<br><a href=3D"https://git.o=
penembedded.org/openembedded-core/tree/meta/recipes-devtools/go/go/0005-cmd=
-dist-separate-host-and-target-builds.patch?id=3D44f81b6239f0f08877ccd6507c=
2a81f3650f193b">https://git.openembedded.org/openembedded-core/tree/meta/re=
cipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch?id=
=3D44f81b6239f0f08877ccd6507c2a81f3650f193b</a><br></div><div><br></div><di=
v>After several unsuccessful attempts, I was going to use gdb to debug the =
target.</div><div>I decided to disable the dynamic linking because it would=
 make it easier for me with</div><div>the symbols and I would have just one=
 binary.</div><div>After that, when I was going to run gdb on the target ev=
erything=C2=A0started working without=C2=A0any issue.<br><br>Jose</div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Regards,<br>
Qi<br>
<br>
On 2/27/24 18:07, Jose Quaresma wrote:<br>
&gt; With go-1.21 dynamic linking cause a runtime panic:<br>
&gt;<br>
&gt; | root@qemux86-64:~# go-helloworld<br>
&gt; | panic: runtime error: index out of range [0] with length 0<br>
&gt; |<br>
&gt; | goroutine 1 [running]:<br>
&gt; | flag.init()<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/lib/go/src/flag/flag.go:1199 +=
0xf9<br>
&gt;<br>
&gt; In my opinion, this would be a good trade-off so that we can update an=
d<br>
&gt; leave the version 1.20 for the next LTS 5.0 since we are already quite=
<br>
&gt; behind on the version available upstream which already has the 1.22 av=
ailable.<br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/classes-recipe/goarch.bbclass | 14 +++++++-------<br>
&gt;=C2=A0 =C2=A01 file changed, 7 insertions(+), 7 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes-recipe/goarch.bbclass b/meta/classes-recipe/=
goarch.bbclass<br>
&gt; index 1ebe03864f..6899ec28e4 100644<br>
&gt; --- a/meta/classes-recipe/goarch.bbclass<br>
&gt; +++ b/meta/classes-recipe/goarch.bbclass<br>
&gt; @@ -38,13 +38,13 @@ BASE_GOARM:armv5 =3D &#39;5&#39;<br>
&gt;=C2=A0 =C2=A0# Go supports dynamic linking on a limited set of architec=
tures.<br>
&gt;=C2=A0 =C2=A0# See the supportsDynlink function in go/src/cmd/compile/i=
nternal/gc/main.go<br>
&gt;=C2=A0 =C2=A0GO_DYNLINK =3D &quot;&quot;<br>
&gt; -GO_DYNLINK:arm ?=3D &quot;1&quot;<br>
&gt; -GO_DYNLINK:aarch64 ?=3D &quot;1&quot;<br>
&gt; -GO_DYNLINK:x86 ?=3D &quot;1&quot;<br>
&gt; -GO_DYNLINK:x86-64 ?=3D &quot;1&quot;<br>
&gt; -GO_DYNLINK:powerpc64 ?=3D &quot;1&quot;<br>
&gt; -GO_DYNLINK:powerpc64le ?=3D &quot;1&quot;<br>
&gt; -GO_DYNLINK:class-native ?=3D &quot;&quot;<br>
&gt; +GO_DYNLINK:arm =3D &quot;&quot;<br>
&gt; +GO_DYNLINK:aarch64 =3D &quot;&quot;<br>
&gt; +GO_DYNLINK:x86 =3D &quot;&quot;<br>
&gt; +GO_DYNLINK:x86-64 =3D &quot;&quot;<br>
&gt; +GO_DYNLINK:powerpc64 =3D &quot;&quot;<br>
&gt; +GO_DYNLINK:powerpc64le =3D &quot;&quot;<br>
&gt; +GO_DYNLINK:class-native =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0GO_DYNLINK:class-nativesdk =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# define here because everybody inherits this class<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#196251): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/196251" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/196251</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10460008=
7/7304865" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/104600087/7304865</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:Qi.Chen@eng.windriver=
.com" target=3D"_blank">Qi.Chen@eng.windriver.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000c55d26061270177e--

