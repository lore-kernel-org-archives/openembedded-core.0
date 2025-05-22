Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEF4C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 21:22:32 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.34894.1747948947802267980
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 14:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jjs5yobX;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-742c2ed0fe1so5589559b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747948947; x=1748553747; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SeDa8/36NTcmfF1aNjB4X2BBUBKryeq0RRRwQgXGyhc=;
        b=jjs5yobXSXRKQrWcgP6N6nGJHS+kgPY6bBptOF789kigB994Y3WLyiiaAMPcpGtY9U
         MInljNe1AdYj3vPZAuQnBNgM5/JmePyIAy1al5wJGpf9O41wJjVorpEYRU2JCKNLt52B
         hGDkUCqkhEcInTPKrsLKc4f1x/TY1mESXA956fgNfusQUd5mmyL6uYjZMDO6J7cO9YLe
         rcdF+pB6fOy9zCJNeUBBOdsTi52bx6586avYx3h25F0WewhTSc9dbjhfTqhn88hTuiIs
         HSy3v6uPFtTm0zudbB8L3siR2uId/owSgt861VWeVoEv6dpXSn6G96ArTOCO7e9Wvj6/
         9wDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747948947; x=1748553747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SeDa8/36NTcmfF1aNjB4X2BBUBKryeq0RRRwQgXGyhc=;
        b=TTJcFclB8bB7Sc6sft6aWfOGbwM/LrBblL0YiVjWLnqd8MTIGH4F8LwPcwtvA+j3O1
         /BX/f2cYSrqJfQroFF50EDI/9gnJe2Ugymh81BlWgvhb66nyvpVpssxMECO4Sroj2cSf
         lY7/gYdWdqTIalsAW8RS/sfH7gw3mgdAnWkERsFV0oERgKv3GA3XF3PBvsfxg6ICKyZY
         f1gtFnxM9taEeVTWWGuBYhHWkm28VakMb9k9TvkIsdRXPDFh2Qr+22PfGZrPIkabwwnN
         QbiyjjtpRwCAgre9UgsJKraSw9JVBY5SHH7R5cMCJIahI19yDRomjtftDMIk0Mr4kHGH
         FbwA==
X-Forwarded-Encrypted: i=1; AJvYcCVi8QD+GvWJBb/1BUxA3wCTJ9OJZS9r3115yYwnEQgZ1lYLR0F6W1duBfQuCcDrYsxr9WDtPSPL877t5jzt6l6UHw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxhc7W1E8PtXqWflpUy3n8EZOLJiSgMXxZ9UTlp15nU2/shkLwc
	hP+OPD6ixRiYcgIfBMf4zKZDHYvZ9ujfrGAILrM8GUbagwFIqEvH+wvN
X-Gm-Gg: ASbGnctNJhX5Ba2jUnmCJwQJoDQdf3rv4CW29Vclwp+TAVd8zYnp+oANqaEGNhfbNWJ
	vEy1Q22r+D6qrY9H5+wshvWZ9pw2MQfztqOeyJq9R0OBmL1RVXIkM6xYZOfZijWa02nCNuU7GD+
	k/3Mcw1GQdYzta83S10r3kk2TqtMr7QxfqII4MDvG2jYwCtgYuFCL/3gkViVpFcIAvYyqr/VDRP
	ReyINpsYQKKv8/XR1n2gZtucJklA+A5uzAaLAO2Ej0OLr36LrpyfKeqNbM/oqp6GaCcnAw6mc17
	eauThNEmAsEDWz9vNefGM157a0dVuHUPJ5aBExu/sQmYOL0sDD49SSxCgCAup99vVBOh2cazc4H
	2gfmJCmhMtxkCwrM4W+N+P+dBt8XA32s1VaMAmzwgHAGzvsyHHA==
