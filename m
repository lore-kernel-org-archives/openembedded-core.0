Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06666C67861
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 20:05:05 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.5828.1724875499517899577
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 13:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=lBhGw5Ts;
 spf=pass (domain: baylibre.com, ip: 209.85.160.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-45019dccc3aso42882411cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 13:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1724875498; x=1725480298; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cO/B9dEHpYFaj/Jv4fQb3TrbpeoJL0l5WdwXglqn7xo=;
        b=lBhGw5TsJjs50pgcrVJZ/0Y08oWvqTFBPSDIuu0vX5lPphUqIZotlb5WlTHGO7mZbM
         ir/FbdpuUTEiT5GTznw6BpLHGNSZQcYVjk08lV90y63Kg2u5HXHtyYxiNyhotdptz3Wd
         IpH+G3Uh0kWqJ9zJjDl54hBKJFAvkiO+lIR8e/LYGK1X33jtFloYHQOFubdOyuu3DGKv
         FgetX1bdGRgYU4/TCub/Np1G3Ob03bHd4mC3xdAl9ptj2ezOkkf1qwBDuPxbEtndPEY5
         f6PHjxY7bi3iUBdSfImr+ufrJ6w53mO6llhfCtz38+iW1zw1AKunc+lTrqolnZOm6joX
         9OLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724875498; x=1725480298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cO/B9dEHpYFaj/Jv4fQb3TrbpeoJL0l5WdwXglqn7xo=;
        b=hSTM/Lm43+y4OROP/0/fIkxg7qbHd67MmZrNIMyjArVPyuPInZ5hmo8gns8IQOOn1b
         wNJDsoicCY8G39ZRUp5E2+PSFOS/GBL5tVaOw1NVgnzrXth108nYBls70ZCya9w02fZF
         rq6fPoYV4j95PeW5AEd8LNEKj5jkx+QkgemTm2Mf47Hx7FuYTubuI5kRYf0ygzCnl0Ws
         9P/9KV5Vzsr//+R0aaMxrqoqXPguH+v0Ao2VU8H9lyKIkC7DVtW1/Jao5V/k+xzWaYpn
         skP+s31S4j2DJ51icTf+Eu8H9MVq2gU3JelQlLhFYnkJv4c4mmPdMaEL5cmc+rdyizYm
         +YCA==
X-Forwarded-Encrypted: i=1; AJvYcCXxE6cca2r6Q7u9yn1E9OJBLH1YIOaXdNq+2LaM8o/uEF7SE59YCKLjIQ0hLJ5k+dkxFuN2Ta5CS5FskBr1UjNKPQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyEjsPGYl0vTi2KjtEUBoSJQslKaH3SSediNTJgbMNRe/O2BDX1
	S9gjnVJXLcrjNPi5NEKVEGEi3jfocmd6kze2aqswYTCc4aBc9Sdnpo/6Wz5VrO5xkXVuo48IV9j
	UpMI=
X-Google-Smtp-Source: AGHT+IGS6Y7UOyKAJC2wZ9+5KYEmQ049M52Rj4hBJAKJg+t933O6sGGUEJ+/pXnuLL9oKCxnto/cTA==
X-Received: by 2002:a05:622a:5197:b0:453:13e4:b742 with SMTP id d75a77b69052e-4567f6fbd69mr6190141cf.53.1724875498239;
        Wed, 28 Aug 2024 13:04:58 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4567ec041dbsm2132341cf.63.2024.08.28.13.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 13:04:57 -0700 (PDT)
Message-ID: <05f406ce-1e4c-4fc6-97a8-2b6c28df96cc@baylibre.com>
Date: Wed, 28 Aug 2024 16:04:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 19/24] python3-setuptools: upgrade 72.1.0 ->
 72.2.0
To: martin.jansa@gmail.com
Cc: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
 <1724136703-20023-19-git-send-email-wangmy@fujitsu.com>
 <17EE19F35A1C7F50.9439@lists.openembedded.org>
 <CA+chaQeUkj4dX8rSkxK49_7m3ZbFGhLb27zcGDyuhOZdxy_9bg@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CA+chaQeUkj4dX8rSkxK49_7m3ZbFGhLb27zcGDyuhOZdxy_9bg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 20:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203890


On 2024-08-22 2:26 p.m., Martin Jansa via lists.openembedded.org wrote:
> It seems to fail only when ccache is enabled, I'll send patch to add
> CCACHE_DISABLE to numpy recipe to work around this issue for now.

Even with that workaround, I see a more serious issue:

