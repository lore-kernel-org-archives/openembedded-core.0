Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E5CC369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 17:30:52 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.12132.1745602250297874241
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 10:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=ggs6i4zO;
 spf=pass (domain: baylibre.com, ip: 209.85.222.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c5f720c717so421814985a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 10:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745602249; x=1746207049; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ulNU42Roa0SBHc0lvgqTWNBJc/qcJChWDSLR4thzI3g=;
        b=ggs6i4zOEWMauvwW84fMM+fUBlFNNk5ZVMnlviXYKmJbrgFGyi62b8MIf+TqsdLxEi
         9uZ4cThAHswpc0uapCFLWSBipnvOXFL1kj5gptHMGfyERZvax2Pd96eRu9klLL0miI5/
         sEnGHFOjnGjylGaaSOW1nnk3PNdXlIKSq0w4gnO+RKNRsD+BlF71qpMuVYybJ1JPIPcg
         M+fd+H0jxlXbKLu6yJTGbiMAdnsHabz+bY3o85EtfQeBtlupqSUsj+K8ulRyYl0mX852
         T1G9s6VDDpnbfCZ44HkusIapIt7VgfbtTnn40cYxbZ5BO3Ro+Ysz9JRntzchwzZQtqHF
         2TfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602249; x=1746207049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ulNU42Roa0SBHc0lvgqTWNBJc/qcJChWDSLR4thzI3g=;
        b=KDndMvlfQGEQDyn8DmpVM3SrXzko/zZtF8JmkNRUkTSUwZpkhWrVCHJosSWgeKIkqW
         WvITyj6meV6Mlm0FilVeWZ/oLHh259ZqRn+0G80nHMR3ZPlnCIrNCHXAWoREXfkJHuMO
         9zTEybG0X+U+cjAcqID0OZ/AWr4JRVQqXPROVML5KkTO7diWTf233FFedmXbXZc6wfzx
         FuZQSizG+vy1ZCOvpqfIg2jczSy4lZCzt37XWIW3G3JwgTF1mHVXUoEvT8SUWF5QSdKo
         Dn2MKZLPggATAP5WShBT7syyfKWXmdvMFvbfehD0fkxg2hW6CxLEiWRevQIEGoBYiw0G
         4xZA==
X-Forwarded-Encrypted: i=1; AJvYcCXp5sj/kbTW4R5FGFXVZLRavTy9FMEB70gbugl29X3RrZSNKpvVb3YLK49k2UbPtwx+et60KxN10eVfjh5CUJ8nPg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzt7kHe1MqbmfxZQZ7SFwPOBtn/JCCuwr6VfTTmuW7Ca1FDJgJN
	5oj1FnW+8RfAHfvAwwYXXFNXJKQTnGyvsSMtAR/Z+WmYITleE1+foeL3riEgMQ/yI5Y1JGIa8fO
	fkiA=
X-Gm-Gg: ASbGncszvkxzcf6GZEG7oBeclXcp0fa6j160pnFsO03S0nv5D0wNC1MbQRrK38YiC36
	dE9h4XVjqWiD/ftOPJGsnwvMT8UeFGdzvL6uo4IhD3atU/zdmMDX0xqUa+Ejvogf36vT23l8qkJ
	/SpC0qKEXL82ITJi73vgqsZ5KxuxzD5/ABcDUzFBtG4iKyRrYsr9mx7ZPVS+vtLKBe5pLtmNiiD
	mE+TnmqS/Sq9jpY6UEyh9+Sc4BytLqOIszqNRrUG66t/uIkioZXnKVce7dcoHaDp1AZAQaxnYpy
	btVjAHlmF4Ppwc31CSiN1w1TCSBkrsBoTE6EkOvXigAQhbFNTydEb9ayfYEahDqMghQUndcaiz/
	L/QDAlyxA
X-Google-Smtp-Source: AGHT+IGEqRYj01B3pekUISV2gACzrrELA7LyZ5hjNE3r92rr4m5y/Mze8Y5zlG7g41uEpvgPM3lnNA==
X-Received: by 2002:a05:620a:2992:b0:7ac:bc66:5efb with SMTP id af79cd13be357-7c958659f98mr1142477485a.27.1745602249289;
        Fri, 25 Apr 2025 10:30:49 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958e9fdfbsm241597785a.94.2025.04.25.10.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 10:30:48 -0700 (PDT)
Message-ID: <a9a94cb6-1841-4362-8d4c-9d62ee87c654@baylibre.com>
Date: Fri, 25 Apr 2025 13:30:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 2/2 v2] python3-numpy: fix ptests
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20250424162759.3892597-1-tgamblin@baylibre.com>
 <20250424162759.3892597-3-tgamblin@baylibre.com>
 <35c84ceda71ce5ab99b4d690541a62c4409bf145.camel@linuxfoundation.org>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <35c84ceda71ce5ab99b4d690541a62c4409bf145.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 17:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215488


