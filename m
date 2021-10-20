Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585F9C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 12:58:25 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web11.7594.1634734704021911497
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 05:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M9VLIX8p;
 spf=pass (domain: gmail.com, ip: 209.85.222.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id e2so6389227uax.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 05:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=12Akq/E88hGncn9c8uv3Nl6Rtc4CqS4LxOQWUYtXMnU=;
        b=M9VLIX8pDiWrwDm4Zz4ZrI+JUuJS86PsVYX4FgouqN37hzaPdKJoNzWUWj9Loph2c9
         0qZCheKegq+K5V++E0OeL2S2tdXnWKo4ZX1OKkgis2j0HA3iMFgn6LkHLVCqTWDSRAgj
         F4IQxm8nEZjeSQxTdeweJfOpq7Bu7vTCzoe0uFz0gchl8H2QN/KDBuybW4T4xyAP+ECw
         DsletiMJuGuoG4dVl7w9rTG7hs72JAbJsMxKqjBYDkrfCbqaA5uHVinTmCQTdpRd4CON
         YzcXvKr8+7Z4gWPwZ2KR9Q9wRVPhTJO3Txl5KB4w/Npt9rIK5u6XAln34LULpD65PwMp
         7wsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=12Akq/E88hGncn9c8uv3Nl6Rtc4CqS4LxOQWUYtXMnU=;
        b=EutFDWo9C7ciy3P4+RlccAvNGsQJIrGokQFbnIjbp5oXAb+oREAFaVfZamWg3JWBaf
         dz+qfHDkMpdDV1+F/L2BMSQhz+3p/pOe3FUahE+ncVaQcNcWV4yj/Xa8qtRnyH9jcx4u
         0UU6jaPayV5CWnGVjlMbHKSpSgnv91lBGytlPm1OsMzeRsqg4VgJL+/etoXCLOVkTR31
         /iGiJxLxzFafF50BQmxNTuReE6WnfE/0qqE9MwsqNZ4S7dYKAmN5fnr1qJjC0AFEMBYO
         2OUojZVTWg3ofkCczVHdL3m486YbcMKhNcCdHvGVJUbY9HREOYJ8HtiJWkaQkZwSqG1R
         f8oQ==
X-Gm-Message-State: AOAM530GLXcXATOHAzIVPbRNVXIoDQfg5/R1XTGp85vKlxUa0EKLFez2
	IqBoDvl9jk1i0fgpR9xdKy4+mQNIqB61kAiBN3U=
X-Google-Smtp-Source: 
 ABdhPJxAHN7SO5CDsaMzO9xP5CfwJffkevW6y0pByreSeN3t7Vw8cxU+SOkyH0MCZjDDDeCkcvpJFjFdT4lFvdFZ4UI=
X-Received: by 2002:a05:6102:954:: with SMTP id
 a20mr1735614vsi.40.1634734703151;
 Wed, 20 Oct 2021 05:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211019170321.18270-1-pkj@axis.com>
 <CANPvuR=noMymOncORwNan6-D-DCkSKQDXYjjWR+8yhqx3JxY=Q@mail.gmail.com>
 <16AF9916496D59D2.6466@lists.openembedded.org>
 <0618e0381622433f86303a2d5d6968cd@axis.com>
 <86a6794721045c94bc4cd445a051ff1df40baa6e.camel@linuxfoundation.org>
 <35229a81fcb740edb3d77e35c8ebc787@axis.com>
 <4a4329e7ec5640aea90f15d5d851becd548b69c7.camel@linuxfoundation.org>
 <b03ac354b3ea439890dc320bca27de6c@axis.com>
In-Reply-To: <b03ac354b3ea439890dc320bca27de6c@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Oct 2021 14:58:12 +0200
Message-ID: 
 <CANNYZj-Ek+Zh=+dB4aj7jYXYW1mcOqC71oGLdt8UGg1_DDxfNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] externalsrc.bbclass: Allow externalsrc to be
 extended with extra classes
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000488cb605cec855a3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Oct 2021 12:58:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157261

--000000000000488cb605cec855a3
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Oct 2021 at 14:42, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> So, I will not push for this change. I think it would have been nice with
> an official way to extend classes and I am willing to implement it, but if
> you think it is too much of an issue and stops encouraging people to
> upstream their changes, then we will make do with the workarounds. It is
> not like we have to backport that many classes, so it is definitely
> manageable, albeit a bit inconvenient.
>

I would not want a mechanism for extending classes for a different reason:
it makes it a lot harder to understand and reason about the build.
bbappends are already bad enough, but at least they're influencing only
specific recipes unconditionally; conditional class appends would just end
up producing horrible spaghetti.

Alex

--000000000000488cb605cec855a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 20 Oct 2021 at 14:42, Peter Kjellerstedt &lt;<a href=3D"mail=
to:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">So, I will not p=
ush for this change. I think it would have been nice with <br>
an official way to extend classes and I am willing to implement it, but if =
<br>
you think it is too much of an issue and stops encouraging people to <br>
upstream their changes, then we will make do with the workarounds. It is <b=
r>
not like we have to backport that many classes, so it is definitely <br>
manageable, albeit a bit inconvenient.<br></blockquote></div><div class=3D"=
gmail_quote"><br></div><div class=3D"gmail_quote">I would not want a mechan=
ism for extending classes for a different reason: it makes it a lot harder =
to understand and reason about the build. <br></div><div class=3D"gmail_quo=
te">bbappends are already bad enough, but at least they&#39;re influencing =
only specific recipes unconditionally; conditional class appends would just=
 end up producing horrible spaghetti.</div><div class=3D"gmail_quote"><br><=
/div><div class=3D"gmail_quote">Alex<br></div></div>

--000000000000488cb605cec855a3--

