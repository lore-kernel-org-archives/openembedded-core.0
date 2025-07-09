Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FE1C83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 16:23:55 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.1299.1752078234091075928
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 09:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FngkveDN;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso176418a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 09:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752078233; x=1752683033; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jyQR2qxxypuI0TkjaeK89lnVpcZpAXHL1X3zZ1pWRzA=;
        b=FngkveDNsNCteBiCFZBY7Xwrbvqar02kSpRY6NIhGBBZc5MCfRoLpRq+Df/TAncaja
         dDgixuWhIbYRreUYCdRezaREQsDppTssrXRIjTI9ErJwT+BO9G2RyDr6gPGHyJWUF6pl
         ZD25Cg160u8mikNRRJswUVVSPXU+mmlMxa4t5b/2SfcLymR+tLpE4/Cji/ykC6SjAZRY
         oX1hl2Hl/gFjE1jLIAS9SD+yPgI09GtG9uqRugr6UjYtOb3V843wQch4umEF+axdGXRn
         /cJRqYSlthE35PCZ/T9FRlIgSI1hcDMQdEm3BLSh6YRgsk9qpXi38t+GmHTmqH+BDGqu
         9Bzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752078233; x=1752683033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jyQR2qxxypuI0TkjaeK89lnVpcZpAXHL1X3zZ1pWRzA=;
        b=qRbDB/zMs4hemRE1DQbOY1m68YygJJJO5snAecQ2dnpyPj40zd+Ermx/rrRhdGT3TZ
         rGx6+98tIyLeUWuHjkIMVMzvJfWVubiZMIj1vykZ/lbOJYza6yIbCnc1msP0zesLzlV7
         jlvU7Bea/tky839mmx93V3JSu2Hp1nFpihD7btMVveGd/v7MHgmZ6YOhgKoXkfldtJsX
         sUUMvoCKcT1hSEAkF7oUmFWhLII8/sd8tfDx44KEt7cF/6e1f+cPlR4eEzthEsqThXSW
         D9T+Hqn3g/8a3vpg6fup5tm45dEMt2LVLqHKkw18EVx0XEq4JH7i/4eVH3rOwTzROfmj
         0iqw==
X-Forwarded-Encrypted: i=1; AJvYcCU859t03QrexEIjUbB2M7WLWJLDhIVd3xLuI4uuJ0UsVClRtcfysQlOevf1OYaVxBnQ5AdDf7EjzHYU96ueo/ofxQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxiy/5Zxa+p2zEjmw/QKMHiZgSmdrhxr9a9jKLz2OVC1X2+K1PL
	zud34eOpd3MFSTT3bKPB3ZPJ+jnj/IJ5L+HzJkiv+nGqjkGv3B8nIDgQ7eA0fZw7
X-Gm-Gg: ASbGncttTpOb9fPZrgJ8uEV0rYUUeW+ZBE2NDqNzrZ0r2rwqOYelUOtfTE4n4EIB0Xo
	vpH43m/QeQrl5+wJtBDH0oKSaz6PHuC5jHAiIYFeOu2o6z10E5vwwcgZdKaJf3xADAAnhCyNlv4
	pCs5ZNfI7As1t0ZxvpPGU5MKqDioyFN7PokHz/0SnLpk6jYlBFU6sIh8purPy47TYaQgEiSaTsB
	XRThxiRUY7exF0l3rkwvcJZfj+Bxbd0cuygJzx6FkyuL52AvD2zCr4dGH06fYQnYd+U5zvE+R5G
	XSvE4cEfn4eTR+ZJrrDsQX6Q+/H3LpeCv5JgpNvolzxpUzEnLKHAkVC8RKtITqFcmq0eI56bCEL
	Q7g5VwIyVhAtx7JCTcvRk+TScUTWe8OIvtJSZ2ymtTXHkSIy46g==
X-Google-Smtp-Source: AGHT+IFM616H5FLQyOwm5WwRVm0dkosZWMjQkZQzJU/yrFWiF8oi/UPZJnx8XcyfmRTTPWiFfMCUFw==
X-Received: by 2002:a05:6a21:700c:b0:220:37a7:578f with SMTP id adf61e73a8af0-22cd5a01420mr6660127637.2.1752078233136;
        Wed, 09 Jul 2025 09:23:53 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:d1b7:aad6:2c95:a1d8? ([2601:646:8201:fd20:d1b7:aad6:2c95:a1d8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee479502sm14833562a12.21.2025.07.09.09.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 09:23:52 -0700 (PDT)
Message-ID: <368a2856-e12a-45dc-940b-cfa269a4bc13@gmail.com>
Date: Wed, 9 Jul 2025 09:23:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 6/6] qemuriscv: Dynamically configure qemu
 CPU
To: mark.hatle@kernel.crashing.org, openembedded-core@lists.openembedded.org
References: <1751492664-12569-1-git-send-email-mark.hatle@kernel.crashing.org>
 <1751492664-12569-7-git-send-email-mark.hatle@kernel.crashing.org>
 <84caeee4b92dad27f67c745c63aaafbf9abb6c1b.camel@linuxfoundation.org>
 <a23f5658-d4a8-4ad1-8eb5-924a36d04bad@kernel.crashing.org>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <a23f5658-d4a8-4ad1-8eb5-924a36d04bad@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 16:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220103



On 7/9/25 7:54 AM, Mark Hatle via lists.openembedded.org wrote:
> I will investigate.
> 
> I suspect SOME of this may be test cases with hard coded riscv assembly 
> in them using extensions that we've not enabled.
> 
> The configuration listed in the logs for the kernel are:
> 
> rv64imafdc
> 
>   '[    0.000000] riscv: base ISA extensions acdfim\n'
>   '[    0.000000] riscv: ELF capabilities acdfim\n'
> 
> The 'v' (vector) extension is intentionally not enabled to match the 
> software configuration, but some tests may be trying to use it.
> 
> I'll walk through this and attempt to get this identified for real.


We should be enabling the rvb23 (rv64gcv) profile as default for qemu, since
that is the baseline for a RISCV profile that OE will be used as base 
infrastructure and we should target that commonly, perhaps changing 
default tune for qemuriscv64 to consider that would be a good thing. I 
know there is
a value in constructing the ISA+extension set that qemu emulates based 
on tune selection and whatever rv64gcv devolves down in terms of 
extensions.

> 
> --Mark
> 
> On 7/9/25 4:17 AM, Richard Purdie via lists.openembedded.org wrote:
>> On Wed, 2025-07-02 at 16:44 -0500, Mark Hatle via 
>> lists.openembedded.org wrote:
>>> From: Mark Hatle <mark.hatle@amd.com>
>>>
>>> Use TUNE_FEATURES to dynamically configure the QEMU emulated CPU for the
>>> options selected by the DEFAULTTUNE.
>>>
>>> Note: OpenSBI currently requires 'c' (compressed instructions) or it 
>>> will
>>> not work.
>>>
>>> Change the base device configuration to use a different variable to 
>>> select
>>> the emulate devices.  This will allow a user to override or append the
>>> QB_OPT_APPEND without the riscv32 override getting in the way.
>>>
>>> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
>>> ---
>>>   meta/conf/machine/include/riscv/qemuriscv.inc | 31 +++++++++++++++++--
>>>   1 file changed, 28 insertions(+), 3 deletions(-)
>>>
>>
>> FWIW I narrowed down the ptest failures to this patch.
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>>
>>
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220090): https://lists.openembedded.org/g/openembedded-core/message/220090
> Mute This Topic: https://lists.openembedded.org/mt/113956553/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


