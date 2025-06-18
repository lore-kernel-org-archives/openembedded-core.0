Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA019C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 07:29:34 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.1328.1750231764440514342
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 00:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gr/KNQpX;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-451d7b50815so55289855e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 00:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750231763; x=1750836563; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gKbntPSycggcDlpa00/w6ErZHgUHJGrEwfHcdqsTn4k=;
        b=Gr/KNQpXlsO5BaqaLQKbVFz9EAfkZ7ESVhIgb34BjwiYqp8ChDLLUzFhghi610hxVB
         hDlCk/hn9NAoLyjUwUbf5MjF8eS67krFSy+9wp01Ua5cAHTd5FnE6Rj4IWkkETq1TZOG
         EOTJcpgt8dgqN5OrJLNQbzScQWK/Y40fEhMEOoyLGxDc5Ypgvs4y8E3T7LjJfIdx5GKT
         /nwy6y0HIyNDakjFYFLBkXGbhnywQ7OUASe9EqWBX/c35gdLYyFgN4yIr68dEtzf/riz
         k3ItjLDE6vFZhUodJPgqfOfYjeAKkdWSUiZqEHh1YTgpQikHRXixDOdUtFCV/wDCxIFR
         ThzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750231763; x=1750836563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gKbntPSycggcDlpa00/w6ErZHgUHJGrEwfHcdqsTn4k=;
        b=wYVcif9/sBQp7a6HkDUuOsYOixmcmvv+/HeDcpa4LQqrJ5enMY0z+t9BWcmkz3wVw+
         kW7geiSVLEnK68NK9qEhqSOxKySgOZdgbiEL5MD9ZLgHgjJinpe1SH44/19Bq3Tc+zcz
         yHYOrAUGyl2R0N8DPIuuOzYhWFfqJVZzZRKObXBMBVHUjE9lNcH2p8+uzLSShcqP3T/k
         O9RuZjN2HI0teAF/+rvS7ZVyucDyOy4998vvy4hpbQlCaQBfB+TlnGmyezsgz8h2JslM
         JCsSS+ARLKi+fUjc6HHEY2FIQIFguSXsyjGRJ+peo5r6q6tRtueAexdgefMfh+0i7AWK
         nCmw==
X-Forwarded-Encrypted: i=1; AJvYcCW176Skmd9XHK4IZbe2etDRmbB3T3Qy1YS43bDwAaGJgxan0X3IWMMCJHdMWvfnBKOwEY4e9GyZ08kegsJgbyHGIA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwLfPfrf1KUbrB2NXqoQ7gJx5Zhs+PK9XJ73l6D+er7Fnp8i3DX
	RAXLu8tMdsdSlUxcnaMPONaKQuwyoGR6OmkdCGLoeukImhO9zmJTBeCBh+GK2MbS
X-Gm-Gg: ASbGncsnBTANy4N23ZKarjBYe/9vtmN0UN2HQb8xJfgowTzXJAKz0s4ejweEUH0oRjN
	sxBp5Z7lA79A6gpMxAII0ta03/L84Z9hUHjmZX+t3Xdc6VmK+gn8VP3gdFT5KgCShtKE0SEndJt
	X4VgUehP3xXqCC0Bd/NSpgp/Pr0UwYLhHy/J2bosYKzYLkt4OLfP9ZMB4aj28OhWVJiRCMbXReM
	hWCiiNI3zL5CfygbXNj2+ixp/nPp3Y8pd5YPbYN367Ob/4mmFSGJwgGLHU0Gfe8dBw/SzzYIGsj
	7ULv5qWrclijbDKSlTTjDqpSBGUZ46wYTyc/JQh8ZEUuVxAdCco2mjtTCKyMWCXQZbIbqg==
X-Google-Smtp-Source: AGHT+IFkt3snmN+gKRznakxXchII/KDowvq/yRUnrrQWTPPifvWMZ5JMODk+kLW8CGVKeaAoj4XlFA==
X-Received: by 2002:a05:600c:3153:b0:442:f4a3:9388 with SMTP id 5b1f17b1804b1-45350e7c275mr70261835e9.19.1750231762244;
        Wed, 18 Jun 2025 00:29:22 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c4b1sm201976005e9.2.2025.06.18.00.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 00:29:21 -0700 (PDT)
Message-ID: <9470af8d-87e5-40bc-a79d-cddbf58c92ca@gmail.com>
Date: Wed, 18 Jun 2025 09:29:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap 8/8] systemd: Rename systemd_v255.21 to
 systemd_255.21
To: ChenQi <Qi.Chen@windriver.com>, steve@sakoman.com,
 openembedded-core@lists.openembedded.org
References: <cover.1750176125.git.steve@sakoman.com>
 <db02a4cc542d0e7e563ec46c91bf9a7313a71d02.1750176125.git.steve@sakoman.com>
 <3285382b-51c5-4ea2-9784-91267d1180ac@gmail.com>
 <582ab22a-f015-4611-b1d5-3c2c624585a1@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <582ab22a-f015-4611-b1d5-3c2c624585a1@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 07:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218973

On 6/18/25 09:24, ChenQi wrote:
> The author's V1 patch bumped PE.
> I replied to that patch, asking the author to not bump PE.
> My reason is that we'll need to bump PE in later releases too 
> (walnascar, master) if we bump PE in scarthgap.

My main question would be if bumping PE is worse than breaking this
recipe in this release. Maybe it is - I just didn't see much discussions
over this.

>
> Regards,
> Qi
>
> On 6/18/25 15:08, Gyorgy Sarvari via lists.openembedded.org wrote:
>> On 6/17/25 18:04, Steve Sakoman via lists.openembedded.org wrote:
>>> From: Savvas Etairidis <setairidis@gmail.com>
>>>
>>> The recipe was accidentally renamed with a 'v'
>>> prefix in 29e623b2ad00555788412fa520fbb9ffec794cbb.
>>>
>>> Signed-off-by: Savvas Etairidis <setairidis@gmail.com>
>>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>>> ---
>>>   .../systemd/{systemd_v255.21.bb => systemd_255.21.bb}             | 0
>>>   1 file changed, 0 insertions(+), 0 deletions(-)
>>>   rename meta/recipes-core/systemd/{systemd_v255.21.bb => systemd_255.21.bb} (100%)
>>>
>> Personally I'm not affected by this issue, and have no problem with this
>> patch, but a few weeks ago there were people who were unhappy when a
>> similar issue popped up in Walnascar with autoconf (though it was caught
>> before merging), which makes me wonder if this is the way to go.
>>
>> Systemd already has a PE[1], exactly because of the same situation: "v"
>> was removed from the start of ${PV} - maybe it's time to bump.
>>
>> Anyway, as this patch does no harm to me, this is not a complaint
>> against it, but I thought it would be worth to mention it at least.
>>
>> [1]:
>> https://git.yoctoproject.org/poky/commit/?id=f95bbe35b2aab929e50471db8ba50781d5027a01
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#218970): https://lists.openembedded.org/g/openembedded-core/message/218970
>> Mute This Topic: https://lists.openembedded.org/mt/113692551/7304865
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


