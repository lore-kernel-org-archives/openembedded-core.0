Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCB1C433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 08:34:36 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web12.81862.1657010075962573701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 01:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gOEt3kws;
 spf=pass (domain: gmail.com, ip: 209.85.208.169,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id a11so13617253ljb.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 01:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qa+SciFwttATyLttN/6Yl2iuG/8YW00IkriJ2CKIms4=;
        b=gOEt3kwsCHhsqhj6VVyVA08dxqXLdMIpJaL4wDrv0PfppaxXBGoCyV6Y9BiV+U6MU2
         tn6MwoJ/xer0FgebuPj3XHOGO95QkDZxTzmxPdfBVXwInuZQW6psA5UONYEpG5WJUOAd
         KRAr7NAAmZVz4ZA0rkFlvra7dvy0rUI57LUiCVMjvxG+tKflOoXvMhisLTgEoTeAS5PI
         PjDdigP46Y/JQmDVxPSBLEjL+0U8/CJNsu92GS3mKBPcL9qaundv4+c16eihiDnjJarZ
         DMlAF19QWVSChAdKc687VdeKMVK1b6iZ70Ykkj7yUqCFfWmROMyZKhrtiOj5RE68FzQc
         +bvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qa+SciFwttATyLttN/6Yl2iuG/8YW00IkriJ2CKIms4=;
        b=HCMWHMGLIxIIlsU3JAFhqzY8E3bTFV9fAuzaA3yLHZRBPucYkhCVT3t4WHTdoCSuyS
         bz5LKu8dU5OzyMqQrdQdfdhvmQg2B9YNLcZaI4SwfJdtMItiFm4DwVsL8Tff1hspVFDi
         7ihFxO8fi5nFllliFgaFtz582RItf64jxEMGb63JXfQzItuU77nruVi4WXUKnicFzvCd
         nrG05f1fT3JAnGI3yqBcxYu3XpqeQDhzLKj2DlQ/BYmbdVN6VkCZmAIqI2otAPC/dr5O
         3z6m5pDd9i8XF3VT/ybNiVwLOoLfBWtjFgggFe1ud+GdoYKZNr784JaM0QkgOC7PHXJF
         2jqw==
X-Gm-Message-State: AJIora+TEX06Mri4zWtYGQW9EBK2EmtHH15pus6KmWKH1JuuO4Pv5pyQ
	kRtToBRBFrlaW8JiRTqXUXwgV/M9zMpISKF/1pw=
X-Google-Smtp-Source: 
 AGRyM1voYwDmc3coSHUk6bOoglO5B+ZNK9NBIpopE6fqbbd2pOrcDmb3lJbT+tx0KEM+K+QuRx7LWjHIITob1RV0JxU=
X-Received: by 2002:a2e:8013:0:b0:25b:ef62:831d with SMTP id
 j19-20020a2e8013000000b0025bef62831dmr17517083ljg.68.1657010074135; Tue, 05
 Jul 2022 01:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220701192449.1358325-1-alex@linutronix.de>
 <329d53233a9966693bc19f821f7f3996a187eced.camel@linuxfoundation.org>
 <CAJ86T=XPx1sVqmaJd+C2q81PV-jgjDK9x=cjrEzqRnGjqEghLw@mail.gmail.com>
In-Reply-To: 
 <CAJ86T=XPx1sVqmaJd+C2q81PV-jgjDK9x=cjrEzqRnGjqEghLw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Jul 2022 10:34:22 +0200
Message-ID: 
 <CANNYZj-+2QvuXUT9Vshdq5T6-uLEV5p92QeAqw+kbajPm+UKyQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake-layers: add layer
 repositories/revisions save and restore tooling (aka 'layer configuration')
To: Andre McCurdy <armccurdy@gmail.com>,
 Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 08:34:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167641

On Tue, 5 Jul 2022 at 05:09, Andre McCurdy <armccurdy@gmail.com> wrote:
> My proposal would be to try to reuse Linux kconfig. Users know how to
> run "make oldconfig", "make menuconfig", etc and I believe all key
> distro / machine configuration along with which meta layers should be
> enabled, which branch to use, etc can all be captured within a kconfig
> .config file. The task at hand would then become writing a tool to
> translate from a .config file to a set of distro, machine, local.conf
> config files (and an image recipe?) + drive whichever tool will be
> used to fetch meta layer git repos.

At this point, I have to remind everyone about our harsh reality.
Which is having lots of core pieces without maintainers:
https://git.yoctoproject.org/poky/tree/MAINTAINERS.md#n45

Let's focus on adding foundational pieces of layer and configuration
management in a controlled, testable and tested manner for now. Which
is what I am trying to do. I think discussing grandiose designs for
things that try to please everybody is just a bit premature, honestly.

Alex

