Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79932CFC28B
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 11:23:20 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.10953.1728991392371727038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 04:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=V3MbkONx;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539f58c68c5so3484402e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 04:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728991390; x=1729596190; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zC8qiaO9hRmcMyjmokS+tCVXwu+IrG1DwCaDxvpNtcQ=;
        b=V3MbkONxPiosrhziigJJRZYBkQVWVz1LiOLPhgStxvZ8EcCelDR6g9lqwQYUoasT0N
         R9mAE63glM9gOBkh8Ukj4dBDjrdc6Zy15DB+7kNvpU/cz8pQnWd+MPsawfKKVIl0w3lX
         eRf0LOskXQ2zQ64zEkE7kxrgUOyk1I5ZF78U3NIt+XX+GZc94hQ8p9q3LoFcRps2Jn3v
         zucXOdG/1ffhd6si6n4L7OIadKIEY3dOtYqWqtLnxr9EH0VrBlCNWe05qlnPiA/O3+He
         qJSU8wuTvAeZWe+By/cyiv3Rk4CLplt3i73wVyzrhh1MBOU0rWslMxGq6fSXR7z66iW7
         hOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728991390; x=1729596190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zC8qiaO9hRmcMyjmokS+tCVXwu+IrG1DwCaDxvpNtcQ=;
        b=SJ6K+pAHWCNzkMPd/lj4/7XN5wfMnFKD3JAtfbLrqZ1yCNRvFqaQ/QzUQJafps2xCR
         KG0kptNF9mXMY0PiSUgHD5Jvgm1SEMT46vm2xTZjLOiCFCdj3jwS0Z07oguskJ0PELzx
         LqMT5cdBZ0FF3NmxcRnERQfE2Dxvif9qBgByyRSam+FxSfAt3Kj3n6MIgmoPoODC0qDM
         LryQGXc9FvFqFq7gRp1ZU8LTlhxMc6/ywMRAmaqaVGbVVgPGtbRanLEz3auivc3eUJF9
         wbjJZ/h/CtZBaJuPvd9VKx9HSL6zUtiPj3zLja54k65cglFszjxgSRhK+7JCHkZanWt5
         I6Pw==
X-Gm-Message-State: AOJu0Yw0lE9vukVXMBoqRewWf4MCmJehoNEZzMuHlYqtn5EFusaSEbhe
	ZGQ3f8FnAdAIbJCgrLfJXfJmauoFtFiAa/3SIfPXneL+L9fwe0v52lXMsdCncJ8=
X-Google-Smtp-Source: AGHT+IEP/HeP9a/CVyUe9Z/JTq6Ghph26IY34ul0Ob6x9srpnTiRafK7w6TJsUmYOfKOVm1dH1RI/g==
X-Received: by 2002:a05:6512:31d5:b0:539:a4ef:6765 with SMTP id 2adb3069b0e04-539e54d76e1mr7468318e87.7.1728991390387;
        Tue, 15 Oct 2024 04:23:10 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a00015b86sm140655e87.296.2024.10.15.04.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 04:23:09 -0700 (PDT)
Date: Tue, 15 Oct 2024 14:23:07 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v8 0/8] systemd uki support
Message-ID: <Zw5Qm1ZEScA196fh@nuoska>
References: <20241011122044.12222-1-mikko.rapeli@linaro.org>
 <ebd022b240f4bb6b8e2e2fb8d93a4c9f2ba9492f.camel@linuxfoundation.org>
 <17FE4B15CF045259.4702@lists.openembedded.org>
 <Zw4PXRX28-qB8FjT@nuoska>
 <874585dde5c3fe6685e9c8b250cd02dc2404f26c.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874585dde5c3fe6685e9c8b250cd02dc2404f26c.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205806

Hi,

On Tue, Oct 15, 2024 at 11:43:33AM +0100, Richard Purdie wrote:
> The arm test still fails:
> 
> https://valkyrie.yoctoproject.org/#/builders/23/builds/267/steps/14/logs/stdio
> 
> The traceback is at least cleaner now I fixed the lock error. I did
> test with KVM disabled.

Bugger. I had tested this on qemuarm64 and genericarm64 on an x86_64
build host with Ubuntu 22.04. Is this an arm64 build host with Ubuntu 20.04?

I will remove the tests as it is clearly too hard to get these running.

It is a bit hard to figure out in which environments selftests are running.

Cheers,

-Mikko

