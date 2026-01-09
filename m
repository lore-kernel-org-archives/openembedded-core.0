Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94968D232F7
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 08:49:36 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6330.1767948570022444058
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 00:49:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iD+2Zu5Y;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fbc305882so2054338f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 00:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767948568; x=1768553368; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8tddk/90Z0sIBGVEhVY6j9OR5WcMHQhxUxT+faCM6Z8=;
        b=iD+2Zu5Yz3XXJ5frHAawKTjWpIfLoT0OLLi+u+D0LNzhbpsnnrGSvEO9rJcgUHb8lv
         N6oE8dYQV1+8fNu6bM+T0pExDeV1yp7YmxTqL/y6ts0F7L8TpejR1rK9XwN1wEmXvt14
         ryRcXMUxBrWdsemVtb4MH8vSwj2BKbMyzsLGWa1rsx4OPC/U/iSCFEooqZqTnB5W9qtQ
         3ancSbu/4b4bAr+PgmgoGEW3aU0ipj4ptjbDnBlFJuDe0Td+p2vrodNK4dhL5A/6K2sf
         juKxbUv1bm54WAckioIOaxPAjjKArXz0qnMC3MgwNAIjBi9BWckZxVwAsSDlYXzvJafZ
         ZWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767948568; x=1768553368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8tddk/90Z0sIBGVEhVY6j9OR5WcMHQhxUxT+faCM6Z8=;
        b=PH9JAizN95pk6FHBTkpcB72g96+KZ5XqHTZpoHAY5RkQamznyTtWEcimxoGCKA0m7/
         4gs/loV6vOITOmayCyUgoJ72HkF/mgtrfEEQcg4QUmcbxuN8S4p4I4o+ngoKt+Nw5VWc
         SFx5a4yoFajcErQZ6nAblOpYlt3I/37/G8MFUditIsmCdPEW1cDs+3RRvdybM28eSZAY
         D4dxI3FrT3u/eXW1+bygFj4ieSk9mromoN+wS0BtJcQfdfp9N5wRx6Hm4rrA/fJlY++q
         AHpTFVJutLONaLES/AiYdDCJcw2qx7NLOriFlmOcmW3H9+1aobyuc6fRArlDirUGY4yU
         4XIw==
X-Forwarded-Encrypted: i=1; AJvYcCXn0mPFi2RI4JKiO+sD9NeiikEVtOPeZT8YxkIDSYodpuLpqQJbZMAZgPGQR4UF0LrfNefivwehWk26YQXZlpmLcw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx7CArolKpfhDw93mwRbdEwujv9Ub9eMj/hRLS2HBYma5whf/eY
	S5hHCC/ey+t9zT0V+V5Bk4WE+MKW9arFHChuiYEOIdhtX9ud2hF3rKnx
X-Gm-Gg: AY/fxX5YM2AL7Fn3EZCgnR7JhLELbuIp3AOP6l21GBGf86naVJ1j0IHe0Je/OOapTyf
	6r8U3x7CO2px+r4QGGfpmfhMCOkybxJnAsvswXK9iS/AVqDBo8bNuRgIq7tc2RfrEysvu77Lf0Z
	LPkgA9GDqVkEuGUKLxddyevFRGEqu6ylqElo9Goi+zlYquyO2ji+gBpK7B6MO57YRQ7KTcE/9YT
	kzCtzt7Ec4yJi532f5Ag4U2hlxzLVV2uuJGD0EQS/lYuBTInB8ut/gxNuTnZPqcNB7li68K8u3h
	cmEJxRMobt4+r8zg7hCIMA9i/fwA3tI4oBIfq/hlQT1LPm1+dAERQSZDZp9is5SiWBf7eHfuTZO
	InkGPXf6ZM6K/dNZDLLNN6e8iWLR4NT+0txz41NHmHvEnnirV+bR21Jlrk4g6pGg/hQeMaM6mNP
	GRDkRQqCyqZyiGb1dFN9NnAXOyuYo=
X-Google-Smtp-Source: AGHT+IGfuy/ICTasnSZpE2lnIoPWrDfZBbxj/cZfdJBAanRdSYNTwzfK/bRsRRYKoFbvPMjQruYUYA==
X-Received: by 2002:adf:cd81:0:b0:432:c37c:d831 with SMTP id ffacd0b85a97d-432c37cd9c7mr8469248f8f.1.1767948568220;
        Fri, 09 Jan 2026 00:49:28 -0800 (PST)
Received: from [10.54.22.201] ([154.47.27.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df9afsm22907379f8f.24.2026.01.09.00.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 00:49:27 -0800 (PST)
Message-ID: <52da37fd-54b6-4319-9c19-7ff8bb33dab8@gmail.com>
Date: Fri, 9 Jan 2026 09:49:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/4] overlayfs: oe-selftest: Make the test
 more deterministic
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
References: <20251224141659.2218381-1-uvv.mail@gmail.com>
 <20251224141659.2218381-2-uvv.mail@gmail.com>
 <1b37649b1cfa12e2c76f94f0589f8694e682e120.camel@pbarker.dev>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <1b37649b1cfa12e2c76f94f0589f8694e682e120.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 08:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229096

On 08.01.2026 14:33, Paul Barker wrote:
> On Wed, 2025-12-24 at 14:16 +0000, Vyacheslav Yurkov via
> lists.openembedded.org wrote:
>> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>>
>> The test orignally was written under assumption that poky distro is
>> used. When poky-altcft is used for example, then systemd is already set
>> in DISTRO_FETURES, which the test did not expect.
> The commit title says this is about determinism, but it's actually about
> supporting init systems other than systemd in the test case. I also
> think "selftest" should come before the component name, so perhaps it
> should be:
>
>    selftest: overlayfs: Support non-systemd init systems

The commit has nothing to do with non-systemd init systems, because the 
whole feature only works with systemd.

>
>> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
>> ---
>>   meta/lib/oeqa/selftest/cases/overlayfs.py | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
>> index 580fbdcb9c..3e55e97927 100644
>> --- a/meta/lib/oeqa/selftest/cases/overlayfs.py
>> +++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
>> @@ -5,7 +5,7 @@
>>   #
>>   
>>   from oeqa.selftest.case import OESelftestTestCase
>> -from oeqa.utils.commands import bitbake, runqemu, get_bb_vars
>> +from oeqa.utils.commands import bitbake, runqemu, get_bb_vars, get_bb_var
>>   from oeqa.core.decorator import OETestTag
>>   from oeqa.core.decorator.data import skipIfNotMachine
>>   
>> @@ -46,7 +46,8 @@ inherit overlayfs
>>           res = bitbake('core-image-minimal', ignore_status=True)
>>           line = getline(res, "overlayfs-user was skipped: missing required distro features")
>>           self.assertTrue("overlayfs" in res.output, msg=res.output)
>> -        self.assertTrue("systemd" in res.output, msg=res.output)
>> +        if not "systemd" in get_bb_var('DISTRO_FEATURES'):
>> +            self.assertTrue("systemd" in res.output, msg=res.output)
> The inverse logic here confused a few people on the patch review call.
> Could we add a comment at the same time, something like:
>
>    # If systemd is not enabled, we should see it listed as a missing
>    # distro feature
>
> That is just re-stating what the code does, but I think it's worthwhile
> here to avoid confusion.

This is already written a few lines above in the test description.

>
> Best regards,
>

Thanks,
Slava

