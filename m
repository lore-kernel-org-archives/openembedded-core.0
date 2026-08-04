Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB4BC2A09B
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 03:28:40 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27632.1785880394698004551
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 14:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@elder-tomes-com.20251104.gappssmtp.com header.s=20251104 header.b=W1VdNsOI;
 spf=pass (domain: elder-tomes.com, ip: 209.85.221.177, mailfrom: levi.shafter@elder-tomes.com)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bfc5b77c02so204370e0c.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 14:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=elder-tomes-com.20251104.gappssmtp.com; s=20251104; t=1785880393; x=1786485193; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v8v4y2k/m7TT9w3mtZN5NJYyzhDuGmkGDxIB4uUELAs=;
        b=W1VdNsOIovbOEAilmUv8CV88bNjHwsjdHcLgvA/shRtR9idoWGxgls6HL0Bcmh/msm
         IuOV9IxVCgtGrvSi4NOQyTLxBWlyARcJCZgxR1cCUHzdi+5H1/Q5mbrPM6fiA2wC5GtA
         XLb092jXWMJP91qnNCBK06BME68zTqP4+PCeFWL4KxXTBkzPpuD29rWdCejZW5wvnVwL
         K25ESeUcvM7bh5+e+vhiqeSMyPx22RE7TndJU7Wzqa6AmrfsiqixP8vlcxuedCcgoTYH
         UtAK1el68EYJKfjYYDTrOD5soS+SFE3Xjr/bxzydLv3hdSHHuJfebptsBTW/FRmxp6nq
         Y+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785880393; x=1786485193;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v8v4y2k/m7TT9w3mtZN5NJYyzhDuGmkGDxIB4uUELAs=;
        b=rkjCFUkFh6dmzMYkKUNugl1fVUoG6Gq+jSssxHYZkWrpSEccK1FC8M6PFPTuM90WBH
         /9+ABRpQdxb5TZYsbXethfnZR4KyueQg5kBUAuhHhFgObjj9vkpK6/QC0+792gbZIBnX
         Kl2rGjh55VrKVzcdoKk7RdPo5L3lt/2zX8tt75IM7h99J8rGA8q5XaXZknsoGEQINdFe
         Hn62saaBVoqEP3ohuSqrweAinfjakpJdnEd/Q0Hb5ERXEzF3LWzmyt4gKS9EF7qersO6
         PuXQDlORu/oczPJgVh9Pgn592kgmeLwcnKSG6yxv9wI+tScUHbDlyWdR20GpF5gdYtRX
         zQrQ==
X-Gm-Message-State: AOJu0Yx9/ivGi2tn3LKaOZ7D859UyB/qxOPuWx2nEbItGk5parwS3bXb
	mWGkTztnWvcvNLyLGQhQpURJaJ4KfCmVXAnaCEPjQGNuqkup04MLB89e5+76ZSS2pkGRDr6wbYE
	CbuyO
X-Gm-Gg: AR+sD10fMQgpgo+gKuIftyv7ZpmLupJwqYJ3MG2nUgQZtgQSimFVv9J0CYG+ZISLZgi
	7sJRIgN//hcOH5JLQ8siA6z8MmNdej5NAjOrT7kiV/tj/SiLFSaAqdL5bLhxr5vyYyFBdRjQIRp
	QKsUAepa4rMIZGBHuvZ4zAkIsFuEZ36kXks9DD783kF7i2lJ+Ggvpu3SDpG9Ykune2hzdkl/ZGN
	wytt8sk7CH6Z8yisCcm7La/dHR5aFLlbf4C50iRtupnhS2nqmu8F+9iD9Qu6eLk5cdqnVFXUg9j
	K/u6hlD9UUUjNYKKc+xVvVpb5k4BJ+4pzYKfpyKmSDbOjWru0rPEG69eYbMSxCpOXUM0bEgeJpu
	NdT8Bw4LWPR+pIuziZz2rY34gcN7EX0UNtgzZAOGPDZnr9WKF3ylfZ3H2FFmHe3JGJ5NVFztqR5
	ew5FM2v5bMwwPgzIVC/qRaSV9rBcgsi/cys3JJgc6tbGIdcgxRJjq/6hwGUVC5uB7Q+pPBogqFK
	7Gtpl8ILVq2fnVnpETUxBblROflIIuixLSttYTQ