On 2025-04-25 03:30, Richard Purdie wrote:
> On Thu, 2025-04-24 at 12:27 -0400, Trevor Gamblin via lists.openembedded.org wrote:
>> Fix the numpy ptests by doing the following:
>>
>> - Add gcc and meson as ptest RDEPENDS in the recipe, and clean up the RDEPENDS
>>    lists (sorting alphabetically) in the process;
>> - Convert run-ptest to a shell script that sets PYTEST_DEBUG_TEMPROOT
>>    to a directory inside the same path that contains the script, create
>>    that directory, and then invoke the tests in the same manner as before
>>    with 'python3 -c ...', before finally running 'rm -rf' on the directory we
>>    created (so that the space is freed up);
>> - Add a patch to skip the test_big_arrays test, which uses a lot of
>>    space;
>> - Set 'IMAGE_ROOTFS_EXTRA_SPACE = "3048576"' for python3-numpy in
>>    core-image-ptest.bb;
>> - Also set 'QB_MEM:virtclass-mcextend-python3-numpy = "-m 4096"' in
>>    core-image-ptest.bb;
>> - Move python3-numpy from the PTESTS_PROBLEMS list to the PTESTS_SLOW
>>    one.
>>
>> Results on qemux86-64:
>>
>>> ==== 47301 passed, 4171 skipped, 33 xfailed, 5 xpassed in 148.64s (0:02:28) ====
>>> DURATION: 152
>>> END: /usr/lib/python3-numpy/ptest
>>> 2025-04-24T14:02
>>> STOP: ptest-runner
>>> TOTAL: 1 FAIL: 0
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>> v2 cleans up the RDEPENDS lists in the recipe (after we added gcc and meson),
>> and also tweaks run-ptest to remove the temporary directory after the tests are
>> done to save space.
>>
>>   .../distro/include/ptest-packagelists.inc     |  2 +-
>>   meta/recipes-core/images/core-image-ptest.bb  |  4 +++
>>   .../python/python3-numpy/run-ptest            | 15 ++++++---
>>   .../python/python3-numpy_2.2.5.bb             | 33 +++++++++++--------
>>   4 files changed, 35 insertions(+), 19 deletions(-)
>>
>> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
>> index f3fdededf66..2a27c0c5d41 100644
>> --- a/meta/conf/distro/include/ptest-packagelists.inc
>> +++ b/meta/conf/distro/include/ptest-packagelists.inc
>> @@ -120,6 +120,7 @@ PTESTS_SLOW = "\
>>       python3-cffi \
>>       python3-click \
>>       python3-cryptography \
>> +    python3-numpy \
>>       python3-xmltodict \
>>       strace \
>>       tar \
>> @@ -155,5 +156,4 @@ PTESTS_PROBLEMS = "\
>>       mdadm \
>>       numactl \
>>       python3-license-expression \
>> -    python3-numpy \
>>   "
>> diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
>> index a0ff8d9528e..73270d10676 100644
>> --- a/meta/recipes-core/images/core-image-ptest.bb
>> +++ b/meta/recipes-core/images/core-image-ptest.bb
>> @@ -27,11 +27,15 @@ IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools = "1524288"
>>   # tar-ptest in particular needs more space
>>   IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-tar = "1524288"
>>   
>> +# python3-numpy-ptest requires a lot of extra space
>> +IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-python3-numpy = "3048576"
>> +
>>   # ptests need more memory than standard to avoid the OOM killer
>>   QB_MEM = "-m 1024"
>>   QB_MEM:virtclass-mcextend-lttng-tools = "-m 4096"
>>   QB_MEM:virtclass-mcextend-python3 = "-m 2048"
>>   QB_MEM:virtclass-mcextend-python3-cryptography = "-m 5100"
>> +QB_MEM:virtclass-mcextend-python3-numpy = "-m 4096"
>>   QB_MEM:virtclass-mcextend-tcl = "-m 5100"
>>   
>>   TEST_SUITES = "ping ssh parselogs ptest"
>> diff --git a/meta/recipes-devtools/python/python3-numpy/run-ptest b/meta/recipes-devtools/python/python3-numpy/run-ptest
>> index 9a1c72aeb10..10dfb1246d3 100644
>> --- a/meta/recipes-devtools/python/python3-numpy/run-ptest
>> +++ b/meta/recipes-devtools/python/python3-numpy/run-ptest
>> @@ -1,5 +1,12 @@
>> -#!/usr/bin/env python3
>> -
>> -import numpy
>> -numpy.test(label='full', verbose=2)
>> +#!/bin/sh
>>   
>> +# By default, numpy will use /tmp as the root path for temporary files used
>> +# during tests, but if this is a tmpfs it may fill up quickly and cause many of
>> +# the tests to report "no space left on device" errors. Create a custom
>> +# directory for these and point pytest at it so we can take advantage of the
>> +# storage provided in the rootfs.
>> +TEMPROOT="/usr/lib/python3-numpy/ptest/tmp"
>> +export PYTEST_DEBUG_TEMPROOT="$TEMPROOT"
>> +mkdir -p "$TEMPROOT"
>> +python3 -c "import numpy; numpy.test(label='full', verbose=2)"
>> +rm -rf "$TEMPROOT"
>> diff --git a/meta/recipes-devtools/python/python3-numpy_2.2.5.bb b/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
>> index c6a37c0a85f..05d2b1a1f2c 100644
>> --- a/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
>> +++ b/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
>> @@ -10,6 +10,7 @@ SRCNAME = "numpy"
>>   SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
>>              file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
>>              file://fix_reproducibility.patch \
>> +           file://0001-lib-tests-test_io-skip-test_big_arrays.patch \
>>              file://run-ptest \
>>              "
>>   SRC_URI[sha256sum] = "a9c0d994680cd991b1cb772e8b297340085466a6fe964bc9d4e80f5e2f43c291"
> The patch file is missing from the patch you've sent!
Oops. v3 incoming...
>
> Cheers,
>
> Richard

