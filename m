Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACA6C7EE2E
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 14:20:14 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.15629.1685542804828591820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 07:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=JYMBsnUm;
 spf=pass (domain: baylibre.com, ip: 209.85.219.50, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6259c242c96so33427596d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 07:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685542804; x=1688134804;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J4U32e8YLzrcA//pUnTr1kDi6Q+xbLSF0Fdch57+FiA=;
        b=JYMBsnUmqWO6OPjbwDEre8EtoIpNCPKC+5MtTb9BLFWzc6QvbpZ5FAcmeLJoqaX+BQ
         2FmE5tLZ8+rflrN9cz6EunRcW3yxXave76yGutiNhWRxN4/P9eka4GEgWxZazqWmZJaN
         WXVAp4vMgnqMyxT8tEa3ymO6fn0gvhxofVU1bv4b2DG0/Q1q9+CVk5cwm658ugpK0WY4
         ayp1Ll42bA+FEWMmjaw0J5lBnACK6Lw9z88588Nx8PdXVRrC0qhk+j1rrrX5ZfFntdqq
         iKl9fA+9IMPMAuufQywKfNZlRe3am1ykpH98pm6KouOTdo/mE43z3dXJA03dVpc/F7Cc
         pdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685542804; x=1688134804;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J4U32e8YLzrcA//pUnTr1kDi6Q+xbLSF0Fdch57+FiA=;
        b=DeyC3dyaKmcqBbwbbej2Ad2W9x8JUlx/bLXHeMBe/CezIBFzqFtbQ0j2XyAPzdixLe
         wJZiiprRSXFe417ooYDCTtg7QeYzRu5xrAVgN1VWtdnvtCJwjiT3Bt4WbJNvLycLZepF
         EuKLCPi46ndYcUxGDa6dvkKyFIcd1Y84Qrb/MQNbfXDE4je3TjtCZJScz5DD44bf3R/+
         PDAMW84tiTY41eo/iMErIrhp7NNMyHhzYBPWCXeoH/Ym9HBkOnbLBdA1A+yU62mj+CQW
         77qwzzQ9Ia37LbqQzvsMFoiKMuuXiV/e1rNfLRu+L7GxwIdL0VpQPd63Utt33o51ZqCY
         0TGQ==
X-Gm-Message-State: AC+VfDxhV2/gd7SyOyLIvZ7woTCFXJsr96KDfYbyckJR1Wo3GbCZHD3y
	YfT6lerdf9GsIUGoVC56zodwcw==
X-Google-Smtp-Source: ACHHUZ4Kpyk2Guq/11f1RBdbJcGRAHBfSZofQ6fHTEtSDJJw9EVIvBzw94tAx9v1HNuzelaZyXBMNg==
X-Received: by 2002:a05:6214:20a9:b0:626:2527:54a6 with SMTP id 9-20020a05621420a900b00626252754a6mr8688451qvd.8.1685542803786;
        Wed, 31 May 2023 07:20:03 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:bc2d:57d7:406e:f9ca? ([2001:1970:5b1f:ab00:bc2d:57d7:406e:f9ca])
        by smtp.gmail.com with ESMTPSA id f16-20020ad45590000000b0062014184907sm5734907qvx.107.2023.05.31.07.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 07:20:03 -0700 (PDT)
Message-ID: <6d3608b9-6f76-9a6a-6857-bd055b9eeb73@baylibre.com>
Date: Wed, 31 May 2023 10:20:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core] python3 cryptic build failures
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Tim Orling <tim.orling@konsulko.com>,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: <eb184be946abaf9c76a2af279af2db9bcb43a1e0.camel@linuxfoundation.org>
 <CADkTA4OQJLMSqBzR3nKVX0o6YV=qa9ZPaJioU63W6B6wh6=wWA@mail.gmail.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CADkTA4OQJLMSqBzR3nKVX0o6YV=qa9ZPaJioU63W6B6wh6=wWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 14:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182012


