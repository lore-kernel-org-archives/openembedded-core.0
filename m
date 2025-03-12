Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99878C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 10:52:18 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.33940.1741776735436303607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 03:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=mgRdsCrw;
 spf=pass (domain: ossystems.com.br, ip: 209.85.214.179, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2254e0b4b79so40354945ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 03:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1741776734; x=1742381534; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fd6pRCzI+69YPxwGOtpFHn9Gtr2JJOsrDFFa7VEO7Is=;
        b=mgRdsCrwdIJhFcMlnfe1XafrGEi887usivxMHgulr3/EN5cM5rHyM+G+Dgz70hGgeu
         kgmhb5mDfvM+YJSa5MJWWKO1h+ZBan0Sipp1c+A3N750dulp9XtvnRqaBv2dqv+sVz9O
         clFvbwKcpnTw9sAWYjdgJaPjSnDBpLEQ3fneqVsTv20ZdDrg3XWB1oFV6iW6Jb2GO2BN
         MEJu+t2tTl/KimKFsRpm8rKMzKDr/VYlPkkf3q9xZTzT1rmUXH2nBzgBnszSsfaED9fa
         4l/Cx1lZU4flNUtzfEwVF8tvBEw6ueZfzpluIfgVUdSkKDU4lLuSTkU6f9Zn9UuzLe8v
         fEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776734; x=1742381534;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fd6pRCzI+69YPxwGOtpFHn9Gtr2JJOsrDFFa7VEO7Is=;
        b=nYtSptXeL9zDedXbcPu38dNG8Q63KVlZ28ijmZndyxLYsSv+FAwoVesyh1tqEeMujq
         SR3JPVPHVvBqQZ9m8dTuIJZ4lcpCr/w0epd4k/p7U3aZ3WPhCsdc6oeZMDbZSZMClaLe
         TOnrCCC6zzPSkHY+6zeLBEL5Y/PX0lzo/capHvEVZwPiVkzFYAF6fyBESsS1uAeA0/c0
         8Hl+ZaeEtRslqHaZewMWJiuYqO/qRPYegOVjqT5bqaNC8CTirwaBI42kVSNUup+D9Vis
         4cr6U5vwK4sv47WMFKzDCIyJkgl28xNr2mtNY0iPqzUzTQ6RpUixNOkBI/vdps07TRi7
         b//A==
X-Forwarded-Encrypted: i=1; AJvYcCUUpWIZCaj4xXYF/cs/NQDcZ0Y4rcQMNGYXGToTPvAkSXSqLPB8f1dImCeDE146T2vFGrd8f4cJSCi7P08SOdkN/Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxe+P6bcmJxaAQ927aVmA8YFtP0/26nMwGG/XNdrkomqgB6QqG7
	ywARYOSKb94ya7zypC9HkUXzikEieTQaSVBrfUxiWBison6gwx+nWl8aItcnkQVObgeHGi1PVg3
	yLFM=
X-Gm-Gg: ASbGncvzFZLvdT/ueP5uT8QU3JcSw6uyLpCvtZ76oVp8m0WumFBp58X5ciTP+PQo16n
	XfVyzAo1d25eIQuAnWRYG5FFlmJUfsF43+cWIm7DM+KsV2xnfERAeWM3MU1nzscLYTXasugRSx0
	7tSDHqDF5Rq0SROASqXJvw0Om57ZuuIYuDBjYehFniU9WGDYLhs00HmPOEqe/JmdJfIHMKf7184
	A5EiDaJ1NhT2OG5pz9CZr7OfNa5iIl+g9pyrtMki/Z7lE/dLMT/8062F6K1ost/2aPI3hQlNlz9
	RBREEXnGmXBj23a3ecF5xmoG57KIulkg05Rzg4Xh/+S7wE8TLsHec9ZlH33yeqxRfiZyTc4932j
	CQ52ogNKToWo=
X-Google-Smtp-Source: AGHT+IGYAutmzpxy7Gz8N0fNGkEWvhAu/jo3gRji6ekqkvsoh3S3W7ZAo84iT7jNNl96Z54D6SRbgA==
X-Received: by 2002:a05:6a00:cc2:b0:736:4704:d5da with SMTP id d2e1a72fcca58-736aab14d5amr31906920b3a.22.1741776734080;
        Wed, 12 Mar 2025 03:52:14 -0700 (PDT)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com. [209.85.216.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736c5e9195dsm7551010b3a.160.2025.03.12.03.52.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 03:52:13 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso11226484a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 03:52:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIpCbdWoLmSN6WuLtLmnbaec/SW5KJE/P9rcRmAtWKLx+Fo8GqWSrAgyH8CKu7+AcweRtbnfdHOTz5YToOrnyi0A==@lists.openembedded.org
X-Received: by 2002:a17:90b:1b05:b0:2ee:8427:4b02 with SMTP id
 98e67ed59e1d1-2ff7cef76acmr30395145a91.28.1741776732607; Wed, 12 Mar 2025
 03:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <40fd57cb-deaa-480c-8ec6-87ca1a55e21d@ti.com> <CANNYZj_p96AQaaPqW52m_gCKGrPqxKWmC3t2TOrPnmKP6A+Kcg@mail.gmail.com>
In-Reply-To: <CANNYZj_p96AQaaPqW52m_gCKGrPqxKWmC3t2TOrPnmKP6A+Kcg@mail.gmail.com>
Date: Wed, 12 Mar 2025 07:52:00 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqCBNLpUOBO=+W83x4vWydt12+=zZvJ-8ciNgMZdN1zNQ@mail.gmail.com>
X-Gm-Features: AQ5f1JoYM1qPPgOdgdL-HLgN9Z_S9w7EDm-hdMc7gTgJEoPGW8tAfMQf3Kf-Bz8
Message-ID: <CAP9ODKqCBNLpUOBO=+W83x4vWydt12+=zZvJ-8ciNgMZdN1zNQ@mail.gmail.com>
Subject: Re: [oe-core][RFC] Display manager proposal for x11 and wayland
To: alex.kanavin@gmail.com
Cc: rs@ti.com, Richard Purdie <richard.purdie@linuxfoundation.org>, ross.burton@arm.com, 
	alex@linutronix.de, otavio@ossystems.com.br, kexin.hao@windriver.com, 
	Andrew Davis <afd@ti.com>, Darren Etheridge <detheridge@ti.com>, Denys Dmytriyenko <denis@denix.org>, 
	Ryan Eatmon <reatmon@ti.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Pothukuchi, Vijay" <vijayp@ti.com>
Content-Type: multipart/alternative; boundary="0000000000006cebd4063022ff52"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 10:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212643

--0000000000006cebd4063022ff52
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

I totally get your concerns about long-term maintainability and how adding
new components to oe-core can complicate things. Still, Randolph's idea
does make a lot of sense, especially since our current setup has code
scattered in different places, making it tricky to maintain and potentially
causing issues down the road.

Checking out Randolph=E2=80=99s proposal, or maybe something similar, could=
 really
help tidy things up and improve maintainability for oe-core long-term.

Looking forward to hearing more thoughts on this!

Cheers,

Em qua., 12 de mar. de 2025 =C3=A0s 06:39, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
escreveu:

> I have a couple of concerns:
>
> - can this event handling be achieved simply by using udevadm which is
> available in any init system?
>
> - who is the author? What if they abandon the component? We've been
> reluctant to insert core graphical dependencies (e.g. more interesting
> compositors than weston) on not widely used things with unclear origin
> and support promise.
>
> - can you produce a patchset that showcases the benefits?
>
> Alex
>
> On Wed, 12 Mar 2025 at 01:46, Randolph Sapp via lists.openembedded.org
> <rs=3Dti.com@lists.openembedded.org> wrote:
> >
> > We've recently run into some issues with weston-init attempting to star=
t
> > Weston prior to all drm devices being registered. There's not really a
> > good, scriptable mechanism to listen in to device registration events
> > that works with the existing weston-init package. Well, at least one
> > that doesn't involve polling files or introducing more dependency on th=
e
> > init system being used.
> >
> > I also see there is also a lot of scripting around starting X11,
> > xserver-nodm-init, that (from my limited review) should experience the
> > same issue.
> >
> > I'd like to introduce the following display manager for oe-core, emptty
> > [1]. This display manager is, as described upstream, a "Dead simple CLI
> > Display Manager on TTY". It supports both x11 and wayland sessions, wit=
h
> > togglable build parameters to completely remove x11 and pam
> > dependencies. It's licensed MIT, which shouldn't be an issue for any
> > users. (It is written in Go, if you have opinions about that.)
> >
> > With this, both weston-init and the xserver-nodm-init packages can be
> > re-tuned to leverage this display manager and simply add a user and
> > emptty config for an autologin session. This can resolve the current
> > behavior across init systems without additional scripting, and move som=
e
> > development out of this layer.
> >
> > I already have a recipe for emptty, but I figured I would reach out for
> > comment to recent contributors before I submit any patches playing with
> > the existing init packages.
> >
> > [1] https://github.com/tvrzna/emptty
> >
> > - Randolph
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212640):
> https://lists.openembedded.org/g/openembedded-core/message/212640
> Mute This Topic: https://lists.openembedded.org/mt/111652153/3617537
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> otavio.salvador@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854

--0000000000006cebd4063022ff52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hi Alexander,</p>
<p>I totally get your concerns about long-term maintainability and how addi=
ng new components to oe-core can complicate things. Still, Randolph&#39;s i=
dea does make a lot of sense, especially since our current setup has code s=
cattered in different places, making it tricky to maintain and potentially =
causing issues down the road.</p>
<p>Checking out Randolph=E2=80=99s proposal, or maybe something similar, co=
uld really help tidy things up and improve maintainability for oe-core long=
-term.</p>
<p>Looking forward to hearing more thoughts on this!</p>
<p>Cheers,</p></div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">Em qua., 12 de mar. de 2025 =C3=A0s 06:=
39, Alexander Kanavin via <a href=3D"http://lists.openembedded.org">lists.o=
penembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.op=
enembedded.org">gmail.com@lists.openembedded.org</a>&gt; escreveu:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">I have a couple of conce=
rns:<br>
<br>
- can this event handling be achieved simply by using udevadm which is<br>
available in any init system?<br>
<br>
- who is the author? What if they abandon the component? We&#39;ve been<br>
reluctant to insert core graphical dependencies (e.g. more interesting<br>
compositors than weston) on not widely used things with unclear origin<br>
and support promise.<br>
<br>
- can you produce a patchset that showcases the benefits?<br>
<br>
Alex<br>
<br>
On Wed, 12 Mar 2025 at 01:46, Randolph Sapp via <a href=3D"http://lists.ope=
nembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org<=
/a><br>
&lt;rs=3D<a href=3D"mailto:ti.com@lists.openembedded.org" target=3D"_blank"=
>ti.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; We&#39;ve recently run into some issues with weston-init attempting to=
 start<br>
&gt; Weston prior to all drm devices being registered. There&#39;s not real=
ly a<br>
&gt; good, scriptable mechanism to listen in to device registration events<=
br>
&gt; that works with the existing weston-init package. Well, at least one<b=
r>
&gt; that doesn&#39;t involve polling files or introducing more dependency =
on the<br>
&gt; init system being used.<br>
&gt;<br>
&gt; I also see there is also a lot of scripting around starting X11,<br>
&gt; xserver-nodm-init, that (from my limited review) should experience the=
<br>
&gt; same issue.<br>
&gt;<br>
&gt; I&#39;d like to introduce the following display manager for oe-core, e=
mptty<br>
&gt; [1]. This display manager is, as described upstream, a &quot;Dead simp=
le CLI<br>
&gt; Display Manager on TTY&quot;. It supports both x11 and wayland session=
s, with<br>
&gt; togglable build parameters to completely remove x11 and pam<br>
&gt; dependencies. It&#39;s licensed MIT, which shouldn&#39;t be an issue f=
or any<br>
&gt; users. (It is written in Go, if you have opinions about that.)<br>
&gt;<br>
&gt; With this, both weston-init and the xserver-nodm-init packages can be<=
br>
&gt; re-tuned to leverage this display manager and simply add a user and<br=
>
&gt; emptty config for an autologin session. This can resolve the current<b=
r>
&gt; behavior across init systems without additional scripting, and move so=
me<br>
&gt; development out of this layer.<br>
&gt;<br>
&gt; I already have a recipe for emptty, but I figured I would reach out fo=
r<br>
&gt; comment to recent contributors before I submit any patches playing wit=
h<br>
&gt; the existing init packages.<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/tvrzna/emptty" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/tvrzna/emptty</a><br>
&gt;<br>
&gt; - Randolph<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#212640): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/212640" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/212640</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111652153/361=
7537" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111652153/3617537</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:otavio.salvador@gmail.com"=
 target=3D"_blank">otavio.salvador@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Sys=
tems<br><a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://ww=
w.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.os=
systems.com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>Mobil=
e: +55 (53) 9 9981-7854</div></div>

--0000000000006cebd4063022ff52--

