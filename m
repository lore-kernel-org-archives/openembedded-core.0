Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08939C369D5
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 15:31:06 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.750.1745508657696945833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 08:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=khRMQq6d;
 spf=pass (domain: baylibre.com, ip: 209.85.160.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4774193fdffso20125221cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 08:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745508655; x=1746113455; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wyr7izJef2CntDp2cQ++c7mqehOxxt1PJEz1tgLnnJU=;
        b=khRMQq6drxh0Dn7OrnrSI5ghpay0TAxkFeFFzb4jXtxGV3Vsr3QHF+rLzkQon946D5
         S2/F+220SZCw4k/nGs70HXxEO+XOnXuHH0NcfJYOCRXXfxd5vZM0Cd2pDM95DTjnuO+q
         bnltxvjPtw5Ocr9Im9g7Q0wyu+X41T1pJ/5YYG7y12BEMXC6dbnFpQ9TkoAOPssSuvY3
         Nspf0X9Hj6qVNZpobLWe4epy5H7mrBMA2NUZT48Z9DOhv172+ZUxUydqVvHd7GHh/EBR
         assiu5qUM1lZuU0htq337DXqx+BnSAKc+ad+VIHd4YBnGJwASKzsR2MH9aTiYVUISvJa
         abLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745508655; x=1746113455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wyr7izJef2CntDp2cQ++c7mqehOxxt1PJEz1tgLnnJU=;
        b=WRlcFYY7cAxeYauQGUIJfOLKA3luVF4bERzBXJuBzw+dfDvdAP2IfJCfis29l11mPU
         H0uEQTGEukFVWFGoyrbcSE0yF5eCElTIiiyNYULiLTn6GpGC6EnRH8H1w5g5i7UbLJob
         txGHzWe9wmn6cva39mSePVnDM/yezg8VmIf8g4SkmGJFBtLDhv6oIwomNmYskb4MXxlb
         Uv1XMUd7FGcI4iRm0nPrbx36Q5e7b/ky43a+M3+rDCyKSy0FhLO53nTjjfdOsukjuOll
         hKNgzDbtrRjPgZq3it99e+arC9KEPFtsrHUu+/ih5tdZ2OTR+xPamNEQUbe38NXxc1Vp
         8QWA==
X-Gm-Message-State: AOJu0Yy4rlYU4pFGigAlvMAAe0Lbt9VuRDT+yA4qMfDwaq0LnpTfTY4J
	DHdUG1mdohrNSnTuBquE+HGRkd3mJpG7vescgBohnywbqxOJveugcOU7uJ6X6vC6DX7qR7oVtgC
	l0K0=
X-Gm-Gg: ASbGncs8vcKIIJjJP0UPAr9efGfFPX7WgLBdKZof5k2UEWbjVSGrzKok3nordsMcINh
	4fy1VePIs7XKtB8yVHY2CGK6kgTJLxsLrXYKv3Hngz7c1af6NPGmHPufvz0KT8v2t6Z95QBYAaE
	N8SE0y/GS8c+NpPZiTXGf9/pVje+TKi0TLfkTjcdTKmSt33+PaMl9H0o/uRvRHY3goELBUXUWll
	v24T8pydL95nHPxtWs7xf7eYk2MDVVQi04Kl16If/h/MpAxqwSnYRjr432d/N10h4B5EC+EratV
	ffqA4RKCa/+wOwYs7Fnh/GHQUrwIy4ZxcLOp+ownrhD2lNszAPH90u7SsfNpTAvRILYLZwIqbNx
	rsdwNXqaZ
X-Google-Smtp-Source: AGHT+IHdMEKfUrgbZxQYdwd4Im9ErvS0VJrIGTbTanC2yVaGmrNANPzdz4QYiiZ0r0GVq/ql1UiKXQ==
X-Received: by 2002:ac8:5f85:0:b0:476:a6bc:a94d with SMTP id d75a77b69052e-47fb9bdc956mr2260881cf.19.1745508654691;
        Thu, 24 Apr 2025 08:30:54 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ea179413fsm12817381cf.62.2025.04.24.08.30.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 08:30:54 -0700 (PDT)
Message-ID: <46ef9d0f-876d-427e-9ffd-8016c04d7992@baylibre.com>
Date: Thu, 24 Apr 2025 11:30:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 2/2] python3-numpy: fix ptests
To: openembedded-core@lists.openembedded.org
References: <20250424142918.3811330-1-tgamblin@baylibre.com>
 <183947846897B688.2677@lists.openembedded.org>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <183947846897B688.2677@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 15:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215388


