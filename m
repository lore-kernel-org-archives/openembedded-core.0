Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07201C83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 17:08:54 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.83585.1752512931428704401
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 10:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IMCoWVa/;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae3b336e936so905256666b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 10:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752512930; x=1753117730; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Mn4rJgebGFv1efUJYz4dFBjg/R7bcE27LkL28jaQKw=;
        b=IMCoWVa/E34eBXng2/xC7F79i05kEq+iwC6vUuV68W/MCTyqMcB/OWnBCAgZwuXZzl
         PINOw3TragC+OMe44Z8A/ssqzXZrqVQEUVuGQkv1qa8G7c0VKDYGD3cEd4VDW6fozar7
         LWh+anXv7l7cG3Tg1eupTFsXxEaAmdA0N207pTS5ma3wZShvg8lWkJK87DiVSwH0EB+c
         P8Ee1hAn+ZAQUb3ZnRlxCostjHtr6rK7/AIhZWo+l5Gel3ApfPC23U0H4guAgvWyHog0
         JBwazSF4iLOMRU2W/yAlnZxRs264v63/Qo9thvQLShYpD20RI287kDpWsUa9dCym7RJU
         fRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752512930; x=1753117730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Mn4rJgebGFv1efUJYz4dFBjg/R7bcE27LkL28jaQKw=;
        b=q5dV3pbf1I7eHY6GiZEtrTx5VjImOfSlTsOugMqKRBHdJDyf7b5np64P+mab83nlMn
         9ctVkebh+ZEaGHAXCOLdXNBtsTsff0xbWM3rmfUsAQ8vvTQ6LFkbZfKo/B3OHByx9mXB
         yECINvOzMw/H7EsOgvY2xxQtyei+vVer5dcntKYhveFwLkpkNtLswNVQn59dO2IL4v5O
         j8zNpHLHA5aU4QpTOm99hQLQaOJY5rjTdofkTCFiesOLJ5L3NJQ9AUpQqSCUwqsvhzcl
         05V+On6hovBGx6WinDQWefMXDpCRIxGDMvqx1UbxW3RFn9cjh7+3Ea2tuX2MueYYnAGI
         O3lQ==
X-Gm-Message-State: AOJu0Yz4k2M0sNe1bro5LJWhWOyFy53MRRVORtFn1FBT8viXuVxsV7Fs
	o+SlqTiZ5JDYitEmYYyQPFXGJ6g+3hUeYTsFTC8P7Y9zilruadxKm/ei
X-Gm-Gg: ASbGnctEmiNqk4Vj6dLC1eNW4Yvn1AZtQrsu7qvumXhA9b1kP6ZkU+G1j6wH/HrOB82
	kSOO1OokD9qiloyu8Yfi0L7bCmtQGhIW268hcIUJUbMegq9cWxD0EgRb6/bKy193PYJ8ztVgJbj
	JHec05cPHdAgPu+sqkVlzIr833y6n75dmZ3IOwMZdxsYS9S4A6hQwDmIq8iR9HoYbekvNe08KRA
	kG6GJ8dj19hfbz5NeYFpRUI0BAJEN6Nq6e2UgunsfbqC8r7ujsvddStVbHNq6SdCBkCL7da6OWk
	bG/yEcVkmQQZLC3MmX5rc2ziO2WFUWVpYywsEVtpSRmFcIiSrsO67Dgj78BbjxETSVhHtBdxp2F
	fRUYpcDxu0bIwOcNuIjcOawQ+E/S+sA==
X-Google-Smtp-Source: AGHT+IEP/rz+TbJi9J4/8KiVAusSzcjjLvqePLIZwMuFgyJHVtfFHvxAU5/to+zXvaTozslVzxZ7Yw==
X-Received: by 2002:a17:906:730c:b0:ae1:f1e0:8730 with SMTP id a640c23a62f3a-ae6fcc7a6b8mr1385611566b.57.1752512929337;
        Mon, 14 Jul 2025 10:08:49 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e826456fsm862841466b.96.2025.07.14.10.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 10:08:48 -0700 (PDT)
Message-ID: <5d963c9a-e838-4e30-92e9-a148c8c435e8@gmail.com>
Date: Mon, 14 Jul 2025 19:08:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] compiler-rt: Always use clang for compiler
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250506201127.4188369-1-raj.khem@gmail.com>
 <bbda64ad-2bee-4679-9e07-5b1a82a6aac5@gmail.com>
 <CAMKF1spFQiiGvi3q5Om4J9pNu1Efufk3=Dv_1AN6YrxZWfPBCA@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1spFQiiGvi3q5Om4J9pNu1Efufk3=Dv_1AN6YrxZWfPBCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 17:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220255

On 7/14/25 18:59, Khem Raj wrote:
> On Mon, Jul 14, 2025 at 8:03 AM Gyorgy Sarvari <skandigraun@gmail.com> wrote:
>> I realize that this is a fairly old commit... anyway.
>>
>> During the weekend I decided to update a personal project of mine to the
>> tip of master, but after performing the main required changes, I faced
>> compiler-rt build failures, complaining about unrecognized -mcpu
>> argument during the compiler sanity check in do_configure[1].
>> Bisecting oe-core points to this commit. The project I'm using uses
>> -mcpu=cortex-a72.cortex-a53+crc+crypto (DEFAULTTUNE =
>> "cortexa72-cortexa53-crypto"), which is not accepted after this change.
>>
>> Is this a user error, and I'm supposed to change something after this
>> revision, or is this a regression?
> clang has differences in syntax for big.LITTLE arm systems sadly. In meta-clang
> we have a fix for this
> https://github.com/kraj/meta-clang/blob/master/classes/clang-legacy.bbclass#L25-L38
>
> We need to do something similar in either clang bbclass or in recipes
> using toolchain-clang
> override.

