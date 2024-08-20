Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFD4C531DC
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 18:39:28 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.2232.1724179158608996647
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 11:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=qUM0q9Oi;
 spf=pass (domain: baylibre.com, ip: 209.85.222.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a1dd2004e1so374434085a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 11:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1724179157; x=1724783957; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y3cmN0xkJmfbZwBSinYXozGP0xGaa/OLj5tsuRxju5Y=;
        b=qUM0q9OibdVUz2ugXcy5TEHulnOIAbusV/s2O5r3u4jqvZLvsc8v6ux8ei/2I8ncEP
         iSh5UnQCniKg1sf6dOVYnyUURTNIlcul1x6UGKT4UmSFNmvufCXLcLLMqWCGR/v9ZuNs
         2lbWvb6fkyjvJKTZXMfcSosXTjT/pTmjF18/7SoVH/LOkDGTHsVfuZPEYcQApEvRCCp1
         zeltTnOhgLSsw2LVAOB5GCY908pra9o+L2miuh205DkavrattUYvf/3Vw0UYyRINwTYi
         7LXsKFtnjsLmNuLqgMF5AP0MKewuZ5rzwPcLhpc1bb2I6IhTkJizFMN7yDa2oX3yok6B
         qESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724179157; x=1724783957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y3cmN0xkJmfbZwBSinYXozGP0xGaa/OLj5tsuRxju5Y=;
        b=vUbMs0DhmL6ZRLqY+cNHbagoQkTMd6UmTKwZfCKSRZRIq8EJ6jggOjFaIarGabamGp
         9/kNN+D+yCSgGLxn6pX7uprZ26u9c/6PapTAlIbybK2MiQNQfQc/E2AN3Ke4inxk75eg
         /RyGNvuqPnX9H3rOW9EjtNOgQWf0ZKz+dhgRTYUIIx0xfML6vB3pSRs7vzFgLbnR9Yoq
         h+dtYrJarJBFyQ+K2qUYs39rDf4JhuXtWddwfA38GDP+Vg+fiBvpEniIY+yADhMr3CL0
         2rYlsr1kb9seY/LOnoJv0Q4pb3uhPDweC/sqfbbLJmstPowogbyYrOKBXvPRklFU2yjY
         Fykg==
X-Forwarded-Encrypted: i=1; AJvYcCVzATPlANHjHTaxZ0zWH5ao+dB9O7y+xo9lJKCYOi9MuhXepb4IkHjbCqR6Jmn9sO/JhMREUV5XXPmQTxi3vaHYdg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxgEAu3CgnesvG71c7bhbmvJGt0guzuyuxhxJVbOCBHUuusQP30
	I3DEq0wbk5JtRUs65EJ2Y1NO+rM1gJYnpcbfPnnmErsLidRzFIsfHegB14W0m6A=
X-Google-Smtp-Source: AGHT+IFRegBFtMQY/DXL+7XbuKydTP7FVCfYoxS+cCa24SW3+aMEtDIuJi57lOmfOXcOVCyTsj6/jQ==
X-Received: by 2002:a05:620a:248e:b0:79f:baf:ed0f with SMTP id af79cd13be357-7a674025f19mr20747785a.23.1724179157425;
        Tue, 20 Aug 2024 11:39:17 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff06c496sm550683785a.71.2024.08.20.11.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 11:39:17 -0700 (PDT)
Message-ID: <1b2a0a57-db8e-43ae-ac59-27c3678391b6@baylibre.com>
Date: Tue, 20 Aug 2024 14:39:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v2] piglit: upgrade 22eaf6a91c -> c11c9374c1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20240815140736.3189704-1-tgamblin@baylibre.com>
 <2024082016241749789ab3@mail.local>
 <4a465e4d-9cb5-462c-929b-1107e5e227c0@baylibre.com>
 <17ED7F9EA2077539.18027@lists.openembedded.org>
 <CANNYZj_=bBn1tuTjuL3Setj=CyJX56g4qRc2FoFXpj+0-XR=jg@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj_=bBn1tuTjuL3Setj=CyJX56g4qRc2FoFXpj+0-XR=jg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 18:39:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203563


On 2024-08-20 1:24 p.m., Alexander Kanavin wrote:
> I looked. There is a condition:
>
> https://gitlab.freedesktop.org/mesa/piglit/-/blob/main/CMakeLists.txt?ref_type=heads#L108
>
> if(PIGLIT_USE_X11)
> find_package(X11 REQUIRED)
> set(PIGLIT_HAS_X11 True)
> add_definitions(-DPIGLIT_HAS_X11)
> endif()

Changing the x11 PACKAGECONFIG line to this seems to work:

PACKAGECONFIG[x11] = "-DPIGLIT_USE_X11=1 -DPIGLIT_BUILD_GL_TESTS=ON 
-PIGLIT_BUILD_DMA_BUF_TESTS=ON,-DPIGLIT_USE_X11=0 
-DPIGLIT_BUILD_GL_TESTS=OFF 
-DPIGLIT_BUILD_DMA_BUF_TESTS=OFF,${X11_DEPS}, ${X11_RDEPS}"

Is there a cleaner way to do this?

>
> Alex
>
> On Tue, 20 Aug 2024 at 19:22, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
>> On Tue, 20 Aug 2024 at 19:18, Trevor Gamblin via
>> lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org>
>> wrote:
>>>
>>> On 2024-08-20 12:24 p.m., Alexandre Belloni wrote:
>>>
>>> Unfortunately, this doesn't build on the AB:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/9383/steps/11/logs/stdio
>>>
>>> Seems to be because of this line in the config:
>>>
>>> DISTRO_FEATURES:remove = 'x11'
>>>
>>> I see that consolekit has REQUIRED_DISTRO_FEATURES = "x11" in the recipe. Is this the right approach then for piglit?
>> Only if the X11 support is unconditional. You first need to look at
>> the failure log that says:
>>
>> |   Could NOT find X11 (missing: X11_X11_INCLUDE_PATH X11_X11_LIB)
>>
>> And then check piglit source code and its cmake configuration files to
>> see where that particular check is performed and whether it's wrapped
>> into a condition that we can tweak via cmake subject to x11 in
>> DISTRO_FEATURES.
>>
>> Alex
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#203561): https://lists.openembedded.org/g/openembedded-core/message/203561
>> Mute This Topic: https://lists.openembedded.org/mt/107914101/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

