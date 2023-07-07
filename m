Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77091EB64DA
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 19:46:05 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.4331.1688759160705648861
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jul 2023 12:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=VvOHE4Np;
 spf=pass (domain: baylibre.com, ip: 209.85.160.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4036507ddadso18428281cf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 12:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688759160; x=1691351160;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6+nJ/79TbB9r78AbLJHxhfVglHXjrAb9Jnvc9HfCC90=;
        b=VvOHE4NpuD2JS8539Vt2bCtbse6brbaD7u32vBBSIhGcdpAgpdQ4FtxHJyhxX3B95j
         m2jexcj+z4nR1O361nuJQMIRr2hlqq53LWHkW9larIduBQMNkVWPKXt8qUZiBjx8YHFM
         eg30yFoIysk7pHwUMRbpZlIn+IkfuiyD9u4Box397HPFnoet11z1v5q88FvJr61zbqes
         p1q9uWcOP/FM/9odfoCPcU29HlwXcpsv8nQkxqooqbDmKcdkhoS/ut6s2ztnrwZ4VU2y
         U1LIwfBbFtLTSytKypSeHM+4PZ2/CXYdIdYe/dHeIUOjktl3Qot3ud+GaMRPvQa1tytL
         6uIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688759160; x=1691351160;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6+nJ/79TbB9r78AbLJHxhfVglHXjrAb9Jnvc9HfCC90=;
        b=SBHyl4CfY0ZKd35LCg8jywF0+GTjWFSnelXOHMqEky/MaeHaQs+fY/ho7CVhF6Htxh
         LsXJeEvHYng0L1kh7Oiv3jiQsoQcZ4DMT97q/DBG4FwvP/DNtym9pRkIrB58h/P7tCC4
         CDYoBksxjOmG0AdVD/b3/cv0xP4vzrJ2ceXvHDpIYpTvhT1YUXrkSX3rkZLyZUmrq3lh
         GqbGJg+snlBBm7eT5YG2eQJtzBcQIeiV6niulj5SaUyJJwOWMSsfRdXx303tjICJ+1lH
         MH5b4o2ZIVoZufvHmnSk/1byw5tTyjgEszcCZhSW8xLwIu4BbauLmXQhZkzthy9TiSP7
         xS9Q==
X-Gm-Message-State: ABy/qLYoTzQ3MgLFK82MCtRCeKJVSFepbYQibtOdVpPK9ApuyydQkYkK
	bM/tFPxPDi7fQ8ZObJf77oV6MQ==
X-Google-Smtp-Source: APBJJlHa9vyf7U1gsG/3ourbi7lEOQtN7XymrGHJfXlfWbiPsiX5X867ocmXW/b73qaLpqLF+4si1Q==
X-Received: by 2002:a05:622a:1910:b0:403:270f:a4a3 with SMTP id w16-20020a05622a191000b00403270fa4a3mr7333414qtc.50.1688759159819;
        Fri, 07 Jul 2023 12:45:59 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id s13-20020ac8758d000000b0040328b5fbe2sm2039494qtq.58.2023.07.07.12.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 12:45:59 -0700 (PDT)
Message-ID: <ac5d0d60-6a48-8aa9-05d9-888763ffefb0@baylibre.com>
Date: Fri, 7 Jul 2023 15:45:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [OE-core] [PATCH] python3: rework ptest handling
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
 Alexander Kanavin <alex@linutronix.de>
References: <20230707132649.3841870-1-alex@linutronix.de>
 <386DC5D1-AEB1-4799-94F5-C999E1DD8C10@arm.com>
 <176F9F2A43D46D21.7961@lists.openembedded.org>
 <CANNYZj9vYiAWsfmj9Q3_-25jUjiq0iPpVtQvuOJ2AM4p+gp+3g@mail.gmail.com>
 <176FAB1AAF8FB18E.3387@lists.openembedded.org>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <176FAB1AAF8FB18E.3387@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 19:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184017


On 2023-07-07 15:01, Trevor Gamblin via lists.openembedded.org wrote:
>
> On 2023-07-07 11:32, Alexander Kanavin wrote:
>> On Fri, 7 Jul 2023 at 17:23, Alexander Kanavin via
>> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
>> wrote:
>>> Python prints at the end:
>>>
>>> 3 tests failed:
>>>      test_cgitb test_cppext test_zipapp
>>>
>>> Perhaps the module could be patched (no sed please :) to also print
>>> those as FAIL: lines?
>> A better but more involved fix is to have '-m test' write out a junit
>> xml with results (it supports that with a command line option), then
>> process it into PASS/FAIL printouts. I'm about to head out to see
>> Depeche Mode and then two weeks of cabin by the lake thing, so for now
>> I'm out of time for this :)
> A middle ground that also seems to work is to take this patch but 
> leave the pipe to sed in. We still get fixed ptests and a much faster 
> runtime that way. What are everyone's thoughts?
FYI I didn't see the junit output option anywhere. Are you referring to 
an extra module?
>>
>> Alex
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184016): https://lists.openembedded.org/g/openembedded-core/message/184016
> Mute This Topic: https://lists.openembedded.org/mt/100005852/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

