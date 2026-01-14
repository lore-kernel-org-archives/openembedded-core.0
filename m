Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E25D31A1C
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 07:45:12 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5576.1768376707446320889
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 23:45:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RcTRkB75;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: uvv.mail@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65378ba2ff7so1864897a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 23:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768376705; x=1768981505; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LnQa0dfImaGahdjJHq/qoe/Jv67EQbw8EdtvcIjIJyM=;
        b=RcTRkB75P1S4Cli4TXO1g/ANwQuKlbGwhPbMX/hrvSeao2HDGg+OyihnQX4uZLnupr
         6BaLpoqA4crxADvII7+oDjTAtHQYsEM0Y3v25/ZLLpZAnY6QrzzqfE2lR7sa9a8GlBOV
         IvFzzvRt8NZds/+e3T0mTHL63m7wfIK8R52iIZUF2vlnjGWVHPKwWk+7LZ+jeWapj9xn
         xTcYiuAYJdiyDOOBHhWA/wnO/Pg8aISXMjY5XwAwqG+ZGQoWsUnJTrVHHHt3ztvIDMP6
         E2UjJ6ESuzkloPUUoJghu6mkyXzIGjKhrSZ9AMs5bM9BYW9atw9OQ8lY4Od/FRhDduQ3
         U62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768376705; x=1768981505;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LnQa0dfImaGahdjJHq/qoe/Jv67EQbw8EdtvcIjIJyM=;
        b=OpaMIJ4bQL/WaN3R7dTkIPBDpaI/hw5AcRcFJ94U9Ja8J98BzikR7d84Im0wq9Dr0W
         T2q112C+7iL6Ip+yaU70XNulYTcZpkDbw9xC0E3BREAds1qCld/vfgAvbozJ37hJa8bj
         7R4bYghACeToSz17JQ2/YeKlLaSmPDVHNGrC/LbN8zkLCdW4NAqkcA0yqZ+25Pk6bSUc
         e3jKxF0uJiBQQN9GzOj1FWzk6LyGsh/8zR/i5xIn1FJL4KlFrAbn+yQYA3ZDfQ7ETK5C
         ZPcYPQeqeazNz67ppD37pSTfjxTq4KubZyDqfnrBqy8jx4+F0etp+HqJXuQuA0U5d+GF
         sdTA==
X-Gm-Message-State: AOJu0YyN8V7MBMEg3r+uA+EqgcMmnDnzbW3fjXCqWpX7z5wSDXwOWQgd
	I+K7XadbPx9o4TDmhJrBt0irXCGG7gAsh+8q7kKwbu3GatvORC6ccdu0hQkswIgz
X-Gm-Gg: AY/fxX6r37QU/2lUvaNBFeFvVE/ZZZVU+KfF6+Mdkp0mtoctUxSxDmD2rPDC+qh57KS
	pToJjMaXQ/gYVzWWiOM9AxwO44q2PM26resFLZRHbPVZzrgO0dEN9kvRggLWFKzny3Ii/2J0hSh
	ZqDReYfvFUAm/4ObjyJaAcZ234m8CbglG3TbL5K5r15y6LV5m450YFfJJSI3Io+NJUIvO0GZ8mR
	bJZoZk1SdhTQL8v3DINwHpZRA4W2URqoFWFqBNvDg9eaL4NCtbWZHmn29FJ/HyN5L9eG78crEGx
	Fb3wsCZCFCX5IzctglJCsXvKq7nFtcSh0RVhATU/FN3sEP0e6YRWfTO14SQ9S0L39r9ZQ9zhPp1
	S+NtFqBAh+5E5z4VzRk/OG5F5W2sg2sbuVjbHWeK+wdyfLToo4/8QVP1AXdPO/ytMjgB3N/kt0e
	I3kVIWcUaZnpipvIKJvPyBxJ3Vhg==
X-Received: by 2002:a17:907:97cd:b0:b87:47b:edab with SMTP id a640c23a62f3a-b8760fdc241mr148384566b.10.1768376704582;
        Tue, 13 Jan 2026 23:45:04 -0800 (PST)
Received: from [10.54.7.179] ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86ee5287e4sm1202878966b.52.2026.01.13.23.45.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 23:45:03 -0800 (PST)
Message-ID: <a5f529e6-d1b6-4cdd-865a-bf2ef1c951a9@gmail.com>
Date: Wed, 14 Jan 2026 08:45:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/4] overlayfs: oe-selftest: Make the test
 more deterministic
To: openembedded-core@lists.openembedded.org
References: <20251224141659.2218381-1-uvv.mail@gmail.com>
 <20251224141659.2218381-2-uvv.mail@gmail.com>
 <1b37649b1cfa12e2c76f94f0589f8694e682e120.camel@pbarker.dev>
 <188903DB96F81C7D.2783356@lists.openembedded.org>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <188903DB96F81C7D.2783356@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 07:45:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229306

Just want to double check, what is the reason the patch was dropped from 
master-next? Is that only the component order in the caption?

Slava

On 09.01.2026 09:49, Vyacheslav Yurkov via lists.openembedded.org wrote:
> On 08.01.2026 14:33, Paul Barker wrote:
>> On Wed, 2025-12-24 at 14:16 +0000, Vyacheslav Yurkov via
>> lists.openembedded.org wrote:
>>> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>>>
>>> The test orignally was written under assumption that poky distro is
>>> used. When poky-altcft is used for example, then systemd is already set
>>> in DISTRO_FETURES, which the test did not expect.
>> The commit title says this is about determinism, but it's actually about
>> supporting init systems other than systemd in the test case. I also
>> think "selftest" should come before the component name, so perhaps it
>> should be:
>>
>>    selftest: overlayfs: Support non-systemd init systems
>
> The commit has nothing to do with non-systemd init systems, because 
> the whole feature only works with systemd.
>
>>
>>> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
>>> ---
>>>   meta/lib/oeqa/selftest/cases/overlayfs.py | 5 +++--
>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py 
>>> b/meta/lib/oeqa/selftest/cases/overlayfs.py
>>> index 580fbdcb9c..3e55e97927 100644
>>> --- a/meta/lib/oeqa/selftest/cases/overlayfs.py
>>> +++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
>>> @@ -5,7 +5,7 @@
>>>   #
>>>     from oeqa.selftest.case import OESelftestTestCase
>>> -from oeqa.utils.commands import bitbake, runqemu, get_bb_vars
>>> +from oeqa.utils.commands import bitbake, runqemu, get_bb_vars, 
>>> get_bb_var
>>>   from oeqa.core.decorator import OETestTag
>>>   from oeqa.core.decorator.data import skipIfNotMachine
>>>   @@ -46,7 +46,8 @@ inherit overlayfs
>>>           res = bitbake('core-image-minimal', ignore_status=True)
>>>           line = getline(res, "overlayfs-user was skipped: missing 
>>> required distro features")
>>>           self.assertTrue("overlayfs" in res.output, msg=res.output)
>>> -        self.assertTrue("systemd" in res.output, msg=res.output)
>>> +        if not "systemd" in get_bb_var('DISTRO_FEATURES'):
>>> +            self.assertTrue("systemd" in res.output, msg=res.output)
>> The inverse logic here confused a few people on the patch review call.
>> Could we add a comment at the same time, something like:
>>
>>    # If systemd is not enabled, we should see it listed as a missing
>>    # distro feature
>>
>> That is just re-stating what the code does, but I think it's worthwhile
>> here to avoid confusion.
>
> This is already written a few lines above in the test description.
>

