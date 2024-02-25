Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8833AC47DD9
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 17:22:22 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.1375.1708881733904492059
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 09:22:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=C98Hl9J2;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: jpuhlman@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dc3b4b9b62so20237415ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 09:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1708881733; x=1709486533; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/mpaMDdGnyrwMtJb4y0b3xubst82XV8ovDZCBSOfxhY=;
        b=C98Hl9J2vklRwtNsz7z7Di0XlDZON8AMkIw8Jol9eUB9qUAMBeokiIbvT5tjCQOTsb
         sUU34IDcr8qazyC8XYFgNcGn60lvaBBkltjl4tnKO1UOAtkFJ98qg5vPhFNdgh2gHLk3
         tzbHL250OTUAHQc/rCvCPDMlBqHTp5065z1Dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708881733; x=1709486533;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/mpaMDdGnyrwMtJb4y0b3xubst82XV8ovDZCBSOfxhY=;
        b=AV0ADp2fddipcQ+m0nTrczUDBhLG5yQQi2YB9QoVE3ifutyKYFdsWCVteSvy6RLs1Q
         LI0Nns2/U+yBSRo5taCIasMrR7GLk2RdMo6Jpsxvz+GF07pOTjhQIIroMS18GqLqCB4Q
         nKoM+2l9P83+JCZP6n4sfEgJI+sVrlIzIRKQ3Aybnw6srePrsT7Wu3r6RbtB3jt0v4EG
         iC8QH31nlfonzFu1V+7/2In0BMzXO6mnRtQo1wjRmx3y0pBTJD5ob24KL9GUAfftvZCz
         uyegv7IsVwl/Y7uCzU6LsXowz3zHpYM8AqFjCIlbhFFgmUMUYIFLjB8e/0DhlpslUx4A
         u71w==
X-Forwarded-Encrypted: i=1; AJvYcCWETIC2b0+0tGcMliWTRCTnt3+TATjpFfwY8d7EF077KqO28HkXQhvG6XcqWsWtzeM8XFiVXQrHgAAfaEtm/PWfnx4Eb0FcpDyvamOkKXsP9LbtEv0wWsKU
X-Gm-Message-State: AOJu0YxWBE0r9UbLWsiIvhuPyQOw9bYzvSaVKjJeM51HZOxYNc9QhOYp
	eByNMGEdXYic/Q51YTIS5NSHccim/uG/jDRPkgTTO3/RUDjf9iRZbS0iLmCgkJw=
X-Google-Smtp-Source: AGHT+IH34uuzscUaWg1ZN0CLzL2P5rtM2JUp/D1yzkfHJsuqzm2rs5aGnLCH2mQz6yEiYaDBJNrMxA==
X-Received: by 2002:a17:902:edd0:b0:1db:c056:8b2f with SMTP id q16-20020a170902edd000b001dbc0568b2fmr4525202plk.16.1708881733259;
        Sun, 25 Feb 2024 09:22:13 -0800 (PST)
Received: from [192.168.1.9] (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id kb11-20020a170903338b00b001d90a67e10bsm2440885plb.109.2024.02.25.09.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Feb 2024 09:22:12 -0800 (PST)
Message-ID: <8e02178a-106e-498c-92a0-c0fc760cff0f@mvista.com>
Date: Sun, 25 Feb 2024 09:22:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] package_rpm: Fix backtrace on missing
 directory.
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <17B69806B1DEE2BA.25421@lists.openembedded.org>
 <ba284035-ee83-42d0-be21-a6f31532f9cb@mvista.com>
 <f3b16ac13c9a4cdbc7409296267446c23332d56f.camel@linuxfoundation.org>
From: Jeremy Puhlman <jpuhlman@mvista.com>
In-Reply-To: <f3b16ac13c9a4cdbc7409296267446c23332d56f.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 17:22:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196143



On 2/24/2024 2:13 PM, Richard Purdie wrote:
> On Fri, 2024-02-23 at 12:33 -0800, Jeremy Puhlman via
> lists.openembedded.org wrote:
>> It says usr//usr in the comment, but when I ran on a clean build it
>> started complaining about opt//opt as well. Its not really clear why
>> it is looking for those directories, and I am sure this is not likely
>> the correct solution, but I wanted to get it out here so someone who
>> has kicked this area of code might know what may be happening.
> Unfortunately there are layers of different pieces which could be the
> issue, such as pseudo in combination with the host distro libraries and
> uninative.
>
> Can you create a test case which reproduces the issue?
Yeah, I was going to try to get to it, but time got away from me. 
Hopefully I should
be able to get some time later today.

>   Does it always
> happen with this recipe?
Yes. Originally it was happening in our distro setup, minimizing it to 
just poky and the
meta-oe/meta-python, it happens with the recipe with the default distro 
as well.

>   Does it happen on different host distros?
I have not tried that, so far it was just rocky 8.

>   Are
> you using uninative?
Yes. It happens with the default poky distro, too.

> What about buildtools-tarball?
We always use buildtools-extended-tarball, to isolate as much as 
possible from the host.

>
> Cheers,
>
> Richard

-- 
Jeremy Puhlman
jpuhlman@mvista.com


