Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2DA4C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 00:03:56 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.1309.1645574635507427690
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 16:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iaXoVKOU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id o24so36532626wro.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 16:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Erz1khvAOKXpfop3vV5qTuAo8xv07lJ9fVBoNIRqzhQ=;
        b=iaXoVKOUPiQ00wFN/Yt14jbsktbbuV5qonnRuYdp0yhpF/gKIxbrrc6S0+H1b6+g0G
         jwwqriQrMuem7gWT4SSO0zUdvRZMQ4aeWZ5GbvbDU1+3m/JIiEjktOSrtkf+HcJenoAQ
         K1TBNY0Y2qG8MtJRioVryf+wwP/YxlfZHyfdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Erz1khvAOKXpfop3vV5qTuAo8xv07lJ9fVBoNIRqzhQ=;
        b=et7cs8tDKkoL7eNrcfL6SZeFEVfQ+ITFxLZKMCStCZEmYmU5H3xJgzhxXgTFV1bSRt
         o99xWfpd+SzWVjoFmxFZAxD1bnnRqCHUGtHS1ksF6LegaYd0W3ZvbREe0YPOegVWvRmg
         zw1uC0wDkvvsfC6nzNE2SOc+9N9zfvjPmqKB92rB5VWfMPtJ2yxLSqTE97YyKqSICmyQ
         S21+7DX5TmDk2u3w+iRJRU82NhAdm4wiD0cZyDvyrLtxT87sqL8osOguKvT+BJYSttIp
         YeqDGqsodGxkSopOYGtY25LgqtvOY8iR/Ncn1JuCQkONnmN68iE0F6cBSdhf4csqeEFU
         BWBg==
X-Gm-Message-State: AOAM530KvMbkR4pLHeJq158kgEP8LFVQ8cxlwidMvK9BtFML49RJXzZ2
	zb1THBRG5/mxb2Z4UVwmpU1jNw==
X-Google-Smtp-Source: 
 ABdhPJxr+PkAufD5ZTlNcQibO9sFHxuZwZfAYj41QhjhrBY77m0eb1RV43FQH10FfTi95lhFfY7RYA==
X-Received: by 2002:a05:6000:1863:b0:1ed:9e8a:9413 with SMTP id
 d3-20020a056000186300b001ed9e8a9413mr1634496wri.282.1645574633871;
        Tue, 22 Feb 2022 16:03:53 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4709:85d1:7b5:8346?
 ([2001:8b0:aba:5f3c:4709:85d1:7b5:8346])
        by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b0037bf934bca3sm4506664wmq.17.2022.02.22.16.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 16:03:53 -0800 (PST)
Message-ID: 
 <d9c4d14acb3e5ce1436d8b0f8992217cd3034511.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 7/8] rust: Add snapshot checksums for
 powerpc64le
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrew Jeffery <andrew@aj.id.au>, Alexander Kanavin
 <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Feb 2022 00:03:51 +0000
In-Reply-To: <41b02f27-15e6-4250-83f9-a595fe26b84c@www.fastmail.com>
References: <20220222035234.463162-1-andrew@aj.id.au>
	 <20220222035234.463162-8-andrew@aj.id.au>
	 <CANNYZj_3sRMqa-F_GvR2fCi2vNtafyNOvyHB_WhS99EhpoVK_w@mail.gmail.com>
	 <48dc371d839b004db347823b5867f4c338e94443.camel@linuxfoundation.org>
	 <41b02f27-15e6-4250-83f9-a595fe26b84c@www.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 00:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162233

On Wed, 2022-02-23 at 10:19 +1030, Andrew Jeffery wrote:
> 
> On Tue, 22 Feb 2022, at 22:58, Richard Purdie wrote:
> > On Tue, 2022-02-22 at 10:59 +0100, Alexander Kanavin wrote:
> > > I have to note that YP does not support ppc systems as build hosts;
> > > can this be kept in a bbappend?
> > 
> > It isn't official but there are obviously people using it. I think we should try
> > and do something in core but there is a question of how we maintain this given
> > our infrastructure/tests don't cover it :(
> 
> That's fair. Is it acceptable that it's tested by proxy in OpenBMC if 
> we can't work out anything else for YP CI? I don't expect anyone 
> maintaining the rust support to test ppc64le explicitly if they don't 
> have access. I'd be happy if the ppc64le checksums were just updated 
> along with the rest whenever the snapshots are bumped.

The challenge is we have no tooling or support for "bumping" those values. We
spot issues with the other two build architectures since the autobuilder tests
them.

There are probably some tricks we could play to handle this. The challenge is
then that someone needs to take the time to write something to handle this and
communicate it to the maintainers so they know to use it. We're struggling to do
all the things like this we'd like to and that leads back to Alex's concern.

Cheers,

Richard




