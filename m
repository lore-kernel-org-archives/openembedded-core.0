Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDC6C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 15:01:30 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.37413.1679929288706877503
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 08:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CUvNqjYt;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id a21so2178870ljq.10
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 08:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679929287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ukX+7yjneRxGIl6RkJpWqjEbCtQIoIT04t1hZKAQFtg=;
        b=CUvNqjYtIEQVrtKdqbip6/ZwOlfZdQQmRdUUe9PWr4hd0Hvgi9xzTPaweK8TZUpJ0A
         fst9G6afCl2e3DUGzrnPet/alpZcIHerfumAblU9ODjgMrM9TxWbTAP83YgS1MbUX2+1
         ymQeV1DVkGYVnR13+MJA6aYfkYPuKwdyCe8ShZzc6tb7ZaJ2wISybjpkp+xK9wOZHxcr
         uBcFhEpD7M6SiLKdSkwroI4KfwcW9Qdnj2KUKB+9r8E4RwKHSIcaLJHNX7NImtx60tTE
         LiNXoLPk+x2ie+YeE8WomuJGtUNFBJz8IauyQj2r1n3fxIt5iJ3B4ItSFHmf8dg3Io0e
         Owvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679929287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ukX+7yjneRxGIl6RkJpWqjEbCtQIoIT04t1hZKAQFtg=;
        b=BpWKGbhgH9T8vgYncgWgyUaFtTYDTyqlaS+n7YR/8Zz5Nkd6+KeueOn9npr4poiNOI
         AIQDoXFq2ee5e9b8GNNnTAWd6avEaPCgut+MrxyG8qAOtU6As0ly3NnpDLwk5+7r1l+j
         4Zo9ruk/ebrx8dFLpcsCw1TOM7A2/2S3+Ud9A7Hmu7ytLsXacr5QryurjlLjASnBSmBT
         BjXsgyAD4MFKc/dWt6AvMIK6sVneRfFP0K4snutyNvmM6L6Y0S6W4gq8BOTW7ORGQ+pI
         O0KcnKbTH8qUO6aXEIcXRZe71rwddAoo79j7UZOevSXkkD/dnebT8fWAYFRxI+TP4ijK
         DLAA==
X-Gm-Message-State: AAQBX9dEVIoODprTLFYK1BwNqXbvZxM1MkNfQwWxq+vEuOSziW8c6Pnu
	bXrxeKNZ1hSnJWCfcegFTefWQxAljiiiI53mZeg=
X-Google-Smtp-Source: AKy350bxxdm17xDLTz+0ouqmYHp6P+ddYSrVYW+zmdMnR+Tv11G+VSZF9JQKLf1z3P/IQoMgxlABlexT6mR9o6fcuVI=
X-Received: by 2002:a2e:6a07:0:b0:29f:caf0:f77f with SMTP id
 f7-20020a2e6a07000000b0029fcaf0f77fmr3682071ljc.3.1679929286702; Mon, 27 Mar
 2023 08:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679734210.git.frederic.martinsons@gmail.com>
 <094a85975f9b1ef0fc622f4f0acc70a935f1e6fe.camel@linuxfoundation.org> <CANNYZj8tNBngz4OLgF9YTKVQU08AjWgFf6JS2aHk0qQt=D6tBA@mail.gmail.com>
In-Reply-To: <CANNYZj8tNBngz4OLgF9YTKVQU08AjWgFf6JS2aHk0qQt=D6tBA@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 27 Mar 2023 17:01:15 +0200
Message-ID: <CA+cAkeqyAKnXHSvWDStkYCf6Uj99_OFaq5wQq60iLc6kkW7sDA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5] Extend cargo based recip support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000061b9cc05f7e304b6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 15:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179164

--00000000000061b9cc05f7e304b6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah!

Alright, I'll try to setup a devtool test which demonstrate the usage of
git subpath with the zvariant.
I'll then issue a V4 series which reintroduce the zvariant recipe in
meta-selftest and the unit test on it.

I must admit I felt in love for rust since the beginning of the year and
considering that I use yocto on a daily basis, I'll do everything I can to
extend the support of developing rust for embedded devices.

Thank you all for the advices.

Le lun. 27 mars 2023, 16:25, Alexander Kanavin <alex.kanavin@gmail.com> a
=C3=A9crit :

