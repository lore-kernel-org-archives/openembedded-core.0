Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8224FC5AD49
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 20:06:50 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.4063.1748635609853065719
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 13:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=lO2z8LHz;
 spf=pass (domain: limonsoftware.com, ip: 209.85.128.172, mailfrom: anibal@limonsoftware.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70e767ce72eso25499087b3.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 13:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1748635609; x=1749240409; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5g6lVWzqSPdD63t/3mqOm17uiik/sYOLitVzFFGdYDc=;
        b=lO2z8LHzsDecu2mhjk49Owc/+bsJrerQF6Bo24cbJvbSyLoS3ig6qO11WkMBMsbmWO
         lCzi6cDwgrexdfKADin9Vi9Z+8eLmbwJ7c79VU+0RTTpdkMYF6UX6QrkhaLkBfbGHVlk
         kuLpP5J2cZNrAZ+obAXrQxeUsbeD87/SNbmPW0vfbG2PkXak9S2HY49htbVQlJmBWu1X
         XrKO48rYppwEAKwIBTSzX+GKjtbesGDaF/zn2a2ROZkSqn/rJQcxWgnH62px+kaX4apq
         hk7boFdwEdTk7QrSJBuKzQp2wjKECi20LHiaY5ifCus9Gv5Kjoioxs0n3BoQT4/EFguG
         Ryxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748635609; x=1749240409;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5g6lVWzqSPdD63t/3mqOm17uiik/sYOLitVzFFGdYDc=;
        b=fxmcWkrJbaBN2DJmGa9OwEpxcXWb1Pn0SAuPw6euP9CJ7cZ2OAkkQidbtG8w/XwoUL
         u2pk0eDEtAEtgpFNJyhsoUQNleEJ4PZ/xBgQGnF9l8Ykhvn/Fzf//6M6bLk1ogwbmnhu
         kpdOQmf6FTE6kYPOwkWOBEy2TqVYrjmAjwUbpB4i9+QlXmHwcmmUiLS5LLz+1z476R5K
         KCECGLjL59L/wzrfl7jNI4t+tYrbL6tu2SWkZT1m54onBbIhtwm78P2ehAEMecCp1AQr
         gA6fi3G5dGUJmjMlh2nCvFd704xglXaVIGrpaRrWd2jpjGNzjETaU2jm23Hkjl1AILkK
         1fSA==
X-Forwarded-Encrypted: i=1; AJvYcCWY1t5P6pJOJfRyh//FB36wtPVG+PVd+XFNEONWyE40YJKZoqhoFxTmplUGrZBQFr1i1qJmuVyKeLweygaAiADrrg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzo2oEPYRFwlwE5RbahgsWT8UD69dNDYD7DhVNeIO+mBUv3/1A0
	V/oD8D5m4OqeZ7vqtqSj+J5k4djcarkL4Ex+15ipIc7wGmEGNP2UrkmJnVTpDXGVGbEqvdACvkC
	GbwMMQ1owUsOdHJgiGvbfBOTICAiKSlZMLmePXsLOiw==
X-Gm-Gg: ASbGncuGz22aMGTEq9TPx7wjb6fJCfK0kZtr0cMf73whHybTluC+KcVo/Pps8Q4oo2X
	suZ4YnwwHxlS4Rd5/4NqOTnTQ0n86e0AUNUZ61L4p7xwV5fuy3f/PTjPq/e1r+KnBM8rxP9MBYL
	Cn4wVRNqwmH+9Q+0eopux3n5wlY0C+xsGxdFbwHI1X
X-Google-Smtp-Source: AGHT+IHHPuPwFZh/J0XhZCC4B0fu72bQsss3aKgpIebwhrWfAytF9gd4kqcmYoDe6/KCrZ0y/nzEBxR0arVabLGh1HQ=
X-Received: by 2002:a05:690c:6d12:b0:70e:23e6:60f7 with SMTP id
 00721157ae682-71057d20cf9mr54092867b3.27.1748635608868; Fri, 30 May 2025
 13:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240323195304.2909926-1-anibal@limonsoftware.com>
 <20240323195304.2909926-2-anibal@limonsoftware.com> <20240325101809ec807440@mail.local>
 <CAOU5ZMvcO4_HWWgNc44P11w=rXh_cXyFhi7P2=D1iDhZjB+xTQ@mail.gmail.com>
 <FB405ACE-51BB-44F0-B449-EAC18194F176@arm.com> <CAOU5ZMsctXq9Gf0UHdrrt-9ZKV69qMs21AjBJ7Uu=vUxmWp6Pg@mail.gmail.com>
 <782b23ff482ab3749e1655288c3932fe882a41f6.camel@linuxfoundation.org>
In-Reply-To: <782b23ff482ab3749e1655288c3932fe882a41f6.camel@linuxfoundation.org>
From: Anibal Limon <anibal@limonsoftware.com>
Date: Fri, 30 May 2025 14:06:38 -0600
X-Gm-Features: AX0GCFv0LdQ_nO-j5HHg2POGmppN7GV7IErkKBLT2BucgPEPIjNfyKbASzYEMP0
Message-ID: <CAOU5ZMuCAo=fk8OF_tpnnfyUa9d52eoUx5q1evQ3FC3ESftj=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] wic: plugins source bootimage/isoimage
 rename to allow be imported
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <Ross.Burton@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004ef85c06365ff4f3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 20:06:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217536

