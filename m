Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C67A010F9308
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 22:48:39 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.657.1774997310182906054
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 15:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=TWY/0WsK;
 spf=pass (domain: essensium.com, ip: 209.85.128.43, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4887d4c6234so14024415e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 15:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1774997308; x=1775602108; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=teit9aywelRh/tx5Ly8LKsU/In094oemV+iiAzrzCgE=;
        b=TWY/0WsKPBkH2X9Q1ZVlT+JISgePvhhfSCDrNPM1jv6i4w0PEX05HEKVHvsd4yIcQW
         FezMgp4qOOqNuUgy8TJ/IpmvV/djPdgC8YUefJ+xHv+cMmkeQbp+Z1vi52VL5zRL8/j6
         V07vvyDnR1fQWcxRDf1ZPJjLmiOZAJ984qL/UwEakuzweYXcys4KgjfS0EBi55BXMi8C
         h2lZSc92bVib1CW/JLCTZuEygIY+gAgRGqcLQCFGBB5myub+Zm9kidN27zUeMg/kfdzS
         Bld8lZ9i5As+lRqtvPOQxf7ZFkKTnBYuVJ3O53aL3BIJjMRgKtQY3Ye6equfOaLde/IV
         QZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774997308; x=1775602108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=teit9aywelRh/tx5Ly8LKsU/In094oemV+iiAzrzCgE=;
        b=UGXiO+3Uac0Gg45KEFNVMxNtVtYkJ9aCt9idCXPhwg9efjbGqSnPCiZPcHwCKfu95r
         vUdiPDDj3ffc41WtgOtnvMuP7rI/578uPmxHiOyXiSMo0pLbtR7r5G6PeiX42EJOnGEP
         XRAoTi9pUNs7lFsi/qqsnqYISJrqeI098ukL/FuYerZTqgbh9N/gD37txZSYUiE/2arv
         20KkGUkyUkbeDpNgSRxG5Q7HIMYYLjnyU+XPltnq1USVIq0HhZuSxAiDbLX4MIYs57cc
         JCEp/lOw6JJ42hIa9Og7VCdmmxBZ0yeDuRLtL/KgyAm5fB5TRpB7G5kJcHIO+qwVn9cQ
         4L+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5ZFtcnzedhTcGO/vvfJqLzuI99Y/1VnXkvZZhie5QG6e6yV496+c3BfxViPTHqCsOZ4ujaMwTZjxx8HKb/wYWng==@lists.openembedded.org
X-Gm-Message-State: AOJu0YydfRwY244lIuyYuAboj0f/i7ffnxNTcLhdU+tX+W1kN/Q6eQze
	7UvLbZhRbcvq6YLO2RWsj96eTx5efIBQFRKySEFodBcgztL2CC3Lh8Di0qbf8IAUVOk=
X-Gm-Gg: ATEYQzy6diUeVDuRsW0n3SkrukiMRT8F87VMK40wUIcO1+Zwq8s3BMb3jNelhcxWDte
	yZqdiojfjFndCURmCXIq3fwbMHw+24p/cXx59oh9nSGbIyJFo0UfBmjtbAb9Q05YOvDzv8fqpA3
	j+f47efU41TvNClLskZC5JvQIezkeNihAUp7D355pUnH011gg3KSWcliaqBvp/Q1PAPVOAeMYii
	8XCW2zKmi8OF4ewa0LVUp18RJPF6PNKoveVhOMDj6+EB6ceZpZO3TyaF2A4wQ5Fo8qRK0CrcG4P
	cCr9Fgm4WqLBW+YJITAqOrl2oa6ZHgNAaWR7hVOO67RZpJkt9QFiQJUrACwvb2SFX4zVvCrIBry
	LkZCS9ikXWHbJ1lp26xNjO2oFxXmmbkkOLQLgyrGFWlRm50KAs8Q6esKtHd9zBnOe/NT7mSQr7v
	ugokesZD0+0w96KI9ao1QuUrAy0rqusd3hGFrlyqYidlVqcmXwu+G6XOos6Gcm+DSVTKpQ4QQaG
	GeolzBQjFD48/9JGvai
X-Received: by 2002:a05:600c:8b4b:b0:485:3fa9:358c with SMTP id 5b1f17b1804b1-4888358c814mr17035615e9.17.1774997308014;
        Tue, 31 Mar 2026 15:48:28 -0700 (PDT)
Received: from ?IPV6:2a02:578:85c6:1101:1ab9:445:1169:11e3? ([2a02:578:85c6:1101:1ab9:445:1169:11e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8d3684sm25237525e9.29.2026.03.31.15.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 15:48:27 -0700 (PDT)
Message-ID: <020a9383-4283-4099-8b74-efc896ff1c3f@mind.be>
Date: Wed, 1 Apr 2026 00:48:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/5 v4] image_types: use IMAGE_FILE_MAXSIZE
 variable to create fixed partition size
To: Mark Hatle <mark.hatle@kernel.crashing.org>, JPEWhacker@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20260329134716.3185469-1-charles-antoine.couret@mind.be>
 <2cae9e645c767894e77f718113f4f4d689f9121e.camel@linuxfoundation.org>
 <8619f67e-d274-4d99-9290-ad36ba61c054@mind.be>
 <CAJdd5GbTvj==_77VaLLNkU69Ti06tw2-8X5jLmzEESZNN6D_Xg@mail.gmail.com>
 <761a6394-36bf-4900-ac23-2253c3d63b01@kernel.crashing.org>
Content-Language: fr-FR
From: Couret Charles-Antoine <charles-antoine.couret@mind.be>
In-Reply-To: <761a6394-36bf-4900-ac23-2253c3d63b01@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 22:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234320

Le 30/03/26 à 18:21, Mark Hatle a écrit :
> On 3/30/26 11:01 AM, Joshua Watt via lists.openembedded.org wrote:
>> On Sun, Mar 29, 2026 at 11:12 AM Charles-Antoine Couret via
>> lists.openembedded.org
>> <charles-antoine.couret=mind.be@lists.openembedded.org> wrote:
>>> What I can suggest is:
>>>
>>> * IMAGE_ROOTFS_MAXSIZE would be used against filesystem sizes, and not
>>> against precomputed rootfs sizes as done today, it's likely not really
>>> relevant to keep current behavior as it. I don't know if we would be
>>> able to customize the value per filesystem type as done in my proposal
>>> or if a global setting is good enough.
>>>
>>> * if IMAGE_ROOTFS_EXTRA_SPACE is set to 0 and IMAGE_OVERHEAD_FACTOR set
>>> to 1.0, don't provide size parameter to mkfs to create a dynamic and
>>> minimal filesystem, to avoid the need to always provide manually extra
>>> margin just for filesystem overhead
>>>
>>> * Then introduce a new variable like IMAGE_ROOTFS_FIXED_SIZE which can
>>> be provided (if set) to mkfs tool to have a fixed partition size
>>> whatever are the other settings related to rootfs size. If unset (by
>>> default), previous logic can be used instead.
>>
>>
>> Perhaps a better option would be some sort of
>> "IMAGE_ROOTFS_ALLOW_GROW" variable that controls if an image can
>> actually grow beyond the IMAGE_ROOTFS_SIZE + overhead amount? The
>> current code basically takes the max of IMAGE_ROOTFS_SIZE & the actual
>> install size to determine the size, but this variable could supress
>> that to make it only look at IMAGE_ROOTFS_SIZE. It could also set
>> IMAGE_ROOTFS_MAXSIZE to the sum for additional checks?
>
> This makes more sense to me.
>
> Looking at the existing variables:
>
>
> IMAGE_ROOTFS_SIZE - Defines the size in Kbytes for the generated image.
>
> Really this is the minimum size, computed with actual filesystem needs.
>
>
> IMAGE_OVERHEAD_FACTOR - Defines a multiplier that the build system 
> applies to the initial image size for cases when the multiplier times 
> the returned disk usage value for the image is greater than the sum 
> of  and IMAGE_ROOTFS_EXTRA_SPACE.
>
>
> IMAGE_ROOTFS_EXTRA_SPACE - Defines additional free disk space created 
> in the image in Kbytes. By default, this variable is set to '0'.
>
>
> IMAGE_ROOTFS_MAXSIZE - (not in the documentation.conf but...) This 
> value is a QA check to ensure that the filesystem does not exceed a 
> specific size after factoring in filesystem size, extra space and 
> overhead factor.
>
> (this should be added to the docs!)
>
>
> Adding an additional boolean of "IMAGE_ROOTFS_ALLOW_GROW" would then 
> allow those variables to be used "as-is" without the automatic 
> growing.  (I would assume existing behavior means ALLOW_GROW = 1 by 
> default.)
>
> As far as I can tell, in this patch set that would mean:
>
> IMAGE_ROOTFS_ALLOW_GROW = "0"
>
> IMAGE_ROOTFS_SIZE = _the_ size of filesystem you want
> IMAGE_ROOTFS_EXTRA_SPACE = "0"
> IMAGE_OVERHEAD_FACTOR = "1"
>
> Then a patch similar to:
>
> def get_rootfs_size(d):
>     import subprocess, oe.utils
>
>     rootfs_alignment = int(d.getVar('IMAGE_ROOTFS_ALIGNMENT'))
>     overhead_factor = float(d.getVar('IMAGE_OVERHEAD_FACTOR'))
>     rootfs_req_size = int(d.getVar('IMAGE_ROOTFS_SIZE'))
>     rootfs_extra_space = eval(d.getVar('IMAGE_ROOTFS_EXTRA_SPACE'))
>     rootfs_maxsize = d.getVar('IMAGE_ROOTFS_MAXSIZE')
>     rootfs_allow_grow = d.getVar('IMAGE_ROOTFS_ALLOW_GROW') or "1"
>     ...
>
>     size_kb = oe.utils.directory_size(d.getVar("IMAGE_ROOTFS")) / 1024
>
>     if rootfs_allow_grow:
>         base_size = size_kb * overhead_factor
>         bb.debug(1, '%f = %d * %f' % (base_size, size_kb, 
> overhead_factor))
>         base_size2 = max(base_size, rootfs_req_size) + rootfs_extra_space
>         bb.debug(1, '%f = max(%f, %d)[%f] + %d' % (base_size2, base_size,
>                  rootfs_req_size, max(base_size, rootfs_req_size),
>                  rootfs_extra_space))
>     else:
>         base_size2 = rootfs_req_size + rootfs_extra_space
>
>     ...
>
> (Maybe allow_grow is a bad name for the boolean, since effectively we 
> want to affirmatively tell the system to ignore the actual files in 
> the filesystem..  So perhaps reversing the boolean to:
>
> IMAGE_ROOTFS_USE_FILE_SIZES  (not sure I like this name any better)
>
> but the overall change is MUCH smaller and easier to fit in and QA 
> with the existing code (as well as document). 

Hi,

I think we would go further because the naming and settings can be 
confusing and the end result is likely not optimal.

As it today, to have the check of maximum rootfs size which works 
properly in all cases, you need to set IMAGE_ROOTFS_SIZE 
and IMAGE_ROOTFS_MAXSIZE to the same value (and IMAGE_OVERHEAD_FACTOR to 
1, IMAGE_ROOTFS_EXTRA_SPACE is already set to 0 by default). From my 
point of view, IMAGE_ROOTFS_SIZE would not be mandatory set to have a 
working behaviour for this sanity check, its purpose is 
different. IMAGE_ROOTFS_MAXSIZE value alone would be enough.


Then, the drawback of this approach is also that in any case your 
filesystem will have this maximum size even when it's not required. I 
know that my initial proposal has this issue as well but I think we can 
have a way to avoid it but this needs a more complex change as I 
suggested above. It would be better to check the file sizes after their 
creation instead of having a check before to be able to have this 
flexibility even if the change would be more important.


Regards,

Charles-Antoine Couret


