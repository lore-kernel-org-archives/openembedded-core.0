Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D80ACD6E7E
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 15:23:32 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.19428.1697037804271123369
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 08:23:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SFo7PhyD;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1dcf357deedso4333625fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 08:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697037803; x=1697642603; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YSToF2jNvQ6LtSl0JhT0Fax4xiRivIGsAUNfjSY7/Wk=;
        b=SFo7PhyDHMfz5KwdqxWGi6t7uXBW1ofjZA6ZVYHPREEZCqEuLpsUy4S8dEmd0idLdB
         g4ftsFMwS4gH+DwL1q+cAoEYYBKHmiBGt/cljX1+cG2aUFNDUou89Gf2Ah08vF8iDDVX
         d1L4yVENm+LkqNgWMnBQdRjNHWZeR1ukxfwPAWSmx9YOqeskfnEmrMe5XQ4+TCvzkBlm
         dCMM/pkPVj+zg5BnkKGj1dOYFAVEGmJdDUQSsiXPjUDxkQVJ/XG1O/OSixgjs7/cCTvm
         kgrWrsImIye4S98JU0ipEMw7geoc1bScVLIOnyo/ubIgXgWweBHKvbE+V77ZSwj45HqA
         2VVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697037803; x=1697642603;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSToF2jNvQ6LtSl0JhT0Fax4xiRivIGsAUNfjSY7/Wk=;
        b=TsRgwoYlSuUCfJbBoTanP1h8TXa+JWyUytgDFl7p6103rj3G2YBCuwFQ5OhWYN3Wjc
         c9LaalYnDGeaVg90eLwGCJ+U/yU9bfz7uoPPpAwKEEqw4/yL6SaQDw7yDKslRIakB7IV
         9JjvnYixuRrEaHC5jxgN9oWoD/48z5AiM/WqnFnz4oCdf9KCwJ1DqUI+uDSRHeZsM0LW
         ol3Xr/vIuPXr2SM8r4pAvaqzisDHtbkSVosRQnRM1qkCqbsgrgYk+Aj590rO1tMyAIgG
         Bo93gjyQgbvahORiqjtrpXB9+A8fcB8KJEKalUwi9CJe1bMjAX5yoDKfhu0URxAqbXrm
         UkyQ==
X-Gm-Message-State: AOJu0YwzsGzTBzF+esVf5zi/8a0k2xLHkacmqLk78aORnSjG1wBCgeFb
	nSKdZn0Cgu/Qktf3bAsEypA+ak9NNY2J4iEFF/Q=
X-Google-Smtp-Source: AGHT+IHduJMbvPo8NlJnyU49sGOBzk6c5OVl0Ge6kKRZzvT2aVPgSWzm6up/F1fbdOhavbmE+lhyESl0r+I8rn7P74Q=
X-Received: by 2002:a05:6870:96a2:b0:1d6:d8d3:f6dc with SMTP id
 o34-20020a05687096a200b001d6d8d3f6dcmr27721014oaq.36.1697037803356; Wed, 11
 Oct 2023 08:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20231001102818.797907-1-cordlandwehr@kde.org> <CANNYZj_mUOxDWyT68ygkD4q5dEwP08FdAsb7JG1UUxesDorzfQ@mail.gmail.com>
 <3acd980a-f3d2-cd5b-faef-8dbcca331dee@kde.org> <CANNYZj9TFgmGHBk7uBZLMg30ff2s7Z5g8qrfjPQv6de_yJeqLQ@mail.gmail.com>
 <66dfcec888daf354f55ae0a85c6a68a2bd2994e6.camel@linuxfoundation.org>
In-Reply-To: <66dfcec888daf354f55ae0a85c6a68a2bd2994e6.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Oct 2023 08:23:12 -0700
Message-ID: <CAMKF1sqB8yO9+jSmuYpR0u=nwGuGUUoaAHiFDhPE38QDAVkDnA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wayland: consider pkgconfig sysroot for pkgdatadir
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Andreas Cord-Landwehr <cordlandwehr@kde.org>, 
	Ross Burton <ross.burton@arm.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007085320607726777"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 15:23:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188963

--0000000000007085320607726777
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 12:59 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2023-10-11 at 09:48 +0200, Alexander Kanavin wrote:
> > Hello Andreas,
> >
> > thanks for the explanation, this s fine, but can you add it to the
> > commit message so it's preserved in history?
> >
> > I'd say we do need to switch to a maintained implementation of
> > pkgconfig, and align with regular distros on that, Ross, do you know
> > if something's holding that back (other than the usual lack of
> > time/people/patience with chasing corner cases etc).
>
> The two options have incompatible behaviour and it wasn't clear that
> either have a good maintenance path last time we looked. Most software
> is aligned with the version we have which is the standard.
>

There were some missing aspects w.r.t sysroot as well which is useful for
cross compilation maybe that=E2=80=99s working now I haven=E2=80=99t looked=
 at it for a
long time


> pkg-config is relatively stable, it doesn't change much and that is a
> good thing due to the way it is used. The question is whether the "lack
> of maintenance" is causing us a problem, I'm not sure it is. I suspect
> we're better focusing on other areas.
>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188944):
> https://lists.openembedded.org/g/openembedded-core/message/188944
> Mute This Topic: https://lists.openembedded.org/mt/101689465/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007085320607726777
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Oct 11, 2023 at 12:59 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, 2023-=
10-11 at 09:48 +0200, Alexander Kanavin wrote:<br>
&gt; Hello Andreas,<br>
&gt; <br>
&gt; thanks for the explanation, this s fine, but can you add it to the<br>
&gt; commit message so it&#39;s preserved in history?<br>
&gt; <br>
&gt; I&#39;d say we do need to switch to a maintained implementation of<br>
&gt; pkgconfig, and align with regular distros on that, Ross, do you know<b=
r>
&gt; if something&#39;s holding that back (other than the usual lack of<br>
&gt; time/people/patience with chasing corner cases etc).<br>
<br>
The two options have incompatible behaviour and it wasn&#39;t clear that<br=
>
either have a good maintenance path last time we looked. Most software<br>
is aligned with the version we have which is the standard.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">There were some =
missing aspects w.r.t sysroot as well which is useful for cross compilation=
 maybe that=E2=80=99s working now I haven=E2=80=99t looked at it for a long=
 time=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><br>
pkg-config is relatively stable, it doesn&#39;t change much and that is a<b=
r>
good thing due to the way it is used. The question is whether the &quot;lac=
k<br>
of maintenance&quot; is causing us a problem, I&#39;m not sure it is. I sus=
pect<br>
we&#39;re better focusing on other areas.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#188944): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/188944" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/188944</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101689465/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101689465/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000007085320607726777--

