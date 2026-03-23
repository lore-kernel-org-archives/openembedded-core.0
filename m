Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA79F46136
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 14:49:56 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19405.1774277394968412771
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 07:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ElL9bq0M;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so27451365e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 07:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774277393; x=1774882193; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3XzACXnFkJzHxdJ43IRXBUUs02QlS0KyccvyaWYHbA=;
        b=ElL9bq0MckVG36/NSxURPj6H06RelsOjSionXrsAcRnSsZe7//BpoKD9sdjI/4TOpl
         HEDPNtez0PJCzU5VEuPlurqqGreENPC4id8JCkRKDqNRr0oKE7Xql6KYSKHomUkAYWxy
         wUxiAVyYfG42W2/oymR8+2JaY2uMNRAr79uK7rkmLez49MFBMFw6bmSflq1gLAwzRg9Y
         Xvk1L9TzE3I8qWL4Mhb6D5ZRSrDu5Av/SDGS/aBqXyNv9uWc9gyigyOWYo18eR+vjf8k
         6BeiM4nRseMHs5oFEKYetgh9Q2gNitUHVd8NBpW/D6aS6ddfSSDEwvGNMeMz/mKce400
         iPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774277393; x=1774882193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3XzACXnFkJzHxdJ43IRXBUUs02QlS0KyccvyaWYHbA=;
        b=UX61pAxf7+pTdpFQSzkrswr5uFyzzuvuMjKrXOVJp1pYFI809BrlrTCHILjEB79Blj
         V5kECFrsAd+lsLdUABQVlhi8dVPgSKMjbbJKKMp2gQjNFAvs5gEiFUMiyucsHTK7fy3Z
         yXa1MeW3vMlzR/Ewjfo10YKv65g80P3PBVnyc57wJEig1qLuOrv38owNoi7HrVn6l7AU
         EL6MwoFCphfi5o6Svvi+wDUsOUGTMEXQ/+AUMlzxXL9myzBLBMRejzHTj26XdkST8Flm
         sysSKDxyqUEJaIbLazxJzaNUBF6zEcY75HFGKy9AjiyiZNEIEnTNwcHy7+YmlQJBHZto
         Jbcg==
X-Forwarded-Encrypted: i=1; AJvYcCWh09IswyAj+wTX/2iZ58AYHIaYUBAVRN8DzqPUgc2tpO2ANAGb6oD8oWyxQAlxC8FJzdkG3dbDystuUGUIlYUErg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzcIze3Wo0exMei/5CjVVVOIOMCPfoDIAvhBwijX/UpYG+u1w6b
	gNUec742SMca6OpGjvxQBTOa3GL/8SeHpMN0CTpUsAqSSsj9a3u4o7WN
X-Gm-Gg: ATEYQzwqjYndQrqgKrDi9+PXY3pYujhog/hnOnUVlLrMVxnLI/Lsw+B9BpGAoQEz7Yu
	NI7Nd85B9UW5/gLi1j1DpN6mZdJ2/SGbRAJWFuL3oYcoD99gzj3AHltzYN7NBhxgR4Ho8xpALsH
	rpIN+RiZKMsEP8SG/o00h8HrXahVtnft9ZQ1OrweJdC6VgBWtVZhhWznjevfhEXlUJMLgnrZSFd
	/fGDRdbnVpO4p2xtCbusa9zx5Q/xnkRYQtrJ8VVg+dxWTc/N76M8XNYdCeS84Pa80j17Vcqv0ym
	lN4hhAkMgu9nwADtKymBT8m3f+waVOwT4t7H1msKklOBzZr+P1nsmu+olS8lULqGNCLVyxeC9/R
	Ha1LwMrmuto/2FOatkfV110LfaX+Wo39it8Wfqpdhq8SIVm1afanTNeR1L+46nZFTEzhanN41F8
	S5no7XzIAEFOuI8RVNh5XKnu7m4FJMwujbl+Ng/CqNZsPO1UPdxOG3cL8=
