Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D083FF5107
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 15:22:04 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.84017.1775575317674553108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 08:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Y0EAnw6a;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d17bb1c1dso4469523f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 08:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775575316; x=1776180116; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b1vD3WCIv5KvAzyA8fpYhjJ6HklJBXJCPAmp1aV3sXI=;
        b=Y0EAnw6aQJCI3jUt+xxhoDoMEJOMC46kGW9hkaCK++J24hOdTFoN9JMD6Vi19RvCgH
         VRoAdH6oqzKyWewybTiHoeNrCmM/Un7UsAzuu0mbGtzeTmBG/9coywgbXc6AES6cxMY8
         GMu45RCBdi+L4c9RdolM4q2pJdGkOsstV5zYHRWA0K1JLzVnpg/Ai0H+MnMBh95m9iwc
         H3BQK6PnPcyCGAa0ZDMq0tEnPm02YqrB5XOZJrfmE5+s2YnqqZqCdoWXtkHTO90l7n+Q
         nxG8+gqBj8tK5cMFP8qpy8TEe9cWAZWRZWh4zLAzN1kan8gxYeSBBLZwreUwh2IrTHVA
         qCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775575316; x=1776180116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1vD3WCIv5KvAzyA8fpYhjJ6HklJBXJCPAmp1aV3sXI=;
        b=YmuOgufJk6dtIFaCXrYkEAjPsOg9SyawTCb5zSRyDuDoVFtmd3zTW8et+QtMPSxTAI
         p9laJD/cJRh/oIwORkLH6rNTmCjdVxNUC9qLQBiMKbWPBjgIUis6c7ZHw7mH5hT83zuL
         fvfeKwTlG2SrQ/OhX5Jtt+p198Z50cXpu9E5G8KXD9NqOD63pm3dgptNaLzeZxhpzkPT
         OgsQWB4+rMLCE2Otb7gxSfj7GYT6pZ5ZBLM+DdibGbP6cm0+efRpJawL1/rr3t197tON
         6tFDuYRkFsa+lhTQakw5kjcZBKNI9RXzrepeii8MSoe/H6NKmQsawjOVgAW3N8axMKJm
         zIlg==
X-Forwarded-Encrypted: i=1; AJvYcCV7GEJIGvHXFAyvEhx0QWZP3zkKQCnXjia/5m/byLR9iK+C0Uy44uPrSAvjiR6iP7f4x6X+K0k1y6BGg8XvbfVqmA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyQchqXB1KfktdcSK3wROAGcNILdyShBbvNXKnTXamS0jSkz44m
	oLmcZMXXiGNpm/fxy4nZnixeKBXQLkQczQl7LSPAJjEaQyXApbCtW648
X-Gm-Gg: AeBDiesoXlEhkq7+uGH5grbTltusB+QF5vLX0xAfaggwUpwhTSKHJ549XRgLO/vuIYx
	hLWRoC/hgnEFNsd2Z9zXaYz/a38o3zr0RI8fbQauRLFUDkPqITvHP2KcZHAAgZxEBMiVG3+lfG2
	flsS8j3F3W2m5oymakAfaA4RuIC21ECGcoOubR3TiNoFfBPg4QTbJf6ax4chtMvKlPYMsbJpzro
	O3l7EmSPt2/ZFs1++qp8M5r3C7/1RZzCqU6dR956v+NT2D84VLFLa5139+cXBw1OUmrHQLwJACh
	zT80CiPnrdacKLb8AQhZCs0QSNGrepRr6AYSqFDdLaIeRB/MAeYzSqTLKsCPnlpZ7DYceKGvfok
	9EEskBgu15FrDrfMHTXerWE8A/EJJ8H1uqZS6d13S9GigA3/VesGfp8J+9RjH/0zWUaMiQc7Ooh
	tyuTTJ+u/N4hG/4Ddd4ELFIIYP7FVly6NHds8D/HGTsk6CJLOX95yVmwkI9DQcxhRw
X-Received: by 2002:a05:6000:400e:b0:43c:ef4f:79dc with SMTP id ffacd0b85a97d-43d2927ff7bmr25590738f8f.8.1775575315693;
        Tue, 07 Apr 2026 08:21:55 -0700 (PDT)
