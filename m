Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.6053.1618067612364768811
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Apr 2021 08:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JfOHhjIy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id f6so8453178wrv.12
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Apr 2021 08:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5g3g5crMgYd0ghWAVXrgdjuvsRS8rkxEWjkjUagoW68=;
        b=JfOHhjIynkb2CojvsH9eWwLJ8IUezv+0XLvfSBKYtTgji7UkxKM7A62TAgrjofJsF/
         3ykf5qLui6Wf4YI6sTqexF8S5npbHCts56IgrWbkWeJztWVawD4niPdHAdCJy15ekOAI
         MZua/zNy5ZBW6XXniw6vhWTEWK7Ex2rTVNOao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5g3g5crMgYd0ghWAVXrgdjuvsRS8rkxEWjkjUagoW68=;
        b=kqjFaGII05eYYCnQ6l9e2yu7n0aKrcFm6UVhcn1PbOQBBsU2KXxKwP4kpWWj6qE2un
         v+xB7olz5SCayf5xae9fwIxIHq0rT9CIEBEfv9wJysUyMpuL1JC6HvE4oRJOevuAisTH
         4Zg06lrwCsrEd2JoRdmX0nvmZJnnSkLZ4TNgIoFIUmnZhpyoM0N9QpQLQp1afQtbCCVA
         y2P+gWyRDhXihJaUtEqMYgmgiB9vXnWtAhIyUVLeJ/7AR+B6Qz4Xq3n0BeUtlhF2SqVu
         W/ytD8dEpKoBkrqzxFMXHXqGm6zEjmH3fX8jXVTt/vt97O36vA2EsfXHCMf9vm+mSvKn
         XOXw==
X-Gm-Message-State: AOAM531PdzFTFrcf9d/811PRUdTyjaTfuO1jh4WHYqFzsBljsP4U/Nev
	DbHNv4uQmq06Ql5YYL+IYlEOyg==
X-Google-Smtp-Source: ABdhPJy5SUdkKWCsXFJeqBRiB8O5R3zZGgx/KT7AtlvVvzNXxL+HTXHNjE/B1T0hYjx/mBWIo2CGMQ==
X-Received: by 2002:a5d:6881:: with SMTP id h1mr14829008wru.121.1618067610738;
        Sat, 10 Apr 2021 08:13:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1641:3d0e:e5d8:19a4? ([2001:8b0:aba:5f3c:1641:3d0e:e5d8:19a4])
        by smtp.gmail.com with ESMTPSA id d2sm9092236wrs.10.2021.04.10.08.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 08:13:30 -0700 (PDT)
Message-ID: <e0ae7b52770cea4b073f0e5d108af408781066cf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFT][PATCH 0/2] GCC 11 Pre-release
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <randy.macleod@windriver.com>, Joshua Watt
	 <JPEWhacker@gmail.com>
Date: Sat, 10 Apr 2021 16:13:26 +0100
In-Reply-To: <20210330213019.2300696-1-raj.khem@gmail.com>
References: <20210330213019.2300696-1-raj.khem@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-03-30 at 14:30 -0700, Khem Raj wrote:
> This patchset updates to upcoming gcc 11 release, Please give it a try
> in your test beds if you have cycles, since there is still sometime left
> for final GCC 11 release perhaps we can squeeze in some bugfixes
> 
> They are also available via git here
> https://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-11

I ran this through with the gnutls fix you found. There appear to be 
reproducubility issues in gcc:

https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/159/steps/12/logs/stdio

An issue with meta-mingw:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/3296

Missing maintainers entry:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2004

valgrind ptest regressions on x86 and arm (even with the valgrind upgrade):

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/1688/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/1976/steps/12/logs/stdio

Cheers,

Richard

