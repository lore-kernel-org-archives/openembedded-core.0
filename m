Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B916C54EAA
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 08:08:28 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.37625.1674461306816121007
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 00:08:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XqqHgMaE;
 spf=pass (domain: linaro.org, ip: 209.85.218.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-ej1-f46.google.com with SMTP id u19so28243870ejm.8
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 00:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=To21hmBM1DhG+Qlm0s7//R+MFaUvzTDfV/vLIcCoMKA=;
        b=XqqHgMaEirjVsKrMCdqt2KjWNZz2rnOlarA3e1GEKnGjDfkdYXVqN+QIhinQSWqKW4
         w8gpeJ0kTtWIcXiLZAB/1SMtk/LSfowXwRWK+Mh8q/U2oN14MV54xEYoRfd+/xchVI4G
         Ly5UbwJSXFRKlQWkj2r6xoSTHEsViv9yEynjBqM1ffzUsIDhhXqqd/GywfQXgk7DQC/c
         EkU/rcZOimkEO3o2ZpNVxOGCaPi7uI4iqFg6WehYvoPhZp56iSQAq8K9JfO8v7O2kQVv
         8R89o7LfNIraTsn0qiPAojmqKuMNdYyDDRhf95dRjKgimJ5CGqz1NavITjIb42wGsciV
         Y4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=To21hmBM1DhG+Qlm0s7//R+MFaUvzTDfV/vLIcCoMKA=;
        b=bvLBsr0wm+qh7F/CjHdrgHhAgc205tZVe1hbxPN+9PSU7k/m66Z0FU5np144miYZO+
         3PZ6gXBVZP044JFPFs5PnyjKqe/JTDRS090fbuYEJOgUHIOYxyFaHtfOfeC2nsZAKc/Y
         MDbVLGv8afT7ColXANFrbiTQOL07JEIKdVC85LHW/i8t1+K8sCfRlOS4bsSuBQKvS8ei
         M/QhtouW58I/31/3edUv2toCOVsP4kBLn/jp7KvAiAqzYAvYc1oWhFnp91Bwuoio1rwv
         DDWraCXQoJlIyEIhpXaAeZadzqGrHVT8q+HSuLBplljwmhNwCK2jxc7vjn3xyeGQg3yH
         ZMVA==
X-Gm-Message-State: AFqh2kpC8EgelHBMkcZnA7oZCpC+HZQNqc+OMcQq8r8r2G6oB8uAj8yH
	kdGXwm/2mqPVwaCoPWTLS/zIaQ==
X-Google-Smtp-Source: AMrXdXv9TCArJadYKvJfVBN5zdGaLGGD8IjgV4OlXRXIQ4oaoExl6yh1EhvfvdJejZcVmnsU8zsjOA==
X-Received: by 2002:a17:906:8d08:b0:86f:e30c:72c1 with SMTP id rv8-20020a1709068d0800b0086fe30c72c1mr27035270ejc.8.1674461305109;
        Mon, 23 Jan 2023 00:08:25 -0800 (PST)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id o12-20020a170906768c00b0085ff3202ce7sm16052261ejm.219.2023.01.23.00.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 00:08:24 -0800 (PST)
Date: Mon, 23 Jan 2023 10:08:14 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Ross Burton <Ross.Burton@arm.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] insane: Improve patch warning/error
 handling
Message-ID: <Y85AbhShAXaXZP4U@nuoska>
References: <81854d8c638c80866a3bbdd6fe0776de245c3acb.camel@linuxfoundation.org>
 <CADkTA4PZ4p7H2cKh3+zab8-bs8nznW=v+3Cd5KZEMdkeBTZivw@mail.gmail.com>
 <CA6755AF-3664-435C-8078-E730AF0F57C2@arm.com>
 <CADkTA4OFa9oKKHUYNcpXY2Rfvs_kyJOCbiWMDMDb2Y=84KHPJQ@mail.gmail.com>
 <CANNYZj_C7-U=a-TohJtcEVOYyaj0sYNnV_2EBnA55wT2QHT0Jw@mail.gmail.com>
 <CADkTA4Nq=X6d9qz1a+Q0mEpb=ob0_+TsoHdkGn2nycd8+FOz=g@mail.gmail.com>
 <CANNYZj9yXjUFiAkoGnefvoKzCTut8BMgR-y4y7zu+=0vom9TKA@mail.gmail.com>
 <3b311ccc982ae39cc72c428ddc97386fe8d653e7.camel@linuxfoundation.org>
 <b354270257b047d5bcfcc73a7ac13270@axis.com>
 <1cfa5fc2c0edda2cd9990de4839d130e3f7b5be9.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cfa5fc2c0edda2cd9990de4839d130e3f7b5be9.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 08:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176297

Hi,

On Sun, Jan 22, 2023 at 10:19:29PM +0000, Richard Purdie wrote:
> I was hoping something simpler would suffice. I don't think I have a
> lot of interest in going beyond this, particularly given the likely
> impacts, both code wise and socially. If people don't want to do this I
> am really running low on the energy to try and push it forward. Making
> changes is hard, the socialising acceptance of a patch is the piece
> many people overlook and it isn't here in this case.

I'm requesting Upstream-Status to be filled to every patch file in
reviews. There is a lot of value in this information when maintaining
layers for a longer time. I want this. Everyone I speak with understands
how important this information is and that it's better to figure things
out or at least trigger discussion with upstream projects before
accepting patches.

-Mikko

