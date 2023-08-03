Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 875A3C41513
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 18:33:12 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.1931.1691087582311676211
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 11:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=gxdz951z;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-76c8dd2ce79so105878385a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 11:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691087581; x=1691692381;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nAOqP8uIbCYhNbplZZ8Z/MtOEX3eaZeNz7vAd3cv7JU=;
        b=gxdz951z5wbPd/BIJ0YLuv1Fa4EWYq4pwtylzUoJhDS58O2u/sfHSf/MwElNYTIRsq
         EyASDkW3gy5w0gcXDQHFnx6gPi3pm8Lp7J35kxkjwKA+7DENNQtmkJISU5K+Hwwf1eVZ
         L48y3jvUlxiajJBopp3VimsOlIL8nHzgm3ck56H7lkivMsKuvSv8TUGRH9Ai0VjWfzH/
         3kgOeOtJCuzlMwOH6QOJHW0LiT43TVm6JuSMzc9TqYCeNZBgERozVpj0fe4Sze4Xv+Gj
         aFCK4RQ8nOzqIVZyhwaUBkkrmKTZK/gUWBZvV5bRRYY4P+MT5B1Befnvcgzw8bMIsoId
         Qeuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691087581; x=1691692381;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nAOqP8uIbCYhNbplZZ8Z/MtOEX3eaZeNz7vAd3cv7JU=;
        b=RIIY+fEe//iYjka7nc+GW24Wvwrtfuo4nhio33knnm3FKIE8TbflPwj5Dcf06NU1jf
         MEEWfG07Rz4P/eX2ODg6mcC44oQHugoviR3y8JcLR48CgOJ1QQ0eLKcGzRniqvQpLLHt
         PatEiw00qvEm/X0l/xSQEMw3ZaCCCLfx2bnM5B/ZtJXs5h4egGoHHbn8OctF0BkycojS
         iYwrICnNmrmOExGMs4PD8t2r7YmZpPrYx/glM+MIiB/hFMkK0TYZGmswUwrvY0ln03hN
         GzrQSP7epAY1gC1cUZfJIUazPcb6M2R90yR8bGnf1q52pAVXRcvEtu3AOC5IIRBHpxVv
         JX+Q==
X-Gm-Message-State: ABy/qLYgaxS4eK4woQiWFs5mkUy9f/GmuHpvQxNwXpzVoYBCyQraGzQR
	GEwyVAynbxGuxp/jPlUokNngFQ==
X-Google-Smtp-Source: APBJJlEH6CjodXPziu2RFwaSnQZHS6P5s4AgEU50cWU1KfKcXxIVbkMpL5DDkxxUlz7mcHM+TvG+PA==
X-Received: by 2002:a05:620a:2545:b0:767:f50e:533 with SMTP id s5-20020a05620a254500b00767f50e0533mr24789542qko.77.1691087581071;
        Thu, 03 Aug 2023 11:33:01 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id j12-20020a37c24c000000b0076cc4610d0asm93849qkm.85.2023.08.03.11.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 11:33:00 -0700 (PDT)
Message-ID: <3b7bfd86-1b55-9ad5-dbf1-734cd82aa748@baylibre.com>
Date: Thu, 3 Aug 2023 14:33:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core][PATCH] python3: add additional timing-related test
 skips
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230803174724.1107094-1-tgamblin@baylibre.com>
 <CANNYZj_hYZmpNRgO-7dKeB=Oo+SJzomJX8t1xvV7WYZr-7OcMA@mail.gmail.com>
 <CANNYZj_z4SyJuSDZMRtotyB=U+483of8+rAmuCJi9y0bUN75MA@mail.gmail.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj_z4SyJuSDZMRtotyB=U+483of8+rAmuCJi9y0bUN75MA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 18:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185493


On 2023-08-03 13:58, Alexander Kanavin wrote:
> On Thu, 3 Aug 2023 at 19:57, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>> But have they, or have we seen them fail once? Both tickets have only
>> one reference each to a failure. I'm not sure we need to disable the
>> tests this quickly.
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=15177
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=15131
> Also, disabling tests still needs upstream tickets to be filed.
>
> Alex

We had discussed disabling both of these tests during the YP Bug Triage 
as they're similar to some other timing/load-dependent tests we've 
disabled before.

I'll keep an eye on the issues and resubmit if/when the failures have 
happened a few more times.


