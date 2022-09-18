Return-Path: <andrey.konovalov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01748C54EE9
	for <webhook@archiver.kernel.org>; Sun, 18 Sep 2022 11:58:40 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web12.7999.1663502311487163583
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Sep 2022 04:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LVXx2e8p;
 spf=pass (domain: linaro.org, ip: 209.85.167.43,
 mailfrom: andrey.konovalov@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id k10so42523651lfm.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Sep 2022 04:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=NC/IiINIzAqJ482YgmMRidXRKp2g3QaeBYINb/EGdEk=;
        b=LVXx2e8pe8SBiYco7ZbojTqxUmkRTO8y+xwKbpuuibCL5gdBBM+xd/LfXXllQUn4oL
         hBZz6F5ORr7pIva2/FQpG/g3G/vXhuGvYyOBfp3pducxpP//j9+OfctN/VtxMJsh575O
         lRAspPreXdXZBaRsA48qPRkGxd1MFb3Lt7LiCNRc2Hn/Set/mPTC0lNYUV37xaDPqwXt
         rqeGgFAQFxMc/bA5T0siqG3SAnMRMS/0s1JVxr5csbc4nAg6qwRho8wJDFTYZnzoeB5s
         1hRQQwFf0n7R4UUqxtNNB0ZcmmthSEGqNcdxBotr9MEz0/5zSrZF41q6hbpAOt13UVY2
         8XDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=NC/IiINIzAqJ482YgmMRidXRKp2g3QaeBYINb/EGdEk=;
        b=G42loYz2NN54CSEHybwKUwz/6aB1Pzcr5Px65HSq9t4q/r9/P31hBbQDd/s//fncvl
         Hd/YAN+YlPg3hij7bDy98xIqPNpgSJ6QOhyN+/WSldrZVuXghdqfWEOzLUkTPGW3tweS
         oL5t163OMzx8vbOfuJ5zKL3UkVE6dOuhobuVOdH0xbEXIpa0QfhbWAyLpvDNFkaUv2Fp
         M0d3Nb7D2Hn8Zgfuh9VZc/GIoe3E0MAm6XA8utWqUY4iO/RH+0eZPRHV0JCJiBlOSSMd
         Y3J6OmM5imHAKS0+Fj1HZP/KzxjmchQtp7vKiVzKfM6J56Cdy2FheLjpchRQNqN+xAE6
         XwsA==
X-Gm-Message-State: ACrzQf0RnD50oYT1jv4iNpF0laKtJ6EXkCGQihX19oUGDaW4N6+KpOcA
	XLjeqKLNxI0c8ROLOzfIxsvRrA==
X-Google-Smtp-Source: 
 AMsMyM4bHuG6L5z13+b2P/0aaO1enPb9aXxTVcK7Qq3FSNytBPDnk9NL2d2iMQgbY/lCfctN2QD8lQ==
X-Received: by 2002:a05:6512:3295:b0:497:a156:795a with SMTP id
 p21-20020a056512329500b00497a156795amr4233965lfe.345.1663502309829;
        Sun, 18 Sep 2022 04:58:29 -0700 (PDT)
Received: from [192.168.118.20] (128-69-252-44.broadband.corbina.ru.
 [128.69.252.44])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a05651234cb00b004948b667d95sm4640108lfr.265.2022.09.18.04.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 04:58:29 -0700 (PDT)
Message-ID: <70c0e468-79e9-8e00-a27a-4990cffaf10a@linaro.org>
Date: Sun, 18 Sep 2022 14:58:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [RFC][PATCH 1/1] mesa: fix building OpenCL programs
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220917115642.766941-1-andrey.konovalov@linaro.org>
 <20220917115642.766941-2-andrey.konovalov@linaro.org>
 <19ed5421370187b39ce055f742d6134439eab87b.camel@linuxfoundation.org>
From: Andrey Konovalov <andrey.konovalov@linaro.org>
In-Reply-To: 
 <19ed5421370187b39ce055f742d6134439eab87b.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Sep 2022 11:58:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170846

On 9/17/22 16:57, Richard Purdie wrote:
> On Sat, 2022-09-17 at 14:56 +0300, Andrey Konovalov wrote:
>> When building an OpenCL program clover needs to locate opencl-c.h
>> include file. This include file location is passed via cpp args using
>> CLANG_RESOURCE_DIR macro. To set CLANG_RESOURCE_DIR value meson currently
>> uses "$(llvm-config --libdir)" which results in path to sysroot included
>> into CLANG_RESOURCE_DIR. Then clBuildProgram() fails with
>> "fatal error: 'opencl-c.h' file not found".
>>
>> Work this around by using '/usr/lib' instead of the libdir value
>> exported by LLVM.
>>
>> Microsoft/Intel CLC should suffer from the same issue, and the similar
>> workaround should work in this case too.
>>
>> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
>> ---
>>   ...-meson.CLANG_RESOURCE_DIR-workaround.patch | 42 +++++++++++++++++++
>>   meta/recipes-graphics/mesa/mesa.inc           |  1 +
>>   2 files changed, 43 insertions(+)
>>   create mode 100644 meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_DIR-workaround.patch
>>
>> diff --git a/meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_DIR-workaround.patch b/meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_DIR-workaround.patch
>> new file mode 100644
>> index 0000000000..db60fe407f
>> --- /dev/null
>> +++ b/meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_DIR-workaround.patch
>> @@ -0,0 +1,42 @@
>> +From: Andrey Konovalov <andrey.konovalov@linaro.org>
>> +Date: Fri, 16 Sep 2022 16:58:20 +0000
>> +Subject: [PATCH] CLANG_RESOURCE_DIR workaround
>> +
>> +Setting CLANG_RESOURCE_DIR to "$(llvm-config --libdir)something"
>> +results in clBuildProgram() error when an OpenCL program is being
>> +built on the target. The reason is that $(llvm-config --libdir) output
>> +includes path to the sysroot directory.
>> +
>> +Work this around by using '/usr/lib' instead of the libdir value
>> +exported by LLVM.
>> +
>> +Upstream-Status: Inappropriate
>> +Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
>> +
>> +---
>> +
>> +--- a/src/gallium/frontends/clover/meson.build	2022-09-16 10:24:55.910577158 +0000
>> ++++ b/src/gallium/frontends/clover/meson.build	2022-09-16 10:28:13.112804197 +0000
>> +@@ -71,8 +71,7 @@ libclllvm = static_library(
>> +     clover_opencl_cpp_args,
>> +     clover_spirv_cpp_args,
>> +     '-DCLANG_RESOURCE_DIR="@0@"'.format(join_paths(
>> +-      dep_llvm.get_variable(cmake : 'LLVM_LIBRARY_DIR', configtool: 'libdir'), 'clang',
>> +-      dep_llvm.version(), 'include',
>> ++      '/usr/lib', 'clang', dep_llvm.version(), 'include',
>> +     )),
>> +   ],
>> +   gnu_symbol_visibility : 'hidden',
>> +--- a/src/compiler/clc/meson.build	2022-09-16 16:40:10.641735401 +0000
>> ++++ b/src/compiler/clc/meson.build	2022-09-16 16:50:18.095700452 +0000
>> +@@ -39,7 +39,9 @@ files_libclc = files(
>> +   'clc_helpers.cpp',
>> + )
>> +
>> +-_libclc_cpp_args = ['-DCLANG_RESOURCE_DIR="@0@"'.format(clang_resource_dir)]
>> ++_libclc_cpp_args = ['-DCLANG_RESOURCE_DIR="@0@"'.format(join_paths(
>> ++                       '/usr/lib', 'clang', dep_llvm.version(), 'include'
>> ++                    ))]
>> + if with_microsoft_clc
>> +   _libclc_cpp_args += ['-DUSE_STATIC_OPENCL_C_H=1']
>> + endif
> 
> libdir might not be /usr/lib so this isn't always going to be
> correct...

I see. Will look for a better option then just hardcoded '/usr/lib' then.

Thanks,
Andrey

> Cheers,
> 
> Richard

