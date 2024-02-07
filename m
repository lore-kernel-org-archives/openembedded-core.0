Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1640C4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 13:33:41 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.20344.1707312817367368463
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 05:33:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=slGVYXiq;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-511531f03f6so762126e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 05:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707312815; x=1707917615; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iSRGQBAU3EPM6MRKII7HTb6NP46w3QcbZMsxBIov+r8=;
        b=slGVYXiq1Gs3MJu68rZJah9dfSkVsAtfmDYHSGws5dcbdp2573vMoxWZqm5oj5bPUj
         /Yi2/NvzOLnnX/YYJ5pFUehTHTfCVNVzCo2BXt5DN5wzV8HQnPh82IRQFWrzVxMPLEl7
         +wzsu1/Q/YrbymVlmq1J3ZTc3TxzoYkoxDvYAq8CvBcUJeitWK1axCtSOBtTOJYr+v9W
         jw7JzM4JAoFUdYiBVWNErHbuatgu23MkK9EAzISDJ1PhZSH/2gZpJ80eyfEu8sb7bxM7
         fonui5clFRLqnRwt6k9DZSmm9moB8NjgNVVDevg0VqRzms3A/z+qTnNmpQAY6bMD6mWp
         qnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707312815; x=1707917615;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iSRGQBAU3EPM6MRKII7HTb6NP46w3QcbZMsxBIov+r8=;
        b=Se6T0mXtLk3nLBCyZbfnXW6fvyaO2ixJUNw0LoKTCVEMaNCj8j59OfTwA/3lV79Lyt
         KwNlWz/Rved9TDsWq+FiJyRXnl51ZPFTuC5yLQjJdSf3ZTN8R8i+EcKFY0gagsUuUZ3R
         EVW+r3nPuZqn3uKDkI5nAVzAilWZylS+rDwS52Nme7EsAj9K5DXEHoeHXwxaGPLHLkgD
         N7MRQ4ZcY/CdmUpxA8ht1SseP7817DkPee6n6tEVWdsluhdZgrA1Lz4L9s2Jb/V84QcV
         etQyG2odDWhhggR9McIpRBqbsoRnzJRHYCQBRGKrFHRYTEp8Gk8tjqC1NQWp9p4f3plq
         xw4A==
X-Forwarded-Encrypted: i=1; AJvYcCU50Hxp9RILsNstag2hmg1pCf1hud24xkm1sdqEZCouXyLBZvTTbw1MwvUWKu7wrokb32zz8Tqj2USWzBKKkFw8SjYFrZ0KH27K7tpN4dhNqTpCScBgP1EO
X-Gm-Message-State: AOJu0Yyj2L1c60nNBYki09AsR5dPMRI5IgIJTy2sr4yLHRnQ41EjsWH4
	H7vfioIGXU1/x3j5YdDzSe7UPA7EkTCrmaQtpXX6KXOlRuCFsw59frqcWIUaHO8=
X-Google-Smtp-Source: AGHT+IEJ85gLXT1Wiad3E7Wu12J7BCJl9Th6sZlku23dd31NrE0ltHQ3eoB1A5tWS41bkw4dNfGxlw==
X-Received: by 2002:a05:6512:3d9f:b0:511:4fec:c374 with SMTP id k31-20020a0565123d9f00b005114fecc374mr4598173lfv.66.1707312815275;
        Wed, 07 Feb 2024 05:33:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU5KvGJ4MjZRnON8DyWDllIoX80ujJVaQ4lr2fva75xob2sffNZKr/Ye/jVeVsVyPtIRggoT41lqmZSp0W33kBA5exbrHYN78zQn36WQwxkmhWThhDuIF/6pvP0XAgKpdLbz4fPwV+j5iTdsyjJ
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id cf21-20020a056512281500b005114cada35esm184929lfb.147.2024.02.07.05.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 05:33:34 -0800 (PST)
Date: Wed, 7 Feb 2024 15:33:33 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"oss@ew.tq-group.com" <oss@ew.tq-group.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: install .config to deploy dir
Message-ID: <ZcOGrdeSLp2e_291@nuoska>
References: <20240207102529.128369-1-matthias.schiffer@ew.tq-group.com>
 <CADkTA4NS3=8tUYUz_SMiwfd+E=takHWEVTYi1AjuX41A0p8YOQ@mail.gmail.com>
 <d8b9db15ae3ff57b6a34cc1a0278d208d588a773.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8b9db15ae3ff57b6a34cc1a0278d208d588a773.camel@ew.tq-group.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 13:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195062

Hi,

On Wed, Feb 07, 2024 at 02:14:33PM +0100, Matthias Schiffer wrote:
> On Wed, 2024-02-07 at 12:42 +0000, Bruce Ashfield wrote:
> > On Wed, Feb 7, 2024 at 5:26 AM Matthias Schiffer
> > <matthias.schiffer@ew.tq-group.com> wrote:
> > > 
> > > Deploy the kernel configuration with the built images, so it is easy to
> > > check its contents, or rebuild the same configuration outside of the
> > > Yocto build system.
> > > 
> > 
> > I'm not convinced we need yet more clutter in the deploy directory, but
> > at a minimum, this patch also needs an update to the documentation
> > (apologies if I missed it on the docs list).
> 
> Sorry about the missing docs, I'll provide a patch for that as well.
> 
> > 
> > One could argue that the config could be pulled out of the other
> > packages and artifacts, and that it wouldn't be recommended to
> > use that config for rebuilding outside of yocto, as we aren't providing
> > the matching sources in the deploy directory.
> 
> There are at least some cases where the config can't be pulled out of anything else - without
> CONFIG_IKCONFIG, the config is not embedded in the built kernel images. In constrained environments,
> it may be desirable to disable such options to reduce the kernel size.
> 
> As a data point from other distros, Debian/Ubuntu disable CONFIG_IKCONFIG and instead provide the
> config next to the kernel images in /boot.

Check the kernel-dev package. The config is there.

> > 
> > I would also be nice in the commit log to indicate how cleanup of the
> > deploydir has been tested to show that we won't end up with config*
> > files and links in the directory after their associated images have been
> > removed. (I haven't looked at the deploy classes in quite some time,
> > so I'm unsure if anything in particular needs to be done).
> 
> My understanding is that unclean deploy dir issues are pretty much a thing of the past, as
> deploy.bbclass sets `do_deploy[cleandirs] = "${DEPLOYDIR}"` (so do_deploy always starts with
> a pristine destination directory), and the sstate tracking takes care of the rest. 

I agree that deploy directories have way too many things already. And recipes often get it wrong trying
to pass files through it from providers to users without setting task dependendencies and sstate caching
correctly.

Cheers,

-Mikko

