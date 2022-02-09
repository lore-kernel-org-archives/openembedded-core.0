Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BFDC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:39:34 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web12.29917.1644428373069989453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:39:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EJe4NwH+;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id k4so2397463qvt.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wX5oag7xCKGZ9oUrReHJdE/8SMg/rPujDNbVoha1wes=;
        b=EJe4NwH+91/ZbMIPqUVhjhhKauQj2BOWcjR4eP2WlCuDp2054R9bvafD6GchMNrL8P
         RNAQok7lmCZ/xGHkAHpzRbbMHUUhkaUklMfGMA4A+qXOFkNmGEDHa0/6TpeR58JteZeD
         ZA4WM42bnGbDNoBJJB7nIXVp0HQkoZAKovW+eQi6JlkVZa3obwCwWVqYARm7DDjgfj6X
         cHLoRYhS4iFW6e2Lj0tK5x3MtOdvmqZwTKq9QYb5toF4S42mnhpRCcjgzIltsi8Ttw67
         HXaiMHmCCEZRWQYf6iGe5AJiHaCyYLpDWl17KBPJzCtaqUUgtKtFC337h1eE22veKDzq
         xRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wX5oag7xCKGZ9oUrReHJdE/8SMg/rPujDNbVoha1wes=;
        b=3TXJHauBEkwfAldo13PfBg3qGRzqFGBwXFqFtl0Tax7a39TZzxpRetFZYT2ktghe/u
         BVXhzxmxZupR9eNFZT0MGMqOWtywrbZzAC1wrvlu/QeETvmwbRnprPsC/kALtPD7eFBV
         LbSjACQKGtqPyR5FHL+d5pPaaeH4zxM3G0EtojzeH10Ef6HY+41D4OXLAnubiQLSYf7M
         rG1vFCRNZZB/QfYSbeWA/o9PMWWdMiWHRlNJ89pvsU/np4xPSjD44tjuk3cYKpUxqprg
         V4z/UDiehojJnY/MB/CrStRbex9ghV+gGkqirkUJ5Ro9E/R28goQurODzmJzG+4TN2Ai
         gjpA==
X-Gm-Message-State: AOAM5307QKkpitIDQOCyK7r83ieha8ijs2L5SU7Zma39iI5zFPZZveb0
	LBICs79z8lNRhrdbITnK+GpvOJXIX6KI2xySrEcZ6q5N0jj3Bg==
X-Google-Smtp-Source: 
 ABdhPJxGG0bmuZO0EyqNWZrhQUti23huRXjXjbAF/SF8Z7g7YIUvybcgswD0Irz8+njEPRlpZzff2d4DD3xrIPwHQxk=
X-Received: by 2002:ad4:576f:: with SMTP id r15mr2359077qvx.16.1644428372158;
 Wed, 09 Feb 2022 09:39:32 -0800 (PST)
MIME-Version: 1.0
References: <20220209051544.3280726-1-raj.khem@gmail.com>
 <0b8c7bdb2015d519d32cb79130fd8e1b3d65699b.camel@linuxfoundation.org>
In-Reply-To: 
 <0b8c7bdb2015d519d32cb79130fd8e1b3d65699b.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Feb 2022 09:39:06 -0800
Message-ID: 
 <CAMKF1sq2ZvscM69UTK7onB2Cyi9f_tuKW1qBGiM5Hwxj7cc91Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] perl: Help resolving WNOHANG and _exit in
 Posix module
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 17:39:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161579

On Wed, Feb 9, 2022 at 5:44 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2022-02-08 at 21:15 -0800, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v4: Fix filepaths in release tarballs which are different than git repo
> >
> >  ...01-ipc-force-POSIX-WNOHANG-resolving.patch | 52 +++++++++++++++++++
> >  meta/recipes-devtools/perl/perl_5.34.0.bb     |  1 +
> >  2 files changed, 53 insertions(+)
> >  create mode 100644 meta/recipes-devtools/perl/files/0001-ipc-force-POSIX-WNOHANG-resolving.patch
>
> As I hinted at originally, this papers over a crack and doesn't solve the real
> error:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5042/steps/12/logs/stdio
>
> What the real error is remains unclear too :(

right, I was attempting to test if module importing/resolving was the
issue but it seems it
is not really the issue as I see below in your new logs, it means its
being resolved ok.

| Attempt to reload POSIX.pm aborted.

so I guess we still are at loss here.

>
> Cheers,
>
> Richard
>

