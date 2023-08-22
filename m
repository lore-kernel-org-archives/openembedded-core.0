Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC576EE49A8
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 07:44:46 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.3367.1692690281458925368
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 00:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=p0YXdSbN;
 spf=pass (domain: linaro.org, ip: 209.85.208.179, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b9f0b7af65so64257331fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 00:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692690279; x=1693295079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fwrZYlIVDjXTZTldYy64tfN010D8T2Uo9kc0a8mUh34=;
        b=p0YXdSbND7QShIXUf7LrynFWdi99VLqE77+WiFXBHJtiU9hgXrBspDW/gXkEEfhX89
         NcsK0d3h0V5o2YFqcvmh/D8lqjONCRecx6swEJoSp6ycgIIPKCOJ1Ml5kldC9ZGba50S
         XFLQ1X89EISGyVqc8HQI+jNW4GTnj2ULUhwzbf0E14agrsAQOZQHFJv4zJEMhU3ASTce
         FdRnU3kSxm3VCLWlkg6HywQE8SWUbU88kpZsdxDR/pCRoRpsUz5sbk4VQ8ibjKNi/UD8
         sDj7BYxPjd+qMeBjTqL07kINTE3KcwDQi4qvLyMhUfF9mv+Mo4Rv/5CwDVudppEEXOEA
         n90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692690279; x=1693295079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwrZYlIVDjXTZTldYy64tfN010D8T2Uo9kc0a8mUh34=;
        b=i4fQG1qrKTKA08OUMMnGhKO1qWjKi0dxai3iPsaqPIpNfa5/3UdJGUkUryIvP9RtXD
         kQzvaWYHzVzanbwQAEQmVyMkw5M6IfGPj/cDAMVa/2BWZcMG0K4BFI7a8rOXUMXdHqyb
         2B8NFIv+Pg7UoHGPDw7O0Ozoz58Ln2LQkYhSS3VYF+4wa8wQ/p8OcSD96Hb+0O7L4UA5
         RAo3LbSnUhLMSzouwjVo7nVRLL5JjAvSaWyd+0NHpzOrDu7l+mPxHUj7+TBSq6J+v9aB
         j6pD7Xxv8U2xo+4GqSPKh4DYxpMX4vXOuQj/gEoaBKVB4sVZco15MnWnPMfeqBQ6N+U0
         Xj8Q==
X-Gm-Message-State: AOJu0YxWxZB0pUKRUWbxfopQp/B0gqGUD6LKlOKXcN1Q5bDX14uZtTTn
	pJzP0RHT1XHI2e9SW/2lIlqHOg==
X-Google-Smtp-Source: AGHT+IFqrQOed/cUnbnA7K9SbB3lzX1tyzHfNzfVqPiNesHuSKP+d2AP/JQ7mDOKCeXo/06XwBKFCQ==
X-Received: by 2002:a05:6512:318f:b0:4f8:70d8:28f8 with SMTP id i15-20020a056512318f00b004f870d828f8mr7903768lfe.55.1692690279266;
        Tue, 22 Aug 2023 00:44:39 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id r12-20020a19ac4c000000b004fb85ffc82csm2081776lfc.10.2023.08.22.00.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 00:44:38 -0700 (PDT)
Date: Tue, 22 Aug 2023 10:44:36 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: luca.ceresoli@bootlin.com
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 00/10] linux-yocto: consolidated pull request
Message-ID: <ZORnZEqwX/4HBXxp@nuoska>
References: <cover.1692632563.git.bruce.ashfield@gmail.com>
 <20230822091344.2301ed50@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822091344.2301ed50@booty>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 07:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186495

Hi,

On Tue, Aug 22, 2023 at 09:13:44AM +0200, Luca Ceresoli via lists.openembedded.org wrote:
> Hello Bruce,
> 
> On Mon, 21 Aug 2023 11:44:35 -0400
> "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:
> 
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > 
> > Richard,
> > 
> > While we track down the remaining 6.4 boot issues, here is the
> > set of -stable and specific fixes that I've queued in my kernel
> > testing tree.
> > 
> > It is possible that some of the 6.4-stable's have fixes for our
> > boot issues, but I didn't see anything obvious.
> > 
> > In particular we have the -rt warning fix from PaulG and also
> > a fixup on our isocpus patch.
> > 
> > Cheers,
> > 
> > Bruce
> 
> You're probably already aware of the build failure triggered by this
> patch series:
> 
>   stdio: ERROR: linux-yocto-6.4.11+gitAUTOINC+d9483a24c9_9753b44979-r0 do_fetch: Fetcher failure: Unable to find revision d9483a24c9ee33b6e566baa5233cbd9feaeb5212 in branch yocto-6.4 even from upstream
> 
> This one is less visible:
> 
>   WARNING: linux-yocto-6.4.11+gitAUTOINC+d9483a24c9_9753b44979-r0 do_kernel_configcheck: [kernel config]: This BSP contains fragments with warnings:
> 
>   [INFO]: the following symbols were not found in the active configuration:
>        - CONFIG_COMMON_CLK_NPCM8XX

Fix for this warning has been submitted upstream:

https://lists.infradead.org/pipermail/linux-arm-kernel/2023-August/859760.html

and meta-arm has applied it separately with:

https://git.yoctoproject.org/meta-arm/commit/?id=5b8329a99f5fb6497575612ae677e03decf2e3b2

I hope upstream would pick this up for master and all 6.x stable branches. No feedback
so far.

Cheers,

-Mikko

