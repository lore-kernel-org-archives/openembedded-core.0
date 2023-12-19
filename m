Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FEF7C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 18:37:01 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.3834.1703011020739833467
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 10:37:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XmLfgEQO;
 spf=pass (domain: mvista.com, ip: 209.85.210.173, mailfrom: jpuhlman@mvista.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6d7609cb6d2so1522227b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 10:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1703011020; x=1703615820; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1V4e+opPHSi0+NTbFbZYgmhUeSsjYVduybnCyP/0E2k=;
        b=XmLfgEQOjhzpeCt/RQDPvfOllMjBI6lHm/g9+9bIx2WKpWwLwijyXtVJV/5s2DOR02
         kxXqm++xpNu2xbLrwulAMMZ4ATSAYHVatHfhIEHbTzxUyueKZh1WDryOt7aUFgx42WtG
         +wicYatUkrYlizh6UiRKDvKaeTvB2DXSl4vBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703011020; x=1703615820;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1V4e+opPHSi0+NTbFbZYgmhUeSsjYVduybnCyP/0E2k=;
        b=RAEh3iGpqlmTHKDgMN0wdH+cxF/GWFsvLgOKdAYlObXcTmbRw3dhuFf7PEJEMNFjVX
         zhq/lqcrW33JUJS+B0UyDgp3r0ivlGHK45or9Xg0HWWZaAH/TEJFqmBgBUKvyV2BEbOB
         JwObjpwqDK+anLAkMdUiItktzwGHuuavyGVyFrxeiHDPvlzvYF2F25RgINicf/PoUg9s
         85UHpGhu/zG5e5fvr5y80Ocw2hYACkPrAOk2Cbxi5V0YOhNCUsktc0Fcqxr5qaOnp1ns
         rGWzRN0TNCO1BRr9ivBlqw6pT59fIyho8V8Z1nMFMGkgZbLi/XN3NF+4T5DCAPITLDBY
         lbbg==
X-Gm-Message-State: AOJu0Yw1HRP669QhFTLV5qJEEdpS/uR8PJAigY6cLs5QQOAKIOXHeX+v
	etLoA3P6vt0sr1nBgeO56mp+zA==
X-Google-Smtp-Source: AGHT+IEh6PR/85EDKVNPqPEowKrR4O3jzGbVtlB1uskvADr6nObujM4WkEtHr2ECKlEXJ0RK74h19g==
X-Received: by 2002:a05:6a00:b8c:b0:6ce:3b75:499f with SMTP id g12-20020a056a000b8c00b006ce3b75499fmr11818568pfj.41.1703011020054;
        Tue, 19 Dec 2023 10:37:00 -0800 (PST)
Received: from [10.20.245.32] (50-240-203-141-static.hfc.comcastbusiness.net. [50.240.203.141])
        by smtp.gmail.com with ESMTPSA id it19-20020a056a00459300b006d6c7279b47sm4627911pfb.195.2023.12.19.10.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 10:36:59 -0800 (PST)
Message-ID: <9c959f18-83c9-469f-95cf-4c67af4c4c49@mvista.com>
Date: Tue, 19 Dec 2023 10:36:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] create-spdx-2.2: combine spdx can try to
 write before dir creation
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20231218175756.3622411-1-jpuhlman@mvista.com>
 <224aa4ffd7f77c4f2e78d16727086ecd8821eb60.camel@linuxfoundation.org>
From: Jeremy Puhlman <jpuhlman@mvista.com>
In-Reply-To: <224aa4ffd7f77c4f2e78d16727086ecd8821eb60.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192754

> FWIW I put a str() call onto the bitbake side of this in case we run
> into this anywhere else.
>
> Cheers,
>
> Richard

Sounds good. Thanks.

-- 
Jeremy Puhlman
jpuhlman@mvista.com


