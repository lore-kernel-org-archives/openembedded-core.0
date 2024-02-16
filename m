Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A78C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 16:43:30 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.1578.1708101808339391056
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 08:43:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=xz76omnP;
 spf=pass (domain: baylibre.com, ip: 209.85.160.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-42c758f075dso27654241cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 08:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708101807; x=1708706607; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RyboYizIcT86qsZhKJhdizWmtvH7Kcf9yhiuPErQDCE=;
        b=xz76omnP9dCap//fLA5L/Xt4BXCYzFGyAXOL8jW2Q44GF/dQWyUheOpHekV7AfZnMy
         RELz5BmoO5yj2xj4BDIqKrlWhkr1Q67oCSyTMDe+21Zdj3SpUeyb9JxZ5S42C/QGjwVD
         8iotrNVUdkPMLXwxccDsjuA52kCwu4uICnQ1AxG21wPQ+sYF5hxAxhSDGDxp8sHep/bf
         O1dLuN3ZoCT3YU+CcTF8iYO1A62w6LCioiigjRVM9tPL7XjBLDrzt6JJBvMFvjCPpXU0
         25E96LZLpt5GfuUwujOvZlIwSARyL1z4pLG8lxS0c/CyUC1x0PYQA3Kv2r4yvH9IRqNL
         y13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708101807; x=1708706607;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RyboYizIcT86qsZhKJhdizWmtvH7Kcf9yhiuPErQDCE=;
        b=wUjdrbh0MfBS2y0EFYFozxseZ0WcHpnT1dl/xrF5yQsA3M7OK6OOCGeCyX4Pegl2UO
         UgMa1vK+PDHwLGS4Qqgr9vmWmU/N3HdcPbdUVDTQo9JMIep28XZ4wf1qtqFtSIo1JJt4
         GtjUgWImcUWD8RQGdiMcxzydM8vbzxmAEvp6XNdaL0f637csJWcJdVapkC4ekwucmxfh
         WAgqOYak8Olx747S4SIgINmCEFoKnr91Kwk9Mc8YXgkpeIj8NivaA/KkPBYE3o6/mfM1
         /CRZRmJyGkWtj6HPD5Og7z39XWNgaz8IqGKy5KKdF94ny/9I1SFvN1gwGwc7QvTtQi+9
         wxMA==
X-Forwarded-Encrypted: i=1; AJvYcCUjaly/f6MDyKxnucb3t2cIu8qLsQqsHbVv/gH0r1QOk4afpRBMC3Jkmyh6IU/q5mzvGFfen+6M3kFqPvFatSQNWmjNfFdN92CF3p9GRw2j1A5IBDQ5cihL
X-Gm-Message-State: AOJu0YxRpFhvwcQUXtaHaF1BCALzVIsTuJjMpbPycNW7OCmJmVjR5sBJ
	plz4c4pYD+ggxevC+kA5fhzFx5rz3uE+0pDEktzteYanXB9I1/f/B3BNLaHnOuI=
X-Google-Smtp-Source: AGHT+IGq3My5GJtUzZSD/3IcKq6kt+gKAUZkqs1CaRmRkoJyUSuiQeZg7dfJFNK1s/aVs5DfKPuJkQ==
X-Received: by 2002:ac8:5a55:0:b0:42c:43d6:c69e with SMTP id o21-20020ac85a55000000b0042c43d6c69emr14754999qta.1.1708101807435;
        Fri, 16 Feb 2024 08:43:27 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id l9-20020ac80789000000b0042c58191861sm79609qth.53.2024.02.16.08.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 08:43:27 -0800 (PST)
Message-ID: <e29e5a3c-d4a7-4f6f-9b72-df4372dc7c4f@baylibre.com>
Date: Fri, 16 Feb 2024 11:43:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] patchtest: Add further information for failed
 testcases
Content-Language: en-US
To: =?UTF-8?Q?Simone_Wei=C3=9F?= <simone.weiss@posteo.net>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 =?UTF-8?Q?Simone_Wei=C3=9F?= <simone.p.weiss@posteo.com>,
 openembedded-core@lists.openembedded.org
References: <20240215213932.245929-1-simone.p.weiss@posteo.com>
 <ccccce2389cda121cfc5cef4c87b7edf63d6a41b.camel@linuxfoundation.org>
 <ee91117924cca38a5bfc5d345da269d89a03670e.camel@posteo.net>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <ee91117924cca38a5bfc5d345da269d89a03670e.camel@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 16:43:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195786


On 2024-02-16 11:19, Simone Weiß wrote:
> On Thu, 2024-02-15 at 22:10 +0000, Richard Purdie wrote:
>> On Thu, 2024-02-15 at 21:39 +0000, Simone Weiß wrote:
>>> From: Simone Weiß <simone.p.weiss@posteo.com>
>>>
>>> Add more information to log messages when a test case fails.
>>> Still keep it short and mostly reference the documentation. Reasson is
>>> that
>>> documentation should already contain the needed information, do not
>>> duplicate
>>> it here, so we also do not need to update here should the doc/policy
>>> change.
>>>
>>> Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
>> This does get a little tricky since the responses from patchtest on our
>> test infrastructure has a character limit for security reasons.
>>
>> I have wondered if we do need to change it to some kind of code
>> response which can then be translated back into real text.
>>
> What could be easily done is also to remove some kind of information that
> is kinda duplicated from the logs: e.g.
>
> FAIL: test commit message presence: Please include a commit message on
> your patch explaining the change
> (test_mbox.TestMbox.test_commit_message_presence)
>
> basically duplicates test_commit_message_presence (with and w/o _), that
> is not really needed IMO.
>
> Also the reference links could be given instead - if any testcases failed
> - in  a bundled fashion by adopting the suggestions in patchtest-send-
> result and for local runs in patchtest's run function

We could reference the wiki page: 
https://wiki.yoctoproject.org/wiki/Patchtest

We'll need to update it too, though. I put it together to have 
*something* when patchtest was brought back online, but there's 
definitely room for improvement.

I think a combination of both suggestions, i.e. a much shorter "FAIL: 
test commit message presence (code: 1234)" sort of approach along with a 
link to the wiki page is the best here.

What are your thoughts?

>
> Cheers,
> Simone
>> The reason for the character limit is to stop abuse of the VMs that run
>> the tests, you can't mine bitcoin and pass them out as the failure
>> message for example.
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195780): https://lists.openembedded.org/g/openembedded-core/message/195780
> Mute This Topic: https://lists.openembedded.org/mt/104382125/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

