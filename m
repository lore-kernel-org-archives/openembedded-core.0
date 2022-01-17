Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5712C433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 08:51:42 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web12.8802.1642409500720755866
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 00:51:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j9akNWHE;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id d3so54754823lfv.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 00:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=siReRxYLmlbp0tHVJEwt/6WoROEm4bsgdHMV+pn1uWY=;
        b=j9akNWHEMnqddv2zOuO5iEf0PL+3yEcqgPddIU6Z5bHmajz0foyJzrDrXcm2YX4L3b
         7L0Nuzltymsrm8OumvPfqvFQ4b7AdRLSoawXHZZOAP8+g2j9ifkZFfEBrt6Jm4niqg3G
         5F95ih/li4QCglOj1WkM69MJr5l5Vs4Qi3em0bP25wOAQ3B7DPWg4kM19uN84+zE4cc+
         cBKZBY6PgvldqwfXZ8+ncinCPYzwIrMFOyviFqagJUwBr/V4SV4hAQWYsuF8nnzOPH4y
         uC4eo8IH3EbYYrxdFBwYDJW41sVdxd4dYimKIdeEeqJS4OAy8mHXm2UfjdFqIA03lzbQ
         Y4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=siReRxYLmlbp0tHVJEwt/6WoROEm4bsgdHMV+pn1uWY=;
        b=mQw0L2T0NRTzPBikzkak/cGJEWWImAd00uZq4WywL6WBRjr/OGeuyEwHQYvSFUarZC
         X5130QgPpTckntJm1iSR4XhbhUPB9V/zzGxTYAcI9igo9qdhOi/u67HEzDZ1SfzXXo7s
         NWakXsujFm89MC8RAy5EosUIN3tGpW5kFGyt5R1A99XYXoMxhec/+UhweZTds/pbzydh
         SSyws66Z+P55RUudDphjecfe13X0OMgPf/aFHH+EvoysDpYhoVXAbgiapzPXFz9OWiwE
         ZFKb+D2TLcFnEV21UpVgS8qTYo2hMuW+/XHLsgNeHar6juypI+dfhvldk0D5t97d0lzK
         Bt6A==
X-Gm-Message-State: AOAM531kPhNxc+ZRZQM74vO5tYIN+Wi4STGHtC5xSX82ecPMMagfwrNF
	HrG45cF0KPnX+UX7ZCCKDe4=
X-Google-Smtp-Source: 
 ABdhPJyERneEUybUk+gYMCwWubQI9AAA/YHmwxKfygsABYN739o1+12Th/6ZG1UfGeZSBLxhAzl5nA==
X-Received: by 2002:a2e:601:: with SMTP id 1mr14517476ljg.442.1642409498577;
        Mon, 17 Jan 2022 00:51:38 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 o10sm588971lft.240.2022.01.17.00.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 00:51:37 -0800 (PST)
Message-ID: <b31977df-c080-fbe4-53db-712772da5426@gmail.com>
Date: Mon, 17 Jan 2022 09:51:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core] [PATCH] sstate: Preserve permissions when extracting
 tar archive
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220114074138.51861-1-jacob.kroon@gmail.com>
 <28618.1642404491183454308@lists.openembedded.org>
 <8165e9492bf778187f6cb6941e5d9f7a87d6fccc.camel@linuxfoundation.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: 
 <8165e9492bf778187f6cb6941e5d9f7a87d6fccc.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 08:51:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160637

On 1/17/22 09:40, Richard Purdie wrote:
> On Sun, 2022-01-16 at 23:28 -0800, Jacob Kroon wrote:
>> Although this is now fixed in master, I was wondering why this doesn't seem to
>> be a problem in dunfell.
>> In dunfell, sstate packages are unpacked with "tar -xvzf", no -p flag, but
>> still
>> my buildhistory doesn't show any noise when doing:
>>
>> bitbake -c cleansstate shadow-native && bitbake shadow-native && bitbake -c
>> clean shadow-native && bitbake shadow-native
>>
>> After dunfell was the switch to tar+zstd, but I don't understand why that
>> would
>> change the extracted permissions.
>>
>> If anyone has got a clue, i'd be interested to know why.
> 
> I think dunfell doesn't have the umask changes I linked to earlier in the
> discussion? That means it will behave differently but there are probably other
> permissions issues e.g. a host with your current umask compared to a host with a
> different one, particularly around the group bits.
> 

Yes, that is true. I'll just leave it at that, thanks for clarifying.

Jacob

