Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04732CFD63F
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 13:59:56 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6392.1767794391045204751
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 05:59:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YNjoyC30;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34c9edf63a7so1793381a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 05:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767794390; x=1768399190; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xw2rWA5eNBgyuIiZPsvqC0oLiqsEPt60378suzBX/9U=;
        b=YNjoyC30jHVwIqyzccW3GphSMLZ3Xw1ZG9afv36AgH8s9xMk/ckScOms4kGEbhlK9Y
         VT7VxZHiyuLv01/SL+f+0KNfXkLMM4R/PD3y7+Rp93QD3M9GWQjfnjdXZei6iK/pct2e
         r7GWzwNIg332gsyoyebMFNam8q2YxFLOfcmMnlfxUpXL973n5MZcrIOYlLXcJWwstWCm
         D3YGG0P3gZS385TEm7VKLw5SxV+0C+a9sVc7LuRnMsm+1A0r1c5fPHtP+JXQw7NiFdDU
         xn9Igk/z/pzB35RwY0cJkM2mgWiac/FpKhFR/lrja33sUMBHR2xv3gxV15RS6sWVH1De
         kXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767794390; x=1768399190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xw2rWA5eNBgyuIiZPsvqC0oLiqsEPt60378suzBX/9U=;
        b=ZsIXZo6wbQMJlYjifUHbwL6o3jZwMK5kwTiDZAhn2HHiWNbzfae23vhDJFCgXtvKGI
         8Wjz1x9b1ApXmz9gDrES8Y+ZW5AmDfXb3FDtNF0DEn04yIZGUYO1ppNY/jpz/88sWzzU
         OyytL/QzPIUeFlQExaztw193xcHJa6279YccWxq8B4KrRmm6jS1pIKcFqzKkr4c7N/Pa
         kNZXjLqotHaUn3Mk81wsQ30hzZV1X3UqiRLcby1uTI8/QulIR8tn/x0mrGRecoH78T8y
         uWqxF5bkmjcMyRjbo9Hn7WHhQGPpIKdj0Axz2DY0SDG4bfnj/0POYSrbJCXsqgpFs7Kp
         6RsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkb04GYpLMGgbBkZmjnjP/01Fib2TkilfU/EvERVTKcKmPB9Q5cwruFr4jYnev+U6SDmxWBSOODWAdjqCrR4qN2A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzBiOYT/bQHbguC2rbHUy6UUWB1WTnUjDEt5NOFbZYGwk0HmnA5
	xauGN3nx1mZ15rDtR9k+I2ca0Icz/KawBFmYs4gSysTeBw3tO9PfaMLlvb3HidTCgA+wMHdfi2X
	0XsWYJb07jO0XRalIy1vqUynObVpDuck=
X-Gm-Gg: AY/fxX43J+SwU69Lu2SL1u/UWh34gGhupE1hao+xRo0dl6yAEfEK7JFdR+wX6EktMTH
	uTk12FPo5BhBpO1fm4T3VXE/GRNc4YR5WdXnRpvnpLTZ2cW0bUR+wGcuq28gXhvFwdMVzqk6kbu
	tMepkP09AxmLeM/6XM53RiRyQvGo8FR8qDo/zPv/EGh/b/oamqkguO4Wuo06noFl1nSJXerJTUG
	IlqbBogknjprbE3LPXrdOGZyJQjhh/rQsKSNmHlr6S3JBv5YG1oR7Gfs/itEzXgeCCWVCR8
X-Google-Smtp-Source: AGHT+IErC8MYgGomFIPC9s5sPlmi8TwnDk2SmLSbN1KwiaGfjbUs2qeuXaZN+xhAiiPDXQAMeQK2l6Q0ye+SJ6+lDcw=
X-Received: by 2002:a17:90b:2d50:b0:341:8ac7:39b7 with SMTP id
 98e67ed59e1d1-34f68d22d92mr2312808a91.25.1767794390353; Wed, 07 Jan 2026
 05:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20260106152352.932717-1-bruce.ashfield@gmail.com> <aV5XW4Rf4tvtJU_O@pek-khao-d3>
In-Reply-To: <aV5XW4Rf4tvtJU_O@pek-khao-d3>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Jan 2026 08:59:38 -0500
X-Gm-Features: AQt7F2rhp4wWyR7HYwIY4_aSxFCJZO1ONHpZlQPicud8LIeHJr8KPU6hKZEiTto
Message-ID: <CADkTA4MheUbq5rqAv=dUA4P7QFpym5WgqrHEkB-=1haqRnw+hQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] linux-yocto: consolidated pull request
To: Kevin Hao <haokexin@gmail.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ac4bbd0647ccb4a3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 13:59:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229000

--000000000000ac4bbd0647ccb4a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 7:53=E2=80=AFAM Kevin Hao <haokexin@gmail.com> wrote=
:

> On Tue, Jan 06, 2026 at 10:23:45AM -0500, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Hi all,
> >
> > I'm still tweaking my pull request scripts for the split repositories,
> > so apologies if something doesn't look quite right.
> >
> > I'm unable to push to openembedded-contrib right now, so this is a
> > patch only send.
> >
> > We are getting closer to removing 6.16 (and then 6.12) from oe-core
> > master. These updates should address some config warnings, and
> > otherwise improve stability.
> >
> > We need to get the reference platforms update to 6.18, so I've cc'
> > kevin@windriver to see if he has any plans or comments on that.
>
> The v6.18 kernel triggers an RTNL assertion call trace on my BBB board.
> Although this does not block the boot process, I would like to investigat=
e
> further to identify the root cause, which may take several days.  However=
,
> since it does not affect normal booting, I can update the default kernel =
to
> v6.18 for the reference board first and debug this issue concurrently, if
> you prefer.
>

No rush. Whichever is easiest for you, I appreciate the assistance
on this, and if there's anything I can do, let me know.

Bruce



>
> Thanks,
> Kevin
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000ac4bbd0647ccb4a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 7, 2026 at 7:53=
=E2=80=AFAM Kevin Hao &lt;<a href=3D"mailto:haokexin@gmail.com">haokexin@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Tue, Jan 06, 2026 at 10:23:45AM -0500, <a href=3D"mailto:bruce.as=
hfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a> wrote:<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Hi all,<br>
&gt; <br>
&gt; I&#39;m still tweaking my pull request scripts for the split repositor=
ies,<br>
&gt; so apologies if something doesn&#39;t look quite right.<br>
&gt; <br>
&gt; I&#39;m unable to push to openembedded-contrib right now, so this is a=
<br>
&gt; patch only send.<br>
&gt; <br>
&gt; We are getting closer to removing 6.16 (and then 6.12) from oe-core<br=
>
&gt; master. These updates should address some config warnings, and<br>
&gt; otherwise improve stability.<br>
&gt; <br>
&gt; We need to get the reference platforms update to 6.18, so I&#39;ve cc&=
#39;<br>
&gt; kevin@windriver to see if he has any plans or comments on that.<br>
<br>
The v6.18 kernel triggers an RTNL assertion call trace on my BBB board.<br>
Although this does not block the boot process, I would like to investigate<=
br>
further to identify the root cause, which may take several days.=C2=A0 Howe=
ver,<br>
since it does not affect normal booting, I can update the default kernel to=
<br>
v6.18 for the reference board first and debug this issue concurrently, if y=
ou prefer.<br></blockquote><div><br></div><div><div class=3D"gmail_default"=
 style=3D"font-size:small">No rush. Whichever is easiest for you, I appreci=
ate the assistance</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">on this, and if there&#39;s anything I can do, let me know.</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Kevin<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000ac4bbd0647ccb4a3--