Received: from [192.168.2.122] (95C81E23.dsl.pool.telekom.hu. [149.200.30.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f1a99sm53863698f8f.32.2026.04.07.08.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 08:21:55 -0700 (PDT)
Message-ID: <22e06756-d71e-45cf-a280-0d036a4ce303@gmail.com>
Date: Tue, 7 Apr 2026 17:21:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 3/7] pseudo: fix for build with glibc-2.43
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Hemanth.KumarMD@windriver.com, openembedded-core@lists.openembedded.org,
 Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
References: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
 <20260308150834.2508331-3-Hemanth.KumarMD@windriver.com>
 <CA+chaQcneoNBogdCZmZB3LCE-cVErs2-4NoNtYUGgK+REEBxLg@mail.gmail.com>
 <18A40738790ACBCC.657799@lists.openembedded.org>
 <e38f41d9-4af6-4389-90a7-0c2ae6b47330@gmail.com>
 <CA+chaQdDkMUDBO8G=cku8SVe=Ow+Hgt606mZO863rCaNaznDrA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CA+chaQdDkMUDBO8G=cku8SVe=Ow+Hgt606mZO863rCaNaznDrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 15:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234747

The issue turns out to be with GNU tar, specifically this build:
https://koji.fedoraproject.org/koji/buildinfo?buildID=2924033

Manually downgrading to the previous build fixed the packaging problem:
https://koji.fedoraproject.org/koji/buildinfo?buildID=2917292

I reported it here:
https://bugzilla.redhat.com/show_bug.cgi?id=2455965

2026. 04. 07. 16:08 keltezéssel, Martin Jansa írta:
> For me this works with both ubuntu-26.04 and gentoo both with
> glibc-2.43. I'm able to build images with scarthgap, whinlatter with
> ubuntu (gentoo probably works as well, just haven't tried) and wrynose
> with both ubuntu and gentoo.
>
> On Tue, Apr 7, 2026 at 1:39 PM Böszörményi Zoltán <zboszor@gmail.com> wrote:
>> 2026. 04. 07. 10:54 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
>>> Hi,
>>>
>>> something is still wrong with pseudo on Fedora 44 (beta) after this change.
>>> Besides GLIBC 2.43, GCC 16 is on Fedora 44.
>>>
>>> Packaging fails for every file and directory shipped by the recipe with:
>>>
>>> Cannot open: Function not implemented
>>>
>>> or
>>>
>>> Cannot mkdir: Function not implemented
>> It's not GCC. I forced to build pseudo-native with GCC 15 and packaging
>> linux-libc-headers and others still failed with the same problem.
>>
>> GLIBC is glibc-2.43-2.fc44.x86_64, which uses commit
>> 48f5a05a7a1eeb9e0567ab429f654648f831307f from
>> the release/2.43/master branch. It's a post-2.43 commit.
>>
>>> 2026. 03. 08. 17:37 keltezéssel, Martin Jansa via lists.openembedded.org írta:
>>>> Hi,
>>>>
>>>> this is already merged in the repo and there is SRCREV bump which
>>>> includes that change from Richard in master-next.
>>>>
>>>> Regards,
>>>>
>>>> On Sun, Mar 8, 2026 at 4:09 PM Hemanth Kumar M D via
>>>> lists.openembedded.org
>>>> <Hemanth.KumarMD=windriver.com@lists.openembedded.org> wrote:
>>>>> From: Martin Jansa <martin.jansa@gmail.com>
>>>>>
>>>>> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>>>>> ---
>>>>>    ...01-openat2-use-const-struct-open_how.patch | 54 +++++++++++++++++++
>>>>>    meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
>>>>>    2 files changed, 55 insertions(+)
>>>>>    create mode 100644
>>>>> meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struct-open_how.patch
>>>>>
>>>>> diff --git
>>>>> a/meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struct-open_how.patch
>>>>> b/meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struct-open_how.patch
>>>>> new file mode 100644
>>>>> index 0000000000..eda2593bdf
>>>>> --- /dev/null
>>>>> +++ b/meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struct-open_how.patch
>>>>> @@ -0,0 +1,54 @@
>>>>> +From d17159194e94b5150600c333a5e2ad46fda6291e Mon Sep 17 00:00:00 2001
>>>>> +From: Martin Jansa <martin.jansa@gmail.com>
>>>>> +Date: Thu, 5 Mar 2026 17:53:34 +0100
>>>>> +Subject: [PATCH] openat2: use const struct open_how
>>>>> +MIME-Version: 1.0
>>>>> +Content-Type: text/plain; charset=UTF-8
>>>>> +Content-Transfer-Encoding: 8bit
>>>>> +
>>>>> +To match
>>>>> +https://sourceware.org/cgit/glibc/commit/?id=0f0a5cd338998f4b603f52f3ce2163df0db7b814
>>>>> +
>>>>> +Otherwise it fails to build with glibc-2.43:
>>>>> +
>>>>> +In file included from pseudo_wrappers.c:300:
>>>>> +pseudo_wrapfuncs.c: At top level:
>>>>> +pseudo_wrapfuncs.c:11537:1: error: conflicting types for ‘openat2’; have ‘int(int,
>>>>> const char *, struct open_how *, size_t)’ {aka ‘int(int,  const char *, struct
>>>>> open_how *, long unsigned int)’}
>>>>> +11537 | openat2(int dirfd, const char *path, struct open_how *how, size_t size) {
>>>>> +      | ^~~~~~~
>>>>> +In file included from /usr/include/bits/fcntl-linux.h:492,
>>>>> +                 from /usr/include/bits/fcntl.h:61,
>>>>> +                 from /usr/include/fcntl.h:35,
>>>>> +                 from pseudo_wrappers.c:23:
>>>>> +/usr/include/bits/fcntl-linux-fortify.h:36:1: note: previous definition of ‘openat2’
>>>>> with type ‘int(int,  const char *, const struct open_how *, long unsigned int)’
>>>>> +   36 | openat2 (int __dfd, const char *__filename, const struct open_how *__how,
>>>>> +      | ^~~~~~~
>>>>> +make: *** [Makefile:162: pseudo_wrappers.o] Error 1
>>>>> +
>>>>> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>>>>> +Upstream-Status: Pending
>>>>> +---
>>>>> + ports/linux/openat2/guts/openat2.c | 2 +-
>>>>> + ports/linux/openat2/wrapfuncs.in   | 2 +-
>>>>> + 2 files changed, 2 insertions(+), 2 deletions(-)
>>>>> +
>>>>> +diff --git a/ports/linux/openat2/guts/openat2.c b/ports/linux/openat2/guts/openat2.c
>>>>> +index da01b31..366fb95 100644
>>>>> +--- a/ports/linux/openat2/guts/openat2.c
>>>>> ++++ b/ports/linux/openat2/guts/openat2.c
>>>>> +@@ -4,7 +4,7 @@
>>>>> +  *
>>>>> +  * SPDX-License-Identifier: LGPL-2.1-only
>>>>> +  *
>>>>> +- * int openat2(int dirfd, const char *path, struct open_how *how, size_t size)
>>>>> ++ * int openat2(int dirfd, const char *path, const struct open_how *how, size_t size)
>>>>> +  *    int rc = -1;
>>>>> +  */
>>>>> +
>>>>> +diff --git a/ports/linux/openat2/wrapfuncs.in b/ports/linux/openat2/wrapfuncs.in
>>>>> +index 96ae8a7..2f1e716 100644
>>>>> +--- a/ports/linux/openat2/wrapfuncs.in
>>>>> ++++ b/ports/linux/openat2/wrapfuncs.in
>>>>> +@@ -1 +1 @@
>>>>> +-int openat2(int dirfd, const char *path, struct open_how *how, size_t size);
>>>>> ++int openat2(int dirfd, const char *path, const struct open_how *how, size_t size);
>>>>> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb
>>>>> b/meta/recipes-devtools/pseudo/pseudo_git.bb
>>>>> index a26a205a16..b34525055d 100644
>>>>> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
>>>>> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
>>>>> @@ -1,6 +1,7 @@
>>>>>    require pseudo.inc
>>>>>
>>>>>    SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
>>>>> + file://0001-openat2-use-const-struct-open_how.patch \
>>>>>               file://fallback-passwd \
>>>>>               file://fallback-group \
>>>>>               "
>>>>> --
>>>>> 2.49.0
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#234724): https://lists.openembedded.org/g/openembedded-core/message/234724
>>> Mute This Topic: https://lists.openembedded.org/mt/118204632/3617728
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


