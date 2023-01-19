Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B13C00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 04:32:48 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.38577.1674102763601887832
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 20:32:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IQ5AHw5c;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-15ebfdf69adso1400102fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 20:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0R+Ab9Gw4v3bIIXu186MMbIhthqZl4tUSklZIndM0GA=;
        b=IQ5AHw5cz9/g9EI9JsqGn9MiCcqntYXN4IwAgXag7MqjBtlWFQLOI/WB7DM6bLDhUa
         l7NV5Ktefqeecw0+kthuKUFUBVCZ5qNDwFpFapSEJsJF2HatieZrhTrIpxlrgX/JvM3z
         +JbdPr9iEC0MBpQzH60W4vrsxxsr051RW4ZnAzYuTBFl2pvljlQViRdYGRGkRpAG+7rZ
         nXkRapZAjGAPIC+6Gb9MGwKQpGUHfJD4uZzc3VjkuBG50CJGQVhQRA21+/dE6lOFD3Fv
         i9QLtufXwBIazL3NYMFGR42/5hdSQfBwLY7hvEhInlkcAXnpzt9WVYCB+cbI1SlL2DFA
         TYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0R+Ab9Gw4v3bIIXu186MMbIhthqZl4tUSklZIndM0GA=;
        b=yiXOsCGM7j/fSH78a3f18Udt38pDqZvF9HwwP0HGrdfqXF9gBo0IVPmAXvWeI7lf1L
         mFJsgggEKdsQPZFUAnbZHMWerqu4BxkzchWur0ForI4cwNKzMaIgw3k9USPYKPn4jNsN
         ie7laSZdunbtdpvG8d87ncts6rpJew11g9qkRBMqoFuY/ebJyJ/yds+Wu7YDtn2EJnRv
         FlmUcDlcrJ+vUfwdgHe8nWdeVuq1r5KFWlmdeX8QawYILx5Gu876nN7M8sCPpt/Wp3MO
         mHBhph+RC5C+GveLuO5Db9wHwgCGE7riZjjwMGrpSpoCPaRzDFGoSPpD1iZ782qogCLM
         tKmQ==
X-Gm-Message-State: AFqh2kpvNYCIkHbvg4FTa3PpZEx8Mc1Q+CDFYdaAo/RLuLRtjVdOfVRU
	A9k6X00WAFCR36TjlK+MgSUwLsxfR4fr1pVfb1k=
X-Google-Smtp-Source: AMrXdXsTXZDmBSFghspm3vtzYAC8RoDfpn7CLWuPYjBnBInR4gY6q+WwekEAIJqVb1tFJyGQk9dCTJAAEkzToPB0NBQ=
X-Received: by 2002:a05:6870:ebc3:b0:144:e1eb:419 with SMTP id
 cr3-20020a056870ebc300b00144e1eb0419mr814837oab.262.1674102761972; Wed, 18
 Jan 2023 20:32:41 -0800 (PST)
MIME-Version: 1.0
References: <20230103200553.52973-1-raj.khem@gmail.com> <20230103200553.52973-5-raj.khem@gmail.com>
 <c58cf7b3d2cc4e4d552529b89c20f9a85a6e7b00.camel@linuxfoundation.org>
In-Reply-To: <c58cf7b3d2cc4e4d552529b89c20f9a85a6e7b00.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Jan 2023 20:32:16 -0800
Message-ID: <CAMKF1sqTAFzJCXJ29F6r5xy0GoOSv=qSYBw_wcOh6jcmk=Td=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 5/5] defaultsetup: Enable largefile and 64bit
 time_t support systemwide
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 04:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176120

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
> meta-virt xen-tools do_compile:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/1166/steps/20/logs/stdio
>
> qemuarm glibc-testsuite issue:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/6539/steps/19/logs/stdio
>
> qemumips glibc-testsuite issue:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/6500/steps/20/logs/stdio
>
> qemux86 glibc-testsuite issue:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/6481/steps/20/logs/stdio
>
> Close, but not quite there!

Thanks for trying it out. I did realize that we will be better off
trying with upcoming glibc 2.37
I have a patch for the upgrade on the yoe/mut  poky-contrib branch. cherry-pick

[WIP] glibc: Upgrade to 2.37

on

https://git.yoctoproject.org/poky-contrib/log/?h=yoe/mut

as is with glibc upgrade, there might be other gotchas e.g. uninative
generation etc. but
meta-oe AB job has been using this glibc for some time now.

>
>
> Cheers,
>
> Richard

