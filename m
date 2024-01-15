Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361B1C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 21:50:24 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.97219.1705355418402563458
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 13:50:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=XhDGuGIx;
 spf=pass (domain: konsulko.com, ip: 209.85.160.180, mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-429be9fe952so32433751cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 13:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1705355417; x=1705960217; darn=lists.openembedded.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3aLYO9l50Pa/49mwT7g7orvsDl6yWqjoehFcarG8FZg=;
        b=XhDGuGIxdnX9/wWDf3mRhdlNkNhJvzryxkQJGp24O+A+MCcfnaMkEwOmGVCMi90iqT
         BRnz2V5XMsKq8Ysd7SSIaz1g+uMmFGMcC8Dm3SvUY9fypd0Cq+4qmb/eNPN8TIF8REzN
         qs3ag0xznFsa1eZZEroTRaDoFFUjlMvffzuEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705355417; x=1705960217;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3aLYO9l50Pa/49mwT7g7orvsDl6yWqjoehFcarG8FZg=;
        b=gzTFDPNcrz75e1oXgEPzsvKBcNbDEGqZd5XHBDCbaweCL5ctmMR348Mo/LyZvThfTU
         YqpaHRccW3yQD+/7A4ozlCIvUXKN/huh+HlUxR8LY080AVK336cziYB67wwFGX1AIpNV
         LjVei8GIccdSfaVGCbsSpf7y5iFdBuJV3kR55osPNR56zy8mOY8GutUka1+ZajXSQ98t
         Opj6KD0rJq/dbSycAP+/khYEvVAzucqip1vsXFi7vGv/NJIp6feOEsKXL4v6ZWrtE49m
         5pzUtOTtE3D/2o3zOoaRKt2RwpXUGqf3tTJV5woS+OG4/55zY0OmeJZ10vm7CuQ8UhGC
         +1Ww==
X-Gm-Message-State: AOJu0YxCxYWkR7398o0VX/tBTtJIDmvFDLhyztK0KK9YG5PfHsqpcTgW
	mQIKOHT9zOWETeDaGubC2ZSCAgqtJfr+WA==
X-Google-Smtp-Source: AGHT+IEoUuKicP2NzpDtv008yQLqGnv0XPu+2W8mQ0RBqxucHc0VhSw1sb1ZO1Jv7SD4nUSn3Dq8sA==
X-Received: by 2002:ac8:5e0f:0:b0:429:f134:929a with SMTP id h15-20020ac85e0f000000b00429f134929amr2562655qtx.53.1705355417403;
        Mon, 15 Jan 2024 13:50:17 -0800 (PST)
Received: from godzilla (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id u13-20020a05622a010d00b00429ff82eb74sm277982qtw.82.2024.01.15.13.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 13:50:16 -0800 (PST)
Date: Mon, 15 Jan 2024 16:50:00 -0500 (EST)
From: Scott Murray <scott.murray@konsulko.com>
To: randy.macleod@windriver.com
cc: alexandre.belloni@bootlin.com, stephane.desneux@iot.bzh, 
    jsmoeller@linuxfoundation.org, openembedded-core@lists.openembedded.org, 
    anuj.mittal@intel.com, david.zuhn@sonos.com
Subject: Re: [OE-core] [PATCH] rng-tools: move to meta-oe
In-Reply-To: <cfa90344-0753-4ae1-9979-2c0f12a33d50@windriver.com>
Message-ID: <b8554634-5da9-9872-660a-5e94a62c765e@konsulko.com>
References: <20240110202501.1554379-1-Randy.MacLeod@windriver.com> <20240115165859d332c9cb@mail.local> <cfa90344-0753-4ae1-9979-2c0f12a33d50@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 21:50:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193804

On Mon, 15 Jan 2024, Randy MacLeod via lists.openembedded.org wrote:

> On 2024-01-15 11:58 a.m., Alexandre Belloni via lists.openembedded.org wrote:
> > This is breaking meta-agl-core until this gets into meta-oe:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/3849/steps/14/logs/stdio
>
> Thanks Alexandre.
>
>
> Stephane, Jan-Simon,
>
> Is rng-tools actually still a requirement for meta-agl ?
> It was added back in 2018 but the kernel algorithm improved as of 5.6:
> https://lists.openembedded.org/g/openembedded-core/message/178518

The kernel no longer blocking does mean things won't get stuck on boot,
but it seems like any distro with an eye towards security still needs
either rngd or haveged present to feed in entropy on hardware that does
not have a hardware RNG (and potentially even when there is a hardware
RNG to improve the quality of the pool).  We definitely support some
platforms in AGL that do not have a hardware RNG, so we'll have to work
out whether we're going to need to eat making meta-oe a hard requirement
for using meta-agl-core or do something else.

Scott


