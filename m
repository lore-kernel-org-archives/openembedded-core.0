Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B2DC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 16:45:54 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web09.221.1667925953050989884
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 08:45:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jva5T2cQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id j4so22096520lfk.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 08:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a68DOkSPSDQ3h7dxgzqBwILiSF1s23zO9ldm+iey3fM=;
        b=jva5T2cQ97O0Pb+k+F5Pghao9VbmyLvyPrE04KXCRzJgYiC51YG21xoVGS1bZCO9tN
         +s14kAhzdN1+Goj/cAqrV0vwoZOM5NAAnxNi3C8Md6ZieQquP+Q02wXbA1hptSyf83Ju
         dlcFRRwWHRnJxfnJeFXBrHdGfZL1R/RmE379TdN31fUG1v7dz27s3OgkO/SOk+OXyo5m
         VXARI8qB572KYSGJFRpuwIfgRjCaS91eHh7BMEuRQkBbYJTxVzrV53SCrQ+W4S4U0i3V
         SAYhN41mwIDUR5n9Ke083BNInH+GMn/hRXkWTBwxLRekdwBd92ojaNwNKEFxXyVnBl31
         dYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a68DOkSPSDQ3h7dxgzqBwILiSF1s23zO9ldm+iey3fM=;
        b=gdz6O4x+Y9j2lK5PskNZGKxTMvDdS7z+D2K3DnWHF/cZstb42qu8HmSYDMNbg7lUTJ
         PZsQuhhGyeYVnJZUd2tl9c8JXnU3wfD0mppktHkhgBoHAkpKD3XMqk0XZzk3I8+XwrLc
         BwCv3fidovy2wF5qnqpfhuK7la1mw6A2xD/FaJt5rDAj/0QSboeS3GYIOCIYisrX9uzE
         uEtYs6SCMCu2hnwgBFAGxOZgerjZh5Ea0F2KTgr7BrGe/2bKpMJDa5Zuf5phLURROEEG
         0sPxxTA+lSVHE15Zq4bDaGzkvT9/SFYVl0vsp54Ri2JO0Sz41VEWsVtY9xCMGSNUOnwI
         wLZg==
X-Gm-Message-State: ACrzQf0A46GVOD6D08sDoVVuhik06FugGrZvmL2xI7ZoVnCOo8c60GDW
	Cq3hQkC2eMYfFbJso1qcbceQEvycgLP2ZnD6Zug=
X-Google-Smtp-Source: AMsMyM6FGNb1dci/xXooJAx+XhxdfkyqQjNKMRsPV7M3P8ZCoD411X7CMT6OpZ1xDZgbuUSzM3/GaY9E08/NX4DXka4=
X-Received: by 2002:a05:6512:2399:b0:4a2:94d6:da27 with SMTP id
 c25-20020a056512239900b004a294d6da27mr20125623lfv.131.1667925951283; Tue, 08
 Nov 2022 08:45:51 -0800 (PST)
MIME-Version: 1.0
References: <20221108000828.42824-1-niko.mauno@vaisala.com>
 <20221108000828.42824-2-niko.mauno@vaisala.com> <CANNYZj9f2nfRbwU1MXn2a7ruKHhkw318F92Lqp9xYd8acvubwQ@mail.gmail.com>
 <CAMKF1spOGt6eJuRVn+3rs0wOrx-uSHvf-jgox39DP6NY_vQjGw@mail.gmail.com>
In-Reply-To: <CAMKF1spOGt6eJuRVn+3rs0wOrx-uSHvf-jgox39DP6NY_vQjGw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Nov 2022 17:45:39 +0100
Message-ID: <CANNYZj8cEe6RCu97rsTGPrCcoQGQp5Hdug=KzALyUQUKdnZHkQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 2/3] kbd: Disable 64 bit time with 32 bit glibc
To: Khem Raj <raj.khem@gmail.com>
Cc: niko.mauno@vaisala.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 16:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172980

On Tue, 8 Nov 2022 at 17:40, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Nov 8, 2022 at 1:14 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > We do build for 32 bit arm targets, so is this seen only in specific
> > circumstances? What are they?
>
> Its when 64bit time_t is used with glibc on 32bit architectures. So
> far we do not do that explicitly, with musl time_t is always 64bit

But why do we even need to worry about this, and not just let glibc
sort it out and make the right default choices?

I also haven't yet seen the official guideline from upstream, just 'I
think this flag is the correct one to use' kind of reasoning.

Alex

