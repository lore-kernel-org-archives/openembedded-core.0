Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.170.1614185401054655134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 08:50:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NkmxoZ8y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id o16so2445673wmh.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 08:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=sQ06MuzsZdJBzAwxGwIny7FsSqoOiLoSbGkWVPuhOpU=;
        b=NkmxoZ8y113O/3oBOpjEL1YK1wGGHBxBpbP3rmZI0feW29jxbxcX24lQy1RA1iV07D
         Y+H281HibC05RneCiWQr6BpRGIYizJXzPnLf98BAas/H0FyYwzKK3GaKwo3QDtGzBLCu
         ApWUtGcECfEK+fhU/euxuEhpjZ7vjLYAdPnnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sQ06MuzsZdJBzAwxGwIny7FsSqoOiLoSbGkWVPuhOpU=;
        b=PoYgFpnJZ4Gqhs4dvQ1KmZTGvrQ9adwz6dajAIFw7eGmsU1QJQcWdylqTi2KNHzDKU
         hGu3ZRGqE4NAT1UvS2wMgosGoRyCIAmyDohWZpYMrVlZpad9NzSNVBxy3Y4WWUjMNkCY
         ry2gLYaPYEB9QFz8upMZzufqskzQOONScgA7iqoavunUrCPgZ/AN8aS7/Z67/Z1KMiXh
         v0yi5J8FrSdJlWp5c0pAeZmJf8mgEcdYE86H9pJWO4O1IOVikCD/EsG42xpvCle4tuDX
         flViMjGUpTGbNy4yf/nK59D7IaKQRj51ASOenA6p6igKn1SgnVX+w+rRt1ypeWgLqY89
         2K4g==
X-Gm-Message-State: AOAM533W+eb5zMzoEP3fpyPMeBJKC8xxUiDnXQ2sQ8mtBDMlFvVn0VDa
	pLHFqoQ6Zr1Bi9OoT79IL0vgTg==
X-Google-Smtp-Source: ABdhPJxaxwOiDtK8NzcLVFHp3u8Lcr0acZVsCWIsXrFDG4WpxWV0cXSTo4IL+mTYjFmBu0+YxS4mzA==
X-Received: by 2002:a7b:c304:: with SMTP id k4mr4505420wmj.11.1614185399451;
        Wed, 24 Feb 2021 08:49:59 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4476:47d0:b128:f21a? ([2001:8b0:aba:5f3c:4476:47d0:b128:f21a])
        by smtp.gmail.com with ESMTPSA id j16sm4553857wra.17.2021.02.24.08.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 08:49:59 -0800 (PST)
Message-ID: <e4561a7e8c89fe26dd593b0412e16be67665baff.camel@linuxfoundation.org>
Subject: Re: [OE-core] Current native SDK glibc compat
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Anatol Belski <anbelski@linux.microsoft.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Cc: randy.macleod@windriver.com
Date: Wed, 24 Feb 2021 16:49:56 +0000
In-Reply-To: <9a8cb006-e161-b402-d496-72a1c983e90a@linux.microsoft.com>
References: <4ec292a9-3723-34f2-51a5-01dd6652f651@linux.microsoft.com>
	 <1a309c4181d7de1b38497b4db6f4e1d664f18398.camel@linuxfoundation.org>
	 <9a8cb006-e161-b402-d496-72a1c983e90a@linux.microsoft.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-02-24 at 13:56 +0100, Anatol Belski wrote:
> On 2/24/2021 1:32 PM, Richard Purdie wrote:
> > Hi,
> > 
> > On Wed, 2021-02-24 at 12:40 +0100, Anatol Belski wrote:
> > > the current master build seems to be broken with symbols unavailable
> > > from the host glibc. The following is to see on the SDK built and
> > > installed on the same host Ubuntu 18.04.5 having glibc 2.27:
> > > 
> > > $ . /tmp/poky-sdk-master-00/environment-setup-core2-64-poky-linux
> > > 
> > > $ ldd $(which $CC)
> > > /tmp/poky-sdk-master-00/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc:
> > > /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found
> > We change the loader path inside our SDK binaries so you can't trust the
> > output from ldd, it will find a different result to what you'd see
> > when you run the binary.
> > 
> > What issue are you seeing trying to run these?
> 
> Initially it was sighted here appearing when a binary is actually invoked:
> 
> https://github.com/meta-rust/meta-rust/pull/313#issuecomment-782784056
> 
> I went digging to see similar cases.
> 
> 
> Regarding the loader path, are you referring to this?
> 
> $ chrpath $(which $CC)
> /tmp/poky-sdk-master-00/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc: 
> RPATH=$ORIGIN/../../lib

No, I mean the dynamic loader pointer.

$ tmp/sysroots-uninative/x86_64-linux/usr/bin/patchelf-uninative python3-native/python3.9 --print-interpreter
[...]tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2

Above I'm showing that a native binary in the build (python3-native)
has the interpreter (dynamic loader) set to our uninative ld.so.
The SDK is similar.

> As the binary where the issue was sighted has this
> 
> $ chrpath $(which cargo)
> /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/cargo: 
> RUNPATH=$ORIGIN/../lib
> 
> 
> but then, the DSOs have no rpath set, eg.
> 
> $ chrpath 
> /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/../lib/libcrypto.so.1.1
> /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/../lib/libcrypto.so.1.1: 
> no rpath or runpath tag found.
> 
> 
> so it might lead to the interferrence with the host. Does it perhaps 
> need both $ORIGIN/../../lib and $ORIGIN/../lib if binaries are in /usr ?

Our dynamic loader knows how to use the specific sysroot and then 
fall back to /usr and /lib.

Cheers,

Richard


