Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04EC1C36010
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 16:36:55 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.33087.1743352611630037459
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 09:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=L4x4mo7e;
 spf=pass (domain: baylibre.com, ip: 209.85.219.47, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e91d323346so40878536d6.1
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 09:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743352610; x=1743957410; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v1fhbcl7MuMXXc2W/MqV/czYLOWr4oBAvZd9L3VoNRU=;
        b=L4x4mo7edYiqvPkOKsT/6pZNinltKfb8dO8mJj3yzGgBWmpDMdryw8wYEtpum1tknc
         exJArtd5fxOXUBFOn0p6KaOw+YcHHWkSDF+MJRhONJoCLpdY2F6y20cvDYsDHHpEqrVI
         nLpm28ApsgR2xn5/8KPPsSmNcYEXqEtL5WYb8HS/GOs6RR/flbR8S7Eo6EBYnpoLF2wE
         WHFNO07rHYUykMxcO902cnvKlMDgAXC3CFpH7q/1H39FDWWVvaKI0vwxJYiGnBSYdRTr
         kpMO4RQv+kmP6fFE+9aJBU9QB+kVhtlKoBt8CYLfKV655uvQoWAGHqdQz3F/YR0hc6eX
         QOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743352610; x=1743957410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1fhbcl7MuMXXc2W/MqV/czYLOWr4oBAvZd9L3VoNRU=;
        b=m8V0tQ3FRRoVIi7C6oLejWScbmf3OehtJdGXJ+ZIvN5Pr6uiGrm9vEtaHJHtwgJdrJ
         rZYdVqbQNzc1G0tuUK6u+l4lhDoqk5r7OgPp3rY3Cw2A+hwq1owcgzSjbRWY56fOljP3
         iXhl8p3hZzfGCAIxTxDNgkPi5od7wVQAwQQYYOKG6R6veFomjEHXmYbJ+dOdhOcDOGmp
         KrzqrgUnVlJ6vznLrmIni/IVYxN98mdsjt86HqQFn8v3z5BwHLFFzfHW1vYQrXKNLicW
         XiJQ3rMP5b8g+2f5fIj4AZaLqt6paAZTR201G+EYLDptgw90e5sJckpuW2mAs3/CDUHD
         OMxw==
X-Gm-Message-State: AOJu0YwO/dfeiu+X2U2A7h7JcrA6XpfmEmfBmJm2LveV4ouxPkX+0CLT
	YOJbZOnYv0Yhf+D4eGm/Cvnh2rs3B+Y6NvgU2YXG/EdPKjOfMjkS/zRwe8DasKc=
X-Gm-Gg: ASbGncsQuhoRYidOU3aYPf3IU0DrX7hbT6SdJhNukWpr3FOw0oDZGmp0Mjrj1ReT64Q
	E2yiLVLLtb+NcpMRaf6kZNX/rdhD+8GuS3Hbs2al9YM/0Ap4jhCSWDdKJaP1K6mHtEwMxgMRVsc
	Fw7ef80VQLolfd/mUxX5rqhvJ9Z6XneNfWIZ2YvGVxPeLxrpmj6b9WcRGqN2QbPhYb+isqvDlej
	R+pGgl1wAdYirQ5xn2jdile/GOjr4itHg3oS6hZjyzbn+pbBqi5b/TIzDDHIB+jKBZzVw1ytpgJ
	Mgi4AA0MpwzR79OH8rwfFcuwlKO975mrHFtsLvAUXq3CYGUrGfFaNZCCckvHyVXZ1NLMVPDvow5
	hKuLiKFo9tXef
X-Google-Smtp-Source: AGHT+IFg04l043ZyO66S4falWICRURO5WcoGjtxuebrQT329l1aQ45u2AKkEYOyK5MiYtCUvBViWng==
X-Received: by 2002:a05:6214:248c:b0:6d9:ac3:e730 with SMTP id 6a1803df08f44-6eecb8690b3mr171067226d6.5.1743352610644;
        Sun, 30 Mar 2025 09:36:50 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f7766b84sm380035885a.87.2025.03.30.09.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 09:36:50 -0700 (PDT)
Message-ID: <4831ec28-9c53-4b0b-ba6a-e7571c2f93ef@baylibre.com>
Date: Sun, 30 Mar 2025 12:36:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] python3-breathe: new recipe version 4.36.0
To: jan.vermaete@gmail.com,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20250330101938.2634400-1-jan.vermaete@gmail.com>
 <dbaeb44938c460c2a14c388ac9807476684e140c.camel@linuxfoundation.org>
 <CABF_=ygQUzCs0m+4NXF_fGVFcEnabAf7dk4+ofARuPBiumY27g@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CABF_=ygQUzCs0m+4NXF_fGVFcEnabAf7dk4+ofARuPBiumY27g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 16:36:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213920


On 2025-03-30 10:31, Jan Vermaete via lists.openembedded.org wrote:
> Hi Richard,
>
> I thought because python3-breath and python3-exhale are closely
> related to python3-sphinx.  And that one is in oe-core.

If they aren't required by anything in oe-core but extend sphinx's 
capabilities, then it's probably fine to put them in the meta-python 
layer instead.

If you're adding new recipes, you should also be specifying yourself as 
the maintainer for them in this file:

meta/conf/distro/include/maintainers.inc

>
> On Sun, Mar 30, 2025 at 4:00 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Sun, 2025-03-30 at 12:19 +0200, Jan Vermaete via lists.openembedded.org wrote:
>>> Breathe is a Sphinx plugin providing beautifully integrated Doxygen output in your user-facing documentation
>>>
>>> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
>>> ---
>>>   .../distro/include/ptest-packagelists.inc     |  1 +
>>>   .../python/python3-breathe/run-ptest          |  3 +++
>>>   .../python/python3-breathe_4.36.0.bb          | 22 +++++++++++++++++++
>>>   3 files changed, 26 insertions(+)
>>>   create mode 100644 meta/recipes-devtools/python/python3-breathe/run-ptest
>>>   create mode 100644 meta/recipes-devtools/python/python3-breathe_4.36.0.bb
>> A key question is whether this is needed in OE-Core? Are there recipes
>> in core that are going to need to depend upon this soon? Or is there
>> some other reason we need it here rather than in some other layer?
>>
>> Cheers,
>>
>> Richard
>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213919): https://lists.openembedded.org/g/openembedded-core/message/213919
> Mute This Topic: https://lists.openembedded.org/mt/111984549/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

