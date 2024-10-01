Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F78CCE837A
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 13:04:20 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.81104.1727787852124131840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 06:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=vGOnwvGx;
 spf=pass (domain: baylibre.com, ip: 209.85.160.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4582fb3822eso41516361cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 06:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727787851; x=1728392651; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+EfON5TtElLCcWOwEJ3a5tDwio2UTO2DU4Jr1+gmBXo=;
        b=vGOnwvGxP8+doHNruYyi8jAmZ6zC5+q8ChAcI/rrp8k2y5llKsUCTiyv/HzmjiT9Fm
         GOSHD/6BUh6oT2BYtRyWfCL8lkdyVJp91a6Hqrsug71ukv/gNAjQzqq5BFreVXOgl9HJ
         +djweK0PQOF9nJnLfSblidBt23k05mkYefzYA5njUbxtGUWaLEckb8dj/h8UItsah9o7
         t+78teXO1SASZrsKEjcYWNK0BIqpM8dGg6obx+REEGFNTtE90S5ozixxWWk1bWm1noaZ
         oJdM5nkmoJktzf5K2h6/NPY2M6VIsNHqs2bIp86xo3nl4Qbc5/OaDR7iwIwgidxPRb8U
         eKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727787851; x=1728392651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+EfON5TtElLCcWOwEJ3a5tDwio2UTO2DU4Jr1+gmBXo=;
        b=N2TTtpk2kacVMz8qsXFO5oSd7/8+01QbDGZZUuNsEVUwoIhAtHgPLtbzaGVBUznZYJ
         S/MfwZWa7I5zalJZJQMYWNRrYS2HB8CXNcAB+e8tlb6g32uXMus8hHqWSezVp0kG5X8V
         T4R9GvlrwkFTQvKZgkB2Ky2UkniHhxZbXqkErBy5AvutBIH7qotdHyF4P798mYWUb8TY
         PabQBGP8bN+Voakm4bluU9ws2bc2pOx13gp23mGTTHKSlWFheRwqcGW1CUgNKIaswGgy
         QNUxs8951ezNIjZitDH/sXFBGOFV+3x4903wZP3zJOFcN6ye+JgeyXAtgkPFjOF8PQaS
         Hkcw==
X-Forwarded-Encrypted: i=1; AJvYcCXbZWAYcAIRbmbZ6pDM71VsEhZE2P0UyhyyiDiQ/ovWfOHuyo2xrWIH8WMHxlLw9RZ8FyH9Kg41kdMD3Pm5ItY40A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzGgL7uNQs9w6/nHWLcTWMSlR3CcrAlTBJAUnQc8h99pWeZVxKQ
	3FJMyfw6EU5hUyRHkc8pf3x98zBy0H2v0NRls2KT46BuwLvpm6RsEtGgDfVmulw=
X-Google-Smtp-Source: AGHT+IFDsSq6Yift0E3oMtuS2X+tbNwuQLWcQfIOveO8kkzKyGruI7B05t87N5qloBX2arG8Nd2obw==
X-Received: by 2002:a05:622a:2ca:b0:458:2fe1:943d with SMTP id d75a77b69052e-45c9f2a6885mr187045341cf.49.1727787851005;
        Tue, 01 Oct 2024 06:04:11 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45c9f2bd61bsm45402811cf.35.2024.10.01.06.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 06:04:10 -0700 (PDT)
Message-ID: <290d3e1a-5b7e-427e-9685-5752aa73aa5c@baylibre.com>
Date: Tue, 1 Oct 2024 09:04:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 6/6] patchtest: use black to format libraries
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Ross Burton <Ross.Burton@arm.com>, tim.orling@konsulko.com
References: <20240924115503.1599651-1-tgamblin@baylibre.com>
 <20240924115503.1599651-7-tgamblin@baylibre.com>
 <87ee2add3b3814aa41f6e0b6758dee068a1ab54f.camel@linuxfoundation.org>
 <776f425a-eed8-4611-8c90-d79a2b56703f@baylibre.com>
 <183aa1235ab723f21f16c54d395e773fe4153c5d.camel@linuxfoundation.org>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <183aa1235ab723f21f16c54d395e773fe4153c5d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 13:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205164


