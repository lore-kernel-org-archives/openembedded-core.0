Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0756C7112F
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 20:31:26 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.6376.1724877076534821141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 13:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Lf4YCTq/;
 spf=pass (domain: baylibre.com, ip: 209.85.160.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-454e92f001eso39791321cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 13:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1724877075; x=1725481875; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c85qsXOK3P8tJmps30nj0qwMq6oZTYcX9/7P4RHJcw8=;
        b=Lf4YCTq/oCP7kZ8FDN/6bYk3+f8kIClHlqIB1ti8hqMj5ljZqAOpWF9mJOwgdX1EoR
         sBy1+WdpwhkFoo0peiiOy2AeHySJTBYgyvyZIluKdcnBhFKXgRQ53huHnjqXW+m0Sru9
         LQJNY8uCZ60e+tIhKm93nG2inaXv4Fc3LgVQS5CNjTOVuUKknDqWQQ9SohEncgx1ofre
         XKfcA94PPC5BjKjWiwO5wSYwGk/XqbTuwIiniNL1avhWGFxhTEHHqg8gBZYudmEUzqc5
         HOBrztrf0qy1xqK3IizSutKNnZ/Udst/RFZqgsDAEUjUh647a0FQgfeBlfdwGBOs6ce5
         OWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724877075; x=1725481875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c85qsXOK3P8tJmps30nj0qwMq6oZTYcX9/7P4RHJcw8=;
        b=R0INchMXXT+/DWtI2twdW1OZoxSVnex/C1CCTq88IqKkExirK+7N5lDeZGlelD9NvY
         pbZ2v6dsqTtXvTgITsVPXwkScPI1YazIW1nU8K1GCsq5gohSLrn9g8q8jCCz8H/Iq9Ap
         VBleAoYyQE0AMVAiREuDGLT39RUbRS9y8V8oSorw1vZN7pwG6PJJ72/PXSKRi5sewe8h
         05gAMvyMqeSdAHuWLFcTvWOVayZas48lVYSt3KqLX0TrC7hp0DaqDrqvA55TOgFMf9QU
         Q9RZvgXw2EACbJBJXpM8Vf6iKnKBwQ4ML271ECUsd47FmOMOaKR3l6+E16UP39QLKbGp
         1uLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCd9vvyoQVJGABmz2dJwIVQxSBke939ZyoEe1LcmzqLXNuKWgg8XS1HzZ1VEqPMrg3XWYs8z4b5dcdefu48UxKbQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwSsSEugBPcDOXmVaJ8O3LPzyLUtLDnWwknxRb3P/1Uw3dkx3L0
	d0QhxIKYfZXXp/d037ZTzI8rsMsSAWiU1wKV/dbGVS3efmLxTCJ65xGdA9nXFUo=
X-Google-Smtp-Source: AGHT+IHHw4anM6BGwsuE27b1zdlrrP4w5dNwwCA+P2btkBvIdCEdt4nMTuVMbhKit1v/cCgwOiBPIA==
X-Received: by 2002:a05:622a:400d:b0:447:eaf9:5a08 with SMTP id d75a77b69052e-4567f57cce0mr5565781cf.17.1724877075377;
        Wed, 28 Aug 2024 13:31:15 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-454fdfbf973sm65257391cf.2.2024.08.28.13.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 13:31:15 -0700 (PDT)
Message-ID: <4c294c8b-233c-4105-9b6b-e8e5e5974f73@baylibre.com>
Date: Wed, 28 Aug 2024 16:31:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 19/24] python3-setuptools: upgrade 72.1.0 ->
 72.2.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: martin.jansa@gmail.com, wangmy@fujitsu.com,
 openembedded-core@lists.openembedded.org
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
 <1724136703-20023-19-git-send-email-wangmy@fujitsu.com>
 <17EE19F35A1C7F50.9439@lists.openembedded.org>
 <CA+chaQeUkj4dX8rSkxK49_7m3ZbFGhLb27zcGDyuhOZdxy_9bg@mail.gmail.com>
 <05f406ce-1e4c-4fc6-97a8-2b6c28df96cc@baylibre.com>
 <CANNYZj9qf6FKiMaQP9NnXLKMM1gmX2+mDPNPipuDUQ6k7-pBPA@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj9qf6FKiMaQP9NnXLKMM1gmX2+mDPNPipuDUQ6k7-pBPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 20:31:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203892


On 2024-08-28 4:19 p.m., Alexander Kanavin wrote:
> On Wed, 28 Aug 2024 at 22:05, Trevor Gamblin via
> lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org>
> wrote:
>> Even with that workaround, I see a more serious issue:
>>
>> |DEBUG: Executing shell function do_compile
>> |/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/setup.py:60:
>> RuntimeWarning: NumPy 1.26.4 may not yet support Python 3.12.
>> | warnings.warn(
>> |Running from numpy source directory.
>> |/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/setup.py:75:
>> DeprecationWarning:
>> |
>> | `numpy.distutils` is deprecated since NumPy 1.23.0, as a result
>> |  of the deprecation of `distutils` itself. It will be removed for
>> |  Python >= 3.12. For older Python versions it will remain present.
>> |  It is recommended to use `setuptools < 60.0` for those Python versions.
>> |  For more details, see:
>> | https://numpy.org/devdocs/reference/distutils_status_migration.html
>> |
>> |
>> |  import numpy.distutils.command.sdist
>> |Traceback (most recent call last):
>> |  File
>> "/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/setup.py",
>> line 483, in <module>
>> |    from numpy.distutils.core import numpy_cmdclass as cmdclass
>> |  File
>> "/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/numpy/distutils/core.py",
>> line 24, in <module>
>> |    from numpy.distutils.command import config, config_compiler, \
>> |  File
>> "/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/numpy/distutils/command/config.py",
>> line 19, in <module>
>> |    from numpy.distutils.mingw32ccompiler import generate_manifest
>> |  File
>> "/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/numpy/distutils/mingw32ccompiler.py",
>> line 27, in <module>
>> |    from distutils.msvccompiler import get_build_version as
>> get_build_msvc_version
>> |ModuleNotFoundError: No module named 'distutils.msvccompiler'
>> |ERROR: 'python3 setup.py bdist_wheel ' execution failed.
>>
>> I think we'll need to wait for the numpy upgrade to go in.
> I don't understand. This setuptools update did make it to master, and
> numpy 1.26.4 builds fine with it on the autobuilder and in my local
> builds.
Sorry, got my wires crossed. I'm trying setuptools 74.x, which I only 
mentioned testing in IRC...
>
> Alex

