Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37A3C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 07:42:24 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.1527.1750232542963606687
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 00:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UKlJGvZt;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450cf214200so56553085e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 00:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750232541; x=1750837341; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c6wo+aQPvl+GkfCpd+X+ylInSs/uVKESUT70XoXgmxc=;
        b=UKlJGvZtiLhvpWmLdnMXdGD71b7YE7AZvBUuArfvzzIqGld4QhWzST8VtWrkc6lWIN
         xiIPNS2eMbjtWSsRoz2PcB88TBuIpKKVyF7YFpSQNDNC6VGRtLyXamztQeAjYICScq9j
         F4BrGAUfxQ6llfO9m6a9AUUGua/07vuxFqcDPHi119iBroTsK72lCo9ppTa5CKKmoL1q
         G8nsiSWXdO9rcVaEX6YVl7gHDcoaOY5l8606MN7qLI9otPu9Zjsj7FGFGlROkzOfokiK
         5/jWIn6fGKa+Icv1U4SDaq4BkaWqD2ZuhffE8mUFG28GDvFb613KHQJFCf18G8Nzrej3
         BpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750232541; x=1750837341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6wo+aQPvl+GkfCpd+X+ylInSs/uVKESUT70XoXgmxc=;
        b=RHxPbdX/bonfvOHiZzqyp/Bq1PGXJywcS8SJ8bL0xq+Sl0T5CnTXSwJdArDsnVfdY1
         6lB+pz4kRCZdwuODIK8FuWuUzHKtD7vrayEFFB1JT30R/1zdviAQLRbgNkKE0VsFn9Ja
         EPH/LsNxk4IKPak9Jghn+PXzcnq7OcDS0dYQmdzz2okabBxBsvhl01tgZPBdjET7jHZu
         YDgsT9OaTyXHbk8/dM0UD7TB6jEXnjOz/VEUXIFLPVkfxu4KUNEG0G/lhIg/dkvObtxV
         hcznzbtc2Xl2celiWHEuDikCQny5Up0LQofUU7nzUifovS/BzW0Yx5sFzmO/tF2eVP96
         jbZg==
X-Forwarded-Encrypted: i=1; AJvYcCXD6jH60atmbTTISTBft/0qTXS2GMCjonZSWhpBHhcl2GsygQ9GyfM0c/GOoT/kHYgc5oIMVYOydN+VG9w2bJxxyw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyDSeRtPR5GlryrdUj6I0T4fMQ4ILdQ0mgqf64LScytqz7w5CLl
	ngwkH50bQkU+Y431NOGwmVTCU6Kk9V1Gf38zxwxNzLkb4sFZ9xzbARqH
X-Gm-Gg: ASbGncvujrvt39HwUzl/2/SsIf31ImSfuOlggTXDWtEVleJmbbHP9UYvy+bTj1cLDWx
	GDXSOi1MW/5NNQtw7CblrBJMBh2xbxdycOxCqvXRIRP76CdoGZ/GJKdysjeIo/rq8K2hcBet0DI
	dFYS1SHuN5JJaxEKYG+Ev3eaoK9ynmR/hv4wJwKMV8hs78ZJivyvvZATE2B8fUOAO3tWpgo80KU
	vHsM4mmKXnrDkJwhKLbHvq5eTMJlsTkmc+RJ/4Fh/VSXk0hwZ+jFeYbfHrN06KQUTrygI8Ieu8v
	y5XCBno5spjK+uUu95ktF+MM1afd574HyWxuLlcGXEOeULtrWE9pwUvNrtPbR15W819lMg==
X-Google-Smtp-Source: AGHT+IGAJk8jWDC2OaeovElMoJ98hrvXRHVhnU7ugLEZtMTfK10GEJ9Yd1DGQa9ZpScshCXuWXE/5Q==
X-Received: by 2002:a05:6000:22c7:b0:3a4:f7dd:234b with SMTP id ffacd0b85a97d-3a571896c71mr12389598f8f.0.1750232540456;
        Wed, 18 Jun 2025 00:42:20 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d98sm15971429f8f.7.2025.06.18.00.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 00:42:20 -0700 (PDT)
Message-ID: <47bc64c5-3a95-439a-952a-601114f15f86@gmail.com>
Date: Wed, 18 Jun 2025 09:42:19 +0200
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
 <9470af8d-87e5-40bc-a79d-cddbf58c92ca@gmail.com>
 <af5e4d92-5144-4c26-ac56-423c2fa5286f@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <af5e4d92-5144-4c26-ac56-423c2fa5286f@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 07:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218975

On 6/18/25 09:36, ChenQi wrote:
> On 6/18/25 15:29, Gyorgy Sarvari wrote:
>> On 6/18/25 09:24, ChenQi wrote:
>>> The author's V1 patch bumped PE.
>>> I replied to that patch, asking the author to not bump PE.
>>> My reason is that we'll need to bump PE in later releases too
>>> (walnascar, master) if we bump PE in scarthgap.
>> My main question would be if bumping PE is worse than breaking this
>> recipe in this release. Maybe it is - I just didn't see much discussions
>> over this.
> Luckily, the commit that introduced this issue was not released yet.
>
> poky [2][0] $ git describe --contains 417cecf76b
> fatal: cannot describe '417cecf76b91f58a61e8cc9e4bc57ddda87aac58'
>
> poky [2][0] $ git log --oneline scarthgap-5.0.10..417cecf76b | wc -l
> 31

Oh... indeed. I thought that this was tagged already long ago. Thanks
for this, this does answer my concerns.

> Regards,
> Qi
>
>>> Regards,
>>> Qi
>>>
>>> On 6/18/25 15:08, Gyorgy Sarvari via lists.openembedded.org wrote:
>>>> On 6/17/25 18:04, Steve Sakoman via lists.openembedded.org wrote:
>>>>> From: Savvas Etairidis <setairidis@gmail.com>
>>>>>
>>>>> The recipe was accidentally renamed with a 'v'
>>>>> prefix in 29e623b2ad00555788412fa520fbb9ffec794cbb.
>>>>>
>>>>> Signed-off-by: Savvas Etairidis <setairidis@gmail.com>
>>>>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>>>>> ---
>>>>>    .../systemd/{systemd_v255.21.bb => systemd_255.21.bb}             | 0
>>>>>    1 file changed, 0 insertions(+), 0 deletions(-)
>>>>>    rename meta/recipes-core/systemd/{systemd_v255.21.bb => systemd_255.21.bb} (100%)
>>>>>
>>>> Personally I'm not affected by this issue, and have no problem with this
>>>> patch, but a few weeks ago there were people who were unhappy when a
>>>> similar issue popped up in Walnascar with autoconf (though it was caught
>>>> before merging), which makes me wonder if this is the way to go.
>>>>
>>>> Systemd already has a PE[1], exactly because of the same situation: "v"
>>>> was removed from the start of ${PV} - maybe it's time to bump.
>>>>
>>>> Anyway, as this patch does no harm to me, this is not a complaint
>>>> against it, but I thought it would be worth to mention it at least.
>>>>
>>>> [1]:
>>>> https://git.yoctoproject.org/poky/commit/?id=f95bbe35b2aab929e50471db8ba50781d5027a01
>>>>
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#218970): https://lists.openembedded.org/g/openembedded-core/message/218970
>>>> Mute This Topic: https://lists.openembedded.org/mt/113692551/7304865
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>


