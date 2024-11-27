Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9CDD6D241
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 21:37:13 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.82659.1732743427250167196
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 13:37:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UwLibs+f;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: hiagofranco@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7fc22a88bcbso85971a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 13:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732743426; x=1733348226; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6zak13zXgPEs7K02prwnJ5o1p6zhppC0gh5jISqkfYQ=;
        b=UwLibs+fGSJHNgx6gp3YozpNpxO7yAVpIbFuuFgCN93kWss5GYoONj4tSSsbFUkE1J
         6GHK7QYoFvnRtZiFOBms3dGwKmblGSmFFPYzWwKhD9n5Dal4nDI6zg6FiZjVK5fkBmKJ
         qzlEBW43SqpA/pFScRh380uSnATTEmc7ox4S0aMKVPvkySgypDACWnU5yovqAGjJrnUX
         rqq4YSIvU+fCQYSqDh6CHdDCfYakeN9/Cix7oaEk6o4BwP0AUlUOWEn3UQeDqAHZ5JZo
         qSV9orxSumRKoRpe0tQ9E0P8NtQxUXMYue9pX1HLvxoFaKDj7LDO4Sfx7nEpNSW23SDL
         I35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732743426; x=1733348226;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6zak13zXgPEs7K02prwnJ5o1p6zhppC0gh5jISqkfYQ=;
        b=H4/tpVAnM1SQsndxQKyzgHcZMLfx0WJRmOtQxl+ZpY6O8K8fUDwH55/cn0ncCg3QUR
         JQOBPVPUMqj3SvmORjXRkYvZFcsoUvLkbWDfIymdNv8XqNQoCK/VGq3VguoV893hSpmX
         huYtGPVh9VLJlcsAflL5ygRxo0ZToTQ0JFxW+D6ICcnCLbEsmYdQHM78NnPuFE2uHPo8
         +8iLkhbWTBgtXPm7VlFF52R33XTRvMfQ/7nFAnD1spjA5TXxy2bdTbyql1M1ruVkF5cP
         fwYdkerIsnVL/mXHZzWLZ111hNYqOoyiiUul9otq62ADw2Xl3Me2vvrfFkL59mUqxYjJ
         Et0A==
X-Forwarded-Encrypted: i=1; AJvYcCXVDZ8JUFbElHS2R1dHtQ94ctHJeG8Gc4Gee0e5mFsQOJS2966IKmjtB/GZ9hmJF+GBIplYKJ24PhjbFqScxiTO0A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yypm5JUclAkbe63E2SNucH7IFZFu1VAzNi5yRwmy0IH75+2zxAA
	RryG7aqcFcXEkAyTqv4mPvzWMTL1AIucSTf3/DZJQDJ+0MoNZmDm
X-Gm-Gg: ASbGncst6ETjbP4baZAhqzBiY2aqmBNFbJBf8l0jPK3hEGGQojDrFUt26qFwYYzJ7sZ
	N1a0XImsttOLsgMk753DurXrH7ClWPELk+FdW3owTHby9AkTzie0jt35hx/Azc6My1t9np5NIh/
	eX7yGu34NOBMrKn8aqGiO843/LuFCC7AGGZGteWZwivTVqM8lLdUGRrx117ZxrG30ehTgt+TWRn
	doKnMgaAfbzRBA/v1EyHg8bkxakRFGi0Vl5JTYbg3mvnmXj
X-Google-Smtp-Source: AGHT+IHITi02QSdJYI8xcmw3g3fv2VjmuLqMixd0RlsC2nl4zCKebYRjwBOIjLXumOYcfCJAS4bGYw==
X-Received: by 2002:a05:6a21:788a:b0:1db:e358:48a8 with SMTP id adf61e73a8af0-1e0e0ac69a0mr6998801637.10.1732743426394;
        Wed, 27 Nov 2024 13:37:06 -0800 (PST)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725417fbaf9sm23685b3a.104.2024.11.27.13.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 13:37:05 -0800 (PST)
Date: Wed, 27 Nov 2024 18:37:02 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Ross Burton <Ross.Burton@arm.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [PATCH v3 1/3] hwdata: add recipe from
 meta-openembedded
Message-ID: <20241127213702.enfxvjc66ckqjhmv@hiago-nb>
References: <20241126000836.6901-1-hiagofranco@gmail.com>
 <20241126000836.6901-2-hiagofranco@gmail.com>
 <CAMKF1spfQeh1i07Wwg5ndJ7uJpQ=Pz1eeCWc1J1KBLUfY78=9A@mail.gmail.com>
 <20241126121716.eqskoqfleyrn4fgu@hiago-nb>
 <CANNYZj_-a3mU3z3jqxCqharjZ2pdPubPQi5jH2wko+jejLWu2Q@mail.gmail.com>
 <20241127191310.34ytvodxrpkf77bu@hiago-nb>
 <20241127195040.GA20070@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241127195040.GA20070@denix.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 21:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207967

On Wed, Nov 27, 2024 at 02:50:40PM -0500, Denys Dmytriyenko wrote:
> On Wed, Nov 27, 2024 at 04:13:10PM -0300, Hiago De Franco wrote:
> > On Tue, Nov 26, 2024 at 01:21:09PM +0100, Alexander Kanavin wrote:
> > > On Tue, 26 Nov 2024 at 13:17, Hiago De Franco via
> > > lists.openembedded.org <hiagofranco=gmail.com@lists.openembedded.org>
> > > wrote:
> > > >
> > > > On Mon, Nov 25, 2024 at 04:51:37PM -0800, Khem Raj wrote:
> > > > > Don’t forget to send a patch to remove it from meta-oe once it get merged
> > > > > into core layer here
> > > >
> > > > Sure, thanks. I will do it once this is merged.
> > > 
> > > You don't need to wait for that. Khem will take care of not applying
> > > it too soon.
> > > 
> > > Alex
> > 
> > Hi Alex, I just saw that Richard merged the patches.
> > The patch to remove hw-data from meta-oe is here:
> > https://lore.kernel.org/all/20241127190841.137119-1-hiagofranco@gmail.com/
> 
> Hi Hiago,
> 
> Just wanted to thank you for listening to and addressing all the review 
> comments while working through the multiple revisions of your submission.

Hi Denys, it is my pleasure, thanks for the help!

> 
> Regards,
> Denys

Cheers,
Hiago