On 2024-10-01 08:56, Richard Purdie wrote:
> On Tue, 2024-10-01 at 08:47 -0400, Trevor Gamblin wrote:
>> On 2024-10-01 07:45, Richard Purdie wrote:
>>> On Tue, 2024-09-24 at 07:55 -0400, Trevor Gamblin via lists.openembedded.org wrote:
>>>> Black makes things easier to read.
>>>>
>>>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>>>> ---
>>>>    meta/lib/patchtest/mbox.py                    |  44 +++---
>>>>    meta/lib/patchtest/patchtest_parser.py        | 106 ++++++++-----
>>>>    meta/lib/patchtest/patchtest_patterns.py      |  84 ++++++----
>>>>    meta/lib/patchtest/repo.py                    |  32 ++--
>>>>    meta/lib/patchtest/selftest/selftest          |  92 ++++++++---
>>>>    meta/lib/patchtest/tests/base.py              |  86 ++++++-----
>>>>    meta/lib/patchtest/tests/test_mbox.py         | 144 +++++++++++++-----
>>>>    meta/lib/patchtest/tests/test_metadata.py     |  94 ++++++++----
>>>>    meta/lib/patchtest/tests/test_patch.py        |  39 +++--
>>>>    .../lib/patchtest/tests/test_python_pylint.py |  45 ++++--
>>>>    scripts/patchtest                             | 113 +++++++++-----
>>>>    scripts/patchtest-get-branch                  |  54 ++++---
>>>>    scripts/patchtest-send-results                |  66 +++++---
>>>>    13 files changed, 660 insertions(+), 339 deletions(-)
>>> I'm a bit nervous about this change for a few reasons. Firstly, it sets
>>> a precedent where others will want to do this on other areas of the
>>> code and I'm not sure we really want to do that.
>>>
>>> black is quite opinionated and I don't agree with everything it is
>>> changing. Some of the code does look more readable before it made
>>> changes compared to the end result, particularly around how it is
>>> choosing to line wrap the code. Some of the changes are also just
>>> rearranging things for little gain such as changing quoting characters.
>>>
>>> I'm therefore in two minds of this. I do want to empower people to
>>> maintain code but I don't want to end up forced into taking style
>>> changes I really don't agree with :/.
>> I agree that it may lead to a rush of reformatting efforts that aren't
>> desired. We certainly don't have to take this patch now if you don't
>> want to, although the more minor changes (e.g. the quotations) were
>> actually a bigger part of the draw for me when I ran it.
>>
>> On the other hand, some experience with using checkpatch.pl in the
>> kernel has me wondering if we should be considering standardizing our
>> formats for Python scripts and modules (over time) anyway. I have no
>> strong preference on which formatter would be best (to be honest, I
>> haven't even tried the others like YAPF or Ruff). Black, however, seems
>> to be the one recommended most, and though it's opinionated it helps
>> keep things consistent (the example above where the string quoting was
>> sometimes single and sometimes double drove me nuts every time I looked
>> at it).
>>
>> Is this a reasonable goal for some distant release? I've CC'd Ross and
>> Tim since they're also doing some Python work. I might bring it up at
>> the weekly today.
> Seemingly simple formatting changes have been some of the more
> contentious issues in the past. The churn such patches introduce make
> history difficult to read and make LTS maintanenace hard as patches
> become hard to backport. I've "lived" through the discussion multiple
> times in one format or another and I'm still not convinced that
> adopting hard "rules" around format X or Y is a great idea.
>
> We have been adopting a rough standardisation of things slowly over
> time as code gets updated but it doesn't extend to the quotes or line
> wrapping as there were other bigger problems. I'm not against doing
> that as we update code but I'm not sure I'm convinced about block
> formatting changes like this patch.
>
> If there was a specific issue like the quoting, I'd in many ways prefer
> to fix that in a specific patch rather than have multiple formatting
> changes all mixed together. Our metadata quoting really doesn't help
> things there :/. Different people are triggered by different issues, I
> know personally quoting bothers much much less that function parameter
> white spacing.
>
> I worry this is a topic where there is no right answer too :/

Let's just drop it then, since Alex has raised an objection too. I'll 
submit another one to fix the quoting at some point soon.

- Trevor

>
> Cheers,
>
> Richard
>
>
>
>
>
>
>
>
>
>

