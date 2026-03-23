Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC61CF4613B
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 15:03:56 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19823.1774278227649155473
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 08:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=dNFY0ZmB;
 spf=pass (domain: baylibre.com, ip: 209.85.161.49, mailfrom: tgamblin@baylibre.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-67df51b26ddso46507eaf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 08:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774278227; x=1774883027; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LfFYTliO6H8ZUrTE/zD/jP5ruU2qcoXlq4nBfXvT6Us=;
        b=dNFY0ZmBNbr7W/UKJ6SGIF443ZksYk795R7hIZbtG0Ah0O5B3Sj+8ABUdid/g9I1PG
         I9xOuFt8Ndmaqx3uDqS69PglqlFVFjZvoELshM5lB2qhr0rp039sFyQPEztvKNABpQWc
         7SM0aVxs4WJbaQNiSBQ641OuwZqViQT2Kbvzh2HTTNqgv15Xvy3RRWZDcFt7spNWpRLM
         dKSdLb64VRbKWg+ueVLbTzCY44LHp0RgbT19ljaQYGyS1nauKti6pq0s+Pze7W8LxaBe
         G0ZGt+x6tnS0MK0n8Z98OKzBKXfBTi5o0LXAFkXvxnfHD1iPE+DP/5v0m6dqmolamO0N
         PefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774278227; x=1774883027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfFYTliO6H8ZUrTE/zD/jP5ruU2qcoXlq4nBfXvT6Us=;
        b=Uhn6prmCmN1e05iQZStSm7kP4nDuP72cLYM5eJ1JmR2QOTU0nYtv2nJKg5A+lvEOlk
         P18sWcYv5I7DGN7jM6KSsEPqknvkGiw9be2uQJPRDtWawm24lWC2DFlhqaoTXoy+Ra11
         +Ov9HF7Ex8Fqrr7JT1LUb9TjRrmbD6BZ3obm2ZCuJ/usKOMA4mEOM/nDARTbq9gUsHoR
         m+D5B7Xn2lg/BEZSbzK6HKxDtoIXowGH8syNdD6HEZlw1w35o7KWFesrPDKUX5YzE/vN
         prtUuFV0ygakbM6FfvRSonirlXsGSxxQCg8I8c1liudXCHRSyt0Xkup1B8irWeaL9pu2
         1Saw==
X-Forwarded-Encrypted: i=1; AJvYcCWAQeN5OoKLASVcveUikNBiZol0rHxvThNTkPr0DCQti8s5GdcSWKgpwiAgeyLmSdIJ+2qobE7FhbOlFslMIJG1kA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzmwDzYncKqWpfUImdlX7IyXF/6GKJW2t2XMsgbELZJ1hVOnCvi
	BjsS2mf7qKNmA/2Voo5gTEP9PR6aIwm1BjBg3RijAzSk6cWSVss0FOtS9eOnlYWRp18=
X-Gm-Gg: ATEYQzzD+CVXf8Feh2EE1D8ZhxeT4c9GEoFFHvXAv8U0Gys5R2Ch62thejwP7qT9lGe
	FK1AvuPTHwOzPKxnnkuM4HSW0Q+95J8EHsk2Xl0lDT1AYeRwM8Pwarhdk19gAKJhCoSNLRb2SAa
	tQusJbMz9GQxPFyryn4dBqGmcERutNlJkgLNms/5jKxIiU3ypF5bFKsahcZnlVARr9oy+0cpPi5
	nQ6rbxKydDZ5o/fBW4Cgx1GkFrYuJY3YR68X7KfV5ba2TpyeS/ebz0f9A6sNdZ4pLiDVScCeSTR
	ksneOSuhruLZKioUb+exIa+GaHQEevKi7hMq/LRCLiRQQB3pzKjoM266/OSxtuabDe6RAS5NJPe
	Q/kBRLp7jmtfOFv+V6vWA5GfXL7gbTyLMVPSpcrjt4vkVsZdVtVDMzg+/9zMzF+ni0jgGSm6P/S
	VgVah34tfQ3H0YkleOdynXVj4qGo4n04blR2ddcYy+e9CM2AwLIxhtytgASPC1h++sW6ZFTvbT3
	ttF
X-Received: by 2002:a05:6820:1b05:b0:67c:f1d7:3d64 with SMTP id 006d021491bc7-67cf1d74bafmr6604392eaf.28.1774278226368;
        Mon, 23 Mar 2026 08:03:46 -0700 (PDT)
Received: from ?IPV6:2001:1970:3847:e000:1977:be2f:4a71:2892? ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc908d8c4sm822082985a.22.2026.03.23.08.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 08:03:45 -0700 (PDT)
Message-ID: <d33eccff-ac69-4eb2-9204-086ef9f864a5@baylibre.com>
Date: Mon, 23 Mar 2026 11:03:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] python3: Add a new PACKAGECONFIG knob for
 free threading
To: zboszor@gmail.com, Alexander Kanavin <alex.kanavin@gmail.com>
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
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <d8c59726-e8b9-4dc2-9bf9-48b0647d10dc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 15:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233745


On 2026-03-23 10:52, Zoltan Boszormenyi via lists.openembedded.org wrote:
> 2026. 03. 23. 15:47 keltezéssel, Alexander Kanavin írta:
>> On Mon, 23 Mar 2026 at 15:40, Böszörményi Zoltán <zboszor@gmail.com> 
>> wrote:
>>> I also see other issues popping up, first in python3-installer-native.
>>>
>>> Probably this setting ("python-freethreading") should be a
>>> DISTRO_FEATURE and then the python3 recipe would use that
>>> to enable its PACKAGECONFIG.
>>>
>>> PYTHON_DIR in python-dir.bbclass should also be set accordingly.
>> In patch review it was suggested that we should actually have two
>> co-installable recipes, rather than an exclusive choice between.
>
> Which implies doubling every python3-* recipes, too.

I think that should only be for python3 packages which actually have 
binary builds.

For example, python3-setuptools should still be fine, but python3-pyyaml 
would also need threading enabled for the recipe.

Unfortunately that means this gets even more complicated.

We may need to come up with a couple of new variables and/or a class for 
threaded builds to make the threaded versions work.

>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233742): https://lists.openembedded.org/g/openembedded-core/message/233742
> Mute This Topic: https://lists.openembedded.org/mt/118277380/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

