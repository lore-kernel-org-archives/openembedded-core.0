Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1164EC433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 10:31:44 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web09.5534.1642156303306379329
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 02:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=XHfMB5sd;
 spf=pass (domain: madison.systems, ip: 209.85.167.41,
 mailfrom: matt@madison.systems)
Received: by mail-lf1-f41.google.com with SMTP id m1so28840426lfq.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 02:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dYrQITdTWv1kbGr34ZVO15ViDkiCWXsgI2Evq495VaU=;
        b=XHfMB5sd7nuddjdsBID1yqA9cyMKS+BZLtWBfBMqp2q9ftc/1CGKZlg9dvi16xWuRB
         fuUGiPMy8/0CStw88y12tQhNfHzzdPDRyRXIIKNK6RTbm5mt8TxM/1P2rcSQUVZdlY2t
         pbMeG+yD5V1farUXXmeHTb+xWHs82SqNFWk1P1tG/DfszFz9EKWh0k01EHEYk7CLx7Xf
         jVmhQpUeH1zu4+NngenzjStx5TlpkTq7Qfx2WiYQWmfGS/Wn0SqFEqmi29DT3aaBGOTV
         C5clMnScB5MqGXgV0ZcstyPZMSrTchTizOP6ADp0pntjedVuFESyziLdkLcfGO4Ba7D6
         eGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dYrQITdTWv1kbGr34ZVO15ViDkiCWXsgI2Evq495VaU=;
        b=O/EGIh+vBJ4RUtTpmdH6os6neh7hFnBsvMfTv2bcPgZyweAIUqPV82Ynm7LRJuRQTL
         p9CrBj/KNDXQoHPhCvMSdvkGkuYoFvNHivkofq5nY7V57zW7gFSuxQ07eUzO3ju6cWn2
         +dW+2MecduNQRDLkDNMZo/dTmdLC26i3mARmj20T0Icm8ZgT0l3tHIcPA8WxuczGUOZx
         AoH1U5pLEF3+Uec6fUiwbVIGouoQ8L0et+yY8qig336vuoZftpCY02JZ6TTxVOT7gNth
         NKafo2EkLx08NqOGAk8JVIby9WFumRck37FWxHL6Mhrlc0vRSVUYvhegQjt6+BUXDhyU
         /qVw==
X-Gm-Message-State: AOAM532FJabR+yNyOtTWcOLKisHQP6y0G9vl0Aejq2HfV5NEub3TiZXY
	IIgxRFCBzGxcYyu5DD4pwwtfueUP32HIMnjCAYfdBA==
X-Google-Smtp-Source: 
 ABdhPJwYoLwoGG4ejt6tKxUxBOxhg3mnASYxYSP6MmBNmFzub5FBdVHNbSgwGNNB4MhA6x+Ld4hWZOYMK4iA1cvCYIs=
X-Received: by 2002:a2e:9787:: with SMTP id y7mr6241274lji.213.1642156301290;
 Fri, 14 Jan 2022 02:31:41 -0800 (PST)
MIME-Version: 1.0
References: <20211217153630.1746217-1-matt@madison.systems>
 <100ff0ce-72e1-b3b3-ff1e-2a56e0742624@sancloud.com>
 <7b0757495eff0e466dc84cb82f597e4c28256061.camel@linuxfoundation.org>
 <015ba052-f4ce-5eb3-4b91-5d7d9eac981b@sancloud.com>
 <16C2D7CF44733347.22520@lists.openembedded.org>
In-Reply-To: <16C2D7CF44733347.22520@lists.openembedded.org>
From: Matt Madison <matt@madison.systems>
Date: Fri, 14 Jan 2022 02:31:30 -0800
Message-ID: 
 <CAGgRHJrzK87MBuaz1NRi+F4tvn=BFJDMZTECE0f06a3J0RPxOA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Move crate fetcher to OE_IMPORTS
To: Matt Madison <matt@madison.systems>
Cc: Paul Barker <paul.barker@sancloud.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Joshua Watt <jpewhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 10:31:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160562

On Tue, Dec 21, 2021 at 10:15 AM Matt Madison via
lists.openembedded.org <matt=madison.systems@lists.openembedded.org>
wrote:
>
> On Tue, Dec 21, 2021 at 6:07 AM Paul Barker <paul.barker@sancloud.com> wrote:
> >
> > On 20/12/2021 22:34, Richard Purdie wrote:
> > > On Mon, 2021-12-20 at 17:01 +0000, Paul Barker wrote:
> > >> On 17/12/2021 15:36, Matt Madison wrote:
> > >>> This patch series switches to using the OE_IMPORTS mechanism
> > >>> for installing the crate fetcher. This simplifies the addition
> > >>> and clears up issues with interactions between SRCPV and
> > >>> the shared-state fetching logic.
> > >>>
> > >>> Matt Madison (4):
> > >>>     lib/crate.py: install crate fetcher on import
> > >>>     base.bbclass: add crate to OE_IMPORTS
> > >>>     cargo_common.bbclass: remove inherit of crate-fetch
> > >>>     classes: remove crate-fetch.bbclass
> > >>>
> > >>>    meta/classes/base.bbclass         |  2 +-
> > >>>    meta/classes/cargo_common.bbclass |  2 --
> > >>>    meta/classes/crate-fetch.bbclass  | 28 ----------------------------
> > >>>    meta/lib/crate.py                 |  2 ++
> > >>>    4 files changed, 3 insertions(+), 31 deletions(-)
> > >>>    delete mode 100644 meta/classes/crate-fetch.bbclass
> > >>>
> > >>
> > >> Would a better solution here be to move the crate fetcher into
> > >> lib/bb/fetch2/ in bitbake?
> > >
> > > I've been wondering about this too.
> > >
> > > Does anyone remember how the fetcher lines up against the general fetcher
> > > requirements we have and is there a list of anything that remained to be done
> > > before it could be added to bitbake?
> >
> > If I remember correctly, it just needed some test cases writing. The
> > crate fetcher is a subclass of the wget fetcher with changes to how
> > urldata is set up and how unpack is handled, so it should integrate well
> > into bitbake.
>
> One thing I see that's a bit worrisome is that it disables
> recommends_checksum for the downloaded files,
> and populates metadata for use (I assume) by cargo with the calculated
> SHA256 on the download.

Any other thoughts on this?  I've modified my distro to work around
the problem that led me to propose these patches, but something needs
to be fixed here. crate-fetch.bbclass should not be setting SRCPV.

Thanks,
-Matt

>
> -Matt
>
> >
> > Thanks,
> >
> > --
> > Paul Barker
> > Principal Software Engineer
> > SanCloud Ltd
> >
> > e: paul.barker@sancloud.com
> > w: https://sancloud.co.uk/
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159928): https://lists.openembedded.org/g/openembedded-core/message/159928
> Mute This Topic: https://lists.openembedded.org/mt/87791267/3618418
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [matt@madison.systems]
> -=-=-=-=-=-=-=-=-=-=-=-
>

