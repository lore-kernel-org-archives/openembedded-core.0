Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFF6EDB7DB
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 08:54:58 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76639.1775552091854827553
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 01:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kJgrxMMW;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so28706425e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 01:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775552090; x=1776156890; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mjbwqx7/1uG/hIGWzMm76EzADaF+3l1SbUhNNhxzxO0=;
        b=kJgrxMMWR6IvTQR+9XwDhvXoGFb69tk4jeqpx1ognMqutLGVEWW/2v3q+mja6tD+NR
         yQR+EA4lLoLx2XJbE3cetf/iEC3Bxb+jBrG2zldLANtjB64dDqPbUQf4k5e2+fPJTzxi
         1VZkV1gdWXqzpJDJ9qKDZAs3ROIWCooT99fO9Yry7b26EzfzxO2QANTy/jkHuNJUAIZu
         3CVT9M0rnSCGJ9R+lKwi0HPrzaGfKF6rq4MYFkA0jQXNMqBK0RWYMh/A1hvLN3hALkWM
         BH1ewb0InJknQVBVv3Sg0Yj2q4ku4q31OzJocGuzmk6Jsjd8feEyy1JX8iCvF92/KNGZ
         rSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775552090; x=1776156890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mjbwqx7/1uG/hIGWzMm76EzADaF+3l1SbUhNNhxzxO0=;
        b=L9IL/R2R+EeBxi7pFJo9MZn4DBjOgn4c6LsF8G1HdE525ZNLV1J3ErHvEtofnDeOCF
         xK/eI8Q/Q7DlBsnf5CV42qjMhJ3qXrAQT4uBVpHS8/MIlmmi2KBGajaWtKWwAyJDpAYB
         OPxsPBTzqQEOxFUzQQlmZY0JcBTa3IToIAIy+qSpSgOfqwLyrDlb/gepZVp+yqq+VorV
         SbYIo7Yfgztw2kWgLHyDpvJE7yOAfCSg4XnEg7fnugPb7yPkaZeq3a1irOdtLR/QVZNH
         trJEfkBQkC5XOCUWdnt0c9o0U6oyNMacKqUYSfdx5vej2DHKAVn8YfSsIRoitA7TSZs4
         FKGQ==
X-Gm-Message-State: AOJu0Yw2QxlwPzUro+EBIxx7XkwGdHekIxlIr6siZhzawdezuVhxna4T
	wcnPYGedWqklNx2DzZdbV0I3X1QbPzvqC81MO+LZV6hmpTFPKIxEfDCg
X-Gm-Gg: AeBDiettsT0e+Lgv5VuUoCz73Tjz6VRfgGldpInjMuppNkF/T5jYtnTsyKNf3GeruuT
	8UR/XY3HkOS2o1NDOF4KqxEdY3HtXpyLYtd5mV8erXKKwwwDbJsMXEwuf6zDL8K27KDwpzjKuft
	8+Ro/dv+eToOBynT/jojNmJUAYhikREO1uP01/YZP69HDL2DBtZOhCq4Y/oAMaWJOJGjnSJqIqw
	mO0rrjQuAuGGk9YQR8dcjUOZDdmkBeGcp4eqsl+wBsfnjDfeLBfmiyIQSVVW4rx28yhM+gis4Y/
	6se3Gj6F00yD2ISMaTN15TLRNuuMOupnsjAQ3OHZ+BKO1oyFUDji3xeBj5utt/xqADlNJeRHwyS
	o3TvTVGWdsbkU/Rr6/LgI5FYo0aNMIe0fZ1KfFkDEj7DFRb/R44bzaSVqHddFQvWgq4DxW9BQDp
	+NHqFgyNaX/k6up3p4x0Hi8wMH+m0csa/25G6aiNMS5rzB+g8clmGYrw==
X-Received: by 2002:a05:600c:1381:b0:487:1108:48af with SMTP id 5b1f17b1804b1-488996a351bmr226183325e9.4.1775552089751;
        Tue, 07 Apr 2026 01:54:49 -0700 (PDT)
