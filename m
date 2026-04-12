Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C8FE937F6
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 17:55:58 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.253260.1776016550913122544
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 10:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SWoIKt0Q;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2d52c7f92b1so2722180eec.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 10:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776016550; x=1776621350; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7+xb/8846ECa5Uit65Bh9ql0ZaS6qJo4H1M8cpekYog=;
        b=SWoIKt0QIIsx6volMhVqE2O0eyeEKb4a/c3zG3fMRWciK7ryLM/KyOHIfppacP6dL3
         xSolZ0uKGQARKRTC1/p0HguyYWz2qeVnIrdwEuc4hmAaB8DrxZgczSl/C0CSibsakU0w
         Z8ewd213bZFteYXhFcE+Jf3hh32/ofLCxWHOOj+0+AebCnRTQa/sHS6GiUR5oxrlRMzR
         zXs6pk02ZN8HcINi5HtVv8AfYhPK/gyhJBx0giaM7f76r9hjuRW1H18OGtG9tjsJf/vi
         Tc49zjStMIgGNjhXhefkAfi1t5XnQMo49HTg/vhPGd52ndm8wWP1DPHJFsQKcf2XLoYF
         6k2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776016550; x=1776621350;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+xb/8846ECa5Uit65Bh9ql0ZaS6qJo4H1M8cpekYog=;
        b=Aqmt7Uuuytvdpy5zVT1ilNlExY6p6wZjL6oziVeyRLXOA3B/bx9bQAuxOk6Y4RsMIB
         E7n+zn5n4Tz1/9PsqFZBe328gZA+SpW5HAR8e/b0x4NXeUR4pV6wgGAE0xFpL6Vi8d1E
         a8Kxk5f16TX8skUHV4EmwX5u1fxvB8s1/WrkjC6ulXSYK/UPs9FdgA1zlIRE5g0XYiQW
         5l2YlmzonWSEtyPS1u8e9WadtnJwhb8S4laycW/WbeadqY6w23C5iR6hrMTHxnkMrpbX
         Y8fYBNCYjcESpWY1QIP1UaIn+jKxJ1tOrlqz4Qs5PVXkcfmIeebYsnQnEXEyMncWREom
         LAqg==
X-Forwarded-Encrypted: i=1; AFNElJ+y2Lv54msVK4B66T1/I9Hhlj5WtorTgZsyObHuwP3LEMOJvNyFIXe/7PgmHpbiNcZqzyW0ZW9NxdRzNj4lq/kKag==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yys9iBDIlB773PN0dj0ttqv1fl3IKtjCJtuAF0+gM6k2ztFXQFk
	wiaC48BQ2UtR1ibppZfnDKwQvOc9wEYgM4zl/B+Zp6dujmCCTycjnWNQ
X-Gm-Gg: AeBDiesnraQXCI6bv8ZI+C7A2KFDS2Qg4jHdQqfHX1Wf9zGZWrYnAFzgLUhH3RtmOiV
	J20ctgCnBlAHRsD18MTJOSosmKkqjjvZ9leq3jKdCLh3jzoxyJA+uIvRG6p4OgcCdcnE11orTtM
	8e9wBDkKNeUS+m7bObjxWbJ9r/mujoFj9EVoD5CkN0KRUG6GjndPWt1hn42dYKMhdnEc9KPoyLJ
	thusUuBlFXhzmbSPDlKhPE9QS01HaUdp3fsBz/HzgoaXuKytq/vlMaLyVo6R4y/iOreUxnwwdOl
	bWgGdWlsPB2arckq5VruWsDvW9fuknavbF6Ps8pHRl8h21vyi7KN2HLbf7w7fmm/MZpLZZ6xIMz
	MbYspJHxOl3EvvasNBYoWKN9vdAAdlE0ikfaavd3866fucYq+vmwKpRDLp5K4GBZh28qgwx5BJe
	ioMApCdSZGC8UDPcJOjUfLSW7ofPeQC5tqgz1O2tToA+GgxyzrgbK2TlXZH8Kni5G0iP4q314yj
	C+QEK9YGTGCyzMwgra+px7SFzrkZ6YJ20k/MTRHn2ifPjC+cu5h/p8vxbQuJLMchVS41r3fjMb5
	AigCOSlQEvsgYtx87RbU1U0H3eoImfRy
