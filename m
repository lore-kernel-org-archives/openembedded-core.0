Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE16C4452D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 05:24:21 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41511.1784697851803020731
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 22:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UUdWcOtO;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4956242332dso22490485e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 22:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784697850; x=1785302650; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q50oJhuwA8TS/lQvp8rqBmI0HUjWvRTD/KLtTHXw/Ag=;
        b=UUdWcOtOTWIuR3LNvF1N/hissjr1zc3m5gvB8VT+PPpIOmzJDaqlW0MnkuXEVNf8d+
         7Veef5cSdMkwmagw2WmiyAD/wGLET1WNL8CzTpYxIZWTVnOR9qiOP42fFRdnEEubaksV
         lg7IKOVE7Oa0fOeGqs4bYznQa+HKVHAY2cPZhpIQYB9bEujJB4e5pUuGjopp7Vz4rIt8
         +526ox1ReKfZC3+hvkumtNEXqu8OuKA/tS69Dh85o4Oh5Tg0oixyRtxTgILuJlAUbQEf
         OQZco8weEotVzUz8MQrXxB/apWqiSMr5N5JLc7aylKpzhDJSd0KchJoHOiXnTLfuAMRh
         dqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784697850; x=1785302650;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q50oJhuwA8TS/lQvp8rqBmI0HUjWvRTD/KLtTHXw/Ag=;
        b=i5F8roo+WuDdyp14RIgbl1jJmFcsoIlbmzO8CvIns0+BCOe27n+LU4pNGXgMO9SSYe
         s0emzvDcw6vuUDhzVRztJgv26AGa5MbkC3KHJPB/n2XSg4yNkG/7zWvfcSovBKzt+3/q
         gVb6fIbzqA4yGXQUq78dKBu1+i3bdVDarl0mEb3L82DOd5QK9/Z02ndhrbKvJtw5PeV7
         C9jyRqztjN2THpbMr7dq4xMy46tFyTofphif2b3hwz44WthXY4xC7omUQwR5yYOYFjPH
         tIP2J2trRoRDHZU2VZMEcem5jKfpgQYWyV9TMGP49PXy5m8pr/DKmwyNnGyCMSSSt7Ae
         Nj1w==
X-Forwarded-Encrypted: i=1; AHgh+Rou2Z76/ZmbHY5cIXhleRbH0rJ861uJwYsK8pJ85NYs2MvvwRIEwEXXiRCXgrz7pyhmdI70k+//9KFEhb6O2Xps4g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwE2Bm6xl9eJjsVB1wjbtoW1QEHWnCdKAXb/wZqrC7FTa5RhDY/
	dXloG2jG559QnptzF8OiKq9DipOQxJHBFN/92azV63TIVLGnjlcxMal6
X-Gm-Gg: AR+sD12wDjpCvZOGSLmnEu5LhHqsPUpZ0btl5FMFWPVBjS/J5zs9k6I9jt5M+ATxJfr
	SBXXBOBqPWteVLVdW2tqmrkRogRXDHngkAzHzA8uPx3h5y+OS612Ib/PNubDM0D3A8XyzYWWEfl
	zwDC6lfFliNneIVHM86bSuUtCOVteevpSLILOGld7geduAlTlhZs0+WGUK0O2A4xLtzHLOdmYzl
	DZxnArG93Qcj2ml2k0upCVTV+Yuxe+bFJmbnj7FlZm7JDTYSqYj4rCjD0de9jb7Vg7rmCiXi6rt
	CUPvxO2nwAJdGSOWT5A/A0UpUDMwzoCwA6SyHRJ/DNtbGzoggstN9TpDsLDCxn33oyjiBUJtBgM
	Pl/AdvLEqCqDV8pHW8d8rwHnxz39zRB2oWvWKP0u0EYFB+SN0yT2mp3BQ4VCKUd9m/pgxd8emVq
	m3TwVstXTPiq0DS+eNE7ZHOeGJhJBbN5JJt8hWmo7ryVc=
X-Received: by 2002:a05:600c:e549:20b0:493:b4cf:d37f with SMTP id 5b1f17b1804b1-4954a3f0e58mr166387255e9.16.1784697849861;
        Tue, 21 Jul 2026 22:24:09 -0700 (PDT)
