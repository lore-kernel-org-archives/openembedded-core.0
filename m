Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B345EC3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 13:21:29 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.33241.1723036887568684456
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 06:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=tAigf4pO;
 spf=pass (domain: baylibre.com, ip: 209.85.219.54, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6b78c3670d0so10074416d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 06:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723036886; x=1723641686; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7klKX1hAKDV4rAAKkXIndlZBZHf6ALnjNsioJyW+p3k=;
        b=tAigf4pOOV9d/3WvSj8TVMBA/HX7YaN5kTX7eTrgc2N37M/OZWd70+MorKB+Ryb2tX
         wUzuZ6JqUlhhNtYxz2h/bf/PVi7T4SnAj6IyJbRNJOsDzEgyhwPFQsazfY+WxtKG842W
         As+VFb+hh7C/RsZPvHiykuDHEYKZcZo2EpGD4wRBiaifyvLsLUNYeKDmATpuqC/3QQoY
         eSdqFQ9XU4AtdrEgrls/DPMkOZPmCaLlrmUNWK3uhFGXW8xeBq27CHlFIxecUKoNre2v
         xO4Oc08eyhl70SkySPhuEehgptl4odRaiZTG1i1RY1JK7oTtjIJdnDtJEoZSejLFHwhB
         HrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723036886; x=1723641686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7klKX1hAKDV4rAAKkXIndlZBZHf6ALnjNsioJyW+p3k=;
        b=o0D8lxtwQNNwHVG5IAJSo4egTshpIBSp9hFzY19m3ZXnV5e/K7vblzt9IWQyhDTgVt
         yxN0d80a6brLXF7aURgFS9FWXLSH5/Cd1SkQNQV85Z6MIiQ36bkkOy45Rb7hkxAD4WMg
         ONBV1KlrirliJx1ZS/IONHZd7XwzGU92DguZlyXaG6iNnbS5vJ6SBy6pJBmIHby9VgPN
         34DHg9PxtDnsXBv0295KHbfKVgerGny5TLZm7huQEHDyqLaJrLR5CR+Ab00cZyVU5aBq
         CmaLZdheCOxu7s+dpBn0JOx+f0VkoUctmrmmYMWuChYkH9sY0osXPgR9ZESq8qe61Het
         z6lQ==
X-Gm-Message-State: AOJu0YwRiWotSuVa8UwZBpTsiFP2zKdSQrq3phThJyZwAhKV9sYAIzd+
	nJ204jMcs7cL4oRLO5Y51l035INkxfpCvetU30WIrltXC95sCiepJ/PqW9SlztZb2xapt9kU1Nq
	w
X-Google-Smtp-Source: AGHT+IHT9hu9JDPMZTzbbCam3sTV35ZFfPotANvKxm6iuoUQkPm7s/XL29quQ5k/4n2HUwidC/VOAQ==
X-Received: by 2002:a05:6214:4385:b0:6bb:52ee:71bd with SMTP id 6a1803df08f44-6bb9845c7f6mr187441506d6.57.1723036886269;
        Wed, 07 Aug 2024 06:21:26 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c83cd74sm56501616d6.79.2024.08.07.06.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 06:21:26 -0700 (PDT)
Message-ID: <0731d554-4ef0-478e-9413-b0e27f13716f@baylibre.com>
Date: Wed, 7 Aug 2024 09:21:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v2] kea: upgrade 2.4.1 -> 2.6.1
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20240806191220.323104-1-tgamblin@baylibre.com>
 <BC38EC4B-C25C-44B5-9C72-48095ACCB740@arm.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <BC38EC4B-C25C-44B5-9C72-48095ACCB740@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 13:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203072


On 2024-08-07 8:06 a.m., Ross Burton wrote:
>
>> On 6 Aug 2024, at 20:12, Trevor Gamblin via lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org> wrote:
>> +    sed -i "s:${B}/../${BPN}-${PV}:@abs_top_builddir_placeholder@:g" ${D}/usr/sbin/kea-admin
> Is /usr/sbin hardcoded into the makefiles, or should that be ${D}${sbindir}?
It should be, thanks for catching that. v4 incoming.
>
> Ross
>

