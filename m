Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8FFFF5109
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 15:38:34 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.84473.1775576308063207703
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 08:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DtC7WtuG;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488971db0fdso40662505e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 08:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775576306; x=1776181106; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ubl3MGfXzCxTxI6UdOq6SvNYoUUeZ2iHylZjHz9jo1s=;
        b=DtC7WtuGzIe9+tIpLGEa2hP0AleavQkhF089w2n2Xw0ymT9pmT/o1++hbS4KToXV2i
         KD+pQzwt7dgbHCSDjKiStF/LUp+YJVysOwysZsNa9kZmzGEApmkUoXt9ZskFsKcN+1rN
         on7xYS2A5kqX40J1poIJtQ89Es1CqaMxKtILWFNxv5JIteqZ8obPhKnsBld3jUHSIc4A
         m65DGGw7QBZ5LdcTEGdUlRecjdTm/32ebIUddeTaRwSXSVho2CcPQK8Q63fnVRIz3ADU
         TQ/QfMtOr+qa5BSHl/GkBKHFQAasUl2xxYVI7GTYfYZ785qIpnGq/GHPksNP+TOityw8
         rang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775576306; x=1776181106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ubl3MGfXzCxTxI6UdOq6SvNYoUUeZ2iHylZjHz9jo1s=;
        b=tM/t2adbmFNUjXL+79cL53S6iMDIUYRNf2sRq9fJrIziYNsr3j9CAXb+jQ6WombeVI
         sWCzhfKm+a9g/W5eC/ZFkNF24GUf9aQKirE7X77lZPjUkHvJpJtwMwOELvfuvL17jhkT
         JBLv9t58Mrw0mSr9lNj1r+0XOGAc8hdoiQ1eAogT9SPaP2m61S7F+CzwisWdGJujQB29
         9TOCRae6eCuK4iRpPhXFAB8cGkVgIrq9Z+E0onj7X29dOV33qq+VqOcZY8PTNDE9J7dW
         dwZKeX6ffv8EkdUhndTanI210e/FI2vEkvv0w/daoY+Jhd2/TxtnMreFI+PrOoFhfaMN
         k1TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbG2jfqA0PpbWhs9tvRbsB+CSd7659S3M7cqhsyxgW+m1kpMt9XztxjCaM9B7julijonUsQqatAGX3kRh0Ebh1tg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwMI+LKKNfeoKor3Hjem7YcXn64dn0i116EI0MyVszZ91vMkxj7
	/NhR/byQLpEqroc8JlebZW8P1Jl8+7DzKXkHyd5lXwEsSho30kAhhxie
X-Gm-Gg: AeBDieuUh8VdFFy2cprCu6h0vkcfuw5bgVArrb3iNzumVzVun1dq/NgA5t0LJNIba/n
	VZsg8gyK5W7pU+KarwUYTPgpQjNlg4c4t1TdC5Wcd7AlBCQtr/Mc7rTe2R6t9UIkFLN4aWwCA02
	0X+Mxnm0qnxSDAXfvrmPXgeaG1e9UPuXALsjmhcvCEPb5JdLkYu5P9BErDFB4tb0liGel3rtZOg
	7JrpE1jSrqwWFC6W0PToZ11e722sXKqxevKS+4nDmut2pMYqXgK8gQ68EA8bCZgtChDIFV5gPY/
	CCEAuzG/fVxZ7pkTY3NxBOTk/u+CiundQOyM09TXOkUnDNAE441utCyzm9sMlf49gAB1ThPw6Gc
	IAvXepvf9Mcf4+7+yTIR7uR3h5X757ubiwEVOSj0nSODLA+4QSjlKTIMmKfF9eF0qPkbnnnLgKh
	2xEISEoec5T2GhGQVxR/ZHl1LYueUcdePSmgyvuEruf/gU46j9dbA51A==
X-Received: by 2002:a05:600c:1990:b0:488:a82f:bbb6 with SMTP id 5b1f17b1804b1-488a82fbdeemr159830025e9.27.1775576305978;
        Tue, 07 Apr 2026 08:38:25 -0700 (PDT)
