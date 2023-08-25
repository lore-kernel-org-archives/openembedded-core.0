Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0431C3DA66
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 06:27:13 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.7821.1692944831080723697
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 23:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=k0NlQDWP;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50098cc8967so863609e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 23:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692944829; x=1693549629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/f4mbzonUcdRGdg1DY/4A9fHqwdw3e7z71jcb2OYU/o=;
        b=k0NlQDWPnpj3+3xP4QUR+Z3f9Z42hVDkdbMD6ufFp4vss0GyboZ+mSSMRjLJh/o/+v
         C+e89aKSX2uwujQ9ySYg2jnF3AidPB2UY+VBM8LxZIJJkcGjIsZkqr4XcZdCNp2sPGov
         1ucgRDdmu5VyKvp5QhZ4qgew33m5f1mtYViDaqttBsEy4x9ZP9SnFzcBwFmodLai5pcT
         0KcpNCCBdbVsmU6es1ORDUaarmRzhbwJnjXiaYvPgdcKb37Gg/NtBALPtpYjzP856m0M
         pLmEfmne9xfjfS2MOp/lzqbdOUuXsjjzTttn8uu8fHYmsp3IhIltWjyk70CRq1P8OBqt
         c2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692944829; x=1693549629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/f4mbzonUcdRGdg1DY/4A9fHqwdw3e7z71jcb2OYU/o=;
        b=h7dzF1keWSvy0UKvgEuoEZiQtlnNZkEI9Zrc2BZK8tZISMnd/8eIDU8iBV7l6WNHWk
         9zDR5+zHXtSdbioSOikssCKWfH63r5MkKLEpYoAbuIbaEihcS9hXZ7bq48hnGZm/gAjC
         1/a/jawRSz9TES6vMF90Azv4CtP4tqCJJKqGfpan4pls/43/DvXaSx4hKNXabuob/vxt
         C1FODAVXPxgTbXZaLCy2sKE7jvthZ0ZbvG1H/W6FEdiZg75vVb3ES7Wq/B6FI+VvJhYS
         3I4qylqgYe45fHIJF3KdOPji2PVwjUMh2AQ7yJ/KPi9QoF2oxFLuWhwn61T7BHwHUXG4
         gg0A==
X-Gm-Message-State: AOJu0YxDMjrwu2H2oXtD2bE9793NhaehshX2AIBUHAI5FHGBKIIQu+3Z
	PJM+UFa+gwGkC+XR1r+XMICZNw==
X-Google-Smtp-Source: AGHT+IEsfrzNOeqO+wIa+AH3PFB/aaGWzWe1Lks4VkGgHDgrQrr9r/wJ3SWwn4iUqz9djQmigC2wOA==
X-Received: by 2002:ac2:4bd2:0:b0:500:9d32:8deb with SMTP id o18-20020ac24bd2000000b005009d328debmr3348787lfq.51.1692944829107;
        Thu, 24 Aug 2023 23:27:09 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id q3-20020ac25a03000000b004edc72be17csm166704lfn.2.2023.08.24.23.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 23:27:08 -0700 (PDT)
Date: Fri, 25 Aug 2023 09:27:05 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] Dilemma on changes - merge or not to merge (e.g. 6.4)
Message-ID: <ZOhJuUWYSU8MmaCK@nuoska>
References: <177DAFEBFB5EB0D2.24073@lists.openembedded.org>
 <d7982e9549e8e8042dfdfdaa4f3173684aa726bb.camel@linuxfoundation.org>
 <ZOSoIXLG7vH/GC1l@nuoska>
 <177DB4530EBE3FA3.24073@lists.openembedded.org>
 <177DBC07E94591CC.4797@lists.openembedded.org>
 <177DD0B30D8FEDF8.27837@lists.openembedded.org>
 <177DD39B5534099F.27837@lists.openembedded.org>
 <177E1FB73F514F09.8058@lists.openembedded.org>
 <177E56C1DFAB4DFC.13053@lists.openembedded.org>
 <ae98c59b507b7e5342f832e7b3e8814ac793592c.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae98c59b507b7e5342f832e7b3e8814ac793592c.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 06:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186690

Hi,

On Thu, Aug 24, 2023 at 09:18:03PM +0100, Richard Purdie wrote:
> On Thu, 2023-08-24 at 15:04 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Wed, 2023-08-23 at 22:16 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Tue, 2023-08-22 at 23:01 +0100, Richard Purdie via
> > > lists.openembedded.org wrote:
> > > > so the commands are stopping mid flow for unknown reasons or the ssh
> > > > connection fails. I can't tell if this coincides with an rcu stall or
> > > > not. Both logs do have rcu stalls in.
> > > > 
> > > > After these failures the system does continue to otherwise work
> > > > normally and subsequent tests pass.
> > > > 
> > > > I wonder if the slow emulation might be causing the networking to
> > > > glitch and break the ssh connection.
> > > > 
> > > > I'm at a bit of a loss on where from here. 
> > > 
> > > I thought I'd update the thread with new information.
> > > 
> > > I went back to the start with this and looked again and what is going
> > > on. Interestingly, I found one of the autobuilder workers would
> > > consistently fail the qemuppc-alt configuration for core-image-sato-
> > > sdk. I paused the worker and experimented.
> > > 
> > > I saw two different failures (included below). One shows systemd-udevd
> > > timing out on it's watchdog after 3 minutes and resetting, including
> > > taking out an ssh session running the cpio configure command. There was
> > > no RCU stall reported.
> > > 
> > > The second failure shows systemd-logind as well as systemd-udevd with
> > > the 3 minute time out, the kernel complaining about missed IRQs, an RCU
> > > stall and lots of breakage following including cut ssh commands.
> > > 
> > > I could not get the cpio build test to complete.
> > > 
> > > Interestingly, I came back to the same image/worker later this evening
> > > and now it all works fine. The difference is earlier there was a world
> > > build running on the worker, which continued to wind down even after I
> > > paused the worker. By the evening, that background load was no longer
> > > present and the ppc image works in isolation. This tells us the issue
> > > is system load dependent and only occurs on loaded systems.
> > > 
> > > I suspect I need to replicate the load and retry locally, see if I can
> > > reliably reproduce the hang. The watchdog won't be present on sysvinit
> > > systems which also show the issues but I'd guess there is still some
> > > other starvation/timeout occurring.
> > 
> > I've now seen the failure on the autobuilder:
> > 
> > * with linux-yocto 6.1.38
> > * with linux-yocto 6.1.46
> > * with qemu 8.0.4
> > * with qemu 8.0.3
> > * with qemu 8.0.0
> > 
> > I was a little suspicious of:
> > 
> > "hw/ppc: Fix clock update drift"
> > https://gitlab.com/qemu-project/qemu/-/commit/73d6ac24c81f1aeae554d469616c9181511e6523
> > 
> > but we've tested with and without that.
> > 
> > qemu has just released 8.1.0 so perhaps we should try that next.
> 
> qemu 8.1.0 brings with it a new set of problems but I've reproduced the
> hang with 8.1.0 so it does not solve that.
> 
> I'm really struggling to understand which change brought in these
> issues for qemuppc.

Are these issues visible on mickledore branch? Maybe mickledore with kernel 6.1 stable update or
qemu 7.2 update to 8.y.x could be tested too. At least then kernel or qemu could be blamed
for the issues.

Cheers,

-Mikko

