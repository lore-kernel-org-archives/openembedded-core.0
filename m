Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDDFE7108F
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 15:36:34 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.21331.1695310586807677974
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 08:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hRnhADU8;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5042f391153so854129e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 08:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695310585; x=1695915385; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UE2tAGgZQk5OfAi5B4QB8mNUkKbDTRLzpbeXkE8MPFk=;
        b=hRnhADU8Giezmwbo64ZrJOiVQRQc0NLR8YLaHFiE81xwhipzqUL6HZq4kx3S56TvBd
         B6lB9eCDYhWDtyecq1CBA3F83lv+LHeHkSq5AuZKDJ7tN5urlswT4gStlOg7cXY21YwA
         1lVe/5pywcSKAJzEDutJLGf8spAkEf3f1QX5Im2+mXNyFLAJNYqktIpeCszjh7NxEqL+
         K/jBYDsbbrL6qEdSm2rl3qEyPVB0jDrHxiy2pOFIlRxT6pjPGLopRU3ZZYl3WbhsNWr4
         fVPDrfKqFYufgos1k5+zdLCyZldHufoO9/KxjB5kQCEAzNZ4i1uOLrlPSuiIPqBHkVn/
         95fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695310585; x=1695915385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UE2tAGgZQk5OfAi5B4QB8mNUkKbDTRLzpbeXkE8MPFk=;
        b=khI2ulxsADtsXrxWT/UC9K2nH9xSNEEBStIJmumW63p1Tzij5Pu1d1ik1u6v2lLeFZ
         yHOTQvLWgoW3CMH8yoeSJRkKDYiC/2y51QkpBB7X3EowpOpLZpTzM+Wv41jJi5XowVZT
         zzb8sUvaXowfUjlDeaVyck1nWO87a1/+koOI7nJO1Eqj+3XV7qI14ElifxoVfb4GhqQo
         /joYo925sQ0uwyzElTaBaBvgisVdz8mjs6LKmtosH9zbZRo5VAbvs8hNx+FeCcveBNy8
         l3BJ/RMc6FRQbmeqeZx3elkbAutuzhMwRP68DGj+z0O0dRj7bsXDtOiR6jr24rgYvNBw
         hPuQ==
X-Gm-Message-State: AOJu0YxBzUravAh64hRmHS7dFK1q4qBblPQgGRK5/s+BClL9+C3rIh5K
	2OisA4qlrdAdX0AMbMA4u+VThjhUrpMkxBlZtY8=
X-Google-Smtp-Source: AGHT+IHfg9ViR/MEqd1Gyb7HBMj2rdEhCKn5xtb4eD/yaYNawkCBTgKR/KdfRHDp92m9xsn31t+p0/lxmuxcy9V1jlc=
X-Received: by 2002:a05:6512:31d3:b0:4fd:daa0:aed8 with SMTP id
 j19-20020a05651231d300b004fddaa0aed8mr3385806lfe.4.1695310584722; Thu, 21 Sep
 2023 08:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230921064727.1260198-1-kai.kang@windriver.com>
 <CANNYZj8wjdTa=thJu9sKzjnvmofbYx7xCHTOz-azeccq=0PFfQ@mail.gmail.com>
 <f43296e9-d416-8697-198b-fd24a491f0f9@windriver.com> <VGUB1S.EQNLFG4U297D@t-online.de>
 <CANNYZj-Hv9fRO4rVW4h_R3DdHiNPYQUeQuRcvVdKaBMoYrVqmg@mail.gmail.com>
 <3SXB1S.VJD0PU0SDSPS1@t-online.de> <CANNYZj_zWqLUdoO7PNWJU139y4T6icZeaFOfxUFVK1D-PzihBQ@mail.gmail.com>
 <V3DC1S.GMOO9XQMVAE72@t-online.de>
In-Reply-To: <V3DC1S.GMOO9XQMVAE72@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Sep 2023 17:36:13 +0200
Message-ID: <CANNYZj-JBgC0NQGcjhV_h-EETBp0i59AhvpGVc8fHyxvU3bbxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] adwaita-icon-theme: 43 -> 45.0
To: Markus Volk <f_l_k@t-online.de>
Cc: Kai Kang <kai.kang@eng.windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 15:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188017

On Thu, 21 Sept 2023 at 17:17, Markus Volk <f_l_k@t-online.de> wrote:
> And I tracked the issue down to this in allarch.bbclass
> https://git.yoctoproject.org/poky/tree/meta/classes-recipe/allarch.bbclass#n11
>
> Running addhandler allarch_package_arch_handler causes the diverge

How did you trace it? That doesn't make sense given what the test
does, and the task where diverge begins.

Alex