X-Received: by 2002:a05:7301:1014:b0:2d2:d7b7:5c6e with SMTP id 5a478bee46e88-2d5876a0692mr5181363eec.8.1776016550085;
        Sun, 12 Apr 2026 10:55:50 -0700 (PDT)
Received: from [10.0.0.45] ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5630ac330sm13030983eec.29.2026.04.12.10.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 10:55:49 -0700 (PDT)
Message-ID: <3db51117-1912-4580-89b9-a6bf3962ff5e@gmail.com>
Date: Sun, 12 Apr 2026 10:55:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] apr: fix build with autoconf-2.73
To: Martin Jansa <martin.jansa@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20260410134915.3936107-1-martin.jansa@gmail.com>
 <8ffabe3414bdb206a716aa9ee5db2fc964d07e79.camel@linuxfoundation.org>
 <CAMKF1soX-iCuuf_ygqXU7PAwryUw5NS7fJCpr_J5mezVF_3oyg@mail.gmail.com>
 <CA+chaQfRM1A_gDHzdOm_uPcXpz7TR_gwtVwt1g5yVPmN81_bdg@mail.gmail.com>
Content-Language: en-US-large
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <CA+chaQfRM1A_gDHzdOm_uPcXpz7TR_gwtVwt1g5yVPmN81_bdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 17:55:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235071



