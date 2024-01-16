Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B2DC47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 17:40:06 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.23026.1705426797252314252
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 09:39:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=A1LqE3RA;
 spf=pass (domain: baylibre.com, ip: 209.85.222.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7833bd8be24so421151185a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 09:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1705426796; x=1706031596; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9DSQy6f9euYmchu23veKqT512OZUvfT+eq9D3+qoNrk=;
        b=A1LqE3RAsT5PfCPxtBnXR1AkKP6SZFrOnSX60Tzkl05wTpbLKc1w5a3rmgf30e6D3z
         ZcwMUDE7CWjxT/A+GBS+4hO9iDhvANRyq7h4avy33V7f+xLuill7PRGImsR53XtF+OT7
         lfpyZCtTbQUWa4MbtxpDN18/wltqdxVOp/KewZl2pxvH8MbaGgv9N+XYNtTY5lwUN2HP
         WVVATOE5BNx69rd3th8puC5NJmEE55LWeCbZdi7p7SwdIpBlgG9XllFwzDdb99iI9TOD
         kfDollHL67IX7OBraCye1IhfgCpt6qgfAph7b7qdjxONM6oCO14ZSm3I0qHbGBgtHAMq
         vGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705426796; x=1706031596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9DSQy6f9euYmchu23veKqT512OZUvfT+eq9D3+qoNrk=;
        b=FA+FUpQuZSb3YsUhAXDPi5HGLJcOs8Ig+q43H7hLZFJOeGep5ywh1yEb5AeDblipCi
         1owUkspmy3Bd4fItePs6bKcOfWXsV8b04J/ZCn6n9mHJ+OZVGFltPpisX8xJA8g42XVg
         bXWgAqKkIQ9zsTdYr7s/q+TY99qa8ONdTVaIZNmiy/SafQ0IWeIsg1QvOUzROJrYi7xG
         oG+I3vL/NXXU5Nqce279Dndou4tBr+9nrZ130M7bGnkk6ufD28GgKmp7+lEKtYztkwT4
         gFhuA7dQXd6aA1+hTBZZEm51JCYJpWUQGZEDqVpU0DUywFC5Uoe0CisgOGg8ZqEhXe6f
         ouyQ==
X-Gm-Message-State: AOJu0YwAbgoXzN7+hL6MwcPY/VNi/efYO+C+RFGe8EG7OV2I/DPBksxM
	9mMV9H7C2w35W76mQkMwV+05Q/MArCkoCA==
X-Google-Smtp-Source: AGHT+IHJyAZwzIGrMw9AzXYG0q4aFuKm+yNRXbaveZ8RPUTcbzcutn+jWloBqCRuoQYMDdM9J8pEJw==
X-Received: by 2002:a05:620a:478e:b0:783:2472:e6df with SMTP id dt14-20020a05620a478e00b007832472e6dfmr9696875qkb.40.1705426796101;
        Tue, 16 Jan 2024 09:39:56 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id c16-20020ae9e210000000b0078345bd4d27sm3644366qkc.77.2024.01.16.09.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 09:39:55 -0800 (PST)
Message-ID: <b27c2e41-2a41-49bd-9e40-49b39a535ff6@baylibre.com>
Date: Tue, 16 Jan 2024 12:39:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Patchtest results for [PATCH v2 7/9]
 oeqa/selftest/recipetool: Move create_go test to a proper class
Content-Language: en-US
To: Vyacheslav Yurkov <uvv.mail@gmail.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: patchtest@automation.yoctoproject.org,
 openembedded-core@lists.openembedded.org
References: <0101018d1172d8bd-cd6ef52d-0c3b-4f2e-9b9a-a06b4234da50-000000@us-west-2.amazonses.com>
 <553ec677-73d2-4595-a113-304f269918a5@gmail.com>
 <CANNYZj_T7xfJy51UaB9UVaB_S-ZM=UHNy-7Aqu2akAyd+P4syw@mail.gmail.com>
 <20240116092834f19a1e78@mail.local>
 <CANNYZj90_-6AssGQLxc7tAqT24KDBMB5NPNpsD3g-XLOXc1sGg@mail.gmail.com>
 <cc8df8ea-e8c6-4190-a02e-9ffcbfa7ab0b@gmail.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <cc8df8ea-e8c6-4190-a02e-9ffcbfa7ab0b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 17:40:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193870


On 2024-01-16 05:05, Vyacheslav Yurkov wrote:
> I also have the same opinion. What else am I supposed to write in the 
> body if it were merely a refactoring (function moved, renamed, etc), 
> and it's already described in the hearer?
>
It shouldn't be considered a strict requirement, as it's going to be 
difficult for Patchtest to correctly identify which pages do and don't 
need more explanation.

If you want to completely avoid that feedback, then the solution for now 
is to re-state the shortlog as a one-line commit description.

> Slava
>
> On 16.01.2024 10:32, Alexander Kanavin wrote:
>> Because making it strict would only result in useless noise in the
>> commit logs. It's entirely valid to have changes that can fully be
>> described with a commit header. I see it as a notice to consider if
>> the commit message should be added, at the discretion of both
>> submitter and committer.
>>
>> Alex
>>
>> On Tue, 16 Jan 2024 at 10:28, Alexandre Belloni
>> <alexandre.belloni@bootlin.com> wrote:
>>> On 16/01/2024 10:08:50+0100, Alexander Kanavin wrote:
>>>> No.
>>> Why not?
>>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193848): https://lists.openembedded.org/g/openembedded-core/message/193848
> Mute This Topic: https://lists.openembedded.org/mt/103758512/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

