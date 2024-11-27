Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68922D6D22D
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 19:13:22 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.79621.1732734795302539780
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 11:13:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zg82B7ID;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2127d4140bbso291095ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 11:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732734795; x=1733339595; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hERzFE4B5KAHalCvehW0gxjC1WjLtk3TPdKgTWHXUaA=;
        b=Zg82B7IDLtHUNFxg575joIe1QbmKLIK2OPfMDhT9DkVmoxCKzO0Vbat7xyyNf7hNtZ
         IFfiGlAswlRB3200nLHiKWnSHMVQ9kGASMjFC0dCDF+7x9mqUqqMC1qxVrnMjZ0akmQO
         D/9K8x2FwaZw1eyXfvXt+rvTOotzRNljQx9Om43aSm2myiVzyUy7eXiXUlqyiTNzht2+
         W/uQgdtLJz2JTprCO5Ro0ch8fN8ErX+YrrhcJf+sbk9DSqkvWAFrvzfaY5ei1HF/m9QK
         ZVMqJLTgkYd61jla6yAiS3zhBH7V129wJtH0RxgKJS74ddGon4dIlk4L575SlqeHKn2J
         OMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732734795; x=1733339595;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hERzFE4B5KAHalCvehW0gxjC1WjLtk3TPdKgTWHXUaA=;
        b=bY3a1cizv3SqV/VvFiFqo+SDZf9nzYk+9KH5in6HElNySvCljUQFWG9mvxIDn4R+fd
         Ut+VbF1P78j59pLiD+Sm3ZGIef2JpMjSOKc5UV1POnnEz2KDsFDmuz5k3ko4ISLz1EzH
         KiIFiQLSra8dPOpOehMynZu5fQOQMqzjCaocPKoyJyHJQwxGJtxpFEg83FFmitJ73XeF
         ZwF9nzztQv1eCYF3FL+HJB9pIDBqPhSlsOX9go7AHfB8IUhVRWpAajdKuZusn9mX6PUL
         WCEiKEguajK4xPXPV1pg3stI/+DbyBCCnrk6J8TM/LJvP2gmXUWBVAI2nM3kBHao4nZ9
         8RdA==
X-Forwarded-Encrypted: i=1; AJvYcCUrbBEOsXW+m33c3AOHHMVGpj1RGFxtQiVI6je7JoihIYQDVnMfy5jeT1yP5pn8STtWkjaIG5mXxn1kzZjpQE4XOQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YylZi8s5jsD+tR4KCqpaQHpjQUe5NzUra0sCU37obReOrlEHe8x
	rMPF8kzspef4W/dhC/b+UuBolkKMFeumPDKzsOwhCaRFU/dup0jeqh6UHIfi
X-Gm-Gg: ASbGnctggo/hAVkEeGuyUoWFXtI99/IXDR5osWWTVNScl9MWbyC6Uc0Anw/n9dpE9GE
	0cE9qet5V139fZi1JV1U7S84DdyO4UYxWEA1p3+kjjxpGKzKhuLlHGw13lAfTdmu5/ssBdH7bsH
	lg9GlXIZ87mykZL4Jau+yPDAgB5DzO+qH4LaKLXkHhlISnZicXVRm6E1nDKZ7kw8ttsWs4yEAA/
	DFwpHChMoQPZGYw0rc4lkl19yOpZEeP2QDEeFmjDx/3d0sR
X-Google-Smtp-Source: AGHT+IEKHAsd1VrPuGzYBQlhAobvVZR1R/AOCFCfpTReX7KSU8pXpy/9YrHCFdaH86ZvAImbVeAwkg==
X-Received: by 2002:a17:903:2447:b0:212:45b8:4667 with SMTP id d9443c01a7336-21501c5ff37mr46013515ad.39.1732734794603;
        Wed, 27 Nov 2024 11:13:14 -0800 (PST)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129db8d578sm106184395ad.31.2024.11.27.11.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 11:13:14 -0800 (PST)
Date: Wed, 27 Nov 2024 16:13:10 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org,
	Denys Dmytriyenko <denis@denix.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [PATCH v3 1/3] hwdata: add recipe from
 meta-openembedded
Message-ID: <20241127191310.34ytvodxrpkf77bu@hiago-nb>
References: <20241126000836.6901-1-hiagofranco@gmail.com>
 <20241126000836.6901-2-hiagofranco@gmail.com>
 <CAMKF1spfQeh1i07Wwg5ndJ7uJpQ=Pz1eeCWc1J1KBLUfY78=9A@mail.gmail.com>
 <20241126121716.eqskoqfleyrn4fgu@hiago-nb>
 <CANNYZj_-a3mU3z3jqxCqharjZ2pdPubPQi5jH2wko+jejLWu2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANNYZj_-a3mU3z3jqxCqharjZ2pdPubPQi5jH2wko+jejLWu2Q@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 19:13:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207957

On Tue, Nov 26, 2024 at 01:21:09PM +0100, Alexander Kanavin wrote:
> On Tue, 26 Nov 2024 at 13:17, Hiago De Franco via
> lists.openembedded.org <hiagofranco=gmail.com@lists.openembedded.org>
> wrote:
> >
> > On Mon, Nov 25, 2024 at 04:51:37PM -0800, Khem Raj wrote:
> > > Don’t forget to send a patch to remove it from meta-oe once it get merged
> > > into core layer here
> >
> > Sure, thanks. I will do it once this is merged.
> 
> You don't need to wait for that. Khem will take care of not applying
> it too soon.
> 
> Alex

Hi Alex, I just saw that Richard merged the patches.
The patch to remove hw-data from meta-oe is here:
https://lore.kernel.org/all/20241127190841.137119-1-hiagofranco@gmail.com/

Thanks!

Hiago.

