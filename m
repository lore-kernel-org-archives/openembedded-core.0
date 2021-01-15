Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.786.1610748920981991122
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 14:15:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bfrt/b29;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id 7so3508681wrz.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 14:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=CvyHYcl7/AeP6m1QybMi0t+qAP8pjUN+J/NRwcYJhSM=;
        b=bfrt/b29jABMm414EOTJPUTBTHSK0dII22MxqkHzOaSpyLR/uRael1wKZH7v+cJaNn
         VR1WJtkXFPLPoaXn0RpWfllA4N7R9bhslGyKgdqhv3OsfXa7ZQQEj7v0eHITUxUrQl6Y
         P/tHB1jTC50CjVCGXIT0h1alURXbrjuIoao5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=CvyHYcl7/AeP6m1QybMi0t+qAP8pjUN+J/NRwcYJhSM=;
        b=OwHm3TOAzjRExXf3LiiHikldjFdCvr0zX8rJS/ZvXcJJcrFTJQ6GTqSwQex9ryNfB3
         X+pzgE+F6N5mY0T4/iGhBFwZFd9/+eW0lHWn9soAiSs8EN42sns44x3U+lGfJK7/FrP0
         Uslm6ZoCufDpuZB1lLI/Fwb4XE3J3i9gD7PTRidWYCEXEal5bOlY9+dIBr5GkTYg1vbr
         noOnyRlL6TCwo0LR8Kvn3cnp6YT69Zgrn9g81PuFr6wNWA8TW3OlTqnFoBd4unUD2T1i
         fiMmMqEanXPbmMx+RP64NTnsfZxkFwt2XRN5OvxxBHDLji7WaOdD49G32jUPIU37Z/h2
         HTew==
X-Gm-Message-State: AOAM532GbCPrTHkqiXGx6RZey2QChj728s90sB+21VAmxuvP6clNcSH2
	yrBrGY/0olgyQi81SkNoXoLbxklpLaHAWg==
X-Google-Smtp-Source: ABdhPJzHujBLU1KYt9AJYbdXV9AOTAHSsGeZgtN5FN3wO8oApjpqERz1gfCtIO8IQRA+EJ7+HusVvg==
X-Received: by 2002:a5d:6607:: with SMTP id n7mr14745463wru.206.1610748919649;
        Fri, 15 Jan 2021 14:15:19 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:b202:f78f:5317:247f? ([2001:8b0:aba:5f3c:b202:f78f:5317:247f])
        by smtp.gmail.com with ESMTPSA id j2sm16725271wrh.78.2021.01.15.14.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 14:15:19 -0800 (PST)
Message-ID: <4221b98b05e228a26d42acd2dc1db9e992e3b41b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] dpkg: add nativesdk support
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: hongxu <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Jan 2021 22:15:18 +0000
In-Reply-To: <20210115094536.18651-1-hongxu.jia@windriver.com>
References: <20210115094536.18651-1-hongxu.jia@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-01-15 at 17:45 +0800, hongxu wrote:
> - Add nativesdk support and override EXTRA_OECONF and PROV for
> nativesdk
> 
> - Replace ${bindir} with ${STAGING_BINDIR_NATIVE} for perl-native
> shebang to fix QA error of shebang too long in nativesdk build
> 
> - Add ldconfig to runtime depends to fix the following issue on target
> [snip]
> ...
> dpkg: warning: 'ldconfig' not found in PATH or not executable
> dpkg: error: 1 expected program not found in PATH or not executable
> Note: root's PATH should usually contain /usr/local/sbin, /usr/sbin and/sbin
> E: Sub-process /usr/bin/dpkg returned an error code (2)
> [snip]
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-devtools/dpkg/dpkg.inc | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Seems to break poky-tiny:

https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/3209

(ldconfig may not be available with musl?)

Cheers,

Richard

