Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF7BC48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 10:53:16 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.15130.1707389589445162085
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 02:53:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B+jK9WR0;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33b29b5eab5so1013896f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 02:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707389588; x=1707994388; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sJVN3ST1GorGCBmEtoOW1PGzItpX6MbweHnuuP+U3Fc=;
        b=B+jK9WR0xZKGa/VAybyVtBd9IJ9oxCyvgY5iaWY9zZBT6AV6Xeu01ZVjg4ODs3EL2P
         YBte1c3hrduXj5oM1vhm6GdYnP8Zk89hrelEAft+qN7vmRbUPh/CWsav5+5a8tf5J/Km
         X4hxxUnOepDFJ9SbTUGwz5qEqg+v47ck6rkt07F7rJlqTsOyN5kxTphG5JoK0C/i32ne
         qyJrfC4Tsjz+ZPGkLUc8TqIkUjtx/SXZDH6mKgP+3U61hl+2AExrRhi9IPyF682Ma/ti
         NK7g6kDCioGXRDSltFq+28wxVIbSgwX9mF5ExXb5G/XCWI8Hd/2bnyIUkt5ScPWXQRDA
         DuuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707389588; x=1707994388;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sJVN3ST1GorGCBmEtoOW1PGzItpX6MbweHnuuP+U3Fc=;
        b=rBU5sw1WsNwTUIKauDl4HtLe/Z+2t4uK6OzNp/t39bKxuOsnxJEn/fAYDkvkbkfaob
         kO1OI1WLP+ZzA92xByoQ/izLuLXOQJxGcC/3RqvgOOOlFddG3A1lhI7uWIvuNCWbj0Rn
         gz6tX++Nw1iCcggM/S7y/ZMjxGezWHcOSCQELrjGpVxG/+heqyH5lyJgQmupRQ93kuy+
         FkotZ6uEV9yJK7sxqhFI/btCvq4Zu1eLPaEpaI78XRYHoXQ+klFqI1xyDYp640Wsoq1K
         6PO2jdiYskhOK4Y7B8w/06WWVyatts2YTSQaFRuFwksZUqLJ0CFCOsRrkZ9E9jQpT3DD
         qlLg==
X-Gm-Message-State: AOJu0YyD5esZ3VrWG37YvH2cuLxzse7LqT+mZcWoC3F2qngc0LQzmhru
	XE0ExJTMLAJqb/JpAI5d6CNoi7RYfzNTwl27T8k7ByXtDkAKAt91
X-Google-Smtp-Source: AGHT+IFnC5lmRPG3lOI0Rc2BjIhRJm+SUcqlG2x7iwg3hnWgOd0ey3aMwvJJxUCFaOqcIGLQ/MVS7g==
X-Received: by 2002:a05:6000:1845:b0:33b:358c:55a2 with SMTP id c5-20020a056000184500b0033b358c55a2mr7420848wri.66.1707389587667;
        Thu, 08 Feb 2024 02:53:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTdQv4L7EOVosrNax8M30tn/BHnnOwYYHkLl9UFHPVr7uzZp5cwmyvNRXHLNZhGU1RqaQRlWM1x0hIjY+4uH68LDwnyfso1umfQUkd3U+St35FF7k/MSpSX7duCmPkhXIX7+J/+FvkyrffQ/k=
Received: from [10.139.9.80] ([154.47.27.148])
        by smtp.gmail.com with ESMTPSA id i8-20020a05600011c800b0033b11e91c0bsm3317753wrx.81.2024.02.08.02.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 02:53:07 -0800 (PST)
Message-ID: <04f72626-19a9-4f3f-8069-45fcb2479940@gmail.com>
Date: Thu, 8 Feb 2024 11:52:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 1/2] shadow: update 4.13 -> 4.14.2
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Chen, Qi" <Qi.Chen@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 Alexander Kanavin <alex@linutronix.de>
References: <20240111131521.2305172-1-alex@linutronix.de>
 <51ee1c53-0687-22a5-ec9b-88c2ecd2bc66@windriver.com>
 <CANNYZj8Wqm1NNx0VuxOU7sxoxsKcKh+vG-3WrkKiDqQVGSDNsg@mail.gmail.com>
 <CO6PR11MB56024A3C9C403E77C038F106ED702@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CANNYZj-A5mfTyDSU0JzSpD_y29ByQrSbM=DupDWDFtMaDjtwEg@mail.gmail.com>
 <28d1f2fe-18fc-48a2-98a3-d6c4b84a242e@gmail.com>
 <CANNYZj_4rwjT5+Q4+Nm5czUPXiQG1gCzcnROj5cUVmQsG0Bt2g@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <CANNYZj_4rwjT5+Q4+Nm5czUPXiQG1gCzcnROj5cUVmQsG0Bt2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 10:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195130

I only ran 'oe-selftest -r overlayfs.OverlayFSEtcRunTimeTest' on a fresh 
poky clone with SANITY_TESTED_DISTROS = "" set in local.conf.

I'm trying now the build with this commit reverted.

Slava