--0000000000004ef85c06365ff4f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 12:45=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2025-05-29 at 17:22 -0600, Anibal Limon wrote:
> >
> >
> > On Thu, May 29, 2025 at 2:06=E2=80=AFPM Ross Burton <Ross.Burton@arm.co=
m>
> > wrote:
> > > On 25 Mar 2024, at 14:39, Anibal Limon via lists.openembedded.org
> > > <anibal=3Dlimonsoftware.com@lists.openembedded.org> wrote:
> > > > Thanks for reporting, I will adapt the tests.
> > >
> > > Without having to rewrite all of the documentation and existing
> > > files, why doesn=E2=80=99t wic just normalise the plugin name that it=
 reads
> > > to replace all - with _?
> > >
> > > This means you can still import the module names, but doesn=E2=80=99t
> > > change existing behaviour at all.
> >
> > So to normalize you mean change python module name from _ to - at
> > runtime?.
> > The plugins already had a name attr with '-', the issue is when
> > trying to import from an external module.
>
> What Ross is suggesting is that in the code in wic which parses the
> commandline parameters, we could add a line of code to change "-" in
> plugin names to "_". We'd need to tweak what gets parsed from the wks
> files too.
>

Yeah, I find the plugin manager when plugins are loaded.


>
> This would make the migration easier. We may or may not want to issue a
> warning at the same time so the user can know to update their wks file
> or command.
>

Sure, I think it starts with a warning and then makes the switch at some
point or not.

 Regards!,
Anibal

>
> Cheers,
>
> Richard
>

--0000000000004ef85c06365ff4f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 30,=
 2025 at 12:45=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 2025-05-2=
9 at 17:22 -0600, Anibal Limon wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Thu, May 29, 2025 at 2:06=E2=80=AFPM Ross Burton &lt;<a href=3D"mai=
lto:Ross.Burton@arm.com" target=3D"_blank">Ross.Burton@arm.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; On 25 Mar 2024, at 14:39, Anibal Limon via <a href=3D"http://list=
s.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded=
.org</a><br>
&gt; &gt; &lt;anibal=3D<a href=3D"mailto:limonsoftware.com@lists.openembedd=
ed.org" target=3D"_blank">limonsoftware.com@lists.openembedded.org</a>&gt; =
wrote:<br>
&gt; &gt; &gt; Thanks for reporting, I will adapt the tests.<br>
&gt; &gt; <br>
&gt; &gt; Without having to rewrite all of the documentation and existing<b=
r>
&gt; &gt; files, why doesn=E2=80=99t wic just normalise the plugin name tha=
t it reads<br>
&gt; &gt; to replace all - with _?<br>
&gt; &gt; <br>
&gt; &gt; This means you can still import the module names, but doesn=E2=80=
=99t<br>
&gt; &gt; change existing behaviour at all.<br>
&gt; <br>
&gt; So to normalize you mean change python module name from _ to - at<br>
&gt; runtime?.<br>
&gt; The plugins already had a name attr with &#39;-&#39;, the issue is whe=
n<br>
&gt; trying to import from an external module.<br>
<br>
What Ross is suggesting is that in the code in wic which parses the<br>
commandline parameters, we could add a line of code to change &quot;-&quot;=
 in<br>
plugin names to &quot;_&quot;. We&#39;d need to tweak what gets parsed from=
 the wks<br>
files too.<br></blockquote><div><br></div><div>Yeah, I find the plugin mana=
ger when plugins are loaded.</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
This would make the migration easier. We may or may not want to issue a<br>
warning at the same time so the user can know to update their wks file<br>
or command.<br></blockquote><div><br></div><div>Sure, I think it starts wit=
h a warning and then makes the switch at some point or not.</div><div><br><=
/div><div>=C2=A0Regards!,</div><div>Anibal</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--0000000000004ef85c06365ff4f3--

