Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCA4C77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 12:22:42 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.30571.1683634955407113933
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 05:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=N7zGhfKS;
 spf=pass (domain: baylibre.com, ip: 209.85.128.51, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f423521b10so17881595e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 05:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683634953; x=1686226953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c/q+SpePswmkwUBdU106Q1Q1F0XoNssmJClwMnOgcD8=;
        b=N7zGhfKSk2wMujF+IEEgh7dc2Z2F/81vF8v1PM2c8OfdHPPggZkSLdVKXpmpvJDsgv
         +t8pdWe6FgyUFniDjwfqIAA77xWW12/7wqaUEtCpUfeOiqsMsx+SqsqwWaknM48LWM3I
         8fmEN0u4Eyzk89fH0GX5TvUTDH+I1EpiXghKe123gir9mAHzn/SfIcfaBt4gmPPRSdGI
         LafwvwPdQaUUWHhBZtUOs38/tDVzKMTrQuh4Mxu0nALUueVau4jHHKuV+9aIR2uVhe8f
         NVqvQg/0Dl8ShkQkDJaucFv1wsHRq4SOV6FoXRzKt6OOaV5nF04t0P9XCJDUnD9PsSH8
         FtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683634953; x=1686226953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c/q+SpePswmkwUBdU106Q1Q1F0XoNssmJClwMnOgcD8=;
        b=WzIBMUkMxi0K3Vo0aLO5suMHgmX7ZYe4f9mANqfboyiLVJnNViMWc+kx2L8lhVsrbd
         4K3xO7jzy2c7aar0a8NKrJtC45wLY2PFuzbLR3sdgcvYbuYggL4pnqRMDO8zCt8/0SW0
         +sCRC78+ofjq3YI6S7DiZiwJRHZ9meNmb0WEdXztQTiIyoQdmfZCR+IKQhxipQzGA1pR
         zCFIqJ2pTwnXQpkplC1IiWHzIFHmV1FxK0/vyFnntwacNuG3bCzMHpXwChxDYFcbs1Ny
         rXs0m+mkkcLj+RyC0syizWpRAXW1TqV1ADTWr0dimXIgNYnpggPNAPv/fJNxJtWAdWxN
         V3Hg==
X-Gm-Message-State: AC+VfDycHxQChCTL8GhFPmxXB1LVclVDifTNyJ3waG6Ip6URe9tEYtul
	35MDNiYNCYsWZ2sAup39MuCBLA==
X-Google-Smtp-Source: ACHHUZ7ech1c+EXA4ygoenwlNxRF90h7z7IgyC/1aVJip/N0n1LR1WtoldY3pthgqEQewQs6A+/nmg==
X-Received: by 2002:a1c:7702:0:b0:3f1:81c6:f59a with SMTP id t2-20020a1c7702000000b003f181c6f59amr9336035wmi.4.1683634953697;
        Tue, 09 May 2023 05:22:33 -0700 (PDT)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id u24-20020a7bc058000000b003f173987ec2sm19742200wmc.22.2023.05.09.05.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 05:22:32 -0700 (PDT)
Message-ID: <8bbd7d6c-370d-fc39-1457-f7bf44e8c50d@baylibre.com>
Date: Tue, 9 May 2023 14:22:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [OE-core] [PATCH v4 1/2] oeqa/utils/qemurunner: change the serial
 runner
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Ross Burton <ross.burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "khilman@baylibre.com" <khilman@baylibre.com>
References: <20230411150503.2105880-1-lrannou@baylibre.com>
 <20230411150503.2105880-2-lrannou@baylibre.com>
 <F625F79E-BD48-4A70-BA5F-D5BC13ED39D3@arm.com>
 <1b54d3066cc49b1598ebfc9e2ae287fe9558f869.camel@linuxfoundation.org>
Content-Language: en-US
From: Louis Rannou <lrannou@baylibre.com>
In-Reply-To: <1b54d3066cc49b1598ebfc9e2ae287fe9558f869.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 12:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181039



On 05/05/2023 12:50, Richard Purdie wrote:
> On Fri, 2023-05-05 at 10:32 +0000, Ross Burton wrote:
>> On 11 Apr 2023, at 16:05, Louis Rannou via lists.openembedded.org <lrannou=baylibre.com@lists.openembedded.org> wrote:
>>> Create a new runner run_serial_socket which usage matches the traditional ssh
>>> runner. Its return status is 0 when the command succeeded or 0 when it
>>> failed. If an error is encountered, it raises an Exception.
>>>
>>> The previous serial runner is maintained and marked as deprecated.
>>
>> I absolutely love this because the existing run_serial has the most
>> confusing behaviour. However, we’re now duplicating a large chunk of
>> code: can the old function be implemented such that it calls the new
>> function and adapts the return values?
> 
> This has hovered in the patch queue for that reason. I also love the
> idea of it, it just doesn't feel quite ready.
> 
> I've been hoping we could convert the existing users and be able to
> drop the old function but I'm not managed to see how much work is left
> for that.

My initial idea was indeed to change the former run_serial to use the 
new run_serial_socket. The problem is that run_serial_socket can raise 
exceptions which are not handled by run_serial. It's not possible to 
catch them except if we create a very specific exception to this subject.

About the second question: how much work is left. serial_runner remains in:
- selftest/cases/wic.py
- selftest/cases/imagefeatures.py
- selftest/cases/overlayfs.py
- selftest/cases/runtime_test.py
- utils/dump.py

It seemed to me that fixing those is nos as easy. Further investigation 
is possible, but it would be much more comfortable for me to see the 
first stage validated. I would say this is a pretty good checkpoint for 
saving this work while I try to fix what can be.

Thanks,
Louis