On 4/12/26 4:17 AM, Martin Jansa wrote:
> On Sun, Apr 12, 2026 at 9:22 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On Sat, Apr 11, 2026 at 11:01 PM Richard Purdie via lists.openembedded.org <richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
>>>
>>> On Fri, 2026-04-10 at 15:49 +0200, Martin Jansa via lists.openembedded.org wrote:
>>>> From: Martin Jansa <martin.jansa@gmail.com>
>>>>
>>>> On hosts with gcc-13 it was trying to use -std=gnu23 and failing
>>>> with unrecognized command-line option (gnu23 needs gcc-14 and newer)
>>>>
>>>> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>>>> ---
>>>>   ...rog_cc_for_build.m4-update-to-latest.patch | 189 ++++++++++++++++++
>>>>   meta/recipes-support/apr/apr_1.7.6.bb         |   1 +
>>>>   2 files changed, 190 insertions(+)
>>>>   create mode 100644 meta/recipes-support/apr/apr/0001-ax_prog_cc_for_build.m4-update-to-latest.patch
>>>>
>>>> diff --git a/meta/recipes-support/apr/apr/0001-ax_prog_cc_for_build.m4-update-to-latest.patch b/meta/recipes-support/apr/apr/0001-ax_prog_cc_for_build.m4-update-to-latest.patch
>>>> new file mode 100644
>>>> index 0000000000..2607f6f860
>>>> --- /dev/null
>>>> +++ b/meta/recipes-support/apr/apr/0001-ax_prog_cc_for_build.m4-update-to-latest.patch
>>>> @@ -0,0 +1,189 @@
>>>> +From 24eb9fd3469e610b6887517a80b8e038c200e807 Mon Sep 17 00:00:00 2001
>>>> +From: Martin Jansa <martin.jansa@gmail.com>
>>>> +Date: Fri, 10 Apr 2026 15:04:43 +0200
>>>> +Subject: [PATCH] ax_prog_cc_for_build.m4: update to latest
>>>> +MIME-Version: 1.0
>>>> +Content-Type: text/plain; charset=UTF-8
>>>> +Content-Transfer-Encoding: 8bit
>>>> +
>>>> +After the autoconf update to 2.73 this was using -std=gnu23
>>>> +even on hosts with gcc-13 which doesn't support it:
>>>> +
>>>> +ac_cv_prog_ac_ct_CC_FOR_BUILD='gcc '
>>>> +CC_FOR_BUILD='gcc  -std=gnu23'
>>>> +ac_ct_CC_FOR_BUILD='gcc '
>>>> +
>>>> +Leading to:
>>>> +gcc: error: unrecognized command-line option ‘-std=gnu23’; did you mean ‘-std=gnu2x’?
>>>> +
>>>> +Needs the updated ac_cv_prog_cc_c23 from:
>>>> +https://github.com/autoconf-archive/autoconf-archive/commit/8a970ce96721f516fef4226e5eca8da341159765
>>>> +
>>>> +Upstream-Status: Submitted [https://github.com/apache/apr/pull/72]
>>>> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>>>> +---
>>>> + build/ax_prog_cc_for_build.m4 | 99 ++++++++++++++++++++++++++---------
>>>> + 1 file changed, 74 insertions(+), 25 deletions(-)
>>>> +
>>>> +diff --git a/build/ax_prog_cc_for_build.m4 b/build/ax_prog_cc_for_build.m4
>>>> +index 26daf36..4d1de99 100644
>>>> +--- a/build/ax_prog_cc_for_build.m4
>>>> ++++ b/build/ax_prog_cc_for_build.m4
>>>> +@@ -32,28 +32,32 @@
>>>> + #   and this notice are preserved. This file is offered as-is, without any
>>>> + #   warranty.
>>>> +
>>>> +-#serial 9
>>>> ++#serial 26
>>>> +
>>>> + AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
>>>> + AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
>>>> + AC_REQUIRE([AC_PROG_CC])dnl
>>>> + AC_REQUIRE([AC_PROG_CPP])dnl
>>>> +-AC_REQUIRE([AC_EXEEXT])dnl
>>>> +-AC_REQUIRE([AC_CANONICAL_HOST])dnl
>>>> ++AC_REQUIRE([AC_CANONICAL_BUILD])dnl
>>>> +
>>>> + dnl Use the standard macros, but make them use other variable names
>>>> + dnl
>>>> + pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
>>>> + pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
>>>> ++pushdef([ac_cv_prog_cc_c89], ac_cv_build_prog_cc_c89)dnl
>>>> ++pushdef([ac_cv_prog_cc_c99], ac_cv_build_prog_cc_c99)dnl
>>>> ++pushdef([ac_cv_prog_cc_c11], ac_cv_build_prog_cc_c11)dnl
>>>> ++pushdef([ac_cv_prog_cc_c23], ac_cv_build_prog_cc_c23)dnl
>>>> ++pushdef([ac_cv_prog_cc_stdc], ac_cv_build_prog_cc_stdc)dnl
>>>> + pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
>>>> + pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
>>>> + pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
>>>> +-pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
>>>> +-pushdef([ac_cv_objext], ac_cv_build_objext)dnl
>>>> ++pushdef([ac_prog_cc_stdc], ac_build_prog_cc_stdc)dnl
>>>> + pushdef([ac_exeext], ac_build_exeext)dnl
>>>> + pushdef([ac_objext], ac_build_objext)dnl
>>>> + pushdef([CC], CC_FOR_BUILD)dnl
>>>> + pushdef([CPP], CPP_FOR_BUILD)dnl
>>>> ++pushdef([GCC], GCC_FOR_BUILD)dnl
>>>> + pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
>>>> + pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
>>>> + pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
>>>> +@@ -67,27 +71,58 @@ pushdef([ac_cv_host_alias], ac_cv_build_alias)dnl
>>>> + pushdef([ac_cv_host_cpu], ac_cv_build_cpu)dnl
>>>> + pushdef([ac_cv_host_vendor], ac_cv_build_vendor)dnl
>>>> + pushdef([ac_cv_host_os], ac_cv_build_os)dnl
>>>> +-pushdef([ac_cpp], ac_build_cpp)dnl
>>>> +-pushdef([ac_compile], ac_build_compile)dnl
>>>> +-pushdef([ac_link], ac_build_link)dnl
>>>> ++pushdef([ac_tool_prefix], ac_build_tool_prefix)dnl
>>>> ++pushdef([am_cv_CC_dependencies_compiler_type], am_cv_build_CC_dependencies_compiler_type)dnl
>>>> ++pushdef([am_cv_prog_cc_c_o], am_cv_build_prog_cc_c_o)dnl
>>>> ++pushdef([cross_compiling], cross_compiling_build)dnl
>>>> ++dnl
>>>> ++dnl These variables are problematic to rename by M4 macros, so we save
>>>> ++dnl their values in alternative names, and restore the values later.
>>>> ++dnl
>>>> ++dnl _AC_COMPILER_EXEEXT and _AC_COMPILER_OBJEXT internally call
>>>> ++dnl AC_SUBST which prevents the renaming of EXEEXT and OBJEXT
>>>> ++dnl variables. It's not a good idea to rename ac_cv_exeext and
>>>> ++dnl ac_cv_objext either as they're related.
>>>> ++dnl Renaming ac_exeext and ac_objext is safe though.
>>>> ++dnl
>>>> ++ac_cv_host_exeext=$ac_cv_exeext
>>>> ++AS_VAR_SET_IF([ac_cv_build_exeext],
>>>> ++  [ac_cv_exeext=$ac_cv_build_exeext],
>>>> ++  [AS_UNSET([ac_cv_exeext])])
>>>> ++ac_cv_host_objext=$ac_cv_objext
>>>> ++AS_VAR_SET_IF([ac_cv_build_objext],
>>>> ++  [ac_cv_objext=$ac_cv_build_objext],
>>>> ++  [AS_UNSET([ac_cv_objext])])
>>>> ++dnl
>>>> ++dnl ac_cv_c_compiler_gnu is used in _AC_LANG_COMPILER_GNU (called by
>>>> ++dnl AC_PROG_CC) indirectly.
>>>> ++dnl
>>>> ++ac_cv_host_c_compiler_gnu=$ac_cv_c_compiler_gnu
>>>> ++AS_VAR_SET_IF([ac_cv_build_c_compiler_gnu],
>>>> ++  [ac_cv_c_compiler_gnu=$ac_cv_build_c_compiler_gnu],
>>>> ++  [AS_UNSET([ac_cv_c_compiler_gnu])])
>>>> +
>>>> +-save_cross_compiling=$cross_compiling
>>>> +-save_ac_tool_prefix=$ac_tool_prefix
>>>> +-cross_compiling=no
>>>> +-ac_tool_prefix=
>>>> ++cross_compiling_build=no
>>>> +
>>>> ++ac_build_tool_prefix=
>>>> ++AS_IF([test -n "$build"],      [ac_build_tool_prefix="$build-"],
>>>> ++      [test -n "$build_alias"],[ac_build_tool_prefix="$build_alias-"])
>>>> ++
>>>> ++AC_LANG_PUSH([C])
>>>> + AC_PROG_CC
>>>> ++_AC_COMPILER_EXEEXT
>>>> ++_AC_COMPILER_OBJEXT
>>>> + AC_PROG_CPP
>>>> +-AC_EXEEXT
>>>> +
>>>> +-ac_tool_prefix=$save_ac_tool_prefix
>>>> +-cross_compiling=$save_cross_compiling
>>>> ++BUILD_EXEEXT=$ac_cv_exeext
>>>> ++BUILD_OBJEXT=$ac_cv_objext
>>>> +
>>>> + dnl Restore the old definitions
>>>> + dnl
>>>> +-popdef([ac_link])dnl
>>>> +-popdef([ac_compile])dnl
>>>> +-popdef([ac_cpp])dnl
>>>> ++popdef([cross_compiling])dnl
>>>> ++popdef([am_cv_prog_cc_c_o])dnl
>>>> ++popdef([am_cv_CC_dependencies_compiler_type])dnl
>>>> ++popdef([ac_tool_prefix])dnl
>>>> + popdef([ac_cv_host_os])dnl
>>>> + popdef([ac_cv_host_vendor])dnl
>>>> + popdef([ac_cv_host_cpu])dnl
>>>> +@@ -101,26 +136,40 @@ popdef([host])dnl
>>>> + popdef([LDFLAGS])dnl
>>>> + popdef([CPPFLAGS])dnl
>>>> + popdef([CFLAGS])dnl
>>>> ++popdef([GCC])dnl
>>>> + popdef([CPP])dnl
>>>> + popdef([CC])dnl
>>>> + popdef([ac_objext])dnl
>>>> + popdef([ac_exeext])dnl
>>>> +-popdef([ac_cv_objext])dnl
>>>> +-popdef([ac_cv_exeext])dnl
>>>> ++popdef([ac_prog_cc_stdc])dnl
>>>> + popdef([ac_cv_prog_cc_g])dnl
>>>> + popdef([ac_cv_prog_cc_cross])dnl
>>>> + popdef([ac_cv_prog_cc_works])dnl
>>>> ++popdef([ac_cv_prog_cc_stdc])dnl
>>>> ++popdef([ac_cv_prog_cc_c23])dnl
>>>> ++popdef([ac_cv_prog_cc_c11])dnl
>>>> ++popdef([ac_cv_prog_cc_c99])dnl
>>>> ++popdef([ac_cv_prog_cc_c89])dnl
>>>> + popdef([ac_cv_prog_gcc])dnl
>>>> + popdef([ac_cv_prog_CPP])dnl
>>>> ++dnl
>>>> ++ac_cv_exeext=$ac_cv_host_exeext
>>>> ++EXEEXT=$ac_cv_host_exeext
>>>> ++ac_cv_objext=$ac_cv_host_objext
>>>> ++OBJEXT=$ac_cv_host_objext
>>>> ++ac_cv_c_compiler_gnu=$ac_cv_host_c_compiler_gnu
>>>> ++ac_compiler_gnu=$ac_cv_host_c_compiler_gnu
>>>> ++
>>>> ++dnl restore global variables ac_ext, ac_cpp, ac_compile,
>>>> ++dnl ac_link, ac_compiler_gnu (dependent on the current
>>>> ++dnl language after popping):
>>>> ++AC_LANG_POP([C])
>>>> +
>>>> + dnl Finally, set Makefile variables
>>>> + dnl
>>>> +-BUILD_EXEEXT=$ac_build_exeext
>>>> +-BUILD_OBJEXT=$ac_build_objext
>>>> +-AC_SUBST(BUILD_EXEEXT)dnl
>>>> +-AC_SUBST(BUILD_OBJEXT)dnl
>>>> ++AC_SUBST([BUILD_EXEEXT])dnl
>>>> ++AC_SUBST([BUILD_OBJEXT])dnl
>>>> + AC_SUBST([CFLAGS_FOR_BUILD])dnl
>>>> + AC_SUBST([CPPFLAGS_FOR_BUILD])dnl
>>>> + AC_SUBST([LDFLAGS_FOR_BUILD])dnl
>>>> + ])
>>>> +-
>>>> diff --git a/meta/recipes-support/apr/apr_1.7.6.bb b/meta/recipes-support/apr/apr_1.7.6.bb
>>>> index 13fa5daa3c..86fac1e4c8 100644
>>>> --- a/meta/recipes-support/apr/apr_1.7.6.bb
>>>> +++ b/meta/recipes-support/apr/apr_1.7.6.bb
>>>> @@ -22,6 +22,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
>>>>              file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch \
>>>>              file://autoconf-2.73.patch \
>>>>              file://0001-dso-Check-for-NULL-handle-in-apr_dso_sym.patch \
>>>> +           file://0001-ax_prog_cc_for_build.m4-update-to-latest.patch \
>>>>              "
>>>>
>>>>   SRC_URI[sha256sum] = "49030d92d2575da735791b496dc322f3ce5cff9494779ba8cc28c7f46c5deb32"
>>>
>>> I think this caused a reproducibility issue:
>>>
>>> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260412-a5w4mcrk/packages/diff-html/
>>>
>>
>> I think we should sed -std=gnu23 out from CC_FOR_BUILD in the mk file in do_install
> 
> Surprisingly the native build behaves a bit differently than target
> and neither of my systems used -std=gnu23 in CC_FOR_BUILD in native
> build (even when gcc on host is new enough).

Autoconf 2.73 tries to add -std=gnu23 when compiler default option set 
seems to be not defaulting to C23. with your patch it now fixes a case, 
where
it was adding it without checking if the underlying compiler even 
supports this option.

gcc15 defaults to C23 so it finds that and does not add that, gcc13 does 
neither default to or have gnu23 so it will again not add it, but gcc14
e.g. the option is there but compiler does not default to it, so it will 
add -std=gnu23 in that case.

and then we have different version of GCC from buildtools on some hosts

I am not sure what host gcc was in use when the compared packages were 
built, but if we can trace that info it can shed more light onto it.



> 
> I've sent the sed as suggested:
> https://lists.openembedded.org/g/openembedded-core/message/235065
> 
> Cheers,


