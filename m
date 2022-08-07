Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C538C19F2A
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 16:02:22 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web08.14857.1659888141070053483
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 09:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m8iq4ml4;
 spf=pass (domain: gmail.com, ip: 209.85.219.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id k12so10406522ybk.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 09:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=QpNtHrHfE/kPdNxcgTXGLNxHPJKglBUqS5kYVZ7D9jo=;
        b=m8iq4ml4bdqdQahZMttv3uWyVLfEDrMMx3p1xBFQXCj1tXSk0NLCV9/1Rkd6Sx2vZL
         jx+cwIRs6Hp8rnJ81KJvrCjCxyNpeT4DVVlG8ZUHTyCyJ5k3ihipUufnq9eQu6c5yooG
         AcKwfsQUNK51/zdwTOzYl89j2cegjDYSdPjaw0/7ytheds6n7+18np1BtHMeJ820mROe
         JiCh87drZ5rryxdVH74bu0TNwmiE+LrrRJGYGv6grItM67gYORYndRPzn6A90zMLGPg7
         UOuV2o3800mLbDdIP1WVLU7jBDPxBAll6esQsJOSPwj8rgCrjctPnL6rdBRF1b3oqokT
         8NdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=QpNtHrHfE/kPdNxcgTXGLNxHPJKglBUqS5kYVZ7D9jo=;
        b=6JfnoS8ab5O922yLAzLVYZp5+/nsJYDRLniw68VciOs3vdVa0GbgCFBY/T3DOIsoDS
         vVFvbVgKMITGv1uyDj0n4mv4VlirF6GSZRPHPMVKXEta7t/Hjhx7tLA0SYInU0X4T1CT
         915VrTnmEj3ZnF9RAAHJ4E1QwSL/A36Y+773aXC9KvIQRkTiZWYPiuxWZFGMLCFaIEAm
         tFBAj4hm9Av6i49nIyFNRBTTqel1CASz3Bo+A4uuA3KnG4GtA06VCvqBX/7P8KHeEgGH
         /3Zc/7CioBUv3ek2uDXTKnMiC4FQ0Oi5U/qoi+hV3UJfMvZh+w7CHGTA4bVJGxNGUp6M
         SgWg==
X-Gm-Message-State: ACgBeo0ShcCOFQ0kiwYmX33pqwsA1fh1GSNomqPq4BXKAPYbxzSXTe8u
	2fdtj9m2nOLaT/RWLgEYuMF8uZMwyF3blK2mJGnnUMc4
X-Google-Smtp-Source: 
 AA6agR77yhkYjVq+EU4N1weslhVJPgw7hBxQsoDpstY8vGPFfLqJTFIHFD/nPhgFOXihxjFYdLRJ8sNc7vdpl1pm05U=
X-Received: by 2002:a25:8441:0:b0:671:833e:eaca with SMTP id
 r1-20020a258441000000b00671833eeacamr12430065ybm.226.1659888140024; Sun, 07
 Aug 2022 09:02:20 -0700 (PDT)
MIME-Version: 1.0
References: 
 <29469a94b96725978e7a2957de16d670fc981a7b.camel@linuxfoundation.org>
 <1705ADB698699ACE.21236@lists.openembedded.org>
 <170733CB4C175948.2604@lists.openembedded.org>
 <CA+chaQe3VR=wNFQBSfoQdLWdj2wBj_NLKWkQ079b1_tByJEqxA@mail.gmail.com>
In-Reply-To: 
 <CA+chaQe3VR=wNFQBSfoQdLWdj2wBj_NLKWkQ079b1_tByJEqxA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Aug 2022 09:01:52 -0700
Message-ID: 
 <CAMKF1sroD0+qW1yW+myGzn0URNQJN4z43BuKhYuMKdU9_UoZEg@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCHv2] glibc: revert one upstream change to
 work around broken DEBUG_BUILD build
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org, sundeep.kokkonda@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 16:02:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168995