On 2023-05-31 10:04, Bruce Ashfield wrote:
> On Wed, May 31, 2023 at 9:23 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> Hi Trevor,
>>
>> I thought this issue might be something you might be able to spot the
>> solution with quickly.
>>
>> I had a failing python3-iniconfig build in a TMPDIR I've reused
>> heavily:
> FWIW. I see this in about 6 or 7 python recipes in my extremely
> heavily reused tmpdir.
>
> After I came back from vacation, I iterated through a -c clean on the
> python packages, and they always built the second time through.

Do you recall which those are, and if it's the same ones each time it 
happens? I'm wondering if it may be an issue with some recipes.

I haven't been able to recreate the issue yet, but my tmpdir is not very 
old. When I attempt the suggested reproducer (creating the empty 
directories and rerunning do_compile), it is successful. I'll keep 
poking at it.

Trevor

>
> Bruce
>
>> ERROR: python3-iniconfig-2.0.0-r0 do_compile: ExecutionError('/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/temp/run.do_compile.2391637', 1, None, None)
>> ERROR: Logfile of failure stored in: /media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/temp/log.do_compile.2391637
>> Log data follows:
>> | DEBUG: Executing shell function do_compile
>> | * Getting build dependencies for wheel...
>> |
>> | Traceback (most recent call last):
>> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__main__.py", line 375, in main
>> |     built = build_call(
>> |             ^^^^^^^^^^^
>> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__main__.py", line 208, in build_package
>> |     out = _build(isolation, builder, outdir, distribution, config_settings, skip_dependency_check)
>> |           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__main__.py", line 147, in _build
>> |     return _build_in_current_env(builder, outdir, distribution, config_settings, skip_dependency_check)
>> |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__main__.py", line 127, in _build_in_current_env
>> |     missing = builder.check_dependencies(distribution)
>> |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__init__.py", line 369, in check_dependencies
>> |     return {u for d in dependencies for u in check_dependency(d)}
>> |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__init__.py", line 369, in <setcomp>
>> |     return {u for d in dependencies for u in check_dependency(d)}
>> |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__init__.py", line 185, in check_dependency
>> |     yield from check_dependency(other_req_string, ancestral_req_strings + (normalised_req_string,), req.extras)
>> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__init__.py", line 179, in check_dependency
>> |     if req.specifier and not req.specifier.contains(dist.version, prereleases=True):
>> |                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/packaging/specifiers.py", line 905, in contains
>> |     item = Version(item)
>> |            ^^^^^^^^^^^^^
>> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/packaging/version.py", line 196, in __init__
>> |     match = self._regex.search(version)
>> |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> | TypeError: expected string or bytes-like object, got 'NoneType'
>> |
>> | ERROR expected string or bytes-like object, got 'NoneType'
>> | WARNING: exit code 1 from a shell command.
>> ERROR: Task (/media/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile) failed with exit code '1'
>>
>> I wondered why and I isolated it down to this:
>>
>> richard@jet:/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages$ find -type d -empty
>> ./hatchling-1.13.0.dist-info/licenses
>> ./pathspec-0.11.0.dist-info
>> ./importlib_metadata-6.0.0.dist-info
>> ./setuptools-67.4.0.dist-info
>> ./wheel-0.38.4.dist-info
>> ./installer-0.6.0.dist-info
>> ./setuptools-67.6.0.dist-info
>> ./packaging-23.0.dist-info
>> richard@jet:/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages$ find -type d -empty -delete
>>
>> After which the compile succeeds. These empty dist-info directories
>> really upset the build. They're left behind by the sstate cleanup code
>> from when I have older versions of these python modules in play since
>> the sstate code can race over directory removal. Is there a way to make
>> python ignore them? Otherwise should we remove them somewhere?
>>
>> I suspect you can recreate by adding these empty directories and
>> running a -c compile -f. I've seen it with plenty of other python
>> modules too.
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#182010): https://lists.openembedded.org/g/openembedded-core/message/182010
>> Mute This Topic: https://lists.openembedded.org/mt/99241972/1050810
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>

