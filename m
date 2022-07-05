Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12643C43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 09:16:07 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web12.82079.1657012559929448927
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 02:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EvzDVTaM;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id z13so19438208lfj.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 02:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZyAOZiEz4cJmlca1wcsFyi5KV52rkRIVxz90rLlDLIY=;
        b=EvzDVTaMMm0cSlrMvbaCJvtsGP/hzvEc0JPLjd/9iSMJTu3PMc7kqf1UopJdC2NN4Q
         7dVUs5aSOYzHaVTg6opxi+qNiS1UI7GJAvcSPchaU2OMGdgpOp13FWh82jOxZNg9I+CM
         +mfDoyg/ZNVLSZ70aImMSFx8FHRTHLGhvSaHqI3uMOAcJ7WBcl56cxM4MNt922W21B33
         0ckuJmUN9YTSnzcXDSo1Trgp1qqG7BcStC+9+c8MHQ+CyMcyy5odAa929/6uQqmL7r+P
         swOBqAbYvCNQTvzes5AeravK2ZO2lEzCZjwaktBgUzKuQMuH5tLRVDVvmwHu6jhFVfDJ
         l5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZyAOZiEz4cJmlca1wcsFyi5KV52rkRIVxz90rLlDLIY=;
        b=SZdd4ouMkGKfVYyLg33K6V/ztpOC0xTQV0S3GZyDtelK/uz76wYUxEY3o9eA1c4zNq
         +oL7mK0CK5/78MBOMP/v27oa2LLr6Qb3EgE7Cvuxm96HC+LYEZRxf4/zMzCw22yWd3EG
         Le5Eou6UAJQWDjfhiA/qkCslgWgnxDTOJgpMefCU7UkiuGP4EqZQjl8P20QGep9XoQez
         2QqMGt3OkN9jTIemX5K1cmakEjkUTGgfNn9/xStJagSrlqTqD6hwzEY4T25BWEkDdfWU
         4xpU3cDUtRm3LZ2DEVd8Z02sCHEX0cIRgq7dUxP+uqox+888b85Vh7yg0fZs/bq4hlb1
         8X3A==
X-Gm-Message-State: AJIora84N7TRTcWTg7XT5t3PMtrmQNJ74AKyRuE4wylGMvUB/2WD8WsY
	SrrCec7HzLHefFyCENR6dm/QNAvNVUmvcRMBLP0=
X-Google-Smtp-Source: 
 AGRyM1vUS046Vp/US8HhjmkKrOxcRL1odp+qFiW9ptP8AWBaBAJuJwT7iRGm70Fky5o10syyH1zhkPos10PpeRKRB4A=
X-Received: by 2002:a05:6512:acc:b0:47f:769e:6aef with SMTP id
 n12-20020a0565120acc00b0047f769e6aefmr20571762lfu.26.1657012558130; Tue, 05
 Jul 2022 02:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220701192449.1358325-1-alex@linutronix.de>
 <329d53233a9966693bc19f821f7f3996a187eced.camel@linuxfoundation.org>
 <CAJ86T=XPx1sVqmaJd+C2q81PV-jgjDK9x=cjrEzqRnGjqEghLw@mail.gmail.com>
 <CANNYZj-+2QvuXUT9Vshdq5T6-uLEV5p92QeAqw+kbajPm+UKyQ@mail.gmail.com>
 <481775663c6c797dde9596268fde594bc567a12d.camel@linuxfoundation.org>
In-Reply-To: 
 <481775663c6c797dde9596268fde594bc567a12d.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Jul 2022 11:15:46 +0200
Message-ID: 
 <CANNYZj9e6dmh1pFZZN5T705s6mtVa5SdWoov3+5vbUT0+VrhQg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake-layers: add layer
 repositories/revisions save and restore tooling (aka 'layer configuration')
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Andre McCurdy <armccurdy@gmail.com>,
 Adrian Freihofer <adrian.freihofer@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 09:16:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167645

On Tue, 5 Jul 2022 at 10:51, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The challenge with your approach is that it is bolted directly onto
> bitbake-layers, which makes it not only OE-Core API but bitbake API
> too. There is a standard such changes need to reach and I'm not
> convinced that is doesn't tie our hands in future as is.
>
> I suspect in reality, we could probably have the same functionality in
> a separate script in OE-Core, maybe improving the APIs/library
> functions from bitbake-layers if needed. That would lower the bar and
> mean we could have something focused on eSDK needs rather than the
> wider problem.

I added the layer config generator as a bitbake-layers plugin for these reasons:
1. It is layer management functionality, and so logically belongs in that tool.
2. It is more visible and discoverable when it is in there, as opposed
to all those executables in poky/scripts/ which most people have no
idea about.
3. It needs to get a list of active layers and their locations
programmatically, which is trivial from a bitbake-layers plugin, less
so from other places.
4. it can reuse code from meta/lib/oe if/when needed.

There are a few things in there that I'd already like to do
differently, and there's also the 'save the active build/conf in
TEMPLATECONF format' piece missing, so there'll be a reworked version,
arriving in bite-sized chunks for easier review/discussion.

Alex