X-Received: by 2002:a05:6830:2b1e:b0:7e9:e313:4fdb with SMTP id 46e09a7af769-7f1e5c29681mr1643252a34.2.1785879936917;
        Tue, 04 Aug 2026 14:45:36 -0700 (PDT)
Received: from [192.168.0.86] (ip-204-57-18-28.co.bambroadband.net. [204.57.18.28])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df341a8asm1855106a34.10.2026.08.04.14.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 14:45:36 -0700 (PDT)
Message-ID: <66486dfc-0228-496f-bbf8-cb2545904947@elder-tomes.com>
Date: Tue, 4 Aug 2026 15:45:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] image_types.bbclass: make fsck optional
From: Levi Shafter <levi.shafter@elder-tomes.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <585429b3-5763-4c61-97ae-2c73266c887d@elder-tomes.com>
 <C7184CF3-DBB2-4AE3-AACF-875B74E60632@arm.com>
 <16a7dbd0-b8eb-48a7-95d6-25cd3a8d446e@elder-tomes.com>
In-Reply-To: <16a7dbd0-b8eb-48a7-95d6-25cd3a8d446e@elder-tomes.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 03:28:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242810

Hi Ross,

I'd like to bump this patch and ask if you've had a chance to review my
last message. Considering additional delta beyond differences in
timestamp information is observed between builds, do you think a toggle
that allows for a choice between problems represents an improvement
until the path to full reproducibility with the fsck command becomes clear?

Thanks!
- Levi

On 1/12/26 14:06, Levi Shafter wrote:
> Hi again Ross,
> 
> After doing some more testing after eliminating image delta caused by
> differing timestamps, etc. (detailed in the bug report) as well as
> reviewing the YPS 2024.12 video, it seems there is further
> non-determinism caused by the fsck command.
> 
> While it may be possible to eliminate the delta caused by running the
> fsck command while also being able to keep it, to my knowledge, nobody
> has been able to document this thus far. It could be a time-consuming
> process. While the video you mentioned suggests completely removing the
> use of fsck, I would argue this patch represents an improvement which
> retains the default for those who have a use case which favors avoiding
> a reboot on the target while also providing an option for those who
> would prioritize reproducibility.
> 
> Let me know if you might have some ideas for retaining reproducible
> builds while keeping the fsck. I'm unsure why additional delta is
> observed beyond timestamps data, and I'd love to investigate further,
> but I'm not sure it's something I can dive deeper into at this time.
> 
> 
> 
> On 1/9/26 10:03, Ross Burton wrote:
>> On 31 Dec 2025, at 22:52, Levi Shafter via lists.openembedded.org <levi.shafter=elder-tomes.com@lists.openembedded.org> wrote:
>>>
>>> The fsck in oe_mkext234fs() was added to prevent an extra reboot on the
>>> target:
>>>
>>> https://git.openembedded.org/openembedded-core/commit/?id=a93d0059341
>>>
>>> This has the side effect of increasing delta between images which
>>> prevents reproducibility. In many cases, the added security provided by
>>> image reproducibility is worth the extra reboot upon first booting the
>>> target. The use of fsck should be included by default, but left
>>> configurable.
>>>
>>> [YOCTO #16110]
>>
>> There’s slightly more information in the bug report than here, which links to a video from YPS 2024.12 talking about how fsck will modify timestamps in file systems, so whilst the initial ext4 from mkfs is reproducible, we do a fsck to clear flags and they’re no longer bit-identical.  Is this the only source of non-determinism that you’re observing?
>>
>> I don’t think adding an option is the right thing here as you’re swapping one problem (non-reproducible ext4) with another (filesystem dirty, needs a reboot).  As the video shows, we should be passing timestamp information at construction time to avoid this problem. Would you be able to work on a patch to do that instead?
>>
>> Thanks,
>> Ross
> 


