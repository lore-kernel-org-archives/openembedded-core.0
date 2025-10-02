Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952A7CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 20:33:49 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.4188.1759437225502448418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 13:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Da+ifCGA;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso2794252a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 13:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759437224; x=1760042024; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dxkALyupFWnDpkYkujdK1Loz9+VnZ0PTmxa32CWV8WY=;
        b=Da+ifCGAwcp+k9XdlGgtEeVYkbuhhxtjG7XOI1W7PT81gFp8bA4jdWXDMcMSWOoMnj
         uAPleaSNtZP0h/YNPV98q/BTdyXqVuBHMuQtAmgvozsnyQzfeNCDRgPsKrR+wiFOBJzh
         RVxpJsTgj/TQkSBshjSg3WvSrPlhS28EHRvn8kxzww4zPolWqsRxURDkl7/tdd25mgku
         x+MOGHM/fjPfDv1vZbMzRvAPVU5QzCWZkFzmQi3M4zKd4kRaSwDrSzaV6JZTaIJODcsq
         KdkeS/jM6qaJsXM0rlwp0tMneCW74tsD6S1z4CGahyFjcsQWm4qJGrlWygK7to5Ry140
         e80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759437224; x=1760042024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dxkALyupFWnDpkYkujdK1Loz9+VnZ0PTmxa32CWV8WY=;
        b=J3jS/gQPHuI1JM3yanXiF3AqVSY3MfWunmh5vLRF1Tnv0puoz6KCZyOxEMoc32PV1C
         ODPlPwp8GlYnPZmi/Tq/mhS/O7WclgO76BEddMKbSP8wMn4RWS4mat60rze36MhpTe/6
         rmdeEDtwQjLkWMTdGBYaUsEQ+IBXWVwjrmkZmknVFXNp+EgvTYePy0eHkDpFUJvR0lV+
         3VM8EDWA9tob1+WSTnRYVTIevOh8rcVUqLfW8O6FiQvIj8oBH5TKXC9Bs4CMgE4XfdGm
         T1EdCk4FG5Mb6bOAUWXPWa8kWFSYqQQa2bk6QAI6RPxzcAU3D3i6tCShzn4DABMIiB7j
         /A3A==
X-Forwarded-Encrypted: i=1; AJvYcCVcjYww/hkADrr0bMcSyzZoT/9cQSYyabuSxLQw0Vthj2NTvubCzttEckMIQKs0cRaJw9Yy6qWavq/Rib2U8RzcSA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzraTzBUSDq5VkBjM8tWvPHlDvvCMKD+oRXSb3fxzrAcYg7AEvq
	IuFFkdwaoxu2zIgkAGUQh2MvqsGIHyDa8r7EOIjYMgokJTc25B0CHD5d
X-Gm-Gg: ASbGncuK8jFYclz8dJ8F3PN/WUHY/cSFhkzr9HxJqF5S9y8y5ZoFLAfhF0isdgp19Dj
	FFNDk9JsDVmhtal1UuRGtIunPUpOmJbaicJ9RoEzxieIFVpLnu5hjB3DluCaVv/Or5g5xj+crFA
	01Qosj0BZJNcyoK3YYpfnHwiwA93O6hh8Dm4ie8zdYiMTvsg2UCpZtG7mqDD6Gpl5cbAx41OjAG
	x988u2WlJs/hYYXnH1bCQiSWOwDeiJ5Dl3k7X4xIa8K44rFu5EZIC564C3lbE9FuzmnPe3PR98Z
	w1s0KFcVwrWa8q4TNILKHVJ9L/vAng152WK07Zd4ryv6vcVJwayGq478X9PaDEqJmL+5RzvgRM8
	7gOFXCB2WraNnwVJjZBGNC/hA106YDcK+Qx3QwsA0A6ZubTvkCrQbVQzrV7Osmzqhmg==
X-Google-Smtp-Source: AGHT+IF7OXQcoQnre7GIJyC6+pHMTP0G3M8S8h0zGYTmdXYjfD3NR681XdsSoAYhQTVpsBpyP2HdCw==
X-Received: by 2002:a17:907:9447:b0:b3d:88a0:ba93 with SMTP id a640c23a62f3a-b49c47abbf7mr80384166b.37.1759437223383;
        Thu, 02 Oct 2025 13:33:43 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865a83f6csm276481966b.31.2025.10.02.13.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 13:33:42 -0700 (PDT)
Message-ID: <6c530b3d-83b0-45b1-856b-78bb29f370ef@gmail.com>
Date: Thu, 2 Oct 2025 22:33:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] How to have multiple rust cargo vendors
To: t.f.g.geelen@gmail.com, openembedded-core@lists.openembedded.org
References: <CAJo0Az632gtPBnWcszxzodqHTnagfqCDW5_d33WnbL_m_Hoezw@mail.gmail.com>
 <186AC5F2410FD5FD.16131@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <186AC5F2410FD5FD.16131@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 20:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224381

On 10/2/25 22:17, Gyorgy Sarvari via lists.openembedded.org wrote:
> You can add those in the SRC_URI, as regular git repos, with +=. Make
> sure to set the "name" parameter to the crate name, and set the
> "destsuffix" to ensure the sources won't mix. After do_configure step
> one of the cargo/rust classes will go through the SRC_URI content, and
> add these git-crates to the cargo config as local patches.

Oh, now I see that this is a workspace - sorry for not looking closer
before.

At this time cargo_common doesn't support workspaces from git crates...

I find it interesting on a personal level, because I just implemented
workspace support like 2 weeks ago, but couldn't find any project using
workspace crates from git beside Firefox, and didn't want to submit it
only for that. (And since Firefox recipe switched away too)

If I find my implementation again, will submit it tomorrow as an RFC.

>
> On 10/2/25 21:40, Tom Geelen via lists.openembedded.org wrote:
>> I'm trying to create a recipe for uv (https://docs.astral.sh/uv/) to
>> be added to meta-python.
>> Problem I currently cannot seem to resolve is that I need multiple
>> cargo vendor support.
>>
>> I have created the draft recipe and added the inc file with the crates
>> using the update-crates command.
>> However it missed several crates as they are not from crates.io but
>> via git (see below).
>>
>> How would I add this to the recipe below?
>>
>> SUMMARY = "An extremely fast Python package and project manager,
>> written in Rust."
>> HOMEPAGE = "https://pypi.org/project/uv/"
>> LICENSE = "Apache-2.0 & BSD-2-Clause & MIT"
>> LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
>>                     file://LICENSE-MIT;md5=45674e482567aa99fe883d3270b11184"
>> RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
>>
>> SRC_URI[sha256sum] =
>> "e6e1289c411d43e0ca245f46e76457f3807de646d90b656591b6cf46348bed5c"
>>
>> inherit pypi python_maturin cargo-update-recipe-crates
>>
>> require ${BPN}-crates.inc
>>
>> SRCREV = "d8efd77673c9a90792da9da31b6c0da7ea8a324b"
>>
>> PYPI_PACKAGE = "uv"
>>
>>
>> [[package]]
>> name = "version-ranges"
>> version = "0.1.1"
>> source = "git+https://github.com/astral-sh/pubgrub?rev=d8efd77673c9a90792da9da31b6c0da7ea8a324b#d8efd77673c9a90792da9da31b6c0da7ea8a324b"
>> dependencies = [
>>  "smallvec",
>> ]
>>
>> Regards,
>>
>> Tom
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224380): https://lists.openembedded.org/g/openembedded-core/message/224380
> Mute This Topic: https://lists.openembedded.org/mt/115558933/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


