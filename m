Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75FD5CE79DD
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 14:31:52 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.41227.1695220304334184281
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 07:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VjHxDBXK;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2c124adf469so9484741fa.0;
        Wed, 20 Sep 2023 07:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695220302; x=1695825102; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8xLVa9NjcewA7vwJSgB6DoFiXN3SxHPWnNUw03X420w=;
        b=VjHxDBXKIbR1tJ+v48j7ITODfZHBzDBywcK0OgRqwzeh2MWhxXEV9csEk/PHL0/mYj
         ACPzjL5+sKxDFLkQ3us0DYEAlOoR/u884RiTl9A4qOfeh/CWdH+jY6yq8+VG+Wztg6I1
         DMZWi+k/pYXngK3LlP3D8snMKoYjCdJBBgGt5s2HiKq8hlA2B44TpQZxan6PPsqq+2Gx
         Nzrehig3gdqBZlvOJa18xVLAWbCtXo8T/1XSOj98UksmWE3yddpayobVeCM/i6aMfRmm
         hgyYtooEsQ/+JQeFCR7xnC1hAy4okAtSuoarP1fgqOqDWk9Hp0e4MJjj9Wlq8ykbo8I1
         +yxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695220302; x=1695825102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xLVa9NjcewA7vwJSgB6DoFiXN3SxHPWnNUw03X420w=;
        b=qeslwdJwd7PRNs9LwBMaqVo0is/MqHHIkx9Vg0UrMxCdmoGZgvEPIiPnlybTh1nnYh
         cumjCtZOn8jFL1S7LoaJtS0FZnZiSB7Q211Wu8lGWNEjOtqyvWQgQHn7M4Lu74AIBFQP
         tjAwKMO8uUqqHlWUW1X3Z0/QlpPT/NJZRqjjnpbgqq2MbtzIucjONG8IDSHg85WQn66w
         NPOpVB/hzDMtUNgb450XXtUwBgwMqh4++NRGdWSvs0RFnhcx1Tn86QjL3NPITKveUCAm
         z5y56VVYq+GT2uChshRcIJbzO3bTM8UeALK5Ad0uaVhnI9oy0zhjuSIeyo4OrFbsDAKf
         lr9A==
X-Gm-Message-State: AOJu0YwPLmh/F7woWm63bfcWa8UTwydbr9kXOdL+mZo2XfJFW7zcuKed
	rOkrhrCNmUdoeRzqy3Dy5pkylxW61vdL0qy1mdU=
X-Google-Smtp-Source: AGHT+IEMY/8hBwlrEg5QuoT4QZUUHZeOehHqASjXXKR8q+KUys+yY1qvHJmLy9oAQ4dqiGHxa45wAZMnnSlkqSC856Q=
X-Received: by 2002:a2e:b00e:0:b0:2bf:d379:275b with SMTP id
 y14-20020a2eb00e000000b002bfd379275bmr2449477ljk.20.1695220302087; Wed, 20
 Sep 2023 07:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
 <CANNYZj_uSknujoQUK2yV7U4N+WW_RkUH=sJnFDBfZgV0G5fv7Q@mail.gmail.com>
 <5ef99df95ab74e74df6f1e07ef4877487230d9fe.camel@linuxfoundation.org>
 <CANNYZj9mekKZwHs839m3r8sYbTiTLPaqzP=8C_-9=4w6MiJTaA@mail.gmail.com> <CAEHHSvbb9O_5zOBWvae+sCCouW+RyjMY+J8wOdtx2jixwFqN5A@mail.gmail.com>
In-Reply-To: <CAEHHSvbb9O_5zOBWvae+sCCouW+RyjMY+J8wOdtx2jixwFqN5A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Sep 2023 16:31:31 +0200
Message-ID: <CANNYZj_7zmvsZ1fJHoxkN-YgspaTD6Cei1qp-TS5Axw2D-0HLA@mail.gmail.com>
Subject: Re: Core workflow: sstate for all, bblock/bbunlock, tools for why is
 sstate not being reused?
To: Julien Stephan <jstephan@baylibre.com>
Cc: ",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Michael Halstead <mhalstead@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ec0bab0605cb3b06"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 14:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187927

--000000000000ec0bab0605cb3b06
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That=E2=80=99s great to hear! When you have a new patch set please post it =
here. I
think there=E2=80=99s also a new reply from RP that you need to consider.

