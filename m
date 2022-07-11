Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29EABC43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 00:29:57 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.23023.1657499389183937026
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jul 2022 17:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ImzM1eQI;
 spf=pass (domain: gmail.com, ip: 209.85.216.42,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 q5-20020a17090a304500b001efcc885cc4so3489852pjl.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jul 2022 17:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xKsMl0MJw4wRM//nCaIsZeXtvRZxPlBU7nDCo/OhyHE=;
        b=ImzM1eQIOoJvusxugPVVZ9EKXVaLQiyZ/pz9CJGJe+sMqmER6j58FH2RIyI6y+fn59
         5ViNiF5fJzwjfEh1GgT8l6CVMpoopThyCR2WPKabx3rjoOnWwoHdEjVqYA8MeTom7sM3
         igrg6lJAanst2R/sZZkXXWO6x3UkjMe4xUQoSprw3G1sal5SQWcpTXxsngU0/mEq4mM/
         dgUX2jNWCug7izQ2CUQAcsaHcGrPXcH2faemx/yNizg+U8c7JoP+RhKIgTzQUlHIbC88
         GF5DpYs4TlUr5ZyJ67W063yNz1T+guAdoyLt+g0V+sLxolEJPo3XgxyxHdyk441D81Vk
         azdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xKsMl0MJw4wRM//nCaIsZeXtvRZxPlBU7nDCo/OhyHE=;
        b=pfPDDg4GvsgXtUP+1M2RZROYz4aF+quUo+0HI0Y3ZKNWJFbwJ2eEfkE4pbOh7Yn+qm
         /blCMxpZTV0eJ3AsiJOFeEi5qy+JQNnT3hspqhon9HZKNCxV119DgLr9BEu6ur89Zd4n
         hQvXlBluWxgghrvFq3PVhPtFU0Ni9ERGqjt7ffGqu2sQM0BWfZxQMPqWmuYJD193wD4u
         jtpYMzukywX0cBXUh0bS6amVintk3BjHYshHVe76KpIJSt82tBTDMoqAQapQjbBwA7rw
         R/1f4pAubkPdQDcCEKW3X3cLJs5toYDzN/LQYa3qrVDNCNY/ZyTf3pFNjmrriUoEJzoZ
         DeVQ==
X-Gm-Message-State: AJIora8Qdth/fYGGcNLK6elC14S4/xGMHLCsRbFjd4y+AnynNCLjNsnQ
	QpARTbFS3I9ZbqCyDWIZqaUx5xnN81x0/qdL9sQ=
X-Google-Smtp-Source: 
 AGRyM1u8qS7iPBxjY89FN/yIwyhkcGB9tclk0pdZ03Ub+UPHOlJXic/u6XNhr4/KtT8G+66S8z2k5QbBvsfDWmNhvxQ=
X-Received: by 2002:a17:902:e153:b0:16b:dccf:5a89 with SMTP id
 d19-20020a170902e15300b0016bdccf5a89mr15742180pla.69.1657499388286; Sun, 10
 Jul 2022 17:29:48 -0700 (PDT)
MIME-Version: 1.0
References: 
 <7140b61c92f4f9d79b8c8b8d9be68f127512b758.camel@linuxfoundation.org>
 <CADkTA4O0Ej3HKMPtwoq_iBue2P43gicwx8rfFKyLY5d3jNTP_A@mail.gmail.com>
 <77dd3defcb6908755d06585d4cfb69a523626a22.camel@linuxfoundation.org>
In-Reply-To: 
 <77dd3defcb6908755d06585d4cfb69a523626a22.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 10 Jul 2022 21:29:41 -0300
Message-ID: 
 <CADkTA4Otrt3AXZtRg99ZCU6hODm-4dei4s2NNLzrnEu16Ur+JQ@mail.gmail.com>
Subject: Re: [OE-core] Reproducible build issues with buildpaths - take 2
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 00:29:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167851

On Fri, Jul 8, 2022 at 10:47 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2022-07-08 at 09:37 -0400, Bruce Ashfield wrote:
> > On Fri, Jul 8, 2022 at 7:07 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > Hi All,
> > >
> > > We've made good progress and I appreciate the help from people. I ran=
 a
> > > fresh build on the autobuilder and I forced it to rerun the QA checks
> > > for all recipes. The tricky bit about warnings is that they don't sho=
w
> > > up for objects from sstate and the addition of the buildpaths QA chec=
k
> > > doesn't cause the checks to rerun. Due to that a few more previsouly
> > > unseen issues cropped up.
> > >
> > > The list of issues now stands are:
> > >
> > > qemuppc:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/542=
8
> > > WARNING: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /lib/modu=
les/5.15.48-yocto-standard/build/include/generated/.vdso32-offsets.h.cmd in=
 package kernel-devsrc contains reference to TMPDIR [buildpaths]
> >
> > I'll take this one. My fix was only for arch/arm, but I'll expand it
> > to cover ppc32.
>
> Thanks.
>
> I built qemuppc locally and got a different failure, I'd really like to
> know why I saw that and the autobuilder did not. The failure was:
>
> WARNING: linux-yocto-5.15.48+gitAUTOINC+b35d1d1e83_5aa3abf07b-r0 do_packa=
ge_qa: QA Issue: File /usr/src/debug/linux-yocto/5.15.48+gitAUTOINC+b35d1d1=
e83_5aa3abf07b-r0/linux-qemuppc-standard-build/drivers/tty/vt/consolemap_de=
ftbl.c in package linux-yocto-src contains reference to TMPDIR
> File /usr/src/debug/linux-yocto/5.15.48+gitAUTOINC+b35d1d1e83_5aa3abf07b-=
r0/linux-qemuppc-standard-build/lib/oid_registry_data.c in package linux-yo=
cto-src contains reference to TMPDIR [buildpaths]

I have the devsrc fixed for qeumppc32, fix incoming shortly.

But for this one, I don't see it either. What do I need to enable to
get the linux-yocto-src package ? Mine is empty, hence no warning. Is
it one of the archiver modes ?

Bruce

>
> sure enough, tmp/work/qemuppc-poky-linux/linux-yocto/5.15.48+gitAUTOINC+b=
35d1d1e83_5aa3abf07b-r0$ head package/usr/src/debug/linux-yocto/5.15.48+git=
AUTOINC+b35d1d1e83_5aa3abf07b-r0/linux-qemuppc-standard-build/drivers/tty/v=
t/consolemap_deftbl.c
> /*
>  * Do not edit this file; it was automatically generated by
>  *
>  * conmakehash /media/build1/poky/build/tmp/work-shared/qemuppc/kernel-so=
urce/drivers/tty/vt/cp437.uni > [this file]
>  *
>  */
>
>
> I think the warning is saying there is a second issue in linux-qemuppc-
> standard-build/lib/oid_registry_data.c too.
>
> Sorry Bruce, not sure why several roads lead to the kernel :/
>
> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