Received: from [192.168.2.123] (BC24447B.dsl.pool.telekom.hu. [188.36.68.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b0266ccsm23283915e9.3.2026.07.21.22.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 22:24:08 -0700 (PDT)
Message-ID: <244dc96e-885a-4403-bc19-120e4cfd8eb9@gmail.com>
Date: Wed, 22 Jul 2026 07:24:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/3] mesa-libclc: New recipe for forking
 libclc for Rusticl purposes in Mesa
To: Quentin Schulz <quentin.schulz@cherry.de>,
 openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
References: <20260719080108.1290998-1-zboszor@gmail.com>
 <20260719080108.1290998-2-zboszor@gmail.com>
 <4e508b63-8c6f-4b61-be3f-f47981e1bd31@cherry.de>
 <49803c8c-9850-46f5-a554-3ad8700f9ae6@gmail.com>
 <041f7b3d-3c4a-44f3-a416-cb47d8e406d4@cherry.de>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <041f7b3d-3c4a-44f3-a416-cb47d8e406d4@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241583

2026. 07. 21. 11:01 keltezéssel, Quentin Schulz írta:
> Hi Zoltán,
>
> On 7/21/26 6:08 AM, Böszörményi Zoltán wrote:
>> 2026. 07. 20. 16:43 keltezéssel, Quentin Schulz írta:
>>> Hi Zoltan, everybody,
>>>
>>> On 7/19/26 10:01 AM, Zoltan Boszormenyi via lists.openembedded.org wrote:
>>>> See the reasoning and discussion at
>>>> https://eur02.safelinks.protection.outlook.com/? 
>>>> url=https%3A%2F%2Fgitlab.freedesktop.org%2Fmesa%2Fmesa%2F- 
>>>> %2Fmerge_requests%2F43020&data=05%7C02%7Cquentin.schulz%40cherry.de%7Cebbe0f4e8df54c2c252b08dee6ddba7e%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C639202037154557993%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=JWuaPEkNjN6Y5zTeDBao%2Fk0bDR1FKZsaOgDck4evP2E%3D&reserved=0
>>>>
>>>> TL;DR: LLVM constantly introduces breaking changes that cause
>>>> regressions for running OpenCL CTS with Rusticl and finally
>>>> Karol Herbst had enough.
>>>>
>>>> This fork is from the LLVM 22 version of libclc and contains the
>>>> necessary fixes to make Rusticl pass OpenCL CTS.
>>>>
>>>
>>> I think this may be too early as this is still pending upstream and is currently not 
>>> receiving support from at least one person involved there.
>>
>> That one person's objection is now alleviated by not requiring
>> the mesa-libclc dependency exclusively. It was replaced by
>> a runtime check and a warning when not running this fork.
>>
>> As a result, the mesa-libclc repo was rebased twice since I posted this recipe.
>>
>
> Rebasing is a big issue for us. I'm assuming Karol knows better and won't do it once 
> it's actually used by mesa officially.
>
>> So the MR is still definitely in flux.
>>
>> Hopefully, by 26.2.0, it plays out and gets backported.
>>
>
> Not sure they will want to backport it but let's see.

Two out of the three commits have the "Backport-to: *" line.
So if this MR happens to get merged before 26.1 is EOL,
they will get into that version, too, in a slightly different form,
as the first one changes the context for the two later commits.

>  I'm assuming they will not do releases on that fork, are we expected to always update 
> whenever there's a new commit? How do we make sure we use a version of libclc they are 
> expecting us to use with mesa? (e.g. not forget to bump mesa-libclc when we update mesa).

I will keep an open eye on the mesa-libclc project.

Eventually I would like to see Rusticl replace intel-compute-runtime,
of which the legacy version (requiring LLVM 14!) is carried forward
in my meta-clang-revival layer, forked from an older meta-intel branch.

>
>>> Also, aren't we going to have an issue if we have libclc AND mesa- libclc built at the 
>>> same time?
>>
>> No, because they install differently names files or into different locations.
>> For mesa-libclc, the pkgconfig file is renamed and the install path
>> is ${datadir}/mesa-clc.
>>
>
> ACK.
>
> Cheers,
> Quentin


