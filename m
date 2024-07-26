Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2E4C3DA70
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 13:02:29 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.60152.1721998941038829964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 06:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VsYs10yt;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: rybczynska@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70d1c655141so830895b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 06:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721998940; x=1722603740; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tai2Kdkd7NtaoGsuV+7+8mVhICIkPs/7V4LEKyNHtvs=;
        b=VsYs10yt3lHtgdWGf3G7z5unCz0k89QZqsM6FUy9zxLf4T5APkmf34ANxTaEPZDZRz
         BEEYH/BP74RJ6ME9SRXmyNdJrVnwhTcnP1x5hoBVNE2Or0HKKhmp/d+mIDrteybZwitU
         Pg6kkwXA48ZCJiRmnOkcfCt7fyiUU1DIE/A1fPpdgQdi6fCMj9kQacTi8XDcJJ2mNtdb
         uAuX0STbNrXQGlREl+3snKbL/rALro1oq+5Tc5VtSz03JYyWKeEgG8kolsjyUv7UlAnQ
         pJcJCQU2HFQqiINtJLHebCQHNs7vuty03bHPSJxnZx7UILZzhMkKHFRXNwn6xJ7+9b+h
         GGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721998940; x=1722603740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tai2Kdkd7NtaoGsuV+7+8mVhICIkPs/7V4LEKyNHtvs=;
        b=DGDuyFweIBRlBLylhzkKqHRPXXotaG3pAJGsJIJ4Z710pxfFGcLF/qRHunbmHQCFnO
         eTbtQRqxTlkeB8PFhboGrNxTqeWMfm2nowtSZzjXE3Rogv/iEuQEpHZUMu/eB/CD03GK
         F52/Eg+g0yE20zl06BkHi1oMhITg+hzCnt1NspIGL3mGYLavRk/hkFqidwtr55ER4Nb9
         zZm4hGeSc9ipr7yWf2vngNw9UgoMaTGruht50XS1412hlKB8J538HCwE1MdC2xRQTFkw
         wN7y8CPSQF6RkCCl6Rfm+GpWdQCwpXA0f5brmhf1QwHPmfKvqln4Oh/gDOJs70SG0tt9
         oY2g==
X-Forwarded-Encrypted: i=1; AJvYcCUqVrCs2RCFqs6t+As6o8x7DRcQ7ZhNG7eCVzuNsjuxOlwFwERb1FaTHSMG9KcfDxZyRw0iXdqWPwfFkNdeq3WysY/MZl69Ao9K/6RVHl5C+Xcmo6eIkhIZ
X-Gm-Message-State: AOJu0Yzli4redsmVkar9NECXZobpVsbtRvd5pMzRanl0TmTYZ6IIvoKG
	+kvdp0uKeWgH6AjeZA1ihEj62mUlS3v21YZzspR6lBKiMHs+tepNMQG1UPoPqZCw3O/AK9yyDPu
	Ajrc07xjUTz31HTVYhK3T0QPZHUk=
X-Google-Smtp-Source: AGHT+IF7L8zpIWybn490EL8Fqlehcp3eplzOqrHIK4cmslxjic0TBHTfSg9jqbE1KynkQU2VjwrPCYTf3SnChehDQPQ=
X-Received: by 2002:a17:90b:5250:b0:2c8:f3b4:421 with SMTP id
 98e67ed59e1d1-2cf2e9b18a7mr5820592a91.4.1721998939984; Fri, 26 Jul 2024
 06:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
 <6cf212c600dc109e86e16cf3cf73adc9864deebf.camel@linuxfoundation.org>
 <399979010dfd02323f49cbd25b95f606@syslinbit.com> <297305874abd246270ce7084d22beee7486b3e70.camel@linuxfoundation.org>
In-Reply-To: <297305874abd246270ce7084d22beee7486b3e70.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 26 Jul 2024 15:02:07 +0200
Message-ID: <CAApg2=T-6ajkTYjG4c0XHK8qPWkB=1bccU_tgSHUY8yK645PhQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 1/5] cve-check: annotate CVEs during analysis
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: mrybczynska@syslinbit.com, openembedded-core@lists.openembedded.org, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>, 
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Content-Type: multipart/alternative; boundary="0000000000001f1e8b061e261f60"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 13:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202537

--0000000000001f1e8b061e261f60
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 5:27=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2024-07-25 at 16:48 +0200, mrybczynska@syslinbit.com wrote:
> > On 25.07.2024 16:29, Richard Purdie wrote:
> > > Hi Marta,
> > >
> > >
> > > With the v3 series applied we did just see this on the autobuilder
> > > unfortunately so I'm not sure that problem is addressed:
> > >
> > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/7004/st=
eps/14/logs/stdio
> > >
> >
> > Hello Richard,
> > Thanks, this is unfortunate. Is it possible to have a copy of the
> > corrupted database somewhere?
>
> I think it is transient as we never clean it up and not all tasks fail.
> That seems to imply it is a race of some kind.
>
>
I have a few ideas of what it might be, but I do not have a reproducer
right now. With the
vex changes, the duration of the cve_check operation changed slightly. On
the other hand,
the database download is slower these days (I have had standalone runs that
lasted for 5+ hours).
Also, I noticed that there were cancellations of some of the build, so the
cancellation of the download
may be in play too.

A question: autobuilder configuration does share DL_DIR among multiple
builds?

My possibility list right now:
- the "download" job timeout too short
- download failure/timeout
- job cancellation during the download

What do you think?

Kind regards,
Marta

--0000000000001f1e8b061e261f60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 25, 2024 at 5:27=E2=80=AF=
PM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Thu, 2024-07-25 at 16:48 +0200, <a hr=
ef=3D"mailto:mrybczynska@syslinbit.com" target=3D"_blank">mrybczynska@sysli=
nbit.com</a> wrote:<br>
&gt; On 25.07.2024 16:29, Richard Purdie wrote:<br>
&gt; &gt; Hi Marta,<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; With the v3 series applied we did just see this on the autobuilde=
r<br>
&gt; &gt; unfortunately so I&#39;m not sure that problem is addressed:<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/87/builds/7004/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">=
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/7004/step=
s/14/logs/stdio</a><br>
&gt; &gt; <br>
&gt; <br>
&gt; Hello Richard,<br>
&gt; Thanks, this is unfortunate. Is it possible to have a copy of the <br>
&gt; corrupted database somewhere?<br>
<br>
I think it is transient as we never clean it up and not all tasks fail.<br>
That seems to imply it is a race of some kind.<br>
<br></blockquote><div><br></div><div>I have a few ideas of what it might be=
, but I do not have a reproducer right now. With the</div><div>vex changes,=
 the duration of the cve_check operation changed slightly. On the other han=
d,</div><div>the database download is slower these days (I have had standal=
one runs that lasted for 5+ hours).</div><div>Also, I noticed that there we=
re cancellations of some of the build, so the cancellation of the download<=
/div><div>may be in play too.</div><div><br></div><div>A question: autobuil=
der configuration does share DL_DIR among multiple builds?<br></div><div><b=
r></div><div>My possibility list right now:</div><div>- the &quot;download&=
quot; job timeout too short<br></div><div>- download failure/timeout</div><=
div>- job cancellation during the download</div><div><br></div><div>What do=
 you think?</div><div><br></div><div>Kind regards,</div><div>Marta<br></div=
></div></div>

--0000000000001f1e8b061e261f60--

