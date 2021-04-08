Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.20.1617903331599739846
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 10:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IHv7V36S;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so1781042pjg.5
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Apr 2021 10:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FdSaj/3l1DWrd6mQ9OpsV53OJOqggNOElC9OyBawyyU=;
        b=IHv7V36SEU0DhuqxVyjqnczEJQlOuSkyOdxthpLn4jSJ33akXq/9Yt0vqjHriEvtWl
         9HFGZpGnWmYD2orriimvN75PoTdPbgOWmu5XdnD4dHTSzBt0blC7sNkC+3Z+DDcRj6nZ
         y1qyj/yVEegyAe3IBkoOyeSsV1M5sVx6MmkY1VcoA/rv9H5vXQ/yyv31l08TKd3Kd/id
         9gM+m5S6mDnVzj+iHm6yoZMgWXKv3ErS3/S9bbi/nXxHSPjc9ebJyC+qpxnJI/CF2lhE
         eOWGzzOx6OeL3KIdoLZo+tSE8Lj4ZxsWcKtmHAp66KKVG26o91S0Q1t84Rpw5+VqLujd
         SFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=FdSaj/3l1DWrd6mQ9OpsV53OJOqggNOElC9OyBawyyU=;
        b=lt6ldS2fLHKfZQFqDsAdBzCPKDhcXgWq32JcNeyoCHb+UszncoiPoz91T/24h/RFae
         w7G4mOgzLBDEXHy/uR52ZktlD5jwJcP6KuIYEIJ8QW5rGOgwZ6+36ORKemJKfNUEOzki
         f0K/CmBcBPJFIuxCjqX6rvu9ogE3h6of5GcokySekksT0/XQiuDCQyLsFLx4ZhDM5AMa
         oSR39ShUFkccF3bIFWMxe0TxXyaOcUC3ZwyaOxs2A6TvMKvBs5FD1oUgOPpWfXPCFF+h
         o5kW6lkkfZgpexvl5RJp+F5+btUzQPku0YAV7VYCbsitgNRSSa1epJhFt8t8kDy0uhzj
         C05A==
X-Gm-Message-State: AOAM532PnJ1Zg7R6DmH5sj8rRjmYPzaiwEOxQZETiiWOyj85Tas1RkSV
	285661DoTy7zgJvzvG8Fszk=
X-Google-Smtp-Source: ABdhPJz65c+LuSDt3OsPdJomVdxiCFiXNUH+JLBzLJH+4/BgHceBR65wzsgacT2ByRSkrwdBWvMZZg==
X-Received: by 2002:a17:902:9043:b029:e9:3900:5590 with SMTP id w3-20020a1709029043b02900e939005590mr8898173plz.76.1617903331097;
        Thu, 08 Apr 2021 10:35:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:8584:8dcf:4365:ddcb? ([2601:646:9200:a0f0:8584:8dcf:4365:ddcb])
        by smtp.gmail.com with ESMTPSA id w3sm68811pjg.7.2021.04.08.10.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 10:35:30 -0700 (PDT)
Subject: Re: [OE-core] [gatesgarth][PATCH] binutils: backport fix for gold with theads enabled from 2.36.0
To: Martin Jansa <Martin.Jansa@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: anibal.limon@linaro.org
References: <20210408160138.240195-1-Martin.Jansa@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <813ff0f0-cc8a-cbbe-b8b3-2ed8717ecce8@gmail.com>
Date: Thu, 8 Apr 2021 10:35:29 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408160138.240195-1-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 4/8/21 9:01 AM, Martin Jansa wrote:
> * building chromium with gold and threads triggers this issue:
>    [1/2] SOLINK ./libcbe.so
>    FAILED: libcbe.so libcbe.so.TOC
>    python "../../git/src/build/toolchain/gcc_solink_wrapper.py" --readelf="readelf" --nm="nm" --sofile="./libcbe.so" --tocfile="./libcbe.so.TOC" --output="./libcbe.so" -- i686-oe-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=chromium/84.0.4147.89-4-r41.1/recipe-sysroot -shared -Wl,-soname="libcbe.so" -fPIC -Wl,-z,noexecstack -Wl,-z,relro -Wl,-z,now -Wl,-z,defs -Wl,--as-needed -fuse-ld=gold -Wl,--threads -Wl,--thread-count=4 -m32 -Wl,-O2 -Wl,--gc-sections -rdynamic --sysroot=../../recipe-sysroot -L../../recipe-sysroot/lib -L../../recipe-sysroot/usr/lib -Lchromium/84.0.4147.89-4-r41.1/recipe-sysroot -o "./libcbe.so" @"./libcbe.so.rsp"
>    collect2: fatal error: ld terminated with signal 11 [Segmentation fault]
>    compilation terminated.
> 
> * removing threads/thread-count is one possible work around, but then
>    the use of gold for performance makes even less sense, that's why
>    chromium from meta-browser uses LLD by default:
>    https://github.com/OSSystems/meta-browser/commit/15228b01903d4ca801916e55c7618fa5a71019b7
>    https://lld.llvm.org/#performance
>    but lets backport this as other recipes might also reproduce this
>    issue
> 


lgtm