> So if devtool tests would operate on zvariant recipe, then the recipe
> can simply go into meta-selftest after all :)
>
> Alex
>
> On Mon, 27 Mar 2023 at 16:20, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Sat, 2023-03-25 at 10:00 +0100, Frederic Martinsons wrote:
> > > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> > >
> > > This series brings the support of local git repository inside
> > > a cargo based recipe.
> > >
> > > It also enable devtool capacity on it and provide a real crate
> > > example recipe to show how things are done.
> > >
> > > The following changes since commit
> 4876189dd2ae5a04a296b11b537b9f613159c6bf:
> > >
> > >   xcb-proto: Fix install conflict when enable multilib. (2023-03-23
> 22:38:41 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://gitlab.com/fmartinsons/openembedded-core
> cargo-extend-support-git-and-devtool
> > >
> > > Alex Kiernan (1):
> > >   cargo_common.bbclass: Support local github repos
> > >
> > > Frederic Martinsons (4):
> > >   cargo_common.bbclass: add support of user in url for patch
> > >   rust-example: provide a recipe for zvariant
> > >   devtool: add support for multiple git url inside a cargo based reci=
pe
> > >   patch: support of git patches when the source uri contained subpath
> > >     param
> >
> > The various rust/cargo/crate patches look like they're heading in a
> > good direction, thanks!
> >
> > The one thing which I think is missing is more support for testing some
> > of these changes in our automated testing.
> >
> > In particular, devtool does have a decent test suite so we should
> > ensure new devtool additions have tests.
> >
> > You can see the devtools tests in
> > meta/lib/oeqa/selftest/cases/devtool.py and run them with a command
> > like "oe-selftest -r devtool -j 3" for example.
> >
> > Cheers,
> >
> > Richard
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#179160):
> https://lists.openembedded.org/g/openembedded-core/message/179160
> > Mute This Topic: https://lists.openembedded.org/mt/97840361/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000061b9cc05f7e304b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ah!<div dir=3D"auto"><br></div><div dir=3D"auto">Alright,=
 I&#39;ll try to setup a devtool test which demonstrate the usage of git su=
bpath with the zvariant.</div><div dir=3D"auto">I&#39;ll then issue a V4 se=
ries which reintroduce the zvariant recipe in meta-selftest and the unit te=
st on it.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I must admit I=
 felt in love for rust since the beginning of the year and considering that=
 I use yocto on a daily basis, I&#39;ll do everything I can to extend the s=
upport of developing rust for embedded devices.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Thank you all for the advices.=C2=A0</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le lun. 2=
7 mars 2023, 16:25, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com">alex.kanavin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">So if devtool tests would operate on zvariant reci=
pe, then the recipe<br>
can simply go into meta-selftest after all :)<br>
<br>
Alex<br>
<br>
On Mon, 27 Mar 2023 at 16:20, Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
 rel=3D"noreferrer">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sat, 2023-03-25 at 10:00 +0100, Frederic Martinsons wrote:<br>
&gt; &gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinso=
ns@gmail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gmai=
l.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; This series brings the support of local git repository inside<br>
&gt; &gt; a cargo based recipe.<br>
&gt; &gt;<br>
&gt; &gt; It also enable devtool capacity on it and provide a real crate<br=
>
&gt; &gt; example recipe to show how things are done.<br>
&gt; &gt;<br>
&gt; &gt; The following changes since commit 4876189dd2ae5a04a296b11b537b9f=
613159c6bf:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0xcb-proto: Fix install conflict when enable multilib.=
 (2023-03-23 22:38:41 +0000)<br>
&gt; &gt;<br>
&gt; &gt; are available in the Git repository at:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/fmartinsons/openembedde=
d-core" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/=
fmartinsons/openembedded-core</a> cargo-extend-support-git-and-devtool<br>
&gt; &gt;<br>
&gt; &gt; Alex Kiernan (1):<br>
&gt; &gt;=C2=A0 =C2=A0cargo_common.bbclass: Support local github repos<br>
&gt; &gt;<br>
&gt; &gt; Frederic Martinsons (4):<br>
&gt; &gt;=C2=A0 =C2=A0cargo_common.bbclass: add support of user in url for =
patch<br>
&gt; &gt;=C2=A0 =C2=A0rust-example: provide a recipe for zvariant<br>
&gt; &gt;=C2=A0 =C2=A0devtool: add support for multiple git url inside a ca=
rgo based recipe<br>
&gt; &gt;=C2=A0 =C2=A0patch: support of git patches when the source uri con=
tained subpath<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0param<br>
&gt;<br>
&gt; The various rust/cargo/crate patches look like they&#39;re heading in =
a<br>
&gt; good direction, thanks!<br>
&gt;<br>
&gt; The one thing which I think is missing is more support for testing som=
e<br>
&gt; of these changes in our automated testing.<br>
&gt;<br>
&gt; In particular, devtool does have a decent test suite so we should<br>
&gt; ensure new devtool additions have tests.<br>
&gt;<br>
&gt; You can see the devtools tests in<br>
&gt; meta/lib/oeqa/selftest/cases/devtool.py and run them with a command<br=
>
&gt; like &quot;oe-selftest -r devtool -j 3&quot; for example.<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#179160): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/179160" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1791=
60</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97840361=
/1686489" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/97840361/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanav=
in@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavin@gmail.com</=
a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000061b9cc05f7e304b6--

