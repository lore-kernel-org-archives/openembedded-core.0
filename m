Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC99C61D92
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 13:15:09 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.39532.1700572500944364063
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 05:15:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=DeYpOEyf;
 spf=pass (domain: linaro.org, ip: 209.85.167.181, mailfrom: javier.tia@linaro.org)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3b40d5ea323so3712591b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 05:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700572500; x=1701177300; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3HJG6x3Vreuee73+HMt+5urHQSJu0sALfBqP6tpzzuk=;
        b=DeYpOEyfyjuRjTIm1l/jgADLVvbOyDL+lelTUAFITUTFLtZDERAsk81YyN1BmsseTO
         d85Z/j5sTTsNPxBdzJRndEj0jF4nWX4u2FQqdM5wTJeSqQtzgRAdUlJHPTUuTwXUgv/n
         yz6N6jCn1MZvQz2C2Z8xphfrd+7R3RKOXAL/GQFhBZZCK8n10MFXXLlCzuUQTEgqHsF/
         YXviyBbBq5jRJCDPPSfWC9XvMN8rIhkvGcP1pbBjqqb0KNg6zaoIMZiGI+4BuPwoiUK7
         twyRGHnd72cD3zO8qpPMN33gxXt/EQvWEENHpqJ6gBfuSsictWYip2/UlCBiQzeVW4ei
         eI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700572500; x=1701177300;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3HJG6x3Vreuee73+HMt+5urHQSJu0sALfBqP6tpzzuk=;
        b=FfygbLTbD7nK93IvMb3u1PSTDP3hfuxutfDqgteH2zCswJ1epRhiXWkXc9UYRWOVnc
         tbZDTMqgEv3OzS1xJpwCqORW0iy+yLzz95mrajCNfbVboppwV3ak1+3d1N/5bEfGHT/Y
         pRuDPjwDjIeqfbEWFOrGYGENYFbgkd3zwe2edCF3aAeQ8+2DnptcDlt2eXS78iq46T3H
         duxMVdtOBDxIpiUkWh4mDtwiIC9sCt+EPV6NJg32HrNAwirHyiXdsiABO2xMQhFbnNr1
         3ZjHGwm0C7IE7V75JJuO2qIwuzQyHebGmXW2RvmgWuFtNPE4QROFLTdIUkiYi/4nur/i
         0fdA==
X-Gm-Message-State: AOJu0Yyp9GKvcDLIZ/02+yxtiNXh1cmTuYN4JyZsADeHGfehUS7alZB+
	ZmG/VEleVuN3spSQShIVbYbmTw==
X-Google-Smtp-Source: AGHT+IFMCSIYIPEUeiUnlftLQyqVa4KfVSt7LKve3E+9/15bIk8H4Y5wsGWYOSucB2NDk//r/GyS7Q==
X-Received: by 2002:a05:6808:302a:b0:3a7:8f94:743a with SMTP id ay42-20020a056808302a00b003a78f94743amr13529164oib.10.1700572500235;
        Tue, 21 Nov 2023 05:15:00 -0800 (PST)
Received: from [192.168.1.2] ([177.93.3.242])
        by smtp.gmail.com with ESMTPSA id m10-20020a65530a000000b005b7e803e672sm6750559pgq.5.2023.11.21.05.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 05:14:59 -0800 (PST)
Message-ID: <d50fd244-3897-47d2-912c-b3e0468e7262@linaro.org>
Date: Tue, 21 Nov 2023 07:14:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] package: split strip cmd when ccache is used
Content-Language: en-US-large, es
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20231031042735.3842176-1-javier.tia@linaro.org>
 <ba031885caf9dfeee099cbf4748a06f769c9de95.camel@linuxfoundation.org>
 <8aee753f-8ebf-4205-87d3-7988a46e3676@linaro.org>
 <CA+chaQdpsD2NfROa6+McWj_chmQg97Jgj8iV8JOaJ8GTVdb4EA@mail.gmail.com>
From: Javier Tia <javier.tia@linaro.org>
Autocrypt: addr=javier.tia@linaro.org; keydata=
 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
 WdJQjTu3/NJR54YogRY=
In-Reply-To: <CA+chaQdpsD2NfROa6+McWj_chmQg97Jgj8iV8JOaJ8GTVdb4EA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 13:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190972

On 11/20/23 10:06, Martin Jansa wrote:

> It was already removed from KERNEL_STRIP in:
> https://git.openembedded.org/openembedded-core/commit/?id=41f019afc41f800b622c46a6d7cf1beffc97716a <https://git.openembedded.org/openembedded-core/commit/?id=41f019afc41f800b622c46a6d7cf1beffc97716a>
> 

Oh, great! Submitting a difference change as CCACHE need to be removed 
from the rest of tooling like LD and AR. Keeping only the compiler.

Thanks,
» Javier Tia 🖋


