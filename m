Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071B5C71133
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 07:26:14 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.8537.1692948372303736836
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 00:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Kk+oAIYm;
 spf=pass (domain: linaro.org, ip: 209.85.208.175, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b9338e4695so8592751fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 00:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692948370; x=1693553170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nGrdfrdT44qd2DB71U6FxnL9ZFAHNcFSS3nH39SEwyU=;
        b=Kk+oAIYmB0LUpRHN0d24+VzJG2hCj5/Hlz+x8Cv26Y0GBv/6ITUVsoEeklDHd8w9/j
         /88526X1q9XJv6wW2ou+urFbPzc5ukCI40fOQTXxLz7XDKZB2nqkIlcN4uhyYKJqF2sL
         nGw5zitQsBUBl80kzH/QqxF2ER/vjijq5zprV+31BcxBo3Pp6FPpMjmq6dhqYETgygu4
         6vNpWm5HXr8fLo1eAt2WSNIJIEKvUXW6msIul42Yu+/FnUsgIb+c0Qf7ehCbaqP6LSLQ
         CSOZiu5r1DcQdr4CAEHkfh2Ftr0PSgEXUwDMSQtVWj0Bt4gySN5SGF7PfIG40nb33Tw/
         +WIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692948370; x=1693553170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGrdfrdT44qd2DB71U6FxnL9ZFAHNcFSS3nH39SEwyU=;
        b=TocEoE0z+S/Kl/ogdcAbkRSaT/e+Q+LEnWbA9SCnFJOiG+hD7mHVshtVATCJeMlj8p
         DrLEJBfatAwtpOeMsBEpToH5WCWC1d+eb0FLGZSsEAWCvqI6+tmIohXuSAEYLJYrhjaA
         BtkQmnrpbrwawuCwz0fA4C2LkBGJg1jM+jc6PdSFCmOKmBNwV8qGH0DcihDUmiIHbCdL
         itPyK/L93bSbZeRtWAWlbmJN3magsaEBi98dlUr/84rUvGdAMaMXlvzt8xXPUg5umKaK
         EeqT4NeeMOBYQxEUpfUFNraoCfxPtvoFaiOlx/sZqRj+PoXDN43A4mV/sXkww5yCz88C
         YC5Q==
X-Gm-Message-State: AOJu0YyzxncLNNO/VJmKFz/PMoOOTZsj2ZJfllz43dtfXcPMLfzcPbSy
	qll2mixKIUGSapk3asxSePtM7g==
X-Google-Smtp-Source: AGHT+IFF9mPQLu9v5Z2TQoR+n+XwsS0RZTk9OyAxKPmT/Tctca1JnQ/e4QEdMZGy3isUU8aWlhnaVA==
X-Received: by 2002:a2e:b713:0:b0:2bc:b0ae:a9e5 with SMTP id j19-20020a2eb713000000b002bcb0aea9e5mr14612616ljo.42.1692948370190;
        Fri, 25 Aug 2023 00:26:10 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id v11-20020a2e990b000000b002b97fe43238sm213731lji.19.2023.08.25.00.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 00:26:09 -0700 (PDT)
Date: Fri, 25 Aug 2023 10:26:07 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] Dilemma on changes - merge or not to merge (e.g. 6.4)
Message-ID: <ZOhXj8JN5guGKN/1@nuoska>
References: <ZOSoIXLG7vH/GC1l@nuoska>
 <177DB4530EBE3FA3.24073@lists.openembedded.org>
 <177DBC07E94591CC.4797@lists.openembedded.org>
 <177DD0B30D8FEDF8.27837@lists.openembedded.org>
 <177DD39B5534099F.27837@lists.openembedded.org>
 <177E1FB73F514F09.8058@lists.openembedded.org>
 <177E56C1DFAB4DFC.13053@lists.openembedded.org>
 <ae98c59b507b7e5342f832e7b3e8814ac793592c.camel@linuxfoundation.org>
 <ZOhJuUWYSU8MmaCK@nuoska>
 <36fbac7375b4ecdb2abd552d18606e9e6b62aa28.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36fbac7375b4ecdb2abd552d18606e9e6b62aa28.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 07:26:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186694

Hi,