Received: from [192.168.2.122] (95C81E23.dsl.pool.telekom.hu. [149.200.30.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488bf0a0071sm10882005e9.6.2026.04.07.01.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 01:54:49 -0700 (PDT)
Message-ID: <db7598b8-ced1-41a8-9986-43fbf2f3056a@gmail.com>
Date: Tue, 7 Apr 2026 10:54:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 3/7] pseudo: fix for build with glibc-2.43
To: martin.jansa@gmail.com, Hemanth.KumarMD@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com,
 Randy.MacLeod@windriver.com
References: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
 <20260308150834.2508331-3-Hemanth.KumarMD@windriver.com>
 <CA+chaQcneoNBogdCZmZB3LCE-cVErs2-4NoNtYUGgK+REEBxLg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CA+chaQcneoNBogdCZmZB3LCE-cVErs2-4NoNtYUGgK+REEBxLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 08:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234724

Hi,

something is still wrong with pseudo on Fedora 44 (beta) after this change.
Besides GLIBC 2.43, GCC 16 is on Fedora 44.

Packaging fails for every file and directory shipped by the recipe with:

Cannot open: Function not implemented

or

Cannot mkdir: Function not implemented

2026. 03. 08. 17:37 keltezéssel, Martin Jansa via lists.openembedded.org írta:
> Hi,
>
> this is already merged in the repo and there is SRCREV bump which
> includes that change from Richard in master-next.
>
> Regards,
>
> On Sun, Mar 8, 2026 at 4:09 PM Hemanth Kumar M D via
> lists.openembedded.org
> <Hemanth.KumarMD=windriver.com@lists.openembedded.org> wrote:
>> From: Martin Jansa <martin.jansa@gmail.com>
>>
>> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>> ---
>>   ...01-openat2-use-const-struct-open_how.patch | 54 +++++++++++++++++++
>>   meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
>>   2 files changed, 55 insertions(+)
>>   create mode 100644 meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struct-open_how.patch
>>
>> diff --git a/meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struct-open_how.patch b/meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struct-open_how.patch
>> new file mode 100644
>> index 0000000000..eda2593bdf
>> --- /dev/null
>> +++ b/meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struct-open_how.patch
>> @@ -0,0 +1,54 @@
>> +From d17159194e94b5150600c333a5e2ad46fda6291e Mon Sep 17 00:00:00 2001
>> +From: Martin Jansa <martin.jansa@gmail.com>
>> +Date: Thu, 5 Mar 2026 17:53:34 +0100
>> +Subject: [PATCH] openat2: use const struct open_how
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +To match
>> +https://sourceware.org/cgit/glibc/commit/?id=0f0a5cd338998f4b603f52f3ce2163df0db7b814
>> +
>> +Otherwise it fails to build with glibc-2.43:
>> +
>> +In file included from pseudo_wrappers.c:300:
>> +pseudo_wrapfuncs.c: At top level:
>> +pseudo_wrapfuncs.c:11537:1: error: conflicting types for ‘openat2’; have ‘int(int,  const char *, struct open_how *, size_t)’ {aka ‘int(int,  const char *, struct open_how *, long unsigned int)’}
>> +11537 | openat2(int dirfd, const char *path, struct open_how *how, size_t size) {
>> +      | ^~~~~~~
>> +In file included from /usr/include/bits/fcntl-linux.h:492,
>> +                 from /usr/include/bits/fcntl.h:61,
>> +                 from /usr/include/fcntl.h:35,
>> +                 from pseudo_wrappers.c:23:
>> +/usr/include/bits/fcntl-linux-fortify.h:36:1: note: previous definition of ‘openat2’ with type ‘int(int,  const char *, const struct open_how *, long unsigned int)’
>> +   36 | openat2 (int __dfd, const char *__filename, const struct open_how *__how,
>> +      | ^~~~~~~
>> +make: *** [Makefile:162: pseudo_wrappers.o] Error 1
>> +
>> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>> +Upstream-Status: Pending
>> +---
>> + ports/linux/openat2/guts/openat2.c | 2 +-
>> + ports/linux/openat2/wrapfuncs.in   | 2 +-
>> + 2 files changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/ports/linux/openat2/guts/openat2.c b/ports/linux/openat2/guts/openat2.c
>> +index da01b31..366fb95 100644
>> +--- a/ports/linux/openat2/guts/openat2.c
>> ++++ b/ports/linux/openat2/guts/openat2.c
>> +@@ -4,7 +4,7 @@
>> +  *
>> +  * SPDX-License-Identifier: LGPL-2.1-only
>> +  *
>> +- * int openat2(int dirfd, const char *path, struct open_how *how, size_t size)
>> ++ * int openat2(int dirfd, const char *path, const struct open_how *how, size_t size)
>> +  *    int rc = -1;
>> +  */
>> +
>> +diff --git a/ports/linux/openat2/wrapfuncs.in b/ports/linux/openat2/wrapfuncs.in
>> +index 96ae8a7..2f1e716 100644
>> +--- a/ports/linux/openat2/wrapfuncs.in
>> ++++ b/ports/linux/openat2/wrapfuncs.in
>> +@@ -1 +1 @@
>> +-int openat2(int dirfd, const char *path, struct open_how *how, size_t size);
>> ++int openat2(int dirfd, const char *path, const struct open_how *how, size_t size);
>> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
>> index a26a205a16..b34525055d 100644
>> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
>> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
>> @@ -1,6 +1,7 @@
>>   require pseudo.inc
>>
>>   SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
>> +           file://0001-openat2-use-const-struct-open_how.patch \
>>              file://fallback-passwd \
>>              file://fallback-group \
>>              "
>> --
>> 2.49.0
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#232665): https://lists.openembedded.org/g/openembedded-core/message/232665
>> Mute This Topic: https://lists.openembedded.org/mt/118204632/3617728
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