Alex

On Wed 20. Sep 2023 at 16.25, Julien Stephan <jstephan@baylibre.com> wrote:

> Hi Alexander,
> About bblock tool: I just force pushed my branch on poky-contrib
> (https://git.yoctoproject.org/poky-contrib/log/?h=3Djstephan/bblock),
> trying to fix an autobuilder issue reported by Alexandre Belloni.
> I am still working on this, and I would be very happy to get this merged =
:)
>
> Cheers
> Julien
>
> Le ven. 15 sept. 2023 =C3=A0 10:28, Alexander Kanavin
> <alex.kanavin@gmail.com> a =C3=A9crit :
> >
> > On Thu, 14 Sept 2023 at 21:54, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >
> > > Effectively those "configs" are what the eSDK is, you're just proposi=
ng
> > > a server side set of them rather than a built copy. In many ways that
> > > could be useful way of possibly rethinking the way the eSDK works.
> > >
> > > So in that sense I like the idea, we should just be clear the problem
> > > it solves as it doesn't solve the "why is my build not using the cach=
e"
> > > question specifically but it potentially solves other issues.
> >
> > Right, I didn't make it clear that this idea is not about 'why sstate
> > is not being reused', but rather something I thought of to avoid
> > placing people in that situation to begin with - offering them
> > 'pre-fabricated builds' with guaranteed sstate availability. I have a
> > hunch there'll be plenty, for whom this is just fine, and eventually
> > this could be the basis of that oe-setup holy grail :)
> >
> > I'll start with the simplest enhancement of printing what would be
> > rebuilt. There's a lot of code I need to understand, so this needs to
> > be in manageable chunks :)
> >
> > Alex
>

--000000000000ec0bab0605cb3b06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">That=E2=80=99s great to hear! When you have a new patch s=
et please post it here. I think there=E2=80=99s also a new reply from RP th=
at you need to consider.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Wed 20. Sep 2023 at 16.25, Julien Stephan &lt;<a href=3D"mailt=
o:jstephan@baylibre.com">jstephan@baylibre.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(2=
04,204,204)">Hi Alexander,<br>
About bblock tool: I just force pushed my branch on poky-contrib<br>
(<a href=3D"https://git.yoctoproject.org/poky-contrib/log/?h=3Djstephan/bbl=
ock" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/poky=
-contrib/log/?h=3Djstephan/bblock</a>),<br>
trying to fix an autobuilder issue reported by Alexandre Belloni.<br>
I am still working on this, and I would be very happy to get this merged :)=
<br>
<br>
Cheers<br>
Julien<br>
<br>
Le ven. 15 sept. 2023 =C3=A0 10:28, Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; a =C3=A9crit :<br>
&gt;<br>
&gt; On Thu, 14 Sept 2023 at 21:54, Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; Effectively those &quot;configs&quot; are what the eSDK is, you&#=
39;re just proposing<br>
&gt; &gt; a server side set of them rather than a built copy. In many ways =
that<br>
&gt; &gt; could be useful way of possibly rethinking the way the eSDK works=
.<br>
&gt; &gt;<br>
&gt; &gt; So in that sense I like the idea, we should just be clear the pro=
blem<br>
&gt; &gt; it solves as it doesn&#39;t solve the &quot;why is my build not u=
sing the cache&quot;<br>
&gt; &gt; question specifically but it potentially solves other issues.<br>
&gt;<br>
&gt; Right, I didn&#39;t make it clear that this idea is not about &#39;why=
 sstate<br>
&gt; is not being reused&#39;, but rather something I thought of to avoid<b=
r>
&gt; placing people in that situation to begin with - offering them<br>
&gt; &#39;pre-fabricated builds&#39; with guaranteed sstate availability. I=
 have a<br>
&gt; hunch there&#39;ll be plenty, for whom this is just fine, and eventual=
ly<br>
&gt; this could be the basis of that oe-setup holy grail :)<br>
&gt;<br>
&gt; I&#39;ll start with the simplest enhancement of printing what would be=
<br>
&gt; rebuilt. There&#39;s a lot of code I need to understand, so this needs=
 to<br>
&gt; be in manageable chunks :)<br>
&gt;<br>
&gt; Alex<br>
</blockquote></div></div>

--000000000000ec0bab0605cb3b06--

