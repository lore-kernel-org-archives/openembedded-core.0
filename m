Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF95DFA3753
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 13:20:50 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.73302.1726233643702111485
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Sep 2024 06:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IfU/N0zh;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42cb8dac900so20518095e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 06:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726233642; x=1726838442; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJbg8i1tOtZcY2MmZmG5DSEPA4LJCQZO436bwncaMM0=;
        b=IfU/N0zhBxL+CCkdzuQ1InlD8L7e1bRfrLefhupfCM0QwLzKrHW6nSJwrGb1Jo3sq9
         4oBBGw5tI9+YBbpVPwEKMjy6kMPysFdKGQQ1FjAWx29U7RBm3a//nlHaUn00SK3m09gc
         qK4QiTbaVxYLMEU4Xu9gD/H3/+wK20JgQFjizDh8QGWjmYDHox4UVCA3uKpe/Q56aFP9
         hENymL3MGkhTZxgev2c0Ind7EIXe/LLUi6v/MXZy+mTn3cZguwTwx39v8IDF2UXW0eZa
         I6LEL7lxs+l4EZUzmY7EcWYTuNuatV9CTw0So8GxeV9t9aqhDLD0gy2RhM7iEyj3QZa+
         Mjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726233642; x=1726838442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJbg8i1tOtZcY2MmZmG5DSEPA4LJCQZO436bwncaMM0=;
        b=C3mPImI3D7cMCPNpS45MzGknByljCxnMQkx83UiqwqW6oRlE4I9cThRXDuWNKSQ4KT
         T8Ggfu67XDY2InMPHDOLxCGQpwOLQHSHLdcCTCVOfXNzWUx7FUOFPcYdMotvTnMmvPqU
         oKlP6yiMNCAB7QA5CYyXhkp2diiepda+UbAoE/UCvqulfilzKyASHdUNHpqqCSt/UvPO
         NgmUjM2HYkhk0Gtkqe0LK/Lf6gkPhXy08EkAVDnn88p5tdXAuwo/0k9r5LrzOu1OB8CV
         GZuxm+J3uB9dT5w8HMym7ydBgpH738wzXfLrk3D7mCyI+r1dv2Zd66SVRyQfpjpB/+9Z
         WoMA==
X-Forwarded-Encrypted: i=1; AJvYcCXgCTgvsJIsZaAl7f4M4c3nNszqSXLgxN9zcTUmwe3mQCnjBADfAXuldQE2NLBJHMolNx1/yaWtk2lzWGmfDXO3IQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy4+xGFsvO9KxIcsfh5dK83vA3thjavVd2WjTjcT4Iw4yf+wnwA
	Qr/nYPPJRMjn3cK/YdLyb5+8KJ3q55qkT+EpUimyZ2zhNx7Le86ueyiXDQ==
X-Google-Smtp-Source: AGHT+IHhGYjbmU05jcl8fybkC+Te28l2/k5su8FcaCpfffncFsTwalbNez2Lj9t3SN+l94swjBlBCw==
X-Received: by 2002:a05:600c:1c8f:b0:42c:b905:2bf9 with SMTP id 5b1f17b1804b1-42cdb54077bmr65473395e9.16.1726233641286;
        Fri, 13 Sep 2024 06:20:41 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b05a783sm25458665e9.9.2024.09.13.06.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 06:20:40 -0700 (PDT)
Message-ID: <f5305713-f8ca-4d5b-8c0a-dab53b6921b5@gmail.com>
Date: Fri, 13 Sep 2024 15:20:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][oe-core][PATCH] mesa: add support for rusticl
To: Markus Volk <f_l_k@t-online.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20240908172311.3773048-1-f_l_k@t-online.de>
 <CANNYZj_aLfFFe14-YNYfGt5T05dRb_-N7NPSk3Tx5-j09xRtrg@mail.gmail.com>
 <HSHJJS.OO3X80OW2KGA@t-online.de>
 <17F4C79C2431BD42.10184@lists.openembedded.org>
 <b3c52dd5-e19a-442a-9da6-7ad1857c1e0c@gmail.com>
 <HE5RJS.ZELCTN0DIQK32@t-online.de>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <HE5RJS.ZELCTN0DIQK32@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 13:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204485

