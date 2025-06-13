Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E19C71135
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 11:42:11 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.8382.1749814919074570538
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 04:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UaqQcxYn;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-607c2b96b29so4232049a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 04:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749814917; x=1750419717; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RYL8J6YUY/r76RLnfWiRHfZLEI3y496Io0sl2uUgp/Q=;
        b=UaqQcxYnT+lHTWAlOc/z4OWy6A7uOtkHEbnrd2vKIwLBVRqG4aDbVjcjyy52ICRuJb
         2NK420SUg31v/ETUBMuevM72QwjEq68yQjucan3qROP2TXQIkIZ3R90zyMrDwk83e7NS
         IMCxeFxxpZi6FCw1Tsyx4bspWMQfDNECnQz1DyUGunSYYvk6eZxRnlyhA9QBZJI59lHR
         lJ0FWZrjOREX2w6H1yCVvU6fNvMHZK3aOOX4OtlvoAIi30Hp+S6i32Pq/EpePGhTSxst
         y6gcdZv4dchU4lkuMf0Nb9YF5fDF7Qhkd8L4QmXCgKZyaJjC/VL6m+MyXe3Rg1vFh3Bg
         6exQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814917; x=1750419717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RYL8J6YUY/r76RLnfWiRHfZLEI3y496Io0sl2uUgp/Q=;
        b=OnZqmqw/pUGZ6Ua+rF/1qH+zWQ+SGEptrW7nM3i9slSlaa8eO41Ul1VdVvTNzP0+e0
         2dGGXD4nvIjRiftrnpgub13iv1HuA7uYlH7Viy5Gx7N3HqXaGOVNYpY0fgi1NWbbJW3D
         YiOOygSQkA/W7htCP9ZONODdrLy9UB4ZhHCbRCNaD5QRG9RTjeKiCxaEYdjLXPgw8t3F
         h+zgydPVCEoSwDONBnaTJLHRLVEfmgwyuJuWcZvVFOQmt/mXD9Ho/+xOxCrP8UgDLdRH
         CznnyMaU+9XNifTkS/9UZS3wc8cnISaW9o6BYSNTAozjivyj/hLrswbqJu5JJkByA1Sl
         6Jig==
X-Gm-Message-State: AOJu0YzF6R07lApEoeBRKvs9zFwYb1QVw0vH+cZWWOJ+6C5QQ9lwNGc/
	hwoFwgjTDTif7WSCQmaYZ3ZrjNHUlvRrzSfpm/GjINyHlF5EAGq+Hoyh
X-Gm-Gg: ASbGncuFZ0T/wv8vm7sdFqqbzhMucXXBtppHF5v6U5juQmuz/ISXV0PHBUj0lRre0Kr
	nWRVYnduN95T5kgKWYL4vFdj3o/B1LZ9RzTGrR9Qa5hN+kRaXxhvA8FqXbSykKrPW2qxhD9xQ6p
	gWvGokL1w+JzoaFBsRV8xfmkd23Qt5j9jzEgyMX4HD/9R5GvO3y6GSIFEX5Mw6D9iliiB6Svxmd
	hY7H7+5up5xuHNcignP7a33cmNwSMLQantkLH+ApnkYScm6WqPKAy66HqGUUOLrQ1Av9BfnBpbw
	/mYfKjsKhIhNNxv6ZmjpKIRFDfJ+8/jsdfY/mcWJwlGa9QoRFnJkrAk0PCarDbdLOXKTkQ==
X-Google-Smtp-Source: AGHT+IEpBy/5adfBR6wdiLo0AvjAQsPugdJfzNgTamRF3yapqk+XBMuRFS13ax3ArtBrQDrOv2b1cA==
X-Received: by 2002:a17:906:fe02:b0:adb:41e4:8c73 with SMTP id a640c23a62f3a-adec5dd9c74mr272896066b.55.1749814916892;
        Fri, 13 Jun 2025 04:41:56 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81ba761sm115509266b.43.2025.06.13.04.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 04:41:56 -0700 (PDT)
Message-ID: <39b4ae41-3982-49dd-ad28-3b67459b866b@gmail.com>
Date: Fri, 13 Jun 2025 13:41:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 1/9] bitbake.conf: set
 BB_GIT_DEFAULT_DESTSUFFIX to match default S value
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Alexander Kanavin <alex@linutronix.de>
References: <20250610094400.1653931-1-alex.kanavin@gmail.com>
 <9708ea34-8a8c-4704-951c-d4e8b0973fc7@gmail.com>
 <CANNYZj-hVH+RgfGYVekiCNnGU5-rNJmWp-XZZKx+g_a4Tb=7JA@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CANNYZj-hVH+RgfGYVekiCNnGU5-rNJmWp-XZZKx+g_a4Tb=7JA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 11:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218591

On 6/13/25 13:25, Alexander Kanavin wrote:
> On Wed, 11 Jun 2025 at 20:35, Gyorgy Sarvari <skandigraun@gmail.com> wrote:
>> Possibly the recipes would need more modifications than this, especially
>> the ones using default ${S} (maybe?).
>>
>> I tried to apply it on the current master and build some base recipes in
>> a clean build dir. I tried to build git recipe (was curious how it
>> behaves). First gnu-config-native failed to install, as it couldn't find
>> some files due to the move. I fixed that, but right after pkgconfig and
>> binutils failed to patch - the src is in .../sources/git folder, but it
>> is trying to patch in .../sources/${PN}-${PV}.
>>
>> Or am I missing something?
> I just realized: did you take the necessary bitbake patch?
>
> https://patchwork.yoctoproject.org/project/bitbake/patch/20250610094334.1653567-1-alex.kanavin@gmail.com/

Hmmm.... quite possibly no, I grabbed only this series. Let me give it a go.

>
> Alex


