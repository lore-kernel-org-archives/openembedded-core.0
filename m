Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD29C2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 09:25:34 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.15446.1719825927233905262
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 02:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SWlglbW7;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ebeefb9a7fso32135891fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 02:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719825925; x=1720430725; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wkNd9NzijlIK6JRorrBPUQb1rHlROZVz0jDw0FroXj0=;
        b=SWlglbW79QsWabrHCjHu+o1H3Xy5Ro+k6JsgmBkLmWtTAuhH6ldJOZDfobhfx5hM6W
         8vKDKsYhxzv2xlHz2rMoQihskZXLZpYHa+sUEy7lEK9IQQEmZvmv2o7TeCOfNFMb/g0N
         g/1qvpNXWHhsHP+/q90gAoeAugrXdeVOAsHM7ZncGLQbO6hWmGd1bTzoXzs67dZLsVF1
         RQKTl2RgX2mY7BO9MSPcaA4YOycAJCe2BVUvC1rjojyrLTYqAChkmbuhxd1JajtvLWbs
         vbj8ULkM26fS2ynSfOORC3gPsxsIqzNhY82GvDTTUXbHSs4YifK8B9WmRdqlMTLCRsF6
         mtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719825925; x=1720430725;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wkNd9NzijlIK6JRorrBPUQb1rHlROZVz0jDw0FroXj0=;
        b=awMza3ZR+TZEDYrKdZYbInhleJf/gE9k+CIQoIHLUxUQkvSgM0VV/uVrunxsZUpU2k
         1T9JshdAALP60j2+EP0SITPgF0rxkp+zlT5wzRwCq0uq0pwYY6ZQZAhG95Vsq4NN4NSK
         sG+bhe1OBXssx1zu7tBt8As00gKYSGsLuodFbg9Co5pGsj0ybLT6i1/yo5XgkbiAJ4k/
         ee1HoFmBgbhs2kv2Jkvj6l4pPGjYx5F6YN+BQ7Ue251pxC0qRVOiBrOh9TI1IOv+grF6
         anGOpaU2AVFM2p6UoQe2Hz1vToDAp4Y3Me2qbRJGTlXO+b2xHDOMx5xAXjKwQlhoX+Rq
         4uyA==
X-Gm-Message-State: AOJu0YxH/wIXOhcZsiWuqF6mVsYwUQCF1w0mxbxWFmPNlhYINFv3WwD3
	/zFLXLBLO/mRWQ+I8cGkxvILrn4AuIbec2X+von+rlyiF1bBL+MnbaLx0R+ZqUfqrVa4IAbb47c
	YC8t0UME4Gq5WUGPuC18R0md7WnUviQ==
X-Google-Smtp-Source: AGHT+IHn8E6EauEeh9NjVwHOVSqDs9iHPIdtffHd+2q4hzc4f+ykZDpyry8BE4sB8Bjf3wZMeQVO79z9Gpvr5XvYtrw=
X-Received: by 2002:a05:651c:507:b0:2ed:2765:2491 with SMTP id
 38308e7fff4ca-2ee5e3c3652mr43529241fa.28.1719825925245; Mon, 01 Jul 2024
 02:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240701055553.2851418-1-primoz.fiser@norik.com>
In-Reply-To: <20240701055553.2851418-1-primoz.fiser@norik.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Jul 2024 11:25:14 +0200
Message-ID: <CANNYZj_VWB_VoCnasfzQScx7xK39gf2653_ksMEtDexZoMQ6Bw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/2] Pulseaudio Y2038 fix
To: primoz.fiser@norik.com
Cc: openembedded-core@lists.openembedded.org, upstream@lists.phytec.de
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 09:25:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201285

Thanks, these look good.

Alex

On Mon, 1 Jul 2024 at 07:56, Primoz Fiser via lists.openembedded.org
<primoz.fiser=norik.com@lists.openembedded.org> wrote:
>
> Hi,
>
> these 2 patches fix pulseaudio issues with Y2038 compatibility. And in
> turn solve run-time issue with "Stack smashing" as described here [1].
>
> Explanation:
>
> Patch #1: Adds PACKAGECONFIG[oss-output] and hence adds configure flag
> "-Doss-output=disabled" by default to pulseaudio. This in turn disables
> OSS (Open Sound System) support that has been enabled by default since.
> However, please note that OSS has long been deprecated in favor or ALSA
> and I think we don't even have support for it in the kernel. Moreover,
> even Debian disabled OSS wrapper support for 32-bit ARM machines [2].
>
> Patch #2: Re-adds GLIBC_64BIT_TIME_FLAGS for pulseaudio removed by the
> poky time64.inc. This has been disabled since pulseaudio didn't build
> with those flags enabled [3]. Now, pulseaudio will be Y2038 compatible.
>
> BR,
> Primoz
>
> [1] https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/3783
> [2] https://salsa.debian.org/pulseaudio-team/pulseaudio/-/commit/5209c2fc46630722f1aaa3c0bbf88a9f843cd27c
> [3] https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/3770
>
> Primoz Fiser (2):
>   pulseaudio: Add PACKAGECONFIG for optional OSS support
>   pulseaudio: Remove from time64.inc exception list
>
>  meta/conf/distro/include/time64.inc               | 5 -----
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 1 +
>  2 files changed, 1 insertion(+), 5 deletions(-)
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201275): https://lists.openembedded.org/g/openembedded-core/message/201275
> Mute This Topic: https://lists.openembedded.org/mt/106973073/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

