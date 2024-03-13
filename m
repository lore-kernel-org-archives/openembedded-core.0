Return-Path: <yannickrodriguez22@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06777C54E60
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 20:23:49 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.6452.1710361426919019306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 13:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qh/7IcgS;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: yannickrodriguez22@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33e285a33bdso112584f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 13:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710361425; x=1710966225; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FMUQyUCV7Ll5DCFr9N8jWwuB6CofeDcrdY/fWobxbnQ=;
        b=Qh/7IcgSUaijABg1Oo1uOByxGIEwrPKxQSNnvS90xd4HBb7y+iCvhEEUrjf+ubnnzS
         WL7LOZbWDCGm0V+Xkd9v6q0C+Y3Ut92xOWVPCV1BBY9U78LVLpll3cLUMS8/4J9VVb+K
         5iYU2qhzjcrlwmJqDK9F9Ac+e3WA1NYYMC6fZMlC9tde5MuqNPRtX/xiSHDRfVGnDERE
         ZLQIsxi1BIp6u2mkMaAGR3Pro0rhPcCz2Kxx7MwV2obtjQYvUQLjwQN9AzQCTpELdx7f
         e3gBzoD3Fc8akirmFqojSUB8Kqon9RunY9zLq3hzdGfvFIL/qhK9lOsm81lR0QAgfvw/
         pamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710361425; x=1710966225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FMUQyUCV7Ll5DCFr9N8jWwuB6CofeDcrdY/fWobxbnQ=;
        b=TQl+wizIVw++hKHpXr/FOL2jxj+R182aMnbPTeV6hKxPxrb1Wmray0hKxJhwqrqtKF
         4YrAdTbaHcow7Sa+HfB+CXHAzH9a5v/VDlcq/Hmqvx+AskZqp9UzL/7+NTg+mO6yhmXA
         8yU9jqs/xKOv+CXYHn5jQa2VFIerRIEuOaAFyGfdn1u7ZFfrP3yAdfuI0OewSRTiJC6z
         Itw24qFrVSf4b0mJxUjKAmsJF08UBWfpucq8VzTuTYof6/J+2fluIGWDWv9jLw8kGIhu
         3X1/L8pOYEf4yn18ClDSwpPI0fIPFEfn65NhY/C9YHbyBScm2C5SR+BFllHXuEciEwvL
         hwvw==
X-Forwarded-Encrypted: i=1; AJvYcCXNESdItz/VFYkxDnl9ymdMDyeStpLDtRr8pj56i+WNKUIEg6waFvA5jrtbXp9P5hdKxVxQJK5RhG7axDq1d1YL4tMcdLReAWJ17EUqUvrCAXzt9gZibwVR
X-Gm-Message-State: AOJu0YwEmbVwF1EWDHfLzkBAzA8v3xbljoqxLIAQT3iA9owHtOSSHvo/
	0PKqBgSYNc8n1ehoQFgYBHzVUz7iMvHlgqrrq7MU7AVzmy3UNscczyAlmgkuiFs=
X-Google-Smtp-Source: AGHT+IGq2yDXwQ6juyHsZG+/x80qmZMTeNNHGENQScIUhEOPr5/A/8zIrmaWQ5qv4z814LieyIqS1g==
X-Received: by 2002:adf:f141:0:b0:33d:c217:e8a4 with SMTP id y1-20020adff141000000b0033dc217e8a4mr2458121wro.14.1710361425066;
        Wed, 13 Mar 2024 13:23:45 -0700 (PDT)
Received: from ?IPV6:2a02:8429:bd73:4401:30e5:f181:9886:1ed6? ([2a02:8429:bd73:4401:30e5:f181:9886:1ed6])
        by smtp.gmail.com with ESMTPSA id w9-20020a05600c474900b00412706c3ddasm3315531wmo.18.2024.03.13.13.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 13:23:44 -0700 (PDT)
Message-ID: <8469d2de-fcb0-4e43-bca0-198bd0542e06@gmail.com>
Date: Wed, 13 Mar 2024 21:23:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] linux-firmware : Add firmaware for Intel
 9260 wifi modules.
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 RODRIGUEZ Yannick <y.rodriguez@i2s.fr>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20240313153922.154396-1-y.rodriguez@i2s.fr>
 <9975c0da-0ee6-4de3-98d2-e01afbc1622c@theobroma-systems.com>
 <AM9PR03MB7233FFEDACD5F152CCF19742D02A2@AM9PR03MB7233.eurprd03.prod.outlook.com>
 <77d3a99f-4cf1-4ff4-afa1-81a5c21f7677@theobroma-systems.com>
Content-Language: en-US
From: Yannick Rodriguez <yannickrodriguez22@gmail.com>
In-Reply-To: <77d3a99f-4cf1-4ff4-afa1-81a5c21f7677@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 20:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197081

Hi Quentin ,

Thanks for your help , i'll push v2 then.

Regards

Yannick

On 13/03/2024 17:36, Quentin Schulz wrote:
> Hi Yannick,
>
> On 3/13/24 17:29, RODRIGUEZ Yannick wrote:
>> Hi Quentin,
>>
>> Thanks for your review.
>>
>> Should i resend a patch with the modification your sugest . It's 
>> possible to just amend m'y patch ?
>>
>
> For the bluetooth part of the suggestion, a separate patch would be 
> welcome. Though it's a suggestion, just a "would be nice to have", 
> you're not required per-se to do it for the wifi part to be merged (at 
> least that's my opinion as a contributor).
>
> I think it'd be good to send a new version of the patch with the small 
> changes in the wording in the commit title and commit log, so you 
> don't have to wait for the maintainers to confirm this is a required 
> change.
>
> Don't forget to add the v2 (well it's now v3 technically ;) ) to the 
> patch, c.f. 
> https://docs.yoctoproject.org/contributor-guide/submit-changes.html#taking-patch-review-into-account 
> for how to do it.
>
>> It's m'y first patch.
>>
>
> Congratulations :) Wishing you (and us) many more to come!
>
> https://docs.yoctoproject.org/contributor-guide/index.html should help 
> you get started. If something isn't clear there (or wrong, or 
> misleading, or outdated, etc...), let us know (or send a patch for the 
> documentation :) ).
>
> Cheers,
> Quentin

