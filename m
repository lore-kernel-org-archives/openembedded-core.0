Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBBCC77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 07:46:16 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.3125.1686123972410434993
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 00:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=ZIOz02NW;
 spf=pass (domain: linaro.org, ip: 209.85.208.176, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b1b8593263so51182691fa.2
        for <Openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 00:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686123970; x=1688715970;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5K8uIpBdLWRkwJVGldtlhBFA2oMWbn6ZqELInfwG01A=;
        b=ZIOz02NW1XHBAWmUqlnku/fAt1RnkQ0CD1fKjgFdRx1uiqEVvYLxANmUxxBy2NBNrT
         Py5/av18jvWD+nEPGz6jT6c76TDX+TUzSUx7dfO6iwXaE+gBXcgGsGO2rKFO5b3bFIkk
         vjkWxSYJUnRv2FXivXPpCQWHMgDPUqXo6cCsBa3nxY8BWhZT4IhC2FEbuVrLvPvgkz1B
         ZMCrjGfMF2Xx94FmLHTgACfmn0Rk7arOYoED1Xd9ofG1LTem3gmeODxvNnQBbh5Oca7W
         S43YaGt69Bu2pXAIlhvqDrIYy0Go8z9pREDVR3+eM1lTzl6wZL/a3Scvb3Mawb6nr3dE
         cr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686123970; x=1688715970;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5K8uIpBdLWRkwJVGldtlhBFA2oMWbn6ZqELInfwG01A=;
        b=h9SuapPM3q6MkC+H+TcXRmXxyXcjZxaBRsw2zibScet21NiMFmwnVZ4D8MP42XW8wK
         2SCzbtZF0oJC6oKuOO+rUj83Q178ZTyIY/xL4oY4xgB5Mz3O6jf0NFeJDvuClEWT3xpo
         lGuLVGAfr5JhA+cOaZexpLWrItWG+DKwm1uCqLbnFceuO9+BHHVNYbTFMWIS8SLXiiop
         ankm1d+bnnPVpEHGW+Qpxl+F+TpC0uRPjNYbm0btvlKqUyaVru+DB69KGh3Q6ywqDY9M
         zzLTMVcgDN1BdjRkxMlwRMboi7vZXaDRY/oLLPH9jhP1NKs7GtSX+pqkKXee72Vxzjti
         DjGQ==
X-Gm-Message-State: AC+VfDx1iwqIN4sxB9tJPRbfMY4diPPePO1d/AbKElDA6we4uonTNE8b
	ypfVtkVz4vfzr+kUejlQ3hyoSw==
X-Google-Smtp-Source: ACHHUZ7YiNDcwVLaUCgUBl2M1VcpQNA3MGT9A4Vi7utt5O9EJmujZVuB4jsIG73vK1Fd8EW+DRqrCw==
X-Received: by 2002:a2e:8514:0:b0:2b1:c501:5124 with SMTP id j20-20020a2e8514000000b002b1c5015124mr2421600lji.51.1686123970085;
        Wed, 07 Jun 2023 00:46:10 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id n5-20020a2e9045000000b002adbedc9962sm2157323ljg.46.2023.06.07.00.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:46:09 -0700 (PDT)
Date: Wed, 7 Jun 2023 10:46:07 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Openembedded-core@lists.openembedded.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [OE-Core][RFC][PATCH 3/3] testimage: implement test artifacts
 retriever for failing tests
Message-ID: <ZIA1v9xvQtUjh/gH@nuoska>
References: <20230602095037.97981-1-alexis.lothore@bootlin.com>
 <20230602095037.97981-4-alexis.lothore@bootlin.com>
 <CANNYZj8vV1=GOacn_vHpfeJ1h29AdLNJsO6X-wXPrW9vahc_5Q@mail.gmail.com>
 <ZHnYGjE3ahdytp+g@nuoska>
 <228e247a-2121-d1c6-95bf-51f18ec95e03@bootlin.com>
 <ZHnphEHQR7tx1D7w@nuoska>
 <6df3a2b3-5915-8b67-a7a9-f10f59144e99@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6df3a2b3-5915-8b67-a7a9-f10f59144e99@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 07:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182457

Hi,

On Wed, Jun 07, 2023 at 09:36:07AM +0200, Alexis Lothor� wrote:
> Hi Mikko, sorry for late reply, and thanks for the additional feedback
> 
> On 6/2/23 15:07, Mikko Rapeli wrote:
> > Hi,
> > 
> > These changes are an improvement, but based on my experience in product test automation,
> > instead of collecting logs after testing is completed, it is better to capture logs
> > from the target device while tests are being executed. Serial console, systemd journal
> > etc logs can be captured as streams from the device under test (DUT), and time stamps added
> > from the test controller so that aligning events like test command execution and log messages
> > is possible. It is also a good idea to capture core dumps via this kind of stream(s).
> > Problems with HW and BSP SW may not be visible after testing completes (device has
> > rebooted, reset) or capturing data is not possible at all (due to system, kernel, userspace hang,
> > oom or too much load).
> > 
> > This capturing of logs could be implemented by adding some configurable variables to execute
> > commands on the test controller and inside oeqa environment at certain stages of testing, for example
> > after serial console login prompt has been detected. Command to execute could be a simple
> > "ssh -c 'journalctl -b -a'" to capture boot logs and "ssh 'journalctl -a -f'" and log the output data with
> > additional time stamps to bitbake task output or a separate file.
> > 
> > Just thinking out loud here, these changes are an improvement over current situation already.
> > Thanks for sending these patches!
> 
> While I tend to agree with what you are suggesting, I feel like there are some
> new constraints, because of targets variety: is the system a real target or a
> qemu image ? Does it run systemd/journald ? Are coredumps enabled by default ?
> Of course those constraints may be quite easy to circumvent, moreover we can
> think of a "best effort" solution which gathers "what it can" from running
> target. Also, there may be some corner cases that would need some specific
> handling: some tests can be quite long (hours), what about broken pipes during
> those ? This would definitely need some re-connection strategies for example.

Agreed. Currently our qemu reboot tests are failing for due some kind
of reconnection issue, for example. I'll try to find time to fix this...

> Since current proposed solution is not very invasive/has not much requirements
> except a valid ssh access, I plan to update the series and let some real testing
> show if it is relevant. If not (or not enough), we may give a try to a "runtime"
> version like the one you are suggesting ?

Yes, the series is a clear improvement over the current state.

Cheers,

-Mikko