X-Received: by 2002:a05:600c:5294:b0:486:fe46:b647 with SMTP id 5b1f17b1804b1-4870334cb27mr122353045e9.10.1774277393081;
        Mon, 23 Mar 2026 07:49:53 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8359acsm284530555e9.12.2026.03.23.07.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:49:52 -0700 (PDT)
Message-ID: <6de9387a-82b1-4b9b-8076-1392713aa2fd@gmail.com>
Date: Mon, 23 Mar 2026 15:49:51 +0100
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
 <189F7F6305FFFD56.3195838@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <189F7F6305FFFD56.3195838@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 14:49:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233741

2026. 03. 23. 15:40 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2026. 03. 23. 15:34 keltezéssel, Bartosz Golaszewski írta:
>> On Mon, 23 Mar 2026 15:23:52 +0100, "Zoltan Boszormenyi via
>> lists.openembedded.org" <zboszor=gmail.com@lists.openembedded.org>
>> said:
>>>> Any hints on what could be wrong? The same config builds fine without the
>>>> new option. It's just a core-image-minimal on poky with a few python packages
>>>> from meta-openembedded.
>>> The problem is that now the directories are
>>> ${libdir}/python3.14t and ${includedir}/python3.14t
>>>
>>> Note the "t" suffix.
>>>
>>> diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb
>>> b/meta/recipes-devtools/python/python3_3.14.3.bb
>>> index 7a1ad1e386..492f2f93f0 100644
>>> --- a/meta/recipes-devtools/python/python3_3.14.3.bb
>>> +++ b/meta/recipes-devtools/python/python3_3.14.3.bb
>>> @@ -47,7 +47,7 @@ UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
>>>
>>>    CVE_PRODUCT = "python:python python_software_foundation:python cpython"
>>>
>>> -PYTHON_MAJMIN = "3.14"
>>> +PYTHON_MAJMIN = "3.14${@bb.utils.contains('PACKAGECONFIG', 'freethreading', 't', '', 
>>> d)}"
>>>
>>>    S = "${UNPACKDIR}/Python-${PV}"
>>>
>> I think it's more fine-grained, because I'm seeing this:
>
> I also see other issues popping up, first in python3-installer-native.
>
> Probably this setting ("python-freethreading") should be a
> DISTRO_FEATURE and then the python3 recipe would use that
> to enable its PACKAGECONFIG.
>
> PYTHON_DIR in python-dir.bbclass should also be set accordingly.
>
> I suspect that both native and target builds of python3 would have
> to use the same setting, i.e. DISTRO_FEATURE and DISTRO_FEATURE_NATIVE
> must contain python-freethreading. Some build helpers (skbuild, etc.)
> does not seem to distinguish correctly between host python and target.

Plus, this seems to be a long term project to enable freethreaded python
because a lot of modules have status lines like this:

     "Programming Language :: Python :: Free Threading :: 1 - Unstable",

For now, I wouldn't recommend it, only for experimenting.

>
>> ERROR: Task 
>> (/home/brgl/workspace/yocto/python-freethreaded/sources/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_prepare_recipe_sysroot)
>> failed with exit code '1'
>> ERROR: python3-3.14.3-r0 do_package: QA Issue: python3:
>> Files/directories were installed but not shipped in any package:
>>    /usr/bin/python3.14
>> Please set FILES such that these items are packaged. Alternatively if
>> they are unneeded, avoid installing them or delete them within
>> do_install.
>> python3: 1 installed and not shipped files. [installed-vs-shipped]
>> ERROR: python3-3.14.3-r0 do_package: Fatal QA errors were found, failing task.
>> ERROR: Logfile of failure stored in:
>> /home/brgl/workspace/yocto/python-freethreaded/build/tmp/work/x86-64-v3-poky-linux/python3/3.14.3/temp/log.do_package.2308607 
>>
>> ERROR: Task 
>> (/home/brgl/workspace/yocto/python-freethreaded/sources/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_package)
>> failed with exit code '1'
>>
>> The MAJMIN seems to be used for the executable as well and with this change,
>> it's missing from FILES.
>>
>> Bart
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233739): https://lists.openembedded.org/g/openembedded-core/message/233739
> Mute This Topic: https://lists.openembedded.org/mt/118277380/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