X-Google-Smtp-Source: AGHT+IGvm+AHnESy9FVe7MjY5zk+mDaZo4oJHbP9xWUSl5FMziGPQ2DjFOHI5Jj81MOC4BDXsqvuMg==
X-Received: by 2002:a05:6a00:3a14:b0:740:67ce:1d8b with SMTP id d2e1a72fcca58-742a97b7a1bmr36606117b3a.7.1747948946894;
        Thu, 22 May 2025 14:22:26 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:7444:5952:9108:1ddc? ([2601:646:8201:fd20:7444:5952:9108:1ddc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a4755sm12006932b3a.179.2025.05.22.14.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 14:22:26 -0700 (PDT)
Message-ID: <2062df5b-ec33-4adf-9697-5ee81c942be6@gmail.com>
Date: Thu, 22 May 2025 14:22:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 01/28] toolchain: Provide abstraction for
 choosing per-recipe toolchain
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
 <20250520-clang-toolchain-v2-1-db97c2eb3756@gmail.com>
 <428d48d7ba7c2e7f946f775ed3cbd403f1347229.camel@linuxfoundation.org>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <428d48d7ba7c2e7f946f775ed3cbd403f1347229.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 21:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217151



On 5/22/25 3:50 AM, Richard Purdie wrote:
> On Tue, 2025-05-20 at 23:19 -0700, Khem Raj via lists.openembedded.org wrote:
>> This implements a toolchain selection mechanism with existing defaults
>> unchanged.
>>
>> It introduces a variable called TOOLCHAIN, which denotes the familiar
>> name for toolchain e.g. "gcc" which selects GNU compiler + binutils
>> as default C/C++ toolchain or "clang" which will use LLVM/Clang Compiler
>>
>> Additionally build-gcc is used for selecting native compiler
>>
>> TOOLCHAIN variable has a global fallback to "gcc" in configuration
>> metadata. A distro can switch to using say "clang" as default system
>> compiler by defining
>>
>> TOOLCHAIN ?= "clang"
>>
>> In local.conf or other distro specific global configuration metadata
>>
>> It is also selectable at recipe scope, since not all packages are
>> buildable with either clang or gcc, a recipe can explicitly demand
>> a given toolchain e.g. glibc can not be built with clang therefore
>> glibc recipe sets.
>>
>> TOOLCHAIN = "gcc"
>>
>> TCOVERRIDE is defined to toolchain-TOOLCHAIN and its added to OVERRIDES
>> that a recipe can see and it can use "toolchain-gcc" or "toolchain-clang"
>> to set specific metadata based upon global toolchain policy in distro.
>>
>> toolchain: Use TOOLCHAIN_NATIVE for defining native compiler
>>
>> This helps in selecting gcc or clang for native compiler irrespective
>> of cross-compiler selection via TOOLCHAIN variable
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta/classes-global/base.bbclass                   |  5 ++++
>>   meta/classes-recipe/cross-canadian.bbclass         |  2 ++
>>   meta/classes-recipe/cross.bbclass                  |  2 ++
>>   meta/classes-recipe/crosssdk.bbclass               |  2 ++
>>   meta/classes-recipe/native.bbclass                 |  2 ++
>>   meta/classes-recipe/nativesdk.bbclass              |  2 ++
>>   meta/classes/clang-native.bbclass                  | 28 ++++++++++++++++++++++
>>   .../toolchain/clang.inc => classes/clang.bbclass}  | 10 ++++----
>>   .../build-gcc.inc => classes/gcc-native.bbclass}   |  1 -
>>   .../toolchain/gcc.inc => classes/gcc.bbclass}      |  1 +
>>   meta/conf/bitbake.conf                             |  7 +++---
>>   11 files changed, 53 insertions(+), 9 deletions(-)
> 
> This is definitely getting there, thanks for working through it.
> 
> I think we're ready to agree that we should support toolchain
> selection with the TOOLCHAIN variable and we should support toolchain
> overrides. There are therefore some patches in this series which can
> merge as we agree on that.
> 
> One of the concerns I have left is the class naming as I think
> "gcc.bbclass" is confusing in its own right. I'm wondering if we put
> these classes into a toolchain directory to make it clearer.

thats a good idea, perhaps I will move them into classes-toolchain/ folder.

> 
> I do also conceptually prefer the idea of an inc file so I'm wondering
> if we should see if some kind of require_defer syntax could work?
> 

We will always have exceptions where packages are not buildable with one 
toolchain or other and I found that doing it in class + override is 
quite good and extensible to other toolchains in future with a global 
fallback.

>> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
>> index 8215969c7bb37c1a1b91e260cd31714fee2db87c..ab2f0686b7b09e004ba8d5bb609e81b19da67e38 100644
>> --- a/meta/classes-global/base.bbclass
>> +++ b/meta/classes-global/base.bbclass
>> @@ -6,6 +6,7 @@
>>   
>>   BB_DEFAULT_TASK ?= "build"
>>   CLASSOVERRIDE ?= "class-target"
>> +TCOVERRIDE ?= "toolchain-gcc"
>>   
>>   inherit patch
>>   inherit staging
>> @@ -19,6 +20,10 @@ PACKAGECONFIG_CONFARGS ??= ""
>>   
>>   inherit metadata_scm
>>   
>> +inherit gcc-native
>> +inherit gcc
>> +inherit_defer ${@oe.utils.ifelse(d.getVar('TOOLCHAIN') == 'clang', 'clang', '')}
> 
> I'm a bit puzzled on why we can't defer the gcc inherit here too? I
> guess that didn't work for some reason?
> 

TOOLCHAIN variable is processed later for bbclassextend'ed recipes and 
competes with nativesdk's quest to be last in line of inherits, then 
having a default fallback toolchain to be gcc is a reasonable choice
since we can not _yet_ use non-gcc toolchains to build complete set of
recipes. Its getting there though.


