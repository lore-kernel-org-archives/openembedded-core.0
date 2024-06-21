Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038D3C27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 07:47:18 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.67737.1718956033522162985
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 00:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FCN2rpCq;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52caebc6137so1710898e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 00:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718956032; x=1719560832; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHNstuRT5XpYDR1gAny6cH+4SeNszowhWCNrquzR9yg=;
        b=FCN2rpCqFyVkW3AavocH+yFVWtw5zVHTXa+HniWsfaL1I45jve6nT4qJNut8h9phj7
         qJJPUlnwz6/UCent2cB3Zx/DyxTNghgSZKr3AhXZdVxDNdCRE2q1VSCoLvWdKI0MUtGA
         lAUMdLK3AwwC8k8laS6RepqjyKeWEVCFQFfu7RFDhj4H8ao1Vcmv1U0STVzZk3NRkXIl
         OBavxwPGkITG9k01hSLHH6isdo29XIHLhE5RzehJ0AvoNm4O2r/A1ePhkkthLLywZL+d
         2wUo4wMMPTb1rOcHxF5vmVBR9QozR26F0ZzWhP6djZZXZ8pJriamsCnF9smT+K/grhUu
         bn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718956032; x=1719560832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHNstuRT5XpYDR1gAny6cH+4SeNszowhWCNrquzR9yg=;
        b=MH2tTw7RvL9fNztIrLvzyu/YqPpjnCVEWijCr/zj4tzs0aO42gvYSZ/OT/MTVY7bSi
         d24xYpRkE3BhF0sRm+IV4MuLvngHg05chu1hZgvjCmS2c+umklgmDCswkymQjpLCJbAL
         TfuL+RSbmBRLclh9w9WMtkD36ryA8PnIF5/jzSdu1cDKRsj2oiN+atOaVFkfKgSkaHtF
         SQKBkDz+cN7R24O3MdVKCGv7U2rLC/iKlinvuBAMCH9x/zU/Ph1NMMa8tQ4/HtLIQmVn
         wBH3ELIrJY5mRAyafHjF2MV4zWP6rL7j1yZn5Jzih/L8J7bABTdTbc7YMnwo8KIRNpux
         7KvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV03hfbDprzyzALjyda88M40eszatJCHPmU6zC+vVYsfFye1VPSPivHLVz6RXjCMDCV1GaJn5pp5J8AIZjCFUZj08byj2y4hsUCr8niNmloCjRUxiadIokD
X-Gm-Message-State: AOJu0YyfNb/bO/O/YvhkbwtXcRUbaC50MhcVpNvdYZjbCYPs9ADTxRsC
	1ANFAx6y+BC6chMCyfeITFVTVIqYFHcmBewzMmxcyz0swELSNy3SdOaQHRIy3mdvSmGItYqc1ux
	wFBHhOYbW8/BXgayCzWv4UO0InQc=
X-Google-Smtp-Source: AGHT+IGmL1JM2hKtZwuFi9HA5al8g8eK+gA1SEAzoXYnfuowu+twUDBMTPNKFjYCMMpaQhWBg4b5nKsgP1qZnlpEWFE=
X-Received: by 2002:a19:9150:0:b0:52b:af74:4c0f with SMTP id
 2adb3069b0e04-52ccaa62317mr4259623e87.37.1718956031397; Fri, 21 Jun 2024
 00:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <6942.1718882361902473385@lists.openembedded.org>
 <2056.1718883024436895882@lists.openembedded.org> <19A83C04-D1E7-429C-B7C2-73C404077326@arm.com>
In-Reply-To: <19A83C04-D1E7-429C-B7C2-73C404077326@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Jun 2024 09:47:06 +0200
Message-ID: <CANNYZj-EGg9+gAJroitaLvm0hxKco7FjvsPnVvwAb2DXnnmF4Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-setuptools: drop python3-2to3 from RDEPENDS
To: ross.burton@arm.com
Cc: "gudnimar@noxmedical.com" <gudnimar@noxmedical.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 07:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200999

On Thu, 20 Jun 2024 at 14:47, Ross Burton via lists.openembedded.org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
> > On 20 Jun 2024, at 12:30, Gu=C3=B0ni M=C3=A1r Gilbert via lists.openemb=
edded.org <gudnimar=3Dnoxmedical.com@lists.openembedded.org> wrote:
> >
> > To add to this topic, I found https://gitlab.gnome.org/GNOME/gobject-in=
trospection/-/issues/395
> >
> > I wonder if setuptools is a build-time dependency only.
>
> Yes, quite possibly.

I think the real issue is that we place *.typelib data,
libgirepository library and g-i tools into the same target package.
The tools are what requires setuptools, but almost everyone would not
need them on the target. No idea why this wasn't raised or noticed
until now.

I guess the tools could be split into ${PN}-tools?

Alex

