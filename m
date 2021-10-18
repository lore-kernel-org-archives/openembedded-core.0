Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B9FC433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 14:59:21 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.37468.1634569160363074252
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jUwBtRFW;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id l6so11407858plh.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XzLvyTMYvFbVZ9AjzzwEpDp8yL+RIEZKCtSI6uunHyI=;
        b=jUwBtRFWID3TFv6oV43ER/K7GswiMiJz6OTFRTUXbKqzlsPV4XgaD9OBRoCsDmrVOW
         Gj3V01RvhyMFdjKJZ1VNn+PBFRJvl9J5E1ehUbFPTHmeiOI+QQ0Uuxx+VC/JaYQi4Hbt
         Bq/7wcT1exzkjm6sQHLkHrV0W7ROfIIm012AZWwzO1f/uRgVaB+mD2HgZ+nC9MVjtbC0
         UChFnuN7FM5VFdJCUZUccfJYNf8BGwNQJxYYxk/SXO2akKTq8vsm1Du94o6cn/tSq9P7
         yPhQqrdihZOPdlluR0jQWLtJUsm2YszC/e/GUq+TvUeZlI7u1WRnDUGIuE1+iacmzULs
         1L4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XzLvyTMYvFbVZ9AjzzwEpDp8yL+RIEZKCtSI6uunHyI=;
        b=UMz9lRqjQEShCxlAD/E7CjSH7J4EMRJaBO57nv+RhN1fHy+UMHo55s8rVrRfKOuTPA
         NR7e1zPHXL8K9BrDxLXWlbuIONXSd5iIj0TvTDORnDfV0iW5VYZv8O8VFiI0Vc4QUbeL
         mtlHJL2pHIuv8VNVftkAlvqD4xkAOR+qYw29caHGW56TE0ombj8qtRamW8NlyE37x8of
         IYD679CIMQ3uPugvmRrKNHP9zuG2A7ZjmArcqB7EVCxbpu/2FYlIZXMrznKBeyJ5JPZT
         u9qG7r0VAXWCt4FLrlhjfbndHLzKiC7/jDExGybv/ObCSWv2mhHkuphiE5y+5H1Na5mo
         hg1A==
X-Gm-Message-State: AOAM531/CmNSyybhjCQ+S8jyEnNWaCkprfNcukxBu5ancvb58/UXj8JQ
	d4cZpVOVo49AlBQobjsycM92XyVXA2iXcYzF0ok=
X-Google-Smtp-Source: 
 ABdhPJzrmt0lN0HmJqdLp1VZgZ+REFAqeKFfiJEfZd02SrAJAR8q5k1l+BSAWURfStNZaC62Ogpwce+gbpuZ4/E2lyY=
X-Received: by 2002:a17:902:d114:b0:13f:5164:2e1c with SMTP id
 w20-20020a170902d11400b0013f51642e1cmr27679797plw.75.1634569159920; Mon, 18
 Oct 2021 07:59:19 -0700 (PDT)
MIME-Version: 1.0
References: 
 <6473ab6832d9e7647a8921bd8a7735394379f12a.camel@linuxfoundation.org>
 <20211001072440.18158-1-pgowda.cve@gmail.com>
 <76aaa9e236f1d4519d84f770da9a6e101bf13f4f.camel@linuxfoundation.org>
 <CALY4985dAovpwtKHUTOAcAVW7TJr+cjTzJcssk8xr7MYTcm9pA@mail.gmail.com>
 <6149502653526ba43975b86936e6aa74415c9ac0.camel@linuxfoundation.org>
In-Reply-To: 
 <6149502653526ba43975b86936e6aa74415c9ac0.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 18 Oct 2021 16:59:09 +0200
Message-ID: 
 <CA+chaQc15i3WztOeZqCXK923YEg4_+VZnAsb2MXmnSQwyccJjg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] state/staging: Fix directory not deleted for
 race
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: pgowda cve <pgowda.cve@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Randy MacLeod <rwmacleod@gmail.com>, umesh.kalappa0@gmail.com
Content-Type: multipart/alternative; boundary="000000000000234e9b05cea1ca65"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 14:59:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157078

--000000000000234e9b05cea1ca65
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 4:52 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2021-10-18 at 19:17 +0530, pgowda cve wrote:
> > Hi Richard,
> >
> > Thanks for the review and suggestion.
> >
> > > > I'm wondering if we should just add TCLIBC to PN unconditionally?
> >
> > I didn't want to add TCLIBC to the code when using default GLIBC.
> > Hence, I tried to keep the folder default for GLIBC.
> >
> > However, if you suggest adding TCLIBC to PN unconditionally;
> > I will modify the patch and submit.
>
> Lets try that please.
>
> There is a related issue Martin reported where the recipe is really
> TUNE_ARCH
> specific and not really TARGET_ARCH specific. One step at a time I guess
> though.
>

I think you were referring to:
https://lists.openembedded.org/g/openembedded-core/message/156516
and it's currently even MACHINE_ARCH due to poking in MACHINEOVERRIDES
variable, but in theory it should be possible to re-write the logic to be
only TUNE_ARCH specific.

Cheers,

--000000000000234e9b05cea1ca65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Oct 18, 2021 at 4:52 PM Richard P=
urdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.pur=
die@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 2021-10-18 at 19:=
17 +0530, pgowda cve wrote:<br>
&gt; Hi Richard,<br>
&gt; <br>
&gt; Thanks for the review and suggestion.<br>
&gt; <br>
&gt; &gt; &gt; I&#39;m wondering if we should just add TCLIBC to PN uncondi=
tionally?<br>
&gt; <br>
&gt; I didn&#39;t want to add TCLIBC to the code when using default GLIBC.<=
br>
&gt; Hence, I tried to keep the folder default for GLIBC.<br>
&gt; <br>
&gt; However, if you suggest adding TCLIBC to PN unconditionally;<br>
&gt; I will modify the patch and submit.<br>
<br>
Lets try that please.<br>
<br>
There is a related issue Martin reported where the recipe is really TUNE_AR=
CH<br>
specific and not really TARGET_ARCH specific. One step at a time I guess th=
ough.<br></blockquote><div><br></div><div>I think you were referring to:</d=
iv><div><a href=3D"https://lists.openembedded.org/g/openembedded-core/messa=
ge/156516">https://lists.openembedded.org/g/openembedded-core/message/15651=
6</a></div><div>and it&#39;s currently even MACHINE_ARCH due to poking in M=
ACHINEOVERRIDES variable, but in theory it should be possible to re-write t=
he logic to be only TUNE_ARCH specific.</div><div><br></div><div>Cheers,</d=
iv></div></div>

--000000000000234e9b05cea1ca65--

