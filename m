Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA28DC00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 04:46:58 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.38365.1674103612519404981
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 20:46:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dzxbdBa4;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id n8so861530oih.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 20:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KmoAVwg6qjqHbS1OzbaGDfmhcJQucOepy3KqtbkU2PE=;
        b=dzxbdBa4zhFJTLesspficaDetgl4cdK2cNq+mziGZX0yJ5pATYHFn7EH9ZLusVyiAD
         w99Log4lpzD/3EJ0EV9bAMHooNFd2VfyId38Mii+kh1VJwF6n3rruAzNj7fAJuPlYJkY
         vQNh8rES496JlNodtKszYE1B6ZBWloHBg0IKUSDvqlEdAQlge6/Bf1IjW1J5AfKk/gXI
         Ssr178WnH82+vZDj1/yatT8rCoXeubr3fZLY96psbzzAu/S8aMQNKprU7ady8/Gu6+/K
         oF6O7N5wx/emK6lRUGHystz4vaq0HqpgmYjqBYV1k2WgSdUaZ+tuBcduIGmWNaiSniOM
         fmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KmoAVwg6qjqHbS1OzbaGDfmhcJQucOepy3KqtbkU2PE=;
        b=H5mAWp0Nop3ALdBdvzr2oFTM3RT8F2afdf/nDxl7pu347tSM1nraCq8YHGeyCvu1zd
         +3POQmRw0dd4Q2GzelB4L/qsaDIYdmUxMsajtGZfV+Zi5/M1sYS3nZX8EEnZBTHHUbig
         RvOEz9nU41DUynTngXPlfMNIPaGSP6Hqn9/GEEyE/UTgCVOIuTUfC74yOPXKSWmZuqup
         eUJJjqkZsHp52iUGWBH7FtpLfRE77JAnilHMS1tChO1My4EgQnBz9I7EbN+pwigyUXV3
         ROvB9dp1IWLi98Rj2nOOnw9+vWlqdd1wSHP6KmWLDiDA/gT1DNqaE3mts57eDFeeUlEh
         MIsQ==
X-Gm-Message-State: AFqh2kpl/7hTP6QNVLpxa0N/8fjtPWuzg5Pl/zk41GYMOvgqPLs7EhYX
	IIsHovZnlypPvAyX9azEd0Grx3HDZErPKhdTn9w=
X-Google-Smtp-Source: AMrXdXtb8xzTP8ZD/DigODVFJSoZKfcpnVrNx1laYfhn2Z6bBlvssfbska40q8Byl/DDW7CtfP0ukWwJrmZeWh4A0gs=
X-Received: by 2002:a05:6808:608f:b0:363:240c:bdc7 with SMTP id
 de15-20020a056808608f00b00363240cbdc7mr491738oib.55.1674103611676; Wed, 18
 Jan 2023 20:46:51 -0800 (PST)
MIME-Version: 1.0
References: <20230103200553.52973-1-raj.khem@gmail.com> <20230103200553.52973-5-raj.khem@gmail.com>
 <c58cf7b3d2cc4e4d552529b89c20f9a85a6e7b00.camel@linuxfoundation.org>
In-Reply-To: <c58cf7b3d2cc4e4d552529b89c20f9a85a6e7b00.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Jan 2023 20:46:25 -0800
Message-ID: <CAMKF1srgpUJO_gOK-KFpSerJgZxq1_=8Z+sVFcAHBE-DgkY2+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 5/5] defaultsetup: Enable largefile and 64bit
 time_t support systemwide
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 04:46:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176121

On Wed, Jan 18, 2023 at 7:59 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2023-01-03 at 12:05 -0800, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/conf/distro/defaultsetup.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
> > index f6894f3ab5..1abb509629 100644
> > --- a/meta/conf/distro/defaultsetup.conf
> > +++ b/meta/conf/distro/defaultsetup.conf
> > @@ -2,7 +2,7 @@ include conf/distro/include/default-providers.inc
> >  include conf/distro/include/default-versions.inc
> >  include conf/distro/include/default-distrovars.inc
> >  include conf/distro/include/maintainers.inc
> > -
> > +include conf/distro/include/time64.inc
> >  require conf/distro/include/tcmode-${TCMODE}.inc
> >  require conf/distro/include/tclibc-${TCLIBC}.inc
> >
>
>
> I tried this as requested. I saw:
>
> x86 binutils do_compile failure:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/6562/steps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/5424/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/6572/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/6493/steps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/6528/steps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/6481/steps/13/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/5304/steps/13/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/6437/steps/11/logs/stdio
>
> lib32-binutils do_compile failure:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/6437/steps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/4042/steps/12/logs/stdio
>
> mingw binutils do_compile:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/6562/steps/13/logs/stdio
>

all binutils errors reduce to a single problem, its in gprofng and
uses *64 versions of syscall
functions which are not available when using 64bit off_t. I have some
ideas about fixing it

> meta-virt xen-tools do_compile:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/1166/steps/20/logs/stdio
>

This looks like a simple printf format error which can be fixed easily
by using %j printf format
and typecasting now - conn->ta_start_time to intmax_t(now - conn->ta_start_time)

> qemuarm glibc-testsuite issue:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/6539/steps/19/logs/stdio
>
> qemumips glibc-testsuite issue:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/6500/steps/20/logs/stdio
>
> qemux86 glibc-testsuite issue:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/6481/steps/20/logs/stdio
>

as mentioned in previous email. We can try it with upcoming glibc.

> Close, but not quite there!

indeed

>
>
> Cheers,
>
> Richard

