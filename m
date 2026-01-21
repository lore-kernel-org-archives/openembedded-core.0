Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F016C44529
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 12:55:41 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11137.1769000133814241656
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 04:55:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dD4h7VAo;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4359a302794so452712f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 04:55:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769000132; cv=none;
        d=google.com; s=arc-20240605;
        b=gTaiek5RNEWVcK40uuUFjH+f+lsodsVYZA6QuMHyGrKvYHqn2m79JI6BkNNiYFz8t9
         C1bGKyyNI/SzM++53/J5YAwaZvlBfe22NUqJNpB2keI1ZUSNd52k0s7ocRhrA7p6cmhd
         vtC6eu9yiIFW9VOldQqfZN9QyWICMsf+L873q1qsFihYrDZlCyRXG4t10WV/HWBdflOK
         jc+WCOLG+gvWx8Zg16MVSJQjUVR0lfb74iTrdbqTzSBpx9MxNJ1P9vxvTrGsl6HyOkA8
         xFObZ9T1Xo2OyTHfYy2a0ry6JhGdQqBtjnr3IH6dFIN+QW/djqBF7s75w7gW3X1czbmD
         70bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1/Y+yU0wn6naVCTbnFXmVwlYyF5ezPd9caEzA/BKu08=;
        fh=KaGtVOX57QKv6VHyyMzkWdwZ/HspkghrN7X4wcKOCpM=;
        b=jTvehPdrGAB1InNouR8lJ7gH59Fu9xzx20kxtOaWMDPA1w4BsE7jOvaCHcFiSLWYRO
         FJ86tk+j5lrgjQxpN2GFV1S2q8AQojSt6oUNqe+l5dn8p5J+uzPFnep1/DYEdF26XOCT
         pe/M0eFDF6xSBKEOFZN27IQgrlcERVt1c9ABfcgw1e2K2rShG3mSZBhQWVPr6+OQ2/Ej
         mqBbDy7CmjbUKsI7fwDp0t2x3DdqPJstg2GCIqCdO4kN/b0pWjW6UEVxmHQpoVonkwAE
         FZz79J9ITO/dY0ygsYOtfRFwNQH9O9wcrLgKi8l5G4c4ukeea5SrKW40moMGyPNGf4VN
         3JHQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769000132; x=1769604932; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1/Y+yU0wn6naVCTbnFXmVwlYyF5ezPd9caEzA/BKu08=;
        b=dD4h7VAopZZsEq6COQdo+TL1f+w06Qzzw73Ocg6ly0+Qjsmmlk4V3XTlYj4F5/3TVm
         30mxYD0GQTg00PoBcxU99XtJxxgH3RVycKob6xidoD6Qz/dXBkjdK8RCiKkkYaKP4Z4L
         xp/a1214a+cO1D1ndY4MJbbr0jf8sp9CVZCJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769000132; x=1769604932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/Y+yU0wn6naVCTbnFXmVwlYyF5ezPd9caEzA/BKu08=;
        b=JtlZpRSYZVfJFEsFxs1+1UxIIFHkVm2OZpAnjtrySF59i42coPlqLTLDeOOOvk/YnU
         GYQfVVoZd/VVY/0VM84H6HYLNQT6wnNe7QkJoaiF8RxkkXhD7ev4TZae5Q6pZeeGe6EE
         AOSdoCLtDn4+KHvBoljVuywb5iwVF5k84R+/W1r78xmwHmK9is76JyBMNsgN8k9HJY4i
         kY4Qc1kuC3V1O64lJksEKxMQuKnvhi0c0Ecny3O2BzMWSsaTRevmkU7IISfg+E08Z8R3
         /VbeLWyn+aJOjumuW0SEmmr9tBqe2A4G3d2W8E2a1MkVlNKL659U1AuM7aVY3ck4XVIq
         eeBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnq3BrQvy5eY0DDzaFcpZQ44Q0vFAXIcKOILNP+PDElPYnPsDTbxJr21zXrWdp+WUDa0I03mXa9H6Go1d0ZP3aXg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwmNMB69iP9Gd8ZeIeV+6+tdUZXqtmO+QqMC8Iz3Tk0O+cvrQXl
	S1vFBIzv5NbyifIN41Tjt3o8ReIcDO2vIOJvR27GzPwRBkKFFiD3HeJVER+UDZ9yUUuXe5WsEI5
	vb0sq7h50byESnc/OcrfmfuahHpn7g/Gg4Zl3dqsmZg==
X-Gm-Gg: AZuq6aLG0Fy14JhropqBoTKA8QmSRcnK7x9x4bFclYhJ67bcEAiUDGw673hxs+n51mW
	9zQ5Yeri5uEM74HaviDBmhLK+q+nPk6JUoZO3/zwuqR7np0/8Fx0nHG7RmX4ndCdk+HceTihqDI
	p+ZDIY6lQPqMpvFzZpACI0xnHmJKCgQumpe3Ha8IMsWRJdSpvBpsHqH/j+dX7ADjSmRis53qZHv
	agSlLoqe7aZ78ozbDuGvzDXoUwxkSDiC7IKkXW7fdBrOGkQQ5uRgzTe0gYwIg0oZnzn3MRiJw==
