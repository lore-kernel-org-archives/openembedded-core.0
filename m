Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0265DC433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 15:36:58 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.8736.1654270616214316364
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 08:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O+A26vmE;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id x7so5872019qta.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 08:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HAgxZUJ0+hZKs8tx1+X2g6yF38x8tWwZGYZRTlKu52g=;
        b=O+A26vmEAqEvSFbhaVMqhd6l2KXfs+JNZHw2fACk868TIBD6g73arRrSXC5vd2mVwe
         7oPa8r4D1SrPjRq2xze0dfNjDz+wUUNacTf0PCNt6bnlYtHQ2HS8598RZTJIEpv/hCAn
         TgHZU7uYTuG6uiTB+h7LePF3CK+KDhjZMewSROXMyrHERmLQ+kDzefCUZ33HQtg6oqb4
         /zcGoCVjsKWSlRKSM739FE7RkWc7qwFuy8NvvJBGaksTIc/4LO3+B4jz/p0a/jEszakV
         2jZXm2P2giwopYXuj8bsr++FLlwWpJSsR1vgLa+Do5ve/xcXi32w019rMYdMk2DFea+r
         BBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HAgxZUJ0+hZKs8tx1+X2g6yF38x8tWwZGYZRTlKu52g=;
        b=F6nFC7zm6JgmDrPDS4Bos6rOQNlhQhI5AvlI6WBgRJ9OQBr0pFPpBK5CixxL+vQZkU
         3IiBDsCoT/n8xTDnS3zs45ChaZtuodRZaV9WHNOiXfpViiFy+vvHYSNff4/BnwV++ZxG
         pC+BOc5yoSx+pZ+n34Ott4FBbg2DLfoPwf4JhU+MvvaixKnGqYfw5bR/mkwSVi4C8jcL
         3SmQ0LIHhFJpjP0A2f+L1y7KrVgOBuALNWmb992zAFRvzHsnmYFfVp4S60GkVbP/mnwq
         qjUqJnr9j8inNaZDhUVkNIGUQmGzUg/Z8vULqbrbwNQRMYNXL3j8LBjn6nuxVU7FYqF5
         qDgw==
X-Gm-Message-State: AOAM530R4i4BcVhvdw1GOpxStbKCcODElMZXnFF3Grrr3WOANI5JwB8B
	2e+441TRylG8VTgpLQO3QFLCGpin/Xl9F8cbjR4=
X-Google-Smtp-Source: 
 ABdhPJyOYpmmOwpHYaYil5tUob7I76gWTiKJ9De4ThjKDle8uCeatT+KUg+Mwttxc0LbOIiJ+nbRmUYMi81s0G9zAm4=
X-Received: by 2002:ac8:7d4f:0:b0:304:e3af:9309 with SMTP id
 h15-20020ac87d4f000000b00304e3af9309mr610241qtb.634.1654270615265; Fri, 03
 Jun 2022 08:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220603064121.7395-1-pavel@zhukoff.net>
 <CA+chaQdbUFZ3KgZsgFJCa7ZRMku8wkj6+Ddnaj06nEFTMPyxPw@mail.gmail.com>
 <87wndyfcss.fsf@gentoo.zhukoff.net>
In-Reply-To: <87wndyfcss.fsf@gentoo.zhukoff.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Jun 2022 08:36:29 -0700
Message-ID: 
 <CAMKF1spWnU1fpjhQa9jE0+DZn3YqS6TvzTJPkKqxfyUBdWKbhw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake.conf: Make TCLIBC and TCMODE lazy
 assigned
To: pavel@zhukoff.net
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
 Pavel Zhukov <pavel.zhukov@huawei.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 15:36:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166521

On Fri, Jun 3, 2022 at 12:04 AM Pavel Zhukov <pavel@zhukoff.net> wrote:
>
>
> An example we have right now:
>
> bitbake.conf: TCLIBC ?= "glibc"
> linux-distro.conf: TCLIBC = "musl"
>
> TCLIBC="glibc" bitbake -e distro-image-base => TCLIBC == "musl" which
> confuses users a lot (and it was not working this way in dunfell).
> Same applies to if TCLIBC="glibc" is in conf/local.conf then musl is used.
>
> With linux-distro.conf : TCLIBC ?= "musl" image is build with "glibc"
> which is not that we want.
>
> With suggested changes:
>
> bitbake.conf: TCLIBC ??= "glibc"
> linux-distro.conf: TCLIBC ?= "musl"
>
> TCLIBC="glibc" bitbake -e distro-image-base => TCLIBC == "glibc"
> bitbake -e distro-image-base => TCLIBC == "musl"
>
> If distro maintainers wants they can set to TCLIBC = "<implementation>"
> and disable overriding explicitly.
>
> Do I miss something?
>

Its better to define different distros profiles sometimes they are not
beneficial to have knobs on cmdline e.g. see

https://github.com/YoeDistro/yoe-distro/blob/master/conf/site.conf#L14-L15
and
https://github.com/YoeDistro/yoe-distro/blob/master/sources/meta-yoe/conf/distro/yoe.conf

Since there could be multiple factors deciding the policy.

> "Martin Jansa" <Martin.Jansa@gmail.com> writes:
>
> > You can always override it from local.conf with an override, right? That always worked for me and I don't see why this change is needed.
> >
> > On Fri, Jun 3, 2022 at 8:42 AM Pavel Zhukov <pavel@zhukoff.net> wrote:
> >
> >  This allows two level of overriding (distro level and local.conf/shell
> >  variable). Previous settings blocked shell variables overring
> >  if it was overriden on distro level.
> >
> >  Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
> >  ---
> >   meta/conf/bitbake.conf | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> >  index 0e939aca4f..2a3cf6f8aa 100644
> >  --- a/meta/conf/bitbake.conf
> >  +++ b/meta/conf/bitbake.conf
> >  @@ -386,8 +386,8 @@ FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar
> >   # General work and output directories for the build system.
> >   ##################################################################
> >
> >  -TCMODE ?= "default"
> >  -TCLIBC ?= "glibc"
> >  +TCMODE ??= "default"
> >  +TCLIBC ??= "glibc"
> >   TMPDIR ?= "${TOPDIR}/tmp"
> >
> >   CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE'))][bool(d.getVar('MACHINE'))]}${@['', '/' + str(d.getVar
> >  ('SDKMACHINE'))][bool(d.getVar('SDKMACHINE'))]}"
> >  --
> >  2.35.1
> >
> >
> >
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166511): https://lists.openembedded.org/g/openembedded-core/message/166511
> Mute This Topic: https://lists.openembedded.org/mt/91516557/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