On Sun, Aug 7, 2022 at 7:00 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> This issue is still reproducible in latest 2.36, I've updated:
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D29249
> and for the new strcpy issue I've bisected where it was introduced and cr=
eated new ticket upstream:
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D29454
> we can revert 2 more upstream commits as work around, but lets wait a bit=
 for upstream, maybe there is some simple fix, but I wasn't able to figure =
it out today (and don't want to spent even more time on it). Reverts includ=
ed in https://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa=
/master if someone want's to test it as well.
>

I think, we can also track them until they are baked a bit upstream
and backport the final fixes after we have upgraded to 2.36.

> Regards,
>
> On Mon, Aug 1, 2022 at 1:05 PM Martin Jansa via lists.openembedded.org <M=
artin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> FWIW: I was checking if this is still reproducible with 2.36 from khem's=
 branch:
>> https://github.com/YoeDistro/openembedded-core/commit/eec0967b92973b8ed5=
b2fe98ac652fe0da21493b
>>
>> and with DEBUG_BUILD it failed elsewhere now:
>> http://errors.yoctoproject.org/Errors/Details/663898/
>>
>> | /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/recip=
e-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/=
x86_64-oe-linux/12.1.0/ld.bfd: /OE/build/oe-core/tmp-glibc/work/core2-64-oe=
-linux/glibc/2.36-r0/build-x86_64-oe-linux/elf/librtld.os: in function `_dl=
_load_cache_lookup':
>> | /usr/src/debug/glibc/2.36-r0/git/elf/dl-cache.c:513: undefined referen=
ce to `strcpy'
>>
>> On Wed, Jul 27, 2022 at 1:57 PM Martin Jansa via lists.openembedded.org =
<Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:
>>>
>>> * work around for build failure with DEBUG_BUILD:
>>>   http://errors.yoctoproject.org/Errors/Details/661468/
>>>
>>>   TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.35-r0/recipe-sysroot-=
native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-=
linux/11.3.0/ld.bfd:
>>>   TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.35-r0/build-x86_64-oe=
-linux/libc.a(libc-tls.o):
>>>   in function `__libc_setup_tls':
>>>   /usr/src/debug/glibc/2.35-r0/git/csu/libc-tls.c:202: undefined refere=
nce to `_startup_fatal_not_constant'
>>>
>>>   introduced in:
>>>   https://git.openembedded.org/openembedded-core/commit/?id=3D50ca0eea5=
424c89c9b39cf69d8bd73fd65f06e95
>>>   with:
>>>   https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff;h=3Da2a6bce7=
d7e52c1c34369a7da62c501cc350bc31
>>>
>>>   Temporary reverting as discussed in:
>>>   https://lists.openembedded.org/g/openembedded-core/message/168463
>>>   (it's also reverted in buildroot now with: https://lore.kernel.org/bu=
ildroot/20220720213853.1A27184110@busybox.osuosl.org/t/)
>>>
>>>   instead of revert we can use -fexpensive-optimizations which
>>>   will optimize-out the symbol, but that works only with -O1 and
>>>   not -Og used by DEBUG_BUILD
>>>
>>>   upstream report:
>>>   https://sourceware.org/bugzilla/show_bug.cgi?id=3D29249
>>>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>>
>>>  v2: mention -fexpensive-optimizations and add link to upstream
>>>      bug report
>>>
>>>  ...lement-a-useful-version-of-_startup_.patch | 128 ++++++++++++++++++
>>>  meta/recipes-core/glibc/glibc_2.35.bb         |   2 +
>>>  2 files changed, 130 insertions(+)
>>>  create mode 100644 meta/recipes-core/glibc/glibc/0001-Revert-Linux-Imp=
lement-a-useful-version-of-_startup_.patch
>>>
>>> diff --git a/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-=
a-useful-version-of-_startup_.patch b/meta/recipes-core/glibc/glibc/0001-Re=
vert-Linux-Implement-a-useful-version-of-_startup_.patch
>>> new file mode 100644
>>> index 0000000000..2421a63605
>>> --- /dev/null
>>> +++ b/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-usefu=
l-version-of-_startup_.patch
>>> @@ -0,0 +1,128 @@
>>> +From 6b8959add09e425df262bf9178b39ca35bc4003c Mon Sep 17 00:00:00 2001
>>> +From: Martin Jansa <Martin.Jansa@gmail.com>
>>> +Date: Sun, 24 Jul 2022 19:41:41 +0200
>>> +Subject: [PATCH] Revert "Linux: Implement a useful version of _startup=
_fatal"
>>> +
>>> +This reverts commit 2d05ba7f8ef979947e910a37ae8115a816eb4d08.
>>> +Upstream-Status: Inappropriate [temporary work around]
>>> +
>>> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> +
>>> +---
>>> + sysdeps/unix/sysv/linux/i386/startup.h | 23 ++++++++++++---
>>> + sysdeps/unix/sysv/linux/ia64/startup.h | 22 ---------------
>>> + sysdeps/unix/sysv/linux/startup.h      | 39 -------------------------=
-
>>> + 3 files changed, 19 insertions(+), 65 deletions(-)
>>> + delete mode 100644 sysdeps/unix/sysv/linux/ia64/startup.h
>>> + delete mode 100644 sysdeps/unix/sysv/linux/startup.h
>>> +
>>> +diff --git a/sysdeps/unix/sysv/linux/i386/startup.h b/sysdeps/unix/sys=
v/linux/i386/startup.h
>>> +index 213805d7d2..67c9310f3a 100644
>>> +--- a/sysdeps/unix/sysv/linux/i386/startup.h
>>> ++++ b/sysdeps/unix/sysv/linux/i386/startup.h
>>> +@@ -1,5 +1,5 @@
>>> + /* Linux/i386 definitions of functions used by static libc main start=
up.
>>> +-   Copyright (C) 2022 Free Software Foundation, Inc.
>>> ++   Copyright (C) 2017-2022 Free Software Foundation, Inc.
>>> +    This file is part of the GNU C Library.
>>> +
>>> +    The GNU C Library is free software; you can redistribute it and/or
>>> +@@ -16,7 +16,22 @@
>>> +    License along with the GNU C Library; if not, see
>>> +    <https://www.gnu.org/licenses/>.  */
>>> +
>>> +-/* Can't use "call *%gs:SYSINFO_OFFSET" during startup.  */
>>> +-#define I386_USE_SYSENTER 0
>>> ++#if BUILD_PIE_DEFAULT
>>> ++/* Can't use "call *%gs:SYSINFO_OFFSET" during statup in static PIE. =
 */
>>> ++# define I386_USE_SYSENTER 0
>>> +
>>> +-#include_next <startup.h>
>>> ++# include <sysdep.h>
>>> ++# include <abort-instr.h>
>>> ++
>>> ++__attribute__ ((__noreturn__))
>>> ++static inline void
>>> ++_startup_fatal (const char *message __attribute__ ((unused)))
>>> ++{
>>> ++  /* This is only called very early during startup in static PIE.
>>> ++     FIXME: How can it be improved?  */
>>> ++  ABORT_INSTRUCTION;
>>> ++  __builtin_unreachable ();
>>> ++}
>>> ++#else
>>> ++# include_next <startup.h>
>>> ++#endif
>>> +diff --git a/sysdeps/unix/sysv/linux/ia64/startup.h b/sysdeps/unix/sys=
v/linux/ia64/startup.h
>>> +deleted file mode 100644
>>> +index 77f29f15a2..0000000000
>>> +--- a/sysdeps/unix/sysv/linux/ia64/startup.h
>>> ++++ /dev/null
>>> +@@ -1,22 +0,0 @@
>>> +-/* Linux/ia64 definitions of functions used by static libc main start=
up.
>>> +-   Copyright (C) 2022 Free Software Foundation, Inc.
>>> +-   This file is part of the GNU C Library.
>>> +-
>>> +-   The GNU C Library is free software; you can redistribute it and/or
>>> +-   modify it under the terms of the GNU Lesser General Public
>>> +-   License as published by the Free Software Foundation; either
>>> +-   version 2.1 of the License, or (at your option) any later version.
>>> +-
>>> +-   The GNU C Library is distributed in the hope that it will be usefu=
l,
>>> +-   but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> +-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>>> +-   Lesser General Public License for more details.
>>> +-
>>> +-   You should have received a copy of the GNU Lesser General Public
>>> +-   License along with the GNU C Library; if not, see
>>> +-   <https://www.gnu.org/licenses/>.  */
>>> +-
>>> +-/* This code is used before the TCB is set up.  */
>>> +-#define IA64_USE_NEW_STUB 0
>>> +-
>>> +-#include_next <startup.h>
>>> +diff --git a/sysdeps/unix/sysv/linux/startup.h b/sysdeps/unix/sysv/lin=
ux/startup.h
>>> +deleted file mode 100644
>>> +index 39859b404a..0000000000
>>> +--- a/sysdeps/unix/sysv/linux/startup.h
>>> ++++ /dev/null
>>> +@@ -1,39 +0,0 @@
>>> +-/* Linux definitions of functions used by static libc main startup.
>>> +-   Copyright (C) 2017-2022 Free Software Foundation, Inc.
>>> +-   This file is part of the GNU C Library.
>>> +-
>>> +-   The GNU C Library is free software; you can redistribute it and/or
>>> +-   modify it under the terms of the GNU Lesser General Public
>>> +-   License as published by the Free Software Foundation; either
>>> +-   version 2.1 of the License, or (at your option) any later version.
>>> +-
>>> +-   The GNU C Library is distributed in the hope that it will be usefu=
l,
>>> +-   but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> +-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>>> +-   Lesser General Public License for more details.
>>> +-
>>> +-   You should have received a copy of the GNU Lesser General Public
>>> +-   License along with the GNU C Library; if not, see
>>> +-   <https://www.gnu.org/licenses/>.  */
>>> +-
>>> +-#ifdef SHARED
>>> +-# include_next <startup.h>
>>> +-#else
>>> +-# include <sysdep.h>
>>> +-
>>> +-/* Avoid a run-time invocation of strlen.  */
>>> +-#define _startup_fatal(message)                                      =
   \
>>> +-  do                                                                 =
   \
>>> +-    {                                                                =
   \
>>> +-      size_t __message_length =3D __builtin_strlen (message);        =
     \
>>> +-      if (! __builtin_constant_p (__message_length))                 =
   \
>>> +-        {                                                            =
   \
>>> +-          extern void _startup_fatal_not_constant (void);            =
   \
>>> +-          _startup_fatal_not_constant ();                            =
   \
>>> +-        }                                                            =
   \
>>> +-      INTERNAL_SYSCALL_CALL (write, STDERR_FILENO, (message),        =
   \
>>> +-                             __message_length);                      =
   \
>>> +-      INTERNAL_SYSCALL_CALL (exit_group, 127);                       =
   \
>>> +-    }                                                                =
   \
>>> +-  while (0)
>>> +-#endif  /* !SHARED */
>>> diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/=
glibc/glibc_2.35.bb
>>> index 96fe39c548..df847e76bf 100644
>>> --- a/meta/recipes-core/glibc/glibc_2.35.bb
>>> +++ b/meta/recipes-core/glibc/glibc_2.35.bb
>>> @@ -48,6 +48,8 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};=
name=3Dglibc \
>>>             file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindi=
r-onl.patch \
>>>             file://0023-timezone-Make-shell-interpreter-overridable-in-=
tzsel.patch \
>>>             file://0024-fix-create-thread-failed-in-unprivileged-proces=
s-BZ-.patch \
>>> +           \
>>> +           file://0001-Revert-Linux-Implement-a-useful-version-of-_sta=
rtup_.patch \
>>>             "
>>>  S =3D "${WORKDIR}/git"
>>>  B =3D "${WORKDIR}/build-${TARGET_SYS}"
>>>
>>>
>>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#168746): https://lists.openembedded.org/g/openembedd=
ed-core/message/168746
>> Mute This Topic: https://lists.openembedded.org/mt/92744420/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [M=
artin.Jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

