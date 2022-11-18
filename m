Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BECBDC4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 16:04:11 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.15630.1668787445111229201
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 08:04:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gViDgnBH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id i12so6052072wrb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 08:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vm/u1TqqJ6o3WY89NW9qfy8CdADZzEKYoj4Me4bfn+U=;
        b=gViDgnBH0dDIjnXxwIM8Oy5L66A7DSqDaXe/e5sTQLppB4jvsODVwAO8FbUYmWWERm
         2Ag6XAZ5LqLojLPKehnFcG7gLu8sDDlfchFnKnjrUVQAhXYnWOyOWBMjVuF8DiC7b1DP
         /l8+kuqq/2natDNuDxI2hipSf9t4b3opT9gSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vm/u1TqqJ6o3WY89NW9qfy8CdADZzEKYoj4Me4bfn+U=;
        b=YrH/IMpyue88n8I2TlTyy2SkKMHXWP8UO3B73u9N81rToIiERt00gNXvdMsvM3iuiS
         APPwcAK5U2J7JLiW5FrL81BPQO3Qou/D7tpoi7UX6BDunSi1rwyE7tYyIYytee7mE+TG
         sjoW770Mc6xaWtbks4V561zFd/7FAJWzGwrpW4xjmeRA8uscGc417al4kBuyU7PHAuTh
         GN9odNr6MmP51nUe+5VDvIrznEAK2AGTXDqpEkHu1m/5WAZTRsc/umlLLbI84SevFqYe
         8hjl8Ol5yHveU9+2ULQDqMDx37WA09Bnrt5LLZcAZjj7A+CmF71B8MMfr1Igb2MQ21TB
         v2cQ==
X-Gm-Message-State: ANoB5pkCEVe1bek9d2+T/vtvMh+jMVreSc9eTjz4lsptnPVkI/AT3Epy
	RYB0V4cDyYIxasFhvEaAKxyrew==
X-Google-Smtp-Source: AA0mqf41/HvcaFbNdlnbXCKb1f000Cdwlkkvxf/BA84e8HtJlN87/22MUI0FoohA8d+ZWxUZGTUSOQ==
X-Received: by 2002:a5d:6dc8:0:b0:236:53d3:5a48 with SMTP id d8-20020a5d6dc8000000b0023653d35a48mr4745086wrz.66.1668787443313;
        Fri, 18 Nov 2022 08:04:03 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a603:eef1:6736:def4? ([2001:8b0:aba:5f3c:a603:eef1:6736:def4])
        by smtp.gmail.com with ESMTPSA id l24-20020a05600c1d1800b003cf878c4468sm10729479wms.5.2022.11.18.08.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 08:04:02 -0800 (PST)
Message-ID: <e7158cb97e3f8112e94296ad64df8ebf7792b995.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/2] image specific configuration with oeqa
 runtime tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 18 Nov 2022 16:04:01 +0000
In-Reply-To: <Y3erTB2Qulh8Wfn+@nuoska>
References: <20221117071223.107064-1-mikko.rapeli@linaro.org>
	 <5b79cba0817750882a0ef1f1dd9b9581abc9db28.camel@linuxfoundation.org>
	 <Y3ZVup8YKv6LQzuF@nuoska>
	 <4f16ed270c2b979839830929c703494d221b2228.camel@linuxfoundation.org>
	 <Y3eXdWibCGQBV6Wt@nuoska>
	 <6b088587f876fd2cf76ad8b1b13fac6a7c92cfc6.camel@linuxfoundation.org>
	 <Y3erTB2Qulh8Wfn+@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 16:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173469

On Fri, 2022-11-18 at 17:57 +0200, Mikko Rapeli wrote:
> Additionally I'm currently interested in kirkstone LTS branch so would li=
ke
> any changes to be there too...

The idea is that we develop things in master, then they become
available in the next LTS release, not the previous one.

People somehow seem to think that we add development patches to master
and immediately backport them to the last LTS. This is not how
development or the LTS is meant to work :(.

We've not going to be forced into poor interface/API choices just
because people want things backported to the current LTS.

This is why I'm so worried about the lack of planning and development
happening on master, people need to be thinking and planning ahead. To
be clear, this isn't just about this issue but a pattern we're seeing
far more widely.

Cheers,

Richard





