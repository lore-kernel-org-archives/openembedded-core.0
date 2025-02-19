Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45C9C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 10:14:42 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.18892.1739960078618398414
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 02:14:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QVs17n4c;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43964e79314so60688905e9.3
        for <Openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 02:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739960077; x=1740564877; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wC3A463kFrFhHKd8PAQBia05s0gWUoEA5bt1gTdGm/I=;
        b=QVs17n4c8lIQG1+EKHobw0DDxUp2H6gDS64Qu9Vk3Y1Kj3zokCY2LY6CNhP8Gi9dJx
         EZRjbZgbRfguJE++M8tVtRUYkpU98XwD6J0Qw6okrygUFjX+0f4ZJIA+PArfEQWbhT85
         FJtAKIeN9bntqabUBOTMMF6xkgrJt9jj4mTe90AW5BuGLoEZsxaomnHjexOHmiiDGdjn
         YwpACAYgE+TXbsVF1wR83J1id8IJWqeV5l/wZbLI9MxbPIpcl4yUZYr1qG6mK9bkcM25
         kf9Ese3hBVacqoNq3NMHEv1qNmAUnmIBB85kz6jDzbx8NzlhkiR4nTEFMSRRzPzkOzTd
         02bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739960077; x=1740564877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wC3A463kFrFhHKd8PAQBia05s0gWUoEA5bt1gTdGm/I=;
        b=tLsTIBglYCPWPSOSV5jRSnIy9WOdGKONFZJ7BPHp3dp/u/Vt1k1sGWcr1/gOuJ/P3y
         wb9VTlIyz/0+TLn3E7np7iGFWvgvoRIZcyFc+yhdlrj7FlPEcIhXH0qnv9fJE0y8SgDN
         +1AotL5XHucBmRVGUWpGqMNr8gQGOSlyz03KYc4pO/ywvuw7MWv58pTOQQqGbY+MBs+K
         HCqrvsZX4kdYYTwuUR/FEBQEHpLP22JIYRzJjMb04XgzZ6B58VZe7AFdxvZTlaqK189Z
         aWSVfRrmppk2l7tU7WL8u9Z24yaU7htFtruUsTZv6mLAu+lxX4BSqlkwcVqZHfm13fgy
         gC2Q==
X-Gm-Message-State: AOJu0YwqbF9q95CbVSXi2ulcaspp9it7tB4oUW/aNZjBRKjI/f+5uCUp
	aa5ZDIZVmbh5rl6FWtvvfCFySUhHNdUrmJCFBC/c804nPvmzzsjG
X-Gm-Gg: ASbGncuSNcObqd++WaTdkcwPgs8Bb8nCEmoNsOwZPv0hAoANaZdfGsduJthCpTrmRjX
	1kqhf2rLNdnXnoOWguK7BdfZUEd1lgL/hapC3WrtbHAl1Fgjbt9EEgg03Y79umhRcCULsuXqkbV
	5KbDXHtAoeVC6jfICbo/TvB0nAuqSU3IGOsmqhxFlr1YxerviI0e3NMD9smsIwqLzFvY8zc+u/K
	M1Vhttrx3xIE4le97YohsBQgESQoihk2K6sZBKBUundxrzofRjxffy7IOr+x2vR5Vz7J2qsWfum
	h18cg6o2mIYvdW65gNq0rCUw
X-Google-Smtp-Source: AGHT+IEQTkydPWZ7ZcrYYjY5U1HT3DLEnWmWQe/QBhqviM9JL0X0143fz3PvfxDNZjsWSsa38Zyk8A==
X-Received: by 2002:a05:600c:3b1b:b0:439:9595:c8e7 with SMTP id 5b1f17b1804b1-4399595cbb1mr65226195e9.0.1739960076496;
        Wed, 19 Feb 2025 02:14:36 -0800 (PST)
Received: from [10.54.23.7] ([154.47.27.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1aa779sm207261305e9.30.2025.02.19.02.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 02:14:35 -0800 (PST)
Message-ID: <1fb8f845-7562-4a1a-a624-847e6b9386d5@gmail.com>
Date: Wed, 19 Feb 2025 11:14:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5 1/2] systemd: Build the systemctl executable
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Openembedded-core@lists.openembedded.org
References: <20250218115647.40502-1-uvv.mail@gmail.com>
 <357c680fc29707fa3d6b9d934305acfb2df22c1f.camel@linuxfoundation.org>
 <Z7WsNsR9-8lbzxjr@nuoska>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <Z7WsNsR9-8lbzxjr@nuoska>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 10:14:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211698

On 19.02.2025 11:02, Mikko Rapeli wrote:
> Hi,
>
> On Wed, Feb 19, 2025 at 09:44:09AM +0000, Richard Purdie wrote:
>> On Tue, 2025-02-18 at 12:56 +0100, Vyacheslav Yurkov via
>> lists.openembedded.org wrote:
>>> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>>>
>>> Instead of the python re-implementation build the actual systemctl
>>> from
>>> the systemd source tree. The python script was used when systemd
>>> didn't
>>> provide an option to build individual executables. It is possible in
>>> the
>>> meantime, so instead of always adapting the script when there's a new
>>> functionality, we simply use upstream implementation.
>>>
>>> License-Update: Base recipe is used
>>>
>>> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
>>> ---
>>>   .../systemd/systemd-systemctl-native.bb       |  26 +-
>>>   ...-meson-add-install-tag-for-systemctl.patch |  25 ++
>>>   ...2-meson-Bypass-certain-config-checks.patch |  64 +++
>>>   .../systemd/systemd-systemctl/systemctl       | 376 ----------------
>>> --
>>>   
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/1022
>>
>> and many similar failures unfortunately. Did we get out of sync with
>> systemd versions?
> I think a rebase is needed since point release update from 257.1 to 257.3.
> Should be trivial. The patch file can be dropped since 257.3 already
> has it. Thanks for upstreaming it!
>
> Cheers,
>
> -Mikko

Oops, I did check that it was still applicable before sending v5. But 
yeah, v6 should be even simpler. will send rebased version soon.

Slava

