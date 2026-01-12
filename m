Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C21CF45D2
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 21:35:27 +0000 (UTC)
Received: from mail-oa1-f65.google.com (mail-oa1-f65.google.com [209.85.160.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44120.1768251969097898870
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 13:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@elder-tomes-com.20230601.gappssmtp.com header.s=20230601 header.b=oIyUnBHG;
 spf=pass (domain: elder-tomes.com, ip: 209.85.160.65, mailfrom: levi.shafter@elder-tomes.com)
Received: by mail-oa1-f65.google.com with SMTP id 586e51a60fabf-3ffbfebae12so2182562fac.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 13:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=elder-tomes-com.20230601.gappssmtp.com; s=20230601; t=1768251968; x=1768856768; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F91fg2ff8eHq15Z66RPDxO3YZDHCF6Rp9UG8hejmTvY=;
        b=oIyUnBHGAQHKGbLmfBIjwGqy1ZkqeAT4ctcoRHZN8SEjayCAC0UewfRofj9BVmEVp6
         aUk+z/fMMciyugT7cPgu3HbyOEDLIHBbRWJlJkPVZOy5SqEWAxZ73BZkainfixSXwn8u
         lXUiRB6W0I1KPpb7aGB8VBzTVq5g0yn9781TryTkjwd01m4PavLWLqXbh4WdTLMl9uNc
         420GV9yj2k0MHzFSDhdnILksi5qdz+SqWgM/pyCXL6koL4RY/aUNfB4vJ8Sci28ype36
         zYB+R/OdX94sCkcrvkcv2eBL6azeUQkSGpi+U8lLZMfCG64uE/GN8NYBYru+qMC1mmFu
         5NLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768251968; x=1768856768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F91fg2ff8eHq15Z66RPDxO3YZDHCF6Rp9UG8hejmTvY=;
        b=Jns4pQMhdjd/CAvc/tnTXnUou6xOKgiFsWVwc2Nrb7Rlfvg214GnYUZx0vQ2KBWAZJ
         yIrxE6KCxylxCbMYHaU8nRq4moG406Lq4UPZ1kDUBG4EqATiQxLMZZUHWa/UfqJYkxSx
         JEBpgeTuB2UyO0TKT5Xit8z0j52M+nva27p/0X7+TsF8/gAUTctpojVxoWNREIlDO5+R
         LQfaWWz/dDY6sguWIVm+Z+e82sxal0HbOZLI1aX4jrqXGxpgater+HQArQud2kujt21H
         F0hC1eocxKDip/p4SuVZe9twM1UF43yMhs0SvoUK0q4ug+oBKHe7MBX3CGT4KrWfLU9f
         BGEQ==
X-Gm-Message-State: AOJu0YyaxOwmLunxCos4D30+b401Qfc1XtPYLP+5AyL21H1l37HHajSS
	dsimlYp0ur1XlmPvS0rMsQIZs51898lECMmurF2RtMg1JCaWJz4VHLWFKqxfWB9turE=
X-Gm-Gg: AY/fxX57SfXWQhXQweuXYpeqWh9J5fN6rI9l/9nbJZoi3BM1NcPQ/8gr49Lwk4NIK6w
	xv705MjOMBCkBVwt7x5Uy8bEs5yuIivw6ooiEDp1DCzuNio0co4mzKGoBT+dmNKbn2+z1sv/qHN
	uVW0eHQ/UoYxUpQa8AV62fvgMirJDc+qzQzNGHyssJ5Dn2GIk3nX6sPXmxGC78TauX6L52roGXU
	JzJsUYApwIHM0koQ90XdZxgy0H30HYVuNzJmqprZrq7iSUl+hUBoUoJTynlgFZoAjp79dV0iJty
	3XtJ9mZ2XMc6gKy29nms7zbsmRBIdWqhXbO5tkmoHiE2Jrnoule8ZSI85DGifARt4uiKof8GuX5
	LP7xddgfGi+sO6Wi6klTM5qQ5N3jbfG6V/VTwcI6Z3d/fxEFV3LqLFtAZdZ2xqKVQxwWmyMr/nw
	GSyi1mCIOcxeymhAeG1Lp8H0jh7mIdIdByf2nOiwDl4eG+dKW6BAjgoWJZd1chSa2wbrH7KOk=
X-Google-Smtp-Source: AGHT+IFikXsVkw1KI2YjAmC95rkLSdnLG39ysCcXC/8BnDLCqMmbEe8tvaE0EES2keKY5DTkdeDKQg==
X-Received: by 2002:a05:6870:a686:b0:3e8:8e57:a7a9 with SMTP id 586e51a60fabf-3ffc0c3ef10mr9626390fac.52.1768251967870;
        Mon, 12 Jan 2026 13:06:07 -0800 (PST)
Received: from [192.168.1.9] (c-73-169-9-114.hsd1.co.comcast.net. [73.169.9.114])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa4de539bsm12509208fac.4.2026.01.12.13.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 13:06:07 -0800 (PST)
Message-ID: <16a7dbd0-b8eb-48a7-95d6-25cd3a8d446e@elder-tomes.com>
Date: Mon, 12 Jan 2026 14:06:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] image_types.bbclass: make fsck optional
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <585429b3-5763-4c61-97ae-2c73266c887d@elder-tomes.com>
 <C7184CF3-DBB2-4AE3-AACF-875B74E60632@arm.com>
From: Levi Shafter <levi.shafter@elder-tomes.com>
In-Reply-To: <C7184CF3-DBB2-4AE3-AACF-875B74E60632@arm.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 21:35:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229220

Hi again Ross,

After doing some more testing after eliminating image delta caused by
differing timestamps, etc. (detailed in the bug report) as well as
reviewing the YPS 2024.12 video, it seems there is further
non-determinism caused by the fsck command.

While it may be possible to eliminate the delta caused by running the
fsck command while also being able to keep it, to my knowledge, nobody
has been able to document this thus far. It could be a time-consuming
process. While the video you mentioned suggests completely removing the
use of fsck, I would argue this patch represents an improvement which
retains the default for those who have a use case which favors avoiding
a reboot on the target while also providing an option for those who
would prioritize reproducibility.

Let me know if you might have some ideas for retaining reproducible
builds while keeping the fsck. I'm unsure why additional delta is
observed beyond timestamps data, and I'd love to investigate further,
but I'm not sure it's something I can dive deeper into at this time.



On 1/9/26 10:03, Ross Burton wrote:
> On 31 Dec 2025, at 22:52, Levi Shafter via lists.openembedded.org <levi.shafter=elder-tomes.com@lists.openembedded.org> wrote:
>>
>> The fsck in oe_mkext234fs() was added to prevent an extra reboot on the
>> target:
>>
>> https://git.openembedded.org/openembedded-core/commit/?id=a93d0059341
>>
>> This has the side effect of increasing delta between images which
>> prevents reproducibility. In many cases, the added security provided by
>> image reproducibility is worth the extra reboot upon first booting the
>> target. The use of fsck should be included by default, but left
>> configurable.
>>
>> [YOCTO #16110]
> 
> There’s slightly more information in the bug report than here, which links to a video from YPS 2024.12 talking about how fsck will modify timestamps in file systems, so whilst the initial ext4 from mkfs is reproducible, we do a fsck to clear flags and they’re no longer bit-identical.  Is this the only source of non-determinism that you’re observing?
> 
> I don’t think adding an option is the right thing here as you’re swapping one problem (non-reproducible ext4) with another (filesystem dirty, needs a reboot).  As the video shows, we should be passing timestamp information at construction time to avoid this problem. Would you be able to work on a patch to do that instead?
> 
> Thanks,
> Ross