X-Received: by 2002:a05:6000:2383:b0:435:a194:734 with SMTP id
 ffacd0b85a97d-435a1a35115mr2284547f8f.5.1769000132153; Wed, 21 Jan 2026
 04:55:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1768906687.git.yoann.congal@smile.fr> <c689e7db6f4a01e0c81765e112371f64c4bf8221.1768906687.git.yoann.congal@smile.fr>
 <4cb6999862b53c7d0d3e1ab28b9770abe7156b5e.camel@pbarker.dev>
 <AS1PR10MB5697AAF15115E5E64EA41EC6FD96A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <9e514222713728ce4350e091191b449ac28860ba.camel@pbarker.dev>
In-Reply-To: <9e514222713728ce4350e091191b449ac28860ba.camel@pbarker.dev>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 21 Jan 2026 13:55:06 +0100
X-Gm-Features: AZwV_Qg-yWNdyOY0vcaJHw2fH8QBM878cCun5-2ZoyrTzoDofH5LYZ_6VGpe5cw
Message-ID: <CAMSfU+6vRnAo5-CGaF+8-bWgw1kUqpss_AjwpA-Z2fGCL7nD2A@mail.gmail.com>
Subject: Re: [OE-core][whinlatter 03/15] libpng: upgrade 1.6.52 -> 1.6.53
To: Paul Barker <paul@pbarker.dev>
Cc: peter.marko@siemens.com, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007c22070648e570b2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 12:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229812

--0000000000007c22070648e570b2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 21 janv. 2026 =C3=A0 13:50, Paul Barker <paul@pbarker.dev> a =C3=A9=
crit :

> On Wed, 2026-01-21 at 12:43 +0000, Peter Marko via
> lists.openembedded.org wrote:
> >
> > > -----Original Message-----
> > > From: Paul Barker <paul@pbarker.dev>
> > > Sent: Wednesday, January 21, 2026 13:38
> > > To: yoann.congal@smile.fr; openembedded-core@lists.openembedded.org
> > > Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > > Subject: Re: [OE-core][whinlatter 03/15] libpng: upgrade 1.6.52 ->
> 1.6.53
> > >
> > > On Tue, 2026-01-20 at 12:23 +0100, Yoann Congal via
> > > lists.openembedded.org wrote:
> > > > From: Alexander Kanavin <alex@linutronix.de>
> > > >
> > > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > > Signed-off-by: Mathieu Dubois-Briand <
> mathieu.dubois-briand@bootlin.com>
> > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > >
> > > Is this is a cherry-pick of fa33deb30783 from master?
> > >
> > > If so, the commit message should point at the cherry-picked commit.
> > > `git cherry-pick -xs` usually does the right thing.
> >
> > Yes, it's a cherry-pick of that commit.
> > I am very spoiled by cherry-picking in poky which had the reference
> already prepared.
> > With poky gone it's very easy to forget to add the ref "manually".
> >
> > Will you add the reference or should I submit a v2?
>
> Hi Peter,
>
> We're all still adapting to the new way of doing things!
>
> I think the reference can easily be added by Yoann or myself before this
> set of patches gets merged to whinlatter.
>

Yes, I will add the reference before sending the pull request.

Thanks Paul, nice catch!


> Best regards,
>
> --
> Paul Barker
>
>

--=20
Yoann Congal
Smile ECS

--0000000000007c22070648e570b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 21=
 janv. 2026 =C3=A0=C2=A013:50, Paul Barker &lt;<a href=3D"mailto:paul@pbark=
er.dev">paul@pbarker.dev</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Wed, 2026-01-21 at 12:43 +0000, Pet=
er Marko via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; <br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: Paul Barker &lt;<a href=3D"mailto:paul@pbarker.dev" target=
=3D"_blank">paul@pbarker.dev</a>&gt;<br>
&gt; &gt; Sent: Wednesday, January 21, 2026 13:38<br>
&gt; &gt; To: <a href=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yo=
ann.congal@smile.fr</a>; <a href=3D"mailto:openembedded-core@lists.openembe=
dded.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a><br=
>
&gt; &gt; Cc: Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Ma=
rko@siemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br>
&gt; &gt; Subject: Re: [OE-core][whinlatter 03/15] libpng: upgrade 1.6.52 -=
&gt; 1.6.53<br>
&gt; &gt; <br>
&gt; &gt; On Tue, 2026-01-20 at 12:23 +0100, Yoann Congal via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutroni=
x.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@=
linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Mathieu Dubois-Briand &lt;<a href=3D"mailto:m=
athieu.dubois-briand@bootlin.com" target=3D"_blank">mathieu.dubois-briand@b=
ootlin.com</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.=
purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundatio=
n.org</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko=
@siemens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.cong=
al@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; Is this is a cherry-pick of fa33deb30783 from master?<br>
&gt; &gt; <br>
&gt; &gt; If so, the commit message should point at the cherry-picked commi=
t.<br>
&gt; &gt; `git cherry-pick -xs` usually does the right thing.<br>
&gt; <br>
&gt; Yes, it&#39;s a cherry-pick of that commit.<br>
&gt; I am very spoiled by cherry-picking in poky which had the reference al=
ready prepared.<br>
&gt; With poky gone it&#39;s very easy to forget to add the ref &quot;manua=
lly&quot;.<br>
&gt; <br>
&gt; Will you add the reference or should I submit a v2?<br>
<br>
Hi Peter,<br>
<br>
We&#39;re all still adapting to the new way of doing things!<br>
<br>
I think the reference can easily be added by Yoann or myself before this<br=
>
set of patches gets merged to whinlatter.<br></blockquote><div><br></div><d=
iv>Yes, I will add the reference before sending the pull request.</div><div=
><br></div><div>Thanks Paul, nice catch!</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">

Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000007c22070648e570b2--

