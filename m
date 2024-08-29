Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCD9C83028
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 09:56:33 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.8924.1724925386172983048
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 02:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M/bT/3ZD;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53345604960so475644e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 02:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724925384; x=1725530184; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t8RYQSRdT6rWFDzQC0oRUnyzBYIQKXWgwkmUh5kVJrg=;
        b=M/bT/3ZDh7MK+n1G6pVBKPCwEZxCmerdGEIozVM13wAMe1XVEcxEQzGLsOqCvd0B+k
         H2NdN2if/U2N25i9BQQQsj14l+/ZBrILeVqsI/b1+v0RflFTvZTw18l0CQdKE8M+Z/Ur
         4ZRnM/cpbkXb8JqoCugeBAvg7diuyDPE7uBEb72x3sYqRHs25gXzvoVJwq+PimSHs3e9
         vsYl4lYIU68/RykwyBvPB+SdVg+kDZlvSz8ejwQCnzMOKRntZWr0ML/0ze88ozUG29RS
         ZFLdHaAYAqBE5SnMufbnfnyST9fUu7EupTveSO30CnYGY0ss96gE+Ei2QdpDX+d6Xgbf
         2L2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724925384; x=1725530184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8RYQSRdT6rWFDzQC0oRUnyzBYIQKXWgwkmUh5kVJrg=;
        b=Pfh2AH198SgrnQH1g/DkHiDOkQTEUsVDX1eMP2nCmESTHzFh5tve5dzoJeYSgK9Xce
         bl9Ngzg+j5SMNEzQVWnb6hAn0MboAUX7qmM1/CeoJLkDYPlPCAEda/cPZ3YwUqO8tUR7
         DjXG8enA/lqPvpx3nAoaeRd/MMv8KITqZL2Ix6FAwn+7WfoYGS4X1puYspIC/5BVPTvT
         VTIINlNMKoXDpMkGre+DvK/WcOEvCBihkLBbcEWS0Q0IxFNCfpEDvzxYlTcpSyOX5O9m
         9uSEfNnq4F14AtSJD9irWLUNqKljj9mXcMyQ17YddhL4xmwKciJX/YHxoztRkVchMZxA
         XAuA==
X-Gm-Message-State: AOJu0YxxqPLp3pDW+CD5upMEwVZj8BkLZnudfj/J8FWUnjmcqgekeWD9
	6JQqGXwCHK/GloSB/LrKsHZNrHHmoviDz4yGqbXHBUPXyGYvrh9IVhXqBrmOGzZVOdruTIVNCPn
	6hZJ5824maHPlxaux15Il9M6iQRE=
X-Google-Smtp-Source: AGHT+IGr57uTLagXhF9QIOqrpST9kYZvXWSdB1J3K4J+rAg2RL5R7AcfW9Q554aDeBys7aLxJ0+wWoD12ppbtGElyb8=
X-Received: by 2002:a05:6512:3f14:b0:533:4689:973c with SMTP id
 2adb3069b0e04-5353e55c9f0mr1330926e87.23.1724925383601; Thu, 29 Aug 2024
 02:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-D+XgSFDNWnJ9LNdRe=RgLq-c5v8AP48s4T18TJ2pDZQ@mail.gmail.com>
 <6670.1724698895497804544@lists.openembedded.org> <9f118764c6f9f2a5361356312b696b6eecad6c56.camel@linuxfoundation.org>
In-Reply-To: <9f118764c6f9f2a5361356312b696b6eecad6c56.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 29 Aug 2024 11:56:11 +0200
Message-ID: <CANNYZj_su-bHO8ipftsjR66Q4hOx8tqjE7=nQXTdDP2_QXfCTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sysvinit: upgrade 3.04 -> 3.10
To: mr.name@web.de, richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 09:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203907

On Thu, 29 Aug 2024 at 10:52, Richard Purdie via
lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
>
> On Mon, 2024-08-26 at 12:01 -0700, Sven Reschke via
> lists.openembedded.org wrote:
> > Hi Alex and Alexandre,
> >
> > sorry for the delay.
> > I've created a PR on Github on top of your latest changes:
> > https://github.com/Nanowires/oe-core-clone/pull/1
>
> I did try this on our automated testing and there were some issues:
>
> musl build failures:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9440/steps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/9456/steps/11/logs/stdio
>
>
> systemd+sysvinit build failure:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/9431/steps/25/logs/stdio

If you want to replicate these for fixing, the configurations are here:
https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json

Alex