2024. 09. 13. 14:59 keltezéssel, Markus Volk írta:
> Hi,
> thanks for the feedback. Yes, I accidentally added the patch I made for mesa 24.2.1. 
> Currently I have it like this, which should also work:
>
> diff --git a/src/gallium/frontends/rusticl/meson.build 
> b/src/gallium/frontends/rusticl/meson.build
> index 84df0a9edb9..20459f73993 100644
> --- a/src/gallium/frontends/rusticl/meson.build
> +++ b/src/gallium/frontends/rusticl/meson.build
> @@ -122,6 +122,7 @@ endif
>  rusticl_bindgen_c_args = [
>    '-fno-builtin-malloc',
> +  '-I@include@', '-I@include_cpp@', '-I@include_cpp_target_sys@',
>  ]
>  cl_c_args = [
> -- 
>
> One assumption on the shader issue. intel_clc is currently added only for x86-64. If you 
> are building for another platform intel_clc is not installed for mesa-native, but 
> required for 'iris'.
>
> Changing this line:
> GALLIUMDRIVERS:append ="${@bb.utils.contains_any('PACKAGECONFIG', 'opencl-rusticl 
> opencl-clover', ',iris', '', d)}"
> to:
> GALLIUMDRIVERS:append:x86-64 ="${@bb.utils.contains_any('PACKAGECONFIG', 'opencl-rusticl 
> opencl-clover', ',iris', '', d)}"
>
> might remove the need to disable raytracing in EXTRA_OEMESON
>
> Alternatively also removing x86-64 from these lines:
> EXTRA_OEMESON:append:class-target:x86-64 = " ${@bb.utils.contains_any('PACKAGECONFIG', 
> 'opencl-rusticl opencl-clover', '-Dintel-clc=system', '', d)}"
> EXTRA_OEMESON:append:class-native:x86-64 = " ${@bb.utils.contains_any('PACKAGECONFIG', 
> 'opencl-rusticl opencl-clover', '-Dintel-clc=enabled -Dinstall-intel-clc=true 
> -Dgallium-rusticl=false', '', d)}"
>
> might help, but I'm unsure if intel_clc would be of any use apart from x86-64

IIRC, Intel fixed their kernel driver to build and work on e.g. aarch64
(or was it their new "xe" driver that has this?) and the expectation is
that some 64-bit ARM systems do have PCIe and their discrete GPUs
would be usable on other platforms than x86-64.

>
>
> On Fri, Sep 13 2024 at 12:43:46 PM +02:00:00, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>> 2024. 09. 13. 12:40 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
>>
>>     2024. 09. 09. 11:45 keltezéssel, Markus Volk via lists.openembedded.org írta:
>>
>>         On Mon, Sep 9 2024 at 10:46:59 AM +02:00:00, Alexander Kanavin
>>         <alex.kanavin@gmail.com> wrote:
>>
>>             This does need to be properly looked into, there's probably a better patch
>>             possible, or a build setting we're missing, or at least an upstream
>>             ticket to be filed. It's not a good patch when it says 'workaround' and
>>             doesn't explain the issue and the fix. 
>>
>>         Fully agree. This is ugly as hell. Just a quick and dirty hack to get things
>>         working (which is always a good starting point) but by no means a solution
>>         for oe-core. Thats why I marked it RFC 
>>
>>     Don't call it a "workaround" then. Call it "pass in recipe-sysroot include
>>     directories" because that's what this patch does combined with the mesa.inc changes. 
>>
>> The underlying problem seems to be that bindgen does not seem to pick up CFLAGS or 
>> CPPFLAGS automatically, so it needs the extra -I options passed in under Yocto to look 
>> for headers in the correct places.
>>
>>     Though it's not complete in my testing. I needed this patch against 24.2.2 so I
>>     could build Mesa Rusticl, plus EXTRA_OEMESON += "-Dintel-rt=disabled" in my
>>     bbappend because the iris driver failed to build otherwise, complaining for every
>>     generated file from *.cl about "shader not available, consider installing libclc"
>>     or something like that, eventually failing the build. diff --git
>>     a/src/gallium/frontends/rusticl/meson.build
>>     b/src/gallium/frontends/rusticl/meson.build index eef09d8f01e..efac4cab964 100644
>>     --- a/src/gallium/frontends/rusticl/meson.build +++
>>     b/src/gallium/frontends/rusticl/meson.build @@ -146,6 +146,7 @@
>>     rusticl_opencl_bindings_rs = rust.bindgen(      rusticl_bindgen_c_args,     
>>     pre_args,      cl_c_args, +   '-I@include@', '-I@include_cpp@',
>>     '-I@include_cpp_target_sys@'    ],    args : [      rusticl_bindgen_args, @@ -190,6
>>     +191,7 @@ rusticl_llvm_bindings_rs = rust.bindgen(    c_args : [     
>>     rusticl_bindgen_c_args,      pre_args, +   '-I@include@', '-I@include_cpp@',
>>     '-I@include_cpp_target_sys@'    ],    dependencies : [      dep_clang,
>>
>>     -=-=-=-=-=-=-=-=-=-=-=- Links: You receive all messages sent to this group.
>>     View/Reply Online (#204478):
>>     https://lists.openembedded.org/g/openembedded-core/message/204478 Mute This Topic:
>>     https://lists.openembedded.org/mt/108340502/3617728 Group Owner:
>>     openembedded-core+owner@lists.openembedded.org Unsubscribe:
>>     https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
>>     -=-=-=-=-=-=-=-=-=-=-=- 
>>


