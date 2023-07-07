Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D3CEB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 19:02:05 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.3263.1688756515573505369
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jul 2023 12:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=OmZWXtBe;
 spf=pass (domain: baylibre.com, ip: 209.85.222.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-76728ae3162so203554485a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 12:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688756514; x=1691348514;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0j3KYcRVOUC+rZpQRDD/UbpRhiILKzQHplbiRwzyhMs=;
        b=OmZWXtBeuve0+svsWxYx1CS0UAyPvAC6aGFMvFyi2I/NPuXCwo6bhfu2KVqmsMOBeM
         KWjfp4ac4MSIYwDLjmTlaCXxroX1DVKYQhgQ68EATjp0LJSN5xUaZyecUrUm9Lxoi7ZR
         nZo3UPdvfZuBcwiDUHQAKBRTz/SOX2FUUVMQK1XA/cbf6AUlagQW7dy0mTlV8VgQsGNm
         1Rd7heUGbul706l02YkK8fSsWIrk8yyvazP/KdYMIXS/XVfD7qULrnyZUP0IPXFjKvEo
         CNrC0gKY/9BQxyOn2r0X+Qpe8QpaGl+VU/7BoeKrpzhpMXyQQzkvcJwdicygDbTK9OWS
         xdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688756514; x=1691348514;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0j3KYcRVOUC+rZpQRDD/UbpRhiILKzQHplbiRwzyhMs=;
        b=HMRKjGKjg3jCN8PC37nKw4SYjqcz8q82n/W+loOjt1OoM4HjQSuYsNoB2WL+85BXcm
         SCha0tvAfAo1M/23am2ePcMfj6AIRBnlc4I+uqaSCfP8xBaSrcG1mmjjdkm5PA1NvRgL
         qBh0Np6k/iNyiT0vLjwxxyCZ1KDL5KcttgkW88lF5x7rGAQ37HwjuYVPinHD9w3E/+iJ
         wPc8t5Lz2IMkOkU6n+fOJqRPmkO4I+q173EthOobzJc24RN8YbiPdaVhkbDWVM7kBvqQ
         PSc7r0HRF0RExjiOzi4AvDk67uYIXQnI/vhLS5QyRdbWkdZnKBN8j3NZpKz5sRBhJV76
         JBpg==
X-Gm-Message-State: ABy/qLbaSft4zEuOJNrKIuhsf4QJEfXy9r7HMCt4Th5srB+PAqyTQfAt
	gVDD2Rkb45onXXfrxqqwFO6Hyg==
X-Google-Smtp-Source: APBJJlFaTOSgA83NA8hGysKpAdDCVAVjt7aOpIdro7X/Znm5dVR7f+eyl+EoR19QYktclGf8FqtJWQ==
X-Received: by 2002:a05:620a:248b:b0:767:2d6a:c8f5 with SMTP id i11-20020a05620a248b00b007672d6ac8f5mr7577315qkn.13.1688756514505;
        Fri, 07 Jul 2023 12:01:54 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id x10-20020ae9e90a000000b007654bb4a842sm2085093qkf.104.2023.07.07.12.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 12:01:54 -0700 (PDT)
Message-ID: <74f45e91-2b77-f995-5a64-7034a3aa3ea4@baylibre.com>
Date: Fri, 7 Jul 2023 15:01:52 -0400
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
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj9vYiAWsfmj9Q3_-25jUjiq0iPpVtQvuOJ2AM4p+gp+3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 19:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184016


On 2023-07-07 11:32, Alexander Kanavin wrote:
> On Fri, 7 Jul 2023 at 17:23, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
>> Python prints at the end:
>>
>> 3 tests failed:
>>      test_cgitb test_cppext test_zipapp
>>
>> Perhaps the module could be patched (no sed please :) to also print
>> those as FAIL: lines?
> A better but more involved fix is to have '-m test' write out a junit
> xml with results (it supports that with a command line option), then
> process it into PASS/FAIL printouts. I'm about to head out to see
> Depeche Mode and then two weeks of cabin by the lake thing, so for now
> I'm out of time for this :)
A middle ground that also seems to work is to take this patch but leave 
the pipe to sed in. We still get fixed ptests and a much faster runtime 
that way. What are everyone's thoughts?
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184015): https://lists.openembedded.org/g/openembedded-core/message/184015
> Mute This Topic: https://lists.openembedded.org/mt/100005852/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

