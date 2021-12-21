Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A114DC433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 13:57:20 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.5933.1640095038990074167
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 05:57:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=bdz0xeaP;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.43,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f43.google.com with SMTP id j21so47998236edt.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 05:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TSS1+7CHmyzsMJPsSAaZHtsdXl46YGiumhHxHfRAI38=;
        b=bdz0xeaP85NWDJAUIjQ6gfKtrbEzMlqGBNNh6B/nB+muPHMC4IJPQiDE/qMNE6hpKj
         bWN/tlIabOmZYHbAhGPg0fYMpGOWqBK5XjzSpDEikKQ2LO24kzqvWX5o3W1T92AmKyjP
         /7oTp9dt0S6ineg7u8Y0ODm1yKlx63zO8Ssb1rahtxNleviADn8Z/AqT9JXYVE0tZ2rM
         OLpN+GNZRoADPFQgLaXjJckXK4jBw8Aelzxq2GRjiYP2PST3IrYITbrE6TfP03ukWvEP
         +j+cQQj0BPvMtjIyOPVewkWbJm/NEGRMosJ2Cd1TtZ6irZL1E1hYUu7JO99BSsbe8GZS
         PLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TSS1+7CHmyzsMJPsSAaZHtsdXl46YGiumhHxHfRAI38=;
        b=d6hcgoNKVFHOMrFatGQtcS61crqRY3wPwSYSzQ0too7dTCFSjCzWz5hQXaVC3Whajk
         tYVezgX8JS/mgnLXbhajU87IXeP6BvMISjtiJ1x8OFiKum765+Mkbeq33Pxk5LXEH40g
         asR+ovtWjHSx/h4KNG9rIsVrWRch2r1G6MRVsF6CCAGU9Ce0SDu2jOtp3cND+ntUfMIC
         bdDsLj+p3uLkv9ZRkK+jh06srhBFxZ0k/qPSBUNg/R1lRrIh9sfm4b7mhuqsYLNDC/pR
         hU+/47HVcjgmHJz9eoMxPjezW+PHSWXo1OIK49HhdFPySs2ecPauClTIBszhdBoo+mTV
         CksQ==
X-Gm-Message-State: AOAM531enOAmhXZtItYwoUxm3HIFAQjugKYK++JPTSL9h5jUuucks7oz
	bCCZmMq1RE0x+WgBgHG8w83BI8lDKGJKeMgIhAygFQ==
X-Google-Smtp-Source: 
 ABdhPJyf2YqCMs9/ErFRJb8gCmWYCWWSU8QaMfoA7J9RAHH80vfjFY84YCZ48S3QAboN/xD7MxWzbT9bp4SnLfYbcSc=
X-Received: by 2002:a50:8d10:: with SMTP id s16mr3331945eds.305.1640095037396;
 Tue, 21 Dec 2021 05:57:17 -0800 (PST)
MIME-Version: 1.0
References: <16C2B9B88AD918F7.22520@lists.openembedded.org>
 <0ab160933ee8b84b5d5b0e648a2a20f8ed3367d3.camel@lists.verisure.com>
 <AM9PR09MB4642921897485601CE80186EA87C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <c266b479d7567aabc0560d355ee407504d5ef62e.camel@lists.verisure.com>
In-Reply-To: 
 <c266b479d7567aabc0560d355ee407504d5ef62e.camel@lists.verisure.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 21 Dec 2021 03:57:05 -1000
Message-ID: 
 <CAOSpxdYt44zpYMZYLWMhvVBNFUmtPangBO7YheCaScynM1RUvQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH v2] dropbear: Fix CVE-2020-36254
To: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernst.sjostrand@lists.verisure.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 13:57:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159919

On Tue, Dec 21, 2021 at 3:34 AM Ernst Sj=C3=B6strand
<ernst.sjostrand@lists.verisure.com> wrote:
>
> On Tue, 2021-12-21 at 14:07 +0100, Konrad Weihmann wrote:
> >
> > On 21.12.21 14:02, Ernst Sj=C3=B6strand wrote:
> > > Dropbear shares a lot of code with other SSH implementations, so this=
 is
> > > a port of CVE-2018-20685 to dropbear.
> > >
> > > Reference:
> > > https://urldefense.com/v3/__https://github.com/mkj/dropbear/commit/8f=
8a3dff705fad774a10864a2e3dbcfa9779ceff__;!!BFCLnRDDbM3FOmw!qe9UYrBIPEc6nPIe=
OuTW0e0hW6_XwL0XE4vWFFUg-UeQcxixYMRQ__QllRTD9Iw88H1k2OWm0g$
> > >
> > > Signed-off-by: Ernst Sj=C3=B6strand <ernst.sjostrand@verisure.com>
> >
> > This is missing an Upstream-Status entry - in this case that should be
> > "Upstream-Status: Backport"
>
> Should that line go in the .patch file, the commit message or both?
> I guess both?

See the "Patch name convention and commit message" section at:

https://wiki.yoctoproject.org/wiki/Security

Thanks for helping out with CVE fixes!

Steve


> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159918): https://lists.openembedded.org/g/openembedde=
d-core/message/159918
> Mute This Topic: https://lists.openembedded.org/mt/87876568/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

