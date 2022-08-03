Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A49BC19F2B
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 21:51:15 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.30.1659563469935054547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 14:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=UbswfhYQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.43,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f43.google.com with SMTP id gb36so8155804ejc.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 14:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4PNJhsjSMGSzfCtzWcZzX4f72ansiVSs6lAfSyCFncY=;
        b=UbswfhYQoRYC3h8+3+M5FFBiLMUe5e47GOjSntXbRs+rCn31Gwq5a7UibqBq5+bOhn
         E4TBkLB2U5SXuQs+JbwzgPJKeE+nAmua5LHud7btsTHxn5BPtN0NZze/DYCKSz+sWVBI
         QoVevFm7ikFtBLwaCaRtXtAXoooWPX12ycobtVjPO8q+bY4GmWJYLmCjpncFunfWiXbf
         2XA5NaQY8Napszvd02XJVhC1wQxnxVwB5Yf4+pLYpIuyauEzZalU3LtP3URR9wyNJb3b
         saLFL8adrVrb4AmcLU3+7CcOn/CUtnW7m+l2a/EaRYJjBsPUrfZLJ89Tl1aVuJwPScoQ
         LrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4PNJhsjSMGSzfCtzWcZzX4f72ansiVSs6lAfSyCFncY=;
        b=BAM6EzQiO86W8j7g4onxDMgrNqpt5KgQFeMEZfcG/i9B/rESnn8uV4jJjCXJ38Vj7/
         CkCajdeDM/t9060U9edvHgE8X+tGcfcSp0EvOTdcs+ujy/qfB/Tf7a8pMGKjQ/KuXaTG
         j1o5suUhcIoXt3trfafl8Dyo6OwBSrSEu3/lo57uKcZpbV30fZn6ntvtvKhtCJPoj0Oh
         85QHyk7nlxm8Z0VhYFn4aKjcM3PSEWpLMeFnb7tyaMa2Y//+DsXacku24Fen2ylWzaLx
         gS23Nb2AVpQCedn88D3dLWOFh55jhWGxBjFhv+k8f76G1xEI/dfWd2JjC+Y1Ky4DcjbU
         UIYA==
X-Gm-Message-State: ACgBeo1bUkl+xXFgcitunmu1QM3b3amrEoSsZYwILbMN4eidBqFf//Dj
	mjW0+XVa3GQp5fXwJM2mQTqQdmX92CNvWbPaqM9f0A==
X-Google-Smtp-Source: 
 AA6agR5MO13+eCLdWlTuAdKtsJR8eC7ZLRYZOrcZcndhk9LYwphs6BI8lyL39D/PUF3VP0yKYb7wLafaRjChSfcdMso=
X-Received: by 2002:a17:906:8c7:b0:730:c1a9:e187 with SMTP id
 o7-20020a17090608c700b00730c1a9e187mr1202091eje.55.1659563468175; Wed, 03 Aug
 2022 14:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <YsWOLwlNxhAq7sKz@mail.local>
 <570c56bce472ec4ba6a68f537dcb1f85f99a05ea.camel@linuxfoundation.org>
 <CADkTA4N2gGHwG7OWGY32gqLzztsTcOsGXx=-wgpJrJhkfj=OKA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4N2gGHwG7OWGY32gqLzztsTcOsGXx=-wgpJrJhkfj=OKA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 3 Aug 2022 11:50:57 -1000
Message-ID: 
 <CAOSpxdZPefjY=513h0vLb-W3dPqkUzBQXh00V6t68M+-9CDogQ@mail.gmail.com>
Subject: Re: [OE-core] linux-yocto 5.15.48 reproducibility failure
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 21:51:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168830

On Wed, Jul 6, 2022 at 4:05 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Wed, Jul 6, 2022 at 9:31 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Wed, 2022-07-06 at 15:29 +0200, Alexandre Belloni wrote:
> > > Hello Bruce,
> > >
> > > I got the following reproducible build failures:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/1116/steps/12/logs/stdio
> > >
> > > To me, it looks like the in-kernel config changed, did the compression
> > > alg change?
> > >
> > > Are you able to look at that soon or should I file a bug?
> >
> > FWIW,
> > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20220705-g8ltxczy/packages/diff-html/
> >
> > and CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y changed value...
>
> A quick look at the -stable queue to init/Kconfig does indeed show
> that option arriving .. from my scan of the change, it looks like
> there are different compilers on the hosts, and hence that check is
> detecting a buggy gcc (or not) and changing the value.
>
> So one of the build hosts is failing the test, and another isn't.
>
> I'm not sure how to fix that, unless we revert the change. I'll ponder it more.

Was this issue ever resolved?  I'm seeing it on kirkstone now too :-(

Steve