|DEBUG: Executing shell function do_compile
|/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/setup.py:60: 
RuntimeWarning: NumPy 1.26.4 may not yet support Python 3.12.
| warnings.warn(
|Running from numpy source directory.
|/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/setup.py:75: 
DeprecationWarning:
|
| `numpy.distutils` is deprecated since NumPy 1.23.0, as a result
|  of the deprecation of `distutils` itself. It will be removed for
|  Python >= 3.12. For older Python versions it will remain present.
|  It is recommended to use `setuptools < 60.0` for those Python versions.
|  For more details, see:
| https://numpy.org/devdocs/reference/distutils_status_migration.html
|
|
|  import numpy.distutils.command.sdist
|Traceback (most recent call last):
|  File 
"/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/setup.py", 
line 483, in <module>
|    from numpy.distutils.core import numpy_cmdclass as cmdclass
|  File 
"/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/numpy/distutils/core.py", 
line 24, in <module>
|    from numpy.distutils.command import config, config_compiler, \
|  File 
"/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/numpy/distutils/command/config.py", 
line 19, in <module>
|    from numpy.distutils.mingw32ccompiler import generate_manifest
|  File 
"/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/numpy-1.26.4/numpy/distutils/mingw32ccompiler.py", 
line 27, in <module>
|    from distutils.msvccompiler import get_build_version as 
get_build_msvc_version
|ModuleNotFoundError: No module named 'distutils.msvccompiler'
|ERROR: 'python3 setup.py bdist_wheel ' execution failed.

I think we'll need to wait for the numpy upgrade to go in.

>
> On Thu, Aug 22, 2024 at 6:30 PM Martin Jansa via
> lists.openembedded.org <martin.jansa=gmail.com@lists.openembedded.org>
> wrote:
>> This seems to break python3-numpy build.
>>
>> I guess it can be resolved by upgrading numpy as in:
>> https://lists.openembedded.org/g/openembedded-core/message/203231
>> which switches from setuptools3 to python_mesonpy
>>
>> Comparing the failing command line it looks like CXX and some other
>> flags are included twice:
>>
>> with: setuptools-72.2.0:
>>
>> ccache \
>> aarch64-oe-linux-g++ \
>> -fstack-protector-all \
>> -O2 \
>> -D_FORTIFY_SOURCE=2 \
>> -Wformat \
>> -Wformat-security \
>> -Werror=format-security \
>> -Werror=return-type \
>> -funwind-tables \
>> --sysroot=WORKDIR/recipe-sysroot \
>> -O2 \
>> -g \
>> -fcanon-prefix-map \
>> -fmacro-prefix-map=WORKDIR/numpy-1.26.4=/usr/src/debug/python3-numpy/1.26.4 \
>> -fdebug-prefix-map=WORKDIR/numpy-1.26.4=/usr/src/debug/python3-numpy/1.26.4 \
>> -fmacro-prefix-map=WORKDIR/numpy-1.26.4=/usr/src/debug/python3-numpy/1.26.4 \
>> -fdebug-prefix-map=WORKDIR/numpy-1.26.4=/usr/src/debug/python3-numpy/1.26.4 \
>> -fdebug-prefix-map=WORKDIR/recipe-sysroot= \
>> -fmacro-prefix-map=WORKDIR/recipe-sysroot= \
>> -fdebug-prefix-map=WORKDIR/recipe-sysroot-native= \
>> -pipe \
>> -fvisibility-inlines-hidden \
>> aarch64-oe-linux-g++ \
>> -fstack-protector-all \
>> -O2 \
>> -D_FORTIFY_SOURCE=2 \
>> -Wformat \
>> -Wformat-security \
>> -Werror=format-security \
>> -Werror=return-type \
>> -funwind-tables \
>> --sysroot=WORKDIR/recipe-sysroot \
>> -shared \
>> -Wl,-O1 \
>> -Wl,--hash-style=gnu \
>> -Wl,--as-needed \
>> -fcanon-prefix-map \
>> -fmacro-prefix-map=WORKDIR/numpy-1.26.4=/usr/src/debug/python3-numpy/1.26.4 \
>> -fdebug-prefix-map=WORKDIR/numpy-1.26.4=/usr/src/debug/python3-numpy/1.26.4 \
>> -fmacro-prefix-map=WORKDIR/numpy-1.26.4=/usr/src/debug/python3-numpy/1.26.4 \
>> -fdebug-prefix-map=WORKDIR/numpy-1.26.4=/usr/src/debug/python3-numpy/1.26.4 \
>> -fdebug-prefix-map=WORKDIR/recipe-sysroot= \
>> -fmacro-prefix-map=WORKDIR/recipe-sysroot= \
>> -fdebug-prefix-map=WORKDIR/recipe-sysroot-native= \
>> -Wl,-z,relro,-z,now \
>> -O2 \
>> -g \
>> -fcanon-prefix-map \
>> -fmacro-prefix-map=WORKDIR/numpy-1.26.4=/usr/src/debug/python3-numpy/1.26.4 \
>> -fdebug-prefix-map=WORKDIR/numpy-1.26.4=/usr/src/debug/python3-numpy/1.26.4 \
>> -fmacro-prefix-map=WORKDIR/numpy-1.26.4=/usr/src/debug/python3-numpy/1.26.4 \
>> -fdebug-prefix-map=WORKDIR/numpy-1.26.4=/usr/src/debug/python3-numpy/1.26.4 \
>> -fdebug-prefix-map=WORKDIR/recipe-sysroot= \
>> -fmacro-prefix-map=WORKDIR/recipe-sysroot= \
>> -fdebug-prefix-map=WORKDIR/recipe-sysroot-native= \
>> -pipe \
>> -fvisibility-inlines-hidden \
>> build/temp.linux-x86_64-cpython-312/build/src.linux-x86_64-3.12/numpy/core/src/multiarray/_multiarray_tests.o
>> \
>> build/temp.linux-x86_64-cpython-312/numpy/core/src/common/mem_overlap.o \
>> build/temp.linux-x86_64-cpython-312/numpy/core/src/common/npy_argparse.o \
>> build/temp.linux-x86_64-cpython-312/numpy/core/src/common/npy_hashtable.o \
>> -LWORKDIR/recipe-sysroot/usr/lib \
>> -Lbuild/temp.linux-x86_64-cpython-312 \
>> -lnpymath \
>> -o \
>> build/lib.linux-x86_64-cpython-312/numpy/core/_multiarray_tests.cpython-312-aarch64-linux-gnu.so
>>
>> --- setuptools-72.1.0   2024-08-22 18:17:36.941146726 +0200
>> +++ setuptools-72.2.0   2024-08-22 18:17:27.208147768 +0200
>> @@ -9,6 +9,28 @@
>>   -Werror=return-type \
>>   -funwind-tables \
>>   --sysroot=WORKDIR/recipe-sysroot \
>> +-O2 \
>> +-g \
>> +-fcanon-prefix-map \
>> +-fmacro-prefix-map=WORKDIR/numpy-1.26.4=/usr/src/debug/python3-numpy/1.26.4 \
>> +-fdebug-prefix-map=WORKDIR/numpy-1.26.4=/usr/src/debug/python3-numpy/1.26.4 \
>> +-fmacro-prefix-map=WORKDIR/numpy-1.26.4=/usr/src/debug/python3-numpy/1.26.4 \
>> +-fdebug-prefix-map=WORKDIR/numpy-1.26.4=/usr/src/debug/python3-numpy/1.26.4 \
>> +-fdebug-prefix-map=WORKDIR/recipe-sysroot= \
>> +-fmacro-prefix-map=WORKDIR/recipe-sysroot= \
>> +-fdebug-prefix-map=WORKDIR/recipe-sysroot-native= \
>> +-pipe \
>> +-fvisibility-inlines-hidden \
>> +aarch64-oe-linux-g++ \
>> +-fstack-protector-all \
>> +-O2 \
>> +-D_FORTIFY_SOURCE=2 \
>> +-Wformat \
>> +-Wformat-security \
>> +-Werror=format-security \
>> +-Werror=return-type \
>> +-funwind-tables \
>> +--sysroot=WORKDIR/recipe-sysroot \
>>   -shared \
>>   -Wl,-O1 \
>>   -Wl,--hash-style=gnu \
>> @@ -33,6 +55,7 @@
>>   -fmacro-prefix-map=WORKDIR/recipe-sysroot= \
>>   -fdebug-prefix-map=WORKDIR/recipe-sysroot-native= \
>>   -pipe \
>> +-fvisibility-inlines-hidden \
>>   build/temp.linux-x86_64-cpython-312/build/src.linux-x86_64-3.12/numpy/core/src/multiarray/_multiarray_tests.o
>> \
>>   build/temp.linux-x86_64-cpython-312/numpy/core/src/common/mem_overlap.o \
>>   build/temp.linux-x86_64-cpython-312/numpy/core/src/common/npy_argparse.o \
>>
>> failing with:
>> WORKDIR/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../libexec/aarch64-oe-linux/gcc/aarch64-oe-linux/14.2.0/ld:
>> cannot find aarch64-oe-linux-g++: No such file or directory
>> collect2: error: ld returned 1 exit status
>>
>> On Tue, Aug 20, 2024 at 8:52 AM wangmy via lists.openembedded.org
>> <wangmy=fujitsu.com@lists.openembedded.org> wrote:
>>> From: Wang Mingyu <wangmy@fujitsu.com>
>>>
>>> Changelog:
>>> - Support for Pathlike objects in data files and extensions
>>> - native support for C++ compilers
>>> - removed unused get_msvcr()
>>>
>>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>>> ---
>>>   ...ython3-setuptools_72.1.0.bb => python3-setuptools_72.2.0.bb} | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>   rename meta/recipes-devtools/python/{python3-setuptools_72.1.0.bb => python3-setuptools_72.2.0.bb} (94%)
>>>
>>> diff --git a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb b/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
>>> similarity index 94%
>>> rename from meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
>>> rename to meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
>>> index 945d443aff..63ea999960 100644
>>> --- a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
>>> +++ b/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
>>> @@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
>>>   SRC_URI += " \
>>>               file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
>>>
>>> -SRC_URI[sha256sum] = "8d243eff56d095e5817f796ede6ae32941278f542e0f941867cc05ae52b162ec"
>>> +SRC_URI[sha256sum] = "80aacbf633704e9c8bfa1d99fa5dd4dc59573efcf9e4042c13d3bcef91ac2ef9"
>>>
>>>   DEPENDS += "python3"
>>>
>>> --
>>> 2.34.1
>>>
>>>
>>>
>>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#203661): https://lists.openembedded.org/g/openembedded-core/message/203661
>> Mute This Topic: https://lists.openembedded.org/mt/107996505/7611679
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

