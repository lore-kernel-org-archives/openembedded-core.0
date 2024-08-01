Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774A6C3DA64
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 13:58:37 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.68991.1722520708334436925
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 06:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cUsjY7i3;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7a10b293432so4397131a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 06:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722520708; x=1723125508; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6P1fWta3n7pHY/iBEyXAitwIHa4UVrR8tLT4VB/xt5Q=;
        b=cUsjY7i3Agosfy5MmiibuHyCfaGvzpdLMqmlE/glhJm/3tHpfSGu1IxWfZwYAjhB8F
         qmvUKlgdbs2MgYyWf7dW3eCfCTkXz/EUzRsRtnQonXtGTyxwjkvn3ugh33kqFkHQrhsS
         NOVJNaxS3suuz0DjSHn55kamPhO7p9wuegg2YZ9EhFyaDc2UwVA+spJrQ+3GBlWZKAQy
         gEVaigOJr9rIK9abekIvol9AUe/GTVmoppdGc3jayJHFfw0tgh34+y9gLI047KdSqANd
         2X66qhR+4wm4Ng1L57TCLPFZsc/9d0wKVszRxcLGQALgPuFj6Gl6YxfewG0cKiqm+MeK
         2AKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722520708; x=1723125508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6P1fWta3n7pHY/iBEyXAitwIHa4UVrR8tLT4VB/xt5Q=;
        b=dhn0r/oMcJxkjH37EgOArvZ2skTpAJy+bKVhJeMTJ1VLyy829AOpHL1FIF3qSCzFbn
         zZUyMjgpAhjM0XkisytfzCegpHslGaEQHc63wBHQPMtl9QnYg7drPyOD4f210k3dXFdi
         E2W0UG1VJwjQD8n2T+3LBKi4fxsAJMAdeTVXQpkX4TLpNUKpuVxbGzMeA35VH/X0yvmI
         dIucWGjUY3MTpwlJP4dJI6lncc7QFYYAifeHBu6MyvEIQ0vY9ufr8aw3skqvdNvHAOHs
         +vN0MIh3+nJwYA8ML9+0t8hNWpArahUPym/bNVDP5n8wO2tuPTyV+x6ZYapu1gXD3cl4
         Vtbw==
X-Forwarded-Encrypted: i=1; AJvYcCXnaCShcvnbuRfy8qEMDbqIOZ9IcDxoKrM+rO5t7bIV8CdT4ABg5oUdCbUKYo46WmT+6JpeYDkDiHUsqGkiNgWK3D0bkaIDddgre2Jnk6+2s1wtsUYhpxOK
X-Gm-Message-State: AOJu0YydfSEd7XrGTlawn+dTCdlF+SdI6RO7M2cvrrVLTb5k1hvWxuox
	fpCbtKIxcmu9rpxIPqZt0g9oi2s/J4Wc2vGXgI5i/POQfyTByikugeBRF3mTlB5ibB1akcjoUiF
	svVGa3GPs2YPLAEHJob7+ryOmh5A=
X-Google-Smtp-Source: AGHT+IEif9yKjCYp/Vvtkm7V2VFvI9bmqPWFkCKLZ5ALxol9IEpTyxie+BihDAxyd1j3RRspM5iPYzFrws6WFz4YSfQ=
X-Received: by 2002:a05:6a20:1582:b0:1c2:9f03:82d4 with SMTP id
 adf61e73a8af0-1c69969bdeemr423995637.53.1722520707507; Thu, 01 Aug 2024
 06:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
 <20240724152530.25856-5-marta.rybczynska@syslinbit.com> <44B6F27C-F828-46B0-8DCB-FCE37FB8DC9D@arm.com>
 <CAApg2=S_2uiyd=g2Zn6RQBvBxDc-iRKFSZmpWBZWJx1M0RjYgQ@mail.gmail.com> <606d5852aec8e7bb29350cfb27aa3df8f706dc72.camel@linuxfoundation.org>
In-Reply-To: <606d5852aec8e7bb29350cfb27aa3df8f706dc72.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 1 Aug 2024 15:58:15 +0200
Message-ID: <CAApg2=QPTmm6Y-r-oWS2PfP-DZ-t1NRfm7rKqcBnuFmkXRdC2w@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 5/5] cve-extra-exclusions.inc: add deprecation notice
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Content-Type: multipart/alternative; boundary="000000000000e3aea4061e9f9ac8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 13:58:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202736