>> +
>>   def lsb_distro_identifier(d):
>>       adjust = d.getVar('LSB_DISTRO_ADJUST')
>>       adjust_func = None
>> diff --git a/meta/classes-recipe/cross-canadian.bbclass b/meta/classes-recipe/cross-canadian.bbclass
>> index 059d9aa95f57dd77a0ab5172c4c15c13ed3bc43e..a9dc6aa9bac7d5cc27331a505ed213aa9d402d4d 100644
>> --- a/meta/classes-recipe/cross-canadian.bbclass
>> +++ b/meta/classes-recipe/cross-canadian.bbclass
>> @@ -14,6 +14,8 @@
>>   EXCLUDE_FROM_WORLD = "1"
>>   NATIVESDKLIBC ?= "libc-glibc"
>>   LIBCOVERRIDE = ":${NATIVESDKLIBC}"
>> +TCOVERRIDE = ""
>> +TOOLCHAIN = ""
>>   CLASSOVERRIDE = "class-cross-canadian"
>>   STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}:${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
>>   
>> diff --git a/meta/classes-recipe/cross.bbclass b/meta/classes-recipe/cross.bbclass
>> index 93de9a527446554b93c1e323c7458cc7aacef799..7ebf37760ca1fcad8cd1a2ee41ef32a29cca9b92 100644
>> --- a/meta/classes-recipe/cross.bbclass
>> +++ b/meta/classes-recipe/cross.bbclass
>> @@ -10,6 +10,8 @@ inherit relocatable
>>   # no need for them to be a direct target of 'world'
>>   EXCLUDE_FROM_WORLD = "1"
>>   
>> +TCOVERRIDE = ""
>> +TOOLCHAIN = ""
>>   CLASSOVERRIDE = "class-cross"
>>   PACKAGES = ""
>>   PACKAGES_DYNAMIC = ""
> 
> Wouldn't the recipes that include this class set TOOLCHAIN correctly
> anyway?
> 
> 
>> diff --git a/meta/classes-recipe/crosssdk.bbclass b/meta/classes-recipe/crosssdk.bbclass
>> index 824b1bcff47bcd36a70aa1d7b8724b6cf07131ff..0c0144b26829d3b76d034a89133ee94cf760b86d 100644
>> --- a/meta/classes-recipe/crosssdk.bbclass
>> +++ b/meta/classes-recipe/crosssdk.bbclass
>> @@ -7,6 +7,8 @@
>>   inherit cross
>>   
>>   CLASSOVERRIDE = "class-crosssdk"
>> +TCOVERRIDE = ""
>> +TOOLCHAIN = ""
>>   NATIVESDKLIBC ?= "libc-glibc"
>>   LIBCOVERRIDE = ":${NATIVESDKLIBC}"
>>   MACHINEOVERRIDES = ""
> 
> Same question here.
> 
>> diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
>> index 625975a69429389a5b231a19b17e8ed7a12d80ad..cbdace9b7021e90a4df2684d9eacda36112b46c6 100644
>> --- a/meta/classes-recipe/native.bbclass
>> +++ b/meta/classes-recipe/native.bbclass
>> @@ -108,6 +108,8 @@ PKG_CONFIG_SYSTEM_INCLUDE_PATH[unexport] = "1"
>>   
>>   # we dont want libc-*libc to kick in for native recipes
>>   LIBCOVERRIDE = ""
>> +TCOVERRIDE = ""
>> +TOOLCHAIN = ""
>>   CLASSOVERRIDE = "class-native"
>>   MACHINEOVERRIDES = ""
>>   MACHINE_FEATURES = ""
> 
> This, I can understand although I know there was "clang-native" support
> in places. I guess that is deferred for now?
> 
>> diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/nativesdk.bbclass
>> index 7ecb4c12c1f0f2b9cc48da215006a153679facf8..440bc3a5c5434152dfe5c9c19db1c2be857cd794 100644
>> --- a/meta/classes-recipe/nativesdk.bbclass
>> +++ b/meta/classes-recipe/nativesdk.bbclass
>> @@ -13,6 +13,8 @@ STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${S
>>   # libc for the SDK can be different to that of the target
>>   NATIVESDKLIBC ?= "libc-glibc"
>>   LIBCOVERRIDE = ":${NATIVESDKLIBC}"
>> +TCOVERRIDE = ""
>> +TOOLCHAIN = ""
>>   CLASSOVERRIDE = "class-nativesdk"
>>   MACHINEOVERRIDES = ""
> 
> Do you have any plans to support building the SDK with clang? I'm just
> wondering on the code direction here in the future.
> 


yes precisely the reason, we can today create SDKs with both gcc and 
clang compiler toolchains in it.

> 
>> diff --git a/meta/classes/clang-native.bbclass b/meta/classes/clang-native.bbclass
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..bf395eade73eaad18bf15f35d03bc0aec2223090
>> --- /dev/null
>> +++ b/meta/classes/clang-native.bbclass
>> @@ -0,0 +1,28 @@
>> +# inherit this class if you would like to use clang to compile the native
>> +# version of your recipes instead of system compiler ( which is normally gcc )
>> +# on build machines
>> +# to use it add
>> +#
>> +# inherit clang-native
>> +#
>> +# to the concerned recipe via a bbappend or directly to recipe file
>> +#
>> +BUILD_CC = "${CCACHE}${BUILD_PREFIX}clang ${BUILD_CC_ARCH} -isysroot=${STAGING_DIR_NATIVE}"
>> +BUILD_CXX = "${CCACHE}${BUILD_PREFIX}clang++ ${BUILD_CC_ARCH} -isysroot=${STAGING_DIR_NATIVE}"
>> +BUILD_FC = "${BUILD_PREFIX}gfortran ${BUILD_CC_ARCH} -isysroot=${STAGING_DIR_NATIVE}"
>> +BUILD_CPP = "${BUILD_PREFIX}clang ${BUILD_CC_ARCH} -isysroot=${STAGING_DIR_NATIVE} -E"
>> +BUILD_LD = "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
>> +BUILD_CCLD = "${BUILD_PREFIX}clang ${BUILD_CC_ARCH}"
>> +BUILD_AR = "${BUILD_PREFIX}llvm-ar"
>> +BUILD_AS = "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"
>> +BUILD_RANLIB = "${BUILD_PREFIX}llvm-ranlib -D"
>> +BUILD_STRIP = "${BUILD_PREFIX}llvm-strip"
>> +BUILD_OBJCOPY = "${BUILD_PREFIX}llvm-objcopy"
>> +BUILD_OBJDUMP = "${BUILD_PREFIX}llvm-objdump"
>> +BUILD_NM = "${BUILD_PREFIX}llvn-nm"
>> +BUILD_READELF = "${BUILD_PREFIX}readelf"
>> +DEPENDS:append = " clang-native compiler-rt-native libcxx-native"
>> +# Use libcxx headers for native parts
>> +CXXFLAGS:append = " -stdlib=libc++"
>> +LDFLAGS:append = " -stdlib=libc++ -rtlib=libgcc -unwindlib=libgcc"
>> +BUILD_LDFLAGS:append = " -stdlib=libc++ -rtlib=libgcc -unwindlib=libgcc"
> 
> Where/how does this get used?

This is used when using clang-native to build native portions ( want to 
override native gcc ) e.g. chromium which requires it, there are other 
packages which can optionally use it when using clang toolchains
qtwebengine, rust-llvm, rust to name a few. It makes it easy to use 
clang as native compiler.

> 
> 
>> diff --git a/meta/conf/toolchain/clang.inc b/meta/classes/clang.bbclass
>> similarity index 76%
>> rename from meta/conf/toolchain/clang.inc
>> rename to meta/classes/clang.bbclass
>> index 0e5f0769f85a8373c58d4b54dbe2bb1cf7dbd50b..be8b888918d1b4b4ae1d245df2c9da013cdc826e 100644
>> --- a/meta/conf/toolchain/clang.inc
>> +++ b/meta/classes/clang.bbclass
>> @@ -17,9 +17,11 @@ READELF = "${HOST_PREFIX}llvm-readelf"
>>   PREFERRED_PROVIDER_virtual/cross-cc = "${MLPREFIX}clang-cross-${TARGET_ARCH}"
>>   PREFERRED_PROVIDER_virtual/cross-c++ = "${MLPREFIX}clang-cross-${TARGET_ARCH}"
>>   PREFERRED_PROVIDER_virtual/compilerlibs = "gcc-runtime"
>> -PREFERRED_PROVIDER_virtual/cross-cc:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
>> -PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
>> +PREFERRED_PROVIDER_virtual/cross-cc:class-nativesdk = "clang-crosssdk-${SDK_SYS}"
>> +PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk = "clang-crosssdk-${SDK_SYS}"
>>   
>> -PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "gcc-crosssdk-${SDK_SYS}"
>> -PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "gcc-crosssdk-${SDK_SYS}"
>> +PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "clang-crosssdk-${SDK_SYS}"
>> +PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "clang-crosssdk-${SDK_SYS}"
>>   PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
>> +
>> +TCOVERRIDE = "toolchain-clang"
> 
> 
> This can probably be split into a separate patch and merged sooner.

I kept this together for keep things building atomically across bisects 
etc. But I think I can separate adding the TCOVERRIDE logic to patch of 
its own.

> 
>> diff --git a/meta/conf/toolchain/build-gcc.inc b/meta/classes/gcc-native.bbclass
>> similarity index 99%
>> rename from meta/conf/toolchain/build-gcc.inc
>> rename to meta/classes/gcc-native.bbclass
>> index a708bd0389a123504301fd151fb9ebdb677926be..1e1d68b027806b94e8229d4efef025cc1c038ad3 100644
>> --- a/meta/conf/toolchain/build-gcc.inc
>> +++ b/meta/classes/gcc-native.bbclass
>> @@ -12,4 +12,3 @@ BUILD_OBJCOPY = "${BUILD_PREFIX}objcopy"
>>   BUILD_OBJDUMP = "${BUILD_PREFIX}objdump"
>>   BUILD_NM = "${BUILD_PREFIX}nm"
>>   BUILD_READELF = "${BUILD_PREFIX}readelf"
>> -
>> diff --git a/meta/conf/toolchain/gcc.inc b/meta/classes/gcc.bbclass
>> similarity index 97%
>> rename from meta/conf/toolchain/gcc.inc
>> rename to meta/classes/gcc.bbclass
>> index 36d33f5d6d0bfbf0f36158f389c4112ce20d806b..75f9abe999a297c7b17e64e693ffd8f441bb16b1 100644
>> --- a/meta/conf/toolchain/gcc.inc
>> +++ b/meta/classes/gcc.bbclass
>> @@ -24,3 +24,4 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "gcc-crosssdk-${SDK_SYS}"
>>   PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "gcc-crosssdk-${SDK_SYS}"
>>   PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
>>   
>> +TCOVERRIDE = "toolchain-gcc"
> 
> 
> The TCOVERRIDE pieces could also be a separate patch to move things
> forward until we resolve the inherit_defer/require/naming discussion?
> 
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index e5037c6277841908df333b16adbe4e6cce55f814..cfd70498b246fa1bf03e4730ecd5bf5be759ed44 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -13,6 +13,8 @@ BASELIB = "lib"
>>   BASELIB:libc-glibc:powerpc64 = "lib64"
>>   BASELIB:libc-glibc:powerpc64le = "lib64"
>>   
>> +TOOLCHAIN ??= "gcc"
>> +
>>   # Path prefixes
>>   export base_prefix = ""
>>   export prefix = "/usr"
>> @@ -801,7 +803,7 @@ DISTRO_NAME ??= "OpenEmbedded"
>>   # And finally '<foo>:forcevariable' overrides any standard variable, with the highest priority.
>>   # This works for functions as well, they are really just variables.
>>   #
>> -OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:layer-${FILE_LAYERNAME}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
>> +OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:layer-${FILE_LAYERNAME}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:${TCOVERRIDE}${LIBCOVERRIDE}:forcevariable"
> 
> Lets pull the overrides bit into a separate patch.
> 
> 
> Cheers,
> 
> Richard