On 08.02.2024 11:45, Alexander Kanavin wrote:
> First you need to show how to reproduce it with plain poky.
>
> Alex
>
> On Thu, 8 Feb 2024 at 11:40, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>> I'm getting the same "parameter name omitted" error with today's master
>> of poky on Ubuntu-20.04 machine. Is there a fix for that?
>>
>> Slava
>>
>> On 19.01.2024 13:24, Alexander Kanavin wrote:
>>> I've seen issues where static libraries built on one host were not
>>> usable on a different host with default compiler options. This may be
>>> another one of these.
>>>
>>> We're reverting to dynamic linking with libraries in a custom
>>> directory in sysroot that would be bundled together with shadow-native
>>> proper. Patch is coming.
>>>
>>> Alex
>>>
>>> On Fri, 19 Jan 2024 at 13:13, Chen, Qi <Qi.Chen@windriver.com> wrote:
>>>> I didn't do anything particular, but as several people are sharing the server, it's possible that its environment is somewhat messed up. I'll check more and fix the environment. Thanks for your double check.
>>>>
>>>> Regards,
>>>> Qi
>>>>
>>>> -----Original Message-----
>>>> From: Alexander Kanavin <alex.kanavin@gmail.com>
>>>> Sent: Friday, January 19, 2024 6:12 PM
>>>> To: Chen, Qi <Qi.Chen@windriver.com>
>>>> Cc: openembedded-core@lists.openembedded.org; Alexander Kanavin <alex@linutronix.de>
>>>> Subject: Re: [OE-core] [PATCH v3 1/2] shadow: update 4.13 -> 4.14.2
>>>>
>>>> I just tried poky master on ubuntu 20.04, and the issues do not appear. Do you have a custom setup?
>>>>
>>>> Alex
>>>>
>>>> On Fri, 19 Jan 2024 at 04:06, ChenQi <Qi.Chen@windriver.com> wrote:
>>>>> I'm seeing build failures on Ubuntu 20.04.
>>>>> GCC version: 9.4.0
>>>>>
>>>>> 1. error: parameter name omitted
>>>>> The problem is that the active_sessions_count function's definition
>>>>> lacks parameter. I did change like below:
>>>>> -unsigned long active_sessions_count(const char *name, unsigned long
>>>>> unused)
>>>>> +unsigned long active_sessions_count(const char *name, unsigned long
>>>>> unused unused_parameter)
>>>>> But then I observed another error, as shown below.
>>>>>
>>>>> 2. undefined reference to `dlsym'.
>>>>> | /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/hosttools/ld:
>>>>> ../lib/.libs/libshadow.a(libshadow_la-nss.o): in function `nss_exit':
>>>>> | nss.c:(.text+0x32): undefined reference to `dlclose'
>>>>> | /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/hosttools/ld:
>>>>> ../lib/.libs/libshadow.a(libshadow_la-nss.o): in function `nss_init':
>>>>> | nss.c:(.text+0x1dd): undefined reference to `dlopen'
>>>>> | /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/hosttools/ld:
>>>>> nss.c:(.text+0x21c): undefined reference to `dlsym'
>>>>> | /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/hosttools/ld:
>>>>> nss.c:(.text+0x237): undefined reference to `dlsym'
>>>>> | /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/hosttools/ld:
>>>>> nss.c:(.text+0x253): undefined reference to `dlsym'
>>>>> | /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/hosttools/ld:
>>>>> nss.c:(.text+0x365): undefined reference to `dlclose'
>>>>> | /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/hosttools/ld:
>>>>> nss.c:(.text+0x3b2): undefined reference to `dlerror'
>>>>> | collect2: error: ld returned 1 exit status
>>>>> | make[2]: *** [Makefile:1130: su] Error 1
>>>>>
>>>>> On Ubuntu22.04, there's no such issue.
>>>>>
>>>>> Regards,
>>>>> Qi
>>>>>
>>>>> On 1/11/24 21:15, Alexander Kanavin wrote:
>>>>>> License-Update: formatting, spdx conversion
>>>>>>
>>>>>> Drop:
>>>>>> 0001-Disable-use-of-syslog-for-sysroot.patch
>>>>>> (issue fixed upstream)
>>>>>>
>>>>>> 0001-Fix-can-not-print-full-login.patch
>>>>>> 0001-Overhaul-valid_field.patch
>>>>>> CVE-2023-29383.patch
>>>>>> (backports)
>>>>>>
>>>>>> libbsd is a new native dependency, as otherwise glibc >= 2.38 is
>>>>>> needed.
>>>>>>
>>>>>> A similar fix is added to musl in order to define non-standard __BEGIN_DECLS/__END_DECLS.
>>>>>>
>>>>>> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>>>>>> ---
>>>>>>     ...01-Disable-use-of-syslog-for-sysroot.patch |  52 -------
>>>>>>     .../0001-Fix-can-not-print-full-login.patch   |  41 -----
>>>>>>     .../files/0001-Overhaul-valid_field.patch     |  65 --------
>>>>>>     .../shadow/files/CVE-2023-29383.patch         |  53 -------
>>>>>>     .../shadow/files/CVE-2023-4641.patch          | 147 ------------------
>>>>>>     ...nexpected-open-failure-in-chroot-env.patch |  16 +-
>>>>>>     meta/recipes-extended/shadow/shadow.inc       |  20 +--
>>>>>>     .../{shadow_4.13.bb => shadow_4.14.2.bb}      |   0
>>>>>>     8 files changed, 16 insertions(+), 378 deletions(-)
>>>>>>     delete mode 100644 meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
>>>>>>     delete mode 100644 meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch
>>>>>>     delete mode 100644 meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
>>>>>>     delete mode 100644 meta/recipes-extended/shadow/files/CVE-2023-29383.patch
>>>>>>     delete mode 100644 meta/recipes-extended/shadow/files/CVE-2023-4641.patch
>>>>>>     rename meta/recipes-extended/shadow/{shadow_4.13.bb =>
>>>>>> shadow_4.14.2.bb} (100%)
>>>>>>
>>>>>> diff --git
>>>>>> a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-
>>>>>> sysroot.patch
>>>>>> b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-
>>>>>> sysroot.patch
>>>>>> deleted file mode 100644
>>>>>> index fa1532c8317..00000000000
>>>>>> ---
>>>>>> a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-
>>>>>> sysroot.patch
>>>>>> +++ /dev/null
>>>>>> @@ -1,52 +0,0 @@
>>>>>> -From 85d0444229ee3d14fefcf10d093f49c862826f82 Mon Sep 17 00:00:00
>>>>>> 2001
>>>>>> -From: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>>>> -Date: Thu, 14 Apr 2022 23:11:53 +0000
>>>>>> -Subject: [PATCH] Disable use of syslog for shadow-native tools
>>>>>> -
>>>>>> -Disable use of syslog to prevent sysroot user and group additions
>>>>>> from -writing entries to the host's syslog. This patch should only
>>>>>> be used -with the shadow-native recipe.
>>>>>> -
>>>>>> -Upstream-Status: Inappropriate [OE specific configuration]
>>>>>> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>>>> -Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>>>>>> -
>>>>>> ----
>>>>>> - configure.ac      | 2 +-
>>>>>> - src/login_nopam.c | 3 ++-
>>>>>> - 2 files changed, 3 insertions(+), 2 deletions(-)
>>>>>> -
>>>>>> -diff --git a/configure.ac b/configure.ac -index 924254a..603af81
>>>>>> 100644
>>>>>> ---- a/configure.ac
>>>>>> -+++ b/configure.ac
>>>>>> -@@ -191,7 +191,7 @@ AC_DEFINE_UNQUOTED(PASSWD_PROGRAM, "$shadow_cv_passwd_dir/passwd",
>>>>>> -     [Path to passwd program.])
>>>>>> -
>>>>>> - dnl XXX - quick hack, should disappear before anyone notices :).
>>>>>> --AC_DEFINE(USE_SYSLOG, 1, [Define to use syslog().])
>>>>>> -+#AC_DEFINE(USE_SYSLOG, 1, [Define to use syslog().])
>>>>>> - if test "$ac_cv_func_ruserok" = "yes"; then
>>>>>> -     AC_DEFINE(RLOGIN, 1, [Define if login should support the -r flag for rlogind.])
>>>>>> -     AC_DEFINE(RUSEROK, 0, [Define to the ruserok() "success" return value (0 or 1).])
>>>>>> -diff --git a/src/login_nopam.c b/src/login_nopam.c -index
>>>>>> df6ba88..fc24e13 100644
>>>>>> ---- a/src/login_nopam.c
>>>>>> -+++ b/src/login_nopam.c
>>>>>> -@@ -29,7 +29,6 @@
>>>>>> - #ifndef USE_PAM
>>>>>> - #ident "$Id$"
>>>>>> -
>>>>>> --#include "prototypes.h"
>>>>>> -     /*
>>>>>> -      * This module implements a simple but effective form of login access
>>>>>> -      * control based on login names and on host (or domain) names, internet
>>>>>> -@@ -57,6 +56,8 @@
>>>>>> - #include <netinet/in.h>
>>>>>> - #include <arpa/inet.h>              /* for inet_ntoa() */
>>>>>> -
>>>>>> -+#include "prototypes.h"
>>>>>> -+
>>>>>> - #if !defined(MAXHOSTNAMELEN) || (MAXHOSTNAMELEN < 64)
>>>>>> - #undef MAXHOSTNAMELEN
>>>>>> - #define MAXHOSTNAMELEN 256
>>>>>> diff --git
>>>>>> a/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-log
>>>>>> in.patch
>>>>>> b/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-log
>>>>>> in.patch
>>>>>> deleted file mode 100644
>>>>>> index 89f9c05c8d3..00000000000
>>>>>> ---
>>>>>> a/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-log
>>>>>> in.patch
>>>>>> +++ /dev/null
>>>>>> @@ -1,41 +0,0 @@
>>>>>> -commit 670cae834827a8f794e6f7464fa57790d911b63c
>>>>>> -Author: SoumyaWind <121475834+SoumyaWind@users.noreply.github.com>
>>>>>> -Date:   Tue Dec 27 17:40:17 2022 +0530
>>>>>> -
>>>>>> -    shadow: Fix can not print full login timeout message
>>>>>> -
>>>>>> -    Login timed out message prints only first few bytes when write is immediately followed by exit.
>>>>>> -    Calling exit from new handler provides enough time to display full message.
>>>>>> -
>>>>>> -Upstream-Status: Backport
>>>>>> [https://github.com/shadow-maint/shadow/commit/670cae834827a8f794e6f
>>>>>> 7464fa57790d911b63c]
>>>>>> -
>>>>>> -diff --git a/src/login.c b/src/login.c -index 116e2cb3..c55f4de0
>>>>>> 100644
>>>>>> ---- a/src/login.c
>>>>>> -+++ b/src/login.c
>>>>>> -@@ -120,6 +120,7 @@ static void get_pam_user (char **ptr_pam_user);
>>>>>> -
>>>>>> - static void init_env (void);
>>>>>> - static void alarm_handler (int);
>>>>>> -+static void exit_handler (int);
>>>>>> -
>>>>>> - /*
>>>>>> -  * usage - print login command usage and exit -@@ -391,11 +392,16
>>>>>> @@ static void init_env (void)
>>>>>> - #endif                              /* !USE_PAM */
>>>>>> - }
>>>>>> -
>>>>>> -+static void exit_handler (unused int sig) {
>>>>>> -+    _exit (0);
>>>>>> -+}
>>>>>> -
>>>>>> - static void alarm_handler (unused int sig)
>>>>>> - {
>>>>>> -     write (STDERR_FILENO, tmsg, strlen (tmsg));
>>>>>> --    _exit (0);
>>>>>> -+    signal(SIGALRM, exit_handler);
>>>>>> -+    alarm(2);
>>>>>> - }
>>>>>> -
>>>>>> - #ifdef USE_PAM
>>>>>> diff --git
>>>>>> a/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
>>>>>> b/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
>>>>>> deleted file mode 100644
>>>>>> index ac08be515bf..00000000000
>>>>>> ---
>>>>>> a/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
>>>>>> +++ /dev/null
>>>>>> @@ -1,65 +0,0 @@
>>>>>> -From 2eaea70111f65b16d55998386e4ceb4273c19eb4 Mon Sep 17 00:00:00
>>>>>> 2001
>>>>>> -From: =?UTF-8?q?Christian=20G=C3=B6ttsche?=
>>>>>> <cgzones@googlemail.com>
>>>>>> -Date: Fri, 31 Mar 2023 14:46:50 +0200
>>>>>> -Subject: [PATCH] Overhaul valid_field()
>>>>>> -
>>>>>> -e5905c4b ("Added control character check") introduced checking for
>>>>>> -control characters but had the logic inverted, so it rejects all
>>>>>> -characters that are not control ones.
>>>>>> -
>>>>>> -Cast the character to `unsigned char` before passing to the
>>>>>> character -checking functions to avoid UB.
>>>>>> -
>>>>>> -Use strpbrk(3) for the illegal character test and return early.
>>>>>> -
>>>>>> -Upstream-Status: Backport
>>>>>> [https://github.com/shadow-maint/shadow/commit/2eaea70111f65b16d5599
>>>>>> 8386e4ceb4273c19eb4]
>>>>>> -
>>>>>> -Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>>>>>> ----
>>>>>> - lib/fields.c | 24 ++++++++++--------------
>>>>>> - 1 file changed, 10 insertions(+), 14 deletions(-)
>>>>>> -
>>>>>> -diff --git a/lib/fields.c b/lib/fields.c -index fb51b582..53929248
>>>>>> 100644
>>>>>> ---- a/lib/fields.c
>>>>>> -+++ b/lib/fields.c
>>>>>> -@@ -37,26 +37,22 @@ int valid_field (const char *field, const char
>>>>>> *illegal)
>>>>>> -
>>>>>> -     /* For each character of field, search if it appears in the list
>>>>>> -      * of illegal characters. */
>>>>>> -+    if (illegal && NULL != strpbrk (field, illegal)) {
>>>>>> -+            return -1;
>>>>>> -+    }
>>>>>> -+
>>>>>> -+    /* Search if there are non-printable or control characters */
>>>>>> -     for (cp = field; '\0' != *cp; cp++) {
>>>>>> --            if (strchr (illegal, *cp) != NULL) {
>>>>>> -+            unsigned char c = *cp;
>>>>>> -+            if (!isprint (c)) {
>>>>>> -+                    err = 1;
>>>>>> -+            }
>>>>>> -+            if (iscntrl (c)) {
>>>>>> -                     err = -1;
>>>>>> -                     break;
>>>>>> -             }
>>>>>> -     }
>>>>>> -
>>>>>> --    if (0 == err) {
>>>>>> --            /* Search if there are non-printable or control characters */
>>>>>> --            for (cp = field; '\0' != *cp; cp++) {
>>>>>> --                    if (!isprint (*cp)) {
>>>>>> --                            err = 1;
>>>>>> --                    }
>>>>>> --                    if (!iscntrl (*cp)) {
>>>>>> --                            err = -1;
>>>>>> --                            break;
>>>>>> --                    }
>>>>>> --            }
>>>>>> --    }
>>>>>> --
>>>>>> -     return err;
>>>>>> - }
>>>>>> -
>>>>>> ---
>>>>>> -2.34.1
>>>>>> -
>>>>>> diff --git a/meta/recipes-extended/shadow/files/CVE-2023-29383.patch
>>>>>> b/meta/recipes-extended/shadow/files/CVE-2023-29383.patch
>>>>>> deleted file mode 100644
>>>>>> index f53341d3fc2..00000000000
>>>>>> --- a/meta/recipes-extended/shadow/files/CVE-2023-29383.patch
>>>>>> +++ /dev/null
>>>>>> @@ -1,53 +0,0 @@
>>>>>> -From e5905c4b84d4fb90aefcd96ee618411ebfac663d Mon Sep 17 00:00:00
>>>>>> 2001
>>>>>> -From: tomspiderlabs
>>>>>> <128755403+tomspiderlabs@users.noreply.github.com>
>>>>>> -Date: Thu, 23 Mar 2023 23:39:38 +0000
>>>>>> -Subject: [PATCH] Added control character check
>>>>>> -
>>>>>> -Added control character check, returning -1 (to "err") if control characters are present.
>>>>>> -
>>>>>> -CVE: CVE-2023-29383
>>>>>> -Upstream-Status: Backport
>>>>>> -
>>>>>> -Reference to upstream:
>>>>>> -https://github.com/shadow-maint/shadow/commit/e5905c4b84d4fb90aefcd
>>>>>> 96ee618411ebfac663d
>>>>>> -
>>>>>> -Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>>>>>> ----
>>>>>> - lib/fields.c | 11 +++++++----
>>>>>> - 1 file changed, 7 insertions(+), 4 deletions(-)
>>>>>> -
>>>>>> -diff --git a/lib/fields.c b/lib/fields.c -index 640be931..fb51b582
>>>>>> 100644
>>>>>> ---- a/lib/fields.c
>>>>>> -+++ b/lib/fields.c
>>>>>> -@@ -21,9 +21,9 @@
>>>>>> -  *
>>>>>> -  * The supplied field is scanned for non-printable and other
>>>>>> illegal
>>>>>> -  * characters.
>>>>>> -- *  + -1 is returned if an illegal character is present.
>>>>>> -- *  +  1 is returned if no illegal characters are present, but the field
>>>>>> -- *       contains a non-printable character.
>>>>>> -+ *  + -1 is returned if an illegal or control character is present.
>>>>>> -+ *  +  1 is returned if no illegal or control characters are present,
>>>>>> -+ *       but the field contains a non-printable character.
>>>>>> -  *  +  0 is returned otherwise.
>>>>>> -  */
>>>>>> - int valid_field (const char *field, const char *illegal) -@@
>>>>>> -45,10 +45,13 @@ int valid_field (const char *field, const char *illegal)
>>>>>> -     }
>>>>>> -
>>>>>> -     if (0 == err) {
>>>>>> --            /* Search if there are some non-printable characters */
>>>>>> -+            /* Search if there are non-printable or control
>>>>>> -+ characters */
>>>>>> -             for (cp = field; '\0' != *cp; cp++) {
>>>>>> -                     if (!isprint (*cp)) {
>>>>>> -                             err = 1;
>>>>>> -+                    }
>>>>>> -+                    if (!iscntrl (*cp)) {
>>>>>> -+                            err = -1;
>>>>>> -                             break;
>>>>>> -                     }
>>>>>> -             }
>>>>>> ---
>>>>>> -2.34.1
>>>>>> -
>>>>>> diff --git a/meta/recipes-extended/shadow/files/CVE-2023-4641.patch
>>>>>> b/meta/recipes-extended/shadow/files/CVE-2023-4641.patch
>>>>>> deleted file mode 100644
>>>>>> index 1fabfe928e4..00000000000
>>>>>> --- a/meta/recipes-extended/shadow/files/CVE-2023-4641.patch
>>>>>> +++ /dev/null
>>>>>> @@ -1,147 +0,0 @@
>>>>>> -From 25dbe2ce166a13322b7536ff2f738786ea2e61e7 Mon Sep 17 00:00:00
>>>>>> 2001
>>>>>> -From: Alejandro Colomar <alx@kernel.org>
>>>>>> -Date: Sat, 10 Jun 2023 16:20:05 +0200
>>>>>> -Subject: [PATCH] gpasswd(1): Fix password leak
>>>>>> -
>>>>>> -How to trigger this password leak?
>>>>>> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>>> -
>>>>>> -When gpasswd(1) asks for the new password, it asks twice (as is
>>>>>> usual -for confirming the new password).  Each of those 2 password
>>>>>> prompts -uses agetpass() to get the password.  If the second
>>>>>> agetpass() fails, -the first password, which has been copied into
>>>>>> the 'static' buffer -'pass' via STRFCPY(), wasn't being zeroed.
>>>>>> -
>>>>>> -agetpass() is defined in <./libmisc/agetpass.c> (around line 91),
>>>>>> and -can fail for any of the following reasons:
>>>>>> -
>>>>>> --  malloc(3) or readpassphrase(3) failure.
>>>>>> -
>>>>>> -   These are going to be difficult to trigger.  Maybe getting the system
>>>>>> -   to the limits of memory utilization at that exact point, so that the
>>>>>> -   next malloc(3) gets ENOMEM, and possibly even the OOM is triggered.
>>>>>> -   About readpassphrase(3), ENFILE and EINTR seem the only plausible
>>>>>> -   ones, and EINTR probably requires privilege or being the same user;
>>>>>> -   but I wouldn't discard ENFILE so easily, if a process starts opening
>>>>>> -   files.
>>>>>> -
>>>>>> --  The password is longer than PASS_MAX.
>>>>>> -
>>>>>> -   The is plausible with physical access.  However, at that point, a
>>>>>> -   keylogger will be a much simpler attack.
>>>>>> -
>>>>>> -And, the attacker must be able to know when the second password is
>>>>>> being -introduced, which is not going to be easy.
>>>>>> -
>>>>>> -How to read the password after the leak?
>>>>>> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>>> -
>>>>>> -Provoking the leak yourself at the right point by entering a very
>>>>>> long -password is easy, and inspecting the process stack at that
>>>>>> point should -be doable.  Try to find some consistent patterns.
>>>>>> -
>>>>>> -Then, search for those patterns in free memory, right after the
>>>>>> victim -leaks their password.
>>>>>> -
>>>>>> -Once you get the leak, a program should read all the free memory
>>>>>> -searching for patterns that gpasswd(1) leaves nearby the leaked
>>>>>> -password.
>>>>>> -
>>>>>> -On 6/10/23 03:14, Seth Arnold wrote:
>>>>>> -> An attacker process wouldn't be able to use malloc(3) for this task.
>>>>>> -> There's a handful of tools available for userspace to allocate memory:
>>>>>> ->
>>>>>> -> -  brk / sbrk
>>>>>> -> -  mmap MAP_ANONYMOUS
>>>>>> -> -  mmap /dev/zero
>>>>>> -> -  mmap some other file
>>>>>> -> -  shm_open
>>>>>> -> -  shmget
>>>>>> ->
>>>>>> -> Most of these return only pages of zeros to a process.  Using
>>>>>> -> mmap of an existing file, you can get some of the contents of the
>>>>>> -> file demand-loaded into the memory space on the first use.
>>>>>> ->
>>>>>> -> The MAP_UNINITIALIZED flag only works if the kernel was compiled
>>>>>> -> with CONFIG_MMAP_ALLOW_UNINITIALIZED.  This is rare.
>>>>>> ->
>>>>>> -> malloc(3) doesn't zero memory, to our collective frustration, but
>>>>>> -> all the garbage in the allocations is from previous allocations
>>>>>> -> in the current process.  It isn't leftover from other processes.
>>>>>> ->
>>>>>> -> The avenues available for reading the memory:
>>>>>> -> -  /dev/mem and /dev/kmem (requires root, not available with
>>>>>> -> Secure Boot)
>>>>>> -> -  /proc/pid/mem (requires ptrace privileges, mediated by YAMA)
>>>>>> -> -  ptrace (requires ptrace privileges, mediated by YAMA)
>>>>>> -> -  causing memory to be swapped to disk, and then inspecting the
>>>>>> -> swap
>>>>>> ->
>>>>>> -> These all require a certain amount of privileges.
>>>>>> -
>>>>>> -How to fix it?
>>>>>> -~~~~~~~~~~~~~~
>>>>>> -
>>>>>> -memzero(), which internally calls explicit_bzero(3), or whatever
>>>>>> -alternative the system provides with a slightly different name,
>>>>>> will -make sure that the buffer is zeroed in memory, and
>>>>>> optimizations are not -allowed to impede this zeroing.
>>>>>> -
>>>>>> -This is not really 100% effective, since compilers may place copies
>>>>>> of -the string somewhere hidden in the stack.  Those copies won't
>>>>>> get zeroed -by explicit_bzero(3).  However, that's arguably a
>>>>>> compiler bug, since -compilers should make everything possible to
>>>>>> avoid optimizing strings -that are later passed to
>>>>>> explicit_bzero(3).  But we all know that -sometimes it's impossible
>>>>>> to have perfect knowledge in the compiler, so -this is plausible.
>>>>>> Nevertheless, there's nothing we can do against such -issues, except
>>>>>> minimizing the time such passwords are stored in plain -text.
>>>>>> -
>>>>>> -Security concerns
>>>>>> -~~~~~~~~~~~~~~~~~
>>>>>> -
>>>>>> -We believe this isn't easy to exploit.  Nevertheless, and since the
>>>>>> fix -is trivial, this fix should probably be applied soon, and
>>>>>> backported to -all supported distributions, to prevent someone else
>>>>>> having more -imagination than us to find a way.
>>>>>> -
>>>>>> -Affected versions
>>>>>> -~~~~~~~~~~~~~~~~~
>>>>>> -
>>>>>> -All.  Bug introduced in shadow 19990709.  That's the second commit
>>>>>> in -the git history.
>>>>>> -
>>>>>> -Fixes: 45c6603cc86c ("[svn-upgrade] Integrating new upstream
>>>>>> version, shadow (19990709)")
>>>>>> -
>>>>>> -CVE: CVE-2023-4641
>>>>>> -Upstream-Status: Backport
>>>>>> [https://github.com/shadow-maint/shadow/commit/65c88a43a23c2391dcc90
>>>>>> c0abda3e839e9c57904]
>>>>>> -
>>>>>> -Reported-by: Alejandro Colomar <alx@kernel.org>
>>>>>> -Cc: Serge Hallyn <serge@hallyn.com>
>>>>>> -Cc: Iker Pedrosa <ipedrosa@redhat.com>
>>>>>> -Cc: Seth Arnold <seth.arnold@canonical.com>
>>>>>> -Cc: Christian Brauner <christian@brauner.io>
>>>>>> -Cc: Balint Reczey <rbalint@debian.org>
>>>>>> -Cc: Sam James <sam@gentoo.org>
>>>>>> -Cc: David Runge <dvzrv@archlinux.org>
>>>>>> -Cc: Andreas Jaeger <aj@suse.de>
>>>>>> -Cc: <~hallyn/shadow@lists.sr.ht>
>>>>>> -Signed-off-by: Alejandro Colomar <alx@kernel.org>
>>>>>> -Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>>>>>> ----
>>>>>> - src/gpasswd.c | 1 +
>>>>>> - 1 file changed, 1 insertion(+)
>>>>>> -
>>>>>> -diff --git a/src/gpasswd.c b/src/gpasswd.c -index
>>>>>> 5983f787..2d8869ef 100644
>>>>>> ---- a/src/gpasswd.c
>>>>>> -+++ b/src/gpasswd.c
>>>>>> -@@ -896,6 +896,7 @@ static void change_passwd (struct group *gr)
>>>>>> -             strzero (cp);
>>>>>> -             cp = getpass (_("Re-enter new password: "));
>>>>>> -             if (NULL == cp) {
>>>>>> -+                    memzero (pass, sizeof pass);
>>>>>> -                     exit (1);
>>>>>> -             }
>>>>>> -
>>>>>> ---
>>>>>> -2.34.1
>>>>>> -
>>>>>> diff --git
>>>>>> a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-
>>>>>> failure-in-chroot-env.patch
>>>>>> b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-
>>>>>> failure-in-chroot-env.patch index 85d91751056..4a932d2dbb1 100644
>>>>>> ---
>>>>>> a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-
>>>>>> failure-in-chroot-env.patch
>>>>>> +++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-o
>>>>>> +++ pen-failure-in-chroot-env.patch
>>>>>> @@ -1,4 +1,4 @@
>>>>>> -From 21583da072aa66901d859ac00ce209bac87ddecc Mon Sep 17 00:00:00
>>>>>> 2001
>>>>>> +From a773c6b240d27e23d6be41decef0edf24fcee523 Mon Sep 17 00:00:00
>>>>>> +2001
>>>>>>     From: Chen Qi <Qi.Chen@windriver.com>
>>>>>>     Date: Thu, 17 Jul 2014 15:53:34 +0800
>>>>>>     Subject: [PATCH]
>>>>>> commonio.c-fix-unexpected-open-failure-in-chroot-env
>>>>>> @@ -15,35 +15,37 @@ Note that this patch doesn't change the logic in the code, it just expands
>>>>>>     the codes.
>>>>>>
>>>>>>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>>>> -
>>>>>>     ---
>>>>>>      lib/commonio.c | 16 ++++++++++++----
>>>>>>      1 file changed, 12 insertions(+), 4 deletions(-)
>>>>>>
>>>>>>     diff --git a/lib/commonio.c b/lib/commonio.c -index
>>>>>> 9a02ce1..61384ec 100644
>>>>>> +index 73fdb3a..d1231e9 100644
>>>>>>     --- a/lib/commonio.c
>>>>>>     +++ b/lib/commonio.c
>>>>>> -@@ -616,10 +616,18 @@ int commonio_open (struct commonio_db *db,
>>>>>> int mode)
>>>>>> +@@ -606,10 +606,18 @@ int commonio_open (struct commonio_db *db,
>>>>>> +int mode)
>>>>>>         db->cursor = NULL;
>>>>>>         db->changed = false;
>>>>>>
>>>>>>     -   fd = open (db->filename,
>>>>>>     -                (db->readonly ? O_RDONLY : O_RDWR)
>>>>>> --               | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW);
>>>>>> +-               | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW | O_CLOEXEC);
>>>>>>     -   saved_errno = errno;
>>>>>>     +   if (db->readonly) {
>>>>>>     +           fd = open (db->filename,
>>>>>>     +                      (true ? O_RDONLY : O_RDWR)
>>>>>> -+                       | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW);
>>>>>> ++                       | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW |
>>>>>> ++ O_CLOEXEC);
>>>>>>     +           saved_errno = errno;
>>>>>>     +   } else {
>>>>>>     +           fd = open (db->filename,
>>>>>>     +                      (false ? O_RDONLY : O_RDWR)
>>>>>> -+                       | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW);
>>>>>> ++                       | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW|
>>>>>> ++ O_CLOEXEC);
>>>>>>     +           saved_errno = errno;
>>>>>>     +   }
>>>>>>     +
>>>>>>         db->fp = NULL;
>>>>>>         if (fd >= 0) {
>>>>>>      #ifdef WITH_TCB
>>>>>> +--
>>>>>> +2.30.2
>>>>>> +
>>>>>> diff --git a/meta/recipes-extended/shadow/shadow.inc
>>>>>> b/meta/recipes-extended/shadow/shadow.inc
>>>>>> index ce3ce627156..c024746d4ff 100644
>>>>>> --- a/meta/recipes-extended/shadow/shadow.inc
>>>>>> +++ b/meta/recipes-extended/shadow/shadow.inc
>>>>>> @@ -5,7 +5,7 @@ BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
>>>>>>     SECTION = "base/utils"
>>>>>>     LICENSE = "BSD-3-Clause"
>>>>>>     LIC_FILES_CHKSUM = "file://COPYING;md5=c9a450b7be84eac23e6353efecb60b5b \
>>>>>> -                    file://src/passwd.c;beginline=2;endline=30;md5=758c26751513b6795395275969dd3be1 \
>>>>>> +
>>>>>> + file://src/passwd.c;beginline=2;endline=7;md5=67bcf314687820b2f010
>>>>>> + d4863fce3fc5 \
>>>>>>                         "
>>>>>>
>>>>>>     DEPENDS = "virtual/crypt"
>>>>>> @@ -14,10 +14,6 @@ GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
>>>>>>     SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
>>>>>>                ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
>>>>>>                file://useradd \
>>>>>> -        file://0001-Fix-can-not-print-full-login.patch \
>>>>>> -           file://CVE-2023-29383.patch \
>>>>>> -           file://0001-Overhaul-valid_field.patch \
>>>>>> -           file://CVE-2023-4641.patch \
>>>>>>                "
>>>>>>
>>>>>>     SRC_URI:append:class-target = " \
>>>>>> @@ -26,14 +22,9 @@ SRC_URI:append:class-target = " \
>>>>>>                "
>>>>>>
>>>>>>     SRC_URI:append:class-native = " \
>>>>>> -           file://0001-Disable-use-of-syslog-for-sysroot.patch \
>>>>>>                file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
>>>>>>                "
>>>>>> -SRC_URI:append:class-nativesdk = " \
>>>>>> -           file://0001-Disable-use-of-syslog-for-sysroot.patch \
>>>>>> -           "
>>>>>> -SRC_URI[sha256sum] = "813057047499c7fe81108adcf0cffa3ad4ec75e19a80151f9cbaa458ff2e86cd"
>>>>>> -
>>>>>> +SRC_URI[sha256sum] = "a305edf5d19bddbdf5e836d2d609fa8bff2d35458819de4d9f06306a1cf24342"
>>>>>>
>>>>>>     # Additional Policy files for PAM
>>>>>>     PAM_SRC_URI = "file://pam.d/chfn \ @@ -44,7 +35,7 @@ PAM_SRC_URI =
>>>>>> "file://pam.d/chfn \
>>>>>>                    file://pam.d/passwd \
>>>>>>                    file://pam.d/su"
>>>>>>
>>>>>> -inherit autotools gettext github-releases
>>>>>> +inherit autotools gettext github-releases pkgconfig
>>>>>>
>>>>>>     export CONFIG_SHELL="/bin/sh"
>>>>>>
>>>>>> @@ -54,6 +45,8 @@ EXTRA_OECONF += "--without-libcrack \
>>>>>>                      --without-sssd \
>>>>>>                      ${NSCDOPT}"
>>>>>>
>>>>>> +CFLAGS:append:libc-musl = " -DLIBBSD_OVERLAY"
>>>>>> +
>>>>>>     NSCDOPT = ""
>>>>>>     NSCDOPT:class-native = "--without-nscd"
>>>>>>     NSCDOPT:class-nativesdk = "--without-nscd"
>>>>>> @@ -73,13 +66,14 @@ PAM_PLUGINS = "libpam-runtime \
>>>>>>
>>>>>>     PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
>>>>>>                        ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
>>>>>> -PACKAGECONFIG:class-native ??= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
>>>>>> +PACKAGECONFIG:class-native ??= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} libbsd"
>>>>>>     PACKAGECONFIG:class-nativesdk = ""
>>>>>>     PACKAGECONFIG[pam] = "--with-libpam,--without-libpam,libpam,${PAM_PLUGINS}"
>>>>>>     PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
>>>>>>     PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
>>>>>>     PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit"
>>>>>>     PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux libsemanage"
>>>>>> +PACKAGECONFIG[libbsd] = "--with-libbsd,--without-libbsd,libbsd"
>>>>>>
>>>>>>     RDEPENDS:${PN} = "shadow-securetty \
>>>>>>                       base-passwd \
>>>>>> diff --git a/meta/recipes-extended/shadow/shadow_4.13.bb
>>>>>> b/meta/recipes-extended/shadow/shadow_4.14.2.bb
>>>>>> similarity index 100%
>>>>>> rename from meta/recipes-extended/shadow/shadow_4.13.bb
>>>>>> rename to meta/recipes-extended/shadow/shadow_4.14.2.bb
>>>>>>
>>>>>>
>>>>>>


