Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F21BF483D8
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 17:23:19 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.690.1774286590551347838
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 10:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ccLjTpgZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so29356925e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 10:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774286589; x=1774891389; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m14678NVkDz9R7GfG16Yar7U/WdEf6ya7c5wVZanmQU=;
        b=ccLjTpgZqZS2l6lZ4F7iVLhwg1Hm+Ab8SKvUJciyn+Y9zZVk0B3nBYlJ3YlMZaZtN0
         pRY0frIDQREyfwy6Ig1ITry5x839A4olVVjT1oug/bjje18SJLTpKrnnhzqFQqAuNx0R
         FUY3HrlFShIuOjpGUco2VcYzUCMyfQk7/Fk1rAdrQgooNHZEj409oZ04ko+jcAPHdmtW
         /Dr7FkfbUm7XHFx/3AKbZz3ZBY82bj6hhKRPlnQH1A27grXxAaFavk3cMgPQ642NaoP8
         tmKudSpfexO8JjaT6womRxPQ6MGjJVfbAygECmI9B1T1s/FffxDnrRfBW1WR5gH5PAJG
         jykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774286589; x=1774891389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m14678NVkDz9R7GfG16Yar7U/WdEf6ya7c5wVZanmQU=;
        b=FrmNN/KZIXkxNQb8Cqoj4aKSCao1yU6c/zuYxjusu4v2uUULIWHIx386MIBzOMBR6O
         u6TGM3HXT3pSymmeLt4h8m1nMoA9VShK4WhgzDUrszicwJctzyS/CKo/qNGw3NfjWgdX
         2dpu1wDT8fk57LbhGK8OsxeBsUQY03E6MoL8UXGWBam7SAOt2S7hFV48C9/h8yspQzy/
         7G+p9wPPAJV8lSENLqjbpMLhmaxmPCQyaZz32ezfxhUTgrIuIdjS9vUH9uSBqfrPSEnC
         XjbCyujYrksK/YEKBd9isfQmIjICFz1OoVSZXN+4jClYAo3E+ADNaDOTEAc0v+AmGKOY
         o/sA==
X-Forwarded-Encrypted: i=1; AJvYcCUknkc1bzkEPJye4a2uJ8HHB9ngbaGFYwzxe5HEytFtvCVnzTYiFzTHcd2EqwWIQr440lwvmslSReFGZF0/dTlTtA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw+4OM4O77lF/Cu21hLuwBvbEJvx4HRZtXsuaCcGa1pJ5Pk2SoY
	q8YtQzDiqshMyAII+vHvmJNMrs2gfzGNXZcox3T13alKFf029PqvsThx
X-Gm-Gg: ATEYQzzgIcbyqrFLnnzfnYLxjSOURzSUCpC+nFkvdRp5bdZMizHdO7G0QpsFQLLhNYP
	GRNS0gWb7dW+U8ms8z/G39TjalKZEUQaqdS4BUFa7RM2qhkTHWA4n4byMciqMaR/DmwkWP4GeRx
	7RKrlmjjWni3ob8yKDAT8jXTufhtVAcoVTHEMoVBzPcN4VAjVzmSz/tlng3MvBUHUApfx5OoxeD
	NtDWLRv5M2k0Ff8ANm3ZEXVeKmhJ9mElL9uyGWWHMXIlh3DIZJqB7J1ikwKMMVjWr7ZlNKrxYFK
	yH4vecm6HxXr21LJFH4pbUX3hCIyR/NHvnFiZjBoib5KFBvFqCGz6pkW3InbwJsId0aKx9TadaW
	eOrruL4jmNIXf13KDfEiYN7gLW6VyDOOsedDr+CrmnkB/8VovpErcuqdJpRdVXyg+OA2E1Gw4UN
	pGZ4/XyZuBwPHyDAMIX31DIbZu0Xp2v2Gp9LFApdCsr7YjuOp9oagI+A4=
X-Received: by 2002:a05:600c:468b:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-486feb5f9c1mr193072745e9.0.1774286588623;
        Mon, 23 Mar 2026 10:23:08 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe880c21sm89332375e9.8.2026.03.23.10.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 10:23:08 -0700 (PDT)
Message-ID: <bed42cad-f7a3-4c1b-88b1-cfdf901dee81@gmail.com>
Date: Mon, 23 Mar 2026 18:23:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] python3: Add a new PACKAGECONFIG knob for
 free threading
To: Trevor Gamblin <tgamblin@baylibre.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
 "Zoltan Boszormenyi via lists.openembedded.org"
 <zboszor=gmail.com@lists.openembedded.org>,
 openembedded-core@lists.openembedded.org
References: <20260312120024.3745232-1-zboszor@gmail.com>
 <CAMRc=MeFZMGjW-KXngLwq3kjbA9ic4KaOaPjhPd4Be0DMJ+yTg@mail.gmail.com>
 <c0ef676d-27c6-4db4-9fa0-06a78c38954e@gmail.com>
 <CAMRc=Mfa8R1=eVdHdw1pZL5n33nd+nWvR99=9Qh3fZwTdo24kw@mail.gmail.com>
 <c59c3cf6-1cb1-42c9-8155-ecc28dab2ae0@gmail.com>
 <CANNYZj-Z3TKK9RTas0dnn__fvoo+-jP8SRjjLzhKBghR7NiWWQ@mail.gmail.com>
 <d8c59726-e8b9-4dc2-9bf9-48b0647d10dc@gmail.com>
 <d33eccff-ac69-4eb2-9204-086ef9f864a5@baylibre.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <d33eccff-ac69-4eb2-9204-086ef9f864a5@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 17:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233751

2026. 03. 23. 16:03 keltezéssel, Trevor Gamblin írta:
>
> On 2026-03-23 10:52, Zoltan Boszormenyi via lists.openembedded.org wrote:
>> 2026. 03. 23. 15:47 keltezéssel, Alexander Kanavin írta:
>>> On Mon, 23 Mar 2026 at 15:40, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>>>> I also see other issues popping up, first in python3-installer-native.
>>>>
>>>> Probably this setting ("python-freethreading") should be a
>>>> DISTRO_FEATURE and then the python3 recipe would use that
>>>> to enable its PACKAGECONFIG.
>>>>
>>>> PYTHON_DIR in python-dir.bbclass should also be set accordingly.
>>> In patch review it was suggested that we should actually have two
>>> co-installable recipes, rather than an exclusive choice between.
>>
>> Which implies doubling every python3-* recipes, too.
>
> I think that should only be for python3 packages which actually have binary builds.

Not just those. Script-only modules won't be found either
by one build in the the other build's site-packages.

> For example, python3-setuptools should still be fine, but python3-pyyaml would also need 
> threading enabled for the recipe.
>
> Unfortunately that means this gets even more complicated.
>
> We may need to come up with a couple of new variables and/or a class for threaded builds 
> to make the threaded versions work.
>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#233742): 
>> https://lists.openembedded.org/g/openembedded-core/message/233742
>> Mute This Topic: https://lists.openembedded.org/mt/118277380/7611679
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub 
>> [tgamblin@baylibre.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


