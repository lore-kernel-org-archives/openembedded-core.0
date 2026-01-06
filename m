Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02697CEFD09
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 20:54:13 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.100404.1767732851127476066
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 12:54:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=QY+1xSUr;
 spf=pass (domain: baylibre.com, ip: 209.85.128.44, mailfrom: tgamblin@baylibre.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47774d3536dso1925355e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 12:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767732849; x=1768337649; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=diKic2T4IRtAfUku7iI9jgycEqhnk07Rhvm8XTzFlW0=;
        b=QY+1xSUrHzv6nmAgSox6K3umuQ31EIsaCiy57GQyvkuvs6/YOZ95optPTle6A7BaBP
         1wdQQnrROLDI5vqZObCu/VFWbGCbQF27rvr+ebSbYXt2xQwHJYW48f+F4IuNw8Ht2ybp
         NOhbVkfOJp/StxE8xJY/g2XvMFi/M/ZfB95Qzvtt/m181MANLjgRX62CfiXOFZQCd/BS
         pgu28LEecFDfXb9NhTesX+kRamRyCwEn8aNcH1sDVa7d471fUGhZ4ffoPklDjoBGUDlN
         MRgSbqelX0Dmx0ZYHDsOncM5ZdRz/dCkYKkGtX32A5ida91ED0W6O+LaAk4Yc/zfzzB4
         9TRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767732849; x=1768337649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=diKic2T4IRtAfUku7iI9jgycEqhnk07Rhvm8XTzFlW0=;
        b=lBMUy9hGjMQbfWLavjCQXQtZRJRjIDUwI6TH7PDW6/QSAyp21/kSQorxhgyv3KT3ka
         nEOBtpedPxD+5M3UA31QY76O/GAlL4A7yOMHPqbGNXZq+bAx8jvBiRzt+ovEla9/bmLd
         H/ziYGeMDHcDeQihxh2fX+lrGvpgMN3vFqqCnwgS8HW0drK53XL34Ma3L3x6rRpf/zY4
         2Oya1xiXQDQGPISjBYK4EZuJQpBgtEHzWk9DNAZvPqb6ohxazn4TSlO4wnRluY6qPVnz
         d9gWML450XQWnFst/FCM/efCivdAFl3AKUzO4r0VPNhClsOalI5eOu+7PENtTxwZUGVH
         hxdg==
X-Forwarded-Encrypted: i=1; AJvYcCXLd0M1lNfFK9AVFIorVx+yVnqq8zETcIaaThJlz8UdpeJjeR2x8oee5UU9RvySoDnImYiEMInkMEvGjm4+Xgy8BA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzy9B0io0ZnPy6MhjP4oS2j2kGeIDA5ehY9lDulJ0t7MxUGADpH
	3KPDtrovBEvGIskOMp2h8JVsmxJ0cBDWRYijkjXn2n8jsjPP9nUg6RJ9tBNjIPJqhBQ8FI6Bhcc
	mclrm29k=
X-Gm-Gg: AY/fxX5mVuUHtn4fwvrFsppeyFHqhlTIWN4MkmRWNH5u9d1h1kinlkVXLqk/XTWY0/e
	keV+BWqFlbLvvh+qoEdkQEEm8JV4VaRel9vzpLAFCDmmm3fDcPHpTPhCEldMhoYvGLGzuzh9IcF
	lKqF87aTj2Wut/K1RYv/Yl3CncpsHhto2r/+sfP4nZMlQLW2jxUVUmyd5plUKsdp6wtvTTUxbd+
	tAbPI4v/D2+OuJ+2le5wz4N3yIAPWD8OvTLnrqMv4RaPMPATaFFGPaclRkuWgl7p6lR5ESYfKC2
	8rpq2W78kb7P1ZMq4mC11dAj6ftBvdkVLAAMIn2PoXd4uX1FkDjImZfAiQ0KZBYKK3CdEo5B9Gm
	WYj5VY6rprGPDTvuXKG0/JhaPDvDgYIGwJzlFHYypgCIsEqtl0qJgzl22pTOpMnWqWLE0ko/NQ+
	qrPUeO+ZhuhuGK3spSIjKJ2jRfvtQCcZ2VQXtSlqmz4yK/Qq5aichENjGdD438oVtF
X-Google-Smtp-Source: AGHT+IEQpCQAg4GIKt4tRK8HZ4daKSnD4VQ79iBijBxjSiK8FZp/2iNvRM/v7I/8tcmpB1WYrPForw==
X-Received: by 2002:a05:600c:3ba9:b0:477:9d88:2da6 with SMTP id 5b1f17b1804b1-47d847d0f30mr5652865e9.0.1767732849548;
        Tue, 06 Jan 2026 12:54:09 -0800 (PST)
Received: from ?IPV6:2001:1970:3847:e000:1977:be2f:4a71:2892? ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f4184e1sm62314835e9.4.2026.01.06.12.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 12:54:08 -0800 (PST)
Message-ID: <ee9431df-2e5a-4d0d-a5eb-031e9247a912@baylibre.com>
Date: Tue, 6 Jan 2026 15:54:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] python3-numpy: upgrade 2.3.5 -> 2.4.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20260105171830.3762638-1-tgamblin@baylibre.com>
 <DFHISGOL9ZIH.23RLCKD2MBHAS@bootlin.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <DFHISGOL9ZIH.23RLCKD2MBHAS@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 20:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228929