Thanks a lot. Will run some tests in the coming days, and if I don't
find any issues locally, will try to submit a patch (I think it would
make sense to put it in clang.bbclass, most likely others would stumble
upon this too over time)

>> Thanks
>>
>> [1]:
>> https://gist.github.com/OldManYellsAtCloud/1e0a931a815a054a35cf61792e529b70
>>
>> On 5/6/25 22:11, Khem Raj via lists.openembedded.org wrote:
>>> This makes it build for all architectures e.g. riscv/mips/ppc etc.
>>>
>>> Using clang-native to build all variants of recipe makes it easier to
>>> handle compiling with various distros choosing different runtimes
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>> v2: Fix builds when using clang as default system compiler
>>>
>>>  .../recipes-devtools/clang/compiler-rt_git.bb | 29 ++++++++++++-------
>>>  1 file changed, 18 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
>>> index 93928541273..a0f9c769a06 100644
>>> --- a/meta/recipes-devtools/clang/compiler-rt_git.bb
>>> +++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
>>> @@ -32,15 +32,15 @@ DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-native clang-crosssdk
>>>  DEPENDS:append:class-native = " clang-native"
>>>
>>>  # Trick clang.bbclass into not creating circular dependencies
>>> -UNWINDLIB:class-nativesdk:toolchain-clang = "--unwindlib=libgcc"
>>> -COMPILER_RT:class-nativesdk:toolchain-clang = "-rtlib=libgcc --unwindlib=libgcc"
>>> -LIBCPLUSPLUS:class-nativesdk:toolchain-clang = "-stdlib=libstdc++"
>>> -UNWINDLIB:class-native:toolchain-clang = "--unwindlib=libgcc"
>>> -COMPILER_RT:class-native:toolchain-clang = "-rtlib=libgcc --unwindlib=libgcc"
>>> -LIBCPLUSPLUS:class-native:toolchain-clang = "-stdlib=libstdc++"
>>> -UNWINDLIB:class-target:toolchain-clang = "--unwindlib=libgcc"
>>> -COMPILER_RT:class-target:toolchain-clang = "-rtlib=libgcc --unwindlib=libgcc"
>>> -LIBCPLUSPLUS:class-target:toolchain-clang = "-stdlib=libstdc++"
>>> +UNWINDLIB:class-nativesdk = "--unwindlib=libgcc"
>>> +COMPILER_RT:class-nativesdk = "-rtlib=libgcc"
>>> +LIBCPLUSPLUS:class-nativesdk = "-stdlib=libstdc++"
>>> +UNWINDLIB:class-native = "--unwindlib=libgcc"
>>> +COMPILER_RT:class-native = "-rtlib=libgcc"
>>> +LIBCPLUSPLUS:class-native = "-stdlib=libstdc++"
>>> +UNWINDLIB:class-target = "--unwindlib=libgcc"
>>> +COMPILER_RT:class-target = "-rtlib=libgcc"
>>> +LIBCPLUSPLUS:class-target = "-stdlib=libstdc++"
>>>
>>>  PACKAGECONFIG ??= ""
>>>  PACKAGECONFIG[crt] = "-DCOMPILER_RT_BUILD_CRT:BOOL=ON,-DCOMPILER_RT_BUILD_CRT:BOOL=OFF"
>>> @@ -52,6 +52,13 @@ HF = ""
>>>  HF:class-target = "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', 'hf', '', d)}"
>>>  HF[vardepvalue] = "${HF}"
>>>
>>> +CC = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
>>> +CXX = "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
>>> +BUILD_CC = "${CCACHE}clang ${BUILD_CC_ARCH}"
>>> +BUILD_CXX = "${CCACHE}clang++ ${BUILD_CC_ARCH}"
>>> +LDFLAGS += "${COMPILER_RT} ${UNWINDLIB}"
>>> +CXXFLAGS += "${LIBCPLUSPLUS}"
>>> +
>>>  OECMAKE_TARGET_COMPILE = "compiler-rt"
>>>  OECMAKE_TARGET_INSTALL = "install-compiler-rt install-compiler-rt-headers"
>>>  OECMAKE_SOURCEPATH = "${S}/llvm"
>>> @@ -72,7 +79,7 @@ EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
>>>
>>>  EXTRA_OECMAKE:append:class-native = "\
>>>                    -DCOMPILER_RT_DEFAULT_TARGET_ARCH=${HOST_ARCH} \
>>> -                  -DCMAKE_C_COMPILER_TARGET=${HOST_ARCH} \
>>> +                  -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
>>>  "
>>>
>>>  EXTRA_OECMAKE:append:class-target = "\
>>> @@ -89,7 +96,7 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
>>>                 -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
>>>                 -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
>>>                 -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
>>> -               -DCMAKE_C_COMPILER_TARGET=${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}${HF} \
>>> +               -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
>>>  "
>>>  EXTRA_OECMAKE:append:powerpc = " -DCOMPILER_RT_DEFAULT_TARGET_ARCH=powerpc "
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#216082): https://lists.openembedded.org/g/openembedded-core/message/216082
>>> Mute This Topic: https://lists.openembedded.org/mt/112656561/6084445
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