On Fri, Aug 25, 2023 at 07:34:25AM +0100, Richard Purdie wrote:
> On Fri, 2023-08-25 at 09:27 +0300, Mikko Rapeli wrote:
> > Hi,
> > 
> > On Thu, Aug 24, 2023 at 09:18:03PM +0100, Richard Purdie wrote:
> > > On Thu, 2023-08-24 at 15:04 +0100, Richard Purdie via
> > > lists.openembedded.org wrote:
> > > > On Wed, 2023-08-23 at 22:16 +0100, Richard Purdie via
> > > > lists.openembedded.org wrote:
> > > > > On Tue, 2023-08-22 at 23:01 +0100, Richard Purdie via
> > > > > lists.openembedded.org wrote:
> > > > > > so the commands are stopping mid flow for unknown reasons or the ssh
> > > > > > connection fails. I can't tell if this coincides with an rcu stall or
> > > > > > not. Both logs do have rcu stalls in.
> > > > > > 
> > > > > > After these failures the system does continue to otherwise work
> > > > > > normally and subsequent tests pass.
> > > > > > 
> > > > > > I wonder if the slow emulation might be causing the networking to
> > > > > > glitch and break the ssh connection.
> > > > > > 
> > > > > > I'm at a bit of a loss on where from here. 
> > > > > 
> > > > > I thought I'd update the thread with new information.
> > > > > 
> > > > > I went back to the start with this and looked again and what is going
> > > > > on. Interestingly, I found one of the autobuilder workers would
> > > > > consistently fail the qemuppc-alt configuration for core-image-sato-
> > > > > sdk. I paused the worker and experimented.
> > > > > 
> > > > > I saw two different failures (included below). One shows systemd-udevd
> > > > > timing out on it's watchdog after 3 minutes and resetting, including
> > > > > taking out an ssh session running the cpio configure command. There was
> > > > > no RCU stall reported.
> > > > > 
> > > > > The second failure shows systemd-logind as well as systemd-udevd with
> > > > > the 3 minute time out, the kernel complaining about missed IRQs, an RCU
> > > > > stall and lots of breakage following including cut ssh commands.
> > > > > 
> > > > > I could not get the cpio build test to complete.
> > > > > 
> > > > > Interestingly, I came back to the same image/worker later this evening
> > > > > and now it all works fine. The difference is earlier there was a world
> > > > > build running on the worker, which continued to wind down even after I
> > > > > paused the worker. By the evening, that background load was no longer
> > > > > present and the ppc image works in isolation. This tells us the issue
> > > > > is system load dependent and only occurs on loaded systems.
> > > > > 
> > > > > I suspect I need to replicate the load and retry locally, see if I can
> > > > > reliably reproduce the hang. The watchdog won't be present on sysvinit
> > > > > systems which also show the issues but I'd guess there is still some
> > > > > other starvation/timeout occurring.
> > > > 
> > > > I've now seen the failure on the autobuilder:
> > > > 
> > > > * with linux-yocto 6.1.38
> > > > * with linux-yocto 6.1.46
> > > > * with qemu 8.0.4
> > > > * with qemu 8.0.3
> > > > * with qemu 8.0.0
> > > > 
> > > > I was a little suspicious of:
> > > > 
> > > > "hw/ppc: Fix clock update drift"
> > > > https://gitlab.com/qemu-project/qemu/-/commit/73d6ac24c81f1aeae554d469616c9181511e6523
> > > > 
> > > > but we've tested with and without that.
> > > > 
> > > > qemu has just released 8.1.0 so perhaps we should try that next.
> > > 
> > > qemu 8.1.0 brings with it a new set of problems but I've reproduced the
> > > hang with 8.1.0 so it does not solve that.
> > > 
> > > I'm really struggling to understand which change brought in these
> > > issues for qemuppc.
> > 
> > Are these issues visible on mickledore branch? Maybe mickledore with kernel 6.1 stable update or
> > qemu 7.2 update to 8.y.x could be tested too. At least then kernel or qemu could be blamed
> > for the issues.
> 
> Not that I know of.
> 
> I have now also reproduced the failure with glibc 2.37 instead of 2.38
> including the fortify sources change and the 6.1.34 kernel so there is
> something else causing this.
> 
> I've wondered if we need to try going back to qemu 7.2. It may also be
> worth ruling out binutils.

Yes, I'd have no objection to qemu downgrade if that helps with stability
and release deadline. I really trust you don't do this lightly and I would
much prefer you do this instead of burning out when hunting fixes for the various
issues. In product environments I've done this a lot: changes get reverted if
they cause too much instability and fixes don't come within some limited time
from the developers who are responsible for those changes.

> It shouldn't be systemd as the sysvinit images show the issue too.

FWIW, poky master branch with 6.4 kernel is working well on our arm64 boards
and CI results are stable, same with qemu-arm64 on 7.2 and 8.0.x versions.

Cheers,

-Mikko