On 2026-01-06 07:54, Mathieu Dubois-Briand wrote:
> On Mon Jan 5, 2026 at 6:18 PM CET, Trevor Gamblin wrote:
>> Changelog: https://github.com/numpy/numpy/releases/tag/v2.4.0
>>
>> ptests look OK:
>>
>> |============================================================================
>> |Testsuite summary
>> |# TOTAL: 48248
>> |# PASS: 46447
>> |# SKIP: 1767
>> |# XFAIL: 32
>> |# FAIL: 0
>> |# XPASS: 2
>> |# ERROR: 0
>> |DURATION: 327
>> |END: /usr/lib/python3-numpy/ptest
>> |2026-01-05T16:24
>> |STOP: ptest-runner
>> |TOTAL: 1 FAIL: 0
>> |root@qemux86-64:~#
>>
>> and reproducibility:
>>
>> |2026-01-05 12:08:19,641 - oe-selftest - INFO - Ran 1 test in 1449.498s
>> |2026-01-05 12:08:19,642 - oe-selftest - INFO - OK
>> |2026-01-05 12:08:23,069 - oe-selftest - INFO - RESULTS:
>> |2026-01-05 12:08:23,069 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: PASSED (1402.66s)
>> |2026-01-05 12:08:23,069 - oe-selftest - INFO - SUMMARY:
>> |2026-01-05 12:08:23,070 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1449.498s
>> |2026-01-05 12:08:23,070 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
> Hi Trevor,
>
> Thanks for your patch, and thanks for launching ptest and
> reproducibility tests. Of course, it failed somewhere else. :)
>
> We have this error while building piglit, reproduced and bisected
> locally:
>
> ERROR: piglit-1.0+gitr-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/piglit/1.0+gitr/temp/run.do_compile.891103' failed with exit code 1
> ...
> | cd /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/piglit/1.0+gitr/build/generated_tests && /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/piglit/1.0+gitr/sources/piglit-1.0+gitr/generated_tests/gen_builtin_uniform_tests_fp64.py > builtin_uniform_tests_fp64.list
> | Traceback (most recent call last):
> |   File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/piglit/1.0+gitr/sources/piglit-1.0+gitr/generated_tests/gen_builtin_uniform_tests_fp64.py", line 47, in <module>
> |     from builtin_function_fp64 import *
> |   File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/piglit/1.0+gitr/sources/piglit-1.0+gitr/generated_tests/builtin_function_fp64.py", line 1147, in <module>
> |     _make_vector_or_matrix_test_vectors(test_suite)
> |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^
> |   File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/piglit/1.0+gitr/sources/piglit-1.0+gitr/generated_tests/builtin_function_fp64.py", line 1122, in _make_vector_or_matrix_test_vectors
> |     f('op-div', 2, _divide, match_simple_binop,
> |     ~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> |       [doubles+dvecs+dmats,
> |       ^^^^^^^^^^^^^^^^^^^^^
> |        doubles+dvecs+dmats],
> |        ^^^^^^^^^^^^^^^^^^^^^
> |       template='({0} / {1})')
> |       ^^^^^^^^^^^^^^^^^^^^^^^
> |   File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/piglit/1.0+gitr/sources/piglit-1.0+gitr/generated_tests/builtin_function_fp64.py", line 1101, in f
> |     _simulate_function(
> |     ~~~~~~~~~~~~~~~~~~^
> |         test_inputs, python_equivalent, tolerance_function),
> |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> |   File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/piglit/1.0+gitr/sources/piglit-1.0+gitr/generated_tests/builtin_function_fp64.py", line 536, in _simulate_function
> |     expected_output = python_equivalent(*inputs)
> |   File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/piglit/1.0+gitr/sources/piglit-1.0+gitr/generated_tests/builtin_function_fp64.py", line 311, in _divide
> |     if any(y_element == 0 for y_element in column_major_values(y)):
> |                                            ~~~~~~~~~~~~~~~~~~~^^^
> |   File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/piglit/1.0+gitr/sources/piglit-1.0+gitr/generated_tests/builtin_function_fp64.py", line 257, in column_major_values
> |     return list(np.reshape(value, newshape=-1, order='F'))
> |                 ~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> | TypeError: reshape() got an unexpected keyword argument 'newshape'
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/3035
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3001
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2982
>
> Can you have a look at this?

Looks like they're using a deprecated parameter (newshape) that finally 
got removed in 2.4.x. I'm sending some patches for piglit (CCing you) 
shortly.

- Trevor

>
> Thanks,
> Mathieu
>