On 2025-04-24 10:29, Trevor Gamblin via lists.openembedded.org wrote:
> Fix the numpy ptests by doing the following:
>
> - Add gcc and meson as ptest RDEPENDS in the recipe;
For the record, I counted 10 tests that require a compiler to work, 
hence why gcc is added.
> - Convert run-ptest to a shell script that sets PYTEST_DEBUG_TEMPROOT
>    to a directory inside the same path that contains the script, create
>    that directory, and then invoke the tests in the same manner as before
>    with 'python3 -c ...';
> - Add a patch to skip the test_big_arrays test, which uses a lot of
>    space;
> - Set 'IMAGE_ROOTFS_EXTRA_SPACE = "3048576"' for python3-numpy in
>    core-image-ptest.bb;
> - Also set 'QB_MEM:virtclass-mcextend-python3-numpy = "-m 4096"' in
>    core-image-ptest.bb;
> - Move python3-numpy from the PTESTS_PROBLEMS list to the PTESTS_SLOW
>    one.
>
> Results on qemux86-64:
>
> |==== 47301 passed, 4171 skipped, 33 xfailed, 5 xpassed in 148.64s (0:02:28) ====
> |DURATION: 152
> |END: /usr/lib/python3-numpy/ptest
> |2025-04-24T14:02
> |STOP: ptest-runner
> |TOTAL: 1 FAIL: 0
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>   meta/conf/distro/include/ptest-packagelists.inc     |  2 +-
>   meta/recipes-core/images/core-image-ptest.bb        |  4 ++++
>   .../recipes-devtools/python/python3-numpy/run-ptest | 13 +++++++++----
>   meta/recipes-devtools/python/python3-numpy_2.2.5.bb |  3 +++
>   4 files changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index f3fdededf66..2a27c0c5d41 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -120,6 +120,7 @@ PTESTS_SLOW = "\
>       python3-cffi \
>       python3-click \
>       python3-cryptography \
> +    python3-numpy \
>       python3-xmltodict \
>       strace \
>       tar \
> @@ -155,5 +156,4 @@ PTESTS_PROBLEMS = "\
>       mdadm \
>       numactl \
>       python3-license-expression \
> -    python3-numpy \
>   "
> diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
> index a0ff8d9528e..e703e852123 100644
> --- a/meta/recipes-core/images/core-image-ptest.bb
> +++ b/meta/recipes-core/images/core-image-ptest.bb
> @@ -27,10 +27,14 @@ IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools = "1524288"
>   # tar-ptest in particular needs more space
>   IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-tar = "1524288"
>   
> +# python3-numpy-ptest requires a lot of extra space
> +IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-python3-numpy = "3048576"
> +
>   # ptests need more memory than standard to avoid the OOM killer
>   QB_MEM = "-m 1024"
>   QB_MEM:virtclass-mcextend-lttng-tools = "-m 4096"
>   QB_MEM:virtclass-mcextend-python3 = "-m 2048"
> +QB_MEM:virtclass-mcextend-python3-numpy = "-m 4096"
>   QB_MEM:virtclass-mcextend-python3-cryptography = "-m 5100"
>   QB_MEM:virtclass-mcextend-tcl = "-m 5100"
>   
> diff --git a/meta/recipes-devtools/python/python3-numpy/run-ptest b/meta/recipes-devtools/python/python3-numpy/run-ptest
> index 9a1c72aeb10..47a647a8ea2 100644
> --- a/meta/recipes-devtools/python/python3-numpy/run-ptest
> +++ b/meta/recipes-devtools/python/python3-numpy/run-ptest
> @@ -1,5 +1,10 @@
> -#!/usr/bin/env python3
> -
> -import numpy
> -numpy.test(label='full', verbose=2)
> +#!/bin/sh
>   
> +# By default, numpy will use /tmp as the root path for temporary files used
> +# during tests, but if this is a tmpfs it may fill up quickly and cause many of
> +# the tests to report "no space left on device" errors. Create a custom
> +# directory for these and point pytest at it so we can take advantage of the
> +# storage provided in the rootfs.
> +export PYTEST_DEBUG_TEMPROOT="/usr/lib/python3-numpy/ptest/tmp"
> +mkdir -p /usr/lib/python3-numpy/ptest/tmp
> +python3 -c "import numpy; numpy.test(label='full', verbose=2)"
> diff --git a/meta/recipes-devtools/python/python3-numpy_2.2.5.bb b/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
> index c6a37c0a85f..b29c7c5b79d 100644
> --- a/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
> +++ b/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
> @@ -10,6 +10,7 @@ SRCNAME = "numpy"
>   SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
>              file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
>              file://fix_reproducibility.patch \
> +           file://0001-lib-tests-test_io-skip-test_big_arrays.patch \
>              file://run-ptest \
>              "
>   SRC_URI[sha256sum] = "a9c0d994680cd991b1cb772e8b297340085466a6fe964bc9d4e80f5e2f43c291"
> @@ -67,6 +68,8 @@ RDEPENDS:${PN}-ptest += "python3-pytest \
>                            python3-resource \
>                            python3-typing-extensions \
>                            ldd \
> +                         meson \
> +                         gcc \
>   "
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215379): https://lists.openembedded.org/g/openembedded-core/message/215379
> Mute This Topic: https://lists.openembedded.org/mt/112433969/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

