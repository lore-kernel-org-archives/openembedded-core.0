Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175E6CA0ECA
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 11:37:57 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.22635.1694518669439295674
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 04:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=kWzcFC6f;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50079d148aeso9380638e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 04:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694518667; x=1695123467; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ygq6UHgioKgnBZgU14yiPlY045mGuzGaMpK5Ez2SiTg=;
        b=kWzcFC6feA8k4XRDsc1Ag5gecl/482kReMpXItlxH/RZRBrPfD4X6+VP7bOr9lHLlE
         wVjiVCiYI6XZdgy+UL4SAIA7w3iGSEHChH39zc8B00dLJSrnkG6xdDkkyh83U1o7o/j5
         13VTN5St4sassgzPKJbxBxyck3oFwODJftDXi7COc4QaFpyDn5rl2mohxfafpmrzLX+4
         QJQsPuVBox/lOc6n/O6rFeAORyXUW+aETXim3ZkxNUWgXa1qPndfGSXHvXQtDJaTW1oC
         LtQ/JpWny28u09HMm6Uz1Jbw95s4SNpNPrOJ7gdDDuXo8hLT2BALPRggnQqTDImE143M
         Fqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694518667; x=1695123467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ygq6UHgioKgnBZgU14yiPlY045mGuzGaMpK5Ez2SiTg=;
        b=gozmXPsuxccFfzrJtU5hnZoUepJgU8kU3KhxnPvaHhIXzurw/w9Oodhu2ZSwh37oAT
         bj0XRgg/A8TWQH9koLwo677niDXremGrvoHipVurJA8nUhAbmeHPtrL89KnYZr/O8dkO
         BikodduFlvaVpA5BfSrC2dumTGRp0cJws45/M9MqqnXeUSHlyMiA9A1ou/vEMjNlSxKM
         HxoHLETJpFo2FfD40uWVG330MMrasD02MiA3ts9KV28LHw+5DeC9Eqev7/3xKEMb5yjN
         KuAPgc+TR6Egoi1pvdsH8XOStKc79UOgleXhVAzVs8AjlWS1wUT43sH1iYvslZlqyH3W
         to1w==
X-Gm-Message-State: AOJu0Yx98Xb3u4xuYDkx71fQd91t8AzYdZTVn+t+9vFm7uQ8IGMLq+B/
	+CiWSpmTJY1Lj/MGEQPysngjGQy3USf3Mt5dHkQ=
X-Google-Smtp-Source: AGHT+IGWLn389PxyWMOn1H6EGTXOn//zJINj/dUQktih4cbqzhQxrSuAFAnX+dJKfFf3qoDYP1rZMg==
X-Received: by 2002:a19:2d19:0:b0:4f8:75cf:fdd7 with SMTP id k25-20020a192d19000000b004f875cffdd7mr8229562lfj.22.1694518667570;
        Tue, 12 Sep 2023 04:37:47 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id y6-20020ac255a6000000b00500a2091e30sm1719507lfg.115.2023.09.12.04.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 04:37:46 -0700 (PDT)
Date: Tue, 12 Sep 2023 14:37:45 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 2/9] testimage.bbclass: detect slirp from
 TEST_RUNQEMUPARAMS
Message-ID: <ZQBNifGLlkZlXEpD@nuoska>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <20230823061025.3952909-2-mikko.rapeli@linaro.org>
 <3E62B71C-8B13-47B3-BE0C-A8A1716680A3@arm.com>
 <ZQBLrRsfpfu2e9JN@nuoska>
 <F05370CC-7C6C-4B91-AD4D-C2AA28BEA258@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F05370CC-7C6C-4B91-AD4D-C2AA28BEA258@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 11:37:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187508

On Tue, Sep 12, 2023 at 11:30:57AM +0000, Ross Burton wrote:
> On 12 Sep 2023, at 12:29, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > 
> > Hi,
> > 
> > On Tue, Sep 12, 2023 at 11:25:28AM +0000, Ross Burton wrote:
> >> On 23 Aug 2023, at 07:10, Mikko Rapeli via lists.openembedded.org <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> >>> -    if d.getVar("QEMU_USE_SLIRP"):
> >>> +    if d.getVar("QEMU_USE_SLIRP") or bb.utils.contains('TEST_RUNQEMUPARAMS', 'slirp', True, False, d):
> >>>        slirp = True
> >> 
> >> This means we can remove the QEMU_USE_SLIRP variable too, right?
> > 
> > Yes. TEST_RUNQEMUPARAMS += "slirp" would be enough to run slirp with testimage.bbclass.
> 
> Can you send a followup to do that shortly?

Yes, I can do that.

In my developer builds I have following changes from this patch series:

oeqa selftest runtime_test.py: append to TEST_RUNQEMUPARAMS
oeqa dnf_runtime.py: fix HTTP server IP address and port
testimage.bbclass: detect slirp from TEST_RUNQEMUPARAMS

Rest are already applied or rejected.

Cheers,

-Mikko