--000000000000e3aea4061e9f9ac8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 3:47=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2024-07-26 at 14:28 +0200, Marta Rybczynska via
> lists.openembedded.org wrote:
> >
> >
> > On Fri, Jul 26, 2024 at 2:24=E2=80=AFPM Ross Burton <Ross.Burton@arm.co=
m>
> > wrote:
> > > On 24 Jul 2024, at 16:25, Marta Rybczynska via
> > > lists.openembedded.org
> > > <rybczynska=3Dgmail.com@lists.openembedded.org> wrote:
> > > >
> > > > This file contains CVE_STATUS without machine-readable
> > > > information on which
> > > > recipe it applies to. All entries should be verified and, if
> > > > appropriate,
> > > > moved to their corresponding recipes.
> > >
> > > The point of this file was to be an opt-in for more exclusions
> > > where we didn=E2=80=99t feel 100% confident asserting the issues coul=
d be
> > > ignored.
> > >
> > > How much of a problem is it if this file contains a a limited
> > > number of CVEs?  We can review what is in there and move/remove as
> > > needed to cut it down.
> >
> > With the vex class (and with SPDX too, I think) they end up copied
> > present in every single package of the build. This brings enormous
> > confusion.
> > Impossible to filter them out as there is no information about the
> > affected recipe/package.
>
> Difficult, yes, impossible, no.
>
> Surely we know which recipes a given CVE apply to?
>
>
Without having the CVE data at the same time, no. Also, a CVE might apply
to multiple
recipes at the same time - and this could be dangerous. Imagine a situation
where
the CPE is incorrect and is pointing to the wrong package. It gets added to
.inc.
But then someone in their layer adds the package the CVE really applies
to...

If we keep the .inc file, I think the most correct way would be to add a
field marking
 which recipe it should be applied to.

What do you think?

Regards,
Marta

--000000000000e3aea4061e9f9ac8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 1, 2024 at 3:47=E2=80=AFP=
M Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">=
richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Fri, 2024-07-26 at 14:28 +0200, Marta =
Rybczynska via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Jul 26, 2024 at 2:24=E2=80=AFPM Ross Burton &lt;<a href=3D"mai=
lto:Ross.Burton@arm.com" target=3D"_blank">Ross.Burton@arm.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; On 24 Jul 2024, at 16:25, Marta Rybczynska via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt; &lt;rybczynska=3D<a href=3D"mailto:gmail.com@lists.openembedded.o=
rg" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; This file contains CVE_STATUS without machine-readable<br>
&gt; &gt; &gt; information on which<br>
&gt; &gt; &gt; recipe it applies to. All entries should be verified and, if=
<br>
&gt; &gt; &gt; appropriate,<br>
&gt; &gt; &gt; moved to their corresponding recipes.<br>
&gt; &gt; <br>
&gt; &gt; The point of this file was to be an opt-in for more exclusions<br=
>
&gt; &gt; where we didn=E2=80=99t feel 100% confident asserting the issues =
could be<br>
&gt; &gt; ignored.<br>
&gt; &gt; <br>
&gt; &gt; How much of a problem is it if this file contains a a limited<br>
&gt; &gt; number of CVEs?=C2=A0 We can review what is in there and move/rem=
ove as<br>
&gt; &gt; needed to cut it down.<br>
&gt; <br>
&gt; With the vex class (and with SPDX too, I think) they end up copied<br>
&gt; present in every single package of the build. This brings enormous<br>
&gt; confusion.<br>
&gt; Impossible to filter them out as there is no information about the<br>
&gt; affected recipe/package.<br>
<br>
Difficult, yes, impossible, no.<br>
<br>
Surely we know which recipes a given CVE apply to?<br>
<br></blockquote><div><br></div><div>Without having the CVE data at the sam=
e time, no. Also, a CVE might apply to multiple</div><div>recipes at the sa=
me time - and this could be dangerous. Imagine a situation where</div><div>=
the CPE is incorrect and is pointing to the wrong package. It gets added to=
 .inc.</div><div>But then someone in their layer adds the package the CVE r=
eally applies to...<br></div><div><br></div><div>If we keep the .inc file, =
I think the most correct way would be to add a field marking</div><div>=C2=
=A0which recipe it should be applied to. <br></div><div><br></div><div>What=
 do you think?</div><div><br></div><div>Regards,</div><div>Marta<br></div><=
/div></div>

--000000000000e3aea4061e9f9ac8--

