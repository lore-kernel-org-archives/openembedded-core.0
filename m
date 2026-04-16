Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B3EF43841
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:27:10 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7360.1776320820569015221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=N22l/m6z;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cfd96354aso4668324f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776320819; x=1776925619; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Xu4WoWo+D+1d1gEjFoTZHdaKDkj4MlwyYLzKfVXQjE=;
        b=N22l/m6zS2SSX8ypX1fIxBiLsFSCkkm9aQHkL3GGeXGvvMKGKyj5MJWUzY9YQHeoTT
         Xb85QCT/8wloknkPCBAZ9SfLYIsNQUHWGr3f1p6qQVaQhZs0RCqZULevxXpIwFZquIuv
         vOLtUjJ/OrMcE2UeNGbIaeQuxveL5nn0Z5TxwT5EpVL1c4+MATgv8rpdpoQLQTAOhbKT
         G/YF7cm3gu7rAKp+qIi775z35+1yrfJJzhhnW/1uPZjyK9U+F91c9zR9Y/bs0P8HAO8S
         +wl3CAspWT6aR31fMCz1nrO7Bip0GJOAlkAcwAJozFvHcFu0nZV01Sn7CiXDgN5CFkq0
         wOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776320819; x=1776925619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Xu4WoWo+D+1d1gEjFoTZHdaKDkj4MlwyYLzKfVXQjE=;
        b=ZB7K63/+jO065fwTdbCOJXk02qjgRQkoRATjD4zNgb+sBSTxlnV8wuoBRgsE+fx4Ug
         k7bAgtu416JB+ToJif5a3iuqBMMAJymrHWRDuKPKG0eUPya7vCoX7cW/5zOo1WBlBu85
         vvL2tqv/TGtnhUYhEcMLVhyNaRKiCfMwLYbtoxUO3xSwocmmpTIv1ZE4BHG2ZewWKTF5
         JjENBH6qVG1Q+gQOHPusikKBsblHTkiDEtBs1bViiONyZ3ZrONZl1UHkXFa8YVLnvVw5
         AlVRejvWtN98fslVNUriy5mvP4tUHwDYLvLSWIS6ZtS6VpvFF4KNJENzSGDbEEEeD9K6
         YE6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8xxU0vcNU8dIeIYUh62j3NpuUDnVskCTZwCH4BSwJQR1t60rlB5zUSkCfmw3ndrCh1qs/24075MEfTOwkZnZ54gg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw/8BFOZAdZ27tg+G66PFOnZg+gMjlS8+AlwjVus3Bi5t7t+59u
	jKuqT4M0Lbqv3k6DCvjtkWOQBGdPh2jj2Cjy/HubCs3ieuvPtt+oEbt8
X-Gm-Gg: AeBDiet+hj4wdLMUOKH7sTyl5Ik1ADlHxqzcp5Xdko1RqoNKMLSQuLomCQaoiBni02a
	OvLhbSob1fjjRlfxmbnmKDCknOwYPmThyffO569xswvFQxZ4bDewOIXcK099k0CNatTLiOFojwG
	/c3HWqLQFWbjK1wu3evewJcGDZXyWN2oyaDcbQeCCx2bldMRwRjCSTF1CboPvXRTd0efR7JFliH
	CQWTShQAnQ8edvrDmYJ/IczyxziLMMyFn65KMUeldv+QAwgIbbHYl+V8u1/k3AxDfYHktIObn76
	kHRtwaUnVUrptiBclA7CfpKDN+jOQZb2s+7GBorNSbYaIzQ/WI4ywO5yrxsBZMHXD/pQz+tGnn+
	UV3fXjbBIo2xUpr9GuUhKPqMBXDoPz333j+OI6B29m34fZG+Pzf5ZwNC4JBq5f18rhJeJgfTaQL
	GOyquUup42+0oYQjDTAMd/HxB9AiCLq1m4SnjYdlWxY5stVI85T5zlDg==
X-Received: by 2002:a05:6000:1847:b0:43c:f52b:7ff6 with SMTP id ffacd0b85a97d-43d642c09d8mr35664662f8f.37.1776320818752;
        Wed, 15 Apr 2026 23:26:58 -0700 (PDT)
