Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF858F46132
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 14:40:46 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19058.1774276841142671020
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 07:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ne79NtNN;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fda2a389so23555505e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 07:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774276839; x=1774881639; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/fb23Pkko7QzDQxzu9vaq7QZWH0FFqBsBecRzcVdDYI=;
        b=ne79NtNN4iGokydhvHkDTkHLZ+Wnv4HY5NbXWXVrg7E3w/D0c94wtwKbpd2y6x+uoM
         ksQPQ8mO/RLRTtzFxZCPDITOECAAlkztbWQGMN4ZwXUZDQ8XzlICzAbUF1Gmlf+RTgyX
         5EQIir2g2vpGjD4vUrWo+rK0f3coBVXP0bfuhhP9Z2wihs3uzn64FwKDxpy1a5o8IDW+
         bHqSgxl2Jx5BaVP+9sXGZfsFyvn7ZjZYs8aazO5yhSDA3UXF5NM2P13naMAMBw5bExOE
         Q4bquszMyjfk+Z8zDueDYau0UefzdlZY/2PFFhyGrJ9UCFTv/mf0T1cacmfV0GEXNqmh
         0+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774276839; x=1774881639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/fb23Pkko7QzDQxzu9vaq7QZWH0FFqBsBecRzcVdDYI=;
        b=NUKVyAzojq9iRTyvf0YNKw2v3WMvfjC/4j5P91EJOy90zfgCafYvIs3UOD+W9mQT6r
         Q3opGpYlFsnRJbNOBttadH+dzkW5TBFDjzqvdSSp7pQu8G6gcoXnlxGt644E8vLZ6p+Q
         ibMeTB3xspiE2zWUn9BNs4cbhwepoKzlyaMlmULtlyIVDGOGV/bapAN9RvEDielGh07/
         qgP8jwdH4XQpR6fXpXTjzZTIu7CoasINaxCDARbsrcy9uo7JDDE81xFdl7/+35WcKasn
         gaDRE+SigdXWb1BJdS+BSrT7KgBxPgQOLKmt4hoYskkKJ9Dmhnpl6ngDZhnDmGa9zQY0
         k9Ig==
X-Forwarded-Encrypted: i=1; AJvYcCW0jFaYjlbOEy1+4o00YRIFyWxV6C0t0aH9Y+0T4VG8a0Tl2/Vk2ovC+7vaNv2VRL59+Snq0izA1yVZRh5s7v0M5w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxlxrEZQEo/DDxwXfIiZlJquIyMTflRxRRKJ8J2dD7iuS5pELVp
	LttHRAnXpmPyhp80lATLVNDbnT3VRArH4JvZPVBHJeD0IXQqftp11pUu
X-Gm-Gg: ATEYQzyB03M5VlyDMmFJX+ep3gFnVdgAPN3QDVT1F/ouskmOemXpQtCHJuVcKZTT6vi
	AcCvzt1aJgKFFoSq8sImv0j1wSsgqfxBtaK05HKQIGoYNs+2BVPovK9XGiTlpUxPOmKFCE7JKGs
	R5zjM93p8pPfaI+kik+G2vgVYxTcRkXD/RqcnoJry9AghmqlavL6JoHsdz/K7pyk13hTsIzA9u3
	GaGhbojCybB5Byqsl/3eOWFKBCOz+bloNgtRGaEC5vavKUd44bNHzmJnMRu0QLdjFsPQJnnv4Mt
	GYur3xN8faxy2b08Rggv8bzx48PFs1E0Z9/KK7V3xtSKthFiK26iRwP9g6LDS72R48BT9J3LCLc
	FmGnGEpp4fI0Fh+xVL1ApPMSDWNKNr5acfxvZ2/dnoVhb9C85vdvwA639OcKyLOG3VWney1Rk7B
	2UPsGY6m653kYOZe5lwu5uSHvUuZ4BPHVn6ZDQ8uUr8m1XrS9IlZ/SVYc=
