Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE4FC433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 14:14:58 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.10712.1651241680483891265
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 07:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=sI0NX96S;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.42,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f42.google.com with SMTP id g6so15748556ejw.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 07:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NfXy5jd53PNYPHGPb/8bdjfEc/AyF5B8OuXhZJVaxww=;
        b=sI0NX96SCypdQlR8hbX6crOGWTQe5FTGQUthSINoxfWvIw0XfuuPJ5hUBtnF72IYia
         yLemvJ0rwr/nvdot6KfvVttT4Gz06MpJkLTgd8jF/lTyopFyJ4XwuDojyC74vyxnzRnd
         totERnZWTa6FYfTCwdtY9CwD8mlDtwYq8PsBTIUzCIC/fCff3IjAoeVyytkHYBURdGKl
         Y91/rWgx8X8iaVDy6gkJDfRGQUUPtny+6iOlfMQsBogwRbUAHiL5XHbxd7PVsOg7Z5Mc
         EDLRM9rE+XJpqJni5UuDMLB3fw1R0zDykOkkEEoTAiAG0/777ku/PgX8/OVUGN2IXclT
         gMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NfXy5jd53PNYPHGPb/8bdjfEc/AyF5B8OuXhZJVaxww=;
        b=i1dS3zF6/7BAtKG2IO+yQWDC0FWcj3m7JSarh4r8fpFpCFd/UGnnf17SpfF6bR5hjs
         uXdDoFoTsKnc3FzrFV9NP1uL9WSm369BN+ymbCsbWXo5qqRKt+WkUetZQJp4gkMkX/Aq
         jAT5bSALnxNihO6FfSIsmwDZvfGJXd8JeLzFR++bIQUnaUGAPXAVYa2ZWe+TpToxX8lp
         4/kHKf0MnbtxrlffkY8cBIneUZliR84+/9TDz4PzbcebEdzOVjvDcYHXTCVGfBbPICKV
         Z9YCz7qyZ2aGp0lA/bM2YEwepQQwRIhp2PYs4h4NSMpZSvjh9sByy6fXRlaTmsyXrKHQ
         5dnQ==
X-Gm-Message-State: AOAM533qJK7PavOYH7nJdvbp/y07blQP1Y3mEjsNH/V9GfruDoqw1r7c
	mDq0i+vktC3vukGL24bjCd2TPGxbV6n1Sg1+RIcgRQ==
X-Google-Smtp-Source: 
 ABdhPJypbcn+SPCtyPUble6gry1wcJqkr5JBkmB8wNVK146okq58yVz5F/0NB/p/XREOKvFvLr8Dr2NwlhcSED+FzXM=
X-Received: by 2002:a17:907:3f8b:b0:6e8:318d:1def with SMTP id
 hr11-20020a1709073f8b00b006e8318d1defmr37721515ejc.153.1651241678824; Fri, 29
 Apr 2022 07:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220426134908.520502-1-davide.gardenal@huawei.com>
 <B1A86329-AB3D-428A-884A-D55028964FFF@gmail.com>
In-Reply-To: <B1A86329-AB3D-428A-884A-D55028964FFF@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 29 Apr 2022 04:14:27 -1000
Message-ID: 
 <CAOSpxdbfj8=R1MbUvY=yDdmHcaVknDmY5wCjFbh6Y4XeFyn8qw@mail.gmail.com>
Subject: Re: [master][kirkstone][PATCH v2] create-spdx: delete virtual/kernel
 dependency to fix FreeRTOS build
To: Davide Gardenal <davidegarde2000@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Davide Gardenal <davide.gardenal@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 14:14:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165015

On Fri, Apr 29, 2022 at 2:18 AM Davide Gardenal
<davidegarde2000@gmail.com> wrote:
>
> I saw that this patch was not included in the kirkstone backport list. Could you consider to add it please?

It is in the set of patches currently under test.

Just as with dunfell, you can view the patches under test in the
<release>-nut branch on poky-contrib.

So for dunfell:

https://git.yoctoproject.org/poky-contrib/log/?h=stable/dunfell-nut

and kirkstone:

https://git.yoctoproject.org/poky-contrib/log/?h=stable/kirkstone-nut

Thanks for checking though, I don't want to miss anything!

Steve

> > Il giorno 26 apr 2022, alle ore 15:49, Davide Gardenal <davidegarde2000@gmail.com> ha scritto:
> >
> > When building FreeRTOS this dependency generates an error because
> > bitbake cannot find any provider for "virtual/kernel".
> > From a dependency analysis the task is executed indipendently from
> > this so it can be safely removed.
> >
> > This patch has been discussed in this ML thread:
> > https://lists.openembedded.org/g/openembedded-core/topic/90602531
> >
> > Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> > ---
> > Updates:
> > - v2: Reword of the commit message
> > ---
> > meta/classes/create-spdx.bbclass | 2 --
> > 1 file changed, 2 deletions(-)
> >
> > diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
> > index 28fc449636..9979c1d70e 100644
> > --- a/meta/classes/create-spdx.bbclass
> > +++ b/meta/classes/create-spdx.bbclass
> > @@ -35,8 +35,6 @@ SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created f
> >     is the contact information for the person or organization who is doing the \
> >     build."
> >
> > -do_image_complete[depends] = "virtual/kernel:do_create_spdx"
> > -
> > def extract_licenses(filename):
> >     import re
> >
> > --
> > 2.32.0
> >
>