Received: from [192.168.2.123] (95C81E23.dsl.pool.telekom.hu. [149.200.30.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3f92f4sm9339211f8f.34.2026.04.15.23.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 23:26:58 -0700 (PDT)
Message-ID: <02810844-ac6d-4f23-98bc-b8f4f3955c47@gmail.com>
Date: Thu, 16 Apr 2026 08:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 3/7] pseudo: fix for build with glibc-2.43
To: Paul Barker <paul@pbarker.dev>, Martin Jansa <martin.jansa@gmail.com>
Cc: Hemanth.KumarMD@windriver.com, openembedded-core@lists.openembedded.org,
 Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
References: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
 <20260308150834.2508331-3-Hemanth.KumarMD@windriver.com>
 <CA+chaQcneoNBogdCZmZB3LCE-cVErs2-4NoNtYUGgK+REEBxLg@mail.gmail.com>
 <18A40738790ACBCC.657799@lists.openembedded.org>
 <e38f41d9-4af6-4389-90a7-0c2ae6b47330@gmail.com>
 <CA+chaQdDkMUDBO8G=cku8SVe=Ow+Hgt606mZO863rCaNaznDrA@mail.gmail.com>
 <18A41C5827F22307.777565@lists.openembedded.org>
 <ed118dea-62cd-4d29-9ee1-336367a2aae5@gmail.com>
 <1b979680925d535d3cd344a8b736b8f862d52498.camel@pbarker.dev>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <1b979680925d535d3cd344a8b736b8f862d52498.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235341

2026. 04. 08. 11:44 keltezéssel, Paul Barker írta:
> On Tue, 2026-04-07 at 17:38 +0200, Zoltan Boszormenyi via
> lists.openembedded.org wrote:
>> 2026. 04. 07. 17:21 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
>>> The issue turns out to be with GNU tar, specifically this build:
>>> https://koji.fedoraproject.org/koji/buildinfo?buildID=2924033
>>>
>>> Manually downgrading to the previous build fixed the packaging problem:
>>> https://koji.fedoraproject.org/koji/buildinfo?buildID=2917292
>>>
>>> I reported it here:
>>> https://bugzilla.redhat.com/show_bug.cgi?id=2455965
>> According to the changelog of the current GNU tar 1.35-8.fc44 build,
>> it contains backports from what will be the official 1.36 version.
>> With that release, whenever it will be out, other distros would fail, too.
>>
>> Note this from the Fedora package changelog:
>>
>> - Backport upstream changes to jailify extraction directory
>>     Includes related gnulib changes to add openat2
>>     Fixes CVE-2025-45582 (fedora#2380007)
>>
>> which seems to be this commit:
>> https://cgit.git.savannah.gnu.org/cgit/tar.git/commit/?id=75b03fdff48916bd0654677ed21379bdb0db016d
>>
>> commit 75b03fdff48916bd0654677ed21379bdb0db016d
>> Author: Paul Eggert <eggert@cs.ucla.edu>
>> Date:   Thu Nov 13 13:44:10 2025 -0800
>>
>>       Use openat2 to jailify the extraction directory
>>
>>       This addresses CVE-2025-45582.
>>       * gnulib.modules: Add openat2.
>>       * src/misc.c (open_subdir): New static function.
>>       (fdbase_opendir): Use it.
>>       * src/tar.c (open_searchdir_how): New var, replacing and
>>       augmenting open_searchdir_flags.  All uses changed.
>>       * tests/extrac31.at: New file.
>>       * tests/Makefile (TESTSUITE_AT), tests/testuite.at: Add it.
>>
>> I guess it will really need fixes in pseudo to overcome this.
> Hi Zoltan,
>
> The issue is that our intercept function for openat2 is a stub [1], it
> returns -ENOSYS. This works on other distros as the gnulib
> implementation of openat2 in userspace can be used as a fallback. If tar
> in F44 doesn't have any fallback for when openat2 isn't implemented that
> that won't work.
>
> So it looks like we will need to complete openat2 handling in pseudo. We
> have an issue for that in bugzilla [2], I'll update it.
>
> [1]: https://git.yoctoproject.org/pseudo/tree/ports/linux/openat2/guts/openat2.c
> [2]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16126

Thank you.