X-Received: by 2002:a05:600c:5248:b0:486:fdba:f5db with SMTP id 5b1f17b1804b1-486feb5d82emr188413655e9.0.1774276839347;
        Mon, 23 Mar 2026 07:40:39 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff1cb178sm81989635e9.29.2026.03.23.07.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:40:38 -0700 (PDT)
Message-ID: <c59c3cf6-1cb1-42c9-8155-ecc28dab2ae0@gmail.com>
Date: Mon, 23 Mar 2026 15:40:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] python3: Add a new PACKAGECONFIG knob for
 free threading
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: "Zoltan Boszormenyi via lists.openembedded.org"
 <zboszor=gmail.com@lists.openembedded.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20260312120024.3745232-1-zboszor@gmail.com>
 <CAMRc=MeFZMGjW-KXngLwq3kjbA9ic4KaOaPjhPd4Be0DMJ+yTg@mail.gmail.com>
 <c0ef676d-27c6-4db4-9fa0-06a78c38954e@gmail.com>
 <CAMRc=Mfa8R1=eVdHdw1pZL5n33nd+nWvR99=9Qh3fZwTdo24kw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAMRc=Mfa8R1=eVdHdw1pZL5n33nd+nWvR99=9Qh3fZwTdo24kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 14:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233739

2026. 03. 23. 15:34 keltezéssel, Bartosz Golaszewski írta:
> On Mon, 23 Mar 2026 15:23:52 +0100, "Zoltan Boszormenyi via
> lists.openembedded.org" <zboszor=gmail.com@lists.openembedded.org>
> said:
>>> Any hints on what could be wrong? The same config builds fine without the
>>> new option. It's just a core-image-minimal on poky with a few python packages
>>> from meta-openembedded.
>> The problem is that now the directories are
>> ${libdir}/python3.14t and ${includedir}/python3.14t
>>
>> Note the "t" suffix.
>>
>> diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb
>> b/meta/recipes-devtools/python/python3_3.14.3.bb
>> index 7a1ad1e386..492f2f93f0 100644
>> --- a/meta/recipes-devtools/python/python3_3.14.3.bb
>> +++ b/meta/recipes-devtools/python/python3_3.14.3.bb
>> @@ -47,7 +47,7 @@ UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
>>
>>    CVE_PRODUCT = "python:python python_software_foundation:python cpython"
>>
>> -PYTHON_MAJMIN = "3.14"
>> +PYTHON_MAJMIN = "3.14${@bb.utils.contains('PACKAGECONFIG', 'freethreading', 't', '', d)}"
>>
>>    S = "${UNPACKDIR}/Python-${PV}"
>>
> I think it's more fine-grained, because I'm seeing this:

I also see other issues popping up, first in python3-installer-native.

Probably this setting ("python-freethreading") should be a
DISTRO_FEATURE and then the python3 recipe would use that
to enable its PACKAGECONFIG.

PYTHON_DIR in python-dir.bbclass should also be set accordingly.

I suspect that both native and target builds of python3 would have
to use the same setting, i.e. DISTRO_FEATURE and DISTRO_FEATURE_NATIVE
must contain python-freethreading. Some build helpers (skbuild, etc.)
does not seem to distinguish correctly between host python and target.

> ERROR: Task (/home/brgl/workspace/yocto/python-freethreaded/sources/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_prepare_recipe_sysroot)
> failed with exit code '1'
> ERROR: python3-3.14.3-r0 do_package: QA Issue: python3:
> Files/directories were installed but not shipped in any package:
>    /usr/bin/python3.14
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install.
> python3: 1 installed and not shipped files. [installed-vs-shipped]
> ERROR: python3-3.14.3-r0 do_package: Fatal QA errors were found, failing task.
> ERROR: Logfile of failure stored in:
> /home/brgl/workspace/yocto/python-freethreaded/build/tmp/work/x86-64-v3-poky-linux/python3/3.14.3/temp/log.do_package.2308607
> ERROR: Task (/home/brgl/workspace/yocto/python-freethreaded/sources/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_package)
> failed with exit code '1'
>
> The MAJMIN seems to be used for the executable as well and with this change,
> it's missing from FILES.
>
> Bart