Received: from [192.168.2.122] (95C81E23.dsl.pool.telekom.hu. [149.200.30.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a4b2e111sm297928255e9.1.2026.04.07.08.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 08:38:25 -0700 (PDT)
Message-ID: <ed118dea-62cd-4d29-9ee1-336367a2aae5@gmail.com>
Date: Tue, 7 Apr 2026 17:38:23 +0200
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
 <18A41C5827F22307.777565@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <18A41C5827F22307.777565@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 15:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234749

2026. 04. 07. 17:21 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> The issue turns out to be with GNU tar, specifically this build:
> https://koji.fedoraproject.org/koji/buildinfo?buildID=2924033
>
> Manually downgrading to the previous build fixed the packaging problem:
> https://koji.fedoraproject.org/koji/buildinfo?buildID=2917292
>
> I reported it here:
> https://bugzilla.redhat.com/show_bug.cgi?id=2455965

According to the changelog of the current GNU tar 1.35-8.fc44 build,
it contains backports from what will be the official 1.36 version.
With that release, whenever it will be out, other distros would fail, too.

Note this from the Fedora package changelog:

- Backport upstream changes to jailify extraction directory
   Includes related gnulib changes to add openat2
   Fixes CVE-2025-45582 (fedora#2380007)

which seems to be this commit:
https://cgit.git.savannah.gnu.org/cgit/tar.git/commit/?id=75b03fdff48916bd0654677ed21379bdb0db016d

commit 75b03fdff48916bd0654677ed21379bdb0db016d
Author: Paul Eggert <eggert@cs.ucla.edu>
Date:   Thu Nov 13 13:44:10 2025 -0800

     Use openat2 to jailify the extraction directory

     This addresses CVE-2025-45582.
     * gnulib.modules: Add openat2.
     * src/misc.c (open_subdir): New static function.
     (fdbase_opendir): Use it.
     * src/tar.c (open_searchdir_how): New var, replacing and
     augmenting open_searchdir_flags.  All uses changed.
     * tests/extrac31.at: New file.
     * tests/Makefile (TESTSUITE_AT), tests/testuite.at: Add it.

I guess it will really need fixes in pseudo to overcome this.

> 2026. 04. 07. 16:08 keltezéssel, Martin Jansa írta:
>> For me this works with both ubuntu-26.04 and gentoo both with
>> glibc-2.43. I'm able to build images with scarthgap, whinlatter with
>> ubuntu (gentoo probably works as well, just haven't tried) and wrynose
>> with both ubuntu and gentoo.
>>
>> On Tue, Apr 7, 2026 at 1:39 PM Böszörményi Zoltán <zboszor@gmail.com> wrote:
>>> 2026. 04. 07. 10:54 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
>>>> Hi,
>>>>
>>>> something is still wrong with pseudo on Fedora 44 (beta) after this change.
>>>> Besides GLIBC 2.43, GCC 16 is on Fedora 44.
>>>>
>>>> Packaging fails for every file and directory shipped by the recipe with:
>>>>
>>>> Cannot open: Function not implemented
>>>>
>>>> or
>>>>
>>>> Cannot mkdir: Function not implemented
>>> It's not GCC. I forced to build pseudo-native with GCC 15 and packaging
>>> linux-libc-headers and others still failed with the same problem.
>>>
>>> GLIBC is glibc-2.43-2.fc44.x86_64, which uses commit
>>> 48f5a05a7a1eeb9e0567ab429f654648f831307f from
>>> the release/2.43/master branch. It's a post-2.43 commit.
>>>
>>>> 2026. 03. 08. 17:37 keltezéssel, Martin Jansa via lists.openembedded.org írta:
>>>>> Hi,
>>>>>
>>>>> this is already merged in the repo and there is SRCREV bump which
>>>>> includes that change from Richard in master-next.
>>>>>
>>>>> Regards,
>>>>>
>>>>> On Sun, Mar 8, 2026 at 4:09 PM Hemanth Kumar M D via
>>>>> lists.openembedded.org
>>>>> <Hemanth.KumarMD=windriver.com@lists.openembedded.org> wrote:
>>>>>> From: Martin Jansa <martin.jansa@gmail.com>
>>>>>>
>>>>>> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>>>>>> ---
>>>>>>    ...01-openat2-use-const-struct-open_how.patch | 54 +++++++++++++++++++
>>>>>>    meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
>>>>>>    2 files changed, 55 insertions(+)
>>>>>>    create mode 100644
>>>>>> meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struct-open_how.patch
>>>>>>
>>>>>> diff --git
>>>>>> a/meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struct-open_how.patch
>>>>>> b/meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struct-open_how.patch
>>>>>> new file mode 100644
>>>>>> index 0000000000..eda2593bdf
>>>>>> --- /dev/null
>>>>>> +++ b/meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struct-open_how.patch
>>>>>> @@ -0,0 +1,54 @@
>>>>>> +From d17159194e94b5150600c333a5e2ad46fda6291e Mon Sep 17 00:00:00 2001
>>>>>> +From: Martin Jansa <martin.jansa@gmail.com>
>>>>>> +Date: Thu, 5 Mar 2026 17:53:34 +0100
>>>>>> +Subject: [PATCH] openat2: use const struct open_how
>>>>>> +MIME-Version: 1.0
>>>>>> +Content-Type: text/plain; charset=UTF-8
>>>>>> +Content-Transfer-Encoding: 8bit
>>>>>> +
>>>>>> +To match
>>>>>> +https://sourceware.org/cgit/glibc/commit/?id=0f0a5cd338998f4b603f52f3ce2163df0db7b814
>>>>>> +
>>>>>> +Otherwise it fails to build with glibc-2.43:
>>>>>> +
>>>>>> +In file included from pseudo_wrappers.c:300:
>>>>>> +pseudo_wrapfuncs.c: At top level:
>>>>>> +pseudo_wrapfuncs.c:11537:1: error: conflicting types for ‘openat2’; have ‘int(int,
>>>>>> const char *, struct open_how *, size_t)’ {aka ‘int(int,  const char *, struct
>>>>>> open_how *, long unsigned int)’}
>>>>>> +11537 | openat2(int dirfd, const char *path, struct open_how *how, size_t size) {
>>>>>> +      | ^~~~~~~
>>>>>> +In file included from /usr/include/bits/fcntl-linux.h:492,
>>>>>> +                 from /usr/include/bits/fcntl.h:61,
>>>>>> +                 from /usr/include/fcntl.h:35,
>>>>>> +                 from pseudo_wrappers.c:23:
>>>>>> +/usr/include/bits/fcntl-linux-fortify.h:36:1: note: previous definition of ‘openat2’
>>>>>> with type ‘int(int,  const char *, const struct open_how *, long unsigned int)’
>>>>>> +   36 | openat2 (int __dfd, const char *__filename, const struct open_how *__how,
>>>>>> +      | ^~~~~~~
>>>>>> +make: *** [Makefile:162: pseudo_wrappers.o] Error 1
>>>>>> +
>>>>>> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>>>>>> +Upstream-Status: Pending
>>>>>> +---
>>>>>> + ports/linux/openat2/guts/openat2.c | 2 +-
>>>>>> + ports/linux/openat2/wrapfuncs.in   | 2 +-
>>>>>> + 2 files changed, 2 insertions(+), 2 deletions(-)
>>>>>> +
>>>>>> +diff --git a/ports/linux/openat2/guts/openat2.c b/ports/linux/openat2/guts/openat2.c
>>>>>> +index da01b31..366fb95 100644
>>>>>> +--- a/ports/linux/openat2/guts/openat2.c
>>>>>> ++++ b/ports/linux/openat2/guts/openat2.c
>>>>>> +@@ -4,7 +4,7 @@
>>>>>> +  *
>>>>>> +  * SPDX-License-Identifier: LGPL-2.1-only
>>>>>> +  *
>>>>>> +- * int openat2(int dirfd, const char *path, struct open_how *how, size_t size)
>>>>>> ++ * int openat2(int dirfd, const char *path, const struct open_how *how, size_t size)
>>>>>> +  *    int rc = -1;
>>>>>> +  */
>>>>>> +
>>>>>> +diff --git a/ports/linux/openat2/wrapfuncs.in b/ports/linux/openat2/wrapfuncs.in
>>>>>> +index 96ae8a7..2f1e716 100644
>>>>>> +--- a/ports/linux/openat2/wrapfuncs.in
>>>>>> ++++ b/ports/linux/openat2/wrapfuncs.in
>>>>>> +@@ -1 +1 @@
>>>>>> +-int openat2(int dirfd, const char *path, struct open_how *how, size_t size);
>>>>>> ++int openat2(int dirfd, const char *path, const struct open_how *how, size_t size);
>>>>>> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb
>>>>>> b/meta/recipes-devtools/pseudo/pseudo_git.bb
>>>>>> index a26a205a16..b34525055d 100644
>>>>>> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
>>>>>> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
>>>>>> @@ -1,6 +1,7 @@
>>>>>>    require pseudo.inc
>>>>>>
>>>>>>    SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
>>>>>> + file://0001-openat2-use-const-struct-open_how.patch \
>>>>>>               file://fallback-passwd \
>>>>>>               file://fallback-group \
>>>>>>               "
>>>>>> -- 
>>>>>> 2.49.0
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>
>>>>
>>>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#234747): https://lists.openembedded.org/g/openembedded-core/message/234747
> Mute This Topic: https://lists.openembedded.org/mt/118204632/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


